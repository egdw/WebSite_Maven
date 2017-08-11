package com.website.mapper;

import com.website.entites.WebsiteBlogType;

public interface WebsiteBlogTypeMapper {
    int deleteByPrimaryKey(Integer websiteBlogTypeId);

    int insert(WebsiteBlogType record);

    int insertSelective(WebsiteBlogType record);

    WebsiteBlogType selectByPrimaryKey(Integer websiteBlogTypeId);

    int updateByPrimaryKeySelective(WebsiteBlogType record);

    int updateByPrimaryKey(WebsiteBlogType record);
}