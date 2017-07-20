package com.website.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.website.entites.WebsiteAlbum;
import com.website.mapper.WebsiteAlbumMapper;
import com.website.utils.ConstantClass;

@Service
public class WebSiteAlbumService {
	@Autowired
	private WebsiteAlbumMapper mapper;

	@Transactional
	public boolean addAlbum(WebsiteAlbum album) {
		int i = mapper.insert(album);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Transactional
	public boolean delAlbum(Integer id) {
		int i = mapper.deleteByPrimaryKey(id);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Transactional
	public boolean updateAlbum(WebsiteAlbum album) {
		int i = mapper.updateByPrimaryKey(album);
		if (i > 0) {
			return true;
		}
		return false;
	}

	public WebsiteAlbum getAlbum(Integer id) {
		WebsiteAlbum album = mapper.selectByPrimaryKey(id);
		return album;
	}

	public Integer getAlbumNum() {
		int num = mapper.albumCount();
		return num;
	}

	/**
	 * @param i
	 *            自定义获取数量
	 * @return
	 */
	public Integer getPageNum(Integer i) {
		Integer num = getAlbumNum();
		if (num == null) {
			num = 0;
		}
		int page = 0;
		if (i != null) {
			if (num % i == 0) {
				page = num / i;
			} else {
				page = num / i + 1;
			}
		} else {
			if (num % ConstantClass.EVERT_PROJECT_GET_NUM == 0) {
				page = num / ConstantClass.EVERT_PROJECT_GET_NUM;
			} else {
				page = num / ConstantClass.EVERT_PROJECT_GET_NUM + 1;
			}
		}
		return page;
	}
	
	public ArrayList<WebsiteAlbum> getAll(){
		return mapper.getAll();
	}
	
	public ArrayList<WebsiteAlbum> selectAlbumbyPage(Integer pageNum, Integer i) {
		ArrayList<WebsiteAlbum> selectAlbumByPage = null;
		if (i != null) {
			selectAlbumByPage = mapper.selectAlbumByPage(pageNum * i, i);
		} else {
			selectAlbumByPage = mapper.selectAlbumByPage(pageNum
					* ConstantClass.EVERT_PROJECT_GET_NUM,
					ConstantClass.EVERT_PROJECT_GET_NUM);
		}
		return selectAlbumByPage;
	}
}
