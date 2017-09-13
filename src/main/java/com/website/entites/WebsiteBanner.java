package com.website.entites;

public class WebsiteBanner {
    private Integer bannerId;

    private String bannerTitle;

    private String bannerUrl;

    private String bannerImageUrl;

    private String bannerThumbUrl;

    public Integer getBannerId() {
        return bannerId;
    }

    public void setBannerId(Integer bannerId) {
        this.bannerId = bannerId;
    }

    public String getBannerTitle() {
        return bannerTitle;
    }

    public void setBannerTitle(String bannerTitle) {
        this.bannerTitle = bannerTitle;
    }

    public String getBannerUrl() {
        return bannerUrl;
    }

    public void setBannerUrl(String bannerUrl) {
        this.bannerUrl = bannerUrl;
    }

    public String getBannerImageUrl() {
        return bannerImageUrl;
    }

    public void setBannerImageUrl(String bannerImageUrl) {
        this.bannerImageUrl = bannerImageUrl;
    }

    public String getBannerThumbUrl() {
        return bannerThumbUrl;
    }

    public void setBannerThumbUrl(String bannerThumbUrl) {
        this.bannerThumbUrl = bannerThumbUrl;
    }
}