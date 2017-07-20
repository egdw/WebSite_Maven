package com.website.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteUser;
import com.website.mapper.WebsiteUserMapper;

/**
 * 用户操作Service
 * 
 * @author hdy
 * 
 */
@Service
public class WebSiteUserService {
	@Autowired
	private WebsiteUserMapper mapper;

	/**
	 * 获取所有用户
	 */
	public ArrayList<WebsiteUser> getAll() {
		ArrayList<WebsiteUser> list = mapper.getAll();
		return list;
	}

	/**
	 * 
	 * @param showNum
	 *            每页显示的user数量
	 * @param pageNum
	 *            当前的页码
	 */
	public void getUserByNum(Integer showNum, Integer pageNum) {

	}

	/**
	 * 获取到所有user的数量
	 */
	public void getUserCount() {
	}

	/**
	 * 通过username查找用户对象
	 * 
	 * @param username
	 *            用户名
	 */
	public WebsiteUser getByUsername(String username) {
		WebsiteUser user = mapper.getByUsername(username);
		return user;
	}

	/**
	 * 根据ID值获取用户
	 * 
	 * @param id
	 */
	public void getUserById(Long id) {
		WebsiteUser user = mapper.selectByPrimaryKey(id);
	}

	/**
	 * 根据名称模糊查询
	 * 
	 * @param regex
	 */
	public void getBySearch(String regex) {

	}

	/**
	 * 根据id删除用户
	 * 
	 * @param id
	 */
	public void delUser(Long id) {
		int i = mapper.deleteByPrimaryKey(id);
	}

	/**
	 * 添加新用户
	 * 
	 * @param user
	 *            新用户对象
	 */
	public void addUser(WebsiteUser user) {
		int i = mapper.insert(user);

	}

	/**
	 * 更新用户
	 * 
	 * @param user
	 *            新修改的用户对象
	 */
	public boolean updateUser(WebsiteUser user) {
		int key = mapper.updateByPrimaryKey(user);
		if(key>0){
			return true;
		}
		return false;
	}

	/**
	 * 判断用户名账号密码是否正确
	 * 
	 * @param username
	 *            用户名
	 * @param passwd
	 *            用户密码
	 */
	public WebsiteUser loginByUsernamePasswd(String username, String passwd) {
		WebsiteUser user = mapper.loginByUsernamePasswd(username, passwd);
		return user;
	}

	/**
	 * 注册用户
	 * 
	 * @param user
	 *            需要注册的用户对象
	 */
	public void registerUser(WebsiteUser user) {

	}
}
