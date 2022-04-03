function getTpl(id, name, coverImage, msg, text, price, vipPrice) {
    var html =
        '<div class="search-course-card">\n' +
        '   <div class="cover">\n' +
        '       <a href="/course/detail#id=' + id + '" target="_blank">\n' +
        '       <img src="' + coverImage + '"\n' +
        '           alt="' + name + '"\n' +
        '               title="' + name + '">' +
        '        </a>\n' +
        '    </div>\n' +
        '    <div class="info">\n' +
        '        <div class="title layui-elip">\n' +
        '       <a href="/course/detail#id=' + id + '" target="_blank">\n' + name + '</a>\n' +
        '        </div>\n' +
        '        <div class="summary">' + msg +
        '        </div>\n' +
        '        <div class="meta">\n' +
        '            <span>分类：' + text + '</span>\n' +
        '            <span>原价：￥ ' + price + '</span>\n' +
        '           <span class="price">会员：￥' + vipPrice + '</span>\n' +
        '            <span>学员：466</span>\n' +
        '        </div>\n' +
        '    </div>\n' +
        '</div>'


    return html
}
var laypage
layui.use('laypage', function () {
    laypage = layui.laypage;


});
var v = new Vue({
    el: '#pagemain',
    data: {
        user: {},
        courseList: [], //数据列表
        total: 0, //总条数
        currentPage: 1, //当前页
        pages: 0, //总页数
        hasNextPage: false, //是否有下一页
        hasPreviousPage: false, //是否有上一页
    },

    created: function () {
        this.getUser();
        this.getSearch();

        $("#query").append($_2.substring($_2.indexOf("query=") + 6, $_2.lastIndexOf("&")));


    },
    mounted: function () {
        //自定义首页、尾页、上一页、下一页文本

    },
    methods: {
        getUser: function () {
            axios.get('/api/user/getUser.do').then(function (response) {
                this.user = response.data.data;
                console.log(this.user)
                if (this.user === undefined) {
                    $("#loginAfter").remove();
                } else {
                    $("#login").remove();
                    $("#register").remove();
                }

            }).catch(function (error) {
                console.log(error);
            });
        },
        getSearch: function () {
            axios.get('/api/course/search.do?' + $_2).then(function (response) {
                if (response.data.code === 1) {
                    this.courseList = response.data.data.records;
                    this.total = response.data.data.total;
                    this.currentPage = response.data.data.current;
                    this.pages = response.data.data.pages;
                    this.hasNextPage = response.data.data.current < response.data.data.pages;
                    this.hasPreviousPage = response.data.data.current > 1;
                    console.log(this.courseList)

                    $("#courseList div").remove();
                    for (let i = 0; i < this.courseList.length; i++) {
                        $("#courseList").append(getTpl(this.courseList[i].id, this.courseList[i].name,
                            this.courseList[i].coverImage, this.courseList[i].msg,
                            this.courseList[i].category.text, this.courseList[i].price, this.courseList[i].vipPrice))
                    }

                    //执行一个laypage实例
                    laypage.render({
                        elem: 'demo3'
                        , count: this.total //数据总数，从服务端得到
                        , limit: 10
                        , first: '首页'
                        , last: '尾页'
                        , prev: '<em>上一页</em>'
                        , next: '<em>下一页</em>'
                        ,curr: location.hash.replace('#current=', '') //获取hash值为fenye的当前页
                        ,hash: 'current' //自定义hash值
                        , jump: function (obj, first) {
                            //obj包含了当前分页的所有参数，比如：
                            console.log(obj.curr); //得到当前页，以便向服务端请求对应页的数据。
                            console.log(obj.limit); //得到每页显示的条数

                            //首次不执行
                            if (!first) {
                                //do something
                            }
                        }
                    });
                } else {
                    alertMy(response.data.msg);
                }
            }).catch(function (error) {
                console.log(error);
            });
        },
        changePage: function (current ) {
            var query = $_2.substring($_2.indexOf("query=") + 6, $_2.lastIndexOf("&"))
            axios.get('/api/course/search.do?query=' +query + '&current=' + current ).then(function (response) {
                if (response.data.code === 1) {
                    this.courseList = response.data.data.records;
                    this.total = response.data.data.total;
                    this.currentPage = response.data.data.current;
                    this.pages = response.data.data.pages;
                    this.hasNextPage = response.data.data.current < response.data.data.pages;
                    this.hasPreviousPage = response.data.data.current > 1;
                    console.log(this.courseList)

                    $("#courseList div").remove();
                    for (let i = 0; i < this.courseList.length; i++) {
                        $("#courseList").append(getTpl(this.courseList[i].id, this.courseList[i].name,
                            this.courseList[i].coverImage, this.courseList[i].msg,
                            this.courseList[i].category.text, this.courseList[i].price, this.courseList[i].vipPrice))
                    }

                } else {
                    alertMy(response.data.msg);
                }
            }).catch(function (error) {
                console.log(error);
            });
        }
    },

});

window.addEventListener('hashchange',()=>{
    const value = location.hash
    console.log(value)
    console.log(value.replace('#!current=',''))
    v.changePage(value.replace('#!current=',''))

})
