package com.website.entites;

import java.util.Date;

public class WebsiteBlog {
    private Integer id;

    private String title;

    private Byte type;

    private Integer clickTimes;

    private Date createTime;

    private Integer commentTimes;

    private Integer agreeWithTimes;

    private String picUrl;

    private String content;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public Integer getClickTimes() {
        return clickTimes;
    }

    public void setClickTimes(Integer clickTimes) {
        this.clickTimes = clickTimes;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getCommentTimes() {
        return commentTimes;
    }

    public void setCommentTimes(Integer commentTimes) {
        this.commentTimes = commentTimes;
    }

    public Integer getAgreeWithTimes() {
        return agreeWithTimes;
    }

    public void setAgreeWithTimes(Integer agreeWithTimes) {
        this.agreeWithTimes = agreeWithTimes;
    }

    public String getPicUrl() {
        return picUrl;
    }

    public void setPicUrl(String picUrl) {
        this.picUrl = picUrl;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

	@Override
	public String toString() {
		return "WebsiteBlog [id=" + id + ", title=" + title + ", type=" + type
				+ ", clickTimes=" + clickTimes + ", createTime=" + createTime
				+ ", commentTimes=" + commentTimes + ", agreeWithTimes="
				+ agreeWithTimes + ", picUrl=" + picUrl + ", content="
				+ content + "]";
	}
    
    
}