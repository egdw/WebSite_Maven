package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.WebsiteRole;
import com.website.entites.WebsiteUser;
import com.website.entites.WebsiteUserRoleKey;
import com.website.model.Message;
import com.website.service.WebSiteRoleService;
import com.website.service.WebSiteUserRoleService;
import com.website.service.WebSiteUserService;
import com.website.utils.AuthCodeGenerator;
import com.website.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.Random;

/**
 * Created by hdy on 2017/7/30.
 * 注册控制器
 */
@RequestMapping("register")
@Controller
public class RegisterController {
    @Autowired
    private WebSiteUserService userService;
    @Autowired
    private WebSiteUserRoleService userRoleService;
    @Autowired
    private WebSiteRoleService roleService;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(@RequestParam(required = true) String username, @RequestParam(required = true) String password, @RequestParam(required = true) String password2, @RequestParam(required = true) String verify, HttpSession session) {
        //noinspection Since15
        String registerVeriyPass = (String) session.getAttribute("registerVeriyPass");
        //立即重置验证码
        session.setAttribute("registerVeriyPass", UserUtils.getRandomText(4));
        if (username.isEmpty()) {
            Message message = new Message(200, "username_short", null, null, null);
            return JSON.toJSONString(message);
        }
        WebsiteUser user = userService.getByUsername(username);
        //通过username判断用户是否存在
        if (user == null) {
            //说明用户不存在
            if (password.equals(password2)) {
                //判断两个密码是否相同
                if (password.length() < 6) {
                    //说明密码太短
                    Message message = new Message(200, "password_short", null, null, null);
                    return JSON.toJSONString(message);
                } else {
                    //密码通过
                    if (verify.equals(verify)) {
                        //如果与验证码相同.说明可以注册了
                        WebsiteUser websiteUser = new WebsiteUser();
                        websiteUser.setLoginAccount(username);
                        websiteUser.setLoginPasswd(password);
                        websiteUser.setRegisterDate(new Date());
                        userService.addUser(websiteUser);
                        user = userService.getByUsername(username);
                        WebsiteUserRoleKey websiteUserRoleKey = new WebsiteUserRoleKey();
                        websiteUserRoleKey.setRoleId(roleService.findRoleByName("normal").getRoleId());
                        websiteUserRoleKey.setUserId(user.getUserId());
                        userRoleService.addUserRole(websiteUserRoleKey);
                        return JSON.toJSONString(new Message(200, "success", null, null, null));
                    } else {
                        //验证码验证失败
                        Message message = new Message(200, "code_fail", null, null, null);
                        return JSON.toJSONString(message);
                    }
                }
            } else {
                //两个密码不相同
                Message message = new Message(200, "password_not_like", null, null, null);
                return JSON.toJSONString(message);
            }
        } else {
            //说明用户已经存在
            Message message = new Message(200, "userExsits", null, null, null);
            return JSON.toJSONString(message);
        }
    }

    /**
     * 得到登录验证码
     */
    @RequestMapping("/getVeriyImage")
    public void getVeriyImage(HttpSession session, HttpServletResponse response) {
        AuthCodeGenerator generator =
                new AuthCodeGenerator();
        Object[] objects = generator.getAuthCodeImage(6);
        session.setAttribute("registerVeriyPass", objects[0]);
        BufferedImage image = (BufferedImage) objects[1];
        response.setContentType("image/png");
        OutputStream os = null;
        try {
            os = response.getOutputStream();
            ImageIO.write(image, "PNG", os);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
