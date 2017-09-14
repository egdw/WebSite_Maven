<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<meta name="referrer" content="never">
<html>
<head>
    <title>恶搞新闻</title>
</head>

<body>
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<div class="col-md-9">
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            今日头条 <span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="color:#d56464"></span>
            <div class="layui-inline" style="float: right">
                日期选择:
                <input class="layui-input" placeholder="laydate.now()"
                       style="height: 20px;width: 95px;background-color:#d56464;color: #fff;float: right"
                       onclick="layui.laydate({elem: this, min: '2013-05-20', max: laydate.now(),choose: function(datas){changeDate(datas)}})">
            </div>
        </div>
        <div class="panel-body">
            <div class="row" id="latesNews2">
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading" style="background-color:#594d4d;color: #FFFFFF">
            今日热点 <span class="glyphicon glyphicon-list-alt" aria-hidden="true" style="color:#d56464"></span>
        </div>
        <div class="panel-body">
            <div class="row" id="latesNews">
            </div>
        </div>
    </div>
</div>
<jsp:include page="/recommend.jsp"></jsp:include>
<style>
    ::-webkit-input-placeholder { /* WebKit browsers */
        color: #fff;
    }

    :-moz-placeholder { /* Mozilla Firefox 4 to 18 */
        color: #fff;
    }

    ::-moz-placeholder { /* Mozilla Firefox 19+ */
        color: #fff;
    }

    :-ms-input-placeholder { /* Internet Explorer 10+ */
        color: #fff;
    }
</style>
<script>

    layui.use('laydate', function () {
        var laydate = layui.laydate;
        var date = $(".layui-input").attr('placeholder', laydate.now());
    });

    //日期发生变换
    function changeDate(date) {
        $.ajax({
            url: "/pageController/getOldNews?date="+date,
            type: "GET",
            async: true,
            timeout: 5000,
            dataType: 'json',
            success: function (data) {
                $("#latesNews").html("");
                $("#latesNews2").html("");
                $.each(data.stories, function (index, content) {
                    $("#latesNews").append(" <div class='row-sm-1'>" +
                        "<div class='thumbnail' style='height: 180px;width: 100%'>" +
                        " <div class='media'>" +
                        "<div style='float: left;padding-top: 10px;padding-left: 5px;'>" +
                        "<a href='ZhiHu/index.html?id=" + content.id + "' target='_blank'><img" + " src='" + content.images[0] + "'" +
                        "  alt='" + content.title + "' class='img-thumbnail' width='150'/></a>  </div>" +
                        "<div class='media-bod' style='padding-left: 5px;'><h4 class='media-heading' style='margin-top: 10px;'> <a href='ZhiHu/index.html?id=" + content.id + "'' target='_blank' style='font-size: 20px;color: #00a67c;padding: 10px</h4>'>" + content.title + "</a>" + "</div></div></div></div>");
                });
                $.each(data.top_stories, function (index, content) {
                    $("#latesNews2").append(" <div class='row-sm-1'>" +
                        "<div class='thumbnail' style='height: 180px;width: 100%'>" +
                        " <div class='media'>" +
                        "<div style='float: left;padding-top: 10px;padding-left: 5px;'>" +
                        "<a href='/ZhiHu/index.html?id=" + content.id + "' target='_blank'><img" + " src='" + content.image + "'" +
                        "  alt='" + content.title + "' class='img-thumbnail' width='150'/></a>  </div>" +
                        "<div class='media-bod' style='padding-left: 5px;'><h4 class='media-heading' style='margin-top: 10px;'> <a href='/ZhiHu/index.html?id=" + content.id + "' target='_blank' style='font-size: 20px;color: #00a67c;padding: 10px</h4>'>" + content.title + "</a>" + "</div></div></div></div>");
                });
            },
            error: function (xhr, textStatus) {
                console.log('错误')
            },
        });
    }

    $.ajax({
        url: "/pageController/getZhihuLastedNews",
        type: "GET",
        async: true,
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            $.each(data.stories, function (index, content) {
                $("#latesNews").append(" <div class='row-sm-1'>" +
                    "<div class='thumbnail' style='height: 180px;width: 100%'>" +
                    " <div class='media'>" +
                    "<div style='float: left;padding-top: 10px;padding-left: 5px;'>" +
                    "<a href='ZhiHu/index.html?id=" + content.id + "' target='_blank'><img" + " src='" + content.images[0] + "'" +
                    "  alt='" + content.title + "' class='img-thumbnail' width='150'/></a>  </div>" +
                    "<div class='media-bod' style='padding-left: 5px;'><h4 class='media-heading' style='margin-top: 10px;'> <a href='ZhiHu/index.html?id=" + content.id + "'' target='_blank' style='font-size: 20px;color: #00a67c;padding: 10px</h4>'>" + content.title + "</a>" + "</div></div></div></div>");
            });
            $.each(data.top_stories, function (index, content) {
                $("#latesNews2").append(" <div class='row-sm-1'>" +
                    "<div class='thumbnail' style='height: 180px;width: 100%'>" +
                    " <div class='media'>" +
                    "<div style='float: left;padding-top: 10px;padding-left: 5px;'>" +
                    "<a href='/ZhiHu/index.html?id=" + content.id + "' target='_blank'><img" + " src='" + content.image + "'" +
                    "  alt='" + content.title + "' class='img-thumbnail' width='150'/></a>  </div>" +
                    "<div class='media-bod' style='padding-left: 5px;'><h4 class='media-heading' style='margin-top: 10px;'> <a href='/ZhiHu/index.html?id=" + content.id + "' target='_blank' style='font-size: 20px;color: #00a67c;padding: 10px</h4>'>" + content.title + "</a>" + "</div></div></div></div>");
            });
        },
        error: function (xhr, textStatus) {
            console.log('错误')
        },
    });
</script>
</body>
</html>
