package com.website.service;

import com.website.entites.WebsiteUserStatus;
import com.website.mapper.WebsiteUserStatusMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * Created by hdy on 2017/8/25.
 */
@Service
@Transactional
public class WebsiteUserStatusService {
    @Autowired
    private WebsiteUserStatusMapper mapper;


    public WebsiteUserStatus selectByUserId(Long userId) {
        WebsiteUserStatus status =
                mapper.selectByUserId(userId);
        return status;
    }

    public ArrayList<WebsiteUserStatus> selectByStatusId(Long statusId) {
        ArrayList<WebsiteUserStatus> statuses =
                mapper.selectByStatusId(statusId);
        return statuses;
    }

    public boolean del(Long id) {
        int i = mapper.deleteByPrimaryKey(id);
        return i > 0 ? true : false;
    }

    public boolean update(WebsiteUserStatus userStatus) {
        int i = mapper.updateByPrimaryKeySelective(userStatus);
        return i > 0 ? true : false;
    }

    public void add(WebsiteUserStatus status) {
        int insert = mapper.insert(status);
    }
}
