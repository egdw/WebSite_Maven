<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>恶搞大王的个人网站</title>
    <link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="css/index_style.css" rel="stylesheet" type="text/css">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script src="js/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/script.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            list-style-type: none;
        }

        a, img {
            border: 0;
        }

        body {
            background: #000;
        }
    </style>
</head>
<body>
<div class="head">
    <div class="login">
        <div class="header">
            <div class="text">
                <img
                        src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
                        alt=""/>
                <h2>恶搞大王</h2>
                <a href="mailto:378759617@qq.com"><p>@恶搞大王</p></a>
            </div>
        </div>
        <div class="followers">
            <div class="f-left f-1">
                <a href="blog/"><span class="f1"></span></a>
            </div>
            <div class="f-left f-middle">
                <a href="./AboutMy/index.html"><span class="f2"></span></a>
            </div>
            <div class="f-left f-right">
                <a href="project/MyProject.do"><span class="f3"></span></a>
            </div>
            <div class="clear"></div>
        </div>
        <ul class="content">
            <li class="menu">
                <ul>
                    <li class="button"><a href="#">信息<span class="icon stat">
							</span><i>7</i></a></li>
                    <li class="dropdown">
                        <ul class="icon-navigation">
                            <li><a href="project/MyProject.do">我的作品</a></li>
                            <li><a href="blog/">我的博客</a></li>
                            <li><a href="image">我的相册</a></li>
                            <li><a href="funnyView.do">趣味网页</a></li>
                            <li><a href="tempView.do">临时网页</a></li>
                            <li><a href="music">我的音乐</a></li>
                            <li><a href="read/index.html">我的闲读</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="menu">
                <ul>
                    <li class="button"><a href="#">简述<span class="icon">
							</span><i>3</i></a></li>
                    <li class="dropdown">
                        <ul class="icon-navigation">
                            <shiro:authenticated>
                                <li><a href="<%=request.getContextPath()%>/login/manager">个人中心</a></li>
                            </shiro:authenticated>
                            <shiro:notAuthenticated>
                                <li><a href="<%=request.getContextPath()%>/login/manager">登录</a></li>
                            </shiro:notAuthenticated>
                            <li><a href="<%=request.getContextPath()%>/login/register.jsp">注册</a></li>
                            <li><a href="./AboutMy/index.html">关于我</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<div class="footer"></div>
</body>
</html>