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

import java.util.ArrayList;
import java.util.Map;

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
                return null;
            }
            String json = JSON.toJSONString(map);
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
                String param = JSON.toJSONString(map);
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
            if (detail == null) {
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

    @RequestMapping(value = "type", method = RequestMethod.GET)
    public void typePageChange() {

    }

    /**
     * 单个分类查询
     */
    @RequestMapping(value = "type", method = RequestMethod.GET)
    public String getTypeByNameAndUrl(@RequestParam(required = true) String title, @RequestParam(required = true) String url) {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movie_type_" + title + "_" + url);
        if (utils.exist()) {
            return utils.get(true);
        } else {
            Object[] detail = MovieUtils.getTypeDetail(title, url);
            Movie o2 = (Movie) detail[0];
            MovieDetail o1 = (MovieDetail) detail[1];
            MovieSearch o = (MovieSearch) detail[2];
            if (o2 != null) {
                utils.setAndExpire(JSON.toJSONString(o2), 60 * 60 * 48, true);
                return JSON.toJSONString(o2);
            } else if (o1 != null) {
                utils.setAndExpire(JSON.toJSONString(o1), 60 * 60 * 48, true);
                return JSON.toJSONString(o1);
            } else {
                utils.setAndExpire(JSON.toJSONString(o), 60 * 60 * 48, true);
                return JSON.toJSONString(o);
            }
        }
    }


    @RequestMapping(value = "search", method = RequestMethod.GET)
    public String search(@RequestParam(required = true) String name) {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "movie_search_" + name);
        if (utils.exist()) {
            return utils.get(true);
        } else {
            MovieSearch search = MovieUtils.search(name);
            String s = JSON.toJSONString(search);
            //一般搜索的内容更新的速度也是很慢的
            utils.setAndExpire(s, 60 * 60 * 12 * 5, true);
            return s;
        }
    }

}
