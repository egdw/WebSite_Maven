<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>恶搞大王的个人博客</title>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet"
	href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap-theme.min.css"
	integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp"
	crossorigin="anonymous">
<script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script
	src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->


<!-- Include all compiled plugins (below), or include individual files as needed -->
<!--<script src="js/bootstrap.min.js"></script>-->
</head>
<body>
	<nav class="navbar navbar-default navbar-static-top" style="width: 100%">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">恶搞大王的博客</a>
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class=""><a href="<%=request.getContextPath()%>/blog/">博客主页<span class="sr-only">(current)</span></a></li>
					<li><a href="<%=request.getContextPath()%>/index.jsp">个人主页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">博客分类 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="type?pageNum=0&typeId=0">学习</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="type?pageNum=0&typeId=1">生活</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="type?pageNum=0&typeId=2">随笔</a></li>
						</ul></li>
					<%-- <li><a href="<%=request.getContextPath()%>/blog/image">相册</a></li> --%>
					<li><a href="##" data-toggle="modal"
						data-target="#about-modal">关于</a></li>
					<li><a href="<%=request.getContextPath()%>/login/manager">管理</a></li>
				</ul>
				<form class="navbar-form navbar-left" action="blogFind" method="post">
					<div class="form-group">
						<input type="text" name="name"  class="form-control" placeholder="搜索您感兴趣的内容...">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>
	<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
		style="background-color:#FFFFF0" aria-labelledby="modal-label"
		aria-hidden="true">
		<div class="modal-dialog" style="background-color:#FFFFF0">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
					</button>
					<h4 class="modal-title" id="modal-label">关于</h4>
				</div>
				<div class="modal-body">
					<div
						style="text-align: center;padding-top:30px;padding-bottom: 10px">
						<p>恶搞大王的个人博客</p>
						<img
							src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
							width="100px" height="100px" class="img-circle">
						<div style="padding-top: 20px">
							<p>个人微信 ：HONGDEYAN1997</p>
							<p>个人QQ ：378759617</p>
							<p>邮箱 ：378759617@qq.com</p>
							<p>
								github ：<a href="https://github.com/egdw" target="_blank">https://github.com/egdw</a>
							</p>
							<p>好好学习,天天向上</p>
						</div>
					</div>
					<p style="text-align: right">恶搞大王制作</p>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>