var a = [];
a[0] = '  <li class="layui-nav-item">\n' +
    '            <a href="javascript:" class="nav-search" ><i class="layui-icon layui-icon-search"></i> 搜索</a>\n' +
    '        </li>';
a[1] = '        <li class="layui-nav-item">\n' +
    '            <a href="/vip" class="nav-vip"><i class="layui-icon layui-icon-diamond"></i> 会员</a>\n' +
    '        </li>';
a[2] = '      <li class="layui-nav-item">\n' +
    '                <a href="/uc/notifications" target="notify"><i class="layui-icon layui-icon-notice"></i> 消息<span id="notify-dot"></span></a>\n' +
    '            </li>';
a[3] = '<li class="layui-nav-item">\n' +
    '                <a href="javascript:">云课堂<i class="layui-icon layui-icon-down layui-nav-more layui-nav-mored"></i></a>\n' +
    '                <dl class="layui-nav-child layui-anim layui-anim-upbit layui-show">\n' +
    '                    <dd><a href="/user/">我的主页</a></dd>       \n' +
    '                    <dd><a href="/logout">退出登录</a></dd>\n' +
    '                </dl>\n' +
    '            </li>';

let loginHtml;

function init() {
    $.ajax({
        type: "GET", //请求方式
        // fasle表示同步请求，true表示异步请求
        contentType: "application/json;charset=UTF-8", //请求的媒体类型
        url: "/api/user/getUser.do",//请求地址
        data: JSON.stringify(loginHtml), //数据，json字符串
        success: function (result) { //请求成功
            console.log(result);
            if (result.data != null) {
                //重新加载li
                $("#user_ul li").remove();
                for (let i = 0; i<  a.length ; ++i){
                    console.log(a[i])
                    $("#user_ul").append(a[i]);
                }
            }

        },
        error: function (e) {  //请求失败，包含具体的错误信息
            console.log(e.status);
            console.log(e.responseText);
            return false;
        }
    });
}