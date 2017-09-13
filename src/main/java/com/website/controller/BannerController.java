package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.WebsiteBanner;
import com.website.model.Message;
import com.website.service.WebsiteBannerService;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by hdy on 17-8-11.
 * 进行博客首页的banner管理
 */
@RestController
@RequestMapping("/banner")
public class BannerController {
    @Autowired
    private WebsiteBannerService bannerService;

    /**
     * 获取目前博客首页的所有banner
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "getAllBanner", method = RequestMethod.GET)
    public String getAllBanner() {
        List<WebsiteBanner> all = bannerService.getAll();
        return JSON.toJSONString(all);
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "getBanner", method = RequestMethod.GET)
    public String getBannerById(Integer id) {
        WebsiteBanner one = bannerService.getOne(id);
        return JSON.toJSONString(one);
    }

    /**
     * 进行banner的添加
     *
     * @param url     图片指向的地址
     * @param title   图片的标题
     * @param img_url 图片的地址
     */
    @RequiresRoles(value = "super_admin")
    @RequestMapping(method = RequestMethod.POST)
    public String addBanner(@RequestParam(required = true) String url, String title, @RequestParam(required = true) String img_url) {
        WebsiteBanner banner = new WebsiteBanner();
        banner.setBannerImageUrl(img_url);
        banner.setBannerTitle(title);
        banner.setBannerUrl(url);
        boolean b = bannerService.add(banner);
        if (b) {
            return JSON.toJSONString(new Message(200, "添加成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "添加失败", null, null, null));
    }

    /**
     * 进行banner的删除
     */
    @RequiresRoles(value = "super_admin")
    @RequestMapping(method = RequestMethod.DELETE)
    public String delBanner(@RequestParam(required = true) Integer id) {
        boolean b = bannerService.del(id);
        if (b) {
            return JSON.toJSONString(new Message(200, "删除成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "删除失败", null, null, null));
    }

    /**
     * 进行banner的修改
     */
    @RequiresRoles(value = "super_admin")
    @RequestMapping(method = RequestMethod.PUT)
    public String update(WebsiteBanner banner) {
        boolean b = bannerService.update(banner);
        if (b) {
            return JSON.toJSONString(new Message(200, "更新成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
    }

}
