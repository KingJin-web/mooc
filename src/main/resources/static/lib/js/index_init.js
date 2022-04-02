

function getTpl(id, name, coverImage, price, vipprice) {
    var html = '<div class="layui-col-md3">\n' +
        '<div class="course-card">\n' +
        '<div class="cover">\n' +
        '<a href="/course/detail#id=' + id + '" target="_blank">\n' +
        '  <img src="' + coverImage + '"\n' +
        '     alt="' + name + '"\n' +
        '     title="' + name + '">' +
        '         </a>\n' +
        '     </div>\n' +
        '     <div class="info">\n' +
        '         <div class="title layui-elip">\n' +
        '<a href="/course/1340" title="Vue核心技术Vue+Vue-Router+Vuex+SSR实战精讲"\n' +
        '   target="_blank">' + name + '</a>\n' +
        '         </div>\n' +
        '         <div class="meta">\n' +
        '<span>原价￥' + price + '</span>\n' +
        '<span class="price">会员￥' + vipprice + '</span>\n' +
        '<span class="user">863人购买</span>\n' +
        '         </div>\n' +
        '     </div>\n' +
        ' </div>\n' +
        ' </div>';

    return html
}

var v = new Vue({
    el: '#pagemain',
    data: {
        //前端课程

    },

    created: function () {
        this.getUser();
        this.getRecommend();
        this.getNewCourse();
    },
    mounted: function () {
    },
    methods: {
        getUser: function () {
            axios.get('/api/user/getUser.do').then(function (response) {
                this.user = response.data.data;
                console.log(this.user)
                if (this.user === undefined ) {
                    $("#loginAfter").remove();
                } else {
                       $("#login").remove();
                    $("#register").remove();
                }

            }).catch(function (error) {
                console.log(error);
            });
        },
        getRecommend: function () {
            axios.get('/api/course/recommend.do').then(function (response) {
                console.log(response.data.data.frontend);
                $("#frontend div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.frontend.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.frontend[i].name, response.data.data.frontend[i].coverImage, response.data.data.frontend[i].price, response.data.data.frontend[i].vipPrice);
                }
                $("#frontend").append(html);

                $("#backend div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.backend.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.backend[i].name, response.data.data.backend[i].coverImage, response.data.data.backend[i].price, response.data.data.backend[i].vipPrice);
                }
                $("#backend").append(html);

                $("#mobile div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.mobile.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.mobile[i].name, response.data.data.mobile[i].coverImage, response.data.data.mobile[i].price, response.data.data.mobile[i].vipPrice);
                }
                $("#mobile").append(html);

                $("#database div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.database.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.database[i].name, response.data.data.database[i].coverImage, response.data.data.database[i].price, response.data.data.database[i].vipPrice);
                }
                $("#database").append(html);

                $("#computer div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.computer.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.computer[i].name, response.data.data.computer[i].coverImage, response.data.data.computer[i].price, response.data.data.computer[i].vipPrice);
                }
                $("#computer").append(html);
                //开始渲染
            }).catch(function (error) {
                console.log(error);
            });
        },
        //获得新课程
        getNewCourse: function (){
            axios.get('/api/course/getNewCourse.do').then(function (response) {
                console.log(response.data.data.frontend);
                $("#newfrontend div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.frontend.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.frontend[i].name, response.data.data.frontend[i].coverImage, response.data.data.frontend[i].price, response.data.data.frontend[i].vipPrice);
                }
                $("#newfrontend").append(html);

                $("#newbackend div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.backend.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.backend[i].name, response.data.data.backend[i].coverImage, response.data.data.backend[i].price, response.data.data.backend[i].vipPrice);
                }
                $("#newbackend").append(html);

                $("#newmobile div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.mobile.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.mobile[i].name, response.data.data.mobile[i].coverImage, response.data.data.mobile[i].price, response.data.data.mobile[i].vipPrice);
                }
                $("#newmobile").append(html);

                $("#newdatabase div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.database.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.database[i].name, response.data.data.database[i].coverImage, response.data.data.database[i].price, response.data.data.database[i].vipPrice);
                }
                $("#newdatabase").append(html);

                $("#newcomputer div").remove();
                var html = "";
                for (var i = 0; i < response.data.data.computer.length; i++) {
                    html += getTpl(response.data.data.frontend[i].id, response.data.data.computer[i].name, response.data.data.computer[i].coverImage, response.data.data.computer[i].price, response.data.data.computer[i].vipPrice);
                }
                $("#newcomputer").append(html);

                //开始渲染
            }).catch(function (error) {
                console.log(error);
            });
            }
        },

});