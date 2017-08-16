<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
    <title>恶搞大王的个人博客</title>
    <link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
    <script
            src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/layui/css/layui.css"/>
    <script src="/layui/layui.js"></script>
    <script src="/css/MyBlog_files/lightbox.js"></script>
</head>
<body>
<div id="nav_top">
    <br>
    <center>
        <div>
            <div id="nav_top_title1"><h1>低调</h1></div>
            <div id="nav_top_title2" class="hidden-xs-block"><h2>恶搞大王的个人博客</h2></div>
        </div>
    </center>
</div>
<nav class="navbar navbar-default navbar-static-top" style="width: 100%">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
        </div>

        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="<%=request.getContextPath()%>/blog/">首页</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">生活笔记 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/blog/type?pageNum=0&typeId=0">学习</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=1">生活</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=2">随笔</a></li>
                    </ul>
                </li>
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">技术杂谈 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="/blog/type?pageNum=0&typeId=3">JAVA</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=4">PHP</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=5">C/C++</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=6">HTML</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=7">JS</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=8">Python</a></li>
                        <li><a href="/blog/type?pageNum=0&typeId=9">其他</a></li>
                    </ul>
                </li>
                <shiro:authenticated>
                    <li><a href="<%=request.getContextPath()%>/login/manager">个人中心</a></li>
                </shiro:authenticated>
                <shiro:notAuthenticated>
                    <li><a href="<%=request.getContextPath()%>/login/manager">登录</a></li>
                </shiro:notAuthenticated>
            </ul>
            <ul class="nav navbar-nav navbar-left">
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">更多内容 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a
                                href="<%=request.getContextPath()%>/project/MyProject.do">我的作品</a></li>
                        <li><a href="<%=request.getContextPath()%>/funnyView.do">趣味网页</a></li>
                        <li><a href="<%=request.getContextPath()%>/tempView.do">临时网页</a></li>
                        <li><a href="<%=request.getContextPath()%>/music" target="_blank">我的音乐</a></li>
                        <li><a href="<%=request.getContextPath()%>/image">我的相册</a></li>
                        <li><a href="<%=request.getContextPath()%>/read/index.html">我的闲读</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <a href="##" data-toggle="modal"
                               data-target="#about-modal">我的历程</a>
                            <a
                                    href="<%=request.getContextPath()%>/AboutMy/index.html" target="_blank">关于我</a></li>
                        <li role="separator" class="divider"></li>
                        <li>
                            <form class="navbar-form navbar-center" action="/music/search" method="post" accept-charset="utf-8">
                                <div class="input-group">
                                    <input type="text" name="songsName"  class="form-control" placeholder="音乐搜索">
                                    <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" style="color: #ffffff;background-color:#d56464;border-color: #d56464">搜索</button>
                      </span>
                                </div><!-- /input-group -->
                            </form>
                        </li>
                        <li>
                            <form class="navbar-form navbar-center" action="/music/mvsearch" method="post"
                                  accept-charset="utf-8">
                                <div class="input-group">
                                    <input type="text" name="songsName" class="form-control" placeholder="MV搜索">
                                    <form class="input-group-btn">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="submit" style="color: #ffffff;background-color:#d56464;border-color: #d56464">搜索</button></span>
                                </div>
                            </form>
                        </li>
                    </ul>
                </li>
            </ul>
            <form class="navbar-form navbar-right" action="blogFind" method="post">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="搜索您感兴趣的内容...">
                </div>
                <button type="submit" class="btn btn-default"
                        style="color: #ffffff;background-color:#d56464;border-color: #d56464">搜索
                </button>
            </form>
        </div>
    </div>
