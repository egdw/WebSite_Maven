package com.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteUserRoleKey;
import com.website.mapper.WebsiteUserRoleMapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Service
@Transactional
public class WebSiteUserRoleService {
    @Autowired
    private WebsiteUserRoleMapper mapper;

    public WebsiteUserRoleKey getByUserId(Long id) {
        WebsiteUserRoleKey key = mapper.selectByUserId(id);
        return key;
    }

    public void addUserRole(WebsiteUserRoleKey key) {
        mapper.insert(key);
    }


    public boolean updateRole(WebsiteUserRoleKey key) {
        Integer site =
                mapper.updateWebSite(key);
        return site > 0 ? true : false;
    }

    public ArrayList<WebsiteUserRoleKey> selectByRoleId(Integer roleId){
        ArrayList<WebsiteUserRoleKey> keys =
                mapper.selectByRoleId(roleId);
        return keys;
    }
}
