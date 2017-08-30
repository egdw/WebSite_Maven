package com.website.entites;

import java.io.Serializable;

public class WebsiteStatus implements Serializable {
    private Long websiteStatusId;

    private String websiteStatus;

    public WebsiteStatus(long i, String websiteStatus) {
        this.websiteStatusId = i;
        this.websiteStatus = websiteStatus;
    }

    public WebsiteStatus() {
    }

    public Long getWebsiteStatusId() {
        return websiteStatusId;
    }

    public void setWebsiteStatusId(Long websiteStatusId) {
        this.websiteStatusId = websiteStatusId;
    }

    public String getWebsiteStatus() {
        return websiteStatus;
    }

    public void setWebsiteStatus(String websiteStatus) {
        this.websiteStatus = websiteStatus;
    }
}