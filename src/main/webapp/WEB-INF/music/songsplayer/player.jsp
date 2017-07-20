<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>${requestScope.songs[0].name}</title>

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/musicplayer/css/style.css"
	media="screen" type="text/css" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
	<div style="text-align:center;clear:both"></div>
	<div id="container">
		<label class="to-back-label" for="to-back"><i
			class="fa fa-bars fa-lg"></i></label> <input type="checkbox" id="to-back">
		<!-- playlist toggle -->
		<canvas id="progress" width="320" height="320"></canvas>
		<!-- progress bar -->
		<div id="player">
			<audio id="audio" controls hidden="hidden">
				<source src="${requestScope.songs[0].mp3Url}" type="audio/mpeg"
					codecs="mp3"></source>
			</audio>
			<img src="${requestScope.songs[0].album.picUrl}">
			<!-- album cover -->
			<label class="to-lyrics-label" for="to-lyrics"><i
				class="fa fa-caret-down fa-lg"></i></label> <input type="checkbox"
				id="to-lyrics">
			<!-- lyrics toggle -->
			<div class="cover">
				<div class="controls">
					<!-- <button id="backward" title="Backward">
						<i class="fa fa-retweet fa-lg"></i>
					</button> -->
					<button id="backward" title="Backward">
						<i class="fa fa-backward fa-2x"></i>
					</button>
					<button id="play-pause" title="Play" onclick="togglePlayPause()">
						<i class="fa fa-play fa-3x"></i>
					</button>
					<button id="forward" title="Forward">
						<i class="fa fa-forward fa-2x"></i>
					</button>
					<!-- <button id="backward" title="Backward">
						<i class="fa fa-random fa-lg"></i>
					</button> -->
					<input id="volume" name="volume" min="0" max="1" step="0.1"
						type="range" onchange="setVolume()" />
				</div>
				<!-- #controls -->
				<div class="lyrics">
					<c:forEach items="${requestScope.lyricsList}" var="index">
						<p>${index}</p>
					</c:forEach>
				</div>
				<!-- #lyrics -->
				<p class="scroll">滚动下滑</p>
			</div>
			<!-- #cover -->
		</div>
		<!-- #player -->
		<div id="flip-back">
			<ul class="playlist">
				<h3>${requestScope.songs[0].name}</h3>
				<c:forEach items="${requestScope.lyricsList}" var="index">
					<li><p>${index}</p></li>
				</c:forEach>
			</ul>
		</div>
		<!-- #flip-back -->
	</div>
	<!-- #container -->

	<script src="<%=request.getContextPath()%>/js/index.js"></script>

</body>

</html>