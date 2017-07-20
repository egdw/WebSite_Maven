<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="charset" content="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>个人设置</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<script src="<%=request.getContextPath()%>/js/jquery.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin_index/bootstrap.min.css">
<script src="<%=request.getContextPath()%>/css/admin_index/bootstrap.min.js"></script>
<style type="text/css">
body {
    font-family: "微软雅黑", "Microsoft YaHei";
    background: #eee;
}
</style>
<script type="text/javascript" src="<%=request.getContextPath()%>/css/admin_person_setting_files/js.js"></script>
<style type="text/css" adt="123"></style>
</style>
</head>
<body>
    <button class="btn btn-primary btn-lg" id="wabutton"
        style="display:none;" data-toggle="modal" data-target="#alert_modal"></button>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin_person_setting_files/ui.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/admin_person_setting_files/my.css">
    <script type="text/javascript" src="<%=request.getContextPath()%>/css/admin_person_setting_files/my.js"></script>
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
						<li class="active"><a
							href="<%=request.getContextPath()%>/manager/manager_person_setting.do"><span
								class="glyphicon glyphicon-wrench"></span> 个人设置</a></li>
						<li class=""><a
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
						<li class="active"><a href="<%=request.getContextPath()%>/manager/manager_person_setting.do"><span
								class="glyphicon glyphicon-wrench"></span> 个人设置</a></li>
						<li class=""><a
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
                <form action="<%=request.getContextPath()%>/userController/update" method="post">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th style="width:40%">参数</th>
                                    <th>值</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>头像设置<br>您的真实姓名
                                    </td>
                                    <td> <input
                                        type="text" name="username" value="${requestScope.user.userName}"
                                        class="form-control"></td>
                                </tr>
                                <tr>
                                    <td>邮箱设置<br>更改你在本站设置的邮箱地址
                                    </td>
                                    <td><input type="text" name="email"
                                        value="${requestScope.user.userEmail}" class="form-control" required="">
                                    </td>
                                </tr>
                                <tr>
                                    <td>手机设置<br>更改你在本站设置的手机号码
                                    </td>
                                    <td><input type="text" class="phone"
                                       value="${requestScope.user.userPhone}" name="phone"></td>
                                </tr>
                                <tr>
                                    <td>更改密码<br>留空表示不更改密码
                                    </td>
                                    <td><input type="password" class="form-control"
                                        name="newPassword"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <input type="submit" class="btn btn-primary" value="提交更改">
                </form>
            </div>
        </div>
    </div>
</body>
</html>