package com.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteRole;
import com.website.mapper.WebsiteRoleMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Transactional
public class WebSiteRoleService {
	@Autowired
	private WebsiteRoleMapper mapper;

	public WebsiteRole getRoleById(Integer id) {
		WebsiteRole role = mapper.getByRoleId(id);
		return role;
	}

	public ArrayList<WebsiteRole> getAll(){
		return mapper.getAll();
	}


	public WebsiteRole findRoleByName(String name){
		return mapper.findRoleByName(name);
	}

}
