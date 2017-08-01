package com.website.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;

import com.website.utils.AuthCodeGenerator;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.website.entites.WebsiteComment;
import com.website.service.WebSiteBlogService;
import com.website.service.WebSiteCommentService;

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

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    public String add(Integer blogId, String content, String email,
                      String username, @RequestParam(required = true) String verify, HttpSession session) {
        String verifyPass = (String) session.getAttribute("CommentVeriyPass");
        if (!(verify.toLowerCase()).equals(verifyPass.toLowerCase())) {
            //如果不相同.说明验证码不正确
            return "redirect:/login/login.jsp";
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
    public void getVeriyImage(HttpSession session, HttpServletResponse response) {
        AuthCodeGenerator generator =
                new AuthCodeGenerator();
        Object[] objects = generator.getAuthCodeImage(4);
        session.setAttribute("CommentVeriyPass", objects[0]);
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