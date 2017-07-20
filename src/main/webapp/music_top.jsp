<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-cn">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>恶搞大王音乐</title>
</head>
<link
	href="<%=request.getContextPath()%>/css/music_css/bootstrap.min.css"
	rel="stylesheet">
<link href="<%=request.getContextPath()%>/css/music_css/my.css"
	rel="stylesheet">
<body>
	<!-- 导航栏开始-->
	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
					aria-expanded="false">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=request.getContextPath()%>/music/">恶搞大王音乐</a>
			</div>

			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li class=""><a href="<%=request.getContextPath()%>/music/">音乐首页
							<span class="sr-only">(current)</span>
					</a></li>
					<li class=""><a
						href="<%=request.getContextPath()%>/music/searchView">MV搜索点击这里!</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">关于 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal"
								data-target="#about-modal" data-backdrop="false">关于网站作者</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="#" data-toggle="modal"
								data-target="#aboutInterface" data-backdrop="false">关于接口</a></li>
						</ul></li>
				</ul>
				<form class="navbar-form navbar-left" accept-charset="utf-8"
					action="<%=request.getContextPath()%>/music/search" method="post">
					<div class="form-group">
						<input type="text" name="songsName" class="form-control"
							placeholder="请在这里进行搜索!">
					</div>
					<button type="submit" class="btn btn-default">搜索</button>
				</form>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="<%=request.getContextPath()%>/">个人首页</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-haspopup="true"
						aria-expanded="false">其他地址 <span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a
								href="<%=request.getContextPath()%>/project/MyProject.do">我的作品</a></li>
							<li><a href="<%=request.getContextPath()%>/blog/">我的博客</a></li>
							<li><a href="<%=request.getContextPath()%>/funnyView.do">趣味网页</a></li>
							<li><a href="<%=request.getContextPath()%>/tempView.do">临时网页</a></li>
							<li><a href="<%=request.getContextPath()%>/music">我的音乐</a></li>
							<li role="separator" class="divider"></li>
							<li><a
								href="<%=request.getContextPath()%>/AboutMy/index.html">关于我</a></li>
						</ul></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container-fluid -->
	</nav>

	<!--隐藏的关于接口div-->
	<div class="modal fade" id="aboutInterface" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">关于接口</h4>
				</div>
				<div class="modal-body">
					<p>获取单独MV信息</p>
					<p>URL url = new
						URL("http://music.163.com/api/mv/detail?id=5382080&type=mp4");</p>
					<p>重要的内容搜索</p>
					<p>offset：偏移量（分页用） limit：获取的数量 type：搜索的类型 歌曲 1 专辑 10 歌手 100
						歌单 1000 用户 1002 mv 1004 歌词 1006 主播电台 1009</p>
					<p>URL url = new
						URL("http://music.163.com/api/search/pc?s=告白气球&offset=0&limit=10&type=1006");</p>
					<p>搜索歌词</p>
					<p>URL url = new
						URL("http://music.163.com/api/song/lyric?os=pc&id=418603077&lv=-1&kv=-1&tv=-1");</p>
					<p>获取到详细的歌曲信息</p>
					<p>URL url = new
						URL("http://music.163.com/api/song/detail/?id=418603077&ids=[418603077]");</p>
					<p>URL url = new
						URL("http://music.163.com/api/artist/albums/166009?id=166009&offset=0&total=true&limit=5");</p>
					<p>头信息</p>
					<p>openConnection.setRequestProperty("Cookie",
						"appver=1.5.0.75771");
						openConnection.setRequestProperty("Referer",
						"http://music.163.com/");</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">了解</button>
				</div>
			</div>
		</div>
	</div>
	<!--隐藏的关于接口div-->

	<!--关于div-->
	<div class="modal fade" id="about-modal" tabindex="-1" role="dialog"
		aria-labelledby="modal-label" aria-hidden="true">
		<div class="modal-dialog">
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
						<p>关于</p>
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
					<p style="text-align: right">恶搞大王版权所有</p>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--关于div-->
</body>
</html>