<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<script src="https://cdn.bootcss.com/remodal/1.1.1/remodal.js"></script>
<link href="https://cdn.bootcss.com/remodal/1.1.1/remodal.min.css" rel="stylesheet">
<script src="https://cdn.bootcss.com/remodal/1.1.1/remodal.min.js"></script>
<link href="https://cdn.bootcss.com/remodal/1.1.1/remodal-default-theme.min.css" rel="stylesheet">
<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<div class="container bs-docs-container">
    <div class="row">
        <div class="col-md-3">
            <div class="bs-sidebar hidden-print visible-lg visible-md"
                 role="complementary">
                <ul class="nav bs-sidenav">
                    <li class=""><a href="<%=request.getContextPath()%>/login/manager"> 管理首页</a></li>
                    <li class=""><a href="<%=request.getContextPath()%>/manager/manager_person_setting.do"> 个人设置</a>
                    </li>
                    <li class="active"><a
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li class=""><a
                            href="<%=request.getContextPath()%>/manager/manager_funny_manager.do"> 趣味管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/manager/manager_temp_manager.do"> 临时管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/blog/admin"> 博客管理</a></li>
                    <li><a href="<%=request.getContextPath()%>/album/album"> 相册管理</a></li>
                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">
            <div class="col-md-9" role="main">

                <!-- NAVI -->
                <ul class="nav nav-tabs" id="PageTab">
                    <li class="active"><a
                            href="http://love.kfj.cc/index.php?mod=baiduid#newid"
                            data-toggle="tab"
                            aria-expanded="true">管理项目</a></li>
                </ul>
                <br>
                <!-- END NAVI -->
                <a data-toggle="modal" data-target="#addModal"
                   class="btn btn-info btn-sm">添加</a><br/>
                <div class="tab-pane fade active in" id="newid">
                    <a name="#adminid"></a>
                    <div class="projects_list">
                        <table border="1">
                            <th>项目编号</th>
                            <th>项目标题</th>
                            <th>项目内容</th>
                            <th>项目地址</th>
                            <th>创建时间</th>
                            <th>项目封面</th>
                            <th>操作</th>
                            <c:forEach items="${requestScope.projects}" var="index">
                                <tr>
                                    <td>${index.projectId}</td>
                                    <td>${index.projectTopic}</td>
                                    <td>${index.projectText}</td>
                                    <td>${index.projectUrl}</td>
                                    <td><fmt:formatDate value="${index.projectCreateDate}"
                                                        pattern="yyyy-MM-dd HH:mm:ss"/></td>
                                    <td><img
                                            src="http://q.qlogo.cn/headimg_dl?dst_uin=378759617&spec=640&img_type=jpg"
                                            width="50" height="50"></td>
                                    <td><input type="button" class="project_del_btn"
                                               value="删除"><br/>
                                        <input type="button"
                                               class="project_update_btn" value="更新"></td>
                                </tr>
                            </c:forEach>
                        </table>
                        <div class="page-nav">
                            <nav>
                                <ul class="pagination">
                                    <c:forEach var="i" begin="1" end="${requestScope.allNum}">
                                        <c:if test="${i==pageNum}">
                                            <li class="active"><a
                                                    href="<%=request.getContextPath()%>/manager/manager_project_manager.do?pageNum=${i-1}">${i}</a>
                                            </li>
                                        </c:if>
                                        <c:if test="${i!=pageNum}">
                                            <li><a
                                                    href="<%=request.getContextPath()%>/manager/manager_project_manager.do?pageNum=${i-1}">${i}</a>
                                            </li>
                                        </c:if>
                                    </c:forEach>
                                </ul>
                            </nav>
                        </div>
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
                                <h4 class="modal-title" id="myModalLabel">添加工程</h4>
                            </div>
                            <div class="modal-body">
                                <a name="#newid"></a>
                                <div class="alert alert-warning" role="alert" id="addbdid_msg">
                                    项目请输入完整的路径,例如https://www.baidu.com<br/>
                                </div>
                                <form method="post" id="addbdid_form"
                                      action="manager_project_add.do">
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
                                        <span class="input-group-addon">项目内容</span> <input type="text"
                                                                                           class="form-control"
                                                                                           name="project_text"
                                                                                           id="project_text"
                                                                                           placeholder="请输入项目内容"
                                                                                           required="">
                                    </div>
                                    <br>
                                    <div class="input-group">
                                        <span class="input-group-addon">项目地址</span> <input type="text"
                                                                                           class="form-control"
                                                                                           name="project_url"
                                                                                           id="project_url"
                                                                                           placeholder="例如https://www.baidu.com"
                                                                                           required="">
                                    </div>
                                    <br/> <a href="#modal"> <input type="button"
                                                                   class="btn btn-primary" value="提交">
                                </a><br>
                                </form>
                                <div class="remodal" data-remodal-id="modal" role="dialog"
                                     aria-labelledby="modal1Title" aria-describedby="modal1Desc">
                                    <button data-remodal-action="close" class="remodal-close"
                                            aria-label="Close"></button>
                                    <div>
                                        <h2 id="modal1Title">项目提交</h2>
                                        <p id="modal1Desc">确定要提交项目吗?</p>
                                    </div>
                                    <br>
                                    <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
                                    <button data-remodal-action="confirm" id="project_add_accpet_btn"
                                            class="remodal-confirm">OK
                                    </button>
                                </div>

                            </div>
                        </div><!-- /.modal-content -->
                    </div><!-- /.modal -->
                </div>
                <script type="text/javascript">
                    $(document).ready(function () {
                        $("#project_add_accpet_btn").click(function () {
                            $.ajax({
                                type: 'post',
                                url: 'manager_project_add.do',
                                data: $("#addbdid_form").serialize(),
                                success: function (data) {
                                    console.log(data);
                                    if (data == '{add_project_true}') {
                                        alert("添加项目成功");
                                    } else {
                                        alert("添加项目失败");
                                    }
                                },
                                error: function (e) {
                                    alert("添加项目失败");
                                }
                            });
                        });
                        $(".project_del_btn").click(function () {
                            var tr = $(this).parent().parent();
                            var tds = $(this).parent().parent().children();
                            var data = tds.eq(0).html();
                            $.ajax({
                                url: 'manager_project_delete.do',
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
                                url: 'manager_project_update.do',
                                data: $("#project_update_form").serialize(),
                                success: function (data) {
                                    console.log(data);
                                    if (data == '{project_update_success}') {
                                        alert("更新项目成功,请刷新界面");
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
    <script src="https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js"></script>
    <script
            src="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal.js"></script>

    <div class="remodal" data-remodal-id="modalupdate" role="dialog"
         aria-labelledby="modal1Title" aria-describedby="modal1Desc">
        <button data-remodal-action="close" class="remodal-close"
                aria-label="Close"></button>
        <div>
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
                <div class="input-group">
                    <span class="input-group-addon">项目地址</span> <input type="text"
                                                                       class="form-control"
                                                                       name="projectUrl"
                                                                       id="project_update_url"
                                                                       placeholder="例如https://www.baidu.com"
                                                                       required="">
                </div>
            </form>
        </div>
        <br>
        <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
        <button data-remodal-action="confirm" id="project_update_accpet_btn"
                class="remodal-confirm">OK
        </button>
    </div>
</div>
</div>
</div>
</body>
</html>