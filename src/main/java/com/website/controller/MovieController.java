package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.model.*;
import com.website.utils.MovieUtils;
import com.website.utils.ParseUtils;
import com.website.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import java.util.*;

/**
 * Created by hdy on 17-8-23.
 * 电影控制器
 */
@RestController
@RequestMapping(value = "movie")
public class MovieController {

    @Autowired
    private JedisPool jedisPool;


    @RequestMapping(method = RequestMethod.GET)
    public String getIndex() {
        RedisUtils list = new RedisUtils(jedisPool.getResource(), "indexTypeAndInfo");
        if (list.exist()) {
            return list.get(true);
        } else {
            Movie info = MovieUtils.getIndexTypeAndInfo();
            Map<MovieType, ArrayList<MovieTop>> map = info.getMap();
            if (map == null || map.isEmpty()) {
                list.close();
                return null;
            }
            String json = JSON.toJSONString(map.entrySet());
            list.setAndExpire(json, 60 * 60 * 24, true);
            return json;
        }
    }


    @RequestMapping(value = "getType", method = RequestMethod.GET)
    public String getType() {
        RedisUtils list = new RedisUtils(jedisPool.getResource(), "movieTypeList");
        if (list.exist()) {
            return list.get(true);
        } else {
            Map<String, String> map = ParseUtils.getType();
            if (map == null || map.isEmpty()) {
                //说明获取的数据有问题
                return null;
            } else {
                String param = JSON.toJSONString(map.entrySet());
                RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movieTypeList2");
                utils.setAndExpire(JSON.toJSONString(map), 60 * 60 * 24, true);
                //设置一天的缓存
                list.setAndExpire(param, 60 * 60 * 24, true);
                return param;
            }
        }
    }

    /**
     * 获取详细的电影信息信息
     *
     * @param url 电影信息
     */
    @RequestMapping(value = "deatil", method = RequestMethod.GET)
    public String getDetail(@RequestParam(required = true) String url) {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movie_detail_" + url);
        if (utils.exist()) {
            return utils.get(true);
        } else {
            MovieDetail detail = MovieUtils.detail(url);
            System.out.println(detail);
            if (detail == null) {
                utils.close();
                return null;
            } else {
                String details = JSON.toJSONString(detail);
                //设置缓存时间为一个月,因为是不常更新的数据.时间长一点没有关系
                utils.setAndExpire(details, 60 * 60 * 24 * 30, true);
                return details;
            }
        }
    }


    @RequestMapping(value = "recommend", method = RequestMethod.GET)
    public String getRecommend() {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movie_recommend");
        if (utils.exist()) {
            return utils.get(true);
        } else {
            Movie movie = MovieUtils.getIndexOthers();
            if (movie != null) {
                String s = JSON.toJSONString(movie);
                utils.setAndExpire(s, 60 * 60 * 24, true);
                return s;
            }
            return null;
        }

    }

//    @RequestMapping(value = "type", method = RequestMethod.GET)
//    public void typePageChange() {
//
//    }

    /**
     * 单个分类查询
     */
    @RequestMapping(value = "type", method = RequestMethod.GET)
    public String getTypeByNameAndUrl(@RequestParam(required = true) String title, Integer page) {
        if (page == null || page <= 0) {
            page = 1;
        }
        RedisUtils movieTypeList2 = new RedisUtils(jedisPool.getResource(), "movieTypeList2");
        if (!movieTypeList2.exist()) {
            getType();
        }
        Map<String, String> map2 = JSON.parseObject(movieTypeList2.get(true), Map.class);
        String url = map2.get(title);
        if (url == null) {
            return null;
        }
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movie_type_" + title + "_" + url + "_" + page);
        if (utils.exist()) {
            return utils.get(true);
        } else {
            Object[] detail = MovieUtils.getTypeDetail(title, url);
            MovieSearch o = (MovieSearch) detail[2];
            if (page != 1) {
                o = o.changePage(page);
            }
            utils.setAndExpire(JSON.toJSONString(o), 60 * 60 * 48, true);
            return JSON.toJSONString(o);
        }
    }


    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam(required = true) String name, Integer page) {
        if (page == null || page <= 0) {
            page = 1;
        }
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movie_search_" + name + "_" + page);
        MovieSearch search = null;
        if (utils.exist()) {
            return utils.get(true);
        } else {
            search = MovieUtils.search(name);
            if (page != 1) {
                search = search.changePage(page);
            }
            String s = JSON.toJSONString(search);
            //一般搜索的内容更新的速度也是很慢的
            utils.setAndExpire(s, 60 * 60 * 12 * 5, true);
            return s;
        }
    }

}
