package com.website.service;

import java.io.File;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.website.entites.WebsiteTemp;
import com.website.mapper.WebsiteTempMapper;
import com.website.utils.ConstantClass;

@Service
public class WebSiteTempService {
	@Autowired
	private WebsiteTempMapper mapper;

	public ArrayList<WebsiteTemp> getAll() {
		ArrayList<WebsiteTemp> list = mapper.getAll();
		return list;
	}

	@Transactional
	public boolean insertTemp(WebsiteTemp temp) {
		int i = mapper.insert(temp);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@Transactional
	public boolean updateTemp(WebsiteTemp temp) {
		int i = mapper.updateByPrimaryKey(temp);
		if (i > 0) {
			return true;
		}
		return false;
	}

	@SuppressWarnings("deprecation")
	@Transactional
	public boolean delTemp(long id) {
		delTempFileById(id);
		int i = mapper.deleteByPrimaryKey(id);
		if (i > 0) {
			return true;
		}
		return false;
	}
	
	/**
	 * 用户主动删除或者出现异常时自动删除上传到服务器的文件
	 * 通过id值进行删除
	 */
	public void delTempFileById(long id){
		WebsiteTemp temp = getById(id);
		String url = temp.getTempUrl();
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		String substring = url.substring("upload/temp/".length()).substring(0,
				url.substring("upload/temp/".length()).indexOf("/"));
		String path = request.getRealPath("upload/temp_temp/");
		String path2 = request.getRealPath("upload/temp/");
		File file = new File(path + "/" + substring);
		File file2 = new File(path2 + "/" + substring);
		if (file.exists()) {
			deleteFile(file);
		}
		if(file2.exists()){
			deleteFile(file2);
		}
	}
	
	/**
	 * 用户主动删除或者出现异常时自动删除上传到服务器的文件
	 * 通过名称进行删除
	 */
	public void delTempFileByName(String url){
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
				.getRequestAttributes()).getRequest();
		String path = request.getRealPath("upload/temp_temp/");
		String path2 = request.getRealPath("upload/temp/");
		File file = new File(path + "/" + url);
		File file2 = new File(path2 + "/" + url);
		if (file.exists()) {
			deleteFile(file);
		}
		if(file2.exists()){
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

	public WebsiteTemp getById(Long id) {
		WebsiteTemp temp = mapper.selectByPrimaryKey(id);
		return temp;
	}

	public Integer getProjectNum() {
		int num = mapper.getTempNum();
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
	public ArrayList<WebsiteTemp> selectProjectByNum(Integer pageNum) {
		ArrayList<WebsiteTemp> list = mapper.selectByPageNum(pageNum
				* ConstantClass.EVERT_PROJECT_GET_NUM,
				ConstantClass.EVERT_PROJECT_GET_NUM);
		return list;
	}

}
