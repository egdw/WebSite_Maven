<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>临时网站</title>
</head>
<body>
	<jsp:include page="/project_top.jsp"></jsp:include>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">趣味项目</h3>
		</div>
		<div class="panel-body">
			<c:forEach items="${requestScope.projects}" var="list" varStatus="i">
				<a href="${list.tempUrl}" class="list-group-item" target="_blank">
					<h4 class="list-group-item-heading">
						<c:out value="${list.tempTopic}" />
					</h4>
					<p class="list-group-item-text">${list.tempText}</p>
				</a>
			</c:forEach>
		</div>
	</div>
</body>
</html>