package com.website.service;

import com.website.entites.WebsiteFriendLink;
import com.website.mapper.WebsiteFriendLinkMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by hdy on 2017/8/11.
 */
@Service
@Transactional
public class WebSiteFriendLinkService {
    @Autowired
    private WebsiteFriendLinkMapper mapper;

    public boolean addLink(WebsiteFriendLink link) {
        int i = mapper.insert(link);
        return i > 0 ? true : false;
    }

    public boolean delLink(Integer id) {
        int i = mapper.deleteByPrimaryKey(id);
        return i > 0 ? true : false;
    }

    public boolean updateLink(WebsiteFriendLink link) {
        int i = mapper.updateByPrimaryKey(link);
        return i > 0 ? true : false;
    }

    public List<WebsiteFriendLink> getAll() {
        List<WebsiteFriendLink> all =
                mapper.getAll();
        return all;
    }
}
