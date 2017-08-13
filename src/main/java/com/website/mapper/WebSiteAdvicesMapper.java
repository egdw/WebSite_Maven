package com.website.mapper;

import com.website.entites.WebsiteAdvices;

public interface WebSiteAdvicesMapper {
    int deleteByPrimaryKey(Long websiteAdvicesId);

    int insert(WebsiteAdvices record);

    int insertSelective(WebsiteAdvices record);

    WebsiteAdvices selectByPrimaryKey(Long websiteAdvicesId);

    int updateByPrimaryKeySelective(WebsiteAdvices record);

    int updateByPrimaryKeyWithBLOBs(WebsiteAdvices record);

    int updateByPrimaryKey(WebsiteAdvices record);
}