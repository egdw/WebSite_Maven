package com.website.entites;

public class WebsiteUserStatus {
    private Long websiteStatusUserId;

    private Long websiteStatusId;

    private Long websiteUserId;

    public WebsiteUserStatus(Long websiteStatusUserId, Long websiteStatusId, Long websiteUserId) {
        this.websiteStatusUserId = websiteStatusUserId;
        this.websiteStatusId = websiteStatusId;
        this.websiteUserId = websiteUserId;
    }

    public WebsiteUserStatus() {
    }

    public Long getWebsiteStatusUserId() {
        return websiteStatusUserId;
    }

    public void setWebsiteStatusUserId(Long websiteStatusUserId) {
        this.websiteStatusUserId = websiteStatusUserId;
    }

    public Long getWebsiteStatusId() {
        return websiteStatusId;
    }

    public void setWebsiteStatusId(Long websiteStatusId) {
        this.websiteStatusId = websiteStatusId;
    }

    public Long getWebsiteUserId() {
        return websiteUserId;
    }

    public void setWebsiteUserId(Long websiteUserId) {
        this.websiteUserId = websiteUserId;
    }

    @Override
    public String toString() {
        return "WebsiteUserStatus{" +
                "websiteStatusUserId=" + websiteStatusUserId +
                ", websiteStatusId=" + websiteStatusId +
                ", websiteUserId=" + websiteUserId +
                '}';
    }
}