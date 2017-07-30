package com.website.realm;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.springframework.beans.factory.annotation.Autowired;

import com.website.entites.WebsiteRole;
import com.website.entites.WebsiteRolePermission;
import com.website.entites.WebsiteUser;
import com.website.entites.WebsiteUserRoleKey;
import com.website.service.WebSIteRolePermissionService;
import com.website.service.WebSiteRoleService;
import com.website.service.WebSiteUserRoleService;
import com.website.service.WebSiteUserService;

public class AuthUsernameAndPasswordRealm extends AuthorizingRealm {
	@Autowired
	private WebSiteUserService userService;
	@Autowired
	private HttpSession session;
	@Autowired
	private WebSiteUserRoleService roleUserService;
	@Autowired
	private WebSIteRolePermissionService permissionService;
	@Autowired
	private WebSiteRoleService roleService;

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
		System.out.println(role.getRoleName());
		// 根据roleId获取相应的权限
		ArrayList<WebsiteRolePermission> list = permissionService
				.getByRoleId(roleId);
		System.out.println(list);
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
		String credentials = new String((char[]) arg0.getCredentials());
		WebsiteUser user = userService.loginByUsernamePasswd(principal,
				credentials);
		if (user != null) {
			session.setAttribute("currentUser", user);
			return new SimpleAuthenticationInfo(principal, credentials,
					getName());
		}else{
			throw new AuthenticationException("用户名或密码错误");
		}
	}

}
