package com.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteRole;
import com.website.mapper.WebsiteRoleMapper;

@Service
public class WebSiteRoleService {
	@Autowired
	private WebsiteRoleMapper mapper;

	public WebsiteRole getRoleById(Integer id) {
		WebsiteRole role = mapper.getByRoleId(id);
		return role;
	}

}
