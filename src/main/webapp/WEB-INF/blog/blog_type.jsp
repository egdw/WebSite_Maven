<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>恶搞大王的个人博客分类</title>
</head>

<body>
	<jsp:include page="/MyBlog_top.jsp"></jsp:include>
	<div class="panel panel-default">
		<div class="panel-heading">
			最新<span class="glyphicon glyphicon-list-alt" aria-hidden="true"></span>
		</div>
		<div class="panel-body">
			<div class="row">
				<c:forEach items="${requestScope.list}" var="index">
					<div class="col-sm-6 col-md-4">
						<div class="thumbnail" style="height: 320px">
							<center>
								<div style="width: 300px;height: 150px;overflow: hidden;">
									<c:if test="${!empty index.picUrl}">
										<img src="<%=request.getContextPath()%>/${index.picUrl}"
											alt="pic" width="300">
									</c:if>
									<c:if test="${empty index.picUrl}">
										<img src="<%=request.getContextPath()%>/images/noimg.jpeg"
											alt="pic" width="220" >
									</c:if>
								</div>
								<div class="caption">
									<h3>
										<a href="detail?pageId=${index.id}"></a>${index.title}</h3>
									<%-- <p>${index.content}</p> --%>
									<p>
										<a href="detail?pageId=${index.id}" class="btn btn-primary"
											role="button">详情</a> <span class="label label-default"><fmt:formatDate
												value="${index.createTime}" pattern="yyyy-MM-dd HH:mm" /></span>
										<span class="label label-default">阅读(${index.clickTimes})</span>
										<span class="label label-default">评论(${index.commentTimes})</span>
									</p>
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
								href="<%=request.getContextPath()%>/blog/type?pageNum=${index-1}&typeId=${requestScope.typeId}">${index}</a></li>
						</c:if>
						<c:if test="${requestScope.currentPage!=index}">
							<li><a
								href="<%=request.getContextPath()%>/blog/type?pageNum=${index-1}&typeId=${requestScope.typeId}">${index}</a></li>
						</c:if>
					</c:forEach>
				</ul>
			</center>
		</div>
	</div>
	</div>
</body>
</html>
