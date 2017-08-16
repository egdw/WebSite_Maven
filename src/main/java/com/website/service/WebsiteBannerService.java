package com.website.service;

import com.website.entites.WebsiteBanner;
import com.website.mapper.WebsiteBannerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by hdy on 2017/8/11.
 * Banner 管理的服务类
 */
@Service
@Transactional
public class WebsiteBannerService {
    @Autowired
    private WebsiteBannerMapper mapper;

    public List<WebsiteBanner> getAll() {
        List<WebsiteBanner> all =
                mapper.getAll();
        return all;
    }

    public boolean add(WebsiteBanner banner) {
        int i = mapper.insert(banner);
        return i > 0 ? true : false;
    }

    public boolean del(Integer id) {
        int i = mapper.deleteByPrimaryKey(id);
        return i > 0 ? true : false;
    }

    public boolean update(WebsiteBanner banner) {
        int i = mapper.updateByPrimaryKey(banner);
        return i > 0 ? true : false;
    }

    public WebsiteBanner getOne(Integer bannerId) {
        WebsiteBanner banner = mapper.selectByPrimaryKey(bannerId);
        return banner;
    }
}
