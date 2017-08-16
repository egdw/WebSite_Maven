<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>博客文章</title>
</head>

<body onload="addImageClass()">
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<!-- 下面是举例的文章内容 -->
<div class="container table_box">
    <!-- <h2 >36</h2> -->
    <h2 style="text-align:left;">
        <b>${requestScope.blog.title}</b>
    </h2>
    <div style="font-size:17px;">
        <i>欢迎访问恶搞大王的博客!</i>
    </div>
    <div style="text-align: right;font-size: 16px;padding-top: 10px">
        <div style="float: left">
            <c:if test="${requestScope.blog.type == 0}">
                标签： <a href="##" class="label label-info"
                       style="font-size: 16px">学习</a>
            </c:if>
            <c:if test="${requestScope.blog.type == 1}">
                标签： <a href="##" class="label label-info"
                       style="font-size: 16px">生活</a>
            </c:if>
            <c:if test="${requestScope.blog.type == 2}">
                标签： <a href="##" class="label label-info"
                       style="font-size: 16px">随笔</a>
            </c:if>
        </div>
        <label style="font-size: 15px;text-align: left"><span
                class="glyphicon glyphicon-eye-open" style="color: gray"
                aria-hidden="true"></span> <a style="text-decoration:none;"
                                              href="##">阅读</a>(${requestScope.blog.clickTimes})</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <label
            style="font-size: 15px;text-align: left"><span
            class="glyphicon glyphicon-edit" style="color: gray"
            aria-hidden="true"></span> <a style="text-decoration:none;"
                                          href="##">评论</a>(${requestScope.blog.commentTimes})</label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<label
            style="font-size: 15px"><fmt:formatDate
            value="${index.createTime}" pattern="yyyy-MM-dd HH:mm:ss"/></label>
    </div>
    <hr>
    <div id="main_page" style="padding-top: 4px;padding-left: 10px;padding-right: 10px;" class="container">
        ${requestScope.blog.content}</div>
    <!-- 从这里往下是评论区 -->
    <hr style="border: 1px solid silver;">
    <c:if test="${requestScope.comments ==null}">
        <h3>暂无评论</h3>
    </c:if>

    <div style="padding-top: 10px;padding-left: 10px;padding-right: 10px">
        <c:forEach items="${requestScope.comments}" var="index" varStatus="i">
            <span style="color:black;width: 40px">${i.index+1}楼</span>
            &nbsp;&nbsp;&nbsp;&nbsp;
            <span class="glyphicon glyphicon-user"
                  style="color: gray ;width:150px" aria-hidden="true">&nbsp;${index.username}
				</span>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <span class="glyphicon glyphicon-envelope"
                  style="color: gray;width:300px" aria-hidden="true">&nbsp;${index.email}</span>
            <shiro:hasRole name="super_admin">
                <input type="button" class="delBtn btn btn-default" name="${index.id}" value="删除"/>
            </shiro:hasRole>
            <div style="font-size:16px;padding: 20px 50px 10px 45px;">${index.content}</div>
            <div style="color:gray;float: right">
                <i>评论于 <fmt:formatDate value="${index.createTime}"
                                       pattern="yyyy-MM-dd HH:mm:ss"/></i>
            </div>
            <hr>
        </c:forEach>
    </div>
    <script>
        function loadImage() {
            document.getElementById("verify").src = "/comment/getVeriyImage?" + Math.random();
        }
    </script>
    <form id="comment_id" method="post">
        <fieldset>
            <input value="${requestScope.blog.id}" type="hidden" name="blogId">
            <shiro:notAuthenticated>
                <div class="form-inline" style="padding-top: 20px">
                    <div class="input-group form-group  col-lg-offset-1">
                        <span class="input-group-addon" id="sizing-addon1">* 姓 名：</span>
                        <input name="username" required maxlength="30" class="form-control" placeholder="请输入你的名称"
                               aria-describedby="sizing-addon1" type="text" minlength="2">
                    </div>
                </div>
                <div class="form-inline" style="padding-top: 20px">
                    <div class="input-group form-group  col-lg-offset-1">
                        <span class="input-group-addon">* 邮 箱：</span>
                        <input type="email" name="email" required maxlength="30" class="form-control"
                               placeholder="请输入你的邮箱"
                               aria-describedby="sizing-addon1" type="text" minlength="2">
                    </div>
                </div>
            </shiro:notAuthenticated>
            <shiro:authenticated>
                <input name="username" required maxlength="30" class="form-control"
                       aria-describedby="sizing-addon1" type="hidden" minlength="2" value="${sessionScope.currentUser.loginAccount}">
                <input name="email" required maxlength="30" class="form-control"
                       aria-describedby="sizing-addon1" type="hidden" minlength="2" value="${sessionScope.currentUser.userEmail}">
            </shiro:authenticated>
            <div class="form-inline" style="padding-top: 20px">
                <div class="form-group  col-lg-offset-1">
                    <textarea id="demo" required name="content" style="display: none;"></textarea>
                </div>
            </div>
            <div class="form-inline">
                <div class="input-group form-group  col-lg-offset-1">
                    <span class="input-group-addon">*验证：</span>
                    <input name="verify" required maxlength="30" class="form-control" placeholder="请输入验证码"
                           aria-describedby="sizing-addon1" type="text" minlength="2">
                </div>
                <img id="verify"
                     src="/comment/getVeriyImage"
                     alt="验证码"
                     onclick="loadImage()">
                <button type="button" style="width: 113px;text-align: center"
                        id="submitBtn" class="btn btn-info" onclick="return false;">评论
                </button>
            </div>
            <div class="col-lg-offset-1"
                 style="padding-top: 20px;padding-left: 60px;padding-bottom: 15px">

            </div>
        </fieldset>
    </form>

    <script type="text/javascript">

        var layedit = null;
        var index = null;
        layui.use('layedit', function () {
            layedit = layui.layedit;
            index = layedit.build('demo', {
                tool: [
                    'strong' //加粗
                    , 'italic' //斜体
                    , 'underline' //下划线
                    , 'del' //删除线
                    , '|' //分割线
                    , 'left' //左对齐
                    , 'center' //居中对齐
                    , 'right' //右对齐
                    , 'face' //表情
                ]
            });
        });

        $(document).ready(function () {
            $(".delBtn").click(function () {
                var x = $(this).attr("name");
                $.ajax({
                    type: 'get',
                    url: '<%=request.getContextPath()%>/comment/del?comentId=' + x,
                    success: function (data) {
                        console.log(data);
                        if (data == 'success') {
                            window.location.reload();
                        } else {
                            alert("删除评论失败");
                        }
                    },
                    error: function (e) {
                        alert("删除评论失败");
                    }
                });
            });

            $("#submitBtn").click(function () {
                layedit.sync(index);
                $.ajax({
                    type: 'post',
                    url: '<%=request.getContextPath()%>/comment/add',
                    data: $("#comment_id").serialize(),
                    success: function (data) {
                        console.log(data);
                        if (data == 'success') {
                            window.location.reload();
                        } else {
                            alert("添加评论失败");
                            loadImage();
                        }
                    },
                    error: function (e) {
                        alert("添加评论失败");
                        loadImage();
                    }
                });
            });
        });
    </script>
    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
</div>
<script>
    function addImageClass() {
        $("#main_page img").addClass("img-responsive");
    }
</script>
</body>
</html>
