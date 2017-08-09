<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://cksource.com/ckfinder" prefix="ckf" %>
<%@ taglib uri="http://ckeditor.com" prefix="ck" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="charset" content="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
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

                </ul>
            </div>
        </div>
        <div class="col-md-9" role="main">
            <div class="col-md-9" role="main">
                <ul class="nav nav-tabs" id="PageTab">
                    <li class="active"><a
                            href="http://love.kfj.cc/index.php?mod=baiduid#newid"
                            data-toggle="tab"
                            aria-expanded="true">相册</a></li>
                </ul>
                <br>
                <!-- END NAVI -->
                <!-- 第二个分组界面 -->
                <div class="tab-pane fade active in" id="newid">
                    <div style="padding-top: 10px">
                        <a data-toggle="modal" data-target="#add-blog-modal"
                           class="btn btn-info btn-sm">新建相册</a>
                        <table class="table table-hover" id="blog-table">
                            <thead>
                            <tr>
                                <th>id</th>
                                <th>标题</th>
                                <th>图片</th>
                                <th>编号</th>
                                <th>创建时间</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${requestScope.list}" var="index"
                                       varStatus="i">
                                <tr>
                                    <td>${i.index+1}</td>
                                    <td><a href="#" name="${i.index+1}"
                                           onclick="editInfo(this)">${index.title}</a></td>

                                    <c:if test="${index.url !=null}">
                                        <td><a
                                                href="<%=request.getContextPath()%>/${index.url}"
                                                class="thumbnail" data-lightbox="example-set"
                                                data-title="<div style='padding-top:5px;font-size: 16px'></div>">
                                            <img src="<%=request.getContextPath()%>/${index.urlThumb}"
                                                 height="30px" style="height: 30px">
                                        </a></td>
                                    </c:if>
                                    <c:if test="${index.url ==null}">
                                        <td><a
                                                href="<%=request.getContextPath()%>/images/noimg.jpeg"
                                                class="thumbnail" data-lightbox="example-set"
                                                data-title="<div style='padding-top:5px;font-size: 16px'></div>">
                                            <img src="<%=request.getContextPath()%>/images/noimg.jpeg"
                                                 height="30px" style="height: 30px">
                                        </a></td>
                                    </c:if>
                                    <td>${index.id}</td>
                                    <td><fmt:formatDate value="${index.createTime}"
                                                        pattern="yyyy-mm-dd hh:mm:ss"/></td>
                                    <td>
                                        <div class="btn-group btn-group-xs">
                                            <button type="button" class="btn btn-success"
                                                    name="${i.index+1}" onclick="editInfo(this)">修改
                                            </button>
                                            <a data-toggle="modal" data-target="#deleteBlogModel"
                                               type="button" class="btn btn-warning"
                                               onclick="clickDel(${index.id},${i.index},this)">删除</a>
                                        </div>
                                    </td>
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
                                                    <p>您确认要删除这篇文章吗?</p>
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
                                            <!-- /.modal-content -->
                                        </div>
                                        <!-- /.modal-dialog -->
                                    </div>
                                    <!-- /.modal -->
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                        <!-- 分页开始 -->
                        <nav style="text-align: center">

                            <ul class="pagination">
                                <c:forEach var="index" begin="1"
                                           end="${requestScope.pageCount}">
                                    <c:if test="${requestScope.currentPage==index}">
                                        <li><a style="color: #000000"
                                               href="<%=request.getContextPath()%>/album/album?pageNum=${index-1}">${index}</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${requestScope.currentPage!=index}">
                                        <li><a
                                                href="<%=request.getContextPath()%>/album/album?pageNum=${index-1}">${index}</a>
                                        </li>
                                    </c:if>
                                </c:forEach>
                            </ul>
                        </nav>
                        <!-- 分页结束 -->
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
                                    <div id="pic_div" style="padding-top: 5px;">
                                        <label style="font-size: 15px">图片: </label>
                                        <div id="show"></div>
                                        <!-- 存储图片地址，并显示图片 -->
                                        <input type="hidden" name="pic_url" id="pictureSrc">
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
                            <form action="/blog/update" method="post">
                                <div class="modal-body">
                                    <div>
                                        <label style="font-size: 15px">编号:</label> <input
                                            style="display: inline;font-size:15px;width:250px;" id="id"
                                            name="id" type="text" class="form-control" readonly/>
                                    </div>
                                    <div style="padding-top: 5px">
                                        <label style="font-size: 15px">标题:</label> <input
                                            style="display: inline;font-size:15px;width:250px;"
                                            id="title" name="title" type="text" class="form-control"/>
                                    </div>
                                    <div style="padding-top: 5px;">
                                        <label style="font-size: 15px">图片: </label>
                                        <!-- 存储图片地址，并显示图片 -->
                                        <img height="140px" id="blog_update_image"> <input
                                            id="update_blog_image" type="hidden" name="blog.pic_url">
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default"
                                            data-dismiss="modal">了解
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
                <script
                        src="<%=request.getContextPath()%>/css/MyBlog_files/lightbox.js"></script>
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

                    function delPage() {
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/album/del',
                            data: {id: delIdTemp},
                            dataType: 'text',
                            success: function (data) {
                                if (data == 'success') {
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
                        var id_db = document.getElementById("blog-table").rows[id].cells[3].innerText;
                        //向模态框中传值
                        $('#id').val(id_db);
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/album/selectById?id=' + id_db,
                            cache: false,
                            dataType: 'json',
                            success: function (data) {
                                $('#title').val(data.title);
                                //放入img的src
                                $('#blog_update_image').attr('src', '/WebSite/' + data.url);
                                $('#update_blog_image').val(data.url);
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
                    });

                    function addBlog() {
                        $.ajax({
                            type: 'post',
                            url: '<%=request.getContextPath()%>/album/add',
                            data: $("#addBlogForm").serialize(),
                            success: function (data) {
                                if (data == 'success') {
                                    $("#addBlogBtnCancle").click();
                                    alert("提交成功");
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
                                        alert("上传失败" + data);
                                    }
                                },
                                error: function (data, status, e) {
                                    alert("上传失败");
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
