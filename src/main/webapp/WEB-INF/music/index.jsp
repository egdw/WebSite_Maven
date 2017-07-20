<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>恶搞大王音乐</title>
</head>
<link href="<%=request.getContextPath()%>/css/music_css/bootstrap.min.css" rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/music_css/my.css" rel="stylesheet">
<body>
<jsp:include page="/music_top.jsp"></jsp:include>
<!--巨幕开始-->
<div class="jumbotron">
    <center><h1>欢迎您使用恶搞大王音乐</h1></center>
    <center><p>本网站采用网易云音乐的接口,所有的音乐全部来源于网易云音乐.涉及侵权.使用需谨慎!</p></center>
    <center><p><a class="btn btn-primary btn-lg" href="<%=request.getContextPath()%>/music/searchView" role="button">开始使用</a></p></center>
</div>

<!--巨幕结束-->

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