package com.website.service;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.entites.WebsiteComment;
import com.website.mapper.WebsiteCommentMapper;

@Service
public class WebSiteCommentService {
	@Autowired
	private WebsiteCommentMapper mapper;
	@Autowired
	private WebSiteBlogService blogService;

	/**
	 * 添加评论
	 * 
	 * @return
	 */
	@Transactional
	public boolean addComment(Integer blogId, String content, String email,
			String username) {
		WebsiteComment record = new WebsiteComment();
		record.setAgreeWithTimes(0);
		record.setContent(content);
		record.setBlogId(blogId);
		record.setCreateTime(new Date());
		record.setEmail(email);
		record.setUsername(username);
		int i = mapper.insert(record);
		if (i > 0) {
			boolean updateCommentTimes = blogService.updateCommentTimes(blogId,
					false);
			return updateCommentTimes;
		}
		return false;
	}

	/**
	 * 删除评论.管理员通道 其他用户不能删除
	 */
	@Transactional
	public boolean delComment(Integer id) {
		WebsiteComment key = mapper.selectByPrimaryKey(id);
		if (key == null) {
			return false;
		}
		int i = mapper.deleteByPrimaryKey(id);
		if (i > 0) {
			boolean updateCommentTimes = blogService.updateCommentTimes(key.getBlogId(), true);
			return updateCommentTimes;
		}
		return false;
	}

	/**
	 * 根据博客的ID进行查询
	 * @return 查询到的COmment类的集合
	 */
	public ArrayList<WebsiteComment> selectCommentByBlogId(Integer blogId){
		ArrayList<WebsiteComment> list = mapper.selectCommentByBlogId(blogId);
		return list;
	}
	
	/**
	 * 根据评论的id获取相应的对象
	 * @return
	 */
	public WebsiteComment getCommentById(Integer id){
		WebsiteComment websiteComment = mapper.getById(id);
		return websiteComment;
	}
	
	
	public ArrayList<WebsiteComment> getCommentByNum(Integer num){
		ArrayList<WebsiteComment> list = mapper.selectCommentByNum(num);
		return list;
	}
}
