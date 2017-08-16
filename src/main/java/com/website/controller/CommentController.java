package com.website.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.UUID;

import com.website.utils.AuthCodeGenerator;
import com.website.utils.RedisUtils;
import com.website.utils.UUIDUtils;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.website.entites.WebsiteComment;
import com.website.service.WebSiteBlogService;
import com.website.service.WebSiteCommentService;
import redis.clients.jedis.JedisPool;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("comment")
public class CommentController {

    @Autowired
    private WebSiteCommentService commentService;
    @Autowired
    private WebSiteBlogService blogService;
    @Autowired
    private JedisPool jedisPool;

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public String add(@RequestParam(required = true) Integer blogId, @RequestParam(required = true) String content, String email,
                      @RequestParam(required = true) String username, @RequestParam(required = true) String verify, HttpSession session) {
        String uuid = (String) SecurityUtils.getSubject().getSession().getAttribute("commentTemp");
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "CommentVeriyPass:" + uuid);
        String verifyPass = utils.get();
        utils.remove();
        utils.close();
        if (verifyPass == null || !(verify.toLowerCase()).equals(verifyPass.toLowerCase())) {
            //如果不相同.说明验证码不正确
            return "error";
        }
        if (blogId == null || content == null || email == null
                || username == null || content.isEmpty() || email.isEmpty()
                | username.isEmpty()) {
            return "error";
        }
        //判断是否植入了脚本语言
        if (content.contains("<script>") || content.contains("</script>")) {
            return "error";
        }
        commentService.addComment(blogId, content, email, username);
        return "success";
    }

    @RequestMapping(value = "del", method = RequestMethod.GET)
    @ResponseBody
    @RequiresRoles({"super_admin", "admin"})
    public String del(Integer comentId) {
        WebsiteComment comment = commentService.getCommentById(comentId);
        if (comment == null) {
            return "error";
        }
        Integer blogId = comment.getBlogId();
        boolean b = commentService.delComment(comentId);
        if (b) {
            boolean c = blogService.updateCommentTimes(blogId, true);
            if (c) {
                return "success";
            }
            return "error";
        } else {
            return "error";
        }
    }

    @RequestMapping("get")
    @ResponseBody
    public ArrayList<WebsiteComment> get(Integer blogId) {
        if (blogId != null) {
            ArrayList<WebsiteComment> list = commentService
                    .selectCommentByBlogId(blogId);
            return list;
        }
        return null;
    }


    /**
     * 得到登录验证码
     */
    @RequestMapping("/getVeriyImage")
    public void getVeriyImage(HttpServletResponse response) {
        AuthCodeGenerator generator =
                new AuthCodeGenerator();
        Object[] objects = generator.getAuthCodeImage(4);
        String uuid = UUIDUtils.getUUID();
        SecurityUtils.getSubject().getSession().setAttribute("commentTemp", uuid);
        RedisUtils utils = new RedisUtils(jedisPool.getResource(), "CommentVeriyPass:" + uuid);
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

}