package com.website.controller;

import com.alibaba.fastjson.JSON;
import com.website.entites.*;
import com.website.model.Message;
import com.website.service.*;
import org.apache.shiro.subject.Subject;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Date;

@Controller
@RequestMapping("userController")
public class UserController {
    @Autowired
    private WebSiteUserService service;
    @Autowired
    private WebSiteRoleService roleService;
    @Autowired
    private WebSiteUserRoleService userRoleService;
    @Autowired
    private WebsiteUserStatusService userStatusService;
    @Autowired
    private WebsiteStatusService statusService;

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(String username, String email, String phone,
                         String newPassword) {
        boolean isChangePassword = false;
        Subject subject = SecurityUtils.getSubject();
        String id = (String) subject.getPrincipal();
        WebsiteUser user = service.getByUsername(id);
        if (newPassword != null && !newPassword.isEmpty()) {
            isChangePassword = true;
            user.setLoginPasswd(newPassword);
        }
        if (username != null) {
            user.setUserName(username);
        }
        if (email != null) {
            user.setUserEmail(email);
        }
        if (phone != null) {
            user.setUserPhone(phone);
        }
        boolean updateUser = service.updateUser(user);
        if (updateUser && isChangePassword) {
            Subject subject2 = SecurityUtils.getSubject();
            subject2.logout();
            return "redirect:/login/login.jsp";
        }
        return "redirect:/manager/manager_person_setting.do";
    }


    /**
     * 进行用户的角色修改
     *
     * @param userId 用户id
     * @param roleId 角色id
     */
    @RequestMapping(value = "/updateRole", method = RequestMethod.PUT)
    @ResponseBody
    public void updateRole(@RequestParam(required = true) Long userId, @RequestParam(required = true) Long roleId) {

    }


    /**
     * 进行用户的状态更改
     *
     * @param userId   用户id
     * @param statusId 角色id
     */
    @RequestMapping(value = "/updateStatus", method = RequestMethod.PUT)
    @ResponseBody
    public void updateStatus(@RequestParam(required = true) Long userId, @RequestParam(required = true) Long statusId) {

    }


    @RequestMapping(value = "findByStatus", method = RequestMethod.GET)
    @ResponseBody
    public String findByStatus(@RequestParam(required = true) Long statusId) {
        ArrayList<WebsiteUserStatus> statuses = userStatusService.selectByStatusId(statusId);
        ArrayList<WebsiteUserRoleStatus> roleStatuses = new ArrayList<WebsiteUserRoleStatus>();
        for (int i = 0; i < statuses.size(); i++) {
            WebsiteUserStatus status = statuses.get(i);
            Long userId = status.getWebsiteUserId();
            WebsiteUser user = service.getUserById(userId);
            WebsiteUserRoleKey userRoleServiceByUserId = userRoleService.getByUserId(user.getUserId());
            WebsiteRole role = null;
            if (userRoleServiceByUserId != null) {
                role = roleService.getRoleById(userRoleServiceByUserId.getRoleId());
            } else {
                role = new WebsiteRole();
                role.setRoleName("游客");
            }
            WebsiteUserStatus websiteUserStatus = userStatusService.selectByUserId(user.getUserId());
            WebsiteStatus websiteStatus = null;
            if (websiteUserStatus != null) {
                websiteStatus = statusService.selectById(websiteUserStatus.getWebsiteStatusId());
            } else {
                websiteStatus = new WebsiteStatus(0l, "审核通过");
            }
            WebsiteUserRoleStatus roleStatus = new WebsiteUserRoleStatus(user, role, websiteStatus);
            roleStatuses.add(roleStatus);
        }
        return JSON.toJSONString(roleStatuses);
    }

