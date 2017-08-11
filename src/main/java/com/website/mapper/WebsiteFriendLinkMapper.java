package com.website.mapper;

import com.website.entites.WebsiteFriendLink;

import java.util.List;

public interface WebsiteFriendLinkMapper {
    int deleteByPrimaryKey(Integer websiteFriendLinkId);

    int insert(WebsiteFriendLink record);

    int insertSelective(WebsiteFriendLink record);

    WebsiteFriendLink selectByPrimaryKey(Integer websiteFriendLinkId);

    int updateByPrimaryKeySelective(WebsiteFriendLink record);

    int updateByPrimaryKey(WebsiteFriendLink record);

    List<WebsiteFriendLink> getAll();
}