<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<shiro:hasRole name="super_admin">
    <!DOCTYPE html>
    <html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="charset" content="utf-8">
        <title>后台管理</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
        <link rel="stylesheet"
              href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
              integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
              crossorigin="anonymous">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/MyBlog_files/lightbox.css">
        <script
                src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
                integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
                crossorigin="anonymous"></script>
        <style type="text/css">
            body {
                font-family: "微软雅黑", "Microsoft YaHei";
                background: #eee;
            }
        </style>
    </head>
    <body>
    <button class="btn btn-primary btn-lg" id="wabutton"
            style="display:none;" data-toggle="modal" data-target="#alert_modal"></button>
    <div class="navbar navbar-default" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">后台管理</span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand"
               href="<%=request.getContextPath()%>/login/manager">后台管理</a>
        </div>

        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="http://love.kfj.cc/index.php#"
                                        class="dropdown-toggle" data-toggle="dropdown"> 功能菜单 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li class=""><a
                                href="<%=request.getContextPath()%>/login/manager"> 管理首页</a></li>
                        <li class=""><a
                                href="<%=request.getContextPath()%>/index.jsp"> 个人主页</a></li>
                        <li class=""><a href="<%=request.getContextPath()%>/blog/"> 博客首页</a></li>
                        <li class=""><a
                                href="<%=request.getContextPath()%>/manager/manager_person_setting.do"> 个人设置</a></li>
                        <li class=""><a
                                href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                        <li class=""><a
                                href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"> 趣味管理</a></li>
                        <li><a
                                href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"> 临时管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/blog/admin"> 博客管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/album/album"> 相册管理</a></li>
                        <li><a href="<%=request.getContextPath()%>/manager/manager_banner.do"> Banner管理</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/login/logout.do"> 退出登录</a></li>
            </ul>
            <ul class="nav navbar-nav">
                <li class="dropdown"><a
                        href="<%=request.getContextPath()%>/AboutMy/index.html"
                        class="dropdown-toggle" data-toggle="dropdown"> 关于 <b class="caret"></b></a>
                    <ul class="dropdown-menu">
                        <li><a
                                href="<%=request.getContextPath()%>/AboutMy/index.html"
                                target="_blank">关于我</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
    </body>
    </html>
</shiro:hasRole>