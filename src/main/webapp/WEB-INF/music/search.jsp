<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="UTF-8">
    <title>音乐搜索</title>
</head>
<link href="<%=request.getContextPath()%>/css/music_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/music_css/my.css" rel="stylesheet">
<body>
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<div class="row">
    <div class="col-lg-6">
        <form class="navbar-form navbar-center" action="search" method="post" accept-charset="utf-8">
            <div class="input-group">
                <input type="text" name="songsName" class="form-control" placeholder="音乐搜索">
                <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">搜索</button>
                      </span>
            </div><!-- /input-group -->
        </form>
        <form class="navbar-form navbar-center" action="mvsearch" method="post" accept-charset="utf-8">
            <div class="input-group">
                <input type="text" name="songsName" class="form-control" placeholder="MV搜索">
                <form class="input-group-btn">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="submit">搜索</button>
                      </span>
            </div><!-- /input-group -->
        </form>
    </div><!-- /.col-lg-6 -->
</div><!-- /.row -->
<div class="col-md-6">
    <div class="list-group">
        <a href="#" class="list-group-item active">
            <h4 class="list-group-item-heading">我的最爱</h4>
            <p class="list-group-item-text">只推荐我喜欢的❤️</p>
        </a>
        <a href="playMusic?id=31234186" class="list-group-item" target="_blank">邓紫棋-单行的轨道</a>
        <a href="playMusic?id=36270426" class="list-group-item" target="_blank">邓紫棋-来自天堂的魔鬼</a>
        <a href="playMusic?id=36103237" class="list-group-item" target="_blank">邓紫棋-一路逆风</a>
        <a href="playMusic?id=29450548" class="list-group-item" target="_blank">邓紫棋-龙卷风</a>
        <a href="playMusic?id=449818741" class="list-group-item" target="_blank">邓紫棋-光年之外</a>
        <a href="playMusic?id=36024806" class="list-group-item" target="_blank">邓紫棋-再见</a>
        <a href="playMusic?id=420513158" class="list-group-item" target="_blank">邓紫棋-红蔷薇白玫瑰</a>
        <a href="playMusic?id=234015" class="list-group-item" target="_blank">邓紫棋-A.I.N.Y. 爱你</a>
        <a href="playMusic?id=28793502" class="list-group-item" target="_blank">邓紫棋-后会无期</a>
        <a href="playMusic?id=4466775" class="list-group-item" target="_blank">lostrivers</a>
    </div>
</div>
<div class="col-md-6">
    <div class="list-group">
        <a href="#" class="list-group-item active">
            <h4 class="list-group-item-heading">伤感</h4>
            <p class="list-group-item-text">只推荐我最伤感的❤️</p>
        </a>
        <a href="playMusic?id=25641369" class="list-group-item" target="_blank">周杰伦-明明就</a>
        <a href="playMusic?id=293768" class="list-group-item" target="_blank">陶晶莹-太委屈</a>
        <a href="playMusic?id=432506345" class="list-group-item" target="_blank">陈一发儿-童话镇</a>
        <a href="playMusic?id=201487" class="list-group-item" target="_blank">左宏元-渡情</a>
        <a href="playMusic?id=280765" class="list-group-item" target="_blank">彭佳慧-喜欢两个人</a>
        <a href="playMusic?id=30903117" class="list-group-item" target="_blank">周深-漂洋过海来看你</a>
        <a href="playMusic?id=32450986" class="list-group-item" target="_blank">周二珂-走在冷风中</a>
        <a href="playMusic?id=201507" class="list-group-item" target="_blank">左宏元-悲情面具</a>
        <a href="playMusic?id=34274468" class="list-group-item" target="_blank">刘瑞琪-来不及</a>
        <a href="playMusic?id=418603077" class="list-group-item" target="_blank">周杰伦-告白气球</a>
    </div>
</div>
</body>
</html>