package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.WebsiteFriendLink;
import com.website.model.Message;
import com.website.service.WebSiteFriendLinkService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by hdy on 2017/8/11.
 */
@RestController
@RequestMapping("friendLink")
public class FriendLinkController {
    @Autowired
    private WebSiteFriendLinkService service;


    @RequestMapping(method = RequestMethod.POST)
    @RequiresRoles("super_admin")
    public String add(@RequestParam(required = true) String url, @RequestParam(required = true) String name) {
        WebsiteFriendLink link = new WebsiteFriendLink();
        link.setWbesiteFriendLinkUrl(url);
        link.setWebsiteFriendLinkName(name);
        boolean b = service.addLink(link);
        if (b) {
            return JSON.toJSONString(new Message(200, "添加成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "添加失败", null, null, null));
    }

    @RequestMapping(method = RequestMethod.DELETE)
    @RequiresRoles("super_admin")
    public String del(@RequestParam(required = true) Integer id) {
        boolean b = service.delLink(id);
        if (b) {
            return JSON.toJSONString(new Message(200, "删除成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "删除失败", null, null, null));
    }

    @RequestMapping(method = RequestMethod.PUT)
    @RequiresRoles("super_admin")
    public String update(@RequestParam(required = true) WebsiteFriendLink link) {
        boolean b = service.updateLink(link);
        if (b) {
            return JSON.toJSONString(new Message(200, "更改成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "更改失败", null, null, null));
    }

    @RequestMapping(method = RequestMethod.GET)
    public String get() {
        List<WebsiteFriendLink> all =
                service.getAll();
        return JSON.toJSONString(all);
    }
}
