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
    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
</head>
<body style="background-color: #c2c2c2" onload="getUserTable()">
<ul class="layui-nav" lay-filter="" style="width: 100%">
    <li class="layui-nav-item">
        <a href="javascript:">功能菜单</a>
        <dl class="layui-nav-child">
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
        <dl class="layui-nav-child">
            <dd><a href="<%=request.getContextPath()%>/AboutMy/index2.html">关于我</a></dd>
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
                    <li>留言板</li>
                    <li>设置</li>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">用户名:<shiro:principal></shiro:principal></blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">用户组:普通用户</blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">引用区域的文字</blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">引用区域的文字</blockquote>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <div class="layui-btn-group" style="margin-left: 3px">
                            <button class="layui-btn" onclick="loadMusicInfoWebSite();">搜歌<i
                                    class="layui-icon">&#xe615;</i></button>
                            <button class="layui-btn" onclick="ap5.play()" onmouseenter="layer.tips('播放', this);"><i
                                    class="layui-icon">&#xe652;</i></button>
                            <button class="layui-btn" onclick="ap5.pause()" onmouseenter="layer.tips('暂停', this)" ;><i
                                    class="layui-icon">&#xe651;</i></button>
                            <button class="layui-btn" onclick="ap5.setMusic(ap5.playIndex-1)"
                                    onmouseenter="layer.tips('上一首', this)"><i class="layui-icon">&#xe603;</i>
                            </button>
                            <button class="layui-btn" onclick="ap5.setMusic(ap5.playIndex+1)"
                                    onmouseenter="layer.tips('下一首', this)"><i class="layui-icon">&#xe602;</i>
                            </button>
                        </div>
                        <br>
                        <br>
                        <div class="layui-btn-group" style="margin-left: 3px">
                            <button class="layui-btn" onclick="updateUserTable()">刷新<i class="layui-icon">&#x1002;</i>
                            </button>
                            <button class="layui-btn" onclick="ap5.play()" onmouseenter="layer.tips('编辑', this)"><i
                                    class="layui-icon">&#xe642;</i></button>
                            <button class="layui-btn" onclick="loadMusicInfoWebSite();"
                                    onmouseenter="layer.tips('删除', this)"><i
                                    class="layui-icon">&#xe640;</i></button>
                            <button class="layui-btn" onclick="ap5.pause()" onmouseenter="layer.tips('下载', this)"><i
                                    class="layui-icon">&#xe601;</i></button>
                            <button class="layui-btn" onclick="ap5.setMusic(ap5.playIndex-1)"
                                    onmouseenter="layer.tips('设置', this)"><i class="layui-icon">&#xe620;</i>
                            </button>
                        </div>
                    </div>
                    <div class="layui-tab-item">
                        <form id="advicesForm" method="post">
                            <textarea id="demo" name="websiteText" style="display: none;"></textarea>
                            <input type="text" id="verify" name="verfiy" placeholder="请输入以下验证码" required="required">
                            <img id="image"
                                 onclick="loadImage()"
                                 src="/advices/getVeriyImage"/>
                        </form>
                        <button id="advicesButton" style="float:right;" class="layui-btn">提交</button>
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
    $("#advicesButton").click(function () {
        layedit.sync(index);
        $.ajax({
            type: 'post',
            url: '<%=request.getContextPath()%>/advices',
            async: true,
            timeout: 5000,
            data: $("#advicesForm").serialize(),
            dataType: 'json',
            success: function (data) {
                if (data.code == 500) {
                    layer.msg(data.message);
                } else {
                    layer.msg(data.message);
                }
                loadImage();
            },
            error: function (e) {
                loadImage();
            }
        });
    })

    function loadImage() {
        document.getElementById("image").src = "/advices/getVeriyImage?" + Math.random();
    }

    var ap5 = null;
    var currentindex = null;
    var currentTime = null;
    function loadMusicInfoWebSite() {
//        ap5.pause();
        currentTime = ap5.audio.currentTime;
        currentindex = ap5.playIndex;
        layui.use('layer', function () {
            var layer = layui.layer;
            //iframe窗
            var open = layer.open({
                type: 2,
                title: '尽情选择你喜欢的歌曲吧!',
                shadeClose: true,
                shade: true,
                maxmin: true, //开启最大化最小化按钮
//                area: ['600px', '600px'],
                area: [document.body.clientWidth - 40 + "px", '500px'],
                content: '/music/searchView',
                end: function () {
                    updateUserTable();
                }
            });
        });
    }

    function getUserTable() {
        $.ajax({
            url: '/music/getSongsTable',
            type: 'GET', //GET
            async: true,    //或false,是否异步
            timeout: 5000,    //超时时间
            dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
            success: function (data, textStatus, jqXHR) {
                ap5 = new APlayer({
                    element: document.getElementById('player1'),
                    narrow: false,
                    autoplay: false,
                    showlrc: 3,
                    mutex: true,
                    theme: '#ad7a86',
                    mode: 'random',
                    listmaxheight: '180px',
                    music: data
                });
            },
            error: function (xhr, textStatus) {
                console.log('错误');
            },
        })
    }

    layui.use('layedit', function () {
        layedit = layui.layedit;
        index = layedit.build('demo', {
            tool: [
                'strong' //加粗
                , 'italic' //斜体
                , 'underline' //下划线
                , 'del' //删除线
                , '|' //分割线
                , 'left' //左对齐
                , 'center' //居中对齐
                , 'right' //右对齐
                , 'face' //表情
            ]
        });
    });

    function updateUserTable() {
        ap5.destroy();
        getUserTable();
        ap5.setMusic(currentindex);
        ap5.play(currentTime);
    }

    layui.use('form', function () {
        var $ = layui.jquery, form = layui.form();
        //全选
        form.on('checkbox(allChoose)', function (data) {
            var child = $(data.elem).parents('table').find('tbody input[type="checkbox"]');
            child.each(function (index, item) {
                item.checked = data.elem.checked;
            });
            form.render('checkbox');
        });

    });

</script>
</body>
</html>