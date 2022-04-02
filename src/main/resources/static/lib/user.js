const king = new Vue({
    el: '#userpage',
    data: {
        user: {},
        msg: "",
        password: "",
        phoneMsg: "已绑定手机：135*****515",
        emailMsg: "已绑定邮箱：100****163.com"
    },
    created: function () {
        this.getUser();
    },
    mounted: function () {

    },
    methods: {
        //获取用户信息
        tirggerFile: function (event) {
            var file = event.target.files;
            var reader = new FileReader();//读取文件
            reader.readAsDataURL(file[0]);
            reader.onload = function () {
                document.getElementById("img-avatar").src = reader.result;
            }
        },
        getUser: function () {
            axios.get("/api/user/getUser.do").then(res => {
                console.log(res)
                if (res.data.code === 1) {
                    this.user = res.data.data;
                    this.init();
                } else {
                    alertMy(res.data.msg)
                }
            }).catch(function (error) {
                console.log(error);
            });
        },
        //修改用户信息
        changeUser: function () {
            let url = "/api/user/updateUser.do";
            var file = document.getElementById("fileinput").files[0];
            var formData = new FormData();
            formData.append("uploadFile", file)
            formData.append("name", this.user.name)
            formData.append("msg", this.user.msg)
            axios.post(
                url,
                formData,
                {headers: {'Content-Type': 'multipart/form-data'}}
            ).then(function (res) {
                alertClear(res.data.msg)
            })
        },
        //渲染account.html
        init: function () {
            console.log(this.user.phone)
            console.log(this.user.phone != null)
            console.log(this.user.phone)
            console.log(this.user.phone != null)
            if (this.user.phone != null) {
                this.phoneMsg = '已绑定手机：' + this.user.phone
            } else {
                this.phoneMsg = '还没有绑定手机 建议尽快绑定！'
            }

            if (this.user.email != null) {
                this.emailMsg = '已绑定邮箱：' + this.user.email
            } else {
                this.emailMsg = '还没有绑定邮箱 建议尽快绑定！'
            }
        },
        usernameIsOk: function () {
            let url = "/api/user/nameIsUse.do";
            let param = new URLSearchParams()
            param.append('username', this.user.name)
            axios({
                method: 'post',
                url: url,
                data: param
            }).then(function (res) {
                if (res.data.code === 1) {
                    layer.alert(res.data.msg, {
                        icon: 1,
                        skin: 'layer-ext-moon'
                    })
                } else if (res.data.code === 2) {
                    layer.alert(res.data.msg, {
                        icon: 3,
                        skin: 'layer-ext-moon'
                    })
                }
                console.log(res)
                console.log(this.msg)

            }).catch(function (error) {
                console.log(error);
            });
        }

    }
});

// Language: ecmascript 6
// Path: src/main/resources/static/lib/user.js
