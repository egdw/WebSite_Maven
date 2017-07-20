<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<html>
<head>
<title>相册</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/main.css" />
</head>
<body>
	<header id="header">
		<h1>
			<a href="<%=request.getContextPath()%>/image"><strong>恶搞大王相册</strong></a>
		</h1>
		<nav>
			<ul>
				<li><a href="<%=request.getContextPath()%>/index.jsp" class="icon fa-info-circle">主页</a></li>
			</ul>
		</nav>
	</header>
	<div id="wrapper">
		<!-- Main -->
		<div id="main">
			<c:forEach items="${requestScope.list}" var="index" varStatus="i">
				<article class="thumb">
					<a href="<%=request.getContextPath()%>/${index.url}" class="image"><img
						src="<%=request.getContextPath()%>/${index.urlThumb}" alt="" /></a>
					<h2>${index.title}</h2>
					<p>${index.title}</p>
				</article>
			</c:forEach>
		</div>
	</div>

	<!-- Scripts -->
	<script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
	<script
		src="https://cdn.bootcss.com/jquery.poptrox/2.5.1/jquery.poptrox.min.js"></script>
	<script src="https://cdn.bootcss.com/skel/3.0.1/skel.min.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/util.js"></script>
	<script src="<%=request.getContextPath()%>/assets/js/main.js"></script>

</body>
</html>