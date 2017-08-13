<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>项目展示</title>
</head>
<body onload="getGithubData();">
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<div class="col-md-9">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            <h3 class="panel-title">个人项目 <span class="glyphicon glyphicon-th-list" aria-hidden="true"
                                               style="color:#d56464"/></h3>
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
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            <h3 class="panel-title">GitHub项目 <span class="glyphicon glyphicon-th-list" aria-hidden="true"
                                                   style="color:#d56464"/></h3>
        </div>
        <div id="githubBody" class="panel-body">
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            <h3 class="panel-title">收藏项目 <span
                    class="glyphicon glyphicon-th-list" aria-hidden="true" style="color:#d56464"/></h3>
        </div>
        <div id="githubBody2" class="panel-body">
        </div>
    </div>
</div>
<jsp:include page="/recommend.jsp"></jsp:include>

<script>
    //获取自己的项目
    function getGithubData() {
        $.ajax({
            url: 'https://api.github.com/users/egdw/repos',
            type: 'GET', //GET
            async: true,  //或false,是否异步
            timeout: 5000, //超时时间
            dataType: 'json',
            success: function (data) {
                $.each(data, function (index, content) {
                    $("#githubBody").append(" <a href='" + content.html_url + "' class='list-group-item' target='_blank'> " + " <h4 class='list-group-item-heading'> " + " <h4 class='list-group-item-heading'> " + content.name + "</h4>" + " <p class='list-group-item-text'>" + content.description + "</p></a> ");
                });
            },
            error: function (xhr, textStatus) {
                console.log('错误')
            }
        })
        getGithubData2();
    }
    //获取星级项目
    function getGithubData2() {
        $.ajax({
            url: 'https://api.github.com/users/egdw/starred',
            type: 'GET', //GET
            async: true,  //或false,是否异步
            timeout: 5000, //超时时间
            dataType: 'json',
            success: function (data) {
                $.each(data, function (index, content) {
                    $("#githubBody2").append(" <a href='" + content.html_url + "' class='list-group-item' target='_blank'> " + " <h4 class='list-group-item-heading'> " + " <h4 class='list-group-item-heading'> " + content.name + "</h4>" + " <p class='list-group-item-text'>" + content.description + "</p></a> ");
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