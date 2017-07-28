<%--
  Created by IntelliJ IDEA.
  User: hdy
  Date: 2017/7/27
  Time: 下午9:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <meta charset="utf-8">
    <title>在线聊天室</title>
    <script src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css"
          integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"
            integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
            crossorigin="anonymous"></script>
    <script>
        var ws;


        function timerStart() {
            getInformation();
            var t = window.setInterval(getInformation(), 10000);
        }

        function getInformation() {
            $.ajax({
                type: 'get',
                async: true,
                url: '/chat/size',
                dataType: 'json',
                success: function (data) {
                    var obj = eval(data);
                    $("#human").text('人数:' + obj.message);
                },
                error: function (e, XMLHttpRequest, textStatus, errorThrown) {
                    console.info("获取information错误" + e);
                }
            });
        }

        function sendMessage() {
            console.error($('#mess').val());
            ws.send($('#mess').val());
            var text = $('#content').text();
            $('#content').text(text + "\r\n您 : " + $('#mess').val());
            var obj = document.getElementById("content");
            obj.scrollTop = obj.scrollHeight; // good
        }

        function WebSocketTest() {
            if ("WebSocket" in window) {
//                alert("您的浏览器支持 WebSocket!");
                // 打开一个 web socket
                ws = new WebSocket("ws://localhost:8080/websocket.ws");

                ws.onopen = function () {
                    // Web Socket 已连接上，使用 send() 方法发送数据
                    $('#content').text("服务器已连接!")
                    timerStart();
//                    ws.send("发送数据");
                };

                ws.onmessage = function (evt) {
                    var received_msg = evt.data;
                    console.info(received_msg);
                    var obj = eval("(" + received_msg + ")");
                    var code = obj.code
                    if (code == 301) {
                        //说明是获取到用户名
                        $('#username').text("您的用户名:" + obj.message);
                    }
                    if (code == 200) {
                        //说明是用户发送过来的数据
                        var text = $('#content').text();
                        $('#content').text(text + "\r\n" + obj.from + " : " + obj.message);
                        var obj = document.getElementById("content");
                        obj.scrollTop = obj.scrollHeight; // good
                    }
                    console.info('数据已经接受');
                };

                ws.onclose = function () {
                    $('#content').text("连接已关闭...")
                };
            }
            else {
                // 浏览器不支持 WebSocket
                alert("您的浏览器不支持 WebSocket!");
            }
        }
    </script>


</head>
<body onload="javascript:WebSocketTest()">

<div id="sse">
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">恶搞大王在线聊天室</a>
            </div>
        </div>
    </nav>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">信息</h3>
        </div>
        <div class="panel-body">
            <h3 id="human" class="panel-title">人数:</h3>
            <h3 id="username" class="panel-title">您的用户名:</h3>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">消息窗口</h3>
        </div>
        <div class="panel-body">
            <div class="form-group">
                <textarea class="form-control" id="content" name="content" rows="10"
                          onpropertychange="if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5"></textarea>
            </div>
        </div>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">发送窗口</h3>
        </div>
        <div class="panel-body">
            <textarea id="mess" name="content" rows="3" cols="75"
                      onpropertychange="if(this.scrollHeight>80) this.style.posHeight=this.scrollHeight+5"></textarea>
        </div>
        <a href="javascript:sendMessage()">
            <button type="button" class="btn btn-default navbar-btn">发送</button>
        </a>
    </div>
    <br/>
    <%--<a href="javascript:WebSocketTest()">运行 WebSocket</a>--%>
</div>

</body>
</html>