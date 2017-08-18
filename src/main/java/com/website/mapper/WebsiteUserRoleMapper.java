package com.website.mapper;

import com.sun.org.apache.bcel.internal.generic.ARRAYLENGTH;
import com.website.entites.WebsiteUserRoleKey;

import java.util.ArrayList;

public interface WebsiteUserRoleMapper {
    int deleteByPrimaryKey(WebsiteUserRoleKey key);

    int insert(WebsiteUserRoleKey record);

    int insertSelective(WebsiteUserRoleKey record);
    
    WebsiteUserRoleKey selectByUserId(Long id);
    
    ArrayList<WebsiteUserRoleKey> selectByRoleId(Integer id);

    Integer updateWebSite(WebsiteUserRoleKey key);

    ArrayList<WebsiteUserRoleKey> selectRoleByRoleId(Integer roleId);
}