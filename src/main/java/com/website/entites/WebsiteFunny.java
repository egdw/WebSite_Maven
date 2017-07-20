package com.website.entites;

import java.util.Date;

public class WebsiteFunny {
    private Long funnyId;

    private String funnyUrl;

    private String funnyTopic;

    private String funnyText;

    private Date funnyCreateDate;

    private byte[] funnyImg;

    public Long getFunnyId() {
        return funnyId;
    }

    public void setFunnyId(Long funnyId) {
        this.funnyId = funnyId;
    }

    public String getFunnyUrl() {
        return funnyUrl;
    }

    public void setFunnyUrl(String funnyUrl) {
        this.funnyUrl = funnyUrl;
    }

    public String getFunnyTopic() {
        return funnyTopic;
    }

    public void setFunnyTopic(String funnyTopic) {
        this.funnyTopic = funnyTopic;
    }

    public String getFunnyText() {
        return funnyText;
    }

    public void setFunnyText(String funnyText) {
        this.funnyText = funnyText;
    }

    public Date getFunnyCreateDate() {
        return funnyCreateDate;
    }

    public void setFunnyCreateDate(Date funnyCreateDate) {
        this.funnyCreateDate = funnyCreateDate;
    }

    public byte[] getFunnyImg() {
        return funnyImg;
    }

    public void setFunnyImg(byte[] funnyImg) {
        this.funnyImg = funnyImg;
    }
}