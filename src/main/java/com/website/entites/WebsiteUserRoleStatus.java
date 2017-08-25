package com.website.entites;

/**
 * Created by hdy on 2017/8/24.
 * 用于封装 用户 角色 状态
 */
public class WebsiteUserRoleStatus {

    //当前页码
    private Integer page;
    //一共多少页码
    private Integer pageCount;
    //一共有多少数据
    private Integer count;
    private WebsiteUser user;
    private WebsiteRole role;
    private WebsiteStatus status;


    public WebsiteUserRoleStatus(WebsiteUser user, WebsiteRole role, WebsiteStatus status) {
        this.user = user;
        this.role = role;
        this.status = status;
    }

    public WebsiteUser getUser() {
        return user;
    }

    public void setUser(WebsiteUser user) {
        this.user = user;
    }

    public WebsiteRole getRole() {
        return role;
    }

    public void setRole(WebsiteRole role) {
        this.role = role;
    }

    public WebsiteStatus getStatus() {
        return status;
    }

    public void setStatus(WebsiteStatus status) {
        this.status = status;
    }

    public Integer getPage() {
        return page;
    }

    public void setPage(Integer page) {
        this.page = page;
    }

    public Integer getPageCount() {
        return pageCount;
    }

    public void setPageCount(Integer pageCount) {
        this.pageCount = pageCount;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    @Override
    public String toString() {
        return "WebsiteUserRoleStatus{" +
                "page=" + page +
                ", pageCount=" + pageCount +
                ", count=" + count +
                ", user=" + user +
                ", role=" + role +
                ", status=" + status +
                '}';
    }
}
