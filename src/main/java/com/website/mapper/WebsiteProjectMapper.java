package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteProject;

public interface WebsiteProjectMapper {
    int deleteByPrimaryKey(Long projectId);

    int insert(WebsiteProject record);

    int insertSelective(WebsiteProject record);

    WebsiteProject selectByPrimaryKey(Long projectId);

    int updateByPrimaryKeySelective(WebsiteProject record);

    int updateByPrimaryKeyWithBLOBs(WebsiteProject record);

    int updateByPrimaryKey(WebsiteProject record);
    
    ArrayList<WebsiteProject> getAll();
    
    int getProjectNum();
    
    ArrayList<WebsiteProject> selectByPageNum(Integer pageNum,Integer getNum);
}