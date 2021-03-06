<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Banner管理</title>
</head>
<script src="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.js"></script>
<link href="https://cdn.bootcss.com/sweetalert/1.1.3/sweetalert.min.css" rel="stylesheet">
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
                <ul class="nav nav-tabs" id="PageTab">
                    <li class="active"><a
                            href="http://love.kfj.cc/index.php?mod=baiduid#newid"
                            data-toggle="tab"
                            aria-expanded="true">Banner管理</a></li>
                </ul>
                <br>
                <div class="tab-pane fade active in" id="newid">
                    <div style="padding-top: 10px">
                        <a data-toggle="modal" data-target="#add-blog-modal"
                           class="btn btn-info btn-sm">新建Banner</a>
                        <table class="table table-hover" id="blog-table">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>标题</th>
                                <th>指向地址</th>
                                <th>图片地址</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.list}" var="index"
                                       varStatus="i">
                                <tr>
                                    <td>${index.bannerId}</td>
                                    <td><a href="#" name="${index.bannerId}"
                                           onclick="editInfo(this)">${index.bannerTitle}</a></td>
                                    <td><a href="#" name="${index.bannerUrl}"
                                           onclick="editInfo(this)">${index.bannerUrl}</a></td>
                                    <c:if test="${index.bannerImageUrl !=null}">
                                        <td><a
                                                href="<%=request.getContextPath()%>/${index.bannerImageUrl}"
                                                class="thumbnail" data-lightbox="example-set"
                                                data-title="<div style='padding-top:5px;font-size: 16px'></div>">
                                            <img src="<%=request.getContextPath()%>/${index.bannerImageUrl}"
                                                 height="30px" style="height: 30px">
                                        </a></td>
                                    </c:if>
                                    <c:if test="${index.bannerImageUrl ==null}">
                                        <td><a
                                                href="<%=request.getContextPath()%>/images/noimg.jpeg"
                                                class="thumbnail" data-lightbox="example-set"
                                                data-title="<div style='padding-top:5px;font-size: 16px'></div>">
                                            <img src="<%=request.getContextPath()%>/images/noimg.jpeg"
                                                 height="30px" style="height: 30px">
                                        </a></td>
                                    </c:if>
                                    <td>
                                        <div class="btn-group btn-group-xs">
                                            <button type="button" class="btn btn-success"
                                                    name="${i.index+1}" onclick="editInfo(this)">修改
                                            </button>
                                            <a data-toggle="modal" data-target="#deleteBlogModel"
                                               type="button" class="btn btn-warning"
                                               onclick="clickDel(${index.bannerId},${i.index},this)">删除</a>
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
                                            name="title" type="text" class="form-control"
                                            placeholder="请输入标题"/>
                                    </div>
                                    <div>
                                        <label style="font-size: 15px">指向地址:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            name="url" type="text" class="form-control"
                                            placeholder="请输入指向地址或文章"/>
                                    </div>
                                    <div id="pic_div" style="padding-top: 5px;">
                                        <label style="font-size: 15px">图片(1000*438): </label>
                                        <div id="show"></div>
                                        <!-- 存储图片地址，并显示图片 -->
                                        <input type="hidden" name="img_url" id="pictureSrc">
                                    </div>
                                    <img alt="" id="displayImg" width="100px" height="100px"
                                         src="">
                                    <div style="padding-top: 5px">
                                        <input type="file" name="image" id="imageFile">
                                    </div>
                                    <div style="padding-top: 5px">
                                        <button id="upload" onclick="return false;">上传</button>
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
                                <p>您确认要删除这个Banner吗?</p>
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
                                            name="bannerId" type="text" class="form-control" readonly/>
                                    </div>
                                    <div style="padding-top: 5px">
                                        <label style="font-size: 15px">标题:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            id="title" name="bannerTitle" type="text" class="form-control"/>
                                    </div>
                                    <div style="padding-top: 5px">
                                        <label style="font-size: 15px">指向地址:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            id="url" name="bannerUrl" type="text" class="form-control"/>
                                    </div>
                                    <div style="padding-top: 5px;">
                                        <label style="font-size: 15px">图片: </label>
                                        <!-- 存储图片地址，并显示图片 -->
                                        <img height="140px" id="blog_update_image"> <input
                                            id="update_blog_image" type="hidden" name="bannerImageUrl">
                                    </div>
                                    <input type="hidden" name="_method" value="PUT">
                                    <div style="padding-top: 5px">
                                        <input type="file" id="imageFile2">
                                    </div>
                                    <div style="padding-top: 5px">
                                        <button id="upload2" id="updateChangeBtn" onclick="return false;">上传</button>
                                    </div>
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
                            url: '<%=request.getContextPath()%>/banner',
                            data: $("#updateForm").serialize(),
                            dataType: 'json',
                            success: function (data) {
                                if (data.code == 200) {
                                    swal("OMG", "更新成功!", "success");
                                    parent.location.reload();
                                } else {
                                    swal("OMG", "更新失败!", "error");
                                }
                                $("#updateBlogBtnCancle").click();
                            },
                            error: function (e) {
                                swal("OMG", "更新失败!", "error");
                            }
                        });
                    }

                    function delPage() {
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/banner',
                            data: {id: delIdTemp, _method: 'DELETE'},
                            dataType: 'json',
                            success: function (data) {
                                if (data.code == 200) {
                                    document.getElementById("blog-table").deleteRow(delTableTemp);
                                    var rowsCount = document.getElementById("blog-table").rows.length;
                                    for (var z = 1; z < rowsCount; z++) {
                                        document.getElementById("blog-table").rows[z].cells[0].innerText = (z);
                                    }
                                    swal("OMG", "删除成功!", "success");
                                } else {
                                    swal("OMG", "删除失败!", "error");
                                }
                            },
                            error: function () {
                                swal("OMG", "删除失败!", "error");
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
                            url: '<%=request.getContextPath()%>/banner/getBanner?id=' + id_db,
                            cache: false,
                            dataType: 'json',
                            success: function (data) {
                                console.log(data);
                                $('#title').val(data.bannerTitle);
                                $('#url').val(data.bannerUrl);
                                $('#pictureSrc2').val(data.bannerImageUrl);
                                //放入img的src
                                $('#blog_update_image').attr('src', '/' + data.bannerImageUrl);
                                $('#update_blog_image').val(data.bannerImageUrl);
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
                            url: '<%=request.getContextPath()%>/banner',
                            data: $("#addBlogForm").serialize(),
                            success: function (data) {
                                var obj = eval("(" + data + ")");
                                if (obj.code == 200) {
                                    $("#addBlogBtnCancle").click();
                                    swal("OMG", "提交成功!", "success");
                                    window.location.reload();
                                } else {
                                    $("#addBlogBtnCancle").click();
                                    swal("OMG", "提交出错!", "error");
                                }
                            },
                            error: function (e) {
                                $("#addBlogBtnCancle").click();
                                swal("OMG", "提交出错!", "error");
                            }
                        });
                    }

                    function upload() {
                        $.ajaxFileUpload(
                            {
                                url: '<%=request.getContextPath()%>/blog/imageUpload',
                                secureuri: false,
                                fileElementId: 'imageFile',
                                dataType: 'text',
                                success: function (data) {
                                    if (data != 'null') {
                                        $('#displayImg').attr("src", "/" + data);
                                        $('#pictureSrc').attr("value", data);
                                    } else {
                                        $('#displayImg').attr("src", "");
                                        $('#pictureSrc').attr("value", "");
                                        swal("OMG", "上传失败!", "error");
                                    }
                                },
                                error: function (data, status, e) {
                                    swal("OMG", "上传失败!", "error");
                                }
                            }
                        );
                    }

                    function upload2() {
                        $.ajaxFileUpload(
                            {
                                url: '<%=request.getContextPath()%>/blog/imageUpload',
                                secureuri: false,
                                fileElementId: 'imageFile2',
                                dataType: 'text',
                                success: function (data) {
                                    if (data != 'null') {
                                        $('#blog_update_image').attr("src", "/" + data);
                                        $('#update_blog_image').attr("value", data);
                                    } else {
                                        $('#blog_update_image').attr("src", "");
                                        $('#update_blog_image').attr("value", "");
                                        swal("OMG", "上传失败!", "error");
                                    }
                                },
                                error: function (data, status, e) {
                                    swal("OMG", "上传失败!", "error");
                                }
                            }
                        );
                    }
                </script>
            </div>
        </div>
    </div>
</div>
</body>
</html>
