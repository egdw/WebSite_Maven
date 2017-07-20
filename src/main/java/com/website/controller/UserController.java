package com.website.controller;

import org.apache.shiro.subject.Subject;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.website.entites.WebsiteUser;
import com.website.service.WebSiteUserService;

@Controller
@RequestMapping("userController")
public class UserController {
	@Autowired
	private WebSiteUserService service;

	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(String username, String email, String phone,
			String newPassword) {
		boolean isChangePassword=  false;
		Subject subject = SecurityUtils.getSubject();
		String id = (String) subject.getPrincipal();
		WebsiteUser user = service.getByUsername(id);
		if (newPassword != null && !newPassword.isEmpty()) {
			isChangePassword =true;
			user.setLoginPasswd(newPassword);
		}
		if (username != null) {
			user.setUserName(username);
		}
		if (email != null) {
			user.setUserEmail(email);
		}
		if (phone != null) {
			user.setUserPhone(phone);
		}
		boolean updateUser = service.updateUser(user);
		if(updateUser && isChangePassword){
			Subject subject2 = SecurityUtils.getSubject();
			subject2.logout();
			return "redirect:/login/login.jsp";
		}
		return "redirect:/manager/manager_person_setting.do";
	}
}
