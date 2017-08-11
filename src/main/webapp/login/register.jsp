<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script
            src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
</head>
<body>
<script>
    $(document).ready(function (c) {
        $('.close').on('click', function (c) {
            $('.login-form').fadeOut('slow', function (c) {
                $('.login-form').remove();
            });
        });
    });
</script>
<script>
    function loadImage() {
        document.getElementById("image").src = "/register/getVeriyImage?" + Math.random();
    }


    function addUser2() {
        $.ajax({
            type: 'post',
            async: true,
            url: '/register/register',
            data: $("#registerForm").serialize(),
            beforeSend: function (xhr) {
                $("#addUser").attr('disabled', "true");
            },
            success: function (data) {
                var obj = eval("(" + data + ")");
                var message = obj.message;
                console.log(message);
                if (message == 'password_short') {
                    $("#tip").text("密码太短");
                } else if (message == 'code_fail') {
                    $("#tip").text("验证码错误");
                } else if (message == 'password_not_like') {
                    $("#tip").text("两次密码不相同");
                } else if (message == 'userExsits') {
                    $("#tip").text("用户名已经存在");
                } else if (message == 'success') {
                    //说明注册成功
                    window.location.replace("/login/login.jsp");
                } else if (message == 'username_short') {
                    $("#tip").text("用户名太短");
                } else {
                    //注册失败
                    $("#tip").text("注册失败");
                }
                $("#myModal").modal("show");
                loadImage();
            },
            complete: function () {
                $("#addUser").removeAttr("disabled");
            },
            error: function (e) {
                alert("网络错误，请重试！！");
                $("#addUser").removeAttr("disabled");
            }
        });
    }
</script>
<center>
    <div class="login-form">
        <div class="close"></div>
        <div class="head-info">
            <label class="lbl-1"> </label> <label class="lbl-2"> </label> <label
                class="lbl-3"> </label>
        </div>
        <div class="clear"></div>
        <div class="avtar">
            <img src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
                 alt="" width="100" height="100"/>
        </div>
        <form id="registerForm" action="/register/register" method="post">
            <input type="text" name="username" class="text" placeholder="请输入您的用户名" required="required">
            <input type="password" name="password" placeholder="请输入您的密码" required="required">
            <input type="password" id="password2" name="password2" placeholder="请确认您的密码" required="required">
            <input type="text" name="verify" id="verify" placeholder="请输入以下验证码" required="required"><br><img id="image"
                                                                                                             onclick="loadImage()"
                                                                                                             src="/register/getVeriyImage"/>
            <div class="signin">
                <button id="addUser" onclick="addUser2()">注册</button>
            </div>
        </form>
    </div>
    <a href="<%=request.getContextPath()%>/login/manager" style="color: #ffffff">已经注册账户?</a>
</center>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">注册失败</h4>
            </div>
            <div id="tip" class="modal-body">在这里添加一些文本</div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div>
    </div>
</div>
</body>
</html>