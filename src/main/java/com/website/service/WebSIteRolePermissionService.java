package com.website.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteRolePermission;
import com.website.mapper.WebsiteRolePermissionMapper;

@Service
public class WebSIteRolePermissionService {
	@Autowired
	private WebsiteRolePermissionMapper mapper;

	public ArrayList<WebsiteRolePermission> getByRoleId(Integer id) {
		ArrayList<WebsiteRolePermission> arrayList = mapper
				.selectPermissionByRoleId(id);
		return arrayList;
	}
}
