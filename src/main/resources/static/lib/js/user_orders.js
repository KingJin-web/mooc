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
            {title: '状态', width: '20%', toolbar: '#typeImh'},
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
        } else if (obj.event === 'refund') {
            let param = new URLSearchParams()
            param.append('id', data.oid)
            layer.confirm('确定要退款吗？', {icon: 3, title: '提示'}, function (index) {
                axios.post('/api/alipay/refund.do', param).then(res => {
                    if (res.data.code === 1) {
                        layer.msg(res.data.msg, {icon: 1, time: 1000})
                        //刷新表格
                        table.reload('demo')
                    } else {
                        layer.msg(res.data.msg, {icon: 2, time: 1000})
                    }
                });
            });
            //申请退款
        } else if (obj.event === 'topay') {
            //去支付
            gotoPage("即将前往支付页面", '/api/alipay/byCourse.do' + '?cid=' + data.cid);
        } else if (obj.event === 'cancel') {
            //取消订单
            let param = new URLSearchParams()
            param.append('oid', data.oid)
            layer.confirm('确定要取消订单吗？', {icon: 3, title: '提示'}, function (index) {
                axios.post('/api/orders/cancel.do', param).then(res => {
                    if (res.data.code === 1) {
                        layer.msg(res.data.msg, {icon: 1, time: 1000})
                        //刷新表格
                        table.reload('demo')
                    } else {
                        layer.msg(res.data.msg, {icon: 2, time: 1000})
                    }
                });
            });
        } else if (obj.event === 'delete'){
            //删除订单
            let param = new URLSearchParams()
            param.append('oid', data.oid)
            layer.confirm('确定要删除订单吗？', {icon: 3, title: '提示'}, function (index) {
                axios.post('/api/orders/delete.do', param).then(res => {
                    if (res.data.code === 1) {
                        layer.msg(res.data.msg, {icon: 1, time: 1000})
                        //刷新表格
                        table.reload('demo')
                    } else {
                        layer.msg(res.data.msg, {icon: 2, time: 1000})
                    }
                });
            });
        }
    });
});


