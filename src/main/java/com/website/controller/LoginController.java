package com.website.controller;

import com.website.entites.WebsiteUser;
import com.website.service.WebSiteRoleService;
import com.website.service.WebSiteUserService;
import com.website.utils.AuthCodeGenerator;
import com.website.utils.RedisUtils;
import com.website.utils.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import redis.clients.jedis.JedisPool;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginController {
    @Autowired
    private WebSiteUserService service;
    @Autowired
    private WebSiteRoleService roleService;
    @Autowired
    private JedisPool jedisPool;

    /**
     * 用户登录操作
     *
     * @param username 账号
     * @param password 密码
     */
    @RequestMapping(value = "Login.do", method = RequestMethod.POST)
    public String loginByUsernamePasswd(@RequestParam(required = true) String username, @RequestParam(required = true) String password,
                                        Map<String, Object> requests, @RequestParam(required = true) String verify, HttpSession session) {
//        String verifyPass = (String) session.getAttribute("loginVeriyPass");
        String uuid = (String) SecurityUtils.getSubject().getSession().getAttribute("loginTemp");
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "loginVeriyPass:" + uuid);
        String verifyPass = utils.get();
        utils.remove();
        utils.close();
        if (verifyPass == null || !(verify.toLowerCase()).equals(verifyPass.toLowerCase())) {
            //如果不相同.说明验证码不正确
            return "redirect:/login/login.jsp";
        }
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token = new UsernamePasswordToken(username,
                password);
        token.setRememberMe(true);
        try {
            subject.login(token);
        } catch (Exception e) {
            return "redirect:/login/login.jsp";
            // 说明登陆失败
        }
        if (subject.isAuthenticated()) {
            // 判断是否验证成功
            WebsiteUser user = service.getByUsername(username);
            requests.put("user", user);
            return "redirect:/login/manager";
        } else {
            return "redirect:/login/login.jsp";
        }
    }

    /**
     * 退出登录
     */
    @RequestMapping("logout.do")
    public String logout() {
        Subject subject = SecurityUtils.getSubject();
        subject.logout();
        return "redirect:/login/login.jsp";
    }

    /*
     * 这个主要当用户点击进入管理的时候能够判断用户是否已经登录.如果已经登录就跳转到管理主页面
     */
    @RequestMapping("manager")
    public String OpenManagerView(Map<String, Object> map) {
        Subject subject = SecurityUtils.getSubject();
        if (subject.isAuthenticated()) {
            //获取所有的角色列表
            boolean superAdmin = subject.hasRole("super_admin");
            if (superAdmin) {
                try {
                    WebsiteUser user = service.getByUsername((String) subject
                            .getPrincipal());
                    map.put("user", user);
                    return "/admin/admin_index";
                } catch (AuthorizationException e) {
                    // 说明不是超级管理员.
                    return "redirect:/login/login.jsp";
                }
            } else {
                //说明是其他用戶。统一跳转到用户界面
                WebsiteUser user = service.getByUsername((String) subject
                        .getPrincipal());
                return "/user/user_index";
            }

        }
        return "redirect:/login/login.jsp";
    }

    /**
     * 得到登录验证码
     */
    @RequestMapping("/getVeriyImage")
    public void getVeriyImage(HttpServletResponse response) {
        AuthCodeGenerator generator =
                new AuthCodeGenerator();
        String uuid = UUIDUtils.getUUID();
        SecurityUtils.getSubject().getSession().setAttribute("loginTemp", uuid);
        Object[] objects = generator.getAuthCodeImage(4);
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "loginVeriyPass:" + uuid);
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
//            e.printStackTrace();
        }
    }

}
