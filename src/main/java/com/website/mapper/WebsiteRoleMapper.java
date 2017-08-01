package com.website.mapper;

import com.website.entites.WebsiteRole;

import java.util.ArrayList;

public interface WebsiteRoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(WebsiteRole record);

    int insertSelective(WebsiteRole record);

    int deleteByUserId(Integer userId);
    
    int updateByPrimaryKeySelective(WebsiteRole record);

    int updateByPrimaryKey(WebsiteRole record);
    
    WebsiteRole getByRoleId(Integer id);

    ArrayList<WebsiteRole> getAll();


    WebsiteRole findRoleByName(String name);
}