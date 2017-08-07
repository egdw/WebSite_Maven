<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
</head>
<body>
<nav class="navbar navbar-default navbar-static-top" style="width: 100%">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed"
                    data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
                    aria-expanded="false">
                <span class="sr-only"></span> <span class="icon-bar"></span> <span
                    class="icon-bar"></span> <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="<%=request.getContextPath()%>/blog/">恶搞大王的博客</a>
        </div>

        <div class="collapse navbar-collapse"
             id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">博客分类 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="type?pageNum=0&typeId=0">学习</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="type?pageNum=0&typeId=1">生活</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="type?pageNum=0&typeId=2">随笔</a></li>
                    </ul>
                </li>
                <li><a href="##" data-toggle="modal"
                       data-target="#about-modal">关于</a></li>

                <shiro:authenticated>
                    <li><a href="<%=request.getContextPath()%>/login/manager">个人中心</a></li>
                </shiro:authenticated>
                <shiro:notAuthenticated>
                    <li><a href="<%=request.getContextPath()%>/login/manager">登录</a></li>
                </shiro:notAuthenticated>
            </ul>
            <form class="navbar-form navbar-left" action="blogFind" method="post">
                <div class="form-group">
                    <input type="text" name="name" class="form-control" placeholder="搜索您感兴趣的内容...">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="<%=request.getContextPath()%>/">个人首页</a></li>
                <li class="dropdown"><a href="#" class="dropdown-toggle"
                                        data-toggle="dropdown" role="button" aria-haspopup="true"
                                        aria-expanded="false">其他地址 <span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a
                                href="<%=request.getContextPath()%>/project/MyProject.do">我的作品</a></li>
                        <li><a href="<%=request.getContextPath()%>/blog/">我的博客</a></li>
                        <li><a href="<%=request.getContextPath()%>/funnyView.do">趣味网页</a></li>
                        <li><a href="<%=request.getContextPath()%>/tempView.do">临时网页</a></li>
                        <li><a href="<%=request.getContextPath()%>/music">我的音乐</a></li>
                        <li><a href="<%=request.getContextPath()%>/image">我的相册</a></li>
                        <li><a href="<%=request.getContextPath()%>/login/manager">个人中心</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a
                                href="<%=request.getContextPath()%>/AboutMy/index.html">关于我</a></li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
     style="background-color:#FFFFF0" aria-labelledby="modal-label"
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
                                <div class="panel-heading">支付宝赞助(点击大图)</div>
                                <div class="panel-body">
                                    <a href="/images/alipay_code.jpg"> <img src="/images/alipay_code.jpg" alt="支付宝二维码"
                                                                            class="img-thumbnail"></a>
                                </div>
                            </div>
                            <br>
                        </div>
                        <div class="col-xs-4 col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-heading">微信赞助(点击大图)</div>
                                <div class="panel-body">
                                    <a href="/images/wxpay_code.jpg"> <img src="/images/wxpay_code.jpg" alt="微信二维码"
                                                                           class="img-thumbnail"></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-xs-4 col-md-4">
                            <div class="panel panel-info">
                                <div class="panel-heading">QQ赞助(点击大图)</div>
                                <div class="panel-body">
                                    <a href="/images/qqpay_code.jpg"> <img src="/images/qqpay_code.jpg" alt="QQ二维码"
                                                                           class="img-thumbnail"></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="panel panel-info">
                        <div class="panel-heading">微信公众号(猿猴家族)</div>
                        <div class="panel-body">
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
</html>