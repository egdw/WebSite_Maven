package com.website.realm;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import com.sun.media.sound.SoftTuning;
import com.website.entites.*;
import com.website.model.InitModel;
import com.website.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

public class AuthUsernameAndPasswordRealm extends AuthorizingRealm {
    @Autowired
    private WebSiteUserService userService;
    @Autowired
    private WebSiteUserRoleService roleUserService;
    @Autowired
    private WebSIteRolePermissionService permissionService;
    @Autowired
    private WebSiteRoleService roleService;
    @Autowired
    private InitModel initModel;
    @Autowired
    private WebsiteUserStatusService userStatusService;

    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection arg0) {
        WebsiteUser user = userService.getByUsername((String) arg0
                .getPrimaryPrincipal());
        SimpleAuthorizationInfo info = new SimpleAuthorizationInfo();
        // 这里需要获取相应的用户权限了...
        WebsiteUserRoleKey id = roleUserService.getByUserId(user.getUserId());
        if (id == null) {
            return null;
        }
        // 获取到数据库中获取roleID;
        Integer roleId = id.getRoleId();
        if (roleId == null) {
            return null;
        }
        // 根据roleId获取相应的角色对象
        WebsiteRole role = roleService.getRoleById(roleId);
        if (role == null) {
            return null;
        }
        // 根据获取到的添加角色
        info.addRole(role.getRoleName());
        // 根据roleId获取相应的权限
        ArrayList<WebsiteRolePermission> list = permissionService
                .getByRoleId(roleId);
        // 获取到对应的权限信息,加入权限信息
        if (list != null && list.size() > 0) {
            for (int i = 0; i < list.size(); i++) {
                info.addStringPermission(list.get(i).getPermissions());
            }
        }
        return info;
    }

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken arg0) throws AuthenticationException {
        String principal = (String) arg0.getPrincipal();
        System.err.println(principal);
        String credentials = new String((char[]) arg0.getCredentials());
        System.out.println(credentials);
        WebsiteUser user = userService.loginByUsernamePasswd(principal,
                credentials);
        System.out.println(user.getLoginAccount() +" "+user.getLoginPasswd());
        WebsiteUserStatus status = userStatusService.selectByUserId(user.getUserId());
        if (status == null) {
            status = new WebsiteUserStatus();
            status.setWebsiteUserId(user.getUserId());
            status.setWebsiteStatusId(4l);
            userStatusService.add(status);
        }
        Long statusId = status.getWebsiteStatusId();
        if (statusId == 1) {
            //待审核
            System.out.println("待审核");
            throw new AuthenticationException("您还未通过管理员审核");
        } else if (statusId == 2) {
            //禁止登录
            System.out.println("禁止登录");
            throw new AuthenticationException("您已被禁止登录");
        }
        if (user != null) {
            SecurityUtils.getSubject().getSession().setAttribute("currentUser", user);
            return new SimpleAuthenticationInfo(principal, credentials,
                    getName());
        } else {
            System.out.println("用户密码错误");
            throw new AuthenticationException("用户名或密码错误");
        }
    }

}
