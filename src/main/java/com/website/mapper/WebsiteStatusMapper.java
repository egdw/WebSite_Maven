package com.website.mapper;

import com.website.entites.WebsiteStatus;

import java.util.ArrayList;

public interface WebsiteStatusMapper {
    int deleteByPrimaryKey(Long websiteStatusId);

    int insert(WebsiteStatus record);

    int insertSelective(WebsiteStatus record);

    WebsiteStatus selectByPrimaryKey(Long websiteStatusId);

    int updateByPrimaryKeySelective(WebsiteStatus record);

    int updateByPrimaryKey(WebsiteStatus record);

    ArrayList<WebsiteStatus> findAll();
}