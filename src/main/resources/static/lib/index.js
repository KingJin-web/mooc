const king = new Vue({
    el: '#userpage',
    data: {
        user: {},
        msg: "",
        password: "",
        phoneMsg: "已绑定手机：135*****515",
        emailMsg: "已绑定邮箱：100****163.com",
        loginHtml: ""
    },
    created: function () {
        this.getUser();
    },
    mounted: function () {

    },
    methods: {
        //获取用户信息
        getUser: function () {
            axios.get("/api/user/getUser.do").then(res => {
                console.log(res)
                if (res.data.code === 1) {
                    this.user = res.data.data;
                    if (this.user != null || this.user.name != null){

                    }else {
                        this.loginHtml = '<li class="layui-nav-item"><a href="/login">登录</a></li>\n' +
                            '<li class="layui-nav-item"><a href="/register">注册</a></li>'
                    }
                } else {
                   // alertMy(res.data.msg)
                }
            }).catch(function (error) {
                console.log(error);
            });
        },
    }
});