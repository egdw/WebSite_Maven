<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>推荐</title>
</head>
<script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
<body onload="getRecommendData()">
<div class="col-md-3">
    <div class="row-md-3">
        <div class="panel panel-default">
            <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
                <b>推荐</b> <span
                    class="glyphicon glyphicon-thumbs-up" aria-hidden="true" style="color:#d56464"></span></div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12">
                        <ul id="ad_ul">
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function getRecommendData() {
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/friendLink',
            async: true,
            dataType: 'json',
            success: function (data) {
                console.log(data)
                $.each(data, function (index, content) {
                    $("#ad_ul").append(" <li class='news-item'>" +
                        "<a style='color: slategray;padding: 10px'" +
                        "href='" + content.wbesiteFriendLinkUrl + "' target='_blank'>" + content.websiteFriendLinkName + "</a></li>");
                });
            },
            error: function (e) {
                console.log("获取推荐失败");
            }
        });
    }
</script>
</body>
</html>
