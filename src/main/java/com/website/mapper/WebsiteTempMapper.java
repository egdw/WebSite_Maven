package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteFunny;
import com.website.entites.WebsiteTemp;

public interface WebsiteTempMapper {
	int deleteByPrimaryKey(Long tempId);

	int insert(WebsiteTemp record);

	int insertSelective(WebsiteTemp record);

	WebsiteTemp selectByPrimaryKey(Long tempId);

	int updateByPrimaryKeySelective(WebsiteTemp record);

	int updateByPrimaryKeyWithBLOBs(WebsiteTemp record);

	int updateByPrimaryKey(WebsiteTemp record);

	ArrayList<WebsiteTemp> getAll();

	int getTempNum();

	ArrayList<WebsiteTemp> selectByPageNum(Integer pageNum, Integer getNum);
}