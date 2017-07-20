package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteUserRoleKey;

public interface WebsiteUserRoleMapper {
    int deleteByPrimaryKey(WebsiteUserRoleKey key);

    int insert(WebsiteUserRoleKey record);

    int insertSelective(WebsiteUserRoleKey record);
    
    WebsiteUserRoleKey selectByUserId(Long id);
    
    ArrayList<WebsiteUserRoleKey> selectByRoleId(Long id);
    
}