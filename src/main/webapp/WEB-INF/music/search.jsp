<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<jsp:include page="/music_top.jsp"></jsp:include>
<center>
    <form class="navbar-form navbar-center" action="search" method="post" accept-charset="utf-8">
        <div class="form-group">
            <input type="text" name="songsName" class="form-control" placeholder="音乐搜索">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
    </form>
    
    <form class="navbar-form navbar-center" action="mvsearch" method="post" accept-charset="utf-8">
    	 <div class="form-group">
            <input type="text" name="songsName" class="form-control" placeholder="MV搜索">
        </div>
        <button type="submit" class="btn btn-default">搜索</button>
    </form>

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
</center>
<!--警告信息-->
<nav class="navbar navbar-default navbar-fixed-bottom">
    <div class="container">
        <center>
            <div class="alert alert-info" role="alert" style="margin: 0px auto">本站所有源码均开源.转载请标注源作者!!</div>
        </center>
    </div>
</nav>
<!--警告信息结束-->
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</html>