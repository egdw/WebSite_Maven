package com.website.entites;

import java.util.Date;

public class WebsiteTemp {
    private Long tempId;

    private String tempUrl;

    private String tempTopic;

    private String tempText;

    private Date tempCreateDate;

    private byte[] tempImg;

    public Long getTempId() {
        return tempId;
    }

    public void setTempId(Long tempId) {
        this.tempId = tempId;
    }

    public String getTempUrl() {
        return tempUrl;
    }

    public void setTempUrl(String tempUrl) {
        this.tempUrl = tempUrl;
    }

    public String getTempTopic() {
        return tempTopic;
    }

    public void setTempTopic(String tempTopic) {
        this.tempTopic = tempTopic;
    }

    public String getTempText() {
        return tempText;
    }

    public void setTempText(String tempText) {
        this.tempText = tempText;
    }

    public Date getTempCreateDate() {
        return tempCreateDate;
    }

    public void setTempCreateDate(Date tempCreateDate) {
        this.tempCreateDate = tempCreateDate;
    }

    public byte[] getTempImg() {
        return tempImg;
    }

    public void setTempImg(byte[] tempImg) {
        this.tempImg = tempImg;
    }
}