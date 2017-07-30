package com.website.controller;

import java.util.ArrayList;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresRoles;
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
public class MyProjectController {
	@Autowired
	private WebSiteProjectService service;

	/**
	 * 跳转到list界面.向request中放入数据库读取的数据
	 * 
	 * @param map
	 * @return
	 */
	@RequestMapping("MyProject.do")
	public String execute(Map<String, Object> map) {
		ArrayList<WebsiteProject> list = service.getAll();
		map.put("projects", list);
		return "/project/list";
	}
	
	/**
	 * 添加工程
	 * @param record
	 * @return
	 */
	@RequiresRoles("super_admin")
	@RequestMapping(value = "project.do", method = RequestMethod.POST)
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
	@RequestMapping(value = "project.do", method = RequestMethod.GET)
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
	@RequiresRoles("super_admin")
	@RequestMapping(value = "project.do", method = RequestMethod.PUT)
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
	@RequiresRoles("super_admin")
	@RequestMapping(value = "project.do", method = RequestMethod.DELETE)
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
