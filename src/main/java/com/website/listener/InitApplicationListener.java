package com.website.listener;

import com.website.utils.InitUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import java.io.*;
import java.lang.reflect.Field;
import java.util.*;

/**
 * Created by hdy on 2017/8/29.
 * 用于从配置文件中获取相应的数据存放在application当中.
 */
public class InitApplicationListener implements ServletContextListener {
    private Logger logger = LoggerFactory.getLogger(InitApplicationListener.class);

    /**
     * application初始化
     *
     * @param sce
     */
    public void contextInitialized(ServletContextEvent sce) {
//        logger.warn("application容器创建");
//        Properties pps = new Properties();
//        String path = Thread.currentThread().getContextClassLoader().getResource("").getPath();
//        InitUtils utils = new InitUtils(path);
//        if (utils.exists()) {
//            String property = utils.get("github.name", "egdw");
//        } else {
//            HashMap<String, String> map = new HashMap<String, String>();
//            map.put("blog.big.title", utils.get("blog.big.title", "沉默"));
//            map.put("blog.small.title", utils.get("blog.small.title", "恶搞大王的个人博客"));
//            map.put("github.name", utils.get("github.name", "egdw"));
//            map.put("blog.register.needcheck", utils.get("blog.register.needcheck", "false"));
//            map.put("blog.register.close", utils.get("blog.register.close", "false"));
//            map.put("blog.login.close", utils.get("blog.login.close", "false"));
//            map.put("blog.comment.close", utils.get("blog.comment.close", "false"));
//            map.put("user.wechat", utils.get("user.wechat", "false"));
//            map.put("user.qq", utils.get("user.qq", "false"));
//            map.put("user.email", utils.get("user.email", "false"));
//        }
    }


    /**
     * application销毁
     *
     * @param sce
     */
    public void contextDestroyed(ServletContextEvent sce) {
        logger.warn("application容器销毁");
    }

}
