package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteRolePermission;

public interface WebsiteRolePermissionMapper {
    int deleteByPrimaryKey(Integer permissionId);

    int insert(WebsiteRolePermission record);

    int insertSelective(WebsiteRolePermission record);

    WebsiteRolePermission selectByPrimaryKey(Integer permissionId);
    
    ArrayList<WebsiteRolePermission> selectPermissionByRoleId(Integer id);

    int updateByPrimaryKeySelective(WebsiteRolePermission record);

    int updateByPrimaryKey(WebsiteRolePermission record);
}