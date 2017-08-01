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
    <script
            src="<%=request.getContextPath()%>/js/jquery.js"></script>
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
            <img src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
                 alt="" width="100" height="100"/>
        </div>
        <form action="Login.do" method="post">
            <input type="text" name="username" class="text" placeholder="请在此处输入账户" required="required">
            <input type="password" name="password" placeholder="请在此处输入密码" required="required">
            <div class="signin">
                <input type="text" id="verify" name="verify" placeholder="请输入以下验证码" required="required"><img id="image"
                                                                                                             onclick="loadImage()"
                                                                                                             src="/login/getVeriyImage"/>
                <input type="submit" value="登录">
            </div>
        </form>
    </div>
</center>
</body>
</html>