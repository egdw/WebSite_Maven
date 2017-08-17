/**
 * Created by hdy on 17-8-10.
 */

//获取url中的参数
function getUrlParam(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)"); //构造一个含有目标参数的正则表达式对象
    var r = window.location.search.substr(1).match(reg); //匹配目标参数
    if (r != null) return unescape(r[2]);
    return null; //返回参数值
}
var hot = null;
function getDetail() {
    var pageId = getUrlParam("id");
    var url = "/pageController/getZhihuPageById?id=" + pageId;
    console.log(url);
    //获取当前的这篇信息
    $.ajax({
        url: url,
        type: "GET",
        async: true,
        headers: {"Host": "p3.zhimg.com", "Content-Type": "text/plain;charset=UTF-8"},
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            $("#mainContent").html("");
            $("#mainContent").append(data.body);
            $(".img-source").html("")
            $(".img-source").append(data.image_source);
            $(".headline-title").html("")
            $(".headline-title").append(data.title);
            $("#backgroud_img").attr("src", data.image);
            $(document).attr("title", data.title);
            getComment(pageId);
        },
        error: function (xhr, textStatus) {
            console.log('错误')
        },
    });
    //获取热门的知乎信息
    $.ajax({
        url: "/pageController/getZhihuHotNews",
        type: "GET",
        async: true,
        headers: {"Host": "p3.zhimg.com", "Content-Type": "text/plain;charset=UTF-8"},
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            // console.log(data)
            hot = data.recent;
            $.each(data.recent, function (index, content) {
                $(".bottom-recommend").append(" <a class='recommend-link' href='" + "javascript:void(0)" + "' onclick='hotClickFunction(" + index + ")' data-story='" + content.news_id + "'>" + content.title + "<span style='background-image:url(" + content.thumbnail + ")'class='link-image'></span> </a> ");
            });
        },
        error: function (xhr, textStatus) {
            console.log('错误')
        },
    });
}

//推荐视频点击之后的操作
function hotClickFunction(index) {
    var obj = hot[index];
    var url = "/pageController/getZhihuPageById?id=" + obj.news_id;
    $.ajax({
        url: url,
        type: "GET",
        async: true,
        headers: {"Host": "p3.zhimg.com", "Content-Type": "text/plain;charset=UTF-8"},
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            $("#mainContent").html("");
            $("#mainContent").append(data.body);
            $(".img-source").html("")
            $(".img-source").append(data.image_source);
            $(".headline-title").html("")
            $(".headline-title").append(data.title);
            $("#backgroud_img").attr("src", data.image);
            $(document).attr("title", data.title);
            $('html, body').animate({
                scrollTop: $("#main_body").offset().top
            }, 500);
            getComment(obj.news_id);
        },
        error: function (xhr, textStatus) {
            console.log('错误')
        },
    });
}

//获取评论
function getComment(page) {
    var url = "/pageController/getZhihuShortComments?id=" + page;
    $.ajax({
        url: url,
        type: "GET",
        async: true,
        headers: {"Host": "p3.zhimg.com", "Content-Type": "text/plain;charset=UTF-8"},
        timeout: 5000,
        dataType: 'json',
        success: function (data) {
            $(".PostCommentList").html("");
            $.each(data.comments, function (index, content) {
                $(".PostCommentList").append("<div class='CommentItem'> <a class='UserAvatar CommentItem-author' href='javascript:void(0)'><img class='Avatar-hemingway Avatar--xs' src='" + content.avatar + "'/></a> <div class='CommentItem-headWrapper'> <div class='CommentItem-head'> <span class='CommentItem-context'><a href='javascript:void(0)'>" + content.author + "</a></span> </div> </div> <div class='CommentItem-content'>" + content.content + " </div> <div class='CommentItem-foot'> <span class='CommentItem-like' title=''>" + content.likes + " 赞</span></div> </div>");
            });
        },
        error: function (xhr, textStatus) {
            console.log('错误')
        },
    });
}