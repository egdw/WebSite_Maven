<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="charset" content="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal.css">
    <link rel="stylesheet"
          href="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal-default-theme.css">
    <script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
</head>
<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<button class="btn btn-primary btn-lg" id="wabutton"
        style="display:none;" data-toggle="modal" data-target="#alert_modal"></button>
<div class="container bs-docs-container">
    <div class="row">
        <div class="col-md-3">
            <div class="bs-sidebar hidden-print visible-lg visible-md"
                 role="complementary">
                <ul class="nav bs-sidenav">
                    <li></li>
                    <li class=""><a href="<%=request.getContextPath()%>/login/manager"> 管理首页</a></li>
                    <li class=""><a href="<%=request.getContextPath()%>/manager/manager_person_setting.do"> 个人设置</a>
                    </li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_user.do"> 用户管理</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li class="active"><a
                            href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"> 趣味管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"> 临时管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/blog/admin"> 博客管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/album/album"> 相册管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_banner.do"> Banner管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_friend_link.do"> 友情链接管理</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">
            <div class="col-md-9" role="main">
                <!-- NAVI -->
                <ul class="nav nav-tabs" id="PageTab">
                    <li class="active"><a
                            data-toggle="tab"
                            aria-expanded="true">管理项目</a></li>
                </ul>
                <br>
                <!-- END NAVI -->
                <div class="tab-pane fade active in" id="newid">
                    <a data-toggle="modal" data-target="#addModal"
                       class="btn btn-info btn-sm">添加</a><br/>
                    <a name="#adminid"></a>
                    <div class="projects_list">
                        <table border="1" class="table table-bordered">
                            <th>项目编号</th>
                            <th>项目标题</th>
                            <th>项目内容</th>
                            <th>项目地址</th>
                            <th>创建时间</th>
                            <th>操作</th>
                            <c:forEach items="${requestScope.projects}" var="index">
                                <tr>
                                    <td>${index.funnyId}</td>
                                    <td>${index.funnyTopic}</td>
                                    <td>${index.funnyText}</td>
                                    <td>${index.funnyUrl}</td>
                                    <td><fmt:formatDate value="${index.funnyCreateDate}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><input type="button" class="project_del_btn"
                                               value="删除"><br/>
                                        <input type="button"
                                               class="project_update_btn" value="更新"></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <center>
                            <div class="page-nav">
                                <nav>
                                    <ul class="pagination">
                                        <c:forEach var="i" begin="1" end="${requestScope.allNum}">
                                            <c:if test="${i==pageNum}">
                                                <li class="active"><a
                                                        href="<%=request.getContextPath()%>/manager/manager_funny_manager.do?pageNum=${i-1}">${i}</a>
                                                </li>
                                            </c:if>
                                            <c:if test="${i!=pageNum}">
                                                <li><a
                                                        href="<%=request.getContextPath()%>/manager/manager_funny_manager.do?pageNum=${i-1}">${i}</a>
                                                </li>
                                            </c:if>
                                        </c:forEach>
                                    </ul>
                                </nav>
                            </div>
                        </center>
                    </div>
                </div>
                <!-- END PAGE1 -->

                <div class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                     aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;
                                </button>
                                <h4 class="modal-title" id="myModalLabel">添加趣味</h4>
                            </div>
                            <div class="modal-body">
                                <div class="alert alert-warning" role="alert" id="addbdid_msg">
                                    首页名称请输入主页的文件名,比如你的主页名为index.html,请填写完整的名称.<br/>
                                    注意!上传的文件需要是<b>压缩文件</b>!并且文件里不要出现与主页文件名<b>相同</b>的文件.<br/>
                                    只支持一种格式的压缩文件(zip)
                                </div>
                                <form method="post" id="addbdid_form" enctype="multipart/form-data"
                                      action="manager_funny_add.do">
                                    <div class="input-group">
                                        <span class="input-group-addon">项目标题</span> <input type="text"
                                                                                           class="form-control"
                                                                                           id="project_topic"
                                                                                           name="project_topic"
                                                                                           placeholder="请输入项目标题"
                                                                                           required="">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class="input-group-addon">项目简称</span> <input type="text"
                                                                                           class="form-control"
                                                                                           name="project_text"
                                                                                           id="project_text"
                                                                                           placeholder="请输入项目内容"
                                                                                           required="">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class="input-group-addon">首页地址</span> <input type="text"
                                                                                           class="form-control"
                                                                                           name="project_name"
                                                                                           id="project_name"
                                                                                           placeholder="例如index.html"
                                                                                           required="">
                                    </div>
                                    <br/>
                                    <div class="input-group">
                                        <span class="input-group-addon">文件附件</span> <input type="file"
                                                                                           class="form-control"
                                                                                           name="project_file"
                                                                                           id="project_file"
                                                                                           placeholder="请上传格式为zip的压缩文件"
                                                                                           required=""
                                                                                           accept=".zip">
                                    </div>
                                    <br/> <a href="javascript:void(0)" onclick="openAlert()"> <input type="button"
                                                                   class="btn btn-primary" value="提交">
                                </a><br>
                                </form>
                                <br> <br>

                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <form id="project_update_form">
                        <input type="hidden" id="project_update_id" name="projectId">
                        <div class="input-group">
                            <span class="input-group-addon">项目标题</span> <input type="text"
                                                                               class="form-control"
                                                                               id="project_update_topic"
                                                                               name="projectTopic"
                                                                               placeholder="请输入项目标题"
                                                                               required="">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">项目内容</span> <input type="text"
                                                                               class="form-control"
                                                                               name="projectText"
                                                                               id="project_update_text"
                                                                               placeholder="请输入项目内容"
                                                                               required="">
                        </div>
                        <br>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="project_update_accpet_btn" class="btn btn-primary">提交更改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal -->
    </div>

    <button style="VISIBILITY: hidden" id="startBtn" hidden class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal" onclick="">开始演示模态框</button>


    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
    <script
            src="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal.js"></script>
    <script type="text/javascript">
        function openAlert() {
            swal({
                title: "您确定要添加吗？",
                text: "您确定要添加这条数据？",
                type: "warning",
                showCancelButton: true,
                closeOnConfirm: false,
                confirmButtonText: "是的，我要添加",
                confirmButtonColor: "#ec6c62"
            }, function () {
                $("#addbdid_form").submit();
            });
        }

        $(document).ready(function () {
            $("#project_add_accpet_btn").click(function () {
                $("#addbdid_form").submit();
            });
            $(".project_del_btn").click(function () {
                var tr = $(this).parent().parent();
                var tds = $(this).parent().parent().children();
                var data = tds.eq(0).html();
                $.ajax({
                    url: 'manager_funny_delete.do',
                    type: 'POST',
                    data: "projectId=" + data,
                    success: function (data) {
                        if (data == '{project_del_success}') {
                            tds.each(function () {
                                $(this).remove();
                            });
                            tr.remove();

                            alert("删除项目成功");
                        } else {
                            alert("删除项目失败");
                        }
                    },
                    error: function () {
                        alert("删除项目失败");
                    }
                });
            });
            $("#project_update_accpet_btn").click(function () {
                $.ajax({
                    type: 'post',
                    url: 'manager_funny_update.do',
                    data: $("#project_update_form").serialize(),
                    success: function (data) {
                        console.log(data);
                        if (data == '{project_update_success}') {
//                                        alert("更新项目成功,请刷新界面");
                            parent.location.reload();
                        } else {
                            alert("更新项目失败");
                        }
                    },
                    error: function (e) {
                        alert("更新项目失败");
                    }
                });
            });
            $(".project_update_btn").click(function () {
                var tr = $(this).parent().parent();
                var tds = $(this).parent().parent().children();
                var id = tds.eq(0).html();
                var topic = tds.eq(1).html();
                var text = tds.eq(2).html();
                var url = tds.eq(3).html();
                $("#startBtn").click();
                window.location.href = "#modalupdate";
                $("#project_update_id").val(id);
                $("#project_update_topic").val(topic);
                $("#project_update_text").val(text);
                $("#project_update_url").val(url);
            });
        });
    </script>
</div>
</div>
</div>
</body>
</html>