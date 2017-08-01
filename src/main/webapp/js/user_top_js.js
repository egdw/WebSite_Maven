/**
 * Created by hdy on 2017/7/31.
 */
//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function () {
    var element = layui.element();
});
layui.use('layedit', function () {
    var layedit = layui.layedit;
    layedit.build('demo'); //建立编辑器
});
layui.use(['layer', 'form'], function () {
    var layer = layui.layer
        , form = layui.form();
});
