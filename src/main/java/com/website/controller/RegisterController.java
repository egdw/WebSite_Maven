package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.WebsiteUser;
import com.website.entites.WebsiteUserRoleKey;
import com.website.entites.WebsiteUserStatus;
import com.website.model.InitModel;
import com.website.model.Message;
import com.website.service.WebSiteRoleService;
import com.website.service.WebSiteUserRoleService;
import com.website.service.WebSiteUserService;
import com.website.service.WebsiteUserStatusService;
import com.website.utils.AuthCodeGenerator;
import com.website.utils.RedisUtils;
import com.website.utils.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import redis.clients.jedis.JedisPool;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

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
    @Autowired
    private WebsiteUserStatusService userStatusService;

    @Autowired
    private JedisPool jedisPool;
    @Autowired
    private InitModel initModel;

    @RequestMapping(value = "/register", method = RequestMethod.POST)
    @ResponseBody
    public String register(@RequestParam(required = true) String username, @RequestParam(required = true) String password, @RequestParam(required = true) String password2, @RequestParam(required = true) String verify, HttpSession session) {
        String uuid = (String) SecurityUtils.getSubject().getSession().getAttribute("registerTemp");
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "registerVeriyPass:" + uuid);
        String registerVeriyPass = utils.get();
        utils.remove();
        utils.close();
        if ("true".equals(initModel.getBlog_register_close())) {
            //说明管理员禁止注册
            Message message = new Message(200, "ban_register", null, null, null);
            return JSON.toJSONString(message);
        }
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
                    if (verify.toLowerCase().equals(registerVeriyPass.toLowerCase())) {
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
                        if ("true".equals(initModel.getBlog_register_needcheck())) {
                            //设置状态为审核不通过
                            WebsiteUserStatus status = new WebsiteUserStatus();
                            status.setWebsiteStatusId(1l);
                            status.setWebsiteUserId(user.getUserId());
                            userStatusService.add(status);
                        } else {
                            //说明没有开启验证
                            //设置状态为审核通过
                            WebsiteUserStatus status = new WebsiteUserStatus();
                            status.setWebsiteStatusId(4l);
                            status.setWebsiteUserId(user.getUserId());
                            userStatusService.add(status);
                        }

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
    public void getVeriyImage(HttpServletResponse response) {
        AuthCodeGenerator generator =
                new AuthCodeGenerator();
        Object[] objects = generator.getAuthCodeImage(6);
        String uuid = UUIDUtils.getUUID();
        SecurityUtils.getSubject().getSession().setAttribute("registerTemp", uuid);
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "registerVeriyPass:" + uuid);
        System.out.println("registerVeriyPass:" + uuid);
        System.out.println(objects[0]);
        utils.setAndExpire((String) objects[0], 60, true);
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


    /**
     * 返回当前注册的相关的设置
     */
    @RequestMapping("getRegisterSettings")
    @ResponseBody
    public String getRegisterSettings() {
        Map<String, String> map = new HashMap<String, String>();
        map.put("needcheck", initModel.getBlog_register_needcheck());
        map.put("close", initModel.getBlog_register_close());
        return JSON.toJSONString(map);
    }

    @RequestMapping("updateCheck")
    @ResponseBody
    public String updateCheck(Integer flag) {
        if (flag == 1) {
            initModel.setBlog_register_needcheck("true");
            return JSON.toJSONString(new Message(200, "true", null, null, null));
        } else {
            initModel.setBlog_register_needcheck("false");
            return JSON.toJSONString(new Message(200, "false", null, null, null));
        }
    }

    @RequestMapping("updateClose")
    @ResponseBody
    public String updateClose(Integer flag) {
        if (flag == 1) {
            initModel.setBlog_register_close("true");
            return JSON.toJSONString(new Message(200, "true", null, null, null));
        } else {
            initModel.setBlog_register_close("false");
            return JSON.toJSONString(new Message(200, "false", null, null, null));
        }
    }

}
