package com.website.service;

import com.website.entites.WebsiteAdvices;
import com.website.mapper.WebSiteAdvicesMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * Created by hdy on 2017/8/9.
 * 建议服务
 */
@Service
@Transactional
public class WebSiteAdvicesService {
    @Autowired
    private WebSiteAdvicesMapper mapper;

    public boolean add(WebsiteAdvices advices) {
        int i = mapper.insert(advices);
        return i > 0 ? true : false;
    }

    public boolean del(Long id) {
        int i = mapper.deleteByPrimaryKey(id);
        return i > 0 ? true : false;
    }


}


