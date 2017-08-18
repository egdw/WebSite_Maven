package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.WebsiteAdvices;
import com.website.entites.WebsiteUser;
import com.website.model.Message;
import com.website.service.WebSiteAdvicesService;
import com.website.service.WebSiteUserService;
import com.website.utils.AuthCodeGenerator;
import com.website.utils.RedisUtils;
import com.website.utils.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import redis.clients.jedis.JedisPool;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;

/**
 * Created by hdy on 17-8-18.
 * 留言板控制器
 */
@SuppressWarnings("ALL")
@RestController
@RequestMapping("advices")
public class AdvicesController {
    @Autowired
    private JedisPool jedisPool;
    @Autowired
    private WebSiteUserService userService;
    @Autowired
    private WebSiteAdvicesService advicesService;

    @RequestMapping(method = RequestMethod.POST)
    @RequiresAuthentication
    public String add(@RequestParam(required = true) String websiteText, @RequestParam String verfiy) {
        //获取用户名
        String name = (String) SecurityUtils.getSubject().getPrincipal();
        //获取验证码标示
        String uuid = (String) SecurityUtils.getSubject().getSession().getAttribute("advicesTemp");
        //设置请求间隔时间
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "advicesVeriyPass:" + uuid);
        if (utils.exist()) {
            //判断验证码是否过期，如果存在说明没有过期
            if (!utils.get().toLowerCase().equals(verfiy.toLowerCase())) {
                //说明验证码输入错误
                return JSON.toJSONString(new Message(500, "验证码错误", null, null, null));
            }
        } else {
            return JSON.toJSONString(new Message(500, "验证码已经失效。", null, null, null));
        }
        utils.setKey("advices_times:" + name);
        if (utils.exist()) {
            return JSON.toJSONString(new Message(500, "请求速度太快了，等会在留言吧", null, null, null));
        } else {
            utils.setAndExpire(" ", 60 * 3, true);
        }
        if (websiteText.contains("<script>") || websiteText.contains("</script>")) {
            //首先判断是否有js的代码注入
            return JSON.toJSONString(new Message(500, "请不要注入脚本语言", null, null, null));
        }
        if (websiteText.length() > 150) {
            //判断留言的长度是否大于150
            return JSON.toJSONString(new Message(500, "输入的内容太多", null, null, null));
        }
        WebsiteAdvices advices = new WebsiteAdvices();
        advices.setWebsiteDate(new Date());
        advices.setWebsiteText(websiteText);
        WebsiteUser user = userService.getByUsername(name);
        advices.setWebsiteUserId(user.getUserId());
        boolean add = advicesService.add(advices);
        if (add) {
            return JSON.toJSONString(new Message(200, "添加成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "添加失败", null, null, null));
    }

    /**
     * 得到登录验证码
     */
    @RequestMapping(value = "/getVeriyImage", method = RequestMethod.GET)
    @RequiresAuthentication
    public void getVeriyImage(HttpServletResponse response) {
        AuthCodeGenerator generator =
                new AuthCodeGenerator();
        String uuid = UUIDUtils.getUUID();
        SecurityUtils.getSubject().getSession().setAttribute("advicesTemp", uuid);
        Object[] objects = generator.getAuthCodeImage(4);
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "advicesVeriyPass:" + uuid);
        //设置验证码60秒自动过期
        utils.setAndExpire((String) objects[0], 60, true);
        BufferedImage image = (BufferedImage) objects[1];
        response.setContentType("image/png");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
            ImageIO.write(image, "PNG", os);
        } catch (IOException e) {
            //有异常说明是用户主动中断了
        }
    }


    @RequestMapping(method = RequestMethod.DELETE)
    public String del(@RequestParam(required = true) Long id) {
        boolean del = advicesService.del(id);
        if (del) {
            return JSON.toJSONString(new Message(200, "删除成功", null, null, null));
        }
        return JSON.toJSONString(new Message(500, "删除失败", null, null, null));
    }

    @RequestMapping(method = RequestMethod.GET)
    public void query() {

    }

    @RequestMapping(value = "queryPage", method = RequestMethod.GET)
    public void queryByNum() {
    }

}
