<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="charset" content="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal-default-theme.css">
<title>项目管理</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script
	src="<%=request.getContextPath()%>/css/admin_project_manager_files/jquery.min.js"></script>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/css/admin_project_manager_files/bootstrap.min.css">
<script
	src="<%=request.getContextPath()%>/css/admin_project_manager_files/bootstrap.min.js"></script>
<style type="text/css">
body {
	font-family: "微软雅黑", "Microsoft YaHei";
	background: #eee;
}

.remodal-bg.with-red-theme.remodal-is-opening,.remodal-bg.with-red-theme.remodal-is-opened
	{
	filter: none;
}

.remodal-overlay.with-red-theme {
	background-color: #f44336;
}

.remodal.with-red-theme {
	background: #fff;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/css/admin_project_manager_files/js.js"></script>
<style type="text/css">
</style>
</head>
<body>
	<button class="btn btn-primary btn-lg" id="wabutton"
		style="display:none;" data-toggle="modal" data-target="#alert_modal"></button>
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/admin_project_manager_files/ui.css">
	<link rel="stylesheet"
		href="<%=request.getContextPath()%>/css/admin_project_manager_files/my.css">
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/css/admin_project_manager_files/my.js"></script>
	<div id="mok_bgimg"
		style="width:100%;height:100%;background-size:100% 100%;background-image:url(&#39;/az/hprichbg/rb/VenetianFortifications_ZH-CN11140565989_1920x1080.jpg&#39;);position:fixed;"></div>
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
			<a class="navbar-brand" href="<%=request.getContextPath()%>/login/manager">后台管理</a>
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
						<li class=""><a
							href="<%=request.getContextPath()%>/blog/"><span
								class="glyphicon glyphicon-home"></span> 博客首页</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_person_setting.do"><span
								class="glyphicon glyphicon-wrench"></span> 个人设置</a></li>
						<li class="active"><a
							href="<%=request.getContextPath()%>/manager/manager_project_manager.do"><span
								class="glyphicon glyphicon-link"></span> 项目管理</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"><span
								class="glyphicon glyphicon-calendar"></span> 趣味管理</a></li>
						<li><a href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"><span
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
				<li class="dropdown"><a href="<%=request.getContextPath()%>/AboutMy/index.html"
					class="dropdown-toggle" data-toggle="dropdown"><span
						class="glyphicon glyphicon-book"></span> 关于 <b class="caret"></b></a>
					<ul class="dropdown-menu">
						<li><a href="<%=request.getContextPath()%>/AboutMy/index.html" target="_blank">恶搞大王</a></li>
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
						<li class=""><a href="<%=request.getContextPath()%>/login/manager"><span
								class="glyphicon glyphicon-home"></span> 管理首页</a></li>
						<li class=""><a href="<%=request.getContextPath()%>/manager/manager_person_setting.do"><span
								class="glyphicon glyphicon-wrench"></span> 个人设置</a></li>
						<li class="active"><a
							href="<%=request.getContextPath()%>/manager/manager_project_manager.do"><span
								class="glyphicon glyphicon-link"></span> 项目管理</a></li>
						<li class=""><a
							href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"><span
								class="glyphicon glyphicon-calendar"></span> 趣味管理</a></li>
						<li><a href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"><span
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
							class="img-rounded" height="80px" width="80px"></span>欢迎来到后台管理!
						<br> 点击上方导航栏的 功能菜单 可以列出所有功能 <br> 此程序作者为 <a href="<%=request.getContextPath()%>/AboutMy/index.html"
							target="_blank">恶搞大王</a> <br> 恶搞大王保留所有权利
					</div>
				</div>
			<div class="col-md-9" role="main">

				<!-- NAVI -->
				<ul class="nav nav-tabs" id="PageTab">
					<li class=""><a
						href="http://love.kfj.cc/index.php?mod=baiduid#adminid"
						data-toggle="tab"
						onclick="$(&#39;#newid2&#39;).css(&#39;display&#39;,&#39;none&#39;);$(&#39;#newid&#39;).css(&#39;display&#39;,&#39;none&#39;);$(&#39;#adminid&#39;).css(&#39;display&#39;,&#39;&#39;);"
						aria-expanded="false">增加项目</a></li>
					<li class="active"><a
						href="http://love.kfj.cc/index.php?mod=baiduid#newid"
						data-toggle="tab"
						onclick="$(&#39;#newid&#39;).css(&#39;display&#39;,&#39;&#39;);$(&#39;#adminid&#39;).css(&#39;display&#39;,&#39;none&#39;);$(&#39;#newid2&#39;).css(&#39;display&#39;,&#39;none&#39;);"
						aria-expanded="true">管理项目</a></li>
				</ul>
				<br>
				<!-- END NAVI -->

				<div class="tab-pane fade active in" id="newid">
					<a name="#adminid"></a>
					<div class="projects_list">
						<table border="1">
							<th>项目编号</th>
							<th>项目标题</th>
							<th>项目内容</th>
							<th>项目地址</th>
							<th>创建时间</th>
							<th>项目封面</th>
							<th>操作</th>
							<c:forEach items="${requestScope.projects}" var="index">
								<tr>
									<td>${index.projectId}</td>
									<td>${index.projectTopic}</td>
									<td>${index.projectText}</td>
									<td>${index.projectUrl}</td>
									<td><fmt:formatDate value="${index.projectCreateDate}"
											pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td><img
										src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
										width="50" height="50"></td>
									<td><input type="button" class="project_del_btn"
										value="删除"><br /> 
									<input type="button"
										class="project_update_btn" value="更新"></td>
								</tr>
							</c:forEach>
						</table>
						<div class="page-nav">
							<nav>
								<ul class="pagination">
									<c:forEach var="i" begin="1" end="${requestScope.allNum}">
										<c:if test="${i==pageNum}">
											<li class="active"><a
												href="<%=request.getContextPath()%>/manager/manager_project_manager.do?pageNum=${i-1}">${i}</a></li>
										</c:if>
										<c:if test="${i!=pageNum}">
											<li><a
												href="<%=request.getContextPath()%>/manager/manager_project_manager.do?pageNum=${i-1}">${i}</a></li>
										</c:if>
									</c:forEach>
								</ul>
							</nav>
						</div>
					</div>
				</div>
				<!-- END PAGE1 -->

				<div class="tab-pane fade" id="adminid" style="display: none;">
					<a name="#newid"></a>
					<div class="alert alert-warning" role="alert" id="addbdid_msg">
						项目请输入完整的路径,例如https://www.baidu.com<br />
					</div>
					<form method="post" id="addbdid_form"
						action="manager_project_add.do">
						<div class="input-group">
							<span class="input-group-addon">项目标题</span> <input type="text"
								class="form-control" id="project_topic" name="project_topic"
								placeholder="请输入项目标题" required="">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon">项目内容</span> <input type="text"
								class="form-control" name="project_text" id="project_text"
								placeholder="请输入项目内容" required="">
						</div>
						<br>
						<div class="input-group">
							<span class="input-group-addon">项目地址</span> <input type="text"
								class="form-control" name="project_url" id="project_url"
								placeholder="例如https://www.baidu.com" required="">
						</div>
						<br /> <a href="#modal"> <input type="button"
							class="btn btn-primary" value="提交">
						</a><br>
					</form>
					<div class="remodal" data-remodal-id="modal" role="dialog"
						aria-labelledby="modal1Title" aria-describedby="modal1Desc">
						<button data-remodal-action="close" class="remodal-close"
							aria-label="Close"></button>
						<div>
							<h2 id="modal1Title">项目提交</h2>
							<p id="modal1Desc">确定要提交项目吗?</p>
						</div>
						<br>
						<button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
						<button data-remodal-action="confirm" id="project_add_accpet_btn"
							class="remodal-confirm">OK</button>
					</div>
					<div class="remodal" data-remodal-id="modalupdate" role="dialog"
						aria-labelledby="modal1Title" aria-describedby="modal1Desc">
						<button data-remodal-action="close" class="remodal-close"
							aria-label="Close"></button>
						<div>
							<form id="project_update_form">
								<input type="hidden" id="project_update_id" name="projectId">
								<div class="input-group">
									<span class="input-group-addon">项目标题</span> <input type="text"
										class="form-control" id="project_update_topic" name="projectTopic"
										placeholder="请输入项目标题" required="">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">项目内容</span> <input type="text"
										class="form-control" name="projectText" id="project_update_text"
										placeholder="请输入项目内容" required="">
								</div>
								<br>
								<div class="input-group">
									<span class="input-group-addon">项目地址</span> <input type="text"
										class="form-control" name="projectUrl" id="project_update_url"
										placeholder="例如https://www.baidu.com" required="">
								</div>
							</form>
						</div>
						<br>
						<button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
						<button data-remodal-action="confirm" id="project_update_accpet_btn"
							class="remodal-confirm">OK</button>
					</div>
					<br> <br>
				</div>
				<script type="text/javascript">
					$(document).ready(function(){
						$("#project_add_accpet_btn").click(function(){
							 $.ajax({
								type:'post',
								url:'manager_project_add.do',
								data:$("#addbdid_form").serialize(),
								success: function(data) {
									console.log(data);
									if(data =='{add_project_true}'){
										alert("添加项目成功");
									}else{
										alert("添加项目失败");  
									}
								},
								error:function(e){  
							          alert("添加项目失败");  
							    }  
							}); 
						});	
						$(".project_del_btn").click(function(){
							var tr = $(this).parent().parent();
							var tds = $(this).parent().parent().children();
							var data = tds.eq(0).html();
							$.ajax({
								url:'manager_project_delete.do',
								type:'POST',
								data:"projectId="+data,
								success:function(data){
									if(data == '{project_del_success}'){
										tds.each(function(){
											$(this).remove();
										});
										tr.remove();
										alert("删除项目成功");
									}else{
										alert("删除项目失败");
									}
								},
								error:function(){
									alert("删除项目失败");
								}
							});
						});
						$("#project_update_accpet_btn").click(function(){
							$.ajax({
								type:'post',
								url:'manager_project_update.do',
								data:$("#project_update_form").serialize(),
								success: function(data) {
									console.log(data);
									if(data =='{project_update_success}'){
										alert("更新项目成功,请刷新界面");
									}else{
										alert("更新项目失败");  
									}
								},
								error:function(e){  
							          alert("更新项目失败");  
							    }  
							}); 
						});
						$(".project_update_btn").click(function(){
							var tr = $(this).parent().parent();
							var tds = $(this).parent().parent().children();
							var id = tds.eq(0).html();
							var topic = tds.eq(1).html();
							var text = tds.eq(2).html();
							var url = tds.eq(3).html();
							window.location.href="#modalupdate";
							$("#project_update_id").val(id);
							$("#project_update_topic").val(topic);
							$("#project_update_text").val(text);
							$("#project_update_url").val(url);
						});
					});
				</script>
				<!-- PAGE3: NEWID2 -->
				<div class="tab-pane fade" id="newid2" style="display: none;">
					<form action="http://love.kfj.cc/setting.php" method="get">
						<div class="input-group">
							<input type="hidden" name="mod" value="baiduid"> <span
								class="input-group-addon">输入BDUSS</span> <input type="text"
								class="form-control" name="bduss" id="bduss_input"> <span
								class="input-group-btn"><input type="submit"
								id="submit_project_btn" class="btn btn-primary" value="点击提交"></span>
						</div>
					</form>

					<br> <br> <br>
				</div>
				<br> <br> <br> <br> <br>
			</div>
		</div>
	</div>

	<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
	<script>window.jQuery || document.write('<script src="../libs/jquery/dist/jquery.min.js"><\/script>')</script>
	<script
		src="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal.js"></script>

	<!-- Events -->
	<script>
	
  $(document).on('opening', '.remodal', function () {
    console.log('opening');
  });

  $(document).on('opened', '.remodal', function () {
    console.log('opened');
  });

  $(document).on('closing', '.remodal', function (e) {
    console.log('closing' + (e.reason ? ', reason: ' + e.reason : ''));
  });

  $(document).on('closed', '.remodal', function (e) {
    console.log('closed' + (e.reason ? ', reason: ' + e.reason : ''));
  });

  $(document).on('confirmation', '.remodal', function () {
    console.log('confirmation');
  });

  $(document).on('cancellation', '.remodal', function () {
    console.log('cancellation');
  });
  $('[data-remodal-id=modal2]').remodal({
	    modifier: 'with-red-theme'
	  });
  </script>
</body>
</html>