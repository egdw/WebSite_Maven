<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户管理</title>
</head>
<body>
<jsp:include page="/admin_top.jsp"></jsp:include>
<script src="/css/MyBlog_files/lightbox.js"></script>
<link rel="stylesheet" href="/css/MyBlog_files/lightbox.css">
<script src="/js/jquery.validate.min.js"></script>
<script src="/js/additional-methods.js"></script>
<script src="/js/person-admin.js"></script>
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

                <!-- Nav tabs -->
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
                                <form method="get" action="" name="filteuser">
                                    <div class="row">
                                        <div class="col-md-6"><select class="form-control">
                                            <option value="1">全部用户</option>
                                            <option value="2">普通用户</option>
                                            <option value="3">管理员</option>
                                            <option value="3">待审核</option>
                                            <option value="3">禁止登录</option>
                                            <option value="3">禁止发言</option>
                                            <option value="3">审核通过</option>
                                        </select></div>

                                        <div class="col-md-6">
                                            <button class="btn btn-default" type="submit">筛选
                                            </button>
                                        </div>
                                    </div>
                                </form>
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
                                <tbody>
                                <tr>
                                    <td>Mark</td>
                                    <td><span class="label label-success">普通用户</span></td>
                                    <td><span class="label label-success">待审核</span></td>
                                    <td>
                                        <select class="btn btn-success btn-xs">
                                            <option value="1">设置角色</option>
                                            <option value="2">普通用户</option>
                                            <option value="3">管理员</option>
                                        </select>
                                        <select class="btn btn-primary btn-xs">
                                            <option value="1">设置状态</option>
                                            <option value="2">待审核</option>
                                            <option value="3">禁止登录</option>
                                            <option value="3">禁止发表</option>
                                            <option value="4">审核通过</option>
                                        </select>
                                        <select class="btn btn-danger btn-xs">
                                            <option value="1">谨慎操作</option>
                                            <option value="2">删除</option>
                                            <option value="3">重置密码</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Jacob</td>
                                    <td><span class="label label-default">待审核</span></td>
                                    <td><span class="label label-default">待审核</span></td>
                                    <td>
                                        <select class="btn btn-success btn-xs">
                                            <option value="1">设置角色</option>
                                            <option value="2">普通用户</option>
                                            <option value="3">管理员</option>
                                        </select>
                                        <select class="btn btn-primary btn-xs">
                                            <option value="1">设置状态</option>
                                            <option value="2">待审核</option>
                                            <option value="3">禁止登录</option>
                                            <option value="3">禁止发表</option>
                                            <option value="4">审核通过</option>
                                        </select>
                                        <select class="btn btn-danger btn-xs">
                                            <option value="1">谨慎操作</option>
                                            <option value="2">删除</option>
                                            <option value="3">重置密码</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td>Larry</td>
                                    <td><span class="label label-danger">管理员</span></td>
                                    <td><span class="label label-danger">管理员</span></td>
                                    <td>
                                        <select class="btn btn-success btn-xs">
                                            <option value="1">设置角色</option>
                                            <option value="2">普通用户</option>
                                            <option value="3">管理员</option>
                                        </select>
                                        <select class="btn btn-primary btn-xs">
                                            <option value="1">设置状态</option>
                                            <option value="2">待审核</option>
                                            <option value="3">禁止登录</option>
                                            <option value="3">禁止发表</option>
                                            <option value="4">审核通过</option>
                                        </select>
                                        <select class="btn btn-danger btn-xs">
                                            <option value="1">谨慎操作</option>
                                            <option value="2">删除</option>
                                            <option value="3">重置密码</option>
                                        </select>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <center>
                                <div class="page-nav">
                                    <nav>
                                        <ul class="pagination">
                                            <li><a href="#">«</a></li>
                                            <li class="active"><a href="#">1</a></li>
                                            <li><a href="#">2</a></li>
                                            <li><a href="#">3</a></li>
                                            <li><a href="#">4</a></li>
                                            <li><a href="#">5</a></li>
                                            <li class="disabled"><a href="#">»</a></li>
                                        </ul>
                                    </nav>
                                </div>
                            </center>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="index">
                        <h3 class="page-header">注册设置</h3>
                        <table class="table table-striped text-center">
                            <thead>
                            <tr>
                                <th>#</th>
                                <th>图片1</th>
                                <th>预览图</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td><img src="img/banner_1.jpg" alt="" height="40"></td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-xs">删除</button>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td><img src="img/banner_1.jpg" alt="" height="40"></td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-xs">删除</button>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Larry</td>
                                <td><img src="img/banner_1.jpg" alt="" height="40"></td>
                                <td>
                                    <button type="button" class="btn btn-danger btn-xs">删除</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="upload-banner">
                            <h3 class="page-header">上传图片</h3>
                            <form role="form" method="post">
                                <div class="form-group">
                                    <input type="file" accept="image/png,image/gif,image/jpeg" name="upload"
                                           id="fileupload">
                                    <p class="help-block">请选择图片格式文件上传,支持文件类型（jpg,png,gif）</p>
                                </div>
                                <button type="submit" class="btn btn-primary">上传图片</button>
                            </form>
                        </div>
                    </div>
                    <div role="tabpanel" class="tab-pane" id="student">
                        <h3 class="page-header">用户搜索</h3>
                        <form class="form-inline" role="form" method="post" name="searchStudent" id="searchStudent">
                            <div class="form-group">
                                <div class="input-group">
                                    <select class="form-control" name="searchType">
                                        <option value="1">关键词搜索</option>
                                        <option value="2">按姓名搜索</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <input class="form-control" type="text" name="searchValue">
                            </div>
                            <button type="submit" class="btn btn-default" id="submitSearch">搜索</button>
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
                            <tbody id="studentList">
                            <tr>
                                <td>1</td>
                                <td>Mark</td>
                                <td>seadad</td>
                                <td>
                                    <select class="btn btn-success btn-xs">
                                        <option value="1">设置角色</option>
                                        <option value="2">普通用户</option>
                                        <option value="3">管理员</option>
                                    </select>
                                    <select class="btn btn-primary btn-xs">
                                        <option value="1">设置状态</option>
                                        <option value="2">待审核</option>
                                        <option value="3">禁止登录</option>
                                        <option value="3">禁止发表</option>
                                        <option value="4">审核通过</option>
                                    </select>
                                    <select class="btn btn-danger btn-xs">
                                        <option value="1">谨慎操作</option>
                                        <option value="2">删除</option>
                                        <option value="3">设为管理</option>
                                        <option value="3">重置密码</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>Jacob</td>
                                <td>seadad</td>
                                <td>
                                    <select class="btn btn-success btn-xs">
                                        <option value="1">设置角色</option>
                                        <option value="2">普通用户</option>
                                        <option value="3">管理员</option>
                                    </select>
                                    <select class="btn btn-primary btn-xs">
                                        <option value="1">设置状态</option>
                                        <option value="2">待审核</option>
                                        <option value="3">禁止登录</option>
                                        <option value="3">禁止发表</option>
                                        <option value="4">审核通过</option>
                                    </select>
                                    <select class="btn btn-danger btn-xs">
                                        <option value="1">谨慎操作</option>
                                        <option value="2">删除</option>
                                        <option value="3">设为管理</option>
                                        <option value="3">重置密码</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>Larry</td>
                                <td>seadad</td>
                                <td>
                                    <select class="btn btn-success btn-xs">
                                        <option value="1">设置角色</option>
                                        <option value="2">普通用户</option>
                                        <option value="3">管理员</option>
                                    </select>
                                    <select class="btn btn-primary btn-xs">
                                        <option value="1">设置状态</option>
                                        <option value="2">待审核</option>
                                        <option value="3">禁止登录</option>
                                        <option value="3">禁止发表</option>
                                        <option value="4">审核通过</option>
                                    </select>
                                    <select class="btn btn-danger btn-xs">
                                        <option value="1">谨慎操作</option>
                                        <option value="2">删除</option>
                                        <option value="3">设为管理</option>
                                        <option value="3">重置密码</option>
                                    </select>
                                </td>
                            </tr>
                            </tbody>
                        </table>

                        <div class="upload-banner">
                            <h3 class="page-header">添加用户</h3>
                            <form class="form" role="form" method="post" id="addStudent" name="addStudent">
                                <table class="table text-center">
                                    <thead>
                                    <tr>
                                        <th>用户名</th>
                                        <th>姓名</th>
                                        <th>操作</th>
                                    </tr>
                                    </thead>

                                    <tbody id="list">
                                    <tr>
                                        <td><input class="form-control input-sm" type="text" name="ids" id="id-1"
                                                   placeholder="输入学号">
                                        </td>
                                        <td><input class="form-control input-sm" type="text" name="names" id="name-1"
                                                   placeholder="输入姓名">
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-danger btn-xs">删除</button>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                                <div class="filter">
                                    <button type="button" class="btn btn-primary " id="addNewItem">新增</button>
                                    <button type="submit" class="btn btn-success " id="submitItems">提交</button>
                                    <button type="button" class="btn btn-info" data-toggle="modal"
                                            data-target="#uploadXls">批量导入
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>

                </div>
            </div>
            <!--封禁用户-->
            <div class="modal fade" id="confirmBand">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"><span
                                    aria-hidden="true">&times;</span><span
                                    class="sr-only">Close</span></button>
                            <h4 class="modal-title">封禁用户</h4>
                        </div>
                        <div class="modal-body">
                            <p>当前封禁用户为: ,你确认要执行此操作吗?</p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="button" class="btn btn-primary">确认封禁</button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->
        </div>
        <!--删除用户-->
        <div class="modal fade" id="confirmDel">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">删除用户</h4>
                    </div>
                    <div class="modal-body">
                        <p>当前删除用户为: ,你确认要执行此操作吗?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                        <button type="button" class="btn btn-primary">确认删除</button>
                    </div>
                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <!-- 批量导入 -->
        <div class="modal fade" id="uploadXls" tabindex="-1" role="dialog" aria-labelledby="xls" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title" id="xls">批量导入</h4>
                    </div>
                    <form method="post">
                        <div class="modal-body">
                            <h4>导入注意事项：</h4>
                            <p class="text-danger">Excel表格为2列，分别为学号、姓名。</p>
                            <div class="form-group">
                                <h4>选择文件</h4>
                                <input type="file" accept="" name="upload" id="xlsUploader">
                                <p class="help-block">请选择Excel格式文件上传,支持文件类型（xls）</p>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            <button type="submit" class="btn btn-primary">确认提交</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</div>
</div>
</div>
</body>
</html>
