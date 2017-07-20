package com.website.controller;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.website.entites.WebsiteProject;
import com.website.service.WebSiteProjectService;

@Controller
@RequestMapping("project")
public class MyTempController {
	@Autowired
	private WebSiteProjectService service;

	/**
	 * 添加工程
	 * @param record
	 * @return
	 */
	@RequestMapping(value = "temp.do", method = RequestMethod.POST)
	@ResponseBody
	public String addProject(WebsiteProject record) {
		boolean add = service.add(record);
		if(add){
			return "success";
		}else{
			return "error";
		}
	}
	
	/**
	 * 通过id过去工程
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "temp.do", method = RequestMethod.GET)
	@ResponseBody
	public WebsiteProject getProject(Long id) {
		WebsiteProject project = service.getById(id);
		return project;
	}
	
	/**
	 * 更新工程
	 * @param project
	 * @return
	 */
	@RequestMapping(value = "temp.do", method = RequestMethod.PUT)
	@ResponseBody
	public String updateProject(WebsiteProject project) {
		boolean b = service.update(project);
		if (b) {
			return "success";
		} else {
			return "error";
		}
	}
	
	/**
	 * 删除工程
	 * @param id
	 * @return
	 */
	@RequestMapping(value = "temp.do", method = RequestMethod.DELETE)
	@ResponseBody
	public String delProject(Long id) {
		boolean del = service.del(id);
		if (del) {
			return "success";
		} else {
			return "error";
		}
	}
}
