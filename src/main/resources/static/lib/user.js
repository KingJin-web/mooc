const king = new Vue({
        el: '#userpage',
        data: {
            user: {},
            msg: "",
            password: "",
        },
        mounted: function () {
            this.getUser();
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
                        console.log(this.user)
                    } else {
                        alertMy(res.data.msg)
                    }
                }).catch(function (error) {
                    console.log(error);
                });
            },
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
            //修改用户信息
            aaa: function () {
                let url = "/api/user/login.do";
                let param = new URLSearchParams()
                param.append('username', this.name)
                param.append('password', this.password)
                param.append('login_code', this.validateCode);
                console.log(this.validateCode)
                axios({
                    method: 'post',
                    url: url,
                    data: param
                }).then(function (res) {
                    console.log(res)
                    if (res.data.code === 1) {
                        alertLayer(res.data.msg, "index.html")
                    } else {
                        alertMy(res.data.msg)
                    }

                }).catch(function (error) {
                    console.log(error);
                });


            }
            ,
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
    })
;