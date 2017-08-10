package com.website.entites;

import java.util.Date;

public class WebSiteAdvices {
    private Long websiteAdvicesId;

    private Long websiteUserId;

    private Date websiteDate;

    private String websiteText;

    public Long getWebsiteAdvicesId() {
        return websiteAdvicesId;
    }

    public void setWebsiteAdvicesId(Long websiteAdvicesId) {
        this.websiteAdvicesId = websiteAdvicesId;
    }

    public Long getWebsiteUserId() {
        return websiteUserId;
    }

    public void setWebsiteUserId(Long websiteUserId) {
        this.websiteUserId = websiteUserId;
    }

    public Date getWebsiteDate() {
        return websiteDate;
    }

    public void setWebsiteDate(Date websiteDate) {
        this.websiteDate = websiteDate;
    }

    public String getWebsiteText() {
        return websiteText;
    }

    public void setWebsiteText(String websiteText) {
        this.websiteText = websiteText;
    }
}