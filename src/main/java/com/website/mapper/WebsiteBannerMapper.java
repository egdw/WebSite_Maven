package com.website.mapper;

import com.website.entites.WebsiteBanner;

import java.util.List;

public interface WebsiteBannerMapper {
    int deleteByPrimaryKey(Integer bannerId);

    int insert(WebsiteBanner record);

    int insertSelective(WebsiteBanner record);

    WebsiteBanner selectByPrimaryKey(Integer bannerId);

    int updateByPrimaryKeySelective(WebsiteBanner record);

    int updateByPrimaryKey(WebsiteBanner record);

    List<WebsiteBanner> getAll();
}