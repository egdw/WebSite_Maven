package com.website.model;

import com.website.utils.InitUtils;

import java.io.File;

/**
 * Created by hdy on 2017/9/1.
 * 用于初始化数据的管理
 */
public class InitModel {
    private InitUtils utils = new InitUtils(this.getClass().getClassLoader().getResource("").getPath());
    private String blog_register_needcheck;

    private String blog_register_close;


    public InitModel(String blog_register_needcheck, String blog_register_close) {
        this.blog_register_needcheck = blog_register_needcheck;
        this.blog_register_close = blog_register_close;
        System.out.println(this.getClass().getClassLoader().getResource("").getPath());
    }

    public String getBlog_register_needcheck() {
        return blog_register_needcheck;
    }

    public void setBlog_register_needcheck(String blog_register_needcheck) {
        this.blog_register_needcheck = blog_register_needcheck;
        utils.set("blog.register.needcheck", blog_register_needcheck);
    }

    public String getBlog_register_close() {
        return blog_register_close;
    }

    public void setBlog_register_close(String blog_register_close) {
        this.blog_register_close = blog_register_close;
        utils.set("blog.register.close", blog_register_close);
    }

    @Override
    public String toString() {
        return "InitModel{" +
                "blog_register_needcheck='" + blog_register_needcheck + '\'' +
                ", blog_register_close='" + blog_register_close + '\'' +
                '}';
    }

}
