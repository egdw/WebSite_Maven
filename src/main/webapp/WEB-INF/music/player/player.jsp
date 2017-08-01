<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv=”X-UA-Compatible” content=”IE=edge,chrome=1″ />
<title>${requestScope.movie.name}</title>
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/playercss/css/reset.css" />
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/playercss/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css"
	href="<%=request.getContextPath()%>/css/playercss/css/willesPlay.css" />
<script
	src="<%=request.getContextPath()%>/css/playercss/js/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="<%=request.getContextPath()%>/css/playercss/js/willesPlay.js"
	type="text/javascript" charset="utf-8"></script>
</head>
<body>
	<center>
		<h1>如果视频不能播放请看下面!</h1>
	</center>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div id="willesPlay">
					<div class="playHeader">
						<div class="videoName">${requestScope.movie.name}</div>
					</div>
					<div class="playContent">
						<div class="turnoff">
							<ul>
								<li><a href="javascript:" title="关灯"
                                       class="btnLight on glyphicon glyphicon-sunglasses"></a></li>
							</ul>
						</div>
						<video width="100%" height="100%" id="playVideo">
							<source src="${requestScope.movie.brs.bq}" type="video/mp4"></source>
							当前浏览器不支持 video直接播放，点击这里下载视频：
							<a href="/">下载视频</a>
						</video>
						<div class="playTip glyphicon glyphicon-play"></div>
					</div>
					<div class="playControll">
						<div class="playPause playIcon"></div>
						<div class="timebar">
							<span class="currentTime">0:00:00</span>
							<div class="progress">
								<div
									class="progress-bar progress-bar-danger progress-bar-striped"
									role="progressbar" aria-valuemin="0" aria-valuemax="100"
									style="width: 0%"></div>
							</div>
							<span class="duration">0:00:00</span>
						</div>
						<div class="otherControl">
							<span class="volume glyphicon glyphicon-volume-down"></span> <span
								class="fullScreen glyphicon glyphicon-fullscreen"></span>
							<div class="volumeBar">
								<div class="volumewrap">
									<div class="progress">
										<div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuemin="0" aria-valuemax="100"
											style="width: 8px;height: 40%;"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<center>
		<h1>点击下面的链接即可!(复制到下载工具即可下载!)</h1>
		<h2>
			<a href="${requestScope.movie.brs.bq}" target="_blank">最低画质(240p)</a>
		</h2>
		<h2>
			<a href="${requestScope.movie.brs.lq}" target="_blank">低画质(480p)</a>
		</h2>
		<h2>
			<a href="${requestScope.movie.brs.mq}" target="_blank">中等画质(720p)</a>
		</h2>
		<h2>
			<a href="${requestScope.movie.brs.hq}" target="_blank">高画质(1080p)</a>
		</h2>
		<h1>部分浏览器不支持在本页播放</h1>
		<h1>支持UC浏览器,edge,IE,安卓版QQ内嵌浏览器!</h1>
		<h1>打开链接如果出现403错误!</h1>
		<h1>请点击链接页面地址输入栏回车即可开始播放!</h1>
	</center>
</body>
</html>
