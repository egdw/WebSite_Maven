<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
    <title>恶搞大王的个人博客</title>
</head>
<body onload="getUserTable()">
<%--<body style="background-image: url(/images/blog_bg.png);>--%>
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<link rel="stylesheet" type="text/css" href="/css/MyBlog_files/default.css">
<link href="/css/MyBlog_files/site.css" rel="stylesheet" type="text/css"/>
<!--正文开始-->
<script src="/layui/dist/APlayer.min.js"></script>
<div class="col-md-9">
    <div class="row-md-1">
        <div id="bannerDiv">
            <%@include file="/banner.html" %>
        </div>
        <div class="row-md-9">
            <div class="panel panel-default">
                <div class="panel-heading">
                    最新博文<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <c:forEach items="${requestScope.list}" var="index">
                            <div class="row-sm-1">
                                <div class="thumbnail" style="height: 210px;width: 100%">
                                        <%--<div class="row-sm-1" style="padding: 10px">--%>
                                        <%----%>
                                        <%--</div>--%>
                                    <div class="media">
                                        <div style="float: left;padding-top: 10px;padding-left: 5px;">
                                            <c:if test="${!empty index.picUrl}">
                                                <a href="detail?pageId=${index.id}" target="_blank"><img
                                                        src="<%=request.getContextPath()%>/${index.picUrl}"
                                                        alt="${index.title}" class="img-thumbnail" width="150"/></a>
                                            </c:if>
                                            <c:if test="${empty index.picUrl}">
                                                <a href="detail?pageId=${index.id}" target="_blank"><img
                                                        src="<%=request.getContextPath()%>/images/noimg.jpeg"
                                                        alt="图片找不到鸟" class="img-thumbnail" width="150"/></a>
                                            </c:if>
                                        </div>
                                        <div class="media-body">
                                            <h4 class="media-heading" style="margin-top: 10px">
                                                <a href="detail?pageId=${index.id}" target="_blank"
                                                   style="font-size: 20px;color: #00a67c;padding: 10px">${index.title}</a>
                                            </h4>
                                            <p style="padding: 10px;">
                                                估摸着各位小伙伴儿被想使用CrawlSpider的Rule来抓取JS，相当受折磨； CrawlSpider Rule总是不能和Splash结合。
                                                废话不多说，手疼···· 来替换掉Ru...
                                            </p>
                                            <p style="float: right;padding-top: 65px;padding-right: 10px;" class="hidden-xs hidden-sm">
                                                <span class="label label-default"><fmt:formatDate
                                                               value="${index.createTime}"
                                                               pattern="yyyy-MM-dd HH:mm"/></span>
                                                <span class="label label-default">阅读(${index.clickTimes})</span>
                                                <span class="label label-default">评论(${index.commentTimes})</span>
                                                <span class="label label-danger">喜欢(${index.agreeWithTimes})</span>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <center>
                        <ul class="pagination">
                            <c:forEach var="index" begin="1" end="${requestScope.pageCount}">
                                <c:if test="${requestScope.currentPage==index}">
                                    <li><a style="color: #000000"
                                           href="<%=request.getContextPath()%>/blog/?pageNum=${index-1}">${index}</a>
                                    </li>
                                </c:if>
                                <c:if test="${requestScope.currentPage!=index}">
                                    <li><a
                                            href="<%=request.getContextPath()%>/blog/?pageNum=${index-1}">${index}</a>
                                    </li>
                                </c:if>
                            </c:forEach>
                        </ul>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="col-md-3">
    <div class="htmleaf-container">
        <div class="row-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    最新照片<span class="glyphicon glyphicon-camera" aria-hidden="true"></span>
                </div>
                <div class="panel-body">
                    <div id="myCarousel" class="carousel slide">
                        <!-- 轮播（Carousel）指标 -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                            <li data-target="#myCarousel" data-slide-to="4"></li>
                        </ol>
                        <!-- 轮播（Carousel）项目 -->
                        <div class="carousel-inner">
                            <c:forEach items="${requestScope.images}" var="index" varStatus="i">
                                <c:if test="${i.index == 0}">
                                    <div class="item active">
                                        <center>
                                            <a> <img
                                                    src="<%=request.getContextPath()%>/${index.urlThumb}"
                                                    class="center-block" height="240px" style="height: 240px">
                                            </a>
                                        </center>
                                    </div>
                                </c:if>
                                <c:if test="${i.index != 0}">
                                    <div class="item">
                                        <center>
                                            <a> <img
                                                    src="<%=request.getContextPath()%>/${index.urlThumb}"
                                                    class="center-block" height="240px" style="height: 240px">
                                            </a>
                                        </center>
                                    </div>
                                </c:if>
                            </c:forEach>
                        </div>
                        <!-- 轮播（Carousel）导航 -->
                        <a class="carousel-control left" href="#myCarousel"
                           data-slide="prev"><span
                                class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                        </a> <a class="carousel-control right" href="#myCarousel"
                                data-slide="next"><span
                            class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    </a>
                    </div>
                </div>
            </div>
        </div>

        <div class="row-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <b>阅读排行</b> <span
                        class="glyphicon glyphicon-book" aria-hidden="true"></span></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul class="demo1">
                                <c:forEach items="${requestScope.topComments}" var="index"
                                           varStatus="i">
                                    <table cellpadding="4">
                                        <tr>
                                            <td><span class="badge"
                                                      style="font-size: 20px;width: 27px;color: lightskyblue;background-color: snow;float: left">${i.index+1}</span>
                                            </td>
                                            <td>
                                                <c:if test="${!empty index.picUrl}">
                                                    <img src="<%=request.getContextPath()%>/${index.picUrl}"
                                                         data-lightbox="example-set" alt="" width="60"
                                                         style="overflow:hidden;padding-top: 10px;padding-bottom: 10px;"
                                                         class="img-rounded">
                                                </c:if>
                                                <c:if test="${empty index.picUrl}">
                                                    <img src="<%=request.getContextPath()%>/images/noimg.jpeg"
                                                         data-lightbox="example-set" alt="图片找不到鸟" width="60"
                                                         style="overflow:hidden;padding-top: 10px;padding-bottom: 10px;"
                                                         class="img-rounded">
                                                </c:if>
                                            </td>
                                            <td>
                                                <a style="color: slategray;padding: 10px"
                                                   href="detail?pageId=${index.id}">
                                                        ${index.title }</a></td>
                                        </tr>
                                    </table>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-md-3">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <b>评论排行</b> <span
                        class="glyphicon glyphicon-comment" aria-hidden="true"></span></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul class="demo2">
                                <c:forEach items="${requestScope.topReader}" var="index"
                                           varStatus="i">
                                    <li class="news-item"><span class="badge"
                                                                style="font-size: 20px;width: 27px;color: lightskyblue;background-color: snow">${i.index+1}</span>
                                        <a style="color: slategray;padding: 10px"
                                           href="detail?pageId=${index.id}">
                                                ${index.title }</a></li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-md-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                   <b>最新评论</b> <span
                        class="glyphicon glyphicon-comment" aria-hidden="true"></span></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <ul id="demo3">
                                <c:forEach items="${requestScope.comments}" var="index" varStatus="i">
                                    <li class="news-item">
                                        <a
                                                style="font-size: 15px;overflow: hidden;text-overflow:ellipsis;width: 300px;display: block;;padding-left: 10px; padding-top: 10px;padding-bottom: 10px"
                                                href="detail?pageId=${index.blogId}"><b>${index.username} </b>:  ${index.content}</span></b>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row-md-2">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <b>音乐盒</b> <span
                        class="glyphicon glyphicon-music" aria-hidden="true"></span></div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-xs-12">
                            <div id="player1" class="aplayer"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script
        src="<%=request.getContextPath()%>/css/MyBlog_files/lightbox.js"></script>
<script src="/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>
<script type="text/javascript">
    var ap5 = null;
    function getUserTable() {
        $.ajax({
            url: '/music/getSongsTable',
            type: 'GET', //GET
            async: true,    //或false,是否异步
            timeout: 5000,    //超时时间
            dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data, textStatus, jqXHR) {
                ap5 = new APlayer({
                    element: document.getElementById('player1'),
                    narrow: false,
                    autoplay: false,
                    showlrc: 3,
                    mutex: true,
                    theme: '#ad7a86',
                    mode: 'random',
                    listmaxheight: '180px',
                    music: data
                });
            },
            error: function (xhr, textStatus) {
                console.log('错误');
            },
        })
    }

    $(function () {
        $(".demo1").bootstrapNews({
            newsPerPage: 4,
            autoplay: false,
            pauseOnHover: true,
            direction: 'up',
            newsTickerInterval: 4000,
            onToDo: function () {
            }
        });
        $(".demo2").bootstrapNews({
            newsPerPage: 9,
            autoplay: false,
            pauseOnHover: true,
            direction: 'up',
            newsTickerInterval: 2500,
            onToDo: function () {
            }
        });
        $("#demo3").bootstrapNews({
            newsPerPage: 10,
            autoplay: false,
            pauseOnHover: true,
            direction: 'up',
            newsTickerInterval: 2500,
            onToDo: function () {
            }
        });
    });
</script>
</body>
</html>
