<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<!-- saved from url=(0028)http://love.kfj.cc/index.php -->
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="charset" content="utf-8">
<title>欢迎你</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script
	src="<%=request.getContextPath()%>/css/admin_index/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin_index/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/css/admin_index/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: "微软雅黑", "Microsoft YaHei";
	background: #eee;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/css/admin_index/js.js"></script>
<style type="text/css" adt="123"></style>
</head>
<body>
	<button class="btn btn-primary btn-lg" id="wabutton"
		style="display:none;" data-toggle="modal" data-target="#alert_modal"></button>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/admin_index/ui.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/admin_index/my.css">
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/css/admin_index/my.js"></script>
	<div id="mok_bgimg"
		style="width:100%;height:100%;background-size:100% 100%;background-image:url(&#39;/az/hprichbg/rb/MartianCrater_ZH-CN9867068013_1920x1080.jpg&#39;);position:fixed;"></div>
	<style>
.container .nav>li>a {
	color: #FF3030
}

.navbar-default .navbar-nav>li>a,.navbar-default .navbar-brand {
	color: #EEAEEE !important
}
</style>
	<div class="navbar navbar-default" role="navigation">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">后台管理</span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> <span class="icon-bar"></span>
			</button>
			<a class="navbar-brand"
				href="<%=request.getContextPath()%>/login/manager">后台管理</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li class="dropdown"><a href="http://love.kfj.cc/index.php#"
					class="dropdown-toggle" data-toggle="dropdown"><span
						class="glyphicon glyphicon-list-alt"></span> 功能菜单 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li class=""><a
							href="<%=request.getContextPath()%>/login/manager"><span
								class="glyphicon glyphicon-home"></span> 管理首页</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/index.jsp"><span
								class="glyphicon glyphicon-home"></span> 个人主页</a></li>
						<li class=""><a href="<%=request.getContextPath()%>/blog/"><span
								class="glyphicon glyphicon-home"></span> 博客首页</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_person_setting.do"><span
								class="glyphicon glyphicon-wrench"></span> 个人设置</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_project_manager.do"><span
								class="glyphicon glyphicon-link"></span> 项目管理</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"><span
								class="glyphicon glyphicon-calendar"></span> 趣味管理</a></li>
						<li><a
							href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"><span
								class="glyphicon glyphicon-exclamation-sign"></span> 临时管理</a></li>
						<li><a href="<%=request.getContextPath()%>/blog/admin"><span
								class="glyphicon glyphicon-ban-circle"></span> 博客管理</a></li>
						<li><a href="<%=request.getContextPath()%>/album/album"><span
								class="glyphicon glyphicon-cloud-upload"></span> 相册管理</a></li>
					</ul></li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="logout.do"><span
						class="glyphicon glyphicon-off"></span> 退出登录</a></li>
			</ul>
			<ul class="nav navbar-nav">
				<li class="dropdown"><a
					href="<%=request.getContextPath()%>/AboutMy/index.html"
					class="dropdown-toggle" data-toggle="dropdown"><span
						class="glyphicon glyphicon-book"></span> 关于 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a
							href="<%=request.getContextPath()%>/AboutMy/index.html"
							target="_blank">恶搞大王</a></li>
					</ul></li>
			</ul>
		</div>
	</div>

	<div class="container bs-docs-container">
		<div class="row">
			<div class="col-md-3">
				<div class="bs-sidebar hidden-print visible-lg visible-md"
					role="complementary">
					<ul class="nav bs-sidenav">
						<li></li>
						<li class="active"><a
							href="<%=request.getContextPath()%>/login/manager"><span
								class="glyphicon glyphicon-home"></span> 管理首页</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_person_setting.do"><span
								class="glyphicon glyphicon-wrench"></span> 个人设置</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_project_manager.do"><span
								class="glyphicon glyphicon-link"></span> 项目管理</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"><span
								class="glyphicon glyphicon-calendar"></span> 趣味管理</a></li>
						<li><a
							href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"><span
								class="glyphicon glyphicon-exclamation-sign"></span> 临时管理</a></li>
						<li><a href="<%=request.getContextPath()%>/blog/admin"><span
								class="glyphicon glyphicon-ban-circle"></span> 博客管理</a></li>
						<li><a href="<%=request.getContextPath()%>/album/album"><span
								class="glyphicon glyphicon-cloud-upload"></span> 相册管理</a></li>

					</ul>
				</div>
			</div>
			<div class="col-md-9" role="main">

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">程序信息</h3>
					</div>
					<div class="panel-body">
						<span id="avatar" style="float:right;"><img
							src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
							class="img-rounded" height="80px" width="80px"></span>欢迎来到后台管理! <br>
						点击上方导航栏的 功能菜单 可以列出所有功能 <br> 此程序作者为 <a
							href="<%=request.getContextPath()%>/AboutMy/index.html"
							target="_blank">恶搞大王</a> <br> 恶搞大王保留所有权利
					</div>
				</div>


				<div class="panel panel-warning">
					<div class="panel-heading">
						<h3 class="panel-title">用户信息</h3>
					</div>
					<ul class="list-group">
						<li class="list-group-item"><span
							class="glyphicon glyphicon-bullhorn"></span> <b>公告：</b>Hello
							World!</li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-user"></span> <b>用户组：</b> 管理员</li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-info-sign"> </span> <c:if
								test="${not empty requestScope.user.userEmail}">
								您已经绑定邮箱<a
									href="<%=request.getContextPath()%>/manager/manager_person_setting.do">${requestScope.user.userEmail}</a>
							</c:if> <c:if test="${empty requestScope.user.userEmail}">
								 您还没绑定邮箱<a
									href="<%=request.getContextPath()%>/manager/manager_person_setting.do">前往绑定</a>
							</c:if></li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-info-sign"></span> <c:if
								test="${not empty requestScope.user.userPhone}">
							 您已绑定手机<a
									href="<%=request.getContextPath()%>/manager/manager_person_setting.do">${requestScope.user.userPhone }</a>
							</c:if> <c:if test="${empty requestScope.user.userPhone}">
								您还没有绑定手机<a
									href="<%=request.getContextPath()%>/manager/manager_person_setting.do">前往绑定</a>
							</c:if></li>
						<li class="list-group-item"><span
							class="glyphicon glyphicon-stats"></span> <b>状态统计信息：</b> <span
							id="stat" onclick="view_status(this);"><a
								href="javascript:void(0)">点击查看</a></span></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
</html>