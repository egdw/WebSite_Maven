<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>推荐</title>
</head>
<body>
<div class="col-md-3">
    <div class="row-md-3">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
                <b>推荐</b> <span
                    class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="color:#d56464"></span></div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12">
                        <ul class="my_ad">
                            <c:forEach items="${requestScope.topReader}" var="index"
                                       varStatus="i">
                                <li class="news-item"><span class="badge"
                                                            style="font-size: 20px;width: 27px;color: lightskyblue;background-color: snow">${i.index+1}</span>
                                    <a style="color: slategray;padding: 10px"
                                       href="detail?pageId=${index.id}">
                                            ${index.title }</a></li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
