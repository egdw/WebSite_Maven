package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.*;
import com.website.service.*;
import com.website.utils.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import redis.clients.jedis.JedisPool;

import java.util.ArrayList;
import java.util.Map;

/**
 * 控制视图跳转的控制器
 *
 * @author hdy
 */
@Controller
@RequestMapping("/")
public class ViewController {
    @Autowired
    private WebSiteFunnyService funnyService;
    @Autowired
    private WebSiteTempService tempService;
    @Autowired
    private WebSiteAlbumService albumService;
    @Autowired
    private JedisPool jedisPool;

    @Autowired
    private WebSiteBlogService service;
    @Autowired
    private WebSiteCommentService commentService;

    @Autowired

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


    @RequestMapping(method = RequestMethod.GET)
    public String index(@RequestParam(required = false) Integer pageNum,
                        Map<String, Object> map) {
        if (pageNum == null) {
            pageNum = 0;
        }
        RedisUtils redisUtils = new RedisUtils(jedisPool.getResource(), "index_page_list:" + pageNum);
        //获取首页的文章
        ArrayList<WebsiteBlog> list = null;
        if (redisUtils.exist()) {
            list = (ArrayList<WebsiteBlog>) JSON.parseArray(redisUtils.get(), WebsiteBlog.class);
        } else {
            list = service.selectBlogByNum(pageNum, null);
            redisUtils.setAndExpire(JSON.toJSONString(list), 60 * 60, false);
        }


        Integer pageCount = service.getPageNum(null);
        // 从数据库中获取最新的前五张图片
        ArrayList<WebsiteAlbum> albumbyPage = null;
        redisUtils.setKey("albumbyPage");
        if (redisUtils.exist()) {
            albumbyPage = (ArrayList<WebsiteAlbum>) JSON.parseArray(redisUtils.get(), WebsiteAlbum.class);
        } else {
            albumbyPage = albumService.selectAlbumbyPage(0,
                    10);
            redisUtils.setAndExpire(JSON.toJSONString(albumbyPage), 60 * 60, false);
        }


        //从数据库获取评论
        ArrayList<WebsiteComment> comments = null;
        redisUtils.setKey("index_comments");
        if (redisUtils.exist()) {
            comments = (ArrayList<WebsiteComment>) JSON.parseArray(redisUtils.get(), WebsiteComment.class);
        } else {
            comments = commentService.getCommentByNum(5);
            redisUtils.setAndExpire(JSON.toJSONString(comments), 60 * 60, false);
        }

        //从数据库获取评论数最高的文章
        ArrayList<WebsiteBlog> selectBlogByNumAndComment = null;
        redisUtils.setKey("index_blog_top_comment");
        if (redisUtils.exist()) {
            selectBlogByNumAndComment = (ArrayList<WebsiteBlog>) JSON.parseArray(redisUtils.get(), WebsiteBlog.class);
        } else {
            selectBlogByNumAndComment = service
                    .selectBlogByNumAndComment(10);
            redisUtils.setAndExpire(JSON.toJSONString(selectBlogByNumAndComment), 60 * 60, false);
        }

        //从数据库获取阅读数最高的文章
        ArrayList<WebsiteBlog> selectBlogByNumAndReader = null;
        redisUtils.setKey("index_blog_top_reader");
        if (redisUtils.exist()) {
            selectBlogByNumAndReader = (ArrayList<WebsiteBlog>) JSON.parseArray(redisUtils.get(), WebsiteBlog.class);
            redisUtils.close();
        } else {
            selectBlogByNumAndReader = service
                    .selectBlogByNumAndReader(10);
            redisUtils.set(JSON.toJSONString(selectBlogByNumAndReader), true);
        }

        map.put("list", list);
        map.put("pageCount", pageCount);
        map.put("currentPage", pageNum);
        map.put("comments", comments);
        map.put("topComments", selectBlogByNumAndComment);
        map.put("topReader", selectBlogByNumAndReader);
        map.put("images", albumbyPage);
        return "/blog/blog_index";
    }
}
