<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>恶搞大王音乐</title>
</head>
<link href="<%=request.getContextPath()%>/css/music_css/my.css" rel="stylesheet">
<body onload="getSongsForm()">
<jsp:include page="/MyBlog_top.jsp"></jsp:include>
<div id="musicBody" class="col-md-9">
</div>
<jsp:include page="/recommend.jsp"></jsp:include>
</body>
<%--<script src="/js/jquery.bootstrap.newsbox.min.js" type="text/javascript"></script>--%>
<script>

    //从自己的网易云音乐上获取歌单
    function getSongsForm() {
        $.ajax({
            url: '/music/getSongsForm',
            type: 'GET', //GET
            async: true,  //或false,是否异步
            timeout: 5000, //超时时间
            dataType: 'json',
            success: function (data) {
                $.each(data.playlist, function (index, content) {
                    $("#musicBody").append("<div id='p" + content.id + "' class='panel panel-default col-md-6'>" +
                        "<div class='panel panel-default'>" +
                        " <div class='panel-heading' style='width: 100%;background-color:#594d4d;color: #FFFFFF'>" +
                        "<b>" + content.name + "(" + content.trackCount + ")首</b>" +
                        " <span class='glyphicon glyphicon-headphones'' aria-hidden='true' style='color:#d56464'></span></div></div>");
                    getSongsList(content.id);
                });

            },
            error: function (xhr, textStatus) {
                console.log('错误')
            }
        })
    }

    //获取歌单里所有的歌曲
    function getSongsList(id) {
        var formName = "#p" + id;
        $.ajax({
            url: '/music/getSongsFormDetail?id=' + id,
            type: 'GET', //GET
            async: true,  //或false,是否异步
            timeout: 5000, //超时时间
            dataType: 'json',
            success: function (data) {
                console.log(data)
                $(formName).append("<div class='panel-body'>" +
                    "<div class='row'>" +
                    "<div class='col-xs-12'>" +
                    "<ul id='" + "l" + id + "' class='songsForm'>" +
                    "</ul>" +
                    "</div>" +
                    "</div>" +
                    "</div>");
                var temp = "#l" + id;
                $.each(data.result.tracks, function (index, content) {
                    if (content.alias[0] != null) {
                        $(temp).append("<li class='news-item'>" +
                            " <a style='font-size: 15px;overflow: hidden;text-overflow:ellipsis;width: 300px;display: block;;padding-left: 10px; padding-top: 10px;padding-bottom: 10px' target='_blank' href='/music/playMusic?id=" + content.id + "'><b>" + content.name + "(" + content.alias[0] + ")</b>-" + content.artists[0].name + " </span></b></a>" +
                            "<button onclick='addSong(" + content.id + ")' class='btn btn-primary' style='float: right' role='button'>添加到播放列表</button>" +
                            "</li>");
                    } else {
                        $(temp).append("<li class='news-item'>" +
                            " <a style='font-size: 15px;overflow: hidden;text-overflow:ellipsis;width: 300px;display: block;;padding-left: 10px; padding-top: 10px;padding-bottom: 10px' target='_blank' href='/music/playMusic?id=" + content.id + "'><b>" + content.name + "</b>-" + content.artists[0].name + " </span></b></a>" +
                            "<button onclick='addSong(" + content.id + ")' class='btn btn-primary' style='float: right' role='button'>添加到播放列表</button>" +
                            "</li>");
                    }
                    //如果歌曲的数量大于100就停止解析
//                    if (index > 50) {
//                        return false;
//                    }
                });
            },
            error: function (xhr, textStatus) {
                console.log('错误')
            }
        })
    }

</script>

<script>
    function addSong(songId) {
        $.ajax({
            url: '/music/addUserSongsTable',
            type: 'POST', //GET
            async: true,    //或false,是否异步
            data: {
                param: songId
            },
            timeout: 5000,    //超时时间
            dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data) {
                if (data.code == 200) {
                    Toast('添加成功。请到个人中心查看', 1000);
                } else {
                    Toast('添加失败,请重试', 1000);
                }
            },
            error: function (xhr,) {
                Toast('添加错误', 1000);
            }
        })
    }

    function Toast(msg, duration) {
        duration = isNaN(duration) ? 3000 : duration;
        var m = document.createElement('div');
        m.innerHTML = msg;
        m.style.cssText = "width: 60%;min-width: 150px;opacity: 0.7;height: 30px;color: rgb(255, 255, 255);line-height: 30px;text-align: center;border-radius: 5px;position: fixed;top: 40%;left: 20%;z-index: 999999;background: rgb(0, 0, 0);font-size: 12px;";
        document.body.appendChild(m);
        setTimeout(function () {
            var d = 0.5;
            m.style.webkitTransition = '-webkit-transform ' + d + 's ease-in, opacity ' + d + 's ease-in';
            m.style.opacity = '0';
            setTimeout(function () {
                document.body.removeChild(m)
            }, d * 1000);
        }, duration);
    }
</script>
</html>