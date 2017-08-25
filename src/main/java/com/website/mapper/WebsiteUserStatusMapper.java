package com.website.mapper;

import com.website.entites.WebsiteStatus;
import com.website.entites.WebsiteUserStatus;

import java.util.ArrayList;

public interface WebsiteUserStatusMapper {
    int deleteByPrimaryKey(Long websiteStatusUserId);

    int insert(WebsiteUserStatus record);

    int insertSelective(WebsiteUserStatus record);

    WebsiteUserStatus selectByPrimaryKey(Long websiteStatusUserId);

    WebsiteUserStatus selectByUserId(Long userId);

    ArrayList<WebsiteUserStatus> selectByStatusId(Long statusId);

    int updateByPrimaryKeySelective(WebsiteUserStatus record);

    int updateByPrimaryKey(WebsiteUserStatus record);

}