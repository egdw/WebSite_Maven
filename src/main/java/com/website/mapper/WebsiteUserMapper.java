package com.website.mapper;

import com.website.entites.WebsiteUser;

import java.util.ArrayList;

public interface WebsiteUserMapper {
    int deleteByPrimaryKey(Long userId);

    int insert(WebsiteUser record);

    int insertSelective(WebsiteUser record);

    WebsiteUser selectByPrimaryKey(Long userId);

    int updateByPrimaryKeySelective(WebsiteUser record);

    int updateByPrimaryKey(WebsiteUser record);
    
    ArrayList<WebsiteUser> getAll();
    
    ArrayList<WebsiteUser> getUserByNum(Integer showNum, Integer pageNum);
    
    Integer getUserCount();
    
    WebsiteUser getByUsername(String name);
    
    ArrayList<WebsiteUser> getBySearch(String regex);
    
    WebsiteUser loginByUsernamePasswd(String username,String passwd);
    
}