<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<meta name="viewport" content="width=device-width, initial-scale=1">

<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
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
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_user.do"> 用户管理</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li><a
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

            <div class="panel panel-primary">
                <div class="panel-heading">
                    <h3 class="panel-title">程序信息</h3>
                </div>
                <div class="panel-body">
						<span id="avatar" style="float:right;"><img
                                src="https://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
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

            <div class="panel panel-warning">
                <div class="panel-heading">
                    <h3 class="panel-title">缓存管理</h3>
                </div>
                <ul class="list-group">
                    <li class="list-group-item">
                        <button onclick="clearCache()">清空缓存</button>
                        <br>
                        <label><strong>为了提高系统的性能.后台大量的使用了缓存,但是在必要的时候需要立即刷新.请点击这个按钮</strong></label>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
</div>
</body>

<script>
    function clearCache() {
        swal({
            title: "您确定要清除缓存吗？",
            text: "数据将不能恢复!",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，我要清除",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                url: "<%=request.getContextPath()%>/manager/clear",
                type: 'GET', //GET
                async: true,    //或false,是否异步
                timeout: 5000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                beforeSend: function (xhr) {
                    console.log(xhr)
                    console.log('发送前')
                },
                success: function (data, textStatus, jqXHR) {
                    if (data.code == 200) {
                        swal("操作成功!", "已成功删除缓存！", "success");
                    } else {
                        swal("OMG", "删除缓存失败了!", "error");
                    }
                    console.log(data)
                    console.log(textStatus)
                    console.log(jqXHR)
                },
                error: function (xhr, textStatus) {
                    console.log('错误')
                    console.log(xhr)
                    console.log(textStatus)
                    swal("OMG", "删除缓存失败了!", "error");
                },
                complete: function () {
                    console.log('结束')
                }
            })


            $.ajax({
                url: "<%=request.getContextPath()%>/manager/clear",
                type: "GET"
            }).done(function (data) {

            }).error(function (data) {

            });
        });
    }
</script>
</html>