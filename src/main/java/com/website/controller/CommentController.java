package com.website.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.website.entites.WebsiteComment;
import com.website.service.WebSiteBlogService;
import com.website.service.WebSiteCommentService;

@Controller
@RequestMapping("comment")
public class CommentController {

	@Autowired
	private WebSiteCommentService commentService;
	@Autowired
	private WebSiteBlogService blogService;
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public String add(Integer blogId, String content, String email,
			String username) {
		if (blogId == null || content == null || email == null
				|| username == null || content.isEmpty() || email.isEmpty()
				| username.isEmpty()) {
			return "error";
		}
		//判断是否植入了脚本语言
		if(content.contains("<script>")||content.contains("</script>")){
			return "error";
		}
		commentService.addComment(blogId, content, email, username);
		return "success";
	}

	@RequestMapping(value = "del", method = RequestMethod.GET)
	@ResponseBody
	public String del(Integer comentId) {
		WebsiteComment comment = commentService.getCommentById(comentId);
		if(comment==null){
			return "error";
		}
		Integer blogId = comment.getBlogId();
		boolean b = commentService.delComment(comentId);
		if(b){
			boolean c = blogService.updateCommentTimes(blogId, true);
			if(c){
				return "success";
			}
			return "error";
		}else{
			return "error";
		}
	}

	@RequestMapping("get")
	@ResponseBody
	public ArrayList<WebsiteComment> get(Integer blogId) {
		if (blogId != null) {
			ArrayList<WebsiteComment> list = commentService
					.selectCommentByBlogId(blogId);
			return list;
		}
		return null;
	}

}