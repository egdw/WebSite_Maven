<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>项目展示</title>
    <link rel="stylesheet"
          href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
          crossorigin="anonymous">
    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
    <script
            src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script src="/js/jquery.min.js"></script>
</head>
<body onload="getGithubData()">
<jsp:include page="/project_top.jsp"></jsp:include>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">个人项目</h3>
    </div>
    <div class="panel-body">
        <c:forEach items="${requestScope.projects}" var="list" varStatus="i">
            <a href="${list.projectUrl}" class="list-group-item" target="_blank">
                <h4 class="list-group-item-heading">
                    <c:out value="${list.projectTopic}"/>
                </h4>
                <p class="list-group-item-text">${list.projectText}</p>
            </a>
        </c:forEach>
    </div>
</div>
<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">GitHub项目</h3>
    </div>
    <div id="githubBody" class="panel-body">
    </div>
</div>

<script>
    function getGithubData() {
        $.ajax({
            url: 'https://api.github.com/users/egdw/repos',
            type: 'GET', //GET
            async: true,  //或false,是否异步
            timeout: 5000, //超时时间
            dataType: 'json',
            success: function (data) {
                console.log(data);
                $.each(data,function (index,content) {
                        $("#githubBody").append(" <a href='"+content.html_url}+"' class='list-group-item' target='_blank'> ");
                $("#githubBody").append(" <h4 class='list-group-item-heading'> ");
                $("#githubBody").append(" <h4 class='list-group-item-heading'> "+content.name+"</h4>");
                $("#githubBody").append(" <p class='list-group-item-text'>"+content.description+"</p></a> ");
            });
            },
            error: function (xhr, textStatus) {
                console.log('错误')
            }
        })
    }
</script>
</body>
</html>