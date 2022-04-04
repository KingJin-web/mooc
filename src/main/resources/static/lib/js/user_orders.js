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
        , url: '/api/orders/getOrders.do' //数据接口
        , page: true //开启分页
        , cols: [[ //表头
            {field: 'id', title: '编号', width: '10%', sort: true, fixed: 'left'},
            {field: 'cname', title: '课程名', width: '20%'},
            {field: 'createTime', title: '购买时间', width: '20%', sort: true},
            {field: 'state', title: '状态', width: '20%'},
            {field: 'price', title: '价格', width: '10%', sort: true},
            {fixed: 'right', title: '操作', width: '20%', align: 'center', toolbar: '#barDemo'}
        ]]
        , skin: 'nob ' //行边框风格
        , even: true //开启隔行背景
        , size: 'lg' //小尺寸的表格
    });
    //监听行工具事件
    table.on('tool(test)', function (obj) {
        var data = obj.data;
        console.log(obj.event)
        console.log(data)
        var path = data.path
        //console.log(obj)
        if (obj.event === 'toCourse') {
            window.location.href = "/course/detail#id=" + data.cid;
        } else if (obj.event === 'detail') {
            //申请退款
        } else if (obj.event === 'topay') {
            //去支付
        } else if (obj.event === 'By') {
            //去支付
        }
    });
});


