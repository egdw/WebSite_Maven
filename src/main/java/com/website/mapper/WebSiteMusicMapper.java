package com.website.mapper;

import com.website.entites.WebSiteMusic;

import java.util.ArrayList;

public interface WebSiteMusicMapper {
    int deleteByPrimaryKey(Long websiteMusicUserId);

    int insert(WebSiteMusic record);

    int insertSelective(WebSiteMusic record);

    WebSiteMusic selectByPrimaryKey(Long websiteMusicUserId);

    int updateByPrimaryKeySelective(WebSiteMusic record);

    int updateByPrimaryKey(WebSiteMusic record);

    ArrayList<WebSiteMusic> selectByPageNum(int page, int musicGetNum, Long userId);

    ArrayList<WebSiteMusic> findAll(Long userId);
}