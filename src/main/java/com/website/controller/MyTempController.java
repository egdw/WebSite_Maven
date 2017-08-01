package com.website.controller;

import java.util.ArrayList;
import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.website.entites.WebsiteProject;
import com.website.service.WebSiteProjectService;

@Controller
@RequestMapping("project")
public class MyTempController {
    @Autowired
    private WebSiteProjectService service;


    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

    /**
     * 添加工程
     *
     * @param record
     * @return
     */
    @RequestMapping(value = "temp.do", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String addProject(WebsiteProject record) {
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
    @RequestMapping(value = "temp.do", method = RequestMethod.GET)
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
    @RequestMapping(value = "temp.do", method = RequestMethod.PUT)
    @ResponseBody
    @RequiresRoles("super_admin")
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
    @RequestMapping(value = "temp.do", method = RequestMethod.DELETE)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String delProject(Long id) {
        boolean del = service.del(id);
        if (del) {
            return "success";
        } else {
            return "error";
        }
    }
}
