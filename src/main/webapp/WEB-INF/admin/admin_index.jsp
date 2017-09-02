<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<div class="container bs-docs-container">
    <div class="row">
        <div class="col-md-3">
            <div class="bs-sidebar hidden-print visible-lg visible-md"
                 role="complementary">
                <ul class="nav bs-sidenav">
                    <li></li>
                    <li class="active"><a
                            href="<%=request.getContextPath()%>/login/manager"> 管理首页</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/manager/manager_person_setting.do"> 个人设置</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"> 趣味管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"> 临时管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/blog/admin"> 博客管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/album/album"> 相册管理</a></li>
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
                                class="img-rounded" height="80px" width="80px"></span>欢迎来到后台管理! <br> 此程序作者为 <a
                        href="<%=request.getContextPath()%>/AboutMy/index.html"
                        target="_blank">恶搞大王</a> <br> 恶搞大王保留所有权利
                </div>
            </div>


            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">用户信息</h3>
                </div>
                <ul class="list-group">
                    <li class="list-group-item"><b>用户组：</b> 管理员
                    </li>
                    <li class="list-group-item"><c:if
                            test="${not empty requestScope.user.userEmail}">
                        您已经绑定邮箱<a
                        href="<%=request.getContextPath()%>/manager/manager_person_setting.do">${requestScope.user.userEmail}</a>
                    </c:if> <c:if test="${empty requestScope.user.userEmail}">
                        您还没绑定邮箱<a
                        href="<%=request.getContextPath()%>/manager/manager_person_setting.do">前往绑定</a>
                    </c:if></li>
                    <li class="list-group-item"><c:if
                            test="${not empty requestScope.user.userPhone}">
                        您已绑定手机<a
                        href="<%=request.getContextPath()%>/manager/manager_person_setting.do">${requestScope.user.userPhone }</a>
                    </c:if> <c:if test="${empty requestScope.user.userPhone}">
                        您还没有绑定手机<a
                        href="<%=request.getContextPath()%>/manager/manager_person_setting.do">前往绑定</a>
                    </c:if></li>
                </ul>
            </div>


            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">基础设置</h3>
                </div>
                <ul class="list-group">
                    <li class="list-group-item"><label>注册审核</label><input id="register_needcheck" type="checkbox"><br>
                        <label><strong>一旦开启.用户注册之后都需要经过管理员进行审核才能够通过</strong></label>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>