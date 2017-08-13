<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>临时网站</title>
</head>
<body>
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<div class="col-md-9">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            <h3 class="panel-title">趣味项目 <span class="glyphicon glyphicon-th-list" aria-hidden="true"
                                               style="color:#d56464"/></h3>
        </div>
        <div class="panel-body">
            <c:forEach items="${requestScope.projects}" var="list" varStatus="i">
                <a href="${list.tempUrl}" class="list-group-item" target="_blank">
                    <h4 class="list-group-item-heading">
                        <c:out value="${list.tempTopic}"/>
                    </h4>
                    <p class="list-group-item-text">${list.tempText}</p>
                </a>
            </c:forEach>
        </div>
    </div>
</div>
<jsp:include page="/recommend.jsp"></jsp:include>
</body>
</html>