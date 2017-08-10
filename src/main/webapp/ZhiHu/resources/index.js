/**
 * Created by hdy on 17-8-10.
 */
var hot = null;
function getDetail(pageId) {
    var url = "/pageController/getZhihuPageById?id=" + 9562129;
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
        },
        error: function (xhr, textStatus) {
            console.log('错误')
        },
    });
}
