package com.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteUserRoleKey;
import com.website.mapper.WebsiteUserRoleMapper;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class WebSiteUserRoleService {
	@Autowired
	private WebsiteUserRoleMapper mapper;

	public WebsiteUserRoleKey getByUserId(Long id) {
		WebsiteUserRoleKey key = mapper.selectByUserId(id);
		return key;
	}

	public void addUserRole(WebsiteUserRoleKey key){
		mapper.insert(key);
	}

}