</nav>
<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
     style="background-color:#d56464" aria-labelledby="modal-label"
     aria-hidden="true">
    <div class="modal-dialog" style="background-color:#FFFFF0">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                </button>
                <h4 class="modal-title" id="modal-label">关于</h4>
            </div>
            <div class="modal-body">
                <div
                        style="text-align: center;padding-top:30px;padding-bottom: 10px">
                    <div class="row">
                        <div class="col-xs-4 col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">支付宝赞助(点击大图)
                                </div>
                                <div class="panel-body">
                                    <a href="/images/alipay_code.jpg"> <img src="/images/alipay_code.jpg" alt="支付宝二维码"
                                                                            class="img-thumbnail"></a>
                                </div>
                            </div>
                            <br>
                        </div>
                        <div class="col-xs-4 col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">微信赞助(点击大图)
                                </div>
                                <div class="panel-body">
                                    <a href="/images/wxpay_code.jpg"> <img src="/images/wxpay_code.jpg" alt="微信二维码"
                                                                           class="img-thumbnail"></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">QQ赞助(点击大图)
                                </div>
                                <div class="panel-body">
                                    <a href="/images/qqpay_code.jpg"> <img src="/images/qqpay_code.jpg" alt="QQ二维码"
                                                                           class="img-thumbnail"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading"
                             style="background-color:#594d4d;color: #FFFFFF;border-color:#594d4d ">微信公众号(猿猴家族)
                        </div>
                        <div class="panel-body" style="border-color:#594d4d ">
                            <img src="/images/wx_code.jpg" alt="微信公众号二维码" class="img-thumbnail">
                        </div>
                    </div>
                    <div style="padding-top: 20px">
                        <p>个人微信 ：HONGDEYAN1997</p>
                        <p>个人QQ ：378759617</p>
                        <p>邮箱 ：378759617@qq.com</p>
                        <p>
                            github ：<a href="https://github.com/egdw" target="_blank">https://github.com/egdw</a>
                        </p>
                    </div>
                </div>
                <p style="text-align: right">恶搞大王制作</p>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<style>
    .navbar-default {
        background-color: #594d4d;
        border-color: #d56464;
    }

    .navbar-default .navbar-brand {
        color: #ffffff;
    }

    .navbar-default .navbar-brand:hover,
    .navbar-default .navbar-brand:focus {
        color: #ffffff;
    }

    .navbar-default .navbar-text {
        color: #ffffff;
    }

    .navbar-default .navbar-nav > li > a {
        color: #ffffff;
    }

    .navbar-default .navbar-nav > li > a:hover,
    .navbar-default .navbar-nav > li > a:focus {
        color: #ffffff;
    }

    .navbar-default .navbar-nav > li > .dropdown-menu {
        background-color: #594d4d;
    }

    .navbar-default .navbar-nav > li > .dropdown-menu > li > a {
        color: #ffffff;
    }

    .navbar-default .navbar-nav > li > .dropdown-menu > li > a:hover,
    .navbar-default .navbar-nav > li > .dropdown-menu > li > a:focus {
        color: #ffffff;
        background-color: #d56464;
    }

    .navbar-default .navbar-nav > li > .dropdown-menu > li.divider {
        background-color: #d56464;
    }

    .navbar-default .navbar-nav .open .dropdown-menu > .active > a,
    .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
    .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
        color: #ffffff;
        background-color: #d56464;
    }

    .navbar-default .navbar-nav > .active > a,
    .navbar-default .navbar-nav > .active > a:hover,
    .navbar-default .navbar-nav > .active > a:focus {
        color: #ffffff;
        background-color: #d56464;
    }

    .navbar-default .navbar-nav > .open > a,
    .navbar-default .navbar-nav > .open > a:hover,
    .navbar-default .navbar-nav > .open > a:focus {
        color: #ffffff;
        background-color: #d56464;
    }

    .navbar-default .navbar-toggle {
        border-color: #d56464;
    }

    .navbar-default .navbar-toggle:hover,
    .navbar-default .navbar-toggle:focus {
        background-color: #d56464;
    }

    .navbar-default .navbar-toggle .icon-bar {
        background-color: #ffffff;
    }

    .navbar-default .navbar-collapse,
    .navbar-default .navbar-form {
        border-color: #ffffff;
    }

    .navbar-default .navbar-link {
        color: #ffffff;
    }

    .navbar-default .navbar-link:hover {
        color: #ffffff;
    }

    @media (max-width: 767px) {
        .navbar-default .navbar-nav .open .dropdown-menu > li > a {
            color: #ffffff;
        }

        .navbar-default .navbar-nav .open .dropdown-menu > li > a:hover,
        .navbar-default .navbar-nav .open .dropdown-menu > li > a:focus {
            color: #ffffff;
        }

        .navbar-default .navbar-nav .open .dropdown-menu > .active > a,
        .navbar-default .navbar-nav .open .dropdown-menu > .active > a:hover,
        .navbar-default .navbar-nav .open .dropdown-menu > .active > a:focus {
            color: #ffffff;
            background-color: #d56464;
        }
    }

    body {
        background-color: #eeeeee;
    }

    #nav_top {
        width: 100%;
        height: 106px;
        background-color: #d56464;
    }

    #nav_top_title1 {
        margin: 0px auto;
        padding-top: 5px;
        padding-left: 35%;
        float: left;
    }

    #nav_top_title1 h1 {
        font-size: 55px;
        color: #ffffff;
    }

    #nav_top_title2 h2 {
        font-size: 20px;
        color: #ffffff;
    }

    #nav_top_title2 {
        float: left;
        padding-top: 40px;
        padding-left: 10px;
    }

    #nav_search {
        float: right;
        width: 45px;
        height: 55px;
        color: #ffffff;
        font-size: 20px;
        padding-top: 15px;
        background-color: #d56464;
    }

    #nav_search:hover {
        float: right;
        width: 45px;
        height: 55px;
        color: #ffffff;
        font-size: 20px;
        padding-top: 15px;
        opacity: 0.8;
        background-color: #d56464;
    }

    #tip {
        background-color: #ffffff;
        width: 100%;
        height: 40px;
        float: none;
    }

    #tip_left {
        float: left;
    }

    #tip_right {
        float: right;
    }
</style>
<script>
    $(".my_ad").bootstrapNews({
        newsPerPage: 9,
        autoplay: false,
        pauseOnHover: true,
        direction: 'up',
        newsTickerInterval: 2500,
        onToDo: function () {
        }
    });
</script>
</html>