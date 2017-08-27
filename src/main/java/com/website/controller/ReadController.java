package com.website.controller;

import com.website.utils.InternetUtil;
import com.website.utils.NetworkUtils;
import com.website.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import javax.rmi.CORBA.Util;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * Created by hdy on 2017/8/27.
 * 阅读控制器
 */
@RestController
@RequestMapping("readController")
public class ReadController {
    @Autowired
    private JedisPool jedisPool;

    @RequestMapping("/data/{page_type}/{num}/{page}")
    private String getData(@PathVariable("page_type") String page_type, @PathVariable("num") Integer num, @PathVariable("page") String page) {
        if (num == null) {
            num = 100;
        }
        String get = null;
        try {
            RedisUtils utils = new RedisUtils(jedisPool.getResource(), "readController_data_" + num + "_" + URLEncoder.encode(page_type, "utf-8") + "_" + page);
            if (utils.exist()) {
                return utils.get(true);
            } else {
                get = InternetUtil.get("http://gank.io/api/data/" + URLEncoder.encode(page_type, "utf-8") + "/" + num + "/" + page);
                utils.setAndExpire(get, 60 * 60 * 24, true);
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return get;
    }


    @RequestMapping("/query/{searchValue}/category/{searchType}/count/10/page/{page}")
    private String query(@PathVariable("searchValue") String searchValue, @PathVariable("searchType") String searchType, @PathVariable("page") String page) {
        try {
            RedisUtils utils = new RedisUtils(jedisPool.getResource(), "readController_query_" + URLEncoder.encode(searchValue, "utf-8") + "_" + URLEncoder.encode(searchType, "utf-8") + "_" + page);
            if (utils.exist()) {
                return utils.get(true);
            } else {
                String get = InternetUtil.get("http://gank.io/api/search/query/" + URLEncoder.encode(searchValue, "utf-8") + "/category/" + URLEncoder.encode(searchType, "utf-8") + "/count/10/page/" + page);
                utils.setAndExpire(get, 60 * 60 * 24, true);
                return get;
            }
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return null;
    }


    @RequestMapping("/history")
    private String history() {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "readController_history");
        if (utils.exist()) {
            return utils.get(true);
        } else {
            String get = InternetUtil.get("http://gank.io/api/day/history");
            utils.setAndExpire(get, 60 * 60 * 24, true);
            return get;
        }
    }

    @RequestMapping("/day/{year}/{mouth}/{day}")
    private String historyDate(@PathVariable("year") String year, @PathVariable("mouth") String mouth, @PathVariable("day") String day) {
        if (year == null || mouth == null || day == null) {
            return null;
        }
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "readController_history_date_" + year + "_" + mouth + "_" + day);
        if (utils.exist()) {
            return utils.get(true);
        } else {
            String get = InternetUtil.get("http://gank.io/api/history/content/day/" + year + "/" + mouth + "/" + day);
            utils.setAndExpire(get, 60 * 60 * 240, true);
            return get;
        }
    }
}
