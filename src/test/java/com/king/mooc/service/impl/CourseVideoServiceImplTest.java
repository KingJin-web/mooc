package com.king.mooc.service.impl;

import com.king.mooc.entity.CourseVideo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class CourseVideoServiceImplTest {

    @Autowired
    CourseVideoServiceImpl courseVideoService;

    @Test
    public void queryByCid() {
    }

    @Test
    public void add() {
        List<CourseVideo> courseVideos = new ArrayList<>();
        String names[] = {
                " 第1章 课程介绍",
                " 1-1 课程导学",
                "1-2 项目介绍",
                " 1 - 3Webpack4升级注意",
                "1 - 4项目运行报错最新问题总结",
                "1 - 5补充Webpack4.29升级（1）",
                "1 - 6 补充Webpack4 .29 升级（2）",
                "1 - 7 补充vue - loader15 .6 .2 升级",
                "第2章 Vue +Webpack的前端工程工作流搭建",
                "2 - 1 项目目录升级 - 一个正式项目的目录结构",
                "2 - 2 vue - loader配置",
                "2 - 3 css module配置",
                "2 - 4 安装使用eslint和editorconfig以及precommit",
                "2 - 5 Webpack4升级",
                "第3章 Vue核心知识",
                "3 - 1 一点小准备 - 单独讲解vue核心内容的配置",
                "3 - 2 Vue实例",
                "3 - 3 Vue的生命周期方法",
                "3 - 4 Vue的数据绑定",
                "3 - 5 computed和watch使用场景和方法",
                "3 - 6 Vue的原生指令",
                "3 - 7 Vue的组件之组件的定义",
                "3 - 8 Vue的组件之组件的继承.mp4",
                "3 - 9 Vue的组件之自定义双向绑定",
                "3 - 10 Vue的组件之高级属性",
                "3 - 11 Vue的组件之render function",
                "第4章 Vue -Router和Vuex",
                "4 - 1 Vue - router之集成",
                "4 - 2 Vue - router之配置",
                "4 - 3 Vue - router之路由参数传递",
                "4 - 4 Vue - router之导航守卫",
                "4 - 5 Vuex之集成",
                "4 - 6 Vuex之state和getters",
                "4 - 7 Vuex之mutation和action",
                "4 - 8 Vuex之模块",
                "4 - 9 Vuex之其他一些API和配置",
                "第5章 服务器渲染",
                "5 - 1 开发时服务端渲染的配置和原理",
                "5 - 2 使用koa实现node server",
                "5 - 3 服务端渲染的entry配置",
                "5 - 4 开发时服务端渲染静态资源路径处理",
                "5 - 5 使用vue - meta处理元信息",
                "5 - 6 生产环境服务端渲染",
                "第6章 高级组件开发",
                "6 - 1 notification之基本组件实现",
                "6 - 2 notification之通过方法调用",
                "6 - 3 notification之优化",
                "6 - 4 tabs组件之基本组件实现",
                "6 - 5 tabs组件之选中状态和切换",
                "6 - 6 tabs组件之在父组件中渲染子组件的slot",
                "第7章 项目开发",
                "7 - 1 服务端api请求基础实现",
                "7 - 2 数据API实现",
                "7 - 3 后端登录接口实现以及session的使用.mp4",
                "7 - 4 登录页面实现",
                "7 - 5 联调第一个API",
                "7 - 6 请求错误处理和登录接口联调",
                "7 - 7 所有接口进行联调",
                "7 - 8 在数据请求的时候使用全局loading",
                "7 - 9 在服务端渲染时获取数据",
                "7 - 10 前后端数据复用以及服务端用户认证",
                "7 - 11 服务端渲染进行redirect操作",
                "7 - 12 createRenderer的方式进行服务端渲染",
                "7 - 13 正式环境打包以及异步模块打包优化",
                "第8章 部署和总结",
                "8 - 1 pm2使用以及服务器端部署",
                "8-2 静态资源上传cdn",
                "8-3 总结",
        };

        for (int j = 0; j < names.length; j++) {
            courseVideos.add(CourseVideo.builder().cid(1130L).
                    isVideo(1L).imgPath("https://static.wuzhaoqi.top/video/video.png").
                    path("https://static.wuzhaoqi.top/video/video.mp4").
                    videoNumber(j).playAmount(100)
                    .name(names[j]).build());
        }

        int a = courseVideoService.addlist(courseVideos);
        System.out.println(a);
    }

    @Test
    public void addPlayAmount() {
    }
}