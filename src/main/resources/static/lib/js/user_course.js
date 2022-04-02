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

    table.render({
        elem: '#demo'
        , height: 450
        , url: '/api/course/getBuyCourse.do' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: '编号', width: '10%', sort: true, fixed: 'left'}
            , {field: 'name', title: '课程名', width: '45%'}
            , {field: 'createTime', title: '购买时间', width: '45%', sort: true},
            {fixed: 'right', title: '操作', width: '20%', align: 'center', toolbar: '#barDemo'}
        ]]
        , skin: 'line' //行边框风格
        , even: true //开启隔行背景
        , size: 'lg' //小尺寸的表格
    });


});


