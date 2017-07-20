package com.website.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.website.entites.WebsiteAlbum;
import com.website.service.WebSiteAlbumService;

@Controller
@RequestMapping("album")
public class AlbumController {
	@Autowired
	private WebSiteAlbumService service;
	/**
	 * 添加图片的方法
	 */
	@RequestMapping(value = "add", method = RequestMethod.POST)
	@ResponseBody
	public String add(String pic_url, String title) {
		if (pic_url == null || pic_url.isEmpty() || title == null
				|| title.isEmpty()) {
			return "error";
		}
		WebsiteAlbum album = new WebsiteAlbum();
		album.setCreateTime(new Date());
		album.setTitle(title);
		album.setUrl(pic_url);
		int i = pic_url.lastIndexOf(File.separator);
		album.setUrlThumb((pic_url.substring(0, i + 1) + "thumb_"
				+ pic_url.substring(i + 1)).replaceAll(File.separator, "/"));
		boolean b = service.addAlbum(album);
		if (b) {
			return "success";
		}
		return "error";
	}

	/**
	 * 更新图片的方法
	 */
	@RequestMapping(value = "update", method = RequestMethod.POST)
	@ResponseBody
	public WebsiteAlbum update(WebsiteAlbum album) {
		if (album == null) {
			return null;
		}
		WebsiteAlbum selectById = selectById(album.getId());
		return selectById;
	}

	/**
	 * 删除图片的方法
	 */
	@RequestMapping(value = "del", method = RequestMethod.POST)
	@ResponseBody
	public String del(Integer id) {
		boolean b = service.delAlbum(id);
		if (b) {
			return "success";
		}
		return "error";
	}

	/**
	 * 根据ID获取图片
	 */
	@RequestMapping(value = "selectById", method = RequestMethod.POST)
	@ResponseBody
	public WebsiteAlbum selectById(Integer id) {
		WebsiteAlbum websiteAlbum = service.getAlbum(id);
		return websiteAlbum;
	}

	/**
	 * 根据页码获取文章
	 */
	@RequestMapping(value = "album", method = RequestMethod.GET)
	public String selectByPageNum(Integer pageNum, Map<String, Object> map) {
		if (pageNum == null) {
			pageNum = 0;
		}
		Integer integer = service.getPageNum(null);
		ArrayList<WebsiteAlbum> list = service.selectAlbumbyPage(pageNum, 10);
		map.put("list", list);
		map.put("pageCount", integer);
		map.put("currentPage", pageNum);
		return "/admin/admin_blog_album";
	}
	
}
