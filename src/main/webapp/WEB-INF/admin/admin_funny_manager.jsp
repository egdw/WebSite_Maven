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
    <script type="text/javascript"
            src="<%=request.getContextPath()%>/css/admin_project_manager_files/js.js"></script>
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
                            href="<%=request.getContextPath()%>/manager/manager_project_manager.do"> 项目管理</a></li>
                    <li class="active"><a
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
                <div class="tab-pane fade active in" id="newid">
                    <a data-toggle="modal" data-target="#addModal"
                       class="btn btn-info btn-sm">添加</a><br/>
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
                                    <td>${index.funnyId}</td>
                                    <td>${index.funnyTopic}</td>
                                    <td>${index.funnyText}</td>
                                    <td>${index.funnyUrl}</td>
                                    <td><fmt:formatDate value="${index.funnyCreateDate}"
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
                    </div>
                </div>
                <!-- END PAGE1 -->

                <div  class="modal fade" id="addModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                    <a name="#newid"></a>
                    <div class="alert alert-warning" role="alert" id="addbdid_msg">
                        项目请输入完整的路径,例如https://www.baidu.com<br/>
                    </div>
                    <form method="post" id="addbdid_form" enctype="multipart/form-data"
                          action="manager_funny_add.do">
                        <div class="input-group">
                            <span class="input-group-addon">项目标题</span> <input type="text"
                                                                               class="form-control" id="project_topic"
                                                                               name="project_topic"
                                                                               placeholder="请输入项目标题" required="">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">项目简称</span> <input type="text"
                                                                               class="form-control" name="project_text"
                                                                               id="project_text"
                                                                               placeholder="请输入项目内容" required="">
                        </div>
                        <br>
                        <div class="input-group">
                            <span class="input-group-addon">首页地址</span> <input type="text"
                                                                               class="form-control" name="project_name"
                                                                               id="project_name"
                                                                               placeholder="例如https://www.baidu.com"
                                                                               required="">
                        </div>
                        <br/>
                        <div class="input-group">
                            <span class="input-group-addon">文件附件</span> <input type="file"
                                                                               class="form-control" name="project_file"
                                                                               id="project_file"
                                                                               placeholder="请上传格式为zip的压缩文件" required=""
                                                                               accept=".zip">
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
                            </form>
                        </div>
                        <br>
                        <button data-remodal-action="cancel" class="remodal-cancel">Cancel</button>
                        <button data-remodal-action="confirm" id="project_update_accpet_btn"
                                class="remodal-confirm">OK
                        </button>
                    </div>
                    <br> <br>
                </div>
                <script type="text/javascript">
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
                <!-- PAGE3: NEWID2 -->
                <div class="tab-pane fade" id="newid2" style="display: none;">
                    <form action="http://love.kfj.cc/setting.php" method="get">
                        <div class="input-group">
                            <input type="hidden" name="mod" value="baiduid"> <span
                                class="input-group-addon">输入BDUSS</span> <input type="text"
                                                                                class="form-control" name="bduss"
                                                                                id="bduss_input"> <span
                                class="input-group-btn"><input type="submit"
                                                               id="submit_project_btn" class="btn btn-primary"
                                                               value="点击提交"></span>
                        </div>
                    </form>

                    <br> <br> <br>
                </div>
                <br> <br> <br> <br> <br>
            </div>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/js/jquery.js"></script>
    <script>window.jQuery || document.write('<script src="../libs/jquery/dist/jquery.min.js"><\/script>')</script>
    <script
            src="<%=request.getContextPath()%>/css/admin_project_manager_files/dist/remodal.js"></script>
</div>
</div>
</div>
</body>
</html>