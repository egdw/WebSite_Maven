package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.utils.InternetUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by hdy on 17-8-10.
 * 用于文章的获取
 */
@RestController
@RequestMapping("/pageController")
public class PageController {


    /**
     * 通过传入知乎id返回相应的数据
     *
     * @param id
     */
    @RequestMapping("getZhihuPageById")
    public String getZhihuPageById(@RequestParam(required = true) Long id) {
        String get = InternetUtil.get("https://news-at.zhihu.com/api/4/news/" + id);
        System.out.println(get);
        return get;
    }

    /**
     * 获取过往的新闻
     *
     * @return
     */
    @RequestMapping("getOldNews")
    public String getOldNews(@RequestParam(required = true) String date) {
        String get = InternetUtil.get("https://news-at.zhihu.com/api/4/news/before/" + date.replaceAll("-", ""));
        return get;
    }


    /**
     * 获取知乎的最新新闻
     *
     * @return
     */
    @RequestMapping("getZhihuLastedNews")
    public String getZhihuLastedNews() {
        String s = InternetUtil.get("https://news-at.zhihu.com/api/4/news/latest");
        return s;
    }

    /**
     * 获取知乎最热的新闻
     *
     * @return
     */
    @RequestMapping("getZhihuHotNews")
    public String getZhihuHotNews() {
        String s = InternetUtil.get("https://news-at.zhihu.com/api/3/news/hot");
        return s;
    }

    /**
     * 获取知乎文章长评论
     *
     * @param id
     * @return
     */
    @RequestMapping("getZhihuLongComments")
    public String getZhihuLongComments(@RequestParam(required = true) Long id) {
        String s = InternetUtil.get("https://news-at.zhihu.com/api/4/story/" + id + "/long-comments");
        return s;
    }

    /**
     * 获取知乎文章短评论
     *
     * @param id
     * @return
     */
    @RequestMapping("getZhihuShortComments")
    public String getZhihuShortComments(@RequestParam(required = true) Long id) {
        String s = InternetUtil.get("https://news-at.zhihu.com/api/4/story/" + id + "/short-comments");
        return s;
    }

}