    /**
     * 分类查找状态
     *
     * @param roleId 角色id
     * @return
     */
    @RequestMapping(value = "findByRole", method = RequestMethod.GET)
    @ResponseBody
    public String findByRole(@RequestParam(required = true) Integer roleId) {
        ArrayList<WebsiteUserRoleKey> keys = userRoleService.selectByRoleId(roleId);
        ArrayList<WebsiteUserRoleStatus> roleStatuses = new ArrayList<WebsiteUserRoleStatus>();
        if (keys != null) {
            for (int i = 0; i < keys.size(); i++) {
                WebsiteUserRoleKey key = keys.get(i);
                WebsiteUser user = service.getUserById(key.getUserId());
                WebsiteUserRoleKey userRoleServiceByUserId = userRoleService.getByUserId(user.getUserId());
                WebsiteRole role = null;
                if (userRoleServiceByUserId != null) {
                    role = roleService.getRoleById(userRoleServiceByUserId.getRoleId());
                } else {
                    role = new WebsiteRole();
                    role.setRoleName("游客");
                }
                WebsiteUserStatus websiteUserStatus = userStatusService.selectByUserId(user.getUserId());
                WebsiteStatus websiteStatus = null;
                if (websiteUserStatus != null) {
                    websiteStatus = statusService.selectById(websiteUserStatus.getWebsiteStatusId());
                } else {
                    websiteStatus = new WebsiteStatus(0l, "审核通过");
                }
                WebsiteUserRoleStatus roleStatus = new WebsiteUserRoleStatus(user, role, websiteStatus);
                roleStatuses.add(roleStatus);
            }

        }
        return JSON.toJSONString(roleStatuses);
    }

    /**
     * 通过参数查找用户
     *
     * @param name 用户名 或 关键词
     * @param type 类型 0 关键词 1 用户名
     * @return
     */
    @RequestMapping(value = "findByName", method = RequestMethod.GET)
    @ResponseBody
    public String findByName(@RequestParam(required = true) String name, @RequestParam(required = true) Integer type) {
        ArrayList<WebsiteUserRoleStatus> roleStatuses = new ArrayList<WebsiteUserRoleStatus>();
        if (type == 0) {
            ArrayList<WebsiteUser> search = service.getBySearch(name);
            if (search == null || search.size() == 0) {
                return JSON.toJSONString(roleStatuses);
            }
            for (int i = 0; i < search.size(); i++) {
                WebsiteUser user = search.get(i);
                Long userId = user.getUserId();
                WebsiteUserRoleKey userRoleServiceByUserId = userRoleService.getByUserId(userId);
                WebsiteRole role = null;
                if (userRoleServiceByUserId != null) {
                    role = roleService.getRoleById(userRoleServiceByUserId.getRoleId());
                } else {
                    role = new WebsiteRole();
                    role.setRoleName("游客");
                }
                WebsiteUserStatus websiteUserStatus = userStatusService.selectByUserId(userId);
                WebsiteStatus websiteStatus = null;
                if (websiteUserStatus != null) {
                    websiteStatus = statusService.selectById(websiteUserStatus.getWebsiteStatusId());
                } else {
                    websiteStatus = new WebsiteStatus(0l, "审核通过");
                }
                WebsiteUserRoleStatus roleStatus = new WebsiteUserRoleStatus(user, role, websiteStatus);
                roleStatuses.add(roleStatus);
            }
        } else {
            WebsiteUser user = service.getByUsername(name);
            if (user == null) {
                return JSON.toJSONString(roleStatuses);
            }
            Long userId = user.getUserId();
            WebsiteUserRoleKey userRoleServiceByUserId = userRoleService.getByUserId(userId);
            WebsiteRole role = null;
            if (userRoleServiceByUserId != null) {
                role = roleService.getRoleById(userRoleServiceByUserId.getRoleId());
            } else {
                role = new WebsiteRole();
                role.setRoleName("游客");
            }
            WebsiteUserStatus websiteUserStatus = userStatusService.selectByUserId(userId);
            WebsiteStatus websiteStatus = null;
            if (websiteUserStatus != null) {
                websiteStatus = statusService.selectById(websiteUserStatus.getWebsiteStatusId());
            } else {
                websiteStatus = new WebsiteStatus(0l, "审核通过");
            }
            WebsiteUserRoleStatus roleStatus = new WebsiteUserRoleStatus(user, role, websiteStatus);
            roleStatuses.add(roleStatus);
        }
        return JSON.toJSONString(roleStatuses);
    }

    /**
     * 删除用户
     *
     * @param userId 用户的id
     * @return
     */
    @RequestMapping(method = RequestMethod.DELETE)
    @ResponseBody
    public String removeUser(Long userId) {
        boolean user = service.delUser(userId);
        if (user) {
            return JSON.toJSONString(new Message(200, "删除成功", null, null, null));
        } else {
            return JSON.toJSONString(new Message(500, "删除失败", null, null, null));
        }
    }

