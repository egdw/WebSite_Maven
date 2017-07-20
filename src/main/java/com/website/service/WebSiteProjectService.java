package com.website.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.entites.WebsiteProject;
import com.website.mapper.WebsiteProjectMapper;
import com.website.utils.ConstantClass;

@Service
public class WebSiteProjectService {
	@Autowired
	private WebsiteProjectMapper mapper;

	public ArrayList<WebsiteProject> getAll() {
		ArrayList<WebsiteProject> list = mapper.getAll();
		return list;
	}

	@Transactional
	public boolean del(Long id) {
		if (id != null) {
			int i = mapper.deleteByPrimaryKey(id);
			if (i > 0) {
				return true;
			}
			return false;
		} else {
			return false;
		}
	}

	@Transactional
	public boolean update(WebsiteProject record) {
		if (record != null) {
			int i = mapper.updateByPrimaryKey(record);
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	@Transactional
	public boolean add(WebsiteProject record) {
		if (record != null) {
			int i = mapper.insert(record);
			if (i > 0) {
				return true;
			} else {
				return false;
			}
		}
		return false;
	}

	public WebsiteProject getById(Long id) {
		WebsiteProject project = mapper.selectByPrimaryKey(id);
		return project;
	}

	public Integer getProjectNum() {
		int num = mapper.getProjectNum();
		// 获取到所有项目的数量
		return num;
	}

	/**
	 * 获取能分页的页数
	 * 
	 * @return
	 */
	public Integer getPageNum() {
		Integer num = getProjectNum();
		int page = 0;
		if(num%ConstantClass.EVERT_PROJECT_GET_NUM==0){
			page = num / ConstantClass.EVERT_PROJECT_GET_NUM;
		}else{
			page = num / ConstantClass.EVERT_PROJECT_GET_NUM + 1;
		}
		return page;
	}

	/**
	 * 分页操作
	 * 
	 * @param pageNum
	 *            页码
	 * @return
	 */
	public ArrayList<WebsiteProject> selectProjectByNum(Integer pageNum) {
		ArrayList<WebsiteProject> list = mapper.selectByPageNum(pageNum
				* ConstantClass.EVERT_PROJECT_GET_NUM,
				ConstantClass.EVERT_PROJECT_GET_NUM);
		return list;
	}
}
