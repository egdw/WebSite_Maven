package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.WebsiteAlbum;
import com.website.entites.WebsiteFunny;
import com.website.entites.WebsiteTemp;
import com.website.service.WebSiteAlbumService;
import com.website.service.WebSiteFunnyService;
import com.website.service.WebSiteTempService;
import com.website.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
import java.util.Map;

/**
 * 控制视图跳转的控制器
 *
 * @author hdy
 */
@Controller
public class ViewController {
    @Autowired
    private WebSiteFunnyService funnyService;
    @Autowired
    private WebSiteTempService tempService;
    @Autowired
    private WebSiteAlbumService albumService;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 进入趣味网站主页
     */
    @RequestMapping(value = "funnyView.do")
    public String funnyView(Map<String, Object> map) {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "projects");
        ArrayList<WebsiteFunny> list = null;
        if (utils.exist()) {
            list = (ArrayList<WebsiteFunny>) JSON.parseArray(utils.get(), WebsiteFunny.class);
            utils.close();
        } else {
            list = funnyService.getAll();
            utils.setAndExpire(JSON.toJSONString(list), 60 * 15, true);
        }
        map.put("projects", list);
        return "/project/funny_list";
    }

    /**
     * 进入临时网站主页
     */
    @RequestMapping(value = "tempView.do")
    public String tempView(Map<String, Object> map) {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "temps");
        ArrayList<WebsiteTemp> list = null;
        if (utils.exist()) {
            list = (ArrayList<WebsiteTemp>) JSON.parseArray(utils.get(), WebsiteTemp.class);
            utils.close();
        } else {
            list = tempService.getAll();
            utils.setAndExpire(JSON.toJSONString(list), 60 * 15, true);
        }
        map.put("projects", list);
        return "/project/temp_list";
    }

    /**
     * 进入音乐
     *
     * @return
     */
    @RequestMapping("music")
    public String music() {
        return "/music/index";
    }

    /**
     * 进入博客的照片
     */
    @RequestMapping("image")
    public String entryBlogImage(Map<String, Object> map) {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "images");
        ArrayList<WebsiteAlbum> list = null;
        if (utils.exist()) {
            list = (ArrayList<WebsiteAlbum>) JSON.parseArray(utils.get(), WebsiteAlbum.class);
            utils.close();
        } else {
            list = albumService.getAll();
            utils.setAndExpire(JSON.toJSONString(list), 60 * 15, true);
        }
        map.put("list", list);
        return "/blog/blog_album";
    }


    @RequestMapping("news")
    public String entryNews() {
        return "/blog/blog_news";
    }
}