    @RequestMapping(method = RequestMethod.GET)
    @ResponseBody
    public String getByPage(Integer page) {
        //需要加入缓存.待定....

        if (page == null) {
            page = 0;
        }
        ArrayList<WebsiteUser> users = service.getUserByNum(10, page);
        ArrayList<WebsiteUserRoleStatus> roleStatuses = new ArrayList<WebsiteUserRoleStatus>();
        int pageCount = service.getPageCount(10);
        int count = service.getUserCount();
        for (int i = 0; i < users.size(); i++) {
            WebsiteUser user = users.get(i);
            Long userId = user.getUserId();
            WebsiteUserRoleKey userRoleServiceByUserId = userRoleService.getByUserId(userId);
            WebsiteRole role = null;
            if (userRoleServiceByUserId != null) {
                role = roleService.getRoleById(userRoleServiceByUserId.getRoleId());
            } else {
                role = new WebsiteRole();
                role.setRoleName("游客");
            }
            WebsiteUserStatus websiteUserStatus = userStatusService.selectByUserId(userId);
            WebsiteStatus websiteStatus = null;
            if (websiteUserStatus != null) {
                websiteStatus = statusService.selectById(websiteUserStatus.getWebsiteStatusId());
            } else {
                websiteStatus = new WebsiteStatus(0l, "审核通过");
            }
            WebsiteUserRoleStatus roleStatus = new WebsiteUserRoleStatus(user, role, websiteStatus);
            roleStatus.setPage(page);
            roleStatus.setPageCount(pageCount);
            roleStatus.setCount(count);
            roleStatuses.add(roleStatus);
        }
        return JSON.toJSONString(roleStatuses);
    }

    @RequestMapping(method = RequestMethod.PUT)
    @ResponseBody
    public String updateUserRole(@RequestParam(required = true) Long userId, @RequestParam(required = true) Integer roleId) {
        WebsiteUser user = service.getPrimaryKeyByUser(userId);
        if (user != null) {
            //说明用户存在
            WebsiteRole roleById = roleService.getRoleById(roleId);
            WebsiteUserRoleKey userRoleKey = userRoleService.getByUserId(userId);
            if (roleById != null) {
                //说明角色存在
                if (userRoleKey == null) {
                    userRoleKey = new WebsiteUserRoleKey();
                    userRoleKey.setUserId(userId);
                    userRoleKey.setRoleId(roleId);
                }
                userRoleKey.setRoleId(roleId);
                boolean role = userRoleService.updateRole(userRoleKey);
                if (role) {
                    return JSON.toJSONString(new Message(200, "更新成功", null, null, null));
                } else {
                    return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
                }
            } else {
                return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
            }
        }
        return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
    }

    @RequestMapping(value = "updateUserStatus", method = RequestMethod.PUT)
    @ResponseBody
    public String updateUserStatus(@RequestParam(required = true) Long userId, @RequestParam(required = true) Integer statusId) {
        WebsiteUser userById = service.getUserById(userId);
        if (userById == null) {
            return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
        }
        WebsiteUserStatus websiteUserStatus = userStatusService.selectByUserId(userId);
        WebsiteStatus websiteStatus = null;
        if (websiteUserStatus != null) {
            WebsiteStatus status = statusService.selectById(statusId);
            if (status == null) {
                return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
            }
            websiteUserStatus.setWebsiteStatusId(status.getWebsiteStatusId());
            boolean update = userStatusService.update(websiteUserStatus);
            if (update) {
                websiteUserStatus = userStatusService.selectByUserId(userId);
                return JSON.toJSONString(websiteUserStatus);
            } else {
                return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
            }
        } else {
            return JSON.toJSONString(new Message(500, "更新失败", null, null, null));
        }
    }

//    @RequestMapping(method = RequestMethod.POST)
//    @ResponseBody
//    public String addUser(WebsiteUser user) {
//        if (user.getLoginAccount() != null && user.getLoginPasswd() != null) {
//            //判断用户名和密码是否为空
//            user.setRegisterDate(new Date());
//            boolean addUser = service.addUser(user);
//            if (addUser) {
//                return JSON.toJSONString(new Message(200, "添加成功", null, null, null));
//            } else {
//                return JSON.toJSONString(new Message(500, "添加失败", null, null, null));
//            }
//        }
//        return JSON.toJSONString(new Message(500, "添加失败", null, null, null));
//    }


    public WebsiteUser getIdByName(String name) {
        WebsiteUser websiteUser = service.getByUsername(name);
        return websiteUser;
    }
}
