package com.website.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.website.entites.WebsiteFunny;
import com.website.service.WebSiteFunnyService;

@Controller
@RequestMapping("project")
public class MyFunnyController {
	@Autowired
	private WebSiteFunnyService service;

	/**
	 * 添加工程
	 * 
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "funny.do", method = RequestMethod.POST)
	@ResponseBody
	public String addProject(WebsiteFunny record) {
		boolean add = service.insertFunny(record);
		if (add) {
			return "success";
		} else {
			return "error";
		}
	}

	/**
	 * 通过id过去工程
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "funny.do", method = RequestMethod.GET)
	@ResponseBody
	public WebsiteFunny getProject(Long id) {
		WebsiteFunny project = service.getById(id);
		return project;
	}

	/**
	 * 更新工程
	 * 
	 * @param project
	 * @return
	 */
	@RequestMapping(value = "funny.do", method = RequestMethod.PUT)
	@ResponseBody
	public String updateProject(WebsiteFunny project) {
		boolean b = service.updateFunny(project);
		if (b) {
			return "success";
		} else {
			return "error";
		}
	}

	/**
	 * 删除工程
	 * 
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "funny.do", method = RequestMethod.DELETE)
	@ResponseBody
	public String delProject(Long id) {
		boolean del = service.delFunny(id);
		if (del) {
			return "success";
		} else {
			return "error";
		}
	}
}
