<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>友情链接管理</title>
</head>
<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<script src="/css/MyBlog_files/lightbox.js"></script>
<link rel="stylesheet" href="/css/MyBlog_files/lightbox.css">
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
                <ul class="nav nav-tabs" id="PageTab">
                    <li class="active"><a
                            href="http://love.kfj.cc/index.php?mod=baiduid#newid"
                            data-toggle="tab"
                            aria-expanded="true">友情链接管理</a></li>
                </ul>
                <br>
                <div class="tab-pane fade active in" id="newid">
                    <div style="padding-top: 10px">
                        <a data-toggle="modal" data-target="#add-blog-modal"
                           class="btn btn-info btn-sm">新建友情链接</a>
                        <table class="table table-hover" id="blog-table">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>名称</th>
                                <th>地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.list}" var="index"
                                       varStatus="i">
                                <tr>
                                    <td>${index.websiteFriendLinkId}</td>
                                    <td>${index.websiteFriendLinkName}</td>
                                    <td><a href="#" name="${index.wbesiteFriendLinkUrl}"
                                           onclick="editInfo(this)">${index.wbesiteFriendLinkUrl}</a></td>
                                    <td>
                                        <div class="btn-group btn-group-xs">
                                            <button type="button" class="btn btn-success"
                                                    name="${i.index+1}" onclick="editInfo(this)">修改
                                            </button>
                                            <a data-toggle="modal" data-target="#deleteBlogModel"
                                               type="button" class="btn btn-warning"
                                               onclick="clickDel(${index.websiteFriendLinkId},${i.index},this)">删除</a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 隐藏博客添加窗体 -->
                <div class="modal fade" id="add-blog-modal" tabindex="-1"
                     role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                </button>
                                <h4 class="modal-title">添加</h4>
                            </div>

                            <form id="addBlogForm"
                                  action="<%=request.getContextPath()%>/album/add" method="post">
                                <div class="modal-body">
                                    <div>
                                        <label style="font-size: 15px">标题:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            name="name" type="text" class="form-control"
                                            placeholder="请输入标题"/>
                                    </div>
                                    <div>
                                        <label style="font-size: 15px">指向地址:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            name="url" type="text" class="form-control"
                                            placeholder="请输入指向地址或文章"/>
                                    </div>
                                </div>
                                <input type="hidden" name="userType" value="1">
                                <div class="modal-footer">
                                    <button type="button" id="addBlogBtn" class="btn btn-success"
                                            onclick="return false;">添加
                                    </button>
                                    <button type="button" id="addBlogBtnCancle"
                                            class="btn btn-default" data-dismiss="modal">取消
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>


                <!-- 信息删除确认 -->
                <div class="modal fade" id="deleteBlogModel">
                    <div class="modal-dialog">
                        <div class="modal-content message_align">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal"
                                        aria-label="Close">
                                    <span aria-hidden="true">×</span>
                                </button>
                                <h4 class="modal-title">确认删除操作</h4>
                            </div>
                            <div class="modal-body">
                                <p>您确认要删除这个友情链接吗?</p>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal" onclick="delPage()">确定
                                    </button>
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal">取消
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal fade" id="update-blog-modal" tabindex="-1"
                     role="dialog" aria-labelledby="modal-label" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;</span><span class="sr-only">关闭</span>
                                </button>
                                <h4 class="modal-title">查看</h4>
                            </div>
                            <form id="updateForm" action="/banner" method="post">
                                <div class="modal-body">
                                    <div>
                                        <label style="font-size: 15px">编号:</label> <input
                                            style="display: inline;font-size:15px;width:250px;" id="id"
                                            name="websiteFriendLinkId" type="text" class="form-control" readonly/>
                                    </div>
                                    <div style="padding-top: 5px">
                                        <label style="font-size: 15px">标题:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            id="title" name="websiteFriendLinkName" type="text" class="form-control"/>
                                    </div>
                                    <div style="padding-top: 5px">
                                        <label style="font-size: 15px">指向地址:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            id="url" name="wbesiteFriendLinkUrl" type="text" class="form-control"/>
                                    </div>
                                    <input type="hidden" name="_method" value="PUT"/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" id="updateBlogBtn" class="btn btn-success"
                                            onclick="update()">修改
                                    </button>
                                    <button type="button" id="updateBlogBtnCancle"
                                            class="btn btn-default" data-dismiss="modal">取消
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
                <!-- 隐藏窗体结束 -->
                <script type="text/javascript"
                        src="<%=request.getContextPath()%>/ckeditor/ckeditor.js"></script>
                <script type="text/javascript"
                        src="<%=request.getContextPath()%>/ckfinder/ckfinder.js"></script>
                <script src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
                <script type="text/javascript">
                    //临时存放需要删除的文章ID号
                    var delIdTemp;
                    //临时存放删除的文章ID号所在的表中的位置.
                    var delTableTemp;
                    function clickDel(x, y, index) {
                        delIdTemp = x;
                        delTableTemp = y + 1;
                    }

                    function update() {
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/friendLink',
                            data: $("#updateForm").serialize(),
                            dataType: 'json',
                            success: function (data) {
                                if (data.code == 200) {
                                    alert("更新成功");
                                } else {
                                    alert("更新失败");
                                }
                                $("#updateBlogBtnCancle").click();
                            },
                            error: function (e) {
                                console.log(e);
                                console.log("更新失败");
                            }
                        });
                    }

                    function delPage() {
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/friendLink',
                            data: {id: delIdTemp, _method: 'DELETE'},
                            dataType: 'json',
                            success: function (data) {
                                if (data.code == 200) {
                                    document.getElementById("blog-table").deleteRow(delTableTemp);
                                    var rowsCount = document.getElementById("blog-table").rows.length;
                                    for (var z = 1; z < rowsCount; z++) {
                                        document.getElementById("blog-table").rows[z].cells[0].innerText = (z);
                                    }
                                    alert("删除成功");
                                } else {
                                    alert('删除失败');
                                }
                            },
                            error: function () {
                                alert("删除失败");
                            }
                        });
                    }

                    //编辑-查看信息
                    function editInfo(obj) {
                        var id = $(obj).attr("name");
                        //获取表格中的一行数据
                        var id_db = document.getElementById("blog-table").rows[id].cells[0].innerText;
                        //向模态框中传值
                        $('#id').val(id_db);
                        $.ajax({
                            type: 'get',
                            url: '<%=request.getContextPath()%>/friendLink/getOne?id=' + id_db,
                            cache: false,
                            dataType: 'json',
                            success: function (data) {
                                console.log(data);
                                $('#title').val(data.websiteFriendLinkName);
                                $('#url').val(data.wbesiteFriendLinkUrl);
                            },
                        });
                        $('#update-blog-modal').modal('show');
                    }

                    $(document).ready(function () {
                        $("#upload").click(function () {
                            upload();
                        });

                        $("#addBlogBtn").click(function () {
                            addBlog();
                        });

                        $("#updateChangeBtn").click(function () {
                            addBlog2();
                        })
                    });

                    function addBlog() {
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/friendLink',
                            data: $("#addBlogForm").serialize(),
                            success: function (data) {
                                var obj = eval("(" + data + ")");
                                if (obj.code == 200) {
                                    $("#addBlogBtnCancle").click();
                                    alert("提交成功");
//                                    window.location.reload();
                                } else {
                                    $("#addBlogBtnCancle").click();
                                    alert("提交出错");
                                }
                            },
                            error: function (e) {
                                $("#addBlogBtnCancle").click();
                                alert("提交出错");
                            }
                        });
                    }
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
