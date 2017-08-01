package com.website.exceptionhandler;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

/**
 * Created by hdy on 2017/7/30.
 * 用于处理shiro权限异常
 */
@ControllerAdvice
public class ShiroExceptionHandler {

    public ShiroExceptionHandler() {
        System.out.println("创建成功");
    }

    @ExceptionHandler
    public String shiroException() {
        return "redirect:/401.jsp";
    }
//
    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "401.jsp";
    }
}
