package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteAlbum;

public interface WebsiteAlbumMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(WebsiteAlbum record);

    int insertSelective(WebsiteAlbum record);

    WebsiteAlbum selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(WebsiteAlbum record);

    int updateByPrimaryKey(WebsiteAlbum record);
    
    ArrayList<WebsiteAlbum> getAll();
    
    int albumCount();
    
    ArrayList<WebsiteAlbum> selectAlbumByPage( Integer pageNum, Integer getNum);
}