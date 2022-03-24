//加载模块
let layer;
layui.use(function () { //亦可加载特定模块：layui.use(['layer', 'laydate', function(){
    //得到各种内置组件
    layer = layui.layer //弹层
        , laypage = layui.laypage //分页
        , laydate = layui.laydate //日期
        , table = layui.table //表格
        , carousel = layui.carousel //轮播
        , upload = layui.upload //上传
        , element = layui.element //元素操作
        , slider = layui.slider //滑块
        , dropdown = layui.dropdown //下拉菜单


});