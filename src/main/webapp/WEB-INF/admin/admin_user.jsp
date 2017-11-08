<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body onload="getUserPage(0);getSetting()">
<jsp:include page="/admin_top.jsp"></jsp:include>
<script src="/css/MyBlog_files/lightbox.js"></script>
<link rel="stylesheet" href="/css/MyBlog_files/lightbox.css">
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/additional-methods.js"></script>
<script src="/js/person-admin.js"></script>
<script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/bootstrap-checkbox/1.4.0/bootstrap-checkbox.min.js"></script>
<link href="https://cdn.bootcss.com/awesome-bootstrap-checkbox/1.0.0-alpha.5/awesome-bootstrap-checkbox.min.css"
      rel="stylesheet">
<div class="container bs-docs-container">
    <div class="row">
        <div class="col-md-3">
            <div class="bs-sidebar hidden-print visible-lg visible-md"
                 role="complementary">
                <ul class="nav bs-sidenav">
                    <li class=""><a
                            href="<%=request.getContextPath()%>/login/manager"> 管理首页</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_person_setting.do"> 个人设置</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_user.do"> 用户管理</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"> 趣味管理</a></li>
                    <li><a
                            href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"> 临时管理</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/blog/admin"> 博客管理</a></li>
                    <li class="active"><a
                            href="<%=request.getContextPath()%>/album/album"> 相册管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_banner.do"> Banner管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_friend_link.do"> 友情链接管理</a></li>

                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">
            <div class="col-md-9" role="main">

                <ul class="nav nav-tabs" role="tablist">
                    <li role="presentation" class="active"><a href="#user" role="tab" data-toggle="tab">用户管理</a></li>
                    <li role="presentation" class=""><a href="#student" role="tab" data-toggle="tab">用户搜索</a></li>
                    <li role="presentation"><a href="#index" role="tab" data-toggle="tab">注册设置</a></li>
                </ul>

                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="user">
                        <h3 class="page-header">用户管理</h3>
                        <div class="user-list">
                            <div class="filter">
                                <form method="get" action="" name="filteuser" id="role_filter">
                                    <div class="row">
                                        <div class="col-md-6"><select name="roleId" class="form-control">
                                            <option value="0" selected>角色筛选</option>
                                            <option value="1">超级管理员</option>
                                            <option value="2">管理员</option>
                                            <option value="3">普通用户</option>
                                        </select></div>

                                        <div class="col-md-6">
                                            <a href="javascript:void(0);" class="btn btn-default"
                                               onclick="findByRole()">筛选</a>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="filter">
                                <div class="row">
                                    <form method="get" action="" name="filteuser" id="status_filter">

                                        <div class="col-md-6"><select name="statusId" class="form-control">
                                            <option value="0" selected>状态筛选</option>
                                            <option value="1">待审核</option>
                                            <option value="2">禁止登录</option>
                                            <option value="3">禁止发言</option>
                                            <option value="4">审核通过</option>
                                        </select></div>
                                        <div class="col-md-6">
                                            <a href="javascript:void(0);" class="btn btn-default"
                                               onclick="findByStatus()">筛选</a>
                                        </div>
                                    </form>
                                </div>
                            </div>
                            <table class="table table-striped text-center">
                                <thead>
                                <tr>
                                    <th>账户</th>
                                    <th>角色</th>
                                    <th>状态</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody id="userList">
                                </tbody>
                            </table>
                            <center>
                                <div class="page-nav">
                                    <nav>
                                        <ul class="pagination" id="userListPagination">
                                        </ul>
                                    </nav>
                                </div>
                            </center>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="index">
                        <h3 class="page-header">注册设置</h3>
                        <div class="alert alert-warning" role="alert">
                            <label>注册审核</label>
                            <input id="register_needcheck" type="checkbox">
                            <br>
                            <label><strong>一旦开启.用户注册之后都需要经过管理员进行审核才能够通过</strong></label>
                        </div>
                        <div class="alert alert-warning" role="alert">
                            <label>注册关闭</label>
                            <input id="register_close" type="checkbox">
                            <br>
                            <label><strong>一旦开启.将关闭注册功能</strong></label>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="student">
                        <h3 class="page-header">用户搜索</h3>
                        <form class="form-inline" role="form" method="get" name="searchStudent" id="searchStudent">
                            <div class="form-group">
                                <div class="input-group">
                                    <select class="form-control" name="type">
                                        <option value="0" selected>关键词搜索</option>
                                        <option value="1">按姓名搜索</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="name">
                            </div>
                            <a class="btn btn-default" id="submitSearch" onclick="getSearch()">搜索</a>
                        </form>

                        <table class="table table-striped text-center">
                            <thead>
                            <tr>
                                <th>账户</th>
                                <th>角色</th>
                                <th>状态</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="searchList">
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
<script>
    var currentPage = null;

    //获取用户表
    function getUserPage(page) {
        currentPage = page;
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/userController?page=' + page,
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data)
                $("#userList").html("")
                $("#userListPagination").html("");
                for (var i = 0; i < data[0].pageCount; i++) {
                    if ((i) == data[0].page) {
                        $("#userListPagination").append("<li class='active'><a href='javascript:void(0);' onclick='getUserPage(" + i + ")'>" + (data[0].page + 1) + "</a></li>");
                    } else {
                        $("#userListPagination").append("<li><a href='javascript:void(0);' onclick='getUserPage(" + i + ")'>" + (i + 1) + "</a></li>");
                    }

                }
                $.each(data, function (index, content) {
                    if (content.role.roleName == "super_admin") {
                        content.role.roleName = "超级管理员";
                    } else if (content.role.roleName == "admin") {
                        content.role.roleName = "管理员";
                    } else if (content.role.roleName == "normal") {
                        content.role.roleName = "普通用户";
                    } else {
                        content.role.roleName = "游客";
                        content.role.roleId = "4";
                    }
                    $("#userList").append("<tr>" +
                        "<td title='" + content.user.userId + "'>" + content.user.loginAccount + "</td>" +
                        "<td title='" + content.role.roleId + "'><span class='label label-success'>" + content.role.roleName + "</span></td>" +
                        "<td title='" + content.status.websiteStatusId + "'><span class='label label-success'>" + content.status.websiteStatus + "</span></td>" +
                        "<td><select class='btn btn-success btn-xs' onchange='updateRole(this,0)'><option value='0'>设置角色</option><option value='1'>管理员</option><option value='2'>普通用户</option><option value='3'>游客</option></select>" +
                        "<select class='btn btn-primary btn-xs' onchange='updateStatus(this,0)'><option value='0'>设置状态</option><option value='1'>待审核</option><option value='2'>禁止登录</option><option value='3'>禁止发表</option><option value='4'>审核通过</option></select>" +
                        "<select class='btn btn-danger btn-xs' onchange='remove(this)'><option value='0'>谨慎操作</option><option value='1'>删除</option></select></td></tr>");
                });
            },
            error: function (e) {
                console.log(e)
            }
        });
    }

    function remove(obj) {
        var index = obj.options[obj.selectedIndex].value;
        if (index == 0) {
            return;
        }
        var text = obj.options[obj.selectedIndex].innerHTML;
        //获取id
        var id = $($(obj).parent().parent().children()[0]).attr("title");
        //获取姓名
        var name = $(obj).parent().parent().children()[0];
        swal({
            title: "您确定要删除" + name + "吗？",
            text: "您确定要删除这条数据？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，我要删除",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                url: '/userController',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                    userId: id, _method: "DELETE"
                },
                timeout: 5000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success: function (data, textStatus, jqXHR) {
                    if (data.code == 200) {
                        swal("操作成功!", "已成功删除数据！", "success");
                        $(obj).parent().parent().remove();
                    } else {
                        swal("OMG", "删除操作失败了!", "error");
                    }
                },
                error: function (xhr, textStatus) {
                    swal("OMG", "删除操作失败了!", "error");
                }
            })
        });
    }

    function updateRole(obj, type) {
        var index = obj.options[obj.selectedIndex].value;
        if (index == 0) {
            return;
        }
        var text = obj.options[obj.selectedIndex].innerHTML;
        //获取id
        var id = $($(obj).parent().parent().children()[0]).attr("title");
        var role = $($(obj).parent().parent().children()[1]).attr("title");
        //获取姓名
        var name = $(obj).parent().parent().children()[0].innerHTML;
        var roleName = $($(obj).parent().parent().children()[1]).children()[0].innerHTML;
        swal({
            title: "您确定要将" + name + "的" + roleName + "角色修改为" + text + "吗？",
            text: "您确定要修改这条数据？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，我要修改",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                url: '/userController',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                    userId: id, roleId: (parseInt(index) + 1), _method: "PUT"
                },
                timeout: 5000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success: function (data, textStatus, jqXHR) {
                    if (data.code == 200) {
                        swal("操作成功!", "已成功更新数据！", "success");
                        if (type == 0) {
                            getUserPage(currentPage);
                        } else if (type == 1) {
                            findByStatus();
                        } else if (type == 2) {
                            findByRole();
                        } else if (type == 3) {
                            console.log("重新搜索")
                            getSearch();
                        }
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

    function updateStatus(obj, type) {
        var index = obj.options[obj.selectedIndex].value;
        if (index == 0) {
            return;
        }
        var text = obj.options[obj.selectedIndex].innerHTML;
        //获取id
        var id = $($(obj).parent().parent().children()[0]).attr("title");
        //获取姓名
        var name = $(obj).parent().parent().children()[0].innerHTML;
        var statusName = $($(obj).parent().parent().children()[2]).children()[0].innerHTML;
        console.log(text)
        console.log(index)
        console.log(id)
        console.log(name)
        console.log(statusName)
        swal({
            title: "您确定要将" + name + "的" + statusName + "状态修改为" + text + "吗？",
            text: "您确定要修改这条数据？",
            type: "warning",
            showCancelButton: true,
            closeOnConfirm: false,
            confirmButtonText: "是的，我要修改",
            confirmButtonColor: "#ec6c62"
        }, function () {
            $.ajax({
                url: '/userController/updateUserStatus',
                type: 'POST', //GET
                async: true,    //或false,是否异步
                data: {
                    userId: id, statusId: index, _method: "PUT"
                },
                timeout: 5000,    //超时时间
                dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
                success: function (data, textStatus, jqXHR) {
                    if (data.code == 200) {
                        swal("操作成功!", "已成功更新数据！", "success");
                        if (type == 0) {
                            getUserPage(currentPage);
                        } else if (type == 1) {
                            findByStatus();
                        } else if (type == 2) {
                            findByRole();
                        } else if (type == 3) {
                            console.log("重新搜索")
                            getSearch();
                        }
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


    //获取搜索
    function getSearch() {
        console.log("getSearch")
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/userController/findByName',
            data: $('#searchStudent').serialize(),
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data)
                console.log($('#searchStudent').serialize())
                $("#searchList").html("");
                $.each(data, function (index, content) {
                    if (content.role.roleName == "super_admin") {
                        content.role.roleName = "超级管理员";
                    } else if (content.role.roleName == "admin") {
                        content.role.roleName = "管理员";
                    } else if (content.role.roleName == "normal") {
                        content.role.roleName = "普通用户";
                    } else {
                        content.role.roleName = "游客";
                        content.role.roleId = "4";
                    }
                    $("#searchList").append("<tr>" +
                        "<td title='" + content.user.userId + "'>" + content.user.loginAccount + "</td>" +
                        "<td title='" + content.role.roleId + "'><span class='label label-success'>" + content.role.roleName + "</span></td>" +
                        "<td title='" + content.status.websiteStatusId + "'><span class='label label-success'>" + content.status.websiteStatus + "</span></td>" +
                        "<td><select class='btn btn-success btn-xs' onchange='updateRole(this,3)'><option value='0'>设置角色</option><option value='1'>管理员</option><option value='2'>普通用户</option><option value='3'>游客</option></select>" +
                        "<select class='btn btn-primary btn-xs' onchange='updateStatus(this,3)'><option value='0'>设置状态</option><option value='1'>待审核</option><option value='2'>禁止登录</option><option value='3'>禁止发表</option><option value='4'>审核通过</option></select>" +
                        "<select class='btn btn-danger btn-xs' onchange='remove(this)'><option value='0'>谨慎操作</option><option value='1'>删除</option></select></td></tr>");
                });
            },
            error: function (e) {
                console.log(e)
            }
        });
    }


    function findByRole() {
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/userController/findByRole',
            data: $('#role_filter').serialize(),
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data)
                $("#userList").html("")
                $("#userListPagination").html("");
                $.each(data, function (index, content) {
                    if (content.role.roleName == "super_admin") {
                        content.role.roleName = "超级管理员";
                    } else if (content.role.roleName == "admin") {
                        content.role.roleName = "管理员";
                    } else if (content.role.roleName == "normal") {
                        content.role.roleName = "普通用户";
                    } else {
                        content.role.roleName = "游客";
                        content.role.roleId = "4";
                    }
                    $("#userList").append("<tr>" +
                        "<td title='" + content.user.userId + "'>" + content.user.loginAccount + "</td>" +
                        "<td title='" + content.role.roleId + "'><span class='label label-success'>" + content.role.roleName + "</span></td>" +
                        "<td title='" + content.status.websiteStatusId + "'><span class='label label-success'>" + content.status.websiteStatus + "</span></td>" +
                        "<td><select class='btn btn-success btn-xs' onchange='updateRole(this,2)'><option value='0'>设置角色</option><option value='1'>管理员</option><option value='2'>普通用户</option><option value='3'>游客</option></select>" +
                        "<select class='btn btn-primary btn-xs' onchange='updateStatus(this,2)'><option value='0'>设置状态</option><option value='1'>待审核</option><option value='2'>禁止登录</option><option value='3'>禁止发表</option><option value='4'>审核通过</option></select>" +
                        "<select class='btn btn-danger btn-xs' onchange='remove(this)'><option value='0'>谨慎操作</option><option value='1'>删除</option></select></td></tr>");
                });
            },
            error: function (e) {
                console.log(e)
            }
        });
    }


    function findByStatus() {
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/userController/findByStatus',
            data: $('#status_filter').serialize(),
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.log(data)
                $("#userList").html("")
                $("#userListPagination").html("");
                $.each(data, function (index, content) {
                    if (content.role.roleName == "super_admin") {
                        content.role.roleName = "超级管理员";
                    } else if (content.role.roleName == "admin") {
                        content.role.roleName = "管理员";
                    } else if (content.role.roleName == "normal") {
                        content.role.roleName = "普通用户";
                    } else {
                        content.role.roleName = "游客";
                        content.role.roleId = "4";
                    }
                    $("#userList").append("<tr>" +
                        "<td title='" + content.user.userId + "'>" + content.user.loginAccount + "</td>" +
                        "<td title='" + content.role.roleId + "'><span class='label label-success'>" + content.role.roleName + "</span></td>" +
                        "<td title='" + content.status.websiteStatusId + "'><span class='label label-success'>" + content.status.websiteStatus + "</span></td>" +
                        "<td><select class='btn btn-success btn-xs' onchange='updateRole(this,1)'><option value='0'>设置角色</option><option value='1'>管理员</option><option value='2'>普通用户</option><option value='3'>游客</option></select>" +
                        "<select class='btn btn-primary btn-xs' onchange='updateStatus(this,1)'><option value='0'>设置状态</option><option value='1'>待审核</option><option value='2'>禁止登录</option><option value='3'>禁止发表</option><option value='4'>审核通过</option></select>" +
                        "<select class='btn btn-danger btn-xs' onchange='remove(this)'><option value='0'>谨慎操作</option><option value='1'>删除</option></select></td></tr>");
                });
            },
            error: function (e) {
                console.log(e)
            }
        });
    }
    function getSetting() {
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/register/getRegisterSettings',
            cache: false,
            dataType: 'json',
            success: function (data) {
                console.error(data)
                var close = data.close;
                var needcheck = data.needcheck;
                if (needcheck == "true") {
                    $("#register_needcheck").attr("checked", "true");
                } else {
                    $("#register_needcheck").removeAttr("checked");
                }
                if (close == "true") {
                    $("#register_close").attr("checked", "true");
                } else {
                    $("#register_close").removeAttr("checked");
                }
            },
            error: function (e) {
                console.log(e)
            }
        });
    }

    function setNeedCheck(flag) {
        var data = 0;
        if (flag == true) {
            data = 1;
        }
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/register/updateCheck',
            cache: false,
            data: {'flag': data},
            dataType: 'json',
            success: function (data) {
                console.error(data)
                if(data.code == 200){
                    swal("操作成功!", "操作成功了！", "success");
                }else{
                    swal("OMG", "操作失败了!", "error");
                }
                getSetting();
            },
            error: function (e) {
                swal("OMG", "操作失败了!", "error");
            }
        });
    }

    function setClose(flag) {
        var data = 0;
        if (flag == true) {
            data = 1;
        }
        $.ajax({
            type: 'get',
            url: '<%=request.getContextPath()%>/register/updateClose',
            cache: false,
            data: {'flag': data},
            dataType: 'json',
            success: function (data) {
                console.error(data)
                if(data.code == 200){
                    swal("操作成功!", "操作成功了！", "success");
                    getSetting();
                }else{
                    swal("OMG", "操作失败了!", "error");
                }
            },
            error: function (e) {
                swal("OMG", "操作失败了!", "error");
            }
        });
    }

    $("#register_needcheck").change(function () {
        var flag = $("#register_needcheck").is(':checked');
        setNeedCheck(flag);
    });

    $("#register_close").change(function () {
        var flag = $("#register_close").is(':checked');
        setClose(flag);
    });
</script>
</html>
