package com.website.service;

import com.website.entites.WebsiteStatus;
import com.website.mapper.WebsiteStatusMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * Created by hdy on 2017/8/25.
 */
@Service
@Transactional
public class WebsiteStatusService {
    @Autowired
    private WebsiteStatusMapper mapper;

    public ArrayList<WebsiteStatus> findAll(){
        ArrayList<WebsiteStatus> all = mapper.findAll();
        return all;
    }

    public WebsiteStatus selectById(long id){
        WebsiteStatus status = mapper.selectByPrimaryKey(id);
        return status;
    }
}
