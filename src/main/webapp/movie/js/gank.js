/**
 * Created by hdy on 2017/8/4.
 */
var laypage = null
var layer = null;
layui.use(['layer', 'laypage', 'element', 'flow'], function () {
    layer = layui.layer;
    var element = layui.element();
    laypage = layui.laypage;
    laypage({
        cont: 'pageColl'
        , pages: 200
        , group: 3
        , curr: location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
        , hash: 'fenye' //自定义hash值
        , jump: function (obj, first) {
            if (!first) {
                console.error("search_open" + search_open)
                if (search_open) {
                    changeSearchPage(obj.curr);
                } else {
                    pageChange(obj.curr)
                }
            }
        }
    });
});
var pageType = null;
function pageChange(page) {
    getType(page, pageType);
}
var search_open = false;
function getType(page, title) {
    pageType = title;
    var web = "/movie/type?title=" + title + "&page=" + page;
    loadAnimation();
    $.ajax({
        url: web,
        type: 'GET', //GET
        async: true,    //或false,是否异步
        timeout: 5000,    //超时时间
        dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
        success: function (data) {
            search_open = false;
            $("#list_context").html("");
            $("#LAY_demo3").html("");
            $.each(data.details, function (index, content) {
                $("#list_context").append("<a href='javascript:void(0);' onclick='openSearchWebsite(\"" + content.url + "\")'><li class='list-group-item'>" + "<span class='badge'>" + data.searchName + "</span>" + "[" + (index + 1) + "]&nbsp;&nbsp;" + content.title + "(" + content.description + ")" + "</li>" + "</a>");
            });
            $('html, body').animate({
                scrollTop: $("#main_body").offset().top
            }, 500);
            window.location.hash = '#!fenye=1';
            laypage({
                cont: 'pageColl'
                , pages: data.pageCount
                , group: 3
                , curr: data.page //获取hash值为fenye的当前页
                , hash: 'fenye' //自定义hash值
                , jump: function (obj, first) {
                    if (!first) {
                        // layer.msg('第 '+ obj.curr +' 页');
                        if (search_open) {
                            changeSearchPage(obj.curr);
                        } else {
                            pageChange(obj.curr)
                        }
                    }
                }
            });
        },
        error: function (xhr, textStatus) {
            layer.alert("加载失败,请重试")
        },complete:function(){
            closeAnimation();
        }
    })
}

function getData(page, page_type, scrollTop) {
    pageType = page_type;
    var web = "/movie";
    loadAnimation();
    $.ajax({
        url: web,
        type: 'GET', //GET
        async: true,    //或false,是否异步
        timeout: 5000,    //超时时间
        dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
        success: function (data) {
            search_open = false;
            $("#list_context").html("");
            $("#LAY_demo3").html("");
            $.each(data, function (index, content) {
                $.each(content.value, function (index2, content2) {
                    $("#list_context").append("<a href='javascript:void(0);' onclick='openSearchWebsite(\"" + content2.url + "\")'>" + "<li class='list-group-item'>" + "<span class='badge'>" + content2.time + "</span>" + "[" + content.key.title + "]&nbsp;&nbsp;" + content2.title + "</li>" + "</a>");
                });
            });
            if (scrollTop == true) {
                $('html, body').animate({
                    scrollTop: $("#main_body").offset().top
                }, 500);
            } else {
                window.location.hash = '#!fenye=1';
                laypage({
                    cont: 'pageColl'
                    , pages: -1
                    , group: 3
                    , curr: location.hash.replace('#!fenye=', '') //获取hash值为fenye的当前页
                    , hash: 'fenye' //自定义hash值
                });
            }
        },
        error: function (xhr, textStatus) {
            layer.alert("加载失败,请重试")
        }, complete:function(){
            closeAnimation();
        }
    })
}

var index = null;
function loadAnimation() {
    index = layer.load(1, {
        shade: [0.1, '#fff'] //0.1透明度的白色背景
    });
}

function closeAnimation() {
    layer.close(index);
}


function loadInfoWebSite(src) {
    layui.use('layer', function () {
        var layer = layui.layer;
        var open = layer.open({
            type: 2,
            title: 'frame',
            shadeClose: true,
            shade: true,
            maxmin: true, //开启最大化最小化按钮
            area: [document.body.clientWidth - 40 + "px", '500px'],
            content: src,
        });
    });
}

//存放查询数据
var searchType = null;
//查询内容
var searchValue = null;
//存放查询的数组
var search_list = null;
//判断是否是搜索翻页
var search_open = false;
function search(page, scrollTop) {
    if (searchType == null) {
        searchType = 'all';
    }
    searchValue = $("#search_input").val();
    var web = '/movie/search?name=' + searchValue + "&page=" + page;
    loadAnimation();
    $.ajax({
        url: web,
        type: 'GET', //GET
        async: true,    //或false,是否异步
        timeout: 5000,    //超时时间
        dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
        success: function (data) {
            search_open = true;
            $("#list_context").html("");
            $("#LAY_demo3").html("");
            search_list = data.details;
            $.each(data.details, function (index, content) {
                $("#list_context").append("<a href='javascript:void(0);' onclick='openSearchWebsite(\"" + content.url + "\")'><li class='list-group-item'>" + "<span class='badge'>" + data.searchName + "</span>" + "[" + (index + 1) + "]&nbsp;&nbsp;" + content.title + "(" + content.description + ")" + "</li>" + "</a>");
            });
            if (scrollTop) {
                $('html, body').animate({
                    scrollTop: $("#list_context").offset().top
                }, 500);
            } else {
                window.location.hash = '#!fenye=1';
                laypage({
                    cont: 'pageColl'
                    , pages: data.pageCount
                    , group: 3
                    , curr: data.page //获取hash值为fenye的当前页
                    , hash: 'fenye' //自定义hash值
                    , jump: function (obj, first) {
                        if (!first) {
                            // layer.msg('第 '+ obj.curr +' 页');
                            if (search_open) {
                                changeSearchPage(obj.curr);
                            } else {
                                pageChange(obj.curr)
                            }
                        }
                    }
                });
            }
        },
        error: function (xhr, textStatus) {
            layer.alert("加载失败,请重试")
        },complete:function(){
            closeAnimation();
        }
    })
}


function setSearchType(type) {
    searchText = type;
}

function openSearchWebsite(src) {
    var web = '/movie/deatil?url=' + src;
    loadAnimation();
    $.ajax({
        url: web,
        type: 'GET', //GET
        async: true,    //或false,是否异步
        timeout: 5000,    //超时时间
        dataType: 'json',    //返回的数据格式：json/xml/html/script/jsonp/text
        success: function (data) {
            layer.open({
                type: 1,
                skin: 'layui-layer-rim', //加上边框
                area: [document.body.clientWidth - 40 + "px", '600px'], //宽高
                content: "<div class='container'>" + data.webText + "</div>"
            });
            addImageClass();
        },
        error: function (xhr, textStatus) {
            layer.alert("加载失败,请重试")
        },
        complete:function(){
            closeAnimation();
        }
    })
}

function changeSearchPage(page) {
    search(page, true)
}

function addImageClass() {
    $(".container img").addClass("img-responsive");
}