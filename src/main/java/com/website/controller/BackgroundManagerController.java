package com.website.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.website.entites.*;
import com.website.model.Message;
import com.website.service.*;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.website.utils.ZipTools;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;

@Controller
@RequestMapping("manager")
public class BackgroundManagerController {
    @Autowired
    private WebSiteUserService service;
    @Autowired
    private WebSiteProjectService projectService;
    @Autowired
    private WebSiteFunnyService funnyService;
    @Autowired
    private WebSiteTempService tempService;
    @Autowired
    private WebsiteBannerService bannerService;
    @Autowired
    private WebSiteFriendLinkService linkService;
    @Autowired
    private JedisPool jedisPool;

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

    @RequiresRoles("super_admin")
    @RequestMapping("manager_person_setting.do")
    public String entryPersonSetting(Map<String, Object> map) {
        Subject subject = SecurityUtils.getSubject();
        String principal = (String) subject.getPrincipal();
        WebsiteUser user = service.getByUsername(principal);
        map.put("user", user);
        return "admin/admin_person_setting";
    }

    /**
     * 项目显示界面.进行分页操作
     *
     * @param pageNum 当前的页数
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping("manager_project_manager.do")
    public String entryProjectManager(Integer pageNum, Map<String, Object> map) {
        if (pageNum == null) {
            pageNum = 0;
        }
        ArrayList<WebsiteProject> list = projectService
                .selectProjectByNum(pageNum);
        map.put("pageNum", String.valueOf(pageNum + 1));
        int integer = projectService.getPageNum();
        map.put("allNum", String.valueOf(integer));
        map.put("projects", list);
        return "admin/admin_project_manager";
    }

    @RequestMapping(value = "manager_project_add.do", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String addProject(
            @RequestParam("project_topic") String project_topic,
            @RequestParam("project_text") String project_text,
            @RequestParam("project_url") String project_url) {
        WebsiteProject project = new WebsiteProject();
        project.setProjectText(project_text);
        project.setProjectTopic(project_topic);
        project.setProjectUrl(project_url);
        project.setProjectCreateDate(new Date());
        boolean b = projectService.add(project);
        if (b) {
            return "{add_project_true}";
        }
        return "{add_project_error}";
    }

    @RequestMapping(value = "manager_project_delete.do", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String delProject(Long projectId) {
        if (projectId != null) {
            boolean del = projectService.del(projectId);
            if (del) {
                return "{project_del_success}";
            }
        }
        return "{project_del_error}";
    }

    @RequestMapping(value = "manager_project_update.do", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String updateProject(Long projectId, String projectUrl,
                                String projectText, String projectTopic) {
        if (projectId != null && projectUrl != null && projectText != null
                && projectText != null) {
            WebsiteProject project = projectService.getById(projectId);
            if (project != null) {
                project.setProjectText(projectText);
                project.setProjectTopic(projectTopic);
                project.setProjectUrl(projectUrl);
                project.setProjectId(projectId);
                projectService.update(project);
                return "{project_update_success}";
            }
        }
        return "{project_update_error}";
    }

    /**
     * 项目显示界面.进行分页操作
     *
     * @param pageNum 当前的页数
     * @return
     */
    @RequestMapping("manager_funny_manager.do")
    @RequiresRoles("super_admin")
    public String entryFunnyManager(Integer pageNum, Map<String, Object> map) {
        if (pageNum == null) {
            pageNum = 0;
        }
        ArrayList<WebsiteFunny> list = funnyService.selectProjectByNum(pageNum);
        map.put("pageNum", String.valueOf(pageNum + 1));
        int integer = projectService.getPageNum();
        map.put("allNum", String.valueOf(integer));
        map.put("projects", list);
        return "admin/admin_funny_manager";
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_funny_add.do", method = RequestMethod.POST)
    public String addfunny(@RequestParam("project_topic") String project_topic,
                           @RequestParam("project_text") String project_text,
                           @RequestParam("project_name") String project_name,
                           @RequestParam("project_file") MultipartFile project_file) {
        String string = null;
        try {
            WebsiteFunny project = new WebsiteFunny();
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                    .getRequestAttributes()).getRequest();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
                    "yyyyMMddHHmmssSSS");
            Subject subject = SecurityUtils.getSubject();
            string = simpleDateFormat.format(new Date())
                    + subject.getPrincipal();
            String path = request.getRealPath("upload" + File.separator
                    + "funny_temp" + File.separator + string);
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            String originalFilename = project_file.getOriginalFilename();
            if (!originalFilename.substring(originalFilename.lastIndexOf("."))
                    .equals(".zip")) {
                throw new IllegalArgumentException("format not true");
            }
            String contentType = project_file.getContentType();
            InputStream stream = project_file.getInputStream();
            byte[] bytes = new byte[(int) project_file.getSize()];
            int len = -1;
            File uploadFile = new File(file.getAbsolutePath(), originalFilename);
            FileOutputStream fileOutputStream = new FileOutputStream(uploadFile);
            while ((len = stream.read(bytes)) != -1) {
                fileOutputStream.write(bytes);
                fileOutputStream.flush();
            }
            stream.close();
            fileOutputStream.close();
            ZipTools zipTools = new ZipTools();
            File decompressFile = new File(request.getRealPath("upload"
                    + File.separator + "funny" + File.separator
                    + string));
            if (!file.exists()) {
                file.mkdirs();
            }
            zipTools.decompress(uploadFile.getAbsolutePath(),
                    decompressFile.getAbsolutePath(), false);
            File[] listFiles = decompressFile.listFiles();
            File indexFile = findIndexFile(listFiles, project_name);
            if (indexFile != null) {
                project.setFunnyText(project_text);
                project.setFunnyTopic(project_topic);
                String string2 = indexFile.getAbsolutePath();
                int j = string2.lastIndexOf("upload" + File.separator
                        + "funny" + File.separator);
                project.setFunnyUrl(indexFile.getAbsolutePath().substring(j));
                project.setFunnyCreateDate(new Date());
                boolean b = funnyService.insertFunny(project);
                if (b) {
                    return "redirect:/manager/manager_funny_manager.do";
                }
                return "redirect:/manager/manager_funny_manager.do";
            } else {
                funnyService.delFunnyFileByName(string);
                throw new FileNotFoundException("file is not find");
            }
        } catch (Exception e) {
            funnyService.delFunnyFileByName(string);
            e.printStackTrace();
        }
        return "redirect:/manager/manager_funny_manager.do";
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_funny_delete.do", method = RequestMethod.POST)
    @ResponseBody
    public String delFunny(Long projectId) {
        if (projectId != null) {
            boolean del = funnyService.delFunny(projectId);
            if (del) {
                return "{project_del_success}";
            }
        }
        return "{project_del_error}";
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_funny_update.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateFunny(Long projectId, String projectText,
                              String projectTopic) {
        if (projectId != null && projectText != null && projectText != null) {
            WebsiteFunny project = funnyService.getById(projectId);
            if (project != null) {
                project.setFunnyText(projectText);
                project.setFunnyTopic(projectTopic);
                project.setFunnyId(projectId);
                funnyService.updateFunny(project);
                return "{project_update_success}";
            }
        }
        return "{project_update_error}";
    }

    /**
     * 项目显示界面.进行分页操作
     *
     * @param pageNum 当前的页数
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping("manager_temp_manager.do")
    public String entryTempManager(Integer pageNum, Map<String, Object> map) {
        if (pageNum == null) {
            pageNum = 0;
        }
        ArrayList<WebsiteTemp> list = tempService.selectProjectByNum(pageNum);
        map.put("pageNum", String.valueOf(pageNum + 1));
        int integer = projectService.getPageNum();
        map.put("allNum", String.valueOf(integer));
        map.put("projects", list);
        return "admin/admin_temp_manager";
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_temp_add.do", method = RequestMethod.POST)
    public String addTemp(@RequestParam("project_topic") String project_topic,
                          @RequestParam("project_text") String project_text,
                          @RequestParam("project_name") String project_name,
                          @RequestParam("project_file") MultipartFile project_file)
            throws Exception {
        String string = null;
        try {
            WebsiteTemp project = new WebsiteTemp();
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                    .getRequestAttributes()).getRequest();
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
                    "yyyyMMddHHmmssSSS");
            Subject subject = SecurityUtils.getSubject();
            string = simpleDateFormat.format(new Date())
                    + subject.getPrincipal();
            String path = request.getRealPath("upload" + File.separator
                    + "temp_temp" + File.separator + string);
            File file = new File(path);
            if (!file.exists()) {
                file.mkdirs();
            }
            String originalFilename = project_file.getOriginalFilename();
            if (!originalFilename.substring(originalFilename.lastIndexOf("."))
                    .equals(".zip")) {
                throw new IllegalArgumentException("format not true");
            }
            String contentType = project_file.getContentType();
            InputStream stream = project_file.getInputStream();
            byte[] bytes = new byte[(int) project_file.getSize()];
            int len = -1;
            File uploadFile = new File(file.getAbsolutePath(), originalFilename);
            FileOutputStream fileOutputStream = new FileOutputStream(uploadFile);
            while ((len = stream.read(bytes)) != -1) {
                fileOutputStream.write(bytes);
                fileOutputStream.flush();
            }
            stream.close();
            fileOutputStream.close();
            ZipTools zipTools = new ZipTools();
            File decompressFile = new File(
                    request.getRealPath("upload" + File.separator + "temp"
                            + File.separator + string));
            if (!file.exists()) {
                file.mkdirs();
            }
            zipTools.decompress(uploadFile.getAbsolutePath(),
                    decompressFile.getAbsolutePath(), false);
            File[] listFiles = decompressFile.listFiles();
            File indexFile = findIndexFile(listFiles, project_name);
            if (indexFile != null) {
                project.setTempText(project_text);
                project.setTempTopic(project_topic);
                String string2 = indexFile.getAbsolutePath();
                int j = string2.lastIndexOf("upload" + File.separator
                        + "temp" + File.separator);
                project.setTempUrl(indexFile.getAbsolutePath().substring(j));
                project.setTempCreateDate(new Date());
                boolean b = tempService.insertTemp(project);
                if (b) {
                    return "redirect:/manager/manager_temp_manager.do";
                }
                return "redirect:/manager/manager_temp_manager.do";
            } else {
                tempService.delTempFileByName(string);
                throw new FileNotFoundException("file is not find");
            }
        } catch (Exception e) {
            tempService.delTempFileByName(string);
            e.printStackTrace();
        }
        return "redirect:/manager/manager_temp_manager.do";
    }

    private File findIndexFile(File[] file, String fileName) {
        for (int i = 0; i < file.length; i++) {
            if (file[i].isDirectory()) {
                File indexFile = findIndexFile(file[i].listFiles(), fileName);
                if (indexFile != null) {
                    return indexFile;
                }
            } else {
                if (file[i].getName().equals(fileName)) {
                    return file[i];
                }
            }
        }
        return null;
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_temp_delete.do", method = RequestMethod.POST)
    @ResponseBody
    public String delTemp(Long projectId) {
        if (projectId != null) {
            boolean del = tempService.delTemp(projectId);
            if (del) {
                return "{project_del_success}";
            }
        }
        return "{project_del_error}";
    }

    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_temp_update.do", method = RequestMethod.POST)
    @ResponseBody
    public String updateTemp(Long projectId, String projectText,
                             String projectTopic) {
        if (projectId != null && projectText != null && projectText != null) {
            WebsiteTemp project = tempService.getById(projectId);
            if (project != null) {
                project.setTempText(projectText);
                project.setTempTopic(projectTopic);
                project.setTempId(projectId);
                tempService.updateTemp(project);
                return "{project_update_success}";
            }
        }
        return "{project_update_error}";
    }

    /**
     * 进入Banner管理界面
     *
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_banner.do", method = RequestMethod.GET)
    public String entryManagerView(Map<String, Object> map) {
        List<WebsiteBanner> all = bannerService.getAll();
        map.put("list", all);
        return "admin/admin_banner";
    }


    /**
     * 进入友情链接管理
     *
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_friend_link.do", method = RequestMethod.GET)
    public String enrtyManagerFriendLink(Map<String, Object> map) {
        List<WebsiteFriendLink> all = linkService.getAll();
        map.put("list", all);
        return "admin/admin_friend_link";
    }

    /**
     * 用户管理.权限管理
     *
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "manager_user.do", method = RequestMethod.GET)
    public String entryManagerUser() {
        return "admin/admin_user";
    }


    /**
     * 清空缓存
     * 必要的时候可以通过使用这个函数,清除所有的redis缓存.以达到添加之后立即刷新,但是这样会造成缓存失效.
     * 具体的利弊自己考虑
     *
     * @return
     */
    @RequiresRoles("super_admin")
    @RequestMapping(value = "clear", method = RequestMethod.GET)
    @ResponseBody
    public String clearCache() {
        Jedis jedis =
                jedisPool.getResource();
        String s = jedis.flushAll();
        jedis.close();
        if ("OK".equals(s)) {
            //说明缓存清理成功
            return JSON.toJSONString(new Message(200, "缓存清理成功", null, null, null));
        } else {
            return JSON.toJSONString(new Message(500, "缓存清理失败", null, null, null));
        }
    }
}
