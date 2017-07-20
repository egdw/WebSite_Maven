package com.website.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.website.entites.WebsiteFunny;
import com.website.entites.WebsiteProject;
import com.website.mapper.WebsiteFunnyMapper;
import com.website.utils.ConstantClass;

@Service
public class WebSiteFunnyService {
	@Autowired
	private WebsiteFunnyMapper mapper;

	public ArrayList<WebsiteFunny> getAll() {
		ArrayList<WebsiteFunny> list = mapper.getAll();
		return list;
	}

	@Transactional
	public boolean insertFunny(WebsiteFunny record) {
		int i = mapper.insert(record);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Transactional
	public boolean updateFunny(WebsiteFunny record) {
		int i = mapper.updateByPrimaryKey(record);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Transactional
	public boolean delFunny(Long id) {
		int i = mapper.deleteByPrimaryKey(id);
		if (i > 0) {
			return true;
		}
		return false;
	}

	public WebsiteFunny getById(Long id) {
		WebsiteFunny key = mapper.selectByPrimaryKey(id);
		return key;
	}

	public Integer getProjectNum() {
		int num = mapper.getFunnyNum();
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
		if (num % ConstantClass.EVERT_PROJECT_GET_NUM == 0) {
			page = num / ConstantClass.EVERT_PROJECT_GET_NUM;
		} else {
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
	public ArrayList<WebsiteFunny> selectProjectByNum(Integer pageNum) {
		ArrayList<WebsiteFunny> list = mapper.selectByPageNum(pageNum
				* ConstantClass.EVERT_PROJECT_GET_NUM,
				ConstantClass.EVERT_PROJECT_GET_NUM);
		return list;
	}

	public void delFunnyFileByName(String url) {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		String path = request.getRealPath("upload/funny_temp/");
		String path2 = request.getRealPath("upload/funny/");
		File file = new File(path + "/" + url);
		File file2 = new File(path2 + "/" + url);
		if (file.exists()) {
			deleteFile(file);
		}
		if (file2.exists()) {
			deleteFile(file2);
		}
	}

	// 递归删除文件夹
	private void deleteFile(File file) {
		if (file.exists()) {// 判断文件是否存在
			if (file.isFile()) {// 判断是否是文件
				file.delete();// 删除文件
			} else if (file.isDirectory()) {// 否则如果它是一个目录
				File[] files = file.listFiles();// 声明目录下所有的文件 files[];
				for (int i = 0; i < files.length; i++) {// 遍历目录下所有的文件
					this.deleteFile(files[i]);// 把每个文件用这个方法进行迭代
				}
				file.delete();// 删除文件夹
			}
		}
	}
}
