package com.website.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.website.entites.WebsiteUser;
import com.website.mapper.WebsiteUserMapper;
import org.springframework.transaction.annotation.Transactional;

/**
 * 用户操作Service
 *
 * @author hdy
 */
@Service
@Transactional
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
     * @param showNum 每页显示的user数量
     * @param pageNum 当前的页码
     */
    public ArrayList<WebsiteUser> getUserByNum(Integer showNum, Integer pageNum) {
        ArrayList<WebsiteUser> users = mapper.getUserByNum(showNum, showNum * pageNum);
        return users;
    }

    /**
     * 获取到所有user的数量
     */
    public Integer getUserCount() {
        Integer count = mapper.getUserCount();
        return count;
    }

    /**
     * 通过username查找用户对象
     *
     * @param username 用户名
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
    public WebsiteUser getUserById(Long id) {
        WebsiteUser user = mapper.selectByPrimaryKey(id);
        return user;
    }

    /**
     * 根据名称模糊查询
     *
     * @param regex
     */
    public ArrayList<WebsiteUser> getBySearch(String regex) {
        ArrayList<WebsiteUser> search = mapper.getBySearch(regex);
        return search;
    }

    /**
     * 根据id删除用户
     *
     * @param id
     */
    public boolean delUser(Long id) {
        int i = mapper.deleteByPrimaryKey(id);
        return i > 0 ? true : false;
    }

    /**
     * 添加新用户
     *
     * @param user 新用户对象
     */
    public boolean addUser(WebsiteUser user) {
        int i = mapper.insert(user);
        return i > 0 ? true : false;
    }

    /**
     * 更新用户
     *
     * @param user 新修改的用户对象
     */
    public boolean updateUser(WebsiteUser user) {
        int key = mapper.updateByPrimaryKey(user);
        return key > 0 ? true : false;
    }

    /**
     * 判断用户名账号密码是否正确
     *
     * @param username 用户名
     * @param passwd   用户密码
     */
    public WebsiteUser loginByUsernamePasswd(String username, String passwd) {
        WebsiteUser user = mapper.loginByUsernamePasswd(username, passwd);
        return user;
    }


    /**
     * 通过主键获取用户
     *
     * @param userid
     * @return
     */
    public WebsiteUser getPrimaryKeyByUser(Long userid) {
        WebsiteUser user = mapper.selectByPrimaryKey(userid);
        return user;
    }


    /**
     * 获取用户的数量
     *
     * @return
     */
    public int getAllNum() {
        return mapper.getUserCount();
    }

    /**
     * 获取分页的数量
     *
     * @return
     */
    public int getPageCount(int searchNum) {
        int allNum = getAllNum();
        if (allNum <= searchNum) {
            return 1;
        }
        if (allNum % searchNum == 0) {
            return allNum / searchNum;
        } else {
            return allNum / searchNum + 1;
        }
    }
}
