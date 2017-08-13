<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>恶搞大王的个人博客分类</title>
</head>

<body>
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<div class="col-md-9">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            最新 <span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="color:#d56464"></span>
        </div>
        <div class="panel-body">
            <div class="row">
                <c:forEach items="${requestScope.list}" var="index">
                    <div class="row-sm-1">
                        <div class="thumbnail" style="height: 210px;width: 100%">
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
                                            ${index.description}
                                    </p>
                                    <p style="float: right;padding-top: 65px;padding-right: 10px;"
                                       class="hidden-xs hidden-sm">
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
                                   href="<%=request.getContextPath()%>/blog/type?pageNum=${index-1}&typeId=${requestScope.typeId}">${index}</a>
                            </li>
                        </c:if>
                        <c:if test="${requestScope.currentPage!=index}">
                            <li><a
                                    href="<%=request.getContextPath()%>/blog/type?pageNum=${index-1}&typeId=${requestScope.typeId}">${index}</a>
                            </li>
                        </c:if>
                    </c:forEach>
                </ul>
            </center>
        </div>
    </div>
</div>
<jsp:include page="/recommend.jsp"></jsp:include>
</body>
</html>
