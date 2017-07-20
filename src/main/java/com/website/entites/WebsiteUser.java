package com.website.entites;

import java.util.Date;

public class WebsiteUser {
    private Long userId;

    private String loginAccount;

    private String loginPasswd;

    private String userName;

    private String userHead;

    private String userPhone;

    private String userEmail;

    private String userSex;

    private Date userBirthday;

    private Date registerDate;

    private Boolean userPhoneVerify;

    private Boolean userEmailVerify;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getLoginAccount() {
        return loginAccount;
    }

    public void setLoginAccount(String loginAccount) {
        this.loginAccount = loginAccount;
    }

    public String getLoginPasswd() {
        return loginPasswd;
    }

    public void setLoginPasswd(String loginPasswd) {
        this.loginPasswd = loginPasswd;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserHead() {
        return userHead;
    }

    public void setUserHead(String userHead) {
        this.userHead = userHead;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserSex() {
        return userSex;
    }

    public void setUserSex(String userSex) {
        this.userSex = userSex;
    }

    public Date getUserBirthday() {
        return userBirthday;
    }

    public void setUserBirthday(Date userBirthday) {
        this.userBirthday = userBirthday;
    }

    public Date getRegisterDate() {
        return registerDate;
    }

    public void setRegisterDate(Date registerDate) {
        this.registerDate = registerDate;
    }

    public Boolean getUserPhoneVerify() {
        return userPhoneVerify;
    }

    public void setUserPhoneVerify(Boolean userPhoneVerify) {
        this.userPhoneVerify = userPhoneVerify;
    }

    public Boolean getUserEmailVerify() {
        return userEmailVerify;
    }

    public void setUserEmailVerify(Boolean userEmailVerify) {
        this.userEmailVerify = userEmailVerify;
    }
}