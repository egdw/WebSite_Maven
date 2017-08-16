package com.website.controller;

import java.util.ArrayList;
import java.util.Map;

import com.website.utils.InternetUtil;
import com.website.utils.RedisUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.website.entites.WebsiteProject;
import com.website.service.WebSiteProjectService;
import redis.clients.jedis.JedisPool;

@Controller
@RequestMapping("project")
public class MyProjectController {
    @Autowired
    private WebSiteProjectService service;
    @Autowired
    private JedisPool jedisPool;

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

    /**
     * 跳转到list界面.向request中放入数据库读取的数据
     *
     * @param map
     * @return
     */
    @RequestMapping("MyProject.do")
    public String execute(Map<String, Object> map) {
        ArrayList<WebsiteProject> list = service.getAll();
        map.put("projects", list);
        return "/project/list";
    }

    /**
     * 添加工程
     *
     * @param record
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "project.do", method = RequestMethod.POST)
    @ResponseBody
    public String addProject(WebsiteProject record) {
        boolean super_admin = SecurityUtils.getSubject().hasRole("super_admin");
        System.out.println(super_admin);
        boolean add = service.add(record);
        if (add) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 通过id过去工程
     *
     * @param id
     * @return
     */
    @RequestMapping(value = "project.do", method = RequestMethod.GET)
    @ResponseBody
    public WebsiteProject getProject(Long id) {
        WebsiteProject project = service.getById(id);
        return project;
    }

    /**
     * 更新工程
     *
     * @param project
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "project.do", method = RequestMethod.PUT)
    @ResponseBody
    public String updateProject(WebsiteProject project) {
        boolean b = service.update(project);
        if (b) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 删除工程
     *
     * @param id
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "project.do", method = RequestMethod.DELETE)
    @ResponseBody
    public String delProject(Long id) {
        boolean del = service.del(id);
        if (del) {
            return "success";
        } else {
            return "error";
        }
    }


    /**
     * 获取仓库
     * 目的在于.github对于请求次数有限.如果请求次数太多会导致返回403错误.所以服务器必须要缓存.不能每次都去github调用
     */
    @RequestMapping(value = "/repos", method = RequestMethod.GET)
    @ResponseBody
    public String getRepos() {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "project_repo");
        String request = null;
        if (utils.exist()) {
            request = utils.get();
            utils.close();
        } else {
            request = InternetUtil.get("https://api.github.com/users/egdw/repos");
            //设置一天的缓存
            utils.setAndExpire(request, 60 * 60 * 24, true);
        }
        return request;
    }


    /**
     * 获取星级数据
     * 目的在于.github对于请求次数有限.如果请求次数太多会导致返回403错误.所以服务器必须要缓存.不能每次都去github调用
     */
    @ResponseBody
    @RequestMapping(value = "started", method = RequestMethod.GET)
    public String getStarted() {
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "project_started");
        String request = null;
        if (utils.exist()) {
            request = utils.get();
            utils.close();
        } else {
            request = InternetUtil.get("https://api.github.com/users/egdw/starred");
            //设置一天的缓存
            utils.setAndExpire(request, 60 * 60 * 24, true);
        }
        return request;
    }
}
