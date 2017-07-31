<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>缺少权限!</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
</head>
<body>
<center>
    <div class="wrap">
        <div class="banner">
            <a href="<%=request.getContextPath()%>/index.jsp"><img
                    src="<%=request.getContextPath()%>/css/404/images/banner2.jpg" alt=""/></a>
        </div>
        <div class="page">
            <h2>对不起!您缺少访问权限!<a href="<%=request.getContextPath()%>/index.jsp">返回主页</a></h2>
        </div>
    </div>
</center>
</body>
</html>

