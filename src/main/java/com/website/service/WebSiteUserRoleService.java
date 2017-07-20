package com.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteUserRoleKey;
import com.website.mapper.WebsiteUserRoleMapper;

@Service
public class WebSiteUserRoleService {
	@Autowired
	private WebsiteUserRoleMapper mapper;

	public WebsiteUserRoleKey getByUserId(Long id) {
		WebsiteUserRoleKey key = mapper.selectByUserId(id);
		return key;
	}
	
}
