<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>博客文章</title>
</head>

<body>
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
    <div style="padding-top: 4px;padding-left: 10px;padding-right: 10px;">
        ${requestScope.blog.content}</div>
    <!-- 从这里往下是评论区 -->
    <div>
        <h1 style="padding-bottom: 10px;text-align: center">文章已经到底了!</h1>
    </div>
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
            <div style="font-size:16px;padding: 20px 50px 10px 45px;">${index.content}</div>
            <div style="color:gray;float: right">
                <i>评论于 <fmt:formatDate value="${index.createTime}"
                                       pattern="yyyy-MM-dd HH:mm:ss"/></i>
            </div>
            <shiro:hasRole name="super_admin">
                <input type="button" class="delBtn" name="${index.id}" value="删除"/>
            </shiro:hasRole>
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
            <legend>评论</legend>
            <input value="${requestScope.blog.id}" type="hidden" name="blogId">
            <div class="form-inline">
                <div class="form-group col-lg-offset-1">
                    <label style="font-size: 15px;width: 60px;">* 姓 名：</label> <input
                        style="width:200px;font-size: 15px" type="text" minlength="2"
                        maxlength="30" class="form-control" name="username" required>
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group  col-lg-offset-1">
                    <label style="font-size: 15px;width: 60px;padding-top: 20px">*
                        邮 箱：</label> <input style="width:200px;font-size: 15px" type="email"
                                            class="form-control" name="email" required>
                </div>
            </div>
            <div class="form-inline" style="padding-top: 20px">
                <div class="form-group  col-lg-offset-1">
                    <label style="font-size: 15px;width: 60px">* 内 容：</label>
                    <textarea name="content" style="width: 500px" class="form-control"
                              rows="4"></textarea>
                </div>
            </div>
            <div class="form-inline">
                <div class="form-group  col-lg-offset-1">
                    <label style="font-size: 15px;width: 60px;padding-top: 20px">*
                        验证：</label> <input style="width:200px;font-size: 15px" type="text"
                                           class="form-control" name="verify" required><img id="verify"
                                                                                            src="/comment/getVeriyImage"
                                                                                            alt="验证码"
                                                                                            onclick="loadImage()">
                </div>
            </div>
            <div class="col-lg-offset-1"
                 style="padding-top: 20px;padding-left: 60px;padding-bottom: 15px">
                <button type="button" style="width: 200px;text-align: center"
                        id="submitBtn" class="btn btn-info" onclick="return false;">评论
                </button>
            </div>
        </fieldset>
    </form>


    <script type="text/javascript">
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

    <script
            src="<%=request.getContextPath()%>/css/admin_project_manager_files/jquery.min.js"></script>
</div>

</body>
</html>
