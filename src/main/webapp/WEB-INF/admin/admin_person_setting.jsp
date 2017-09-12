<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<div class="container bs-docs-container">
    <div class="row">
        <div class="col-md-3">
            <div class="bs-sidebar hidden-print visible-lg visible-md"
                 role="complementary">
                <ul class="nav bs-sidenav">
                    <li></li>
                    <li class=""><a href="<%=request.getContextPath()%>/login/manager"> 管理首页</a></li>
                    <li class="active"><a href="<%=request.getContextPath()%>/manager/manager_person_setting.do">
                        个人设置</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"> 趣味管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"> 临时管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/blog/admin"> 博客管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/album/album"> 相册管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_banner.do"> Banner管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_friend_link.do"> 友情链接管理</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">
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
                                <td><input
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
</div>
</body>
</html>