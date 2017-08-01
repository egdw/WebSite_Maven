<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="charset" content="utf-8">
    <title>个人中心</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <link rel="stylesheet" href="/layui/css/layui.css">
    <script src="/layui/layui.js"></script>
    <script src="/layui/dist/APlayer.min.js"></script>
    <script src="/js/user_top_js.js"></script>
    <script src="/js/jquery.min.js"></script>
</head>
<body style="background-color: #c2c2c2" onload="getUserTable()">
<ul class="layui-nav" lay-filter="" style="width: 100%">
    <li class="layui-nav-item layui-this"><a href="#">个人中心</a></li>
    <li class="layui-nav-item">
        <a href="javascript:">功能菜单</a>
        <dl class="layui-nav-child"> <!-- 二级菜单 -->
            <dd><a href="<%=request.getContextPath()%>/">首页</a></dd>
            <dd><a href="<%=request.getContextPath()%>/blog/">我的博客</a></dd>
            <dd><a href="<%=request.getContextPath()%>/funnyView.do">趣味网页</a></dd>
            <dd><a href="<%=request.getContextPath()%>/tempView.do">临时网页</a></dd>
            <dd><a href="<%=request.getContextPath()%>/music">我的音乐</a></dd>
            <dd><a href="<%=request.getContextPath()%>/image">我的相册</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <a href="javascript:">关于</a>
        <dl class="layui-nav-child"> <!-- 二级菜单 -->
            <dd><a href="<%=request.getContextPath()%>/AboutMy/index.html">关于我</a></dd>
        </dl>
    </li>
    <li class="layui-nav-item">
        <dd><a href="<%=request.getContextPath()%>/login/logout.do">注销</a></dd>
    </li>
</ul>
<fieldset class="layui-elem-field">
    <legend>个人中心</legend>
    <div class="layui-field-box">
        <div id="right_page" style="float: left">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">个人信息</li>
                    <li>我的音乐</li>
                    <li>宝贵建议</li>
                    <li>暂定</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">用户名:<shiro:principal></shiro:principal></blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">用户组:<shiro:user></shiro:user></blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">引用区域的文字</blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">引用区域的文字</blockquote>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        不要瞎点了!啥都没有!
                    </div>
                    <div class="layui-tab-item"><textarea id="demo" style="display: none;"></textarea>
                        <button style="float:right;" class="layui-btn" onclick="layer.msg('别提交了!还没写呢');">提交</button>
                    </div>
                    <div class="layui-tab-item">不要瞎点了!啥都没有!</div>
                    <div class="layui-tab-item">不要瞎点了!啥都没有!</div>
                </div>
            </div>
        </div>
    </div>
    <fieldset class="layui-elem-field layui-field-title">
        <legend>音乐播放器</legend>
        <div id="player1" class="aplayer"></div>
    </fieldset>
</fieldset>
<script>
    function getUserTable() {
        var ap5 = new APlayer({
            element: document.getElementById('player1'),
            narrow: false,
            autoplay: false,
            showlrc: 3,
            mutex: true,
            theme: '#ad7a86',
            mode: 'random',
            listmaxheight: '180px',
            music: [
                {
                    title: 'あっちゅ～ま青春!',
                    author: '七森中☆ごらく部',
                    url: 'http://devtest.qiniudn.com/あっちゅ～ま青春!.mp3',
                    pic: 'http://devtest.qiniudn.com/あっちゅ～ま青春!.jpg',
                    lrc: '[00:00.00]lrc here\n[00:01.00]aplayer'
                },
                {
                    title: 'secret base~君がくれたもの~',
                    author: '茅野愛衣',
                    url: 'http://devtest.qiniudn.com/secret base~.mp3',
                    pic: 'http://devtest.qiniudn.com/secret base~.jpg',
                    lrc: '[00:00.00]lrc here\n[00:01.00]aplayer'
                },
                {
                    title: '回レ！雪月花',
                    author: '小倉唯',
                    url: 'http://devtest.qiniudn.com/回レ！雪月花.mp3',
                    pic: 'http://devtest.qiniudn.com/回レ！雪月花.jpg',
                    lrc: '[00:00.00]lrc here\n[00:01.00]aplayer'
                }
            ]
        });

        $.ajax({
            url: '/music/getSongsTable',
            type: 'GET', //GET
            async: true,    //或false,是否异步
            timeout: 5000,    //超时时间
            dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            beforeSend: function (xhr) {
                console.log(xhr);
                console.log('发送前')
            },
            success: function (data, textStatus, jqXHR) {
                console.log(data);
                ap5.addMusic(data);
                console.log(textStatus);
                console.log(jqXHR)
            },
            error: function (xhr, textStatus) {
                console.log('错误');
                console.log(xhr);
                console.log(textStatus)
            },
            complete: function () {
                console.log('结束')
            }
        })
    }
</script>
</body>
</html>