package com.website.mapper;

import java.util.ArrayList;

import com.website.entites.WebsiteBlog;

public interface WebsiteBlogMapper {
	int deleteByPrimaryKey(Integer id);

	int insert(WebsiteBlog record);

	int insertSelective(WebsiteBlog record);

	WebsiteBlog selectByPrimaryKey(Integer id);

	int updateByPrimaryKeySelective(WebsiteBlog record);

	int updateByPrimaryKeyWithBLOBs(WebsiteBlog record);

	int updateByPrimaryKey(WebsiteBlog record);

	ArrayList<WebsiteBlog> getAll();

	int getBLogNum();

	// 不按分类从文章中选择类型
	ArrayList<WebsiteBlog> selectByPageNum(Integer pageNum, Integer getNum);

	// 按分了从文章中选择类型
	ArrayList<WebsiteBlog> selectByPageNumByType(Integer pageNum,
			Integer getNum, Integer type);

	// 根据分类获取博客的数量
	int getBlogNumByType(Integer type);

	// 根据关键词搜索数据库内容
	ArrayList<WebsiteBlog> findBlogByName(String name);

	// 根据阅读返回相应的数据
	ArrayList<WebsiteBlog> selectBlogByNumAndReader(Integer returnNum);

	// 根据评论返回相应的数据
	ArrayList<WebsiteBlog> selectBlogByNumAndComment(Integer returnNum);
}