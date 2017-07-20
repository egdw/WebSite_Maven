package com.website.controller;

import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.website.entites.WebsiteUser;
import com.website.service.WebSiteUserService;

@Controller
@RequestMapping("login")
public class LoginController {
	@Autowired
	private WebSiteUserService service;

	/**
	 * 用户登录操作
	 * 
	 * @param username
	 *            账号
	 * @param password
	 *            密码
	 */
	@RequestMapping(value = "Login.do", method = RequestMethod.POST)
	public String loginByUsernamePasswd(String username, String password,
			Map<String, Object> requests) {
		Subject subject = SecurityUtils.getSubject();
		UsernamePasswordToken token = new UsernamePasswordToken(username,
				password);
		try {
			subject.login(token);
		} catch (Exception e) {
			return "redirect:/login/login.jsp";
			// 说明登陆失败
		}
		if (subject.isAuthenticated()) {
			// 判断是否验证成功
			try {
				subject.checkRole("super_admin");
			} catch (AuthorizationException e) {
				// 说明不是超级管理员.
				return "redirect:/login/login.jsp";
			}
		}
		WebsiteUser user = service.getByUsername(username);
		requests.put("user", user);
		return "admin/admin_index";
	}

	/**
	 * 用户注册操作
	 * 
	 * @param user
	 *            需要注册的用户
	 */
	@RequestMapping(value = "register.do", method = RequestMethod.POST)
	public void register(WebsiteUser user) {

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
			try {
				subject.checkRole("super_admin");
				WebsiteUser user = service.getByUsername((String) subject
						.getPrincipal());
				map.put("user", user);
				return "/admin/admin_index";
			} catch (AuthorizationException e) {
				// 说明不是超级管理员.
				return "redirect:/login/login.jsp";
			}
		}
		return "redirect:/login/login.jsp";
	}
}
