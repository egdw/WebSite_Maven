package com.website.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.entites.WebsiteBlog;
import com.website.mapper.WebsiteBlogMapper;
import com.website.utils.ConstantClass;

@Service
public class WebSiteBlogService {
	@Autowired
	private WebsiteBlogMapper mapper;

	@Transactional
	public boolean addBlog(WebsiteBlog record) {
		record.setAgreeWithTimes(0);
		record.setClickTimes(0);
		record.setCommentTimes(0);
		int insert = mapper.insert(record);
		if (insert > 0) {
			return true;
		} else {
			return false;
		}
	}

	public WebsiteBlog getBlogById(Integer id) {
		WebsiteBlog blog = mapper.selectByPrimaryKey(id);
		return blog;
	}

	@Transactional
	public boolean update(WebsiteBlog record) {
		int i = mapper.updateByPrimaryKey(record);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}

	@Transactional
	public boolean delete(Integer id) {
		int i = mapper.deleteByPrimaryKey(id);
		if (i > 0) {
			return true;
		} else {
			return false;
		}
	}

	public WebsiteBlog query(Integer id) {
		WebsiteBlog blog = mapper.selectByPrimaryKey(id);
		return blog;
	}

	public Integer getProjectNum(Integer type) {
		int num = 0;
		if (type == null) {
			num = mapper.getBLogNum();
		} else {
			num = mapper.getBlogNumByType(type);
		}
		// 获取到所有项目的数量
		return num;
	}

	/**
	 * 获取分页
	 * 
	 * @return
	 */
	public Integer getPageNum(Integer type) {
		Integer num = getProjectNum(type);
		int page = 0;
		if (num % ConstantClass.EVERT_PROJECT_GET_NUM == 0) {
			page = num / ConstantClass.EVERT_PROJECT_GET_NUM;
		} else {
			page = num / ConstantClass.EVERT_PROJECT_GET_NUM + 1;
		}
		return page;
	}

	public ArrayList<WebsiteBlog> selectBlogByNum(Integer pageNum, Integer type) {
		ArrayList<WebsiteBlog> arrayList = null;
		if (type == null) {
			arrayList = mapper.selectByPageNum(pageNum
					* ConstantClass.EVERT_PROJECT_GET_NUM,
					ConstantClass.EVERT_PROJECT_GET_NUM);
		} else {
			arrayList = mapper.selectByPageNumByType(pageNum
					* ConstantClass.EVERT_PROJECT_GET_NUM,
					ConstantClass.EVERT_PROJECT_GET_NUM, type);
		}
		return arrayList;
	}

	public ArrayList<WebsiteBlog> getAll() {
		ArrayList<WebsiteBlog> list = mapper.getAll();
		return list;
	}

	@Transactional
	public boolean updateClickTimes(Integer id) {
		WebsiteBlog blog = getBlogById(id);
		if (blog != null) {
			Integer times = blog.getClickTimes();
			if (times == null) {
				times = 1;
			}
			blog.setClickTimes(++times);
		}else{
			return false;
		}
		boolean b = update(blog);
		return b;
	}
	
	@Transactional
	public boolean updateAgreeTimes(Integer id){
		WebsiteBlog blog = getBlogById(id);
		if (blog != null) {
			Integer times = blog.getAgreeWithTimes();
			if (times == null) {
				times = 1;
			}
			blog.setAgreeWithTimes(++times);
		}else{
			return false;
		}
		boolean b = update(blog);
		return b;
	}
	
	/**
	 * 更新评论数字段
	 * @param id 文章的id
	 * @param isDelete 是否删除还是增加
	 * @return
	 */
	@Transactional
	public boolean updateCommentTimes(Integer id,boolean isDelete){
		WebsiteBlog blog = getBlogById(id);
		if (blog != null) {
			Integer times = blog.getCommentTimes();
			if (times == null) {
				times = 1;
			}
			if(isDelete){
				blog.setCommentTimes(--times);
			}else{
				blog.setCommentTimes(++times);
			}
		}else{
			return false;
		}
		boolean b = update(blog);
		return b;
	}
	
	public ArrayList<WebsiteBlog> selectBlogByNumAndComment(Integer returnNum){
		ArrayList<WebsiteBlog> list = mapper.selectBlogByNumAndComment(returnNum);
		return list;
	}
	
	public ArrayList<WebsiteBlog> selectBlogByNumAndReader(Integer returnNum){
		ArrayList<WebsiteBlog> list = mapper.selectBlogByNumAndReader(returnNum);
		return list;
	}
	
	/**
	 * 通过关键词查找对应的内容
	 */
	public ArrayList<WebsiteBlog> find(String name){
		ArrayList<WebsiteBlog> list = mapper.findBlogByName(name);
		return list;
	}
}
