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
    <script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
</head>
<body style="background-color: #c2c2c2" onload="getUserTable();findByStatus()">
<jsp:include page="/MyBlog_top.jsp"></jsp:include>

<fieldset class="layui-elem-field">
    <legend>个人中心<a href="/login/logout.do" style="color: red">注销</a></legend>
    <div class="layui-field-box">
        <div id="right_page" style="float: left">
            <div class="layui-tab layui-tab-brief" lay-filter="docDemoTabBrief">
                <ul class="layui-tab-title">
                    <li class="layui-this">个人信息</li>
                    <li>我的音乐</li>
                    <li>个人设置</li>
                    <shiro:hasRole name="admin">
                        <li>管理员管理</li>
                    </shiro:hasRole>
                </ul>
                <div class="layui-tab-content">
                    <div class="layui-tab-item layui-show">
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">用户名:<shiro:principal></shiro:principal></blockquote>
                        </div>
                        <div class="layui-field-box">
                            <blockquote class="layui-elem-quote">用户组:普通用户</blockquote>
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
                    </div>
                    <div class="layui-tab-item">

                        <form class="layui-form" action="/userController/updateUser" method="post">
                            <div class="layui-form-item">
                                <label class="layui-form-label">真实姓名</label>
                                <div class="layui-input-block">
                                    <input type="text" maxlength="4" name="name" required lay-verify="required"
                                           placeholder="您的真实姓名"
                                           autocomplete="off" class="layui-input" value="${requestScope.user.userName}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">邮箱设置</label>
                                <div class="layui-input-block">
                                    <input type="email" maxlength="25" name="email" required lay-verify="required"
                                           placeholder="更改你在本站设置的邮箱地址"
                                           autocomplete="off" class="layui-input"
                                           value="${requestScope.user.userEmail}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">手机设置</label>
                                <div class="layui-input-block">
                                    <input type="text" minlength="11" maxlength="11" name="phone" required
                                           lay-verify="required"
                                           placeholder="更改你在本站设置的手机号码"
                                           autocomplete="off" class="layui-input"
                                           value="${requestScope.user.userPhone}">
                                </div>
                            </div>
                            <div class="layui-form-item">
                                <label class="layui-form-label">更改密码</label>
                                <div class="layui-input-block">
                                    <input type="password" name="password" placeholder="留空表示不更改密码"
                                           autocomplete="off" class="layui-input">
                                </div>
                            </div>
                            <input type="hidden" name="_method" value="put"/>
                            <div class="layui-form-item">
                                <div class="layui-input-block">
                                    <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                                    <button type="reset" class="layui-btn layui-btn-primary">重置</button>
                                </div>
                            </div>
                        </form>

                        <script>
                            //Demo
                            layui.use('form', function () {
                                var form = layui.form;

                                //监听提交
                                form.on('submit(formDemo)', function (data) {
                                    layer.msg(JSON.stringify(data.field));
                                    return false;
                                });
                            });
                        </script>

                    </div>

                    <shiro:hasRole name="admin">
                        <div class="layui-tab-item">
                            需要审核的用户
                            <table class="layui-table">
                                <colgroup>
                                    <col width="150">
                                    <col width="200">
                                    <col>
                                </colgroup>
                                <thead>
                                <tr>
                                    <th>昵称</th>
                                    <th>签名</th>
                                </tr>
                                </thead>
                                <tbody id="userList">
                                </tbody>
                            </table>
                        </div>
                    </shiro:hasRole>
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

    function findByStatus() {
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/userController/findByRole2',
            data: $('#status_filter').serialize(),
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data)
                $("#userList").html("")
                $("#userListPagination").html("");
                $.each(data, function (index, content) {
                    $("#userList").append("<tr>" +
                        "<td title='" + content.user.userId + "'>" + content.user.loginAccount + "</td>" +
                        "<td>" +
                        "<button class='btn btn-primary btn-xs' onclick='updateStatus(this)'>审核通过</button>" +
                        "</td></tr>");
                });
            },
            error: function (e) {
                console.log(e)
            }
        });
    }

    function updateStatus(obj) {
        //获取id
        var id = $($(obj).parent().parent().children()[0]).attr("title");
        //获取姓名
        var name = $(obj).parent().parent().children()[0].innerHTML;
        swal({
            title: "您确定要将" + name + "的状态修改为审核通过吗？",
            text: "您确定要修改这条数据？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，我要修改",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                url: '/userController/updateUserStatus2',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                    userId: id, _method: "PUT"
                },
                timeout: 5000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success: function (data, textStatus, jqXHR) {
                    if (data.code == 200) {
                        swal("操作成功!", "已成功更新数据！", "success");
                        $(obj).parent().parent().remove();
                    } else {
                        swal("OMG", "更新操作失败了!", "error");
                    }
                },
                error: function (xhr, textStatus) {
                    console.log(xhr)
                    console.log(textStatus)

                    swal("OMG", "更新操作失败了!", "error");
                }
            })
        });
    }

</script>
</body>
</html>