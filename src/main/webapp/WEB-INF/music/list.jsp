<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>音乐搜索</title>
</head>
<link
        href="<%=request.getContextPath()%>/css/music_css/bootstrap.min.css"
        rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/music_css/my.css"
      rel="stylesheet">
<body>
<jsp:include page="/music_top.jsp"></jsp:include>
<c:if test="${empty requestScope.errorMessage}">
    <div class="alert alert-success" role="alert">查询成功!一共有${requestScope.songCount}条数据,您当前处于第${requestScope.pageCount+1}页.</div>
</c:if>
<c:if test="${not empty requestScope.errorMessage}">
    <div class="alert alert-danger" role="alert">${requestScope.errorMessage}</div>
</c:if>
<!--主内容开始 -->
<ul class="list-group">
    <li class="list-group-item">
        <div class="row">
            <c:forEach items="${requestScope.lists}" var="index">
                <div class="col-sm-6 col-md-4">
                    <div class="thumbnail">
                        <img src="${index.album.picUrl}" width="400px" height="350px"
                             style="width:400px;height:350px;overflow:hidden;"
                             alt="${index.name}">
                        <div class="caption">
                            <h4>${index.name}</h4>
                            <p>
                                <c:forEach items="${index.artists}" var="item">
                                    <a href="http://music.163.com/#/artist?id=${item.id}"
                                       target="_blank">${item.name}</a>|
                                </c:forEach>
                            </p>
                            <div>
                                <a href="playMusic?id=${index.id}" target="_blank"
                                   class="btn btn-primary" role="button">播放</a>
                                <div class="btn-group">

                                    <button type="button" class="btn btn-default dropdown-toggle"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        下载 <span class="caret"></span>
                                    </button>
                                    <ul class="dropdown-menu">
                                        <li><a target="_blank" href="${index.mp3Url}">差(96 kbps)</a></li>
                                        <li><a target="_blank" href="musicDownload?id=${index.id}&rate=128000">普通(128 kbps)</a></li>
                                        <li><a target="_blank" href="musicDownload?id=${index.id}&rate=192000">较高(192 kbps)</a></li>
                                        <li><a target="_blank" href="musicDownload?id=${index.id}&rate=320000">极高(320 kbps)</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </li>
</ul>
<!-- 主内容结束-->
<!-- 分页开始 -->
<center>
    <div class="btn-group" role="group" aria-label="...">
        <form action="search" method="post" style="float: left;">
            <input type="hidden" name="pageNum"
                   value="${requestScope.pageNum-1}"> <input type="hidden"
                                                             name="songsName" value="${requestScope.songsName}"> <input
                type="submit" class="btn btn-default" value="上一页">
        </form>
        <form action="search" method="post" style="float: left;">
            <input type="hidden" name="pageNum" value="0"> <input
                type="hidden" name="songsName" value="${requestScope.songsName}">
            <button type="submit" class="btn btn-default">第一页</button>
        </form>
        <form action="search" method="post" style="float: left;">
            <input type="hidden" name="pageNum"
                   value="${requestScope.pageNum+1}"> <input type="hidden"
                                                             name="songsName" value="${requestScope.songsName}">
            <button type="submit" class="btn btn-default">下一页</button>
        </form>
    </div>
</center>
<!-- 分页结束 -->
</body>
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</html>