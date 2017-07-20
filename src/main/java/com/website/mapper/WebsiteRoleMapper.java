package com.website.mapper;

import com.website.entites.WebsiteRole;

public interface WebsiteRoleMapper {
    int deleteByPrimaryKey(Integer roleId);

    int insert(WebsiteRole record);

    int insertSelective(WebsiteRole record);

    int deleteByUserId(Integer userId);
    
    int updateByPrimaryKeySelective(WebsiteRole record);

    int updateByPrimaryKey(WebsiteRole record);
    
    WebsiteRole getByRoleId(Integer id);
}