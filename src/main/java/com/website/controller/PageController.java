package com.website.controller;

import com.website.utils.InternetUtil;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
     * @return
     */
    @RequestMapping("getZhihuHotNews")
    public String getZhihuHotNews(){
        String s = InternetUtil.get("https://news-at.zhihu.com/api/3/news/hot");
        return s;
    }
}
