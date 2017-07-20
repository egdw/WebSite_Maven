package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteComment;

public interface WebsiteCommentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WebsiteComment record);

    int insertSelective(WebsiteComment record);

    WebsiteComment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WebsiteComment record);

    int updateByPrimaryKeyWithBLOBs(WebsiteComment record);

    int updateByPrimaryKey(WebsiteComment record);
    
    ArrayList<WebsiteComment> selectCommentByBlogId(Integer blogId);
    
    WebsiteComment getById(Integer id);
    
    ArrayList<WebsiteComment> selectCommentByNum(Integer num);
}