package com.website.mapper;

import com.website.entites.WebsiteMusic;

import java.util.ArrayList;

public interface WebsiteMusicMapper {
    int deleteByPrimaryKey(Long websiteMusicUserId);

    int insert(WebsiteMusic record);

    int insertSelective(WebsiteMusic record);

    WebsiteMusic selectByPrimaryKey(Long websiteMusicUserId);

    int updateByPrimaryKeySelective(WebsiteMusic record);

    int updateByPrimaryKey(WebsiteMusic record);

    ArrayList<WebsiteMusic> selectByPageNum(int page, int musicGetNum, Long userId);

    ArrayList<WebsiteMusic> findAll(Long userId);
}