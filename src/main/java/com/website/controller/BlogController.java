package com.website.controller;

import com.website.entites.WebsiteAlbum;
import com.website.entites.WebsiteBlog;
import com.website.entites.WebsiteComment;
import com.website.service.WebSiteAlbumService;
import com.website.service.WebSiteBlogService;
import com.website.service.WebSiteCommentService;
import com.website.utils.ImageUtils;
import com.website.utils.UUIDUtils;
import net.coobird.thumbnailator.Thumbnails;
import net.coobird.thumbnailator.geometry.Positions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import java.awt.image.BufferedImage;
import java.io.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

@RequestMapping("blog")
@Controller
public class BlogController {
    @Autowired
    private WebSiteBlogService service;
    @Autowired
    private WebSiteAlbumService albumService;
    @Autowired
    private WebSiteCommentService commentService;

    @ExceptionHandler(org.apache.shiro.authz.UnauthorizedException.class)
    public String shiroException2() {
        return "redirect:/401.jsp";
    }

    /**
     * 进入博客主页
     */
    @RequestMapping(value = "/")
    public String myBlogView(@RequestParam(required = false) Integer pageNum,
                             Map<String, Object> map) {
        if (pageNum == null) {
            pageNum = 0;
        }
        ArrayList<WebsiteBlog> list = service.selectBlogByNum(pageNum, null);
        Integer pageCount = service.getPageNum(null);
        // 从数据库中获取最新的前五张图片
        ArrayList<WebsiteAlbum> albumbyPage = albumService.selectAlbumbyPage(0,
                5);
        ArrayList<WebsiteComment> comments = commentService.getCommentByNum(5);
        ArrayList<WebsiteBlog> selectBlogByNumAndComment = service
                .selectBlogByNumAndComment(5);
        ArrayList<WebsiteBlog> selectBlogByNumAndReader = service
                .selectBlogByNumAndReader(5);
        map.put("list", list);
        map.put("pageCount", pageCount);
        map.put("currentPage", pageNum);
        map.put("comments", comments);
        map.put("topComments", selectBlogByNumAndComment);
        map.put("topReader", selectBlogByNumAndReader);
        map.put("images", albumbyPage);
        return "/blog/blog_index";
    }


    /**
     * 进入不同的分类博客界面
     *
     * @param typeId  类型的ID值
     * @param pageNum 页码
     */
    @RequestMapping("type")
    public String entryBlogType(@RequestParam(required = false) Integer typeId,
                                @RequestParam(required = false) Integer pageNum,
                                Map<String, Object> map) {
        if (pageNum == null) {
            pageNum = 0;
        }
        if (typeId == null) {
            typeId = 0;
        }
        ArrayList<WebsiteBlog> list = service.selectBlogByNum(pageNum, typeId);
        Integer num = service.getPageNum(typeId);
        map.put("pageCount", num);
        map.put("list", list);
        map.put("currentPage", pageNum);
        map.put("typeId", typeId);
        return "/blog/blog_type";
    }

    /**
     * 进入博客管理界面
     *
     * @return
     */
    @RequestMapping("admin")
    @RequiresRoles("super_admin")
    public String entryBlogAdmin(Map<String, Object> map,
                                 @RequestParam(required = false) Integer pageNum) {
        if (pageNum == null) {
            pageNum = 0;
        }
        Integer pageCount = service.getPageNum(null);
        ArrayList<WebsiteBlog> list = service.selectBlogByNum(pageNum, null);
        map.put("list", list);
        map.put("currentPage", pageNum);
        map.put("pageCount", pageCount);
        return "/blog/blog_admin";
    }

    @RequestMapping("search")
    public void findBySearch(String regex) {

    }

    /**
     * 进入文章详细内容的控制器
     *
     * @return
     */
    @RequestMapping("detail")
    public String entryPage(Integer pageId, Map<String, Object> map) {
        if (pageId == null) {
            // 这里到时候返回文章没有找到的网页
            return "error";
        }
        WebsiteBlog blog = service.getBlogById(pageId);
        if (blog != null) {
            boolean clickTimes = service.updateClickTimes(blog.getId());
            ArrayList<WebsiteComment> list = commentService
                    .selectCommentByBlogId(blog.getId());
            map.put("comments", list);
            map.put("blog", blog);
        } else {
            return "error";
        }
        return "/blog/blog_text";
    }

    /**
     * 上传图片方法
     *
     * @return
     */
    @SuppressWarnings("deprecation")
    @RequestMapping("imageUpload")
    @ResponseBody
    @RequiresRoles("super_admin")
    public String uploadImage(@RequestParam("image") MultipartFile file) {
        if (file == null) {
            // 判断file是否为空,为空就返回空指针的json数据
            return "{url:'null'}";
        }
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();
        String filename = file.getOriginalFilename();
        File path = null;
        if (filename != null && !"".equals(filename)) {
            int lastIndexOf = filename.lastIndexOf(".");
            String string = filename.substring(lastIndexOf);
            path = new File(request.getRealPath("upload" + File.separator
                    + "image" + File.separator)
                    + File.separator + UUIDUtils.getUUID() + string);
            if (!path.exists()) {
                path.getParentFile().mkdirs();
            }
            try {
                file.transferTo(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
//        try {
//            byte[] bytes = file.getBytes();
//            BufferedOutputStream bos = new BufferedOutputStream(
//                    new FileOutputStream(path));
//            bos.write(bytes);
//            bos.close();
//        } catch (FileNotFoundException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
        if (path.exists()) {
            try {
                BufferedImage bufferedImage = ImageIO.read(path);
                Thumbnails.of(bufferedImage).outputQuality(0.8f).toFile(path);
            } catch (IOException e) {
                e.printStackTrace();
            }
            // 这里进行返回相应的图片的地址.
            String absolutePath = path.getAbsolutePath();
            System.out.println(absolutePath);
            //生成缓存文件
            ImageUtils.thumbnailImage(absolutePath, 100, 150);
            int indexOf = absolutePath.indexOf("upload" + File.separator
                    + "image" + File.separator);
            String substring = absolutePath.substring(indexOf);
            return substring;
        } else {
            return "null";
        }
    }

    /**
     * 添加博客
     */
    @RequestMapping(value = "add", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String addBlog(String title, Integer type, String pic_url,
                          String content) {
        WebsiteBlog blog = new WebsiteBlog();
        blog.setPicUrl(pic_url);
        blog.setType(type.byteValue());
        blog.setTitle(title);
        blog.setCreateTime(new Date());
        blog.setContent(content);
        boolean b = service.addBlog(blog);
        if (b) {
            return "success";
        } else {
            return "error";
        }
    }

    /**
     * 删除博客文章
     *
     * @param blogId
     */
    @RequestMapping(value = "del", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String delBlog(Integer blogId) {
        if (blogId == null) {
            return "error";
        }
        boolean delete = service.delete(blogId);
        if (delete) {
            return "success";
        }
        return "error";
    }

    /**
     * 修改博客
     *
     * @return
     */
    @RequestMapping(value = "update", method = RequestMethod.POST)
    @ResponseBody
    @RequiresRoles("super_admin")
    public String update(String title, Integer id, Integer type,
                         String pic_url, String content) {
        WebsiteBlog record = null;
        if (id != null) {
            record = service.getBlogById(id);
        } else {
            return "error";
        }
        if (record == null) {
            return "error";
        }
        record.setPicUrl(pic_url);
        record.setTitle(title);
        record.setType(type.byteValue());
        record.setContent(content);
        boolean b = service.update(record);
        if (b)
            return "success";
        return "error";
    }

    /**
     * 根据ID号进行获取相应的对象
     *
     * @return
     */
    @RequestMapping(value = "get", method = RequestMethod.GET)
    @ResponseBody
    public WebsiteBlog get(Integer id) {
        WebsiteBlog blog = service.getBlogById(id);
        return blog;
    }

    @RequestMapping("blogFind")
    public String find(Map<String, Object> map, String name) {
        if (name == null) {
            return "/blog/blog_find";
        }
        ArrayList<WebsiteBlog> list = service.find(name);
        map.put("list", list);
        return "/blog/blog_find";
    }

}
