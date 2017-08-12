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
        <script
                src="<%=request.getContextPath()%>/css/admin_index/jquery.min.js"></script>
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/admin_index/bootstrap.min.css">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/MyBlog_files/lightbox.css">
        <script
                src="<%=request.getContextPath()%>/css/admin_index/bootstrap.min.js"></script>
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/admin_project_manager_files/ui.css">
        <link rel="stylesheet"
              href="<%=request.getContextPath()%>/css/admin_project_manager_files/my.css">
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/css/admin_project_manager_files/my.js"></script>
        <style type="text/css">
            body {
                font-family: "微软雅黑", "Microsoft YaHei";
                background: #eee;
            }
        </style>
        <script type="text/javascript"
                src="<%=request.getContextPath()%>/css/admin_index/js.js"></script>
    </head>
    <body>
    <button class="btn btn-primary btn-lg" id="wabutton"
            style="display:none;" data-toggle="modal" data-target="#alert_modal"></button>
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/admin_index/ui.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/admin_index/my.css">
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/css/admin_index/my.js"></script>
    <div id="mok_bgimg"
         style="width:100%;height:100%;background-size:100% 100%;background-image:url(&#39;/az/hprichbg/rb/MartianCrater_ZH-CN9867068013_1920x1080.jpg&#39;);position:fixed;"></div>
    <style>
        .container .nav > li > a {
            color: #FF3030
        }

        .navbar-default .navbar-nav > li > a, .navbar-default .navbar-brand {
            color: #EEAEEE !important
        }
    </style>
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