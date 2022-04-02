//加载模块
let layer;
let element;
let laydate;
let table;
layui.use(function () { //亦可加载特定模块：layui.use(['layer', 'laydate', function(){
    //得到各种内置组件
    element = layui.element //元素操作
    layer = layui.layer //弹层
    laytpl = layui.laytpl //模板引擎
    table = layui.table //表格
        , laypage = layui.laypage //分页
        , laydate = layui.laydate //日期
        , carousel = layui.carousel //轮播
        , upload = layui.upload //上传

        , slider = layui.slider //滑块
        , dropdown = layui.dropdown //下拉菜单
});