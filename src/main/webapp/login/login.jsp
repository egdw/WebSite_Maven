<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>后台登录</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="application/x-javascript">
        addEventListener("load", function () {
            setTimeout(hideURLbar, 0);
        }, false);
        function hideURLbar() {
            window.scrollTo(0, 1);
        }
    </script>
    <link href="css/style.css" rel='stylesheet' type='text/css'/>
    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
    <script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
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
        document.getElementById("image").src = "/login/getVeriyImage?" + Math.random();
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
            <img src="https://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
                 alt="" width="100" height="100"/>
        </div>
        <form id="loginForm" action="Login.do" method="post">
            <input type="text" name="username" class="text" placeholder="请在此处输入账户" required="required">
            <input type="password" name="password" placeholder="请在此处输入密码" required="required">
            <div class="signin">
                <input type="text" id="verify" name="verify" placeholder="请输入以下验证码" required="required"><img id="image"
                                                                                                             onclick="loadImage()"
                                                                                                             src="/login/getVeriyImage"/>
            </div>
        </form>
        <div class="signin">
            <button id="addUser" onclick="login()">登录</button>
        </div>
    </div>
    <a href="<%=request.getContextPath()%>/login/register.jsp" style="color: #ffffff">还没有账户?</a>
</center>
</body>
<script>
    function login() {
        $.ajax({
            type: 'post',
            url: 'Login.do',
            data: $('#loginForm').serialize(),
            cache: false,
            dataType: 'json',
            success: function (data) {
                if (data.code == 500) {
                    swal("OMG", data.message, "error");
                    loadImage();
                } else {
                    swal("登录成功!", "即将跳转", "success");
                    window.location.replace('<%=request.getContextPath()%>/login/manager');
                }
            },
            error: function (e) {
                console.log(e)
            }
        });
    }
</script>
</html>