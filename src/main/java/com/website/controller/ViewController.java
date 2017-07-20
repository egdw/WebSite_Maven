package com.website.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.website.entites.WebsiteAlbum;
import com.website.entites.WebsiteFunny;
import com.website.entites.WebsiteTemp;
import com.website.service.WebSiteAlbumService;
import com.website.service.WebSiteFunnyService;
import com.website.service.WebSiteTempService;

/**
 * 控制视图跳转的控制器
 * @author hdy
 *
 */
@Controller
public class ViewController {
	@Autowired
	private WebSiteFunnyService funnyService;
	@Autowired
	private WebSiteTempService tempService;
	@Autowired
	private WebSiteAlbumService albumService;
	
	/**
	 * 进入趣味网站主页
	 */
	@RequestMapping(value="funnyView.do")
	public String funnyView(Map<String, Object> map){
		ArrayList<WebsiteFunny> list = funnyService.getAll();
		map.put("projects", list);
		return "/project/funny_list";
	}
	
	/**
	 * 进入临时网站主页
	 */
	@RequestMapping(value="tempView.do")
	public String tempView(Map<String, Object> map){
		ArrayList<WebsiteTemp> list = tempService.getAll();
		map.put("projects", list);
		return "/project/temp_list";
	}
	
	/**
	 * 进入音乐
	 * @return
	 */
	@RequestMapping("music")
	public String music(){
		return "/music/index";
	}
	
	/**
	 * 进入博客的照片
	 */
	@RequestMapping("image")
	public String entryBlogImage(Map<String, Object> map) {
//		if (pageNum == null) {
//			pageNum = 0;
//		}
//		ArrayList<WebsiteAlbum> list = albumService.selectAlbumbyPage(pageNum,
//				16);
		ArrayList<WebsiteAlbum> list = albumService.getAll();
//		Integer num = albumService.getPageNum(16);
		map.put("list", list);
//		map.put("pageCount", num);
//		map.put("currentPage", pageNum);
		return "/blog/blog_album";
	}
}
