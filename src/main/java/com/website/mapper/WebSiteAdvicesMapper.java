package com.website.mapper;

import com.website.entites.WebSiteAdvices;

public interface WebSiteAdvicesMapper {
    int deleteByPrimaryKey(Long websiteAdvicesId);

    int insert(WebSiteAdvices record);

    int insertSelective(WebSiteAdvices record);

    WebSiteAdvices selectByPrimaryKey(Long websiteAdvicesId);

    int updateByPrimaryKeySelective(WebSiteAdvices record);

    int updateByPrimaryKeyWithBLOBs(WebSiteAdvices record);

    int updateByPrimaryKey(WebSiteAdvices record);
}