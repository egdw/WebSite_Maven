package com.website.service;

import com.website.entites.WebsiteMusic;
import com.website.mapper.WebsiteMusicMapper;
import com.website.utils.ConstantClass;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

/**
 * Created by hdy on 2017/8/9.
 * 音乐服务
 */
@Service
@Transactional
public class WebSiteMusicService {
    @Autowired
    private WebsiteMusicMapper mapper;


    public boolean addMusic(WebsiteMusic websiteMusic) {
        int insert = mapper.insert(websiteMusic);
        return insert > 0 ? true : false;
    }

    public boolean removeMusic(Long id) {
        int i = mapper.deleteByPrimaryKey(id);
        return i > 0 ? true : false;
    }

    /**
     * 查找用户音乐收藏信息
     *
     * @param page   当前页码
     * @param userId 用户id
     * @return 返回的音乐信息
     */
    public ArrayList<WebsiteMusic> find(int page, Long userId) {
        ArrayList<WebsiteMusic> music = mapper.selectByPageNum(page * ConstantClass.MUSIC_GET_NUM, ConstantClass.MUSIC_GET_NUM, userId);
        return music;
    }

    public ArrayList<WebsiteMusic> findAll(Long userId) {
        ArrayList<WebsiteMusic> all = mapper.findAll(userId);
        return all;
    }
}
