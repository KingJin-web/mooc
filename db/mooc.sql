/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : mooc

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 29/06/2022 15:22:38
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `cid` int NOT NULL AUTO_INCREMENT,
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, '前端开发');
INSERT INTO `category` VALUES (2, '后端开发');
INSERT INTO `category` VALUES (3, '移动开发');
INSERT INTO `category` VALUES (4, '数据库');
INSERT INTO `category` VALUES (5, '计算机基础');

-- ----------------------------
-- Table structure for collection
-- ----------------------------
DROP TABLE IF EXISTS `collection`;
CREATE TABLE `collection`  (
  `id` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `uid` bigint NOT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `u_id`(`uid` ASC) USING BTREE,
  CONSTRAINT `c_id` FOREIGN KEY (`uid`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `u_id` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of collection
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int NOT NULL,
  `uid` int NULL DEFAULT NULL,
  `msg` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `cid` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL COMMENT '拥有者用户id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程概述',
  `cover_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片路径',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `vip_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '会员价',
  `sales` int NULL DEFAULT NULL COMMENT '销量',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `flag` int NOT NULL DEFAULT 0 COMMENT '是否已经删除',
  `version` int NOT NULL DEFAULT 0 COMMENT '版本',
  `category` int NULL DEFAULT NULL COMMENT '分类',
  `activity_price` decimal(8, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_key`(`uid` ASC) USING BTREE,
  INDEX `id_k2`(`category` ASC) USING BTREE,
  CONSTRAINT `id_k2` FOREIGN KEY (`category`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1130 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (19, 2, 'php构建即时通讯系统', '简介：用PHP构建一个Socket服务，以长链接为基础，开发在线游戏、实时聊天、监控、打点等即时通讯类应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/19.png', 3.26, 2.61, NULL, '2022-03-27 19:13:17', '2022-06-28 15:41:27', 0, 4, 2, NULL);
INSERT INTO `course` VALUES (20, 2, 'Python接口自动化测试实战与面试题解析', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/20.jpg', 68.68, 54.95, NULL, '2022-03-27 19:13:17', '2022-06-28 15:41:28', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (21, 2, 'php架构师进阶-多任务处理中心实战高级微服务', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/21.png', 189.72, 151.78, NULL, '2022-03-27 19:13:17', '2022-06-28 15:41:28', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (22, 2, 'PHP7/TP/Mysql/Laravel/Redis/Swoole', 'python数据挖掘技巧大揭秘 - 2021暑期班', 'http://oss1.wuzhaoqi.top/course/2022-06-28/22.png', 3.96, 3.16, NULL, '2022-03-27 19:13:17', '2022-06-28 15:41:29', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (23, 2, 'php微信公众号+企业号微商城接口开发', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/23.jpeg', 160.92, 128.74, NULL, '2022-03-27 19:13:17', '2022-06-28 15:41:29', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (24, 2, 'Golang/微服务/分布式/协程/区块链入门到架构', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/24.jpeg', 101.48, 81.18, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:30', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (25, 2, 'C/C++入门到精通实战-挑战年薪50万', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/25.jpeg', 75.84, 60.67, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:30', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (26, 2, 'Java项目面试实操 提升大厂面试成功率', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/26.jpg', 4.30, 3.44, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:31', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (27, 2, 'Spring框架小白的蜕变', '简介：在本课程中，老师带领大家认识Spring中的重要概念IoC，然后介绍如何对Spring Bean进行管理。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/27.jpg', 10.45, 8.36, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:31', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (28, 2, '浅析SQLmap', '简介：在当前互联网环境下，泄露的数据库已遍布各大互联网公司。如何才能更好地保护我们的数据？本次课程将带你走进web安全的世界，让你了解数据库安全的注入方法。黑客不再变得神秘，攻击技术原来我也会，小网站主自己也能找到正确的安全道路。黑客是怎么做拿走我的数据库的?为什么要选择这样的方案呢？我应该怎么防范黑客的攻击?你或许能再本次课程当中找到答案。通过课程的详细讲解，让你不仅能“知其然”，更加“知其所以然”。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/28.jpg', 63.05, 50.44, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:32', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (29, 2, 'Python高性能Web框架Tornado入门', '简介：Tornado 以其微框架、高并发的特性，吸引了一批 Python web 开发程序员。本课分为两部分，前半部分详细介绍Tornado的基础知识和主要模块，后半部分通过使用 Tornado 实现一个 RESTful 微服务，演示Tornado实际场景的用法。想了解更多 python web 入坑指南 相关内容可以关注老师知乎：https://www.zhihu.com/people/pegasus-wang/columns', 'http://oss1.wuzhaoqi.top/course/2022-06-28/29.jpg', 170.68, 136.54, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:33', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (30, 2, 'Python抽取多源数据文本信息', '简介：本课程由数据预处理整个流程到综合实战。包括：Anaconda、Sublime、Pywin32、数据采集、数据集成、缺失值处理、正则、jieba分词、NLTK、词袋模型、数据抽样、特征词抽取、文本向量化、gensim、数据降维、numpy、sicpy、pandas、matplotlib、seabom、Xgboost等核心技术。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/30.jpg', 104.16, 83.33, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:33', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (31, 2, '玩转Java并发工具，精通JUC，成为并发多面手', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/31.jpg', 26.31, 21.05, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:34', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (32, 2, 'PHP扩展安装指南', '简介：PHP扩展作为构建PHP的重要组成部分，可以让我们快速扩展PHP的功能，使得PHP对各种工具的支持有了较好的依托。本课程从全面认识PHP扩展开始，深入探讨PHP扩展安装步骤，并且通过实战课程进一步加深PHP扩展的管理和安装。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/32.jpg', 137.00, 109.60, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:34', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (33, 2, 'python运维-Socket网络编程', '简介：使用Python完成Socket网络通讯，并且使用完成文件上传下载功能', 'http://oss1.wuzhaoqi.top/course/2022-06-28/33.jpg', 56.89, 45.51, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:35', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (34, 2, '实例学习PHPQRCode生成二维码', '简介：二维码给我们的生活带来了便利，获取信息，付款，都只需要扫一扫即可。本课程分为理论和实践两部分，理论部分主要讲解二维码的历史，如何存储信息，实战阶段通过实战案例为大家讲解二维码的产生和识别的全过程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/34.jpg', 104.69, 83.75, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:35', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (35, 2, 'TensorFlow与Flask结合打造手写体数字识别', '简介：本课程使用TensorFlow技术和flask框架相结合，通过前端html和jQuery框架，利用canvas画布将用户在屏幕上的手写文字传入到后台flask的restful api中，然后flask通过调取模型接口，把数据传入模型中进行手写体识别，形成一个完整的闭环。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/35.jpg', 160.78, 128.62, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:36', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (36, 2, 'Activiti6.0工作流引擎深度解析', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/36.jpg', 174.20, 139.36, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:36', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (37, 2, 'Java定时任务调度工具详解之Quartz篇', '简介：本课程是系列课程Java定时任务调度工具详解中的Quartz篇，旨在通过详细讲述Java定时调度工具的基本概念、工具，和这些工具里面包含的各个组件之间的关系，以及如何使用这些工具来实现定时调度功能，让学生能够对Java定时调度工具有一个清晰准确的认识。结合一些经典使用场景通过手把手的命令行操作进行教学，使同学们得心用手地使用这些定时调度工具来实现自己想要的功能。讲师实战课程已经上线，从0开始部署项目，掌握SSM和SpringBoot两大主流框架。详解SSM无缝迁移到SPRINGBOOT + MYBATIS的框架转换，远程调试项目并与微信结合，利用阿里SUI，实现前后端的全栈开发。详情：http://coding.imooc.com/learn/list/144.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/37.jpg', 40.33, 32.26, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:37', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (38, 2, 'C++远征之封装篇（上）', '简介：本课程将代领小伙伴们真正迈入C++语言的面向对象大门，在课程中，将会深入讲解类的定义方法，属性的封装方法，构造函数和析构函数等内容，并且所有知识均会通过编码实践的方式讲解到操作层面，力求帮助小伙伴们即学即会！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/38.jpg', 148.51, 118.81, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:38', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (39, 2, 'Java中的文件上传下载', '简介：现实 Java Web 开发过程当中经常会遇到文件上传、下载的场景。如何实现轻松、快捷的文件上传下载功能呢？本节课程由简入深，从 Jsp + Servlet 开始逐步分析、实现文件上传下载功能及相关框架的使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/39.jpg', 161.11, 128.89, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:38', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (40, 2, '使用java构建和维护接口自动化测试框架', '简介：系统介绍接口自动化框架MRAutoSpace的使用方法，并学习如何编写其中重要的组件HttpClientUtil，帮助学员通过实践了解框架的基本组成部分及运行原理。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/40.jpg', 85.06, 68.05, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:39', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (41, 2, 'Python前后端分离开发Vue+Django实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/41.jpg', 17.58, 14.07, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:39', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (42, 2, 'Python全栈案例初体验', '简介：随着 web 开发越来越成熟，各种框架开始越发轻量好用，后端开发可以通过一些简单的包生成前端页面，前端开发也可以通过 node.js 这类新生代来参与后端开发。前后端开发注定会有一个交集，即最近几年风靡各类创业公司的全栈开发。本课以 python 为例，告诉大家如何通过 python + flask + html/css/js 来进行全栈开发，还有一个简单的实战案例哦。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/42.jpg', 65.34, 52.27, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:40', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (43, 2, '算法与数据结构-综合提升C++版', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/43.jpg', 198.69, 158.95, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:41', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (44, 2, 'HBase+Spring Boot实战分布式文件存储', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/44.jpg', 104.40, 83.52, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:42', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (45, 2, 'SVN从入门到放弃', '简介：本入门教程详细讲述了SVN产生背景，应用场景以及与其他版本控制工具的区别。如何搭建SVN环境、版本库创建与管理、版本库访问方式、权限分组及多版本库解决方案等。并从最基本的update、add、del、commit命令开始逐步深入到进阶操作以及hooks等高级应用。通过一系列的实例教学伴随你从SVN小白到SVN高手。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/45.jpg', 116.78, 93.42, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:42', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (46, 2, '解密JAVA实现Excel导入导出', '简介：现实Java web开发过程当中经常会遇到文件导入、导出、导入模板下载的场景。如何实现轻松、快捷的定制导入模板、导入导出文件功能呢？本节课程由简入深，逐步分析、实现文件导入导出功能。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/46.jpg', 167.96, 134.37, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:43', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (47, 2, 'PHP微信公众平台开发高级篇—网页授权接口', '简介：在微信客户端中访问第三方网页，公众号可以通过微信网页授权机制，来获取用户基本信息，进而实现业务逻辑。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/47.jpg', 76.51, 61.20, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:43', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (48, 2, '手把手教你实现电商网站后台开发', '简介：本系统从慕课网电子商务系统的需求分析、数据表设计入手，从后台搭建，到后台模块实现，由浅入深教你如何搭建电子商务系统，包括前台数据的显示并详细讲解了电商系统开发流程以及开发过程中会遇到的问题及如何解决。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/48.jpg', 108.10, 86.48, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:44', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (49, 2, '神奇的JpGraph类库', '简介：本课程介绍了JpGraph类库及其相关工作原理，并通过XY折线图的案例详细解析了使用JpGraph类库绘图的步骤，在绘制过程中带领大家解决了生产中经常会遇到的中文显示错误问题，帮助大家熟练的掌握JpGraph类库的使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/49.jpg', 153.98, 123.19, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:44', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (50, 2, 'ajax跨域完全讲解', '简介：通过讲解什么是跨域问题，从系统最常见的部署结构上分析跨域解决的思路，详细讲解jsonp的工作机制，http协议如何支持跨域，以及http服务器nginx和apache的2种不同解决思路，让大家知其然并知其所以然，快速掌握问题本质和分析问题的方法。老师的实战课《SpringBoot2.0不容错过的新特性 WebFlux响应式编程》已上线，喜欢老师的小伙伴可以来支持下~地址：https://coding.imooc.com/class/209.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/50.jpg', 194.98, 155.98, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:45', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (51, 2, 'PHP进阶篇-字符串操作', '简介：PHP中处理字符串是PHP很强大的功能之一，本课程主要分两部分讲解，一个是PHP中的字符串的使用，一个是字符串函数库的使用', 'http://oss1.wuzhaoqi.top/course/2022-06-28/51.jpg', 22.44, 17.95, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:45', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (52, 2, 'PHP中的HTTP协议', '简介：本次课程将带领大家学习PHP中的HTTP协议，掌握http交互请求，例如post、和get请求，并用代码方式实现常见的post、get请求，以及防盗链、反向Ajax等高级应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/52.jpg', 47.14, 37.72, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:46', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (53, 2, 'RabbitMQ消息中间件极速入门与实战', '简介：本课程主要带大家快速入门RabbitMQ消息中间件基础，会带着小伙伴快速搭建环境，并进行核心基础的学习，之后整合springboot2.x，最后做一个在真正生产环境中的高可靠性投递消息的实战案例（代码详解）。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/53.jpg', 91.70, 73.36, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:47', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (54, 2, '高性能产品的必由之路—性能测试工具', '简介：开发人员如果具备了性能测试和性能优化的技能，在成长为架构师的路上会更加有竞争力。本门课程以Jmeter为中心给大家介绍了最最常用的性能测试的工具，通过对不同类型的系统进行性能测试，了解性能测试在真实项目中的意义，最后通过测试加压来观察和分析系统的瓶颈。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/54.jpg', 111.36, 89.09, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:47', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (55, 2, 'Tomcat服务配置与性能优化', '简介：本课程从Tocmat环境安装开始介绍，然后介绍了安全配置和性能优化的内容。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/55.jpg', 72.78, 58.22, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:48', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (56, 2, 'PHP实现手机归属地查询', '简介：如今各种WEB应用层出不穷，作为一名程序员，怎能没有一技防身？本课会带大家从0开始开发一个完整的WEB应用，从框架结构到流程分析再到数据缓存，相信你学习完本课之后收获到的不仅仅是学会了开发一个应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/56.jpg', 156.75, 125.40, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:48', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (57, 2, '基于Spring Boot技术栈博客系统企业级前后端实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/57.jpg', 185.99, 148.79, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:49', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (58, 2, 'Yii框架不得不说的故事—高效篇', '简介：YII是目前比较火的框架，框架里面使用了最新的技术和设计，可以说学习了YII就学习了最新的php技术，本课程主要学习YII如何提升程序运行效率以及开发效率。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/58.jpg', 98.00, 78.40, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:50', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (59, 2, '阿里新零售数据库设计与实战 （升级版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/59.jpg', 103.73, 82.99, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:50', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (60, 2, 'PHP实现文件上传与下载', '简介：本课程讲解了文件上传的原理和配置，并带领大家使用面向对象和面向过程两种方式，完成了对单文件和多文件上传的处理，以及文件下载功能的实现，通过本课程的学习，能够掌握对文件上传和下载的处理办法，并加深对类与面向对象的封装的理解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/60.jpg', 97.03, 77.62, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:51', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (61, 2, 'Java实现消息摘要算法加密', '简介：本课程是《Java实现Base64加密》课程的延续，是Java加解密系列课程的第二门课。本课程主要介绍如何在Java中使用MD、SHA、MAC三种消息摘要算法实现加解密，以及他们的应用场景。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/61.jpg', 165.23, 132.19, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:51', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (62, 2, 'vagrant打造跨平台可移动的开发环境', '简介：Vagrant目前是国内互联网公司应用最多的内部开发环境工具。Vagrant是我们开发者的福音，使我们完全摆脱了重复配置环境的处境。Vagrant简单的配置，丰富的自动化脚本资源以及分享的便捷性都是我们应该学习的思想，节省开发人员的大量准备工作时间,使开发人员更专注公司业务开发。本课程分为理论和实践两部分，理论部分主要讲解Vagrnat的好处和基本命令，实战阶段通过实战案例为大家讲解Vagrant配置开发环境的全过程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/62.jpg', 88.43, 70.74, NULL, '2022-03-27 19:13:18', '2022-06-28 15:41:52', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (63, 2, 'Java高并发编程 从入门到面试', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/63.jpg', 78.30, 62.64, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:02', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (64, 2, 'Java图片验证码', '简介：小伙伴们，最近是不是在被图片验证码折磨呀，想不想知道这磨人的验证码是如何实现的呀。本门课程将使用SpringMVC和Spring框架，为小伙伴们带来图片验证码的制作和验证过程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/64.jpg', 186.59, 149.28, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:03', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (65, 2, 'PHP秒杀系统  高并发高性能的极致挑战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/65.jpg', 196.24, 156.99, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:03', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (66, 2, 'Java微信公众号开发进阶', '简介：本门课程是《初识微信公众号开发》的进阶课程，在入门课程的基础上，对Java微信公众号的开发模式进行深入讲解。主要介绍了图文、音乐消息的回复，自定义菜单，最后介绍了百度翻译小案例。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/66.jpg', 43.87, 35.10, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:10', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (67, 2, 'IntelliJIDEA神器使用技巧', '简介：程序员每日都会花费数小时使用ide编写和调试代码，其中很多操作都是机械重复且频率非常高，本着\"工欲善其事必先利其器\"的精神，闷头写代码之外花点时间研究一下自己用的ide，其带来的效率提升非常可观。本课程选择了intellij idea这一java集成工作开发环境，从如何高效定位、代码智能提示、重构、关联、版本控制等全方面展示这款idea发挥的功能，相信同学们在学习并掌握了这款idea的技巧之后，开发效率至少提升两倍以上，你只需要专注于业务逻辑，把更多的重复劳动交给idea吧。老师的《Java读源码之Netty深入剖析》实战课已上线 https://coding.imooc.com/class/230.html ，感兴趣的小伙伴们欢迎来学习', 'http://oss1.wuzhaoqi.top/course/2022-06-28/67.jpg', 41.66, 33.33, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:11', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (68, 2, 'python必学模块-collections', '简介：Python的collections模块中提供了很多方便使用且高性能的数据结构，这些数据结构很容易被Python初学者忽略。学习这些数据结构让我们避免重复造轮子的同时还能让代码性能更高并且易读。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/68.jpg', 1.53, 1.23, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:19', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (69, 2, 'PHP7.0新特性', '简介：最近PHP官方终于发布了传说中的PHP7，虽然只是alpha版。PHP7号称是新一代的PHP，官方开发组对Zend引擎底层做了大量优化来提升PHP的性能。本视频就来介绍一下PHP7的新特性以及做了哪些方面的优化。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/69.jpg', 162.44, 129.95, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:20', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (70, 2, '全流程开发 GO实战电商网站高并发秒杀系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/70.jpg', 196.95, 157.56, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:20', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (71, 2, '聚焦Java性能优化 打造亿级流量秒杀系统（附赠秒杀项目）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/71.jpg', 20.23, 16.19, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:21', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (72, 2, '大型PHP电商网站商品秒杀功能实现思路分析', '简介：众所周知，对于一个流量凶猛、稳定性要求极高的商品秒杀功能，传统的PHP技术很难满足要求，所以需要借助于网站架构设计、服务器配置、负载均衡、cdn加速、云解析、redis等多种手段方能实现，本课程属于PHP高级课程，主要介绍功能实现思路，不涉及代码具体实现，小白慎入！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/72.jpg', 29.58, 23.67, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:21', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (73, 2, 'python-web.py开发入门', '简介：python的简单易学已经出了名了，在python下的web框架中web.py的简小精悍也是出了名了；那么想要快速掌握web开发的最佳选择自然就是python+web.py了。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/73.jpg', 103.92, 83.14, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:22', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (74, 2, '模式的秘密—工厂模式', '简介：工厂模式和抽象工厂模式是在日常开发中使用非常广泛的设计模式。主要用于实现将对象的实例化部分取出来，进而优化系统架构，增强系统的扩展性。本课程即将讲解Java中的工厂模式和抽象工厂模式的应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/74.jpg', 139.90, 111.92, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:22', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (75, 2, 'SpringBoot发送邮件', '简介：本课程为大家详细介绍了发送邮件的相关知识和原理，介绍了 Spring Boot 的基础使用，最后为大家演示了如何通过 Spring Boot 发送各种类型的邮件，掌握如何去设计一个邮件系统。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/75.jpg', 58.12, 46.50, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:23', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (76, 2, 'JAVA实现非对称加密', '简介：非对称加密算法是一种基于密钥的保密方法，需要公开密钥和私有密钥，在文件加密、尤其是网银中应用广泛。本课程主要介绍非对称加密算法的实现过程，DH、RSA和ELGamal等几种常见的非对称加密算法的在Java中的应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/76.jpg', 193.02, 154.41, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:24', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (77, 2, '使用wordpress极速建站', '简介：作为一款免费、简单、扩展性超好的博客系统，wordpress被广泛的使用，不光是用于搭建个人博客，还可以扩展成电子商城、CMS、相册等等各种系统。本课程教你如何不敲一行代码，也能实现自己搭建博客系统。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/77.jpg', 150.68, 120.55, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:24', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (78, 2, 'Springboot微信小程序–微信登录功能实战', '简介：通过学习本课程可以掌握如何使用微信api，如何使用httpClient工具跨服务器调用微信url，掌握如何解析string到自己封装的model，掌握自定义会话保存至redis', 'http://oss1.wuzhaoqi.top/course/2022-06-28/78.jpg', 85.07, 68.06, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:25', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (79, 2, 'PHP第三方登录—QQ登录', '简介：想使用最简单的方法为我们的Web应用获取新用户，你绝对不应该错过。使用QQ互联官方提供的SDK快速接入QQ互联开放平台，迅速获取海量用户。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/79.jpg', 158.87, 127.10, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:26', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (80, 2, '廖雪峰的python教程', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/80.jpg', 83.61, 66.89, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:26', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (81, 2, 'CDN与智能DNS原理和应用', '简介：CDN是内容分发网络，利用部署大量网络节点，通过服务器缓存加速，让用户可以就近同运营商网络，更快的访问到我们的互联网产品，可以简单快速的让我们的互联网产品支持海量的并发请求。智能DNS比传统DNS更好的地方就是能够基于IP信息给不同的用户最合适的服务器IP，可以给用户提供更好的网络服务。本课程详细讲解了CDN的原理和具体使用，也有详细介绍DNS解析的完整过程，再具体介绍了智能DNS的实现原理和作用，让大家对这些基础服务有更加深入的了解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/81.jpg', 118.11, 94.49, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:27', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (82, 2, 'PHP+MySQL分页原理实现', '简介：还在为无法完成一个令人赏心悦目的分页功能而烦恼吗？本课程将一步一步，由简入繁的剖析其中的原理，和大家共同完成一个功能完善的分页。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/82.jpg', 83.21, 66.57, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:27', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (83, 2, 'Python制作数据分析工具', '简介：数据诊断是数据挖掘和机器学习的第一步，然而却被很多人忽略掉了。如果对数据本身不了解的话，容易受到严谨的业务人的挑战，同时，如果缺少了数据诊断的步骤，会增加后面数据预处理的难度，从而影响最终模型的效果。因此，本课程教授大家如何制作一个高效的，复用性高的，让人更好地理解数据本身的数据诊断工具。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/83.jpg', 91.66, 73.33, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:28', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (84, 2, 'SpringBoot+MyBatis搭建迷你小程序', '简介：用Spring Boot框架大大简化了新Spring应用的初始搭建以及开发过程，在开发人员中越来越受到欢迎。微信小程序作为目前炙手可热的应用，很有可能在未来占据轻应用的市场。本门课程的主要目的是将两者结合起来，同时希望作为入门翔仔之前实战课的一个更低门槛的课程进行讲解。本课分为三大部分：第一部分带领大家明确需求，从零开始进行SpringBoot+MyBatis的框架搭建；第二部分咱们将依据业务模块配合UT实现后端完整的增删改查功能；最后我们将来到微信小程序开发部分，帮大家入门微信小程序开发，并教会大家前后联调。老师相关实战课程：http://coding.imooc.com/class/144.html\n老师的面试课程：\nhttps://coding.imooc.com/class/303.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/84.jpg', 89.14, 71.31, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:28', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (85, 2, 'PHP进阶篇-日期时间函数', '简介：PHP中针对日期和时间的操作也是我们开发中很常用的功能，让我们一起看看PHP如何操作日期时间的吧~。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/85.jpg', 127.53, 102.03, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:29', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (86, 2, '精讲Elastic-job + Quartz实现企业级定时任务', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/86.jpg', 49.51, 39.61, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:29', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (87, 2, '大数据入门第一课 Hadoop基础知识与电商网站日志数据分析', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/87.jpg', 67.76, 54.21, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:30', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (88, 2, 'PHP无限级分类技术', '简介：无限分类是我们开发中经常会用的到功能。本课以理论为基础，辅以代码，详细讲解无限分类的使用场景及常用的实现方法，主要包括经典的递归实现和全路径实现两种方式。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/88.jpg', 33.40, 26.72, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:31', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (89, 2, 'Python实现线性回归', '简介：对于机器学习的入门学习者提供线性回归的原理讲解，在掌握原理的基础上，利用python实现最小二乘法或者梯度下降来进行线性回归分析。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/89.jpg', 165.15, 132.12, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:31', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (90, 2, 'SpringCloud  Finchley三版本微服务实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/90.jpg', 117.83, 94.26, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:32', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (91, 2, 'Hibernate缓存策略', '简介：Hibernate是目前最老牌和主流的Java ORM框架，而缓存是ORM 框架中的一个重难点，是数据库访问性能优化的重要手段，本课程主要介绍Hibernate中缓存的原理、分类和使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/91.jpg', 196.80, 157.44, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:32', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (92, 2, 'C++远征之模板篇', '简介：本课程将带领大家体会更为奇妙的C++，讲述了静态、友元、运算符重载的定义及使用方法，其中重点讲述函数模板、类模板以及标准模板库的相关知识，知识内容更重实用性，本门课程对于面向对象的语言的学习将大有裨益，所有知识均以实践的方式讲解到操作层面，力求即学即会。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/92.jpg', 100.09, 80.07, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:33', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (93, 2, '短信验证', '简介：本课程的内容特色 ，通过新联建立的独立tp5项目，独立讲解短信验证使用，清晰明了，学会简单快速 实现短信API接口的发送 ，注册会员 登录，找回密码等功能', 'http://oss1.wuzhaoqi.top/course/2022-06-28/93.jpg', 198.75, 159.00, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:41', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (94, 2, '手把手教你把Python应用到实际开发 不再空谈语法', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/94.jpg', 120.28, 96.23, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:42', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (95, 2, 'Java实现Base64加密', '简介：本门课程是Java加解密系列的第一门课，旨在为大家介绍Java加密解密的基础知识，并使用Base64算法实现加解密。本门课程在整个加解密系列中十分重要，是Java加解密必备的入门基础。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/95.jpg', 191.51, 153.21, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:43', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (96, 2, '分布式事务实践 解决数据一致性', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/96.jpg', 66.11, 52.89, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:43', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (97, 2, 'JSON应用场景与实战', '简介：现今Json数据以短小、读取方便等优点，越来越受广大开发人员喜欢。本课分为两部分，前半部分详细介绍JSON的基础知识，后半部分通过两个实站案例再次加深对Json的理解，并演示Json在各个实际场景的用法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/97.jpg', 134.62, 107.70, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:44', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (98, 2, 'Java定时任务调度工具详解之Timer篇', '简介：本课程是系列课程Java定时任务调度工具详解中的Timer篇，本系列课程旨在通过详细讲述Java定时调度工具的基本概念、工具，和这些工具里面包含的各个组件之间的关系，以及如何使用这些工具来实现定时调度功能，让学生能够对Java定时调度工具有一个清晰而准确的认识。然后结合一些经典的使用场景通过手把手的命令行操作进行教学，使同学们得心用手地使用这些定时调度工具来实现自己想要的功能。讲师实战课程已经上线，从0开始部署项目，掌握SSM和SpringBoot两大主流框架。详解SSM无缝迁移到SPRINGBOOT + MYBATIS的框架转换，远程调试项目并与微信结合，利用阿里SUI，实现前后端的全栈开发。详情：http://coding.imooc.com/learn/list/144.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/98.jpg', 72.35, 57.88, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:44', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (99, 2, 'BAT大牛亲授 基于ElasticSearch的搜房网实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/99.jpg', 5.88, 4.71, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:45', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (100, 2, 'PHP开发高可用高安全App后端', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/100.jpg', 30.77, 24.62, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:45', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (101, 2, '360大牛带你横扫PHP职场 全面解读PHP面试', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/101.jpg', 115.84, 92.67, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:46', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (102, 2, 'Thinkphp5.0仿百度糯米开发多商家电商平台', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/102.jpg', 32.93, 26.34, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:46', 0, 3, 2, NULL);
INSERT INTO `course` VALUES (103, 2, 'Hibernate初探之单表映射', '简介：Hibernate是一个著名的对象关系映射框架，使得Java程序员可以随心所欲的使用对象编程思维来操纵数据库。本门课程是Hibernate的入门课程，主要介绍ORM和hibernate的概念，如何在eclipse中创建hibernate实例及相关配置文件的详解说明。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/103.jpg', 163.39, 130.71, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:47', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (104, 2, 'Python Flask快速入门与进阶', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/104.jpg', 94.74, 75.79, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:47', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (105, 2, '轻松学会Laravel-基础篇', '简介：Laravel框架是世界上最流行的PHP开发框架，没有之一。近年来Laravel以强大、安全、优雅等特性迅速占据了PHP开发框架第一份额的宝座。现在Laravel框架已成为大型互联网公司及PHP攻城狮们的首选框架。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/105.jpg', 38.34, 30.67, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:48', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (106, 2, '项目管理利器——maven', '简介：maven是优秀的项目管理和构建工具，能让我们更为方便的来管理和构建项目，从最基础的环境配置，到maven核心知识点的应用，本套视频将带领大家进行一段轻松的maven之旅。让我们一起使用maven来构建和管理Java项目吧！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/106.jpg', 4.34, 3.47, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:49', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (107, 2, 'Python Flask构建微信小程序订餐系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/107.jpg', 60.44, 48.35, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:56', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (108, 2, 'Struts2入门', '简介：Struts2是当前流行的Java Web框架！本门课程首先介绍Strust2的基本概念和发展历史，然后从一个案例入手，带领小伙伴们对Struts2有一个全面的了解。接着有对Struts2进行了更深入的讲解。相信通过本课程的学习，小伙伴们一定能够有所收获。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/108.jpg', 16.39, 13.11, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:57', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (109, 2, 'Spring事务管理', '简介：事务管理是Spring中的一个非常重要的知识。本门课程首先介绍Spring的基本概念，然后以银行转账为例，介绍Spring的编程式事务管理和声明式事务管理的应用场景和实现方式！希望通过本门课程的学习，使得小伙伴们可以在开发中灵活地应用事务。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/109.jpg', 92.69, 74.15, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:57', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (110, 2, 'SpringMVC拦截器', '简介：拦截器是Spring MVC中一个十分重要且应用广泛的内容。本课程通过乱码问题的解决引入Spring MVC拦截器的使用，介绍了拦截器的工作原理、实现方法和使用场景，最后介绍了拦截器与过滤器的区别。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/110.jpg', 38.92, 31.14, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:58', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (111, 2, '洪大师带你解读Symfony2框架', '简介：全网首发，Symfony2是国外最流行的PHP开发框架，近年来Symfony2正以迅雷不及掩耳之势迅速占据国内PHP开发框架的市场份额， 鉴于symfony2高度重视业务逻辑，代码易读，维护轻松，能大大提升团队的开发效率，提高代码性能，现在Symfony2框架已成为大型互联网公司的首选框架。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/111.jpg', 114.76, 91.80, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:59', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (112, 2, 'Java眼中的XML文件写入', '简介：XML 在数据传输及存储等方面非常流行，所以使用 JAVA 程序来生成相应用途的 XML 文件就变得非常重要，那么问题来了：如何使用 JAVA 程序生成一个 XML 文档呢？本节课将详细为你解答！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/112.jpg', 152.86, 122.29, NULL, '2022-03-27 19:13:18', '2022-06-28 15:42:59', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (113, 2, 'Ruby语言快速入门', '简介：Ruby的基础语法课, 学习完本教程, 可以让你了解入门知识，为Ruby开发打下基础', 'http://oss1.wuzhaoqi.top/course/2022-06-28/113.jpg', 27.05, 21.64, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:00', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (114, 2, 'JSON快速入门（Java版）', '简介：当我们把服务器的数据传输到web前端或者移动端进行显示时，一般情况下，会选择JSON格式的数据，因此JSON在开发中的应用还是十分广泛的。本门课程就为大家带来常用的JSON和GSON的使用。包括概念、适用场景、数据的生成和解析等。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/114.jpg', 26.98, 21.58, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:00', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (115, 2, 'Java设计模式精讲  Debug方式+内存分析', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/115.jpg', 69.16, 55.32, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:01', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (116, 2, 'Netty+Spring Boot仿微信-全栈开发高性能后台及客户端', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/116.jpg', 179.54, 143.63, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:02', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (117, 2, 'Swoole入门到实战打造高性能赛事直播平台', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/117.jpg', 70.91, 56.73, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:02', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (118, 2, 'Python3数据分析与挖掘建模实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/118.jpg', 155.02, 124.01, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:03', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (119, 2, 'PHP实现页面静态化', '简介：众所周知，页面静态化是门户网站研发中必备的一项技能，本课程从纯静态化和伪静态化两个角度进行分析，带领大家掌握在PHP中如何生成纯静态化页面，在WEB服务器中如何配置伪静态，帮助大家掌握又一项加薪利器。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/119.jpg', 58.32, 46.66, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:04', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (120, 2, 'Java开发企业级权限管理系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/120.jpg', 173.74, 138.99, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:04', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (121, 2, '探秘SpringAOP', '简介：面向切面编程（AOP）提供另外一种角度来思考程序结构，通过这种方式弥补了面向对象编程（OOP）的不足。同时AOP框架也是Spring的一个关键的组件在平时的面试中也是一个容易被询问到的知识点。本课程将带领大家对SpringAop的实现原理，详细用法和经典场景一步步进行解读，让我们一起探秘Spring Aop！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/121.jpg', 59.26, 47.41, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:05', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (122, 2, '微信小程序电商实战 从前端到后端的全流程精讲', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/122.jpg', 143.81, 115.05, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:05', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (123, 2, 'PHP微信公众平台开发高级篇—群发接口', '简介：对于某些具备开发能力的公众号运营者，可以通过高级群发接口，实现更灵活的群发能力。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/123.jpg', 199.45, 159.56, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:06', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (124, 2, 'PHP微信公众平台开发高级篇—微信JS-SDK', '简介：通过使用微信JS-SDK，网页开发者可借助微信高效地使用拍照、选图、语音、位置等手机系统的能力，为微信用户提供更优质的网页体验。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/124.jpg', 47.26, 37.81, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:07', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (125, 2, '版本管理工具介绍-SVN篇', '简介：多人协作开发是程序猿不可避免的话题，版本控制工具不可或缺，学会 SVN ，让初入公司的你与他人的合作不再尴尬！本课程主要介绍版本控制工具之一 SVN 的安装、结合Java代码的简单操作及常见问题解决。版本控制的环境下才能共创程序猿梦想，大家代码都好才是真的好！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/125.jpg', 53.31, 42.65, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:08', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (126, 2, 'PHP微信公众平台开发高级篇—生成二维码接口', '简介：二维码接口可以带给用户方便又快捷的体验！本课程主要讲解二维码接口的实现，以及二维码事件推送功能的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/126.jpg', 102.41, 81.93, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:08', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (127, 2, 'C++远征之封装篇（下）', '简介：本课程是真正跨入C++面向对象之门，讲述了对象数组、成员、指针，this指针，常对象、引用、指针、成员函数以及深拷贝和浅拷贝，课程的最后讲述了一个迷宫案例，通过这个案例可以将C++所学知识融会贯通，所有知识均通过编码实践的方式讲解到操作层面，力求即学即会。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/127.jpg', 77.26, 61.80, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:09', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (128, 2, '深度解锁SpringCloud主流组件 一战解决微服务诸多难题', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/128.jpg', 17.30, 13.84, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:09', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (129, 2, 'ElasticSearch7+Spark  构建高匹配度搜索服务', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/129.jpg', 66.74, 53.39, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:10', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (130, 2, '在UbuntuServer下搭建LAMP环境', '简介：本课程通过详细的细分教学，让你理解LAMP环境各个组件之间的关系与作用，并能掌握从无到有的在Ubuntu Server操作系统下搭建LAMP环境、配置虚拟主机、数据库远程维护等常见的服务器搭建维护技能，为学习PHP铺平道路。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/130.jpg', 167.48, 133.98, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:10', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (131, 2, 'Netty入门之WebSocket初体验', '简介：大数据背景下，对我们的系统性能提出了更高的要求，包括我们的数据存储和应用，都提出了性能上的需求，尤其是对IO通信方面，更是成为了大数据通信下的瓶颈，为此，我们对系统进行相关的分布式改造。那么，如何进一步提升我们的系统IO性能呢？这里，就为大家介绍大数据时代构建高可用分布式系统的利器——Netty', 'http://oss1.wuzhaoqi.top/course/2022-06-28/131.jpg', 159.63, 127.71, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:11', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (132, 2, 'PHP进阶篇-GD库图像处理', '简介：通过PHP核心函数库GD库的学习,可以掌握在PHP中操作图像的一种方式，掌握常见Web操作中对于图像的相关处理，像产生验证码、缩略图等操作。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/132.jpg', 16.19, 12.95, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:11', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (133, 2, 'Struts2拦截器浅析', '简介：Struts2大多数核心功能是通过拦截器实现的，每个拦截器完成某项功能，比如，params拦截器负责解析HTTP请求的参数，并设置Action的属性。本次将与各位小伙伴们分享的就是Struts2中的拦截器。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/133.jpg', 175.08, 140.06, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:12', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (134, 2, '二进制基础', '简介：二进制是计算机唯一能识别的语言，是学习计算机技术必须要懂的知识。本门课程将带您认识二进制的由来，如何进行不同进制间的转换，如二进制与十进制减的相互转换，以及位运算，最后介绍Java中的进制。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/134.jpg', 36.38, 29.11, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:23', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (135, 2, '反射—Java高级开发必须懂的', '简介：反射是Java开发中一个非常重要的概念，掌握了反射的知识，才能更好的学习Java高级课程，因此必须要学习——你懂的！本门课程主要介绍Class类的使用，方法和成员变量的反射，以及通过反射了解集合泛型的本质等知识。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/135.jpg', 102.25, 81.80, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:23', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (136, 2, '微信授权登录', '简介：本课程首先会对微信授权登录的基础知识进行介绍，然后分别介绍基于微信公众号和基于开放平台的登录，最后介绍公众号和开发平台如何关联。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/136.jpg', 58.09, 46.47, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:24', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (137, 2, '初识机器学习-理论篇', '简介：大数据时代背景下，机器学习在各行各业都有广泛应用。本课对机器学习做入门级介绍，主要介绍机器学习的概念、典型的行业案例，并对比机器学习和传统数据分析的差别，一些经典的算法，最后是Demo演示', 'http://oss1.wuzhaoqi.top/course/2022-06-28/137.jpg', 111.32, 89.05, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:24', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (138, 2, '部署落地+业务迁移 玩转k8s进阶与企业级实践技能', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/138.jpg', 48.04, 38.43, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:25', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (139, 2, 'PHP实现微信公众平台开发—基础篇', '简介：本课程作为学习微信开发的基础课程，详细介绍了微信开发的准备条件，以及如何申请一个微信公众账号，并在项目应用中如何成功接入微信开发的api接口，课程由浅入深，内容详实，非常适合新手学习。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/139.jpg', 78.84, 63.07, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:26', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (140, 2, 'Java9之模块系统', '简介：该课程以一个具体实例为主线，贯穿Java 9平台模块系统实战开发的全过程。所涵盖的内容包括运行和开发环境的搭建和准备，模块系统概述，模块声明中包含的模块导出和依赖和服务，Maven项目构建，以及使用jlink创建自定义运行时镜像。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/140.jpg', 4.14, 3.31, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:26', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (141, 2, 'Python工程师面试宝典', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/141.jpg', 32.22, 25.78, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:27', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (142, 2, '新版微服务时代Spring Boot企业微信点餐系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/142.jpg', 17.33, 13.86, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:28', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (143, 2, '大话PHP设计模式', '简介：通过实际的代码演示PHP的11种面向对象设计模式实现和使用，帮助PHPer具备使用设计模式解决工程中复杂逻辑的能力，并且对OOP中松耦合、依赖倒置、可替换性、配置化等哲学有一定了解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/143.jpg', 108.44, 86.75, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:28', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (144, 2, 'JAVA遇见HTML（Servlet篇）', '简介：Servlet是JAVA Web开发的核心基础，在项目中的应用非常广泛。本门课程在JSP课程的基础上，深入介绍Servlet的基础知识。包括Servlet的执行流程和生命周期，Tomcat对Servlet的装载情况，如何获取表单数据以及Servlet路径跳转。最后会带大家使用流行的MVC架构进行项目开发。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/144.jpg', 97.57, 78.05, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:29', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (145, 2, 'Java实现验证码制作', '简介：验证码的应用十分普遍，我们经常会在网上看到数字字母组合的验证码、包含中文的验证码、以及算式形式的验证码等等。本门课程就会带大家使用Java Web中的servlet以及Jcaptcha、Kaptcha两种开源组件来实现各式各样的验证码。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/145.jpg', 77.32, 61.85, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:29', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (146, 2, 'Java实现数字签名', '简介：数字签名算法在金融领域得到广泛的应用，如网银中常用的U盾。本课程主要介绍数字签名的实现过程，以及RSA、DSA、ECDSA等几种常见的数字签名在Java中的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/146.jpg', 186.81, 149.45, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:30', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (147, 2, 'Python Flask高级编程之RESTFul API前后端分离精讲', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/147.jpg', 41.53, 33.23, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:30', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (148, 2, 'MUI+个推实现安卓与ios移动端推送', '简介：本课程将结合慕信轻聊Netty实战，整合个推到前端与后端，实现安卓与ios移动端推送。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/148.jpg', 76.45, 61.16, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:31', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (149, 2, 'Python主讲移动端自动化测试框架Appium 从基础到项目实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/149.jpg', 36.78, 29.42, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:32', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (150, 2, 'Redis入门', '简介：Redis和Jedis使用的入门级教程', 'http://oss1.wuzhaoqi.top/course/2022-06-28/150.jpg', 23.81, 19.05, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:33', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (151, 2, 'Java实现权限管理（上）', '简介：Java权限管理系列课程介绍如何使用SpringMVC+Spring来实现基于RBAC的权限管理系统。本套系列课程包括两门课程，本课程是第一门课，主要介绍什么是基于角色的访问控制（RBAC），以及数据访问层和服务层的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/151.jpg', 14.38, 11.50, NULL, '2022-03-27 19:13:18', '2022-06-28 15:43:34', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (152, 2, 'Python数据分析入门与实践', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/152.jpg', 14.04, 11.23, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:34', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (153, 2, 'Java入门第一季', '简介：本教程为Java入门第一季，欢迎来到精彩的Java编程世界！Java语言已经成为当前软件开发行业中主流的开发语言。本教程将介绍Java环境搭建、工具使用、基础语法。带领大家一步一步的踏入Java达人殿堂！Let’s go!', 'http://oss1.wuzhaoqi.top/course/2022-06-28/153.jpg', 94.39, 75.51, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:35', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (154, 2, 'C++远征之起航篇', '简介：本教程是C++的初级教程，是在C语言基础上的一个延伸，讲述了包括新增数据类型、命名空间等内容，最后通过一个通俗易懂的例子将所述知识点融会贯通，以达到知识灵活运用，最终得以升华的目的。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/154.jpg', 161.41, 129.13, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:35', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (155, 2, '看的见的算法 7个经典应用诠释算法精髓', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/155.jpg', 183.85, 147.08, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:36', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (156, 2, '解锁网络编程之NIO的前世今生', '简介：网络编程->RPC的“基石”。众所周知，网络编程有三种方式：BIO、NIO、AIO。本课程通过对BIO/NIO两种编程模型对比的形式，引入NIO的优势。后对NIO核心类进行梳理、分析。最后通过动手实践，完成一个基于NIO的多人聊天室功能。通过动手实践，来加深对NIO原理的理解，并发现NIO的不足之处，培养辩证的看待和使用NIO解决问题的能力。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/156.jpg', 85.33, 68.27, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:36', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (157, 2, 'Python操作三大主流数据库', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/157.jpg', 18.31, 14.65, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:37', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (158, 2, 'Python清洗文本数据', '简介：本课介绍数据预处理过程体系，包括数据类型与采集、文本转化与抽取、数据集成与规约、中文分词、数据清洗、特征提取与变换、特征向量化、特征降维、特征选择、可视化、词典模型、TF-IDF向量模型、主题模型等。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/158.jpg', 158.59, 126.87, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:38', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (159, 2, 'Java实现权限管理（下）', '简介：Java权限管理系列课程介绍如何使用SpringMVC+Spring来实现基于RBAC的权限管理系统。本套系列课程包括两门课程，本课程是第二门课，主要介绍权限管理系统控制层实现及优化。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/159.jpg', 14.94, 11.95, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:38', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (160, 2, 'Java高并发秒杀API之web层', '简介：本门课程是《Java实现高并发秒杀API》系列课程的第三门课，主要介绍秒杀业务Web层的设计和实现，使⽤用SpringMVC整合spring,实现秒杀restful接⼝。秒杀项目使用流行的SpringMVC+Spring+MyBatis整合框架进行开发。非常值得学习呦！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/160.jpg', 13.46, 10.77, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:39', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (161, 2, 'Java高并发秒杀API之高并发优化', '简介：本门课程是《Java实现高并发秒杀API》系列课程的第四门课，主要介绍秒杀的高并发优化，老师首先带大家分析了秒杀的瓶颈所在，然后针对瓶颈进行了优化。相信通过老师的详细介绍，小伙伴们一定可以从中受益！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/161.jpg', 135.09, 108.08, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:39', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (162, 2, 'LinuxC语言指针与内存', '简介：本课程通过图形与程序实验，配合gdb调试工具，将c语言编程中最难理解的内存管理与指针形象的展示在大家面前。由于内存地址的概念偏底层，想真正掌握还需按照课程中教授的方法多做实验以加深映像，相信反复试验几次之后，大家都能够对c语言有更加深刻的理解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/162.jpg', 137.89, 110.31, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:40', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (163, 2, 'Spark + ElasticSearch 构建电商用户标签系统实现精准营销', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/163.jpg', 108.65, 86.92, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:41', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (164, 2, 'Spring Cloud微服务安全实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/164.jpg', 10.43, 8.34, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:41', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (165, 2, '一站式学习Java网络编程 全面理解BIO/NIO/AIO', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/165.jpg', 141.24, 112.99, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:42', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (166, 2, '模式的秘密--策略模式', '简介：策略模式是在日常开发中使用最为广泛的设计模式之一。在本视频中，@Arthur 将用简单生动的例子带你领略策略模式的真意、如何用 Java 语言实现策略模式、最后还将用实际的行业案例告诉你策略模式的强大功能。小伙伴们，还等什么呢，快来加入学习吧！！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/166.jpg', 148.20, 118.56, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:42', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (167, 2, 'Servlet+Ajax实现搜索框智能提示', '简介：搜索框相信大家都不陌生，几乎每天都会在各类网站进行着搜索。有没有注意到，很多的搜索功能，当输入内容时，下面会出现提示。这类提示就叫做搜索框的智能提示，本门课程就为大家介绍如何使用Servlet和Ajax来实现。主要介绍实现原理和代码的前后台实现过程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/167.jpg', 130.28, 104.22, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:42', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (168, 2, 'Java眼中的XML-文件读取', '简介：文件的形态是千变万化的，在 Internet 中，我们通常使用一种叫做 XML 的文件来传输或者存储数据。本次课程中，@Jessica Jiang 将会带领小伙伴们把这种 XML 文件应用与 Java 程序结合起来，教你如何应用 Java“解析 XML ”。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/168.jpg', 194.39, 155.51, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:43', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (169, 2, '线程八大核心+Java并发底层原理精讲', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/169.jpg', 81.86, 65.49, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:44', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (170, 2, 'Spring Cloud Alibaba微服务从入门到进阶', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/170.jpg', 95.57, 76.46, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:44', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (171, 2, 'SpringBoot开发常用技术整合', '简介：本课程通过详细的对springboot的各个技能点逐一介绍与演示，可以很迅速的熟悉整个springboot框架体系，并且与springmvc有效的进行对比，理解异同，这样对于后续的springboot开发会非常迅速。同时课程中会针对不同的技术点进行不同的应用场景的讲解，使得学生更好的理解未来自己做项目中如何运用。另外老师的分布式课程课程《ZooKeeper分布式专题与Dubbo微服务入门》已经上线，需要的小伙伴一定不要错过~', 'http://oss1.wuzhaoqi.top/course/2022-06-28/171.jpg', 26.35, 21.08, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:49', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (172, 2, '深入浅出Java多线程', '简介：多线程是日常开发中的常用知识，也是难用知识。通过本视频，你可以了解Java中多线程相关的基本概念，如何创建，启动和停止线程？什么是正确的多线程，怎样编写多线程程序。在掌握基础之后，将为你展望进阶路线，为进一步的学习提供方向。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/172.jpg', 139.00, 111.20, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:49', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (173, 2, 'Shiro安全框架入门', '简介：本课程通过从shiro和spring Security对比入手，进而讲解Shiro整体架构以及认证，授权的过程，通过结合代码带同学更深刻的认识Shiro。同时课程会讲解Shiro其他特性，比如：Session管理，缓存管理等，以及集成Spring在实际项目中应用Shiro，使同学能在未来自己做的项目中更加熟练的使用Shiro。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/173.jpg', 57.54, 46.03, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:50', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (174, 2, 'PHP+AJAX实现表格实时编辑', '简介：php是目前最流行的网络编程语言，ajax是比较酷的一种交互技术，当两者结合在一起，就能轻松实现最好的用户体验。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/174.jpg', 87.10, 69.68, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:51', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (175, 2, 'LinuxC语言编程基本原理与实践', '简介：介绍C语言基本工作原理以及适用与C的实际开发方式，并指导童鞋们能在Linux环境下编写并运行符合实际商业开发环境下的C语言程序。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/175.jpg', 2.85, 2.28, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:51', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (176, 2, 'Python爬虫工程师必学 App数据抓取实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/176.jpg', 190.47, 152.37, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:52', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (177, 2, '学习Hyperledger Fabric实战联盟链', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/177.jpg', 7.82, 6.26, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:52', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (178, 2, 'JAVAWeb开发技术应用（监听器）', '简介：本课程从Java Web中的监听器的概念和用途入手，紧接着讲解监听器的第一个实例，然后由浅到深地从启动顺序到分类、从Servelt2.5到 Servlet3.0，重点讲解了两种分类，包括按监听的对象划分和按监听的事件划分，最后以一个实际项目中统计在线人数的案例进行讲解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/178.jpg', 40.56, 32.45, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:53', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (179, 2, 'Java分布式后台开发  Spring Boot+Kafka+HBase', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/179.jpg', 78.63, 62.91, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:53', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (180, 2, 'PHP进阶篇', '简介：通过PHP学习的进阶篇的学习，你可以对PHP的理论知识由浅入深有更深一步的掌握，这些知识能够使您更加全面的掌握PHP，从而助您在实际工作中使用PHP快速开发网站程序。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/180.jpg', 73.97, 59.18, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:54', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (181, 2, '重定向和伪静态在网站中的应用', '简介：伪静态是SEO重要的方法，通过重定向来实现，并且可以通过重定向来隐藏网站的技术，过滤异常访问。本课分为两部分，前半部分详细介绍Apache重定向的基础知识，后半部分通过多个实际案例再次加深对重定向的理解，并且会演示各种重定向设置后的实际效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/181.jpg', 64.35, 51.48, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:54', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (182, 2, 'C#面向对象编程', '简介：本系列课程主要学习c#的面向对象编的编程思想、编程技巧，以及继承、多态、静态类、接口、重载运算符、泛型和委托知识点。通过一个宠物商店的简单案例，贯穿整个课程，让学习变得轻松有趣！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/182.jpg', 26.96, 21.57, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:55', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (183, 2, 'Java高并发之魂：synchronized深度解析', '简介：高并发问题向来是Java程序员进阶的重点，也是面试的难点。想要打通高并发的奇经八脉，synchronized是你不得不趟过的坑，本课程从synchronized，从使用方法到底层原理源码，娓娓道来。还对常见面试题和更深层扩展方面的思考，做出了讲解。本课程由浅入深，适合各阶段工程师观看。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/183.jpg', 24.49, 19.59, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:56', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (184, 2, '新一代构建工具gradle', '简介：Gradle的出现，是技术发展的必然，站在了Ant、maven等构建工具的肩膀上，使用了一种强大且具有表达性的基于Groovy的领域特定语言(DSL)，使其拥有易用且灵活的方式去实现定制逻辑、方便扩展，对什么周期有更完全的控制。学习本课程后就能理解，gradle是什么，能干什么，为什么是gradle；并掌握实际使用gradle进行项目构建、测试、打包、发布的能力。Gradle让不可能变得可能，让可能变得简单，让简单变得优雅。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/184.jpg', 103.54, 82.83, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:56', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (185, 2, 'RPC框架Dubbo分布式服务调度', '简介：当前正是微服务、分布式等相关技术盛行的时代，服务与服务之间、接口与接口之间如何进行通信是每个系统架构都会面临的事情。Dubbo作为当前应用相当广泛的服务调度框架，在服务之间的通信起到了关键性的作用。本课程将以代码实战为主、理论概念为辅，一步一个脚印从认识与理解Dubbo开始到基于Spring Boot整合Dubbo搭建实际的企业级应用实战相关实际项目的典型业务场景，讲解了如何采用Dubbo发布、注册服务到注册中心Zookeeper以及如何订阅、调用服务。本课程由浅入深，适合各阶段工程师、程序员观看。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/185.jpg', 66.04, 52.83, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:57', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (186, 2, '高性能的PHP日志系统—SeasLog', '简介：SeasLog是一个C语言编写的PHP扩展，提供一组规范标准的功能函数，在PHP项目中方便、规范、高效地写日志，以及快速地读取和查询日志。本课程将带你全面细致地了解SeasLog。对于视频中提到的 SeasLog的不足，已经在最新版本中进行了修复，欢迎体验使用', 'http://oss1.wuzhaoqi.top/course/2022-06-28/186.jpg', 33.60, 26.88, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:58', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (187, 2, '快速入门ThinkPHP5.0-模型篇', '简介：一个标准的网站一定离不开数据库的操作，在本套课程中我和你一起来揭开ThinkPHP5 数据操作的神秘面纱，和你一起愉快的使用 ThinkPHP5 操作数据库，让数据库操作变的更愉悦。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/187.jpg', 151.98, 121.59, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:59', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (188, 2, 'Java SSM快速开发仿慕课网在线教育平台', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/188.jpg', 8.02, 6.42, NULL, '2022-03-27 19:13:19', '2022-06-28 15:43:59', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (189, 2, '细说Java多线程之内存可见性', '简介：本课程带领大家深层次学习Java中的内存可见性、Java内存模型、指令重排序、as-if-serial语义等多线程中偏向底层的一些知识，以及synchronized和volatile实现内存可见性的原理和方法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/189.jpg', 85.98, 68.79, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:00', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (190, 2, '全面系统python3入门+进阶 小白也能听懂 (万人甄选口碑好课)', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/190.jpg', 61.99, 49.59, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:00', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (191, 2, 'Yii框架不得不说的故事（基础篇）', '简介：YII是目前比较火的框架，框架里面使用了最新的技术和设计，可以说学习了YII就学习了最新的php技术，本课程主要学习YII的安装和mvc的基本使用方式，为后面学习YII的快速、安全、专业的特性打下基础。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/191.jpg', 125.68, 100.54, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:01', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (192, 2, 'Java通用型支付+电商平台双系统实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/192.jpg', 190.85, 152.68, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:02', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (193, 2, 'Python文件处理', '简介：任何语言都离不开对文件的操作，Python语言是如何来操作和管理文件的。今天就让我们带您走入文件的世界，一起创建文件，一起读写文件，一起管理我们的文件。掌握文件的基本概念、基本操作，了解文件属性、 linux 系统的文件管理机制及os模块对文件和目录的处理等相关内容。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/193.jpg', 31.70, 25.36, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:02', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (194, 2, '数据结构探险之树篇', '简介：课程从树的实现原理角度讲解了树的相关概念，着重讲解了二叉树三种遍历方式的原理，并通过编码实践，进一步说明二叉树使用数组和链表方式的编程技巧，以及前序遍历、中序遍历和后序遍历递归实现', 'http://oss1.wuzhaoqi.top/course/2022-06-28/194.jpg', 108.04, 86.43, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:03', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (195, 2, 'SpringBoot2.0深度实践-初遇SpringBoot', '简介：目前业界最流行的微服务架构正在或者已被各种规模的互联网公司广泛接受和认可，业已成为互联网开发人员必备技术。无论是互联网、云计算还是大数据Java平台已成为全栈的生态体系，其重要性几乎不可替代。Spring Boot作为微服务的基础设施之一，背靠强大的Spring 生态社区，支撑Spring Cloud技术体系。本课程通过实战的方式，从单一应用开发升级为多模块应用开发。根据不同的部署场景，构建不同格式的打包文件，以及在开发和部署阶段，执行不同的运行方式。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/195.jpg', 138.09, 110.47, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:03', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (196, 2, 'C#开发轻松入门', '简介：本门课程是C#语言的入门教程，在课程中，将从.NET平台和C#的基本概念开始，深入的介绍C#开发的基础语法、简单程序逻辑、Visual Studio工具的使用技巧以及常用的算法的实现。同时，也希望通过与课程相关的练习题和编程练习，帮助小伙伴们快速步入C#语言的大门。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/196.jpg', 152.17, 121.74, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:04', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (197, 2, '基于SSH实现员工管理系统之案例实现篇', '简介：本案例介绍如何使用Struts2+Hibernate+Spring框架实现员工管理系统，本套案例课程分为框架整合篇和案例实现篇，学习本门课程前请先学习《基于SSH实现员工管理系统之框架整合篇》。本门课程主要介绍员工管理系统案例是如何实现的！包括部门管理和员工管理两个功能模块。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/197.jpg', 149.91, 119.93, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:05', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (198, 2, '初识Python', '简介：Python教程基础分《Python入门》和《Python进阶》两门课程，本视频教程是Python第一门课程，是Python开发的入门教程，将介绍Python语言的特点和适用范围，Python基本的数据类型，条件判断和循环，函数，以及Python特有的切片和列表生成式。希望本python教程能够让您快速入门并编写简单的Python程序。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/198.jpg', 11.05, 8.84, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:14', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (199, 2, 'PHPExcel探索之旅', '简介：PHPExcel是PHP语言操作Excel文件最强大的一个工具，也是身为一个PHPer的必备技能。本课程将带领大家全面解析PHPexcel的导入导出、样式控制、图形报表操作，帮助大家在今后工作中玩转任何文件操作需求。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/199.jpg', 8.90, 7.12, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:15', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (200, 2, '从零起步 系统入门Python爬虫工程师', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/200.jpg', 19.56, 15.65, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:16', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (201, 2, '全面解析Java注解', '简介：在项目开发中，注解的使用无处不在。注解的使用简化了代码，减少了程序员的工作量。本课程带领小伙伴们全面认识Java的注解，包括为什么使用注解、Java中的常见注解、注解的分类和如何自定义注解，最后通过一个实战案例来演示注解在实际项目中的应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/201.jpg', 191.77, 153.42, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:16', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (202, 2, '仿微信抢红包  Golang实战多版本抢红包系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/202.jpg', 3.78, 3.03, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:17', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (203, 2, 'PHP项目中的Gitflow多人协作开发工作流', '简介：在PHP项目开发过程中，版本管理已经是不可或缺的手段和工具，而目前最流行的版本管理工具中，Git无疑是最好的选择。那么如何合理、高效的使用这个工具呢？如果你已经了解了Git的基本用法，就让我们来一睹Gitflow的风采吧。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/203.jpg', 48.20, 38.56, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:17', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (204, 2, 'Go语言开发分布式任务调度 轻松搞定高性能Crontab', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/204.jpg', 56.99, 45.59, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:18', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (205, 2, 'Hibernate注解', '简介：注解在Java程序开发中的应用越来越广泛，可以有效地提高代码的简洁度。本门课程主要介绍Hibernate的常用注解，包括类级别注解、属性级别注解和关联映射注解。希望小伙伴们学习完本门课程后，能够灵活应用Hibernate注解进行开发。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/205.jpg', 76.22, 60.98, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:19', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (206, 2, 'django入门与实践', '简介：Django作为一个Python的高级Web框架，功能非常强大，其自身封装了大量底层逻辑，并实现了ORM，同时，MVT结构保证了代码结构的完整性，这一切给了开发人员巨大的便利，让Web开发变得高效且简洁。课程将以一个极简的博客网站为例，带领大家充分领略Django的魅力', 'http://oss1.wuzhaoqi.top/course/2022-06-28/206.jpg', 47.35, 37.88, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:19', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (207, 2, '走进Python量化交易入门篇', '简介：本课程是一门基于Python的量化交易基础学习课程，针对于具备Python编程基础、正准备踏入量化交易行业的人群而开设，课程不仅涉及到对量化交易发展和认识的介绍，也通过详细的案例讲解Python第三方数据分析工具Pandas库在股票数据获取和处理应用方法，以深入浅出的方式帮助大家从基础学习开启Python量化交易之路。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/207.jpg', 58.19, 46.55, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:20', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (208, 2, 'Java模板引擎之Freemarker', '简介：在web开发框架中，MVC模式是最常用的设计模式。企业web应用基本都会用到。Freemarker的设计可以用来生成HTML。它语法简单、功能强大、灵活，宏模板可复用，是互联网前端很常用的技术。而且Spring对Freemarker的整合也很nice。所以是web开发人员必要掌握的技术之一。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/208.jpg', 51.73, 41.39, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:21', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (209, 2, 'SpringBoot进阶之Web进阶', '简介：《2小时学习Spring Boot》后续进阶课程，主要讲述了Spring Boot针对Web方面的相关技巧,讲师实战课程《Spring Boot微信点餐系统》\nhttp://coding.imooc.com/class/117.html\n《Spring Cloud微服务实战》\nhttp://coding.imooc.com/class/187.html 均已上线', 'http://oss1.wuzhaoqi.top/course/2022-06-28/209.jpg', 126.65, 101.32, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:21', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (210, 2, 'SpringMVC起步', '简介：Spring MVC为我们提供了一个基于组件和松耦合的MVC实现框架。在使用Java中其它MVC框架多年之后，面对Spring MVC有一种相见恨晚的感觉。Spring MVC是如此的优雅，轻盈与简洁， 让人从其它框架的桎梏解脱出来。本课程将带你步入Spring MVC。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/210.jpg', 92.93, 74.34, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:22', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (211, 2, 'Spring Boot2.0不容错过的新特性 WebFlux响应式编程', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/211.jpg', 38.42, 30.73, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:22', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (212, 2, 'PHP入门篇', '简介：本教程带领大家轻松学习PHP基础知识，了解PHP中的变量、变量的类型、常量等概念，认识PHP中的运算符，通过本教程学习能够掌握PHP中顺序结构、条件结构、循环结构三种语言结构语句。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/212.jpg', 14.82, 11.85, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:23', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (213, 2, 'python进阶', '简介：Python基础分《Python入门》和《Python进阶》两门课程，《Python进阶》是第二门课程，学习该课程前，请先学习《Python入门》,效果会更好。《Python进阶》课程详细介绍Python强大的函数式编程和面向对象编程，掌握Python高级程序设计的方法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/213.jpg', 150.11, 120.08, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:24', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (214, 2, '全面掌握DjangoORM', '简介：Django的一个强大的功能是它的对象关系映射Object-Relational Mapping（ORM），它允许你就像使用 SQL一样去和你的数据库交互，本课程将以Django官方文档为依据，通过开发讲师、课程、学生、助教四个模型类，给大家完整透彻的讲解Django ORM知识体系，为更高级的开发打下坚实基础。课程源码：https://github.com/liaogx/imooc', 'http://oss1.wuzhaoqi.top/course/2022-06-28/214.jpg', 76.46, 61.17, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:24', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (215, 2, 'Google资深工程师深度讲解Go语言', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/215.jpg', 6.95, 5.56, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:25', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (216, 2, 'Python3入门机器学习 经典算法与应用 轻松入行人工智能', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/216.jpg', 73.32, 58.66, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:26', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (217, 2, 'Hibernate初探之一对多映射', '简介：现实世界中的对象很少有孤立存在的，例如学生，往往与所在班级和授课老师之间存在关联关系。在本次课程中，@laurenyang将带领小伙伴们一起学习Hibernate中的关联映射——一对多映射，会依次向大家介绍单向一对多和单向多对一的配置，以及cascade和inverse属性的作用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/217.jpg', 178.38, 142.70, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:27', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (218, 2, '数据结构探险—栈篇', '简介：本课程将带领大家体会栈这种数据结构的美妙，并详细讲解从单一数据类型栈到栈模板的升华过程，最后安排数制转换及括号匹配的例子，使学员可以通过例子对栈的知识有更深刻的理解和认识，所有知识均通过编码实践的方式讲解到操作层面，力求即学即会。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/218.jpg', 122.88, 98.31, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:27', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (219, 2, '模式的秘密-单例模式', '简介：设计模式是前辈们在多年开发工作中经验的总结，可以提高代码的可重用性、可靠性和规范性，让代码更容易理解，而单例模式是在Java中最重要、最简单、最常用的设计模式之一，让我们一起来揭开它的神秘面纱吧。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/219.jpg', 52.95, 42.36, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:28', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (220, 2, '初识Java微信公众号开发', '简介：微信拥有庞大的用户基础，微信公众号的相关开发也比较热门，本套课程就带领大家进入Java微信公众号开发的精彩世界，学习微信公众号开发的相关概念，编辑模式和开发模式应用，以及百度BAE的使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/220.jpg', 181.19, 144.95, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:36', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (221, 2, 'Java实现SSO单点登录', '简介：本课程首先以新浪为例介绍了单点登录SSO的实现场景，然后对实现SSO所用的核心技术和原理进行分析，最后通过案例演示了同域SSO和跨域SSO的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/221.jpg', 196.91, 157.53, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:36', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (222, 2, 'PHP中的会话控制', '简介：完整简介：我们都知道HTTP是无状态协议，那在WEB开发中我们如何让服务器知道你是你，就需要用到会话控制技术。本课程带你了解PHP中如何实现会话控制。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/222.jpg', 113.50, 90.80, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:37', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (223, 2, '告别996，开启Java高效编程之门', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/223.jpg', 95.93, 76.74, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:38', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (224, 2, 'JAVA遇见HTML（JSP篇）', '简介：亲，这里有资深讲师为初学者量身打造的Java Web入门级课程JSP，讲师将通过大量的案例向您展示JavaWeb开发环境搭建、工具使用和JSP的基本语法，深入理解Java Web开发思想，最终使您能独立开发简单的Java Web应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/224.jpg', 130.20, 104.16, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:39', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (225, 2, 'C++远征之继承篇', '简介：本课程将带领大家体会C++面向对象三大特性中的继承特性，讲述了基类、派生类的概念，公有继承、保护继承和私有继承、多重继承及多继承，虚析构函数及虚继承的作用，理解课程内容对于面向对象的学习将大有裨益，所有知识均通过编码实践的方式讲解到操作层面，力求即学即会。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/225.jpg', 49.89, 39.92, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:39', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (226, 2, 'PhpStorm的基本应用', '简介：PhpStorm是PHP集成开发工具，能提高我们的开发效率，提供智能代码补全，快速导航以及即时错误检查。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/226.jpg', 52.77, 42.21, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:40', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (227, 2, 'Python人工智能常用库Numpy使用入门', '简介：人工智能的很多方关于数据的操作，机器学习，深度学习，大数据，数据分析等，或多或少都会用到numpy这一python工具库。本课程从搭建环境开始，从anaconda，jupyter notebook，再到课程重点numpy工具库的使用，让你快速掌握这一热门框架。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/227.jpg', 42.44, 33.95, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:41', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (228, 2, 'Java分页原理与实践（上）', '简介：    分页功能是系统和应用最基本的组成部分。本课程通过总结常见的分页样式以及分析对比分页原理以及实现方式，通过代码实例，让你轻松学会分页功能的开发。通过学习本课程，你也能轻松的实现facebook，QQ空间，京东商城\n等分页的效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/228.jpg', 103.88, 83.10, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:41', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (229, 2, 'Google老师亲授 TensorFlow2.0 入门到进阶', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/229.jpg', 129.24, 103.39, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:42', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (230, 2, 'PHP+Sphinx+MySQL实现全文检索（理论篇）', '简介：课程通过mysql搜索引入sphinx检索，让大家对sphinx有新的认知，并介绍了当前互联网站内应用sphinx检索优势，课程循序渐进，通俗易懂，对重点难点技术做了详细讲解,通过学习本课程我们能熟练的使用sphinx工具。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/230.jpg', 160.24, 128.19, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:43', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (231, 2, '版本管理工具介绍—Git篇', '简介：本课程主要讲解了git在各平台的安装和基本使用，Git能够帮助我们解决文件的提交、检出、回溯历史、冲突解决、多人协作模式等问题，并且大大提升我们的工作效率。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/231.jpg', 103.57, 82.85, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:43', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (232, 2, 'Google面试官亲授-Java面试新手尊享课', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/232.jpg', 84.62, 67.70, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:44', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (233, 2, '新一代大数据计算引擎  Flink从入门到实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/233.jpg', 29.89, 23.91, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:44', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (234, 2, 'SpringMVC+Spring+Hibernate开发人员信息管理功能', '简介：本课程通过人员信息管理功能的开发，来介绍在实际项目中广泛应用的SpringMVC、Spring和Hibernate三大框架的整合。主要内容包括：案例演示、整体设计和代码实现，通过案例的学习还可以体会项目的实现流程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/234.jpg', 108.90, 87.12, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:45', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (235, 2, '应用Dubbo框架打造仿猫眼项目 理解微服务核心思想', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/235.jpg', 164.24, 131.39, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:45', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (236, 2, 'Yii框架不得不说的故事—扩展篇（4）', '简介：YII是目前比较火的框架，框架里面使用了最新的技术和设计，可以说学习了YII就学习了最新的php技术，本课程主要学习模块、事件机制、mixin以及依赖注入技术，可以让程序拥有更好的扩展性，更能够适应需求的变化。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/236.jpg', 197.62, 158.10, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:46', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (237, 2, 'Python-面向对象', '简介：面向对象是目前编程语言里面非常主流的一种思想。Python对于面向对象有非常好的实现。同时，借助Python灵活的语法，可以实现一些很酷的面向对象特性。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/237.jpg', 85.72, 68.57, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:46', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (238, 2, 'Django+小程序技术打造微信小程序助手', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/238.jpg', 132.82, 106.26, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:47', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (239, 2, 'C语言入门', '简介：本C语言教程从以下几个模块来贯穿主要知识点：初始C程序、数据类型、运算符、语句结构、函数和数组。每个阶段都配有练习题同时提供在线编程任务。希望通过本教程帮助C语言入门学习者迅速掌握程序逻辑并开始C语言编程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/239.jpg', 80.58, 64.47, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:48', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (240, 2, 'Tornado从入门到进阶 打造支持高并发的技术论坛', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/240.jpg', 155.46, 124.37, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:48', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (241, 2, 'Java实现邮箱验证', '简介：本课程主要介绍如何使用JavaMail进行邮箱验证！首先会介绍邮件收发过程和环境搭建；然后介绍如何用代码实现邮箱验证，包括用户注册的实现和发送邮件激活等功能！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/241.jpg', 187.81, 150.24, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:49', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (242, 2, '通过自动回复机器人学Mybatis（加强版）', '简介：你是愿意停留在仅仅会使用 Mybatis 的层次上，还是愿意与我一起揭开 Mybatis 面纱，看看背后的故事？本课程将继续上一课程中的案例来介绍Java中 Mybatis 的功能，与上一课程不同的是：本课程在介绍功能的同时，尽可能多的介绍 Mybatis 源码。,源生活老师实战课程《Java SSM定制大众点评后台》：http://coding.imooc.com/class/105.html\n也已上线，Mybatis结合复杂SQL，尽在其中。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/242.jpg', 35.06, 28.05, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:50', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (243, 2, 'RabbitMQ消息中间件技术精讲', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/243.jpg', 21.85, 17.48, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:50', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (244, 2, 'Python异步任务队列Celery使用', '简介：Python中Celery 的基本用法以及Django 结合 Celery 的使用', 'http://oss1.wuzhaoqi.top/course/2022-06-28/244.jpg', 153.07, 122.46, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:51', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (245, 2, 'Git入门', '简介：本课程主要通过命令行和图形界面工具来介绍Git的安装、仓库创建、工作流、远程仓库、克隆仓库、标签管理和分支管理等Git的主要内容。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/245.jpg', 130.83, 104.66, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:51', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (246, 2, 'JAVA实现对称加密', '简介：本门课程是Java加解密系列课程的第三门课，学习前需要学习《Java实现Base64加密》。对称加密指加密和解密使用相同密钥的加密算法。本课程中将介绍DES、3重DES、AES和PBE几种常见的对称加密算法在Java中的实现，以及他们的应用范围。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/246.jpg', 41.09, 32.87, NULL, '2022-03-27 19:13:19', '2022-06-28 15:44:59', 0, 2, 2, NULL);
INSERT INTO `course` VALUES (247, 2, 'MySQL5.7版本新特性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/247.jpg', 69.10, 55.28, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:00', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (248, 2, 'MongoDB复制集技术内幕', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/248.jpg', 116.44, 93.15, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:01', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (249, 2, 'MongoDB数据库备份策略/OpsManager', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/249.jpg', 85.91, 68.73, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:01', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (250, 2, 'MongoDBDBA的日常巡检及执行计划分析', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/250.jpg', 167.03, 133.63, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:02', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (251, 2, 'MySQL5.7复制功能实战', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/251.jpg', 21.11, 16.88, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:02', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (252, 2, 'MongoDB复制集—容灾核心选举', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/252.jpg', 170.74, 136.59, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:03', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (253, 2, 'Java项目面试实操 提升大厂面试成功率', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/253.jpg', 182.17, 145.74, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:04', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (254, 2, 'Redis5.0之12项新特性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/254.jpg', 149.00, 119.20, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:04', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (255, 2, 'MongoDB复制集—复制集的相关特性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/255.jpg', 133.09, 106.48, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:05', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (256, 2, 'PHP开发APP接口', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/256.jpg', 11.72, 9.38, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:05', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (257, 2, '阿里新零售数据库设计与实战 （升级版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/257.jpg', 105.84, 84.67, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:06', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (258, 2, '全流程开发 GO实战电商网站高并发秒杀系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/258.jpg', 3.34, 2.67, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:06', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (259, 2, '聚焦Java性能优化 打造亿级流量秒杀系统（附赠秒杀项目）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/259.jpg', 28.34, 22.67, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:07', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (260, 2, '轻松愉快之玩转SpringData', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/260.jpg', 25.28, 20.22, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:07', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (261, 2, 'MongoDB复制集—复制集监控', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/261.jpg', 99.06, 79.25, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:08', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (262, 2, 'Oracle触发器', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/262.jpg', 150.40, 120.32, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:09', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (263, 2, 'MongoDB4.0新特性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/263.jpg', 168.28, 134.62, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (264, 2, 'MySQL开发技巧（三）', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/264.jpg', 110.21, 88.17, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (265, 2, 'MongoDB集群之分片技术应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/265.jpg', 133.43, 106.74, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:11', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (266, 2, 'MongoDB复制集—快速搭建复制集', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/266.jpg', 158.13, 126.51, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (267, 2, '玩转MySQL8.0新特性', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/267.jpg', 46.10, 36.88, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (268, 2, 'Python操作三大主流数据库', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/268.jpg', 138.49, 110.79, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:13', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (269, 2, '高性能可扩展MySQL数据库设计及架构优化电商项目', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/269.jpg', 138.92, 111.13, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:13', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (270, 2, 'MySQL开发技巧（一）', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/270.jpg', 143.33, 114.66, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (271, 2, '零基础入门 全角度解读企业主流数据库MySQL8.0', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/271.jpg', 194.08, 155.26, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:15', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (272, 2, 'MySQL数据库集群-PXC方案', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/272.jpg', 71.14, 56.91, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:15', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (273, 2, 'MongoDB如何测试调整及监控性能', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/273.jpg', 125.16, 100.13, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:16', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (274, 2, 'redis计数器与数量控制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/274.jpg', 141.09, 112.87, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:17', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (275, 2, '性能优化之MySQL优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/275.jpg', 169.02, 135.21, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:17', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (276, 2, 'Go语言开发分布式任务调度 轻松搞定高性能Crontab', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/276.jpg', 23.30, 18.64, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:18', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (277, 2, 'redis的入门与应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/277.jpg', 74.40, 59.52, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:19', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (278, 2, 'Oracle数据库开发必备利器之SQL基础', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/278.jpg', 54.70, 43.76, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:19', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (279, 2, 'Duang~MySQLi扩展库来袭', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/279.jpg', 123.98, 99.18, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:20', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (280, 2, 'MongoDB复制集—复制集安全', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/280.jpg', 85.99, 68.79, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:21', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (281, 2, 'MySQL晋级指南 - 全面讲解MySQL架构设计', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/281.jpg', 182.27, 145.82, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:21', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (282, 2, '中高级开发晋升利器 MySQL面试指南', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/282.jpg', 90.77, 72.62, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:22', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (283, 2, 'Spring Cloud微服务实战 打造企业级优惠券系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/283.jpg', 174.77, 139.82, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:23', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (284, 2, 'MySQL集群（PXC）入门', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/284.jpg', 33.07, 26.45, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:23', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (285, 2, '一站式学习Redis  从入门到高可用分布式实践', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/285.jpg', 176.35, 141.08, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:24', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (286, 2, 'Oracle数据库开发必备利器之PL/SQL基础', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/286.jpg', 182.82, 146.26, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:25', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (287, 2, 'Oracle存储过程和自定义函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/287.jpg', 126.18, 100.95, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (288, 2, '数据库设计那些事', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/288.jpg', 168.15, 134.52, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (289, 2, 'MySQL开发技巧（二）', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/289.jpg', 51.36, 41.09, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:27', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (290, 2, 'Oracle高级查询', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/290.jpg', 11.56, 9.25, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:28', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (291, 2, 'Golang微信小程序微商城系统原型', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/291.jpg', 35.44, 28.35, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:28', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (292, 2, '玩转MongoDB4.0(最新版) 从入门到实践', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/292.jpg', 99.59, 79.67, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (293, 2, 'MongoDB复制集—认识复制集', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/293.jpg', 26.29, 21.03, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (294, 2, 'PHP消息队列实现及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/294.jpg', 41.30, 33.04, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:30', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (295, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/295.jpg', 159.45, 127.56, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:31', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (296, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/296.jpg', 170.75, 136.60, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:31', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (297, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/297.jpg', 50.47, 40.38, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:32', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (298, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/298.jpg', 109.04, 87.23, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:32', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (299, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/299.jpg', 57.69, 46.15, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:33', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (300, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/300.jpg', 18.30, 14.64, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:33', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (301, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/301.jpg', 164.01, 131.21, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:34', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (302, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/302.jpg', 126.81, 101.45, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:34', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (303, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/303.jpg', 3.68, 2.94, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:35', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (304, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/304.jpg', 83.16, 66.53, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:36', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (305, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/305.jpg', 52.59, 42.07, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (306, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/306.jpg', 187.29, 149.83, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (307, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/307.jpg', 196.17, 156.94, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:38', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (308, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/308.jpg', 56.42, 45.14, NULL, '2022-03-27 19:15:35', '2022-06-28 15:45:39', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (309, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/309.jpg', 27.46, 21.97, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:39', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (310, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/310.jpg', 199.20, 159.36, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (311, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/311.jpg', 154.72, 123.78, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (312, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/312.jpg', 7.24, 5.79, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:41', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (313, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/313.jpg', 8.56, 6.85, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:42', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (314, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/314.jpg', 121.25, 97.00, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:42', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (315, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/315.jpg', 134.68, 107.74, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:43', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (316, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/316.jpg', 109.87, 87.90, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:44', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (317, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/317.jpg', 91.80, 73.44, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:44', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (318, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/318.jpg', 111.94, 89.56, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:45', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (319, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/319.jpg', 3.09, 2.47, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:45', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (320, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/320.jpg', 63.87, 51.10, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:46', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (321, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/321.jpg', 141.57, 113.25, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:46', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (322, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/322.jpg', 67.52, 54.01, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:47', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (323, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/323.jpg', 179.67, 143.74, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:48', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (324, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/324.jpg', 84.68, 67.74, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:48', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (325, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/325.jpg', 164.73, 131.79, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:49', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (326, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/326.jpg', 81.53, 65.22, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:50', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (327, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/327.jpg', 165.91, 132.72, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:50', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (328, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/328.jpg', 130.68, 104.54, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:51', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (329, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/329.jpg', 195.11, 156.09, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:51', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (330, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/330.jpg', 126.73, 101.39, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:52', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (331, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/331.jpg', 60.62, 48.50, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:53', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (332, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/332.jpg', 28.74, 22.99, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:53', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (333, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/333.jpg', 45.14, 36.11, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:54', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (334, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/334.jpg', 133.79, 107.04, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (335, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/335.jpg', 91.76, 73.41, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (336, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/336.jpg', 161.72, 129.38, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:56', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (337, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/337.jpg', 166.52, 133.22, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:56', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (338, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/338.jpg', 21.02, 16.82, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:57', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (339, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/339.jpg', 181.75, 145.40, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:58', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (340, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/340.jpg', 189.59, 151.67, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:58', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (341, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/341.jpg', 2.04, 1.64, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:59', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (342, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/342.jpg', 115.68, 92.55, NULL, '2022-03-27 19:15:36', '2022-06-28 15:45:59', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (343, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/343.jpg', 107.95, 86.36, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:00', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (344, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/344.jpg', 89.90, 71.92, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:01', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (345, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/345.jpg', 8.13, 6.51, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:01', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (346, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/346.jpg', 199.60, 159.68, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:02', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (347, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/347.jpg', 119.64, 95.71, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:03', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (348, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/348.jpg', 24.12, 19.30, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:03', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (349, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/349.jpg', 180.90, 144.72, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:04', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (350, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/350.jpg', 110.57, 88.46, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:04', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (351, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/351.jpg', 129.66, 103.73, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:09', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (352, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/352.jpg', 162.84, 130.27, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:09', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (353, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/353.jpg', 27.98, 22.38, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (354, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/354.jpg', 35.91, 28.73, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (355, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/355.jpg', 11.35, 9.08, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:11', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (356, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/356.jpg', 35.91, 28.73, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (357, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/357.jpg', 94.32, 75.45, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (358, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/358.jpg', 145.54, 116.43, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:13', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (359, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/359.jpg', 100.56, 80.45, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (360, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/360.jpg', 13.12, 10.50, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (361, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/361.jpg', 172.23, 137.78, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:15', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (362, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/362.jpg', 29.58, 23.67, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:16', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (363, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/363.jpg', 127.44, 101.95, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:25', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (364, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/364.jpg', 165.97, 132.78, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (365, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/365.jpg', 4.14, 3.31, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (366, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/366.jpg', 128.82, 103.05, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:27', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (367, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/367.jpg', 84.46, 67.57, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:28', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (368, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/368.jpg', 13.53, 10.82, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:28', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (369, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/369.jpg', 21.26, 17.00, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (370, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/370.jpg', 176.45, 141.16, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (371, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/371.jpg', 174.55, 139.64, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:30', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (372, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/372.jpg', 112.72, 90.18, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:31', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (373, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/373.jpg', 52.03, 41.63, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:31', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (374, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/374.jpg', 5.68, 4.54, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:32', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (375, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/375.jpg', 177.41, 141.93, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:32', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (376, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/376.jpg', 118.19, 94.55, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:33', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (377, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/377.jpg', 181.46, 145.17, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:34', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (378, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/378.jpg', 119.91, 95.92, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:34', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (379, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/379.jpg', 122.00, 97.60, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:35', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (380, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/380.jpg', 6.97, 5.58, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:36', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (381, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/381.jpg', 45.54, 36.44, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:36', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (382, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/382.jpg', 171.14, 136.91, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (383, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/383.jpg', 59.93, 47.94, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (384, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/384.jpg', 40.31, 32.25, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:38', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (385, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/385.jpg', 4.81, 3.85, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:39', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (386, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/386.jpg', 146.96, 117.57, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:39', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (387, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/387.jpg', 196.93, 157.55, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (388, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/388.jpg', 117.66, 94.12, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (389, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/389.jpg', 56.63, 45.30, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:41', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (390, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/390.jpg', 27.62, 22.10, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:42', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (391, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/391.jpg', 58.72, 46.97, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:42', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (392, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/392.jpg', 67.38, 53.90, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:43', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (393, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/393.jpg', 18.14, 14.51, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:43', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (394, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/394.jpg', 142.15, 113.72, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:44', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (395, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/395.jpg', 142.57, 114.06, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:45', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (396, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/396.jpg', 114.12, 91.30, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:45', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (397, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/397.jpg', 39.78, 31.82, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:46', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (398, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/398.jpg', 26.00, 20.80, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:46', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (399, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/399.jpg', 37.59, 30.07, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:47', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (400, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/400.jpg', 64.48, 51.59, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:48', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (401, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/401.jpg', 94.32, 75.46, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:48', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (402, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/402.jpg', 62.71, 50.17, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:49', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (403, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/403.jpg', 84.13, 67.31, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:50', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (404, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/404.jpg', 60.76, 48.61, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:50', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (405, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/405.jpg', 126.67, 101.34, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:51', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (406, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/406.jpg', 178.15, 142.52, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:51', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (407, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/407.jpg', 86.97, 69.58, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:52', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (408, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/408.jpg', 66.71, 53.36, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:52', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (409, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/409.jpg', 47.23, 37.78, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:53', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (410, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/410.jpg', 148.19, 118.56, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:54', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (411, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/411.jpg', 196.86, 157.49, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:54', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (412, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/412.jpg', 169.78, 135.83, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (413, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/413.jpg', 104.49, 83.59, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (414, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/414.jpg', 79.50, 63.60, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:56', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (415, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/415.jpg', 31.63, 25.31, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:56', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (416, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/416.jpg', 111.19, 88.95, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:57', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (417, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/417.jpg', 182.58, 146.06, NULL, '2022-03-27 19:15:36', '2022-06-28 15:46:58', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (418, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/418.jpg', 127.86, 102.29, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:07', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (419, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/419.jpg', 20.76, 16.61, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:07', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (420, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/420.jpg', 187.83, 150.26, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:08', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (421, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/421.jpg', 34.80, 27.84, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:09', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (422, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/422.jpg', 129.60, 103.68, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (423, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/423.jpg', 26.07, 20.85, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (424, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/424.jpg', 9.79, 7.83, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:11', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (425, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/425.jpg', 186.69, 149.35, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:11', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (426, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/426.jpg', 139.15, 111.32, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (427, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/427.jpg', 116.60, 93.28, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (428, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/428.jpg', 142.32, 113.86, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:13', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (429, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/429.jpg', 20.17, 16.14, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (430, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/430.jpg', 89.24, 71.39, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (431, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/431.jpg', 157.17, 125.73, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:15', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (432, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/432.jpg', 13.05, 10.44, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:16', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (433, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/433.jpg', 185.14, 148.11, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:16', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (434, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/434.jpg', 120.41, 96.33, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:17', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (435, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/435.jpg', 7.57, 6.05, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:18', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (436, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/436.jpg', 23.26, 18.60, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:18', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (437, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/437.jpg', 175.45, 140.36, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:19', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (438, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/438.jpg', 162.22, 129.78, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:19', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (439, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/439.jpg', 23.63, 18.90, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:20', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (440, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/440.jpg', 166.23, 132.99, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:21', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (441, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/441.jpg', 53.47, 42.78, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:21', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (442, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/442.jpg', 91.34, 73.08, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:22', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (443, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/443.jpg', 1.33, 1.07, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:22', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (444, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/444.jpg', 26.23, 20.98, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:23', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (445, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/445.jpg', 110.77, 88.62, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:23', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (446, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/446.jpg', 40.15, 32.12, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:24', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (447, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/447.jpg', 111.69, 89.36, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:25', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (448, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/448.jpg', 8.31, 6.65, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (449, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/449.jpg', 111.78, 89.42, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (450, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/450.jpg', 184.22, 147.38, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:27', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (451, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/451.jpg', 136.85, 109.48, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:27', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (452, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/452.jpg', 32.48, 25.99, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:28', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (453, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/453.jpg', 83.37, 66.70, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (454, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/454.jpg', 198.54, 158.83, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (455, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/455.jpg', 36.68, 29.34, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:30', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (456, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/456.jpg', 114.54, 91.63, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:35', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (457, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/457.jpg', 185.40, 148.32, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:36', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (458, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/458.jpg', 139.36, 111.49, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (459, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/459.jpg', 150.51, 120.41, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (460, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/460.jpg', 51.80, 41.44, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:38', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (461, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/461.jpg', 25.12, 20.10, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:38', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (462, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/462.jpg', 182.41, 145.93, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (463, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/463.jpg', 169.91, 135.93, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (464, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/464.jpg', 33.53, 26.83, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:41', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (465, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/465.jpg', 63.67, 50.94, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:41', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (466, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/466.jpg', 28.02, 22.42, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:51', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (467, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/467.jpg', 6.22, 4.98, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:52', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (468, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/468.jpg', 3.91, 3.13, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:52', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (469, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/469.jpg', 102.95, 82.36, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:53', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (470, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/470.jpg', 69.81, 55.85, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:53', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (471, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/471.jpg', 20.53, 16.43, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:54', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (472, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/472.jpg', 19.56, 15.64, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (473, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/473.jpg', 38.73, 30.99, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (474, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/474.jpg', 16.05, 12.84, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:56', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (475, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/475.jpg', 183.84, 147.08, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:57', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (476, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/476.jpg', 64.35, 51.48, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:57', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (477, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/477.jpg', 119.08, 95.27, NULL, '2022-03-27 19:15:36', '2022-06-28 15:47:58', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (478, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/478.jpg', 151.38, 121.11, NULL, '2022-03-27 19:15:37', '2022-06-28 15:47:58', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (479, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/479.jpg', 191.75, 153.40, NULL, '2022-03-27 19:15:37', '2022-06-28 15:47:59', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (480, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/480.jpg', 10.80, 8.64, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:00', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (481, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/481.jpg', 56.47, 45.17, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:00', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (482, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/482.jpg', 31.50, 25.20, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:01', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (483, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/483.jpg', 170.60, 136.48, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:01', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (484, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/484.jpg', 50.38, 40.30, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:02', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (485, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/485.jpg', 108.21, 86.57, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:03', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (486, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/486.jpg', 114.42, 91.54, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:03', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (487, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/487.jpg', 181.02, 144.82, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:04', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (488, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/488.jpg', 154.46, 123.57, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:04', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (489, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/489.jpg', 61.61, 49.28, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:05', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (490, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/490.jpg', 49.62, 39.69, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:05', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (491, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/491.jpg', 49.96, 39.97, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:06', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (492, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/492.jpg', 172.93, 138.35, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:07', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (493, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/493.jpg', 138.54, 110.83, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:08', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (494, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/494.jpg', 69.55, 55.64, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:08', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (495, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/495.jpg', 143.75, 115.00, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:09', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (496, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/496.jpg', 29.44, 23.55, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (497, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/497.jpg', 169.01, 135.21, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:10', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (498, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/498.jpg', 158.35, 126.68, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:11', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (499, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/499.jpg', 132.50, 106.00, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:11', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (500, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/500.jpg', 130.17, 104.14, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (501, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/501.jpg', 173.76, 139.01, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:12', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (502, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/502.jpg', 8.39, 6.71, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:13', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (503, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/503.jpg', 189.98, 151.98, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (504, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/504.jpg', 167.28, 133.82, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:14', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (505, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/505.jpg', 143.17, 114.54, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:15', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (506, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/506.jpg', 17.75, 14.20, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:15', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (507, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/507.jpg', 23.34, 18.67, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:16', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (508, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/508.jpg', 168.63, 134.90, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:17', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (509, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/509.jpg', 103.13, 82.50, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:17', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (510, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/510.jpg', 130.51, 104.41, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:18', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (511, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/511.jpg', 33.66, 26.92, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:19', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (512, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/512.jpg', 122.35, 97.88, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:19', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (513, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/513.jpg', 117.95, 94.36, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:20', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (514, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/514.jpg', 176.46, 141.17, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:21', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (515, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/515.jpg', 170.61, 136.49, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:21', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (516, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/516.jpg', 187.55, 150.04, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:22', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (517, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/517.jpg', 96.36, 77.09, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:23', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (518, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/518.jpg', 127.86, 102.29, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:23', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (519, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/519.jpg', 63.98, 51.18, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:24', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (520, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/520.jpg', 191.90, 153.52, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:24', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (521, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/521.jpg', 138.58, 110.86, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:25', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (522, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/522.jpg', 158.72, 126.97, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (523, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/523.jpg', 189.52, 151.62, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:26', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (524, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/524.jpg', 12.33, 9.87, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:27', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (525, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/525.jpg', 90.78, 72.63, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:27', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (526, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/526.jpg', 165.04, 132.03, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:28', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (527, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/527.jpg', 158.34, 126.67, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (528, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/528.jpg', 136.77, 109.41, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:29', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (529, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/529.jpg', 158.05, 126.44, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:30', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (530, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/530.jpg', 84.99, 67.99, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:31', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (531, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/531.jpg', 106.61, 85.29, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:31', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (532, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/532.jpg', 12.80, 10.24, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:32', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (533, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/533.jpg', 67.37, 53.90, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:32', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (534, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/534.jpg', 143.65, 114.92, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:33', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (535, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/535.jpg', 6.42, 5.14, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:33', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (536, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/536.jpg', 103.66, 82.93, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:34', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (537, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/537.jpg', 169.70, 135.76, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:35', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (538, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/538.jpg', 39.59, 31.67, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:36', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (539, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/539.jpg', 118.58, 94.87, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:37', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (540, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/540.jpg', 92.07, 73.66, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:38', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (541, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/541.jpg', 23.04, 18.43, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:38', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (542, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/542.jpg', 89.07, 71.25, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:39', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (543, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/543.jpg', 164.98, 131.98, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (544, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/544.jpg', 199.60, 159.68, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:40', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (545, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/545.jpg', 8.35, 6.68, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:41', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (546, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/546.jpg', 48.62, 38.89, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:41', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (547, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/547.jpg', 110.37, 88.30, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:42', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (548, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/548.jpg', 121.86, 97.49, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:42', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (549, 2, 'MyCAT入门及应用', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/549.jpg', 195.95, 156.76, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:52', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (550, 2, 'MyCAT+MySQL搭建高可用企业级数据库集群', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/550.jpg', 147.80, 118.24, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:53', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (551, 2, '与MySQL的零距离接触', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/551.jpg', 112.83, 90.26, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:54', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (552, 2, 'MongoDB读写分离的适用性', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/552.jpg', 19.47, 15.57, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:54', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (553, 2, 'Redis的Lua脚本编程', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/553.jpg', 1.67, 1.33, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (554, 2, 'MongoDB复制集—复制集的同步机制', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/554.jpg', 181.39, 145.11, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:55', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (555, 2, 'Go读书社区web开发与高性能架构优化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/555.jpg', 26.94, 21.55, NULL, '2022-03-27 19:15:37', '2022-06-28 15:48:56', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (556, 2, 'Kingshard数据库中间件理论与实践', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/556.jpg', 149.90, 119.92, NULL, '2022-03-27 19:15:37', '2022-06-28 15:49:02', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (557, 2, 'Oracle数据库开发利器之函数', '免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/557.jpg', 151.10, 120.88, NULL, '2022-03-27 19:15:37', '2022-06-28 15:49:02', 0, 2, 4, NULL);
INSERT INTO `course` VALUES (558, 2, 'FullPage.js全屏滚动插件', '简介：fullPage.js 是一个基于 jQuery 的插件，它能够很方便、很轻松的制作出全屏网站。如今我们经常能见到全屏网站，在手机上也经常能看到一些活动页面。这些网站用几幅很大的图片或色块做背景，再添加一些简单的内容，通过滚动或者滑动来翻页，显得格外的高端大气上档次。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/558.jpg', 90.02, 72.02, NULL, '2022-03-27 19:22:35', '2022-06-28 15:49:03', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (559, 2, '按钮特效', '简介：课程分为二个实例讲解，第一个实例用纯CSS3代替JavaScript实现按钮动画效果，并详细讲解CSS3新增的transition、transform等属性。第二个实例重点介绍利用<a>标签制作自适应宽度的圆角按钮。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/559.jpg', 106.69, 85.35, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:03', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (560, 2, 'AC2016腾讯前端技术大会', '简介：本课程是腾讯前端团队Alloyteam参与主办的AC2016前端技术大会现场实录。大会分享议题涉及最近流行的ReactNative、Node.js、Angular.js、RXjs等技术。精彩分享不容错过！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/560.jpg', 6.32, 5.05, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:04', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (561, 2, '信息列表制作', '简介：详细讲解信息列表的制作方法和技巧，以真实实例为主线，贯穿诙谐轻松的教学方法，从易到难，循序渐进，掌握相应知识点、开发标准，以最快的速度掌握不同技术的实现方法，提高Web开发经验与技巧。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/561.jpg', 75.98, 60.78, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:04', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (562, 2, '如何实现“新手引导”效果', '简介：通过本案例，你将会学习如何制作蒙版，详细了解绝对定位的方法，全面掌握cookie的设定，更重要的是能够用原生JavaScript代码和JQuery两种方式来对“新手引导”中引导单元的依次显示。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/562.jpg', 124.06, 99.25, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:05', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (563, 2, '分页页码制作', '简介：通过本课程的学习，我们可以学习到利用HTML、CSS样式技术制作出分页页码的效果。包括最简单的直角分页页码效果，修复行内元素之间的间隔bug问题分析，代码整理，为分页页码插入小图标。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/563.jpg', 132.50, 106.00, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:05', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (564, 2, '信息滚动效果制作', '简介：本课程简单介绍marquee标签制作简单滚动的方法，通过分析滚动原理，让您知道效果实现的思路，详细讲解如何复制元素、定时等知识的使用，运用JavaScript技术，让您掌握无缝滚动和歇间性滚动的制作方法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/564.jpg', 188.66, 150.93, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:06', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (565, 2, '搜索框制作', '简介：本课程中，我们将使用jQuery和JavaScript两种技术来实现搜索框效果功能,并对jQuery和JavaScript两种技术进行了对比，你将可以了解到JQ与JS实现Ajax技术的不同点。赶快行动吧！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/565.jpg', 36.38, 29.10, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:07', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (566, 2, 'Angular2一小时快速入门', '简介：Angular2 于2016年9月份正式发布，功能特性趋于稳定，本教程基于 Angular2 正式版展开，共分为三个章节：第一章简述 Angular 的发展历史；第二章详解Angular2 的八个核心概念；第三章通过由浅入深的代码实操再次加深对 Angular2的理解，帮助大家快速上手 Angular2 开发。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/566.jpg', 38.89, 31.12, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:07', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (567, 2, '网页广告特效', '简介：网页广告特效是大部分网站中都出现的内容，那么我们这门课程能帮您深度分析广告特效原理，分步剖析制作过程，从浅到深，逐步优化代码，让你深入理解，并灵活运用知识，举一反三，制作出绚丽的广告特效。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/567.jpg', 184.99, 147.99, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:08', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (568, 2, '从D2到D2(大话游戏开发实战技巧)', '简介：以2013年D2前端论坛上的发言和《异类》游戏开发为基础，介绍云朵、色彩和文字制作技巧、thanks、雨、星空、音乐、虚拟控制器、缓动动画等游戏中的各个环节的开发技巧。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/568.jpg', 63.41, 50.73, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:08', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (569, 2, 'HTML5之元素与标签结构', '简介：知识与实例相结合，本部分是HTML5课程的基础内容，主要讲解HTML5的标签结构，与传统的HTML4相比，新增和删去的标签及相关属性，并深入拓展了全局属性的相关知识。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/569.jpg', 101.09, 80.87, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:09', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (570, 2, '图片展示特效', '简介：在电商时代，为了吸引用户，图片展示是各大网站必不可少的特效，本课程带领我们从分析展示特效原理，掌握如何进行图片定位，使用JS技术实现图片展示效果效果，并对代码进行深度优化，让你不再为图片展示特效而发愁。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/570.jpg', 25.96, 20.77, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:10', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (571, 2, '前端开发工具技巧介绍—DW篇', '简介：“工欲善其事，必先利其器”。本课主要以Dreamweaver CS6为例，讲授Dreamweaver的使用技巧和重要实用模块，将会覆盖实际开发过程中90%以上的功能，新手入门必备！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/571.jpg', 136.48, 109.18, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:10', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (572, 2, '表单美化', '简介：本课程主要讲解表单美化，授之以鱼不如授之以渔，所以主要是对方法和思路的分享，对单选按钮、复选按钮（复选框）、文本框及下拉列表进行美化；对象不同，美化方法亦不同，让你网页中的表单与众不同。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/572.jpg', 78.14, 62.51, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:11', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (573, 2, '表单验证', '简介：表单验证是JavaScript中的高级选项之一。本案例基于淘宝网用户注册界面，讲解正则表达式（regex）的基本用法，通过对“用户名输入框”、“密码输入框”及“确认密码输入框”的验证分析，扎实掌握正则表达式（regex）和交互设计的相关知识。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/573.jpg', 42.22, 33.78, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:11', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (574, 2, 'IT菜鸟逆袭指南（江湖篇）', '简介：每个挨踢菜鸟都渴望成功逆袭，摆脱悲催的现状成为技术大咖。近日，慕课新闻报道了一则关于IT大侠慕无忌的神奇历练历程。想必会给正在启程的你一些启发。屌丝逆袭，不是传说！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/574.jpg', 107.84, 86.27, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:12', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (575, 2, '弹出层效果', '简介：在各大网站中，我们常运用弹出层效果实现登陆和图片展示效果。本课程主要讲解如何定位、如何创建，插入，删除网页元素，并从静态网页布局到JS代码实现，详细分析每个环节，让您能灵活运用知识，制作出超炫、超实用的弹出层效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/575.jpg', 72.26, 57.81, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:12', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (576, 2, '倒计时效果', '简介：现今团购网、电商网、门户网等，常使用时间记录重要的时刻，如时间显示、倒计时差、限时抢购等，本课程分析不同倒计时效果的计算思路及方法，掌握日期对象Date，获取时间的方法,计算时差的方法，实现不同的倒时计效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/576.jpg', 2.73, 2.18, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:13', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (577, 2, '信息排列效果', '简介：如何变换网页内容的展现形式，实现从静态网页布局到JS的动态效果？本课程为您讲解运用HTML/CSS实现网页的静态布局，以及运用JS实现网页展现形式之间的切换，节约网页空间。从制作思路分析到效果实现，让你快速学会信息排列效果的制作。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/577.jpg', 40.07, 32.06, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:14', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (578, 2, '回到顶部效果', '简介：回到顶部效果是目前大型网站不可缺少的一部分，也许你已经会用锚链接的方式来实现，是不是不满意呢？这里将重点分享用JavaScript技术来实现，不仅可以设定按钮出现的时机，还能实现对滚动条速度的控制，是不是很炫酷呀！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/578.jpg', 169.56, 135.65, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:14', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (579, 2, '帝堵抢车位动画制作', '简介：对于生活在首都的人民来说，不仅要忍受堵车的无奈，就连车位也是要靠运气抢的。现实如此骨感，就让程序和代码来帮你排忧解难。本课程教你使用html、css样式、jQuery来制作最炫酷的抢车位动画效果。学会滑动动画效果，让你成为抢车位达人！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/579.jpg', 112.77, 90.21, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:15', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (580, 2, '用JavaScript实现图片缓慢缩放效果', '简介：在网页制作当中，我们经常会对图片做一些处理，比如图片的放大和缩小。本课程讲解如何使用JavaScript技术实现图片缩放效果，其中将用到setInterval()和clearInterval()两个重要函数。课程中对实现效果进行了展示，并详尽分析其实现原理。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/580.jpg', 173.39, 138.71, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:15', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (581, 2, '浅谈搜索引擎优化', '简介：本课程主要讲解什么是SEO，以及SEO的作用是什么以及在那些方面能够用到SEO。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/581.jpg', 104.08, 83.26, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:16', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (582, 2, '展开与收起效果', '简介：门户网站顶部广告、阅读类网站“查看全文”，电商网站分类导航，都会应用到展开与收起效果。本课程讲解使用JavaScript、jQuery实现动态效果、动画效果原理以及节点式查找控件的方法。通过效果展示与案例分析，让你掌握不同类型展开与收起效果的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/582.jpg', 130.15, 104.12, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:16', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (583, 2, '鼠标悬浮效果', '简介：本课程分三个章节，从简单介绍到完成html、css代码到完成JS代码，来给大家介绍了通过JS实现鼠标悬浮的效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/583.jpg', 198.30, 158.64, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:17', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (584, 2, 'JS/jQuery宽高的理解和应用', '简介：js和jquery中各式各样的宽高有很多。平时用的也蛮多，但是有时候我们会把某些宽高的用法和使用场景混淆，本套课程帮大家理清js和jquery的各种宽高，并和大家一起对宽高做一些简单的应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/584.jpg', 89.86, 71.89, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:18', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (585, 2, '阿当大话西游之WEB组件', '简介：我们在实际前端开发过程中,能否封装出易用易维护可定制可扩展的组件，是衡量工程师能力是否成熟的非常重要的一个指标。本课程以弹窗组件为例，讲解如何开发web前端组件,如何实现可读性、扩展性、易用性、重用性、模块化等等技巧,让您的组件开发技能不在空白。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/585.jpg', 8.20, 6.56, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:19', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (586, 2, 'less即学即用', '简介：通过本教程，我们学习和理解了less的基本语法和使用场景。并且结合实际的例子，为我们在实战项目中编写css样式带来了很大方便。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/586.jpg', 25.67, 20.54, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:19', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (587, 2, '数学知识在CSS动画中的应用', '简介：在数学理论的基础上，与CSS动画技巧完美结合，实现令你耳目一新的径向菜单展开效果，以及优雅实用的时钟效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/587.jpg', 128.13, 102.51, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:20', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (588, 2, '酷瓜云课堂 - 外链点播', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/588.png', 141.33, 113.06, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:20', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (589, 2, 'Web前端开发JavaScript权威课堂', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/589.jpeg', 103.23, 82.59, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:21', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (590, 2, '零基础入门PHP之html/css-web前端', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/590.png', 22.54, 18.03, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:21', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (591, 2, 'CSS圆角进化论', '简介：CSS圆角的实现，经历了三大发展阶段：背景图片（贴图）方式、CSS2.0+HTML标签模拟、CSS3.0圆角属性（border-radius）。本案例详细讲解每一种的实现方式，并对实现的优缺点进行对比分析。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/591.jpg', 188.48, 150.78, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:22', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (592, 2, 'Tooltip浮动提示框效果', '简介：本课程详细讲述使用原生JavaScript如何设计和实现Tooltip浮动提示框特效。并通过一步一步的代码实现和代码优化过程，不仅让您掌握特效的实现，还掌握解决问题的思路，了解诸如代码简化、事件绑定、事件冒泡等更多的JavaScript技巧和知识，提升编程兴趣和水平。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/592.jpg', 186.55, 149.24, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:23', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (593, 2, '2016年阿里D2前端技术论坛', '简介：本课程精选第11届阿里D2前端大会论坛分享内容，引领最前沿技术', 'http://oss1.wuzhaoqi.top/course/2022-06-28/593.jpg', 38.91, 31.13, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:23', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (594, 2, 'HTML5+CSS3实现“共嗨世界杯”', '简介：使用 css3 来制作一个足球场地，以及世界杯对战图，看世界杯，学前端知识，两不耽误。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/594.jpg', 82.67, 66.14, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:24', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (595, 2, '移动端的WEB相册', '简介：移动端开发越来越火热，WebAPP应用也层出不穷，如何开发常用移动端相册类网页，本课程通过一个移动端相册，将移动端框架，常见优化手段和触屏设备开发等理论串联起来，使用当下比较流行的CSS3和HTML5技术实现一个针对移动端设备的完整的相册应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/595.jpg', 52.32, 41.86, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:24', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (596, 2, '用JavaScript实现图片剪切效果', '简介：课程中将介绍如何获取鼠标的坐标位置以及监听鼠标的按下、拖动、松开等动作事件，从而实现拖动鼠标来改变图片大小。本课程还会给大家介绍css中让人惊喜的clip属性。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/596.jpg', 20.49, 16.39, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:25', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (597, 2, '《全民寻找绿箭侠》游戏开发', '简介：小伙伴们，全民寻找房祖名游戏使大家嗨了一把，本课程就来带领大家分析并开发出属于自己的“全民寻找某某”游戏。听起来有一些小兴奋吧。本课程主要内容包括游戏逻辑分析、框架分离、游戏代码实现，每个步骤都带领大家进行代码断点演示。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/597.jpg', 105.49, 84.39, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:26', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (598, 2, '玩转KISSY框架', '简介：KISSY框架是目前硕果仅存的几个国产js框架之一，在阿里的网站比如淘宝网、天猫等大量使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/598.jpg', 162.09, 129.67, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:26', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (599, 2, 'SEO在网页制作中的应用', '简介：本课程将通过对网页结构以及前端代码两个方面介绍前端SEO知识。作为前端工程师，可能你每天只关注怎样实现一个又一个的网页特效，怎样让自己的网站更酷更炫，但是本课程能教你怎样让更多的人来访问你的网站！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/599.jpg', 89.00, 71.20, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:27', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (600, 2, 'Roundtable前端分享专场', '简介：本课程为现场技术分享实录，为大家带来NPM的基本用法和实用技巧介绍，以及使用Canvas对图片进行类似PS、美图秀秀的图像处理方法！精彩不容错过！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/600.jpg', 21.99, 17.60, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:27', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (601, 2, 'CSS3图片动态提示效果', '简介：本课程使用HTML5+CSS3来制作网站常用的超酷图片展示动画效果，从知识点到原理到实践，一步步带你通过课程学会如何通过简单CSS属性制作炫酷复杂的动画效果。熟练掌握CSS动画的制作技法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/601.jpg', 187.55, 150.04, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:28', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (602, 2, 'Jquery插件transform旋转焦点图', '简介：本课程对jQuery的插件transform进行详细的讲解，为了更好理解与使用该插件，本课程将通过旋转焦点图的案例来让大家更好的掌握transform插件的使用。同时也会将将定时器，闭包等技术惯穿在案例中，使我们更好的去理解及运用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/602.jpg', 40.03, 32.02, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:29', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (603, 2, '用字体在网页中画ICON图标', '简介：有一个岗位，叫前端开发；有一种技术，叫 CSS Sprite；有一种突破，叫font+HTML/CSS。移动互联网时代的到来，让CSS Sprite似乎有点Hold不住。Font+HTML/CSS将会做到，小巧的体积、更快的加载速度、任意改变颜色和尺寸，完美的兼容性，是你在网页中画小图标的不二之选。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/603.jpg', 182.53, 146.02, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:29', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (604, 2, 'C4D三维字体设计', '简介：本课程主要讲解三维立体字体（包装栏目头图设计）', 'http://oss1.wuzhaoqi.top/course/2022-06-28/604.jpg', 96.47, 77.17, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:30', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (605, 2, 'TypeScript  系统入门到项目实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/605.jpg', 11.85, 9.48, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:31', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (606, 2, '玩转Vim从放弃到爱不释手', '简介：Vim作为一个强大的编辑器，是很多巨佬的不二之选，但因为其较高的入门学习门槛劝退了很多人。中文的系统教程少之又少，讲vim插件使用的更是屈指可数，本课程从vim最基础的操作和概念开始讲起，带领大家学会使用和配置 vim，安装强大的 vim 插件，真正掌握编辑器之神 vim 的使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/606.jpg', 148.01, 118.40, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:31', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (607, 2, 'mobx入门基础教程', '简介：介绍mobx框架的应用定位，基础API的使用，实例化的使用方法以及在工业场景中的最佳实践', 'http://oss1.wuzhaoqi.top/course/2022-06-28/607.jpg', 25.18, 20.14, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:32', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (608, 2, 'H5+JS+CSS3实现圣诞情缘', '简介：圣诞节将近，帅哥美女相约，送一份特别的礼物，让TA过一个不一样的节日。本课程中使用面向对象的编程方式，采用H5+JS+CSS3的混合使用实现整个功能。课程当中总共分为3个主题场景图，多个精灵图以及雪碧图，实现了静与动的完美结合，并且由浅入深的将整个案例拆分讲解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/608.jpg', 2.29, 1.83, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:33', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (609, 2, 'Webapp-Rails10日谈', '简介：Web 开发是个复杂工作，涉及到得技术种类繁多。Ruby On Rails 可以为提供一套 best practice ，让新手不至于在选择和配置各种要素上面迷路，从而能快速达成自己的想法。带你手把手一起做出一个小而美的 Web App，穿插一些难点的演示拆解。不求面面俱到，但求实用生动。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/609.jpg', 66.75, 53.40, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:33', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (610, 2, 'JS插件开发之LightBox图片画廊(下)', '简介：本期课程带领大家封装图片画廊插件，通过本例子把前端的知识做一次综合展示，全面考验前端工程师综合设计、开发能力。本期课程是《JS插件开发之LightBox图片画廊》系列课程的第二期课程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/610.jpg', 96.30, 77.04, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:34', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (611, 2, 'Webapp-Rails技巧库', '简介：课程会分成很多短视频来分享给大家。每个视频中瞄准一个特定功能，配套文字稿里面有每一小步的代码和参考资料链接。最终产品的代码在这个github仓库这里。总之我是想做成我自己当年作为初学者时最想看的课程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/611.jpg', 26.22, 20.97, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:35', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (612, 2, '星级评分原理和实现（下）', '简介：本课程总会讲解如何使用纯CSS代码提交评分、js利用雪碧图等来实现星级评分如何点亮半个星星、四分之一课星星。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/612.jpg', 81.47, 65.17, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:35', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (613, 2, 'React知识点综合运用实例', '简介：本套课程将带领大家完成一个综合实例操作，对前面所学的知识进行完美综合，使技能掌握更纯熟，对react更加深入的了解与掌握', 'http://oss1.wuzhaoqi.top/course/2022-06-28/613.jpg', 72.45, 57.96, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:36', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (614, 2, 'zepto设计和源码分析', '简介：当熟练使用zepto的API之后，也应该解读一下zepto的源码，了解一下zepto的设计原理。教程深入浅出的介绍了zepto最核心的设计原理，看完之后即能轻松解读zepto所有源码。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/614.jpg', 180.18, 144.14, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:36', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (615, 2, '用JS实现购物车特效', '简介：我们大家平时都喜欢上淘宝买商品，里面的购物车是怎么实现呢？那么本课程您将会学到通过JavaScript实现类似与淘宝的购物车效果，包括商品的单选、全选、删除、修改数量、价格计算、数目计算、预览等功能的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/615.jpg', 55.88, 44.70, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:37', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (616, 2, 'jQuery实现自定义滚动条', '简介：通过本课程，让您掌握鼠标滚轮事件的细节，并能通过掌握细节实现自定义滚动条的效果。我们学完后也可以将鼠标滚轮事件封装成组件，通过封装的组件实现一个复杂的交互效果，深入理解滚轮事件的交互。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/616.jpg', 102.50, 82.00, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:37', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (617, 2, '从0到1手把手教你用Node.js+KOA2打造超好用的Web框架', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/617.jpg', 189.10, 151.28, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:38', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (618, 2, 'jQuery基础(五)一Ajax应用与常用插件', '简介：本课程介绍如何用jquery实现ajax应用，深入理解jQuery框架提供的各类API与函数的工作原理和自定义jQuery插件的各项技能。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/618.jpg', 188.74, 151.00, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:48', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (619, 2, 'Jenkins+K8s实现持续集成', '简介：本课程介绍jenkins、docker、k8s以及使用一个实例讲解如何实现持续集成、代码的自动化编译打包和部署', 'http://oss1.wuzhaoqi.top/course/2022-06-28/619.jpg', 30.52, 24.41, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:49', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (620, 2, 'JS实现人机大战之五子棋（AI篇）', '简介：本案例是一个带AI的五子棋人机大战程序，课程分为两篇，本篇AI篇主要介绍AI算法的实现，详细介绍了使用到的数据结构，算法原理，并且手把手编写程序实现算法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/620.jpg', 167.52, 134.01, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:50', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (621, 2, '走进SVG', '简介：SVG 是 HTML5 中矢量图的标记语言，它保持了强大的绘图能力的同时，具有非常高端的使用接口，通过直接操作 Dom 节点的形式来操作图形。本课程意在让学生掌握 SVG 这门语言和它对应的一些 API，再结合2D绘图的知识，让学生具有对页面复杂图形的渲染和控制能力。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/621.jpg', 64.46, 51.57, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:50', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (622, 2, '微信分享与支付专项课程 （公众号 小程序（云））', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/622.jpg', 136.58, 109.26, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:51', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (623, 2, 'Node.js从零开发Web Server博客项目', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/623.jpg', 37.44, 29.95, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:52', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (624, 2, 'css3实现网页平滑过渡效果', '简介：不用任何 JavaScript 脚本，使用纯 CSS 实现页面之间的平滑过渡，体验 transform、transition、animation 带来的神奇体验。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/624.jpg', 35.87, 28.70, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:52', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (625, 2, '基于实例的React16傻瓜课程', '简介：你有多少次看了一些教程，想写代码的时候却发现无从开始？没有长篇大论的文档和PPT，正确的课程应该是完全基于实例，本课程用一系列有趣的、简洁明快的实例由浅入深的阐述了 React 的特色，概念和基本使用。同时进而引出了 React 16 新的概念和用法。让没有任何 React 基础的人也能很快掌握核心概念并且应用于实际工作中。实战内容：https://coding.imooc.com/class/302.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/625.jpg', 142.93, 114.34, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:53', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (626, 2, 'HTTP协议原理+实践Web开发工程师必学', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/626.jpg', 91.51, 73.21, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:53', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (627, 2, '抓紧面试前的宝贵时间 快速搞定前端初级JavaScript面试', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/627.jpg', 96.50, 77.20, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:54', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (628, 2, '前端实时可视化开发工具体验', '简介：前端开发中，我们常常平凡的修改 html，css，js，然后刷新页面，看效果，在调整，再刷新。本课程使用liveStyle，liveReload，browserSync工具实现帮你实现修改代码后，立即体现效果，使用可见即可得的开发模式，极大的提高前端开发效率。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/628.jpg', 172.83, 138.27, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:58', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (629, 2, 'jQMWebApp–列车时刻表', '简介：jQuery Mobile 是创建移动WEB应用程序的框架，使用广泛。本课程通过一个列车时刻表的简单案例，讲解了jQMobile的页面、事件、按钮、图标、导航栏、网格、列表、表单、Ajax等主要组件的使用方法，通过案例学习，举一反三，基本上可以开发简单的Web App应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/629.jpg', 184.71, 147.77, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:59', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (630, 2, 'jQuery源码解析（DOM与核心模块）', '简介：本课程是目前真正意义上第一部完整的jQuery 2.1.1版本源码课程，课程共14章，分两个部分，本课程是第一部分课程。本课程主要讲解DOM处理与核心模块部分，可以让我们由浅入深的剖析jQuery库的设计与实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/630.jpg', 81.51, 65.21, NULL, '2022-03-27 19:22:36', '2022-06-28 15:49:59', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (631, 2, '焦点图轮播特效', '简介：通过学习您可以理解图片轮播原理，还将讲解setTimeout()、setInterval()函数设置定时器与清除定时器clearInterval()函数，使用函数递归实现图片滑动切换，采用辅助图片实现图片无限滚动等编程技巧。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/631.jpg', 160.37, 128.30, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:00', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (632, 2, '网页简单布局之结构与表现原则', '简介：在网页制作当中，结构与表现分离的思想，不仅仅是将html、css分别写在不同文件当中这么简单，要从更深层次上去进行理解。本课程通过3个案例，分别从不同角度，对结构和表现分离的思想进行了展示和分析。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/632.jpg', 144.74, 115.79, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:00', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (633, 2, '纯正商业级应用-微信小程序开发实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/633.jpg', 77.00, 61.60, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:01', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (634, 2, 'React开发简书项目 从零基础入门到实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/634.jpg', 129.49, 103.59, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:01', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (635, 2, 'Web安全-XSS', '简介：从Web安全XSS的定义开始讲起，到深入剖析XSS攻击的原理和流程，了解常见XSS攻击的危害。同时通过项目实战针对性的分析如何应对XSS攻击做到安全的XSS防御措施。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/635.jpg', 166.63, 133.30, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:02', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (636, 2, 'DatePicker组件开发', '简介：通过原生HTML/CSS/JavaScript完成一个日期选择器（datepicker）组件的开发。主要包括datepicker静态结构的编写、日历数据的计划获取、组件的渲染以及组件事件的处理。,课程基本涵盖一个完整的前端组件的基本要素，掌握后对其它组件的开发有借鉴意义。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/636.jpg', 50.90, 40.72, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:03', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (637, 2, 'Taro多端框架开发外卖首页', '简介： Taro 是一套遵循 React 语法规范的 多端开发 解决方案。使用 Taro，我们可以只书写一套代码，再通过 Taro 的编译工具，将源代码分别编译出可以在不同端（微信小程序、H5、RN 等）运行的代码。\n其拥有React语法风格的特性，同时支持使用JSX语法，使用Taro开发可以获得和React一致的开发体验。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/637.jpg', 157.89, 126.31, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:04', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (638, 2, 'JS实现京东无延迟菜单效果', '简介：通过模仿京东商城的无延迟菜单效果，学习到菜单的结构和样式处理，菜单常见交互如何开发，介绍了普通二级菜单的问题，并通过逐步优化去解决该问题。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/638.jpg', 186.82, 149.46, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:04', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (639, 2, '星级评分原理和实现（上）', '简介：本课程主要讲解如何使用不同的方式，来实现星级评分的效果，老师不仅大家如何实现，还教会同学们设计的思路。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/639.jpg', 72.09, 57.67, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:05', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (640, 2, '手把手教你实现电商网站开发', '简介：本课程主要介绍电商网站基本制作流程，通过电商网站分步的教学让大家了解和掌握电商网站制作的流程和注意事项。并且运用网站内学习过的知识点，更加快速的掌握整站的开发过程，增加开发经验。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/640.jpg', 107.69, 86.15, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:05', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (641, 2, 'CSS3+JS实现超炫的散列画廊特效', '简介：在网页中传统的照片查看一直是网格-列表，现在我们可以突破这种限制，获得和现实中一样的自由。随意摆放的照片，超酷的切换动画；还能翻开照片，查看图片简介。\n本课程主要有两个部分；前半部分以原理分析和前端界面实现为主，后半部分则是脚本来处理的一些特效与总结。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/641.jpg', 19.90, 15.92, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:06', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (642, 2, 'Vue Element+Node.js开发企业通用管理后台系统', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/642.jpg', 114.83, 91.86, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:07', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (643, 2, '侧栏工具条开发', '简介：本课程将使用sass和requirejs来开发一个侧栏工具条。思考工具条的原理，并用三种方式实现。在开发的过程中，您将学会sass的使用方法，用它更好的书写css；了解requirejs的基本知识，写出模块化的代码，方便以后的复用；掌握如何用CSS3完成简单的动画效果，让网页不再单调。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/643.jpg', 23.58, 18.86, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:08', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (644, 2, 'React响应用户输入', '简介：本课程将带领大家一起学习如何让数据逻辑与UI的结合使用、react的事件处理机制以及react对DOM模型的操作', 'http://oss1.wuzhaoqi.top/course/2022-06-28/644.jpg', 81.82, 65.46, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:08', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (645, 2, 'Node.js仿知乎服务端-深入理解RESTful API', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/645.jpg', 111.04, 88.83, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:09', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (646, 2, 'React16组件化+测试+全流程 实战在线账本项目', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/646.jpg', 97.96, 78.36, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:09', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (647, 2, 'Vue 实战商业级读书Web APP 全面提升技能', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/647.jpg', 148.99, 119.19, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:10', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (648, 2, 'CSS深入理解之overflow', '简介：overflow看上去其貌不扬，其中蕴含的知识点还是很多的。有很多鲜为人知的特性表现，本课程就将带你走入overflow的世界，为你打开另外一扇学习之窗。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/648.jpg', 7.41, 5.93, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:10', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (649, 2, 'HTML5小游戏-爱心鱼（下）', '简介：html5游戏适合刚入手游戏开发的同学，或是想学习html5 API的同学。本课程将带领你学习主要的html5 API，通过一个清新美好的小游戏，熟悉游戏开发流程。课程分两部分，第一部分完成游戏核心，第二部分完善游戏内容。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/649.jpg', 9.89, 7.91, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:11', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (650, 2, '形形色色的下拉菜单', '简介：本课程从易到难，循循渐进，从静态网页布局，到运用HTML/CSS、JavaScript、jQuery不同技术实现动态下拉菜单，让您掌握下拉菜单的制作及在不同浏览器间进行代码调试，解决浏览器兼容问题。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/650.jpg', 163.13, 130.51, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:12', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (651, 2, 'Grunt-beginner前端自动化工具', '简介：作为一名开发人员，在WEB前端项目开发中，重复而枯燥的工作太多，Grunt自动化的项目构建工具，帮你解决这些问题，对重复执行的任务像压缩，合并，编译，单元测试及代码检查等， 通过配置Grunt自动化工具，可以减轻您的劳动，简化您的工作。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/651.jpg', 88.89, 71.11, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:12', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (652, 2, 'CSS深入理解之vertical-align', '简介：本课程将带领大家深入的理解CSS中的属性vertical-align所支持的各类属性值们，会简单介绍下vertical-align所存在的兼容性问题，也会分享一些开发中的实际应用经验以及一些最佳的实践效果', 'http://oss1.wuzhaoqi.top/course/2022-06-28/652.jpg', 115.36, 92.29, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:13', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (653, 2, '十天精通CSS3', '简介：本课程为CSS3教程，对于有一定CSS2经验的伙伴，能让您系统的学习CSS3，快速的理解掌握并应用于工作之中。在学习教程的过程中实例演示结合在线编程完成任务的方式来学习，相信自己动手会让你理解的更快，本教程能够让您学习效果更好！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/653.jpg', 15.20, 12.16, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:13', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (654, 2, 'JavaScript入门篇', '简介：本教程让您快速认识JavaScript，熟悉JavaScript基本语法、窗口交互方法和通过DOM进行网页元素的操作，学会如何编写JS代码，如何运用JavaScript去操作HTML元素和CSS样式，本JavaScript教程分为四个章节，能够让您快速入门，为JavaScript深入学习打下基础。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/654.jpg', 27.08, 21.66, NULL, '2022-03-27 19:22:36', '2022-06-28 15:50:14', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (655, 2, 'Vue核心技术Vue+Vue-Router+Vuex+SSR实战精讲', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/655.jpg', 131.13, 104.91, NULL, '2022-03-27 19:22:37', '2022-06-28 15:50:14', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (656, 2, '前端性能优化-基础知识认知', '简介：本课程从前端优化目的，简单方法、分类开始，到如何优化，优化过程中的常见错误，业内公认的但是不适应所有方案。我们还可从这个课程中学习到当我们访问一个站点的时候，我们究竟做了什么以及怎么样才叫优化成功。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/656.jpg', 153.90, 123.12, NULL, '2022-03-27 19:22:37', '2022-06-28 15:50:15', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (657, 2, 'Sass和Compass必备技能之Sass篇', '简介：CSS至今已经发展了将近20个年头，暮气沉沉，廉颇老矣？通过本课程我们将切实了解Sass与Compass是如何让CSS重焕青春的。由浅入深，从Sass的语法说起，最后衍伸至Compass框架的应用，通过这两个工具来帮助您写出更优秀的CSS。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/657.jpg', 60.95, 48.76, NULL, '2022-03-27 19:22:37', '2022-06-28 15:50:16', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (658, 2, '移动web开发适配秘籍Rem', '简介：移动web开发适配的方案有许多，然而最好的方案一定要掌握。本课程主要讲解移动web开发中常见的适配方法，着重讲解使用rem方案的原理和使用方法，来进行移动web开发的适配工作，借助于实战页面让学者更加清晰的掌握实战工作中如何应用rem适配技术。推荐课程：《移动 Web APP 开发之实战美团外卖》https://coding.imooc.com/class/272.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/658.jpg', 96.40, 77.12, NULL, '2022-03-27 19:22:37', '2022-06-28 15:50:16', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (659, 2, '电商网站前端架构', '简介：目前电商网站非常火，我们这个课程就是教你如何创建一个电子商务网站。课程通过一个垂直电子商务网站，介绍前端架构搭建和实现的步骤和方法，以及在这个过程中我们需要做什么才能帮助项目最终从设计走向实现，是不是很诱人啊？我们一起来学习吧！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/659.jpg', 59.53, 47.63, NULL, '2022-03-27 19:22:37', '2022-06-28 15:50:17', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (660, 2, 'CSS深入理解之absolute', '简介：深入理解CSS的position:absolute声明的表现、掌握一些position:absolute的高级应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/660.jpg', 85.39, 68.31, NULL, '2022-03-27 19:22:37', '2022-06-28 15:50:17', 0, 2, 1, NULL);
INSERT INTO `course` VALUES (661, 2, '算法与数据结构-综合提升C++版', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/661.jpg', 105.62, 84.50, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:18', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (662, 2, 'HTTP协议原理+实践Web开发工程师必学', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/662.jpg', 167.83, 134.26, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:19', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (663, 2, 'JavaScript版 数据结构与算法', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/663.jpg', 15.90, 12.72, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:19', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (664, 2, '编程必备基础 计算机组成原理+操作系统+计算机网络', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/664.jpg', 22.06, 17.65, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:20', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (665, 2, 'Python工程师面试宝典', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/665.jpg', 127.89, 102.31, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:20', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (666, 2, '结合编程学数学 专为程序员设计的线性代数', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/666.jpg', 164.34, 131.47, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:21', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (667, 2, '看的见的算法 7个经典应用诠释算法精髓', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/667.jpg', 38.67, 30.93, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:22', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (668, 2, '高等数学-学习算法/人工智能/大数据的第一步', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/668.jpg', 168.82, 135.06, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:22', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (669, 2, 'Python3入门机器学习 经典算法与应用 轻松入行人工智能', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/669.jpg', 85.19, 68.15, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:23', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (670, 2, '玩转算法面试-- Leetcode真题分门别类讲解', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/670.jpg', 115.35, 92.28, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:23', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (671, 2, '专为程序员设计的统计课 彻底学会统计分析', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/671.jpg', 22.31, 17.84, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:24', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (672, 2, '玩转算法系列--图论精讲  面试升职必备（Java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/672.jpg', 136.25, 109.00, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:24', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (673, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/673.jpg', 188.66, 150.93, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:25', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (674, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/674.jpg', 87.48, 69.99, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:26', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (675, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/675.jpg', 179.54, 143.63, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:26', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (676, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/676.jpg', 3.36, 2.69, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:37', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (677, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/677.jpg', 48.88, 39.10, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:37', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (678, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/678.jpg', 132.63, 106.10, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:38', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (679, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/679.jpg', 144.28, 115.42, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:39', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (680, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/680.jpg', 87.29, 69.83, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:47', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (681, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/681.jpg', 78.29, 62.63, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:47', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (682, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/682.jpg', 149.21, 119.37, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:48', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (683, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/683.jpg', 101.97, 81.58, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:48', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (684, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/684.jpg', 189.00, 151.20, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:49', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (685, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/685.jpg', 168.23, 134.59, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:49', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (686, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/686.jpg', 47.85, 38.28, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:50', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (687, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/687.jpg', 54.58, 43.66, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:50', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (688, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/688.jpg', 137.77, 110.22, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:51', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (689, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/689.jpg', 9.20, 7.36, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:51', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (690, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/690.jpg', 26.24, 20.99, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:52', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (691, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/691.jpg', 49.21, 39.37, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:53', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (692, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/692.jpg', 16.02, 12.82, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:53', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (693, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/693.jpg', 82.68, 66.15, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:54', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (694, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/694.jpg', 113.04, 90.43, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:54', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (695, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/695.jpg', 162.04, 129.63, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:55', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (696, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/696.jpg', 29.02, 23.22, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:55', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (697, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/697.jpg', 68.61, 54.88, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:56', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (698, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/698.jpg', 1.78, 1.43, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:57', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (699, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/699.jpg', 148.10, 118.48, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:57', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (700, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/700.jpg', 173.32, 138.65, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:58', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (701, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/701.jpg', 184.63, 147.70, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:58', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (702, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/702.jpg', 162.91, 130.33, NULL, '2022-03-27 19:36:30', '2022-06-28 15:50:59', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (703, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/703.jpg', 142.80, 114.24, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:00', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (704, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/704.jpg', 53.12, 42.50, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:00', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (705, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/705.jpg', 1.72, 1.38, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:01', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (706, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/706.jpg', 95.99, 76.79, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:01', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (707, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/707.jpg', 32.30, 25.84, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:02', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (708, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/708.jpg', 195.86, 156.69, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:02', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (709, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/709.jpg', 165.09, 132.07, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:03', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (710, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/710.jpg', 163.84, 131.08, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:03', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (711, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/711.jpg', 97.86, 78.29, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:04', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (712, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/712.jpg', 25.90, 20.72, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:04', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (713, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/713.jpg', 190.36, 152.29, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:05', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (714, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/714.jpg', 136.61, 109.28, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:05', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (715, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/715.jpg', 82.85, 66.28, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:06', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (716, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/716.jpg', 69.78, 55.83, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:07', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (717, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/717.jpg', 101.94, 81.55, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:07', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (718, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/718.jpg', 165.92, 132.74, NULL, '2022-03-27 19:36:30', '2022-06-28 15:51:08', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (719, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/719.jpg', 131.62, 105.30, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:08', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (720, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/720.jpg', 186.90, 149.52, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:09', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (721, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/721.jpg', 133.82, 107.06, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:09', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (722, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/722.jpg', 8.32, 6.65, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:10', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (723, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/723.jpg', 105.74, 84.60, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:11', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (724, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/724.jpg', 46.08, 36.86, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:11', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (725, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/725.jpg', 22.75, 18.20, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:12', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (726, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/726.jpg', 121.58, 97.26, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:12', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (727, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/727.jpg', 195.79, 156.63, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:13', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (728, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/728.jpg', 101.92, 81.54, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:13', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (729, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/729.jpg', 189.23, 151.38, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:14', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (730, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/730.jpg', 169.00, 135.20, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:15', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (731, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/731.jpg', 115.88, 92.70, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:15', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (732, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/732.jpg', 163.49, 130.79, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:16', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (733, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/733.jpg', 124.34, 99.47, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:16', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (734, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/734.jpg', 84.04, 67.23, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:17', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (735, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/735.jpg', 93.31, 74.64, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:17', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (736, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/736.jpg', 94.02, 75.22, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:18', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (737, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/737.jpg', 178.21, 142.57, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:18', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (738, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/738.jpg', 171.15, 136.92, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:19', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (739, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/739.jpg', 147.06, 117.65, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:20', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (740, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/740.jpg', 31.55, 25.24, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:21', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (741, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/741.jpg', 80.92, 64.74, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:21', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (742, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/742.jpg', 148.83, 119.06, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:22', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (743, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/743.jpg', 186.76, 149.41, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:22', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (744, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/744.jpg', 178.74, 142.99, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:23', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (745, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/745.jpg', 117.13, 93.71, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:23', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (746, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/746.jpg', 176.77, 141.41, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:24', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (747, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/747.jpg', 57.46, 45.97, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:25', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (748, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/748.jpg', 74.39, 59.51, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:25', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (749, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/749.jpg', 123.07, 98.46, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:26', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (750, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/750.jpg', 151.59, 121.27, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:26', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (751, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/751.jpg', 5.87, 4.70, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:27', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (752, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/752.jpg', 129.27, 103.41, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:28', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (753, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/753.jpg', 177.70, 142.16, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:28', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (754, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/754.jpg', 104.02, 83.22, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:29', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (755, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/755.jpg', 150.22, 120.17, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:29', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (756, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/756.jpg', 86.29, 69.03, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:30', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (757, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/757.jpg', 19.33, 15.46, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:31', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (758, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/758.jpg', 185.64, 148.51, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:31', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (759, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/759.jpg', 198.45, 158.76, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:32', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (760, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/760.jpg', 147.44, 117.95, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:32', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (761, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/761.jpg', 35.14, 28.11, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:33', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (762, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/762.jpg', 93.93, 75.14, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:33', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (763, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/763.jpg', 78.50, 62.80, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:34', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (764, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/764.jpg', 199.54, 159.63, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:35', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (765, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/765.jpg', 142.66, 114.13, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:35', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (766, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/766.jpg', 52.37, 41.90, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:36', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (767, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/767.jpg', 119.58, 95.67, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:36', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (768, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/768.jpg', 66.27, 53.02, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:37', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (769, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/769.jpg', 10.95, 8.76, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:38', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (770, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/770.jpg', 35.34, 28.27, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:44', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (771, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/771.jpg', 154.82, 123.85, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:45', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (772, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/772.jpg', 15.57, 12.46, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:45', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (773, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/773.jpg', 53.70, 42.96, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:46', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (774, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/774.jpg', 7.90, 6.32, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:46', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (775, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/775.jpg', 3.34, 2.67, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:47', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (776, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/776.jpg', 59.82, 47.85, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:47', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (777, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/777.jpg', 67.13, 53.70, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:48', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (778, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/778.jpg', 136.53, 109.22, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:48', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (779, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/779.jpg', 33.84, 27.07, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:49', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (780, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/780.jpg', 100.00, 80.00, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:50', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (781, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/781.jpg', 82.85, 66.28, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:50', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (782, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/782.jpg', 19.16, 15.33, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:51', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (783, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/783.jpg', 111.70, 89.36, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:51', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (784, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/784.jpg', 86.15, 68.92, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:52', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (785, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/785.jpg', 159.09, 127.28, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:53', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (786, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/786.jpg', 181.67, 145.34, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:53', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (787, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/787.jpg', 188.51, 150.81, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:54', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (788, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/788.jpg', 92.50, 74.00, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:54', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (789, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/789.jpg', 43.20, 34.56, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:55', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (790, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/790.jpg', 192.80, 154.24, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:56', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (791, 2, '数据结构精讲 更适合0算法基础入门到进阶（java版）', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/791.jpg', 105.14, 84.11, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:56', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (792, 2, 'BAT大牛亲授 个性化推荐算法实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/792.jpg', 139.27, 111.42, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:57', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (793, 2, '编程必备基础 大话HTTP协议', '会员免费', 'http://oss1.wuzhaoqi.top/course/2022-06-28/793.jpg', 104.22, 83.38, NULL, '2022-03-27 19:36:31', '2022-06-28 15:51:57', 0, 2, 5, NULL);
INSERT INTO `course` VALUES (794, 2, 'Android中的WebView实战详解', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250498711.jpg!cover_270', 91.93, 73.54, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (795, 2, 'Android中的Http通信', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250543669.jpg!cover_270', 148.59, 118.87, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (796, 2, 'Android-自定义ViewPager指示器', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251519528.jpg!cover_270', 159.76, 127.81, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (797, 2, 'HOOK原理解析', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202004280932454802.jpg!cover_270', 193.65, 154.92, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (798, 2, 'android移动互联网高级开发', '会员免费', 'https://course-1255691183.file.myqcloud.com/img/cover/202004281112401981.jpg!cover_270', 119.22, 95.38, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (799, 2, '玩儿转Swift2.0（第一季）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251558083.jpg!cover_270', 188.12, 150.50, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (800, 2, 'Android系统Root原理初探', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250272427.jpg!cover_270', 45.37, 36.30, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (801, 2, '玩儿转Swift', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250275356.jpg!cover_270', 136.62, 109.30, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (802, 2, 'Android-重识Activity', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251057261.jpg!cover_270', 132.09, 105.67, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:31', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (803, 2, '玩儿转Swift2.0（第二季）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251575475.jpg!cover_270', 57.72, 46.18, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (804, 2, '图形手势识别', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250282251.jpg!cover_270', 115.82, 92.66, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (805, 2, 'Android-深入Activity', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251072144.jpg!cover_270', 81.77, 65.42, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (806, 2, 'Android的ListView下拉刷新', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250294272.jpg!cover_270', 32.37, 25.90, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (807, 2, 'Android的ListView分页功能', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250296411.jpg!cover_270', 175.64, 140.51, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (808, 2, 'iOS基础教程-文件操作', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252009191.jpg!cover_270', 43.17, 34.54, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (809, 2, 'iOS基础教程之-Camera摄像头', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252013258.jpg!cover_270', 97.25, 77.80, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (810, 2, 'iOS基础教程-SQLite数据库操作', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252012603.jpg!cover_270', 33.86, 27.09, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (811, 2, '玩儿转Swift2.0（第三季）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252027814.jpg!cover_270', 72.06, 57.65, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (812, 2, 'iOS基础教程-网络操作', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252047208.jpg!cover_270', 187.58, 150.06, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (813, 2, 'Android猜歌游戏是这样炼成的', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250354333.jpg!cover_270', 152.87, 122.30, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (814, 2, 'Alamofire的最佳实践', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252042442.jpg!cover_270', 157.35, 125.88, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (815, 2, 'iOS基础入门之Foundation框架初体验', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251134905.jpg!cover_270', 82.63, 66.10, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (816, 2, '玩儿转Swift2.0（第四季）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252053260.jpg!cover_270', 145.34, 116.27, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (817, 2, 'iOS基础教程-数据解析', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252061757.jpg!cover_270', 11.81, 9.45, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (818, 2, 'iOS动画案例之会跳舞的界面(上)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251183447.jpg!cover_270', 87.00, 69.60, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (819, 2, '见证Android消息推送时刻', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250426811.jpg!cover_270', 43.72, 34.98, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (820, 2, 'iOS基础教程之界面初体验', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251273751.jpg!cover_270', 31.60, 25.28, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (821, 2, 'iOS开发之传感器', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253112902.jpg!cover_270', 82.86, 66.29, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (822, 2, '使用ViewPager实现卡片式问答项目（上）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253403174.jpg!cover_270', 7.33, 5.86, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (823, 2, 'Cocos2d-x坦克大战（下）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252005009.jpg!cover_270', 66.06, 52.85, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (824, 2, 'Android图案解锁', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250546217.jpg!cover_270', 13.18, 10.54, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (825, 2, 'iOS开发之LeanCloud', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253163396.jpg!cover_270', 59.94, 47.96, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (826, 2, '使用ViewPager实现卡片式问答项目（下）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253412207.jpg!cover_270', 146.71, 117.37, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (827, 2, 'Ruff物联网应用开发入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253075778.jpg!cover_270', 140.13, 112.10, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (828, 2, 'iOS-特效相机(上集)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252332389.jpg!cover_270', 166.82, 133.45, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (829, 2, 'ViewPager+Tab特效实现微信主界面', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253398571.jpg!cover_270', 30.53, 24.43, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (830, 2, 'Android多图上传技术实战之多文件封装上传', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252478154.jpg!cover_270', 16.00, 12.80, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (831, 2, 'Android性能优化之图片优化', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253285475.jpg!cover_270', 9.79, 7.83, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (832, 2, '破解Retrofit', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253423327.jpg!cover_270', 153.74, 122.99, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (833, 2, 'Android基础教程-SQLite高级操作', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252194970.jpg!cover_270', 95.83, 76.67, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (834, 2, 'iOS基础之搞定多线程', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252228621.jpg!cover_270', 149.49, 119.59, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (835, 2, 'iOS开发之Realm数据库', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252281825.jpg!cover_270', 39.84, 31.88, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (836, 2, 'Cocos2d-x基础教程二-会动的时钟', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251381501.jpg!cover_270', 73.56, 58.85, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (837, 2, 'Flutter从入门到进阶实战携程网App', '', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253463569.jpg!cover_270', 12.77, 10.22, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (838, 2, '慕课音乐（一）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253369033.jpg!cover_270', 131.26, 105.01, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (839, 2, 'Android瀑布流图片显示', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252464836.jpg!cover_270', 98.71, 78.97, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (840, 2, 'Android依赖管理与私服搭建', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252292858.jpg!cover_270', 188.94, 151.15, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (841, 2, 'Android多图上传技术实战之http普通请求封装', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252474207.jpg!cover_270', 141.73, 113.38, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (842, 2, '360加速球核心效果实现', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252083211.jpg!cover_270', 20.64, 16.51, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (843, 2, 'Cocos2d-x游戏开发入门-贪吃蛇(下)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251315888.jpg!cover_270', 179.11, 143.29, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (844, 2, 'Android蓝牙本地操作', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252239167.jpg!cover_270', 196.92, 157.53, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (845, 2, 'Android-节日短信送祝福（功能篇）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251331802.jpg!cover_270', 63.51, 50.81, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (846, 2, '不一样的自定义实现轮播图效果', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252278022.jpg!cover_270', 178.92, 143.14, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (847, 2, 'iOS之ReactiveCocoa框架', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252317992.jpg!cover_270', 187.85, 150.28, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (848, 2, 'iOS-特效相机(下集)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252344395.jpg!cover_270', 163.66, 130.93, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (849, 2, 'Objective-C面向对象初体验', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251036575.jpg!cover_270', 15.60, 12.48, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (850, 2, 'Android节目直播案例开发', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252579971.jpg!cover_270', 142.88, 114.30, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (851, 2, '移动端音频视频入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253076728.jpg!cover_270', 49.84, 39.87, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (852, 2, 'Android-节日短信送祝福(UI篇)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251322019.jpg!cover_270', 136.46, 109.17, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (853, 2, 'Android语音词典', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252256847.jpg!cover_270', 189.64, 151.71, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (854, 2, 'Flutter入门与案例实战', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253349113.jpg!cover_270', 191.12, 152.89, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (855, 2, 'iOS界面间传值', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252443364.jpg!cover_270', 192.02, 153.62, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (856, 2, '面试提升必备 全面解析iOS中的Runtime机制', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242302309207.jpg!cover_270', 0.07, 0.06, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (857, 2, '懒人必备之Android效率开发框架', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251166511.jpg!cover_270', 131.16, 104.93, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (858, 2, 'Cocos2d-x初体验之Lua篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251199756.jpg!cover_270', 5.67, 4.53, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (859, 2, 'iOS基础之UIImageView知识拓展(上)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252129970.jpg!cover_270', 199.89, 159.91, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (860, 2, 'WeTest移动测试系列沙龙-手游安全测试', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252332427.jpg!cover_270', 154.28, 123.43, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (861, 2, 'Android多种方式实现流式布局', '会员免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253442504.jpg!cover_270', 187.18, 149.75, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (862, 2, 'Android-仿微信语音聊天', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251053329.jpg!cover_270', 143.88, 115.11, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (863, 2, 'Fragment应用下', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252545356.jpg!cover_270', 171.85, 137.48, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (864, 2, 'Bitmap高效缓存', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252558955.jpg!cover_270', 54.97, 43.97, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (865, 2, 'Cocos2d-x全民俄罗斯（上）', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252022786.jpg!cover_270', 158.52, 126.82, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (866, 2, '企业级Android应用架构设计与开发', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242302312270.jpg!cover_270', 104.70, 83.76, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (867, 2, 'Android的各种Drawable讲解', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252073724.jpg!cover_270', 36.37, 29.10, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (868, 2, '长连接利器-网络框架解析之mina篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252071126.jpg!cover_270', 183.51, 146.81, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (869, 2, 'okhttp框架解析与应用', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252176708.jpg!cover_270', 31.07, 24.85, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (870, 2, '即时通讯项目里面的语音处理-基础实现篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252179328.jpg!cover_270', 198.49, 158.79, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (871, 2, 'Android记账本', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252306717.jpg!cover_270', 42.07, 33.66, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (872, 2, '新春特辑-Cocos抢红包', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251478241.jpg!cover_270', 187.35, 149.88, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (873, 2, 'Android-打造炫酷进度条', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252006217.jpg!cover_270', 83.84, 67.07, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (874, 2, 'AndroidMultidex原理及实现', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252077326.jpg!cover_270', 11.18, 8.94, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (875, 2, 'iOS开发之网络协议', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253091010.jpg!cover_270', 182.78, 146.23, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (876, 2, '带您完成神秘的涟漪按钮效果-提高篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252189498.jpg!cover_270', 169.19, 135.35, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (877, 2, '新版React Native从入门到实战打造高质量上线App', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303072610.jpg!cover_270', 1.65, 1.32, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (878, 2, 'Unity3D-菜鸟先飞之NGUI基础', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251397872.jpg!cover_270', 191.01, 152.81, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (879, 2, '带你开发类似PokemonGo的AR游戏', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252406133.jpg!cover_270', 77.69, 62.15, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (880, 2, 'Android图表绘制之直方图', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252482948.jpg!cover_270', 193.21, 154.57, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (881, 2, 'Android-打造万能适配器', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251034542.jpg!cover_270', 56.11, 44.89, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (882, 2, 'Jetpack全组件实战 开发短视频应用App', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242300082981.jpg!cover_270', 180.30, 144.24, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (883, 2, 'Android动感系列-扫一扫', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251585584.jpg!cover_270', 190.70, 152.56, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (884, 2, 'Android-Service系列之Notification综合应用', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251591772.jpg!cover_270', 23.66, 18.93, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (885, 2, 'Unity3D地形编辑器', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252027863.jpg!cover_270', 161.40, 129.12, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (886, 2, '聚焦市场开发热门技术 手把手带你开发商业级社交App', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242302166065.jpg!cover_270', 164.67, 131.73, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (887, 2, 'Android高级特效-3D画廊', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251212670.jpg!cover_270', 43.96, 35.17, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (888, 2, 'AndroidDataBinding实战-高级篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252142444.jpg!cover_270', 114.51, 91.61, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (889, 2, 'Android高级特效-索引', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251295142.jpg!cover_270', 59.52, 47.62, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (890, 2, 'Flutter开发-Dart编程语言入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253222988.jpg!cover_270', 118.64, 94.92, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (891, 2, 'Android-实用的App换肤功能', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252257749.jpg!cover_270', 56.95, 45.56, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (892, 2, 'Android视频播放器', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252264828.jpg!cover_270', 128.46, 102.77, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (893, 2, 'Android应用发展趋势必备武器  热修复与插件化', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242304157879.jpg!cover_270', 44.97, 35.98, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (894, 2, 'Android-Service系列之断点续传下载', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251019835.jpg!cover_270', 189.52, 151.61, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (895, 2, 'Android必学-AsyncTask基础', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251043069.jpg!cover_270', 25.84, 20.67, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (896, 2, 'iOS之分享集成', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252542918.jpg!cover_270', 179.45, 143.56, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (897, 2, '快速实现不一样的移动拼图', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252073529.jpg!cover_270', 99.58, 79.66, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (898, 2, '即时通讯项目里面的语音处理-提高优化篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252247991.jpg!cover_270', 179.75, 143.80, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (899, 2, 'Swift之网络常见术语', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253245358.jpg!cover_270', 46.82, 37.45, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (900, 2, 'Gradle3.0自动化项目构建技术精讲+实战', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303443910.jpg!cover_270', 164.69, 131.76, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (901, 2, 'RxJava与RxAndroid基础入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252483048.jpg!cover_270', 75.94, 60.75, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (902, 2, 'Android互动直播APP开发入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252583330.jpg!cover_270', 163.97, 131.18, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (903, 2, '应用自动更新组件开发', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252087563.jpg!cover_270', 82.76, 66.21, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (904, 2, '视频WebRTC实时互动直播技术入门与实战', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242302523563.jpg!cover_270', 180.98, 144.78, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (905, 2, 'Android与WebView的js交互', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253113877.jpg!cover_270', 41.26, 33.01, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (906, 2, 'Flutter从入门到进阶 实战携程网App', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303014508.jpg!cover_270', 107.69, 86.15, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (907, 2, '带你实现别样的Android侧滑菜单', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252183281.jpg!cover_270', 174.32, 139.46, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (908, 2, 'Retrofit网络库', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253165771.jpg!cover_270', 103.99, 83.19, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (909, 2, 'Android网络框架-OkHttp使用', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252222758.jpg!cover_270', 73.48, 58.78, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (910, 2, 'Unity3D刚体实现平衡球游戏', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253221322.jpg!cover_270', 142.68, 114.15, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (911, 2, 'Android面试常客Handler详解', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250489641.jpg!cover_270', 104.51, 83.61, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (912, 2, 'Android面试解密-Layout_weight', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251351410.jpg!cover_270', 150.75, 120.60, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (913, 2, 'Unity3D-万圣前夜之惊声尖笑', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251364687.jpg!cover_270', 87.55, 70.04, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (914, 2, 'Android-Widget桌面小组件', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251372551.jpg!cover_270', 97.97, 78.37, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (915, 2, 'Unity3D快速入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250558655.jpg!cover_270', 140.14, 112.11, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (916, 2, 'Android面试解密-自定义View', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251431037.jpg!cover_270', 42.07, 33.66, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (917, 2, 'Android中的Http通信', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253344300.jpg!cover_270', 62.29, 49.83, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (918, 2, 'Fragment应用上', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252515869.jpg!cover_270', 185.38, 148.30, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (919, 2, '剖析Framework面试 冲击Android高级职位', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242302491622.jpg!cover_270', 93.95, 75.16, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (920, 2, 'AndroidUiAutomator2.0入门实战', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253139921.jpg!cover_270', 35.26, 28.21, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (921, 2, '大厂资深面试官 带你破解Android高级面试', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303037133.jpg!cover_270', 136.59, 109.27, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (922, 2, 'Android框架-GreenDao', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252211183.jpg!cover_270', 195.36, 156.29, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (923, 2, 'Android自定义任意层级树形控件', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250533083.jpg!cover_270', 178.07, 142.45, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (924, 2, 'AIDL-小白成长记', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251505639.jpg!cover_270', 6.92, 5.53, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (925, 2, '手机服务器微架构设计与实现', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252059036.jpg!cover_270', 49.04, 39.23, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (926, 2, '明日之星-RecyclerView', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251146282.jpg!cover_270', 171.10, 136.88, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (927, 2, 'Android实现抽奖转盘', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251188670.jpg!cover_270', 152.39, 121.91, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (928, 2, 'RecyclerView优雅实现复杂列表布局', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252165628.jpg!cover_270', 131.54, 105.23, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (929, 2, 'Android属性动画赏析', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250483862.jpg!cover_270', 105.72, 84.58, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (930, 2, 'Android图像处理-打造美图秀秀从它开始', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250535488.jpg!cover_270', 98.23, 78.58, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (931, 2, 'Android图像处理-变\"换\"莫测的图像', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250581443.jpg!cover_270', 110.76, 88.61, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (932, 2, '集成MultiDex项目实战', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252479567.jpg!cover_270', 123.59, 98.87, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (933, 2, 'Android必学-BaseAdapter的使用与优化', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251019484.jpg!cover_270', 78.63, 62.90, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (934, 2, 'iOS基础之UIImageView知识拓展(下)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252153747.jpg!cover_270', 72.43, 57.94, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (935, 2, '自定义实现日历控件', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252241657.jpg!cover_270', 93.40, 74.72, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (936, 2, '基于GitHub App业务深度讲解 Kotlin高级特性与框架设计', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303355478.jpg!cover_270', 89.15, 71.32, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (937, 2, 'Android引导页实现的四种方式', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252466567.jpg!cover_270', 160.73, 128.59, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (938, 2, 'iOS-五子棋大战', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251588998.jpg!cover_270', 88.77, 71.01, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (939, 2, 'Cocos2d-x游戏开发初体验-C++篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251096946.jpg!cover_270', 165.57, 132.46, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (940, 2, '新版Kotlin从入门到精通', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242302085804.jpg!cover_270', 167.73, 134.19, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (941, 2, 'Unity3D菜鸟先飞之NGUI实战篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252012775.jpg!cover_270', 133.45, 106.76, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (942, 2, 'Cocos2d-x游戏开发之贪吃蛇(上)', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251274658.jpg!cover_270', 34.22, 27.38, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (943, 2, 'Android基础-初识SQLite', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252193773.jpg!cover_270', 60.85, 48.68, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (944, 2, 'PullToRefresh', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253185241.jpg!cover_270', 135.70, 108.56, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (945, 2, 'AndroidUI模板设计', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250452664.jpg!cover_270', 38.58, 30.86, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (946, 2, 'Android摄像头基础', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251371339.jpg!cover_270', 58.86, 47.09, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (947, 2, 'Android实现卫星菜单', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250539166.jpg!cover_270', 151.20, 120.96, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (948, 2, '新浪微博资深大牛全方位剖析 iOS 高级面试', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303465918.jpg!cover_270', 189.81, 151.85, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (949, 2, '手把手开发一个完整即时通讯App', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242304171395.jpg!cover_270', 89.11, 71.29, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (950, 2, 'Android-NDK进阶', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252571100.jpg!cover_270', 51.37, 41.10, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (951, 2, 'Android-NDK入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251119497.jpg!cover_270', 176.90, 141.52, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (952, 2, 'App压力测试入门', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252166552.jpg!cover_270', 32.77, 26.22, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (953, 2, 'Android-屏幕适配全攻略', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251267803.jpg!cover_270', 101.84, 81.47, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (954, 2, 'Cocos2d-x游戏开发基础之Lua基础篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251267827.jpg!cover_270', 50.91, 40.73, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (955, 2, '带您完成神秘的涟漪按钮效果-入门篇', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252187100.jpg!cover_270', 45.99, 36.79, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:32', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (956, 2, 'Socket网络编程进阶与实战', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303152600.jpg!cover_270', 142.07, 113.65, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:33', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (957, 2, 'FFmpeg音视频核心技术精讲与实战', '', 'https://course-1255691183.file.myqcloud.com/img/cover/202001242303192372.jpg!cover_270', 189.75, 151.80, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:33', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (958, 2, 'Android性能优化之布局优化', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253223512.jpg!cover_270', 90.16, 72.13, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:33', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (959, 2, '《小十传奇》Unity3D休闲游戏开发', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302250501802.jpg!cover_270', 95.80, 76.64, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:33', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (960, 2, 'Android代码混淆与加固技术', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302252486639.jpg!cover_270', 119.45, 95.56, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:33', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (961, 2, 'Android-Service系列之多线程断点续传下载', '免费', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302251044105.jpg!cover_270', 13.19, 10.55, NULL, '2022-03-27 20:21:15', '2022-03-27 19:40:33', 1, 0, 3, NULL);
INSERT INTO `course` VALUES (962, 2, 'Android中的WebView实战详解', '简介：是不是有很多人疑问：为什么页面可以显示在App中呢？这是怎么来实现的呢？其实，这是通过一个控件-WebView来实现的，本课程就将介绍WebView是什么、怎么使用、如何下载文件、错误码处理、Cookie同步问题、JS混淆调用问题以及远程注入问题，最后介绍一下自定义协议的拦截', 'http://oss1.wuzhaoqi.top/course/2022-06-28/962.jpg', 182.36, 145.88, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:17', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (963, 2, 'Android中的Http通信', '简介：本次课程将带领大家android当中网络交互处理，例如常见的post、get请求以及相关知识的应用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/963.jpg', 24.72, 19.78, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:17', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (964, 2, 'Android-自定义ViewPager指示器', '简介：本节课将一步步实现仿“今日头条”等各大APP的跟随型ViewPager指示器，学完保准压倒一片！自定义View更上一层楼！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/964.jpg', 151.78, 121.42, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:18', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (965, 2, 'HOOK原理解析', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/965.jpg', 148.26, 118.60, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:18', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (966, 2, 'android移动互联网高级开发', '优盘优盘优盘,今天介绍一款在线教育相关的软件：酷瓜云课堂-腾讯云版，目前还在不断的迭代当中，从他们的 GIT 提交来看，那是相当的活跃，基本每天都有提交。,酷瓜云课堂，依托腾讯云基础服务架构，采用 C 扩展框架 Phalcon 开发，致力网络教育软件。,实现了点播、直播、专栏、会员、微聊等，是一个完整的产品，具体功能我也不想写一大堆，自己体验吧！,帐号：100015@163.com / 123456 (前后台通用)', 'http://oss1.wuzhaoqi.top/course/2022-06-28/966.jpg', 57.11, 45.69, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:19', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (967, 2, '玩儿转Swift2.0（第一季）', '简介：介绍2.0新版本Swift语言的基础知识 。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/967.jpg', 97.26, 77.81, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:19', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (968, 2, 'Android系统Root原理初探', '简介：本课程以深入浅出的方式介绍Android Root原理。当然，本课程最主要的内容是教会小白从源代码的角度如何root自己的Android手机。其中包括制作Recovery升级包、Edify语言常用函数介绍、定制updater-script脚本文件、在Recovery模式下刷机、分析su.c源代码等内容。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/968.jpg', 73.63, 58.90, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:20', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (969, 2, '玩儿转Swift', '简介：我们期望用户在看完这套教程后，对swift语言的了解能达到中上水平。这意味着在接触Cocoa Touch将一点儿都不费劲，对一些高级概念，诸如闭包、协议、泛型、内存管理都能有所理解并且有所实践。这套教程一定比市面上普遍看到的Swift中文教程深入，并且演示示例更丰富。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/969.jpg', 107.93, 86.34, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:21', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (970, 2, 'Android-重识Activity', '简介：Activity作为Android开发实在是太常见了,但是你真的会用Activity吗？本课程为Activity的系列课程的第一讲，将带大家学习Android中最常用的Activity组件的那些事', 'http://oss1.wuzhaoqi.top/course/2022-06-28/970.jpg', 184.62, 147.70, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:21', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (971, 2, '玩儿转Swift2.0（第二季）', '简介：本课程以Swift 2.1版本进行讲解，课程发布期间，Swift语言进行的更新将同步在本课程的代码中展现。欢迎同学们随时关注课程公告及课程问答区，紧跟Swift语言的步伐，学习最新示例代码！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/971.jpg', 149.12, 119.29, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:22', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (972, 2, '图形手势识别', '简介：随着智能触控设备的发展，图形手势也越来越多的应用在设备中，比如很多游戏中支持的手势。那么，图形手势识别的实现算法是怎样的？本课程将带领你来揭秘。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/972.jpg', 131.01, 104.81, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:22', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (973, 2, 'Android-深入Activity', '简介：Activity作为Android开发实在是太常见了,但是你真的会用Activity吗？本课程是Activity系列的第2部分，将继续为大家讲解Activity的相关知识', 'http://oss1.wuzhaoqi.top/course/2022-06-28/973.jpg', 108.65, 86.92, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:23', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (974, 2, 'Android的ListView下拉刷新', '简介：ListView是Android开发中最常用的控件之一，各种应用都在想尽办法的挖掘其潜能，下拉刷新功能就是目前非常流行的一个功能，本课程就将分享一个实现ListView下拉刷新功能的技巧', 'http://oss1.wuzhaoqi.top/course/2022-06-28/974.jpg', 187.56, 150.05, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:23', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (975, 2, 'Android的ListView分页功能', '简介：本课程讲解一种实现ListView分页功能，listView是我们开发中使用最平凡的一个控件，当我们的数据很多的时候一页并不能放下，这个时候我们就需要listView的分页加载来实现，将数据分开显示出来。那么如何去分页呢，分页操作过程中有什么需要注意的呢？看视频就有答案', 'http://oss1.wuzhaoqi.top/course/2022-06-28/975.jpg', 52.48, 41.98, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:24', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (976, 2, 'iOS基础教程-文件操作', '简介：从沙盒机制为切入点,通过对常见需求的分析,详细讲解iOS自有的文件处理类和SQLite的基本知识以及在项目开发中的简单使用.内容涉及文件夹和文件的创建和删除,SQLite的增删改查.', 'http://oss1.wuzhaoqi.top/course/2022-06-28/976.jpg', 120.89, 96.71, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:25', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (977, 2, 'iOS基础教程之-Camera摄像头', '简介：从实例出发介绍我们的Camera，可以实现Camera属性检测，照片拍摄，视频录制，图片展示，录制视频播放，图片存储，照片库扫描，拍摄视频编辑等Camera处理的基础功能', 'http://oss1.wuzhaoqi.top/course/2022-06-28/977.jpg', 156.37, 125.10, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:34', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (978, 2, 'iOS基础教程-SQLite数据库操作', '简介：本章由简入繁地对SQLite中增、删、改、查的语法进行详细的讲解，并且以实例的形式演示在项目开发中对SQLite这四中语法的使用。步骤清晰、易懂，很容易就能上手', 'http://oss1.wuzhaoqi.top/course/2022-06-28/978.jpg', 152.85, 122.28, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:35', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (979, 2, '玩儿转Swift2.0（第三季）', '简介：本课程是基于Swift2.2的基础课程第三季，liuyubobobo老师将为大家详细讲解面向对象编程的那点儿事。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/979.jpg', 117.22, 93.78, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:35', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (980, 2, 'iOS基础教程-网络操作', '简介：如何使用NSURLConnection和NSURLRequest在iOS框架下发送网络请求，接收网络请求，并且学习了解一些常见的http状态码代表什么意思，怎么去解析获取数据展示到用户界面上', 'http://oss1.wuzhaoqi.top/course/2022-06-28/980.jpg', 112.92, 90.34, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:36', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (981, 2, 'Android猜歌游戏是这样炼成的', '简介：《疯狂猜歌》是时下非常流行的一款益智类游戏，本课程会详细的向您介绍游戏实现的全部细节。课程由浅入深，不但包含游戏中图片的使用，界面的设计及实现，音乐的播放，动画的使用等UI相关的部分，更有MVC框架设计，设计模式的使用，代码优化，微信接口调用等代码相关内容', 'http://oss1.wuzhaoqi.top/course/2022-06-28/981.jpg', 129.66, 103.73, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:36', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (982, 2, 'Alamofire的最佳实践', '简介：本课程用6个问题作为整个课程的主线， 在解决问题的过程中更深入的去学习一些更高级的用法，快速理解swift http请求框架Alamofire的基本使用以及常见问题的解决方案', 'http://oss1.wuzhaoqi.top/course/2022-06-28/982.jpg', 81.47, 65.18, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:37', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (983, 2, 'iOS基础入门之Foundation框架初体验', '简介：在iOS里，你可以找到很多能在应用程序里调用的框架，例如Foundation、UIKit和Core Graphics等等。如果你需要使用一个框架，你就要将它添加到你的项目中。而当你开发程序，你主要会用到的框架就是Foundation和UIKit了，因为它们能满足你所需要的大部分东西。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/983.jpg', 74.96, 59.97, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:38', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (984, 2, '玩儿转Swift2.0（第四季）', '简介：本课程是基于Swift2.2的基础课程第四季，也是最后一季。liuyubobobo老师将为大家详细讲解swift语言更多高级语言特性：下标、运算符重载、扩展、泛型、协议和面向协议的编程思想、错误处理、内存管理、类型转换。希望通过最终季的学习，大家真正玩儿转swift！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/984.jpg', 169.81, 135.85, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:39', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (985, 2, 'iOS基础教程-数据解析', '简介：iPhone手机的原生应用天气预预报相信大家都使用过，那么如何获取天气数据呢如何将数据解析出来呢？本课程将通过天气预报的案例为大家讲解iOS中如何解析JSON数据和XML格式的数据', 'http://oss1.wuzhaoqi.top/course/2022-06-28/985.jpg', 151.43, 121.14, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:39', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (986, 2, 'iOS动画案例之会跳舞的界面(上)', '简介：Jake大神的又一个新作,利用在iOS动画基础课程的基础上，添加了更丰富的动画使界面有了生命，很大程度的提升用户体验，让我们的界面更加优美生动', 'http://oss1.wuzhaoqi.top/course/2022-06-28/986.jpg', 176.44, 141.15, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:40', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (987, 2, '见证Android消息推送时刻', '简介：本课程将一步步教你如何搭建出一个自己的Android推送平台，包括完整的Android客户端和服务器端的代码。内容由浅入深，循序渐进，理论和实战完美结合，快来和我一起见证Android消息推送时刻吧！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/987.jpg', 97.56, 78.05, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:40', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (988, 2, 'iOS基础教程之界面初体验', '简介：本课程为ios的基础课程，将为大家介绍如何在ios上进行界面的开发，在这里可以学会怎样在界面上显示自己喜欢的图片，展示自己喜欢的文字，让你体会到界面的神奇所在。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/988.jpg', 125.55, 100.44, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:41', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (989, 2, 'iOS开发之传感器', '简介：本课程给大家补充介绍iOS中常见的传感器，并通过图解的方式详细介绍了加速度传感器以及角速度传感器。最后通过实际的Demo源码演示并分析整个实现的过程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/989.jpg', 164.91, 131.93, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:41', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (990, 2, '使用ViewPager实现卡片式问答项目（上）', '简介：本门课程将带大家从零开始开发一个在线答题app。本课程分为“上”和“下”两个部分，在“上”中，我们将从需求分析开始，使用mvp构建模式搭建框架，完成项目的布局，网络数据请求，答题控件开发和逻辑实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/990.jpg', 113.17, 90.54, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:42', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (991, 2, 'Cocos2d-x坦克大战（下）', '简介：本次课程将为大家介绍敌人的生成和敌人动作的人工智能以及对象交互及阵营处理。最后当然不能少了游戏中最重要的地图编辑器~~！快来开始吧', 'http://oss1.wuzhaoqi.top/course/2022-06-28/991.jpg', 112.05, 89.64, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:43', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (992, 2, 'Android图案解锁', '简介：本课程将带领大家通过自定义控件实现一个图案解锁的功能，包括自定义控件的使用、常见绘图操作、控件事件处理、监听器使用、以及综合案例的应用', 'http://oss1.wuzhaoqi.top/course/2022-06-28/992.jpg', 38.83, 31.06, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:49', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (993, 2, 'iOS开发之LeanCloud', '简介：学习本课程可以快速开发一款带后台的App，而又无需自己开发后台。并通过实际应用完成SDK的接入，以及相关的使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/993.jpg', 65.04, 52.03, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:50', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (994, 2, '使用ViewPager实现卡片式问答项目（下）', '简介：本门课程将带大家从零开始开发一个在线答题app。本课程分为“上”和“下”两个部分，在“上”中，我们已经从需求分析开始，使用mvp构建模式搭建框架，完成项目的布局，网络数据请求，答题控件开发和逻辑实现。“下”中，我们将完成表情雨的特效实现，卡片的切换动画效果，使用GreenDao实现数据的持久化，底部广告条的实现，掌握项目的异常处理以及git管理项目和开源项目发布等技术。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/994.jpg', 121.65, 97.32, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:50', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (995, 2, 'Ruff物联网应用开发入门', '简介：本课程将带大家打开Ruff物联网应用开发之门，首先会介绍Ruff最基础的内容和特性，然后介绍Ruff 开发中的硬件控制部分，接着介绍Ruff 开发中的联网操作， Ruff 开发中如何集成互联网服务，最后对Ruff驱动开发进行简要入门知识讲解。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/995.jpg', 53.68, 42.94, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:51', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (996, 2, 'iOS-特效相机(上集)', '简介：本课程为特效相机课程第一部分，重点为大家介绍数字图像处理基础知识、使用场景以及常用框架，给大家一个数字图像处理感性的认识，培养对数字图像处理的兴趣。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/996.jpg', 126.61, 101.29, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:51', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (997, 2, 'ViewPager+Tab特效实现微信主界面', '简介：本课程以微信主界面为例，介绍如何使用ViewPager和FragmentPagerAdapter实现多页面滑动效果，底部Tab的指示器动画特效，还将扩展ViewPager实现透明度渐变、旋转等特效。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/997.jpg', 144.23, 115.38, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:52', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (998, 2, 'Android多图上传技术实战之多文件封装上传', '简介：Android多图上传技术实战之多文件上传封装', 'http://oss1.wuzhaoqi.top/course/2022-06-28/998.jpg', 49.90, 39.92, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:52', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (999, 2, 'Android性能优化之图片优化', '简介：通过本次课可以学会图片优化的几种方法，解决Android面试中图片优化的相关问题，并且学会开发一个Android照片墙案例。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/999.jpg', 185.18, 148.15, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:53', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1000, 2, '破解Retrofit', '简介：Retrofit是一个很优秀的网络请求框架，它运用了Java的一些比较有趣却又多少有些讳莫如深的特性来做到这一点，你肯定很好奇这些特性究竟是怎么回事，也很想了解他们还能用在哪里，来吧，这门课将会给出你想要的答案。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1000.jpg', 126.67, 101.33, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:54', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1001, 2, 'Android基础教程-SQLite高级操作', '简介：本课程主要给大家讲解Sqlite数据库中的查询操作，与数据库相关的数据库的适配器，事务的操作以及数据的分页加载', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1001.jpg', 25.92, 20.73, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:54', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1002, 2, 'iOS基础之搞定多线程', '简介：本课程是iOS基础之搞定多线程，主要针对多线程的基础知识。目前开发过程中多线程是必不可少的，占据着重要的地位。如果想提高程序的执行效率，就必须掌握多线程。本门课程将重点介绍多线程的四种实现技术方案，分别是pThread，NSThread，GCD和NSOperation。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1002.jpg', 176.05, 140.84, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:55', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1003, 2, 'iOS开发之Realm数据库', '简介：本门课程主要讲解Realm数据库的安装，Realm数据库的基本操作，并且通过一些实例来完成数据的增删改查，以及数据库的基本配置。让你从开始接触到上手使用，只需短短几分钟。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1003.jpg', 2.44, 1.95, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:55', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1004, 2, 'Cocos2d-x基础教程二-会动的时钟', '简介：是否在玩游戏的时候听到过很多名词？比如精灵，场景，粒子，渲染，骨骼动画等等。是否对这些名词既熟悉又陌生？那么你的救星来了!本节课程是对基础元素的讲解，旨在入门Cocos2d-x引擎', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1004.jpg', 138.23, 110.58, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:56', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1005, 2, 'Flutter从入门到进阶实战携程网App', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1005.jpg', 79.83, 63.86, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:56', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1006, 2, '慕课音乐（一）', '简介：不仅能学到自定义控件、第三方框架、Realm数据库等知识点，最终还能完成一个炫酷的音乐APP。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1006.jpg', 189.00, 151.20, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:57', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1007, 2, 'Android瀑布流图片显示', '简介：Android瀑布流图片显示', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1007.jpg', 145.52, 116.42, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:58', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1008, 2, 'Android依赖管理与私服搭建', '简介：本课程讲的是Android依赖管理与私服搭建，首先会对Android依赖管理做一个简单介绍，让大家有个初步认识，然后为大家讲解Android依赖的多种引入方式，接着只如何在不同的平台下搭建自己的私服以及如何创建个人代码仓库，最后对课程内容进行总结\n傅老师的实战进阶课程《Android通用框架设计与完整电商APP开发》http://coding.imooc.com/class/116.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1008.jpg', 46.18, 36.94, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:58', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1009, 2, 'Android多图上传技术实战之http普通请求封装', '简介：目标：Http实现两种方式的多文件、大文件上传。\n案例：仿微信朋友圈多图上传发布。\n用途：上传图片，语音、视频等。\n场景：淘宝客户端商家发布商品时多图上传。微信、QQ发动态时，多图上传。微信QQ发送语音、视频时传输大文件。\n基础知识：流的使用、主线程和子线程的通信。\n重点难点：用流写出模拟Http表单的数据。\n重要性：★★★★', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1009.jpg', 139.40, 111.52, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:59', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1010, 2, '360加速球核心效果实现', '简介：本课程通过高仿360加速球核心效果，带大家综合实战自定义控件，事件触摸处理，以及浮窗体等重难点技术。让大家在实战中体会这些知识点在实际项目中的运用，从而能学习致用，打造出更加酷绚的UI和体验更好的产品。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1010.jpg', 67.67, 54.13, NULL, '2022-03-27 20:21:57', '2022-06-28 15:53:59', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1011, 2, 'Cocos2d-x游戏开发入门-贪吃蛇(下)', '简介：本课程将在贪吃蛇游戏的基础上加入一些新的元素，从而符合当下游戏的特性。至于是什么新元素，学了你就知道', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1011.jpg', 138.98, 111.19, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:00', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1012, 2, 'Android蓝牙本地操作', '简介：1.蓝牙概述\n2.蓝牙功能\n3.如何获取本地蓝牙信息\n4.如何绑定蓝牙\n5.如何使用蓝牙进行数据传输', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1012.jpg', 47.14, 37.71, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:00', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1013, 2, 'Android-节日短信送祝福（功能篇）', '简介：本课程将带领大家实现一个节日短信的应用，课程中包含了TabLayout、FloatingActionButton等design库控件的使用以及如何如何发送短信，监听短信的发送状态等。最后在短信列表部分展示了如何使用LoaderManager及其相关的机制优雅的异步加载数据。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1013.jpg', 175.15, 140.12, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:01', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1014, 2, '不一样的自定义实现轮播图效果', '简介：实现轮播图效果，从无到有，一步步带你走进自定义布局控件的世界，项目案例穿插知识点去讲解，让你真正会懂会用！\nAndroid大牛齐聚之地，这里总有人为你答疑解惑！慕课网Android讨论群 556384357', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1014.jpg', 154.47, 123.57, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:01', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1015, 2, 'iOS之ReactiveCocoa框架', '简介：ReactiveCocoa为事件提供了很多处理方法，而且利用RAC处理事件很方便，可以把要处理的事情和监听的事情的代码放在一起，这样非常方便我们管理，就不需要跳到对应的方法里。而本门课程就会教大家如何灵活运用ReactiveCocoa。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1015.jpg', 96.39, 77.11, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:02', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1016, 2, 'iOS-特效相机(下集)', '简介：本课程为特效相机课程第二部分，重点为大家实现“灰度特效”、“彩色底版特效”、“简单高亮美白特效”算法，并应用在iOS相机上。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1016.jpg', 164.51, 131.61, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:03', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1017, 2, 'Objective-C面向对象初体验', '简介：本课程将带大家学习Objective-C中的面向对象编程，其中会涉及到OC语言中的类，对象，属性以及一些方法和类的函数的应用，为后面的课程打下一个良好的基础', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1017.jpg', 16.69, 13.35, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:03', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1018, 2, 'Android节目直播案例开发', '简介：视频客户端，无外乎点播，直播，其中直播又分互动直播，节目直播，本课程将带大家开发的是一个节目直播的案例，从本课程中可以学习到直播原理及协议，m3u8，直播源以及测试直播源，然后就是界面直播的播放，暂停等界面与逻辑的实现，最后会带大家做关键代码的优化以及总体的梳理与总结，希望大家能掌握节目直播的核心知识，从而向视频点播，互动直播的方向继续发展。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1018.jpg', 140.70, 112.56, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:04', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1019, 2, '移动端音频视频入门', '简介：本课程将首先带大家了解下万人直播架构，然后带大家认知CDN网络是什么，之后会带大家搭建一套简单的直播系统，让大家从整体上对音视频有所了解，然后就是音频知识（包括音频的量化与编码，压缩技术，编解码器选型，AAC），之后是视频知识（包括H264宏块的划分与帧分组，视频压缩技术，H264结构与码流，NAL单元，YUV等），最后会对课程进行总结。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1019.jpg', 141.33, 113.06, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:04', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1020, 2, 'Android-节日短信送祝福(UI篇)', '简介：本课程将带领大家实现一个节日短信的应用，课程中包含了TabLayout、FloatingActionButton等design库控件的使用以及如何如何发送短信，监听短信的发送状态等。最后在短信列表部分展示了如何使用LoaderManager及其相关的机制优雅的异步加载数据。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1020.jpg', 164.84, 131.88, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:05', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1021, 2, 'Android语音词典', '简介：讲解第三方讯飞语音如何使用，如何实现数据解析，如何实现中英文词典的查找功能', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1021.jpg', 62.05, 49.64, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:05', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1022, 2, 'Flutter入门与案例实战', '简介：本课程将从Flutter和主流前端框架的对比开始带你一步步的入门Flutter。最后通过一个电影推荐Demo的实现，增加同学们对Flutter的深刻认识和兴趣。实战课程：《Flutter从入门到进阶实战携程网App》课程地址：https://coding.imooc.com/class/321.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1022.jpg', 159.93, 127.94, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:06', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1023, 2, 'iOS界面间传值', '简介：本课程将为大家以案例的方式介绍界面间传值的6种方式，包括属性传值、单例传值、NSUserDefaults传值、代理传值、block传值以及通知传值。界面间传值将不再是问题。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1023.jpg', 21.00, 16.80, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:06', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1024, 2, '面试提升必备 全面解析iOS中的Runtime机制', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1024.jpg', 169.39, 135.51, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:07', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1025, 2, '懒人必备之Android效率开发框架', '简介：本课程将为大家带来一个快捷方便的Android开发框架，由nate老师为大家详细讲解使用方法，相信同学们学完一定会受益匪浅，缩短编程时间，提高代码质量！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1025.jpg', 164.06, 131.25, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:08', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1026, 2, 'Cocos2d-x初体验之Lua篇', '简介：Lua以其出色的跨平台性和速度最快的嵌入式脚本语言，当仁不让的占据了游戏插件开发的头把交椅。你也想制作一个和大脚一样闻名天下的工具和游戏么？快来吧', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1026.jpg', 119.99, 96.00, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:09', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1027, 2, 'iOS基础之UIImageView知识拓展(上)', '简介：本课程重点介绍图片格式的转换、gif图片的分解、gif动画的展示、gif图片的合成、新图片格式webp以及图片缓存优化的相关知识，让大家能了解到UIImageView更多的用途，用于我们的UIImage展示。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1027.jpg', 18.18, 14.54, NULL, '2022-03-27 20:21:57', '2022-06-28 15:54:10', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1028, 2, 'WeTest移动测试系列沙龙-手游安全测试', '简介：分享腾讯游戏安全测试流程方法，让同行了解安全测试过程中的风险分析方法、安全风险项、测试工具以及测试方案。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1028.jpg', 92.29, 73.83, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:10', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1029, 2, 'Android多种方式实现流式布局', '简介：课程不仅详细介绍了自定义ViewGroup开发的详细步骤，还会教会大家如何利用通用方案优雅的解决复杂问题。课程最后会手把手带大家利用自定义的TagFlowLayout实现标签的单选多选效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1029.jpg', 142.33, 113.86, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:11', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1030, 2, 'Android-仿微信语音聊天', '简介：本课程通过结合自定义View、媒体相关API、Dialog管理等实现Android仿微信语音功能，课程主要涉及自定义录音Button与用户的交互，MediaRecorder实现录音, MediaPlayer实现播放，以及三者间的交互与协作和一系列的UI效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1030.jpg', 195.06, 156.05, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:19', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1031, 2, 'Fragment应用下', '简介：将带领大家一起学习Fragment与Activity间的通信，以及Fragment与Fragment间的通信，以案例的形式展开，让大家能够轻松掌握。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1031.jpg', 3.57, 2.86, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:20', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1032, 2, 'Bitmap高效缓存', '简介：本门课程会介绍Bitmap相关知识点及如何高效加载，还会介绍Android缓存策略，通过综合前面所学模仿ImageLoader实现图片高效加载功能。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1032.jpg', 30.83, 24.67, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:20', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1033, 2, 'Cocos2d-x全民俄罗斯（上）', '简介：本课程将为大家介绍如何使用Cocos2d-X引擎+Lua语言制作俄罗斯方块的场景搭建, 场景类编写, 场景清除, 方块数据建立, 方块变形操作, 方块的顶位处理等内容。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1033.jpg', 32.97, 26.38, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:21', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1034, 2, '企业级Android应用架构设计与开发', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1034.jpg', 46.21, 36.97, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:22', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1035, 2, 'Android的各种Drawable讲解', '简介：介绍各自Drawable：BitmapDrawable、LayerDrawable、LevelListDrawable、TransitionDrawable、InsetDrawable等的常见用法和使用场景\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1035.jpg', 112.99, 90.39, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:22', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1036, 2, '长连接利器-网络框架解析之mina篇', '简介：通过对本课程的学习， 我们要对apache mina框架有深入的了解，并能通过mina与服务器进行通信\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1036.jpg', 83.54, 66.83, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:23', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1037, 2, 'okhttp框架解析与应用', '简介：首先会带领大家了解okhttp网络框架用的优势及它在基本执行流程，了解以后，我们会讲解一些okhttp网络框架常用 的api，最后我们会对其进行一个简单的封装使网络框架变的方便使用。\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1037.jpg', 59.12, 47.30, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:23', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1038, 2, '即时通讯项目里面的语音处理-基础实现篇', '简介：安卓声音录制与播放功能实现，包括录制到文件、播放文件，可以实现类似于微信的语音消息发送与播放，还包括录制到字节流，从字节流播放，可以实现视频直播/实时对讲功能中的声音录制和播放。\nAndroid大牛齐聚之地，这里总有人为你答疑解惑！慕课网Android讨论群 556384357', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1038.jpg', 42.50, 34.00, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:24', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1039, 2, 'Android记账本', '简介：本课程是一个案例课程，主要讲解数据库和第三方库图标的使用', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1039.jpg', 82.25, 65.80, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:25', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1040, 2, '新春特辑-Cocos抢红包', '简介：过年啦雷哥给大家发福利了~不过福利不是妹子而是一项技能：本门课程为一门实例课，同学们可以在课程中体验到动画与动作的基本使用，可作为Cocos第二课到第三课的过渡。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1040.jpg', 177.95, 142.36, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:25', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1041, 2, 'Android-打造炫酷进度条', '简介：进度条即在应用程序处理任务时，实时的，以图形显示处理任务的速度，完成度，剩余未完成任务量的大小，和可能需要处理时间，一般以长方形条状显示。本门课程将为大家带来各种各样的自定义进度条！为你的APP锦上添花！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1041.jpg', 181.84, 145.47, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:26', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1042, 2, 'AndroidMultidex原理及实现', '简介：本课程主要介绍了两种常用的分包方式：ant分包和gradle分包。对Android中常用的类加载器进行对比，讲解如何通过DexClassLoader动态加载分dex。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1042.jpg', 113.72, 90.97, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:27', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1043, 2, 'iOS开发之网络协议', '简介：本课程主要带大家了解HTTP的发展历程，熟悉HTTP的工作流程。并且还会给大家讲解HTTPS和HTTP的区别，以及HTTPS的安全性，熟悉加密算法的一个流程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1043.jpg', 127.79, 102.23, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:27', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1044, 2, '带您完成神秘的涟漪按钮效果-提高篇', '简介：本课程介绍了涟漪Drawable中需要绘制基本要素，并在Drawable中添加涟漪动画的实现。介绍了如何提升整体的扩展性，方便扩展更多的涟漪效果。讲解了如何提取主要的绘制以及动画部分并实现一种新的涟漪效果。同时讲解了如何添加Shader渲染支持。对现有的涟漪效果进行优化等等。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1044.jpg', 153.11, 122.49, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:28', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1045, 2, '新版React Native从入门到实战打造高质量上线App', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1045.jpg', 174.16, 139.33, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:29', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1046, 2, 'Unity3D-菜鸟先飞之NGUI基础', '简介：本次课程将带领着大家学习NGUI的基础控件以及相应控件所应用的场景。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1046.jpg', 82.26, 65.81, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:30', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1047, 2, '带你开发类似PokemonGo的AR游戏', '简介：带你开发类似Pokemon Go的AR游戏：课程介绍，开发环境配置，游戏场景一：有卡识别，游戏场景二：无卡识别，游戏菜单场景，导出 iOS 平台并运行，导出 Android 平台并运行，课程总结。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1047.jpg', 22.02, 17.62, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:31', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1048, 2, 'Android图表绘制之直方图', '简介：Android图表绘制技术实战', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1048.jpg', 160.33, 128.26, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:31', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1049, 2, 'Android-打造万能适配器', '简介：本课程通过对传统的ListView的数据绑定的写法，进行一步一步的抽取与封装，首先设计出一个万能的ViewHolder，再抽取一个CommonAdapter复用多数重复的代码，最后为ViewHolder添加操作控件的能力。最终成功的将原本一堆代码浓缩至几行。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1049.jpg', 50.16, 40.13, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:32', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1050, 2, 'Jetpack全组件实战 开发短视频应用App', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1050.jpg', 193.27, 154.62, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:33', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1051, 2, 'Android动感系列-扫一扫', '简介：QR Code码，是由Denso公司于1994年9月研制的一种矩阵二维码符号，它具有一维条码及其它二维条码所具有的信息容量大、可靠性高、可表示汉字及图象多种文字信息、保密防伪性强等优点。本门课程老师将带领大家学习二维码的解析与生成。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1051.jpg', 79.78, 63.82, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:33', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1052, 2, 'Android-Service系列之Notification综合应用', '简介：Notification是Android中常用的消息提醒机制，被应用在各式各样的APP上，主要用作消息推送的提醒。本课程将结合Service和Handler 来为大家实现Notification的经典应用场景', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1052.jpg', 21.26, 17.01, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:34', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1053, 2, 'Unity3D地形编辑器', '简介：手把手教你如何使用Unity进行地形的创建和细化, 高度图的导入, NavMesh的烘培', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1053.jpg', 176.54, 141.23, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:34', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1054, 2, '聚焦市场开发热门技术 手把手带你开发商业级社交App', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1054.jpg', 90.70, 72.56, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:35', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1055, 2, 'Android高级特效-3D画廊', '简介：本课程将带领大家实现Android画廊特效，常用于各种电影APP展示页。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1055.jpg', 145.97, 116.77, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:35', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1056, 2, 'AndroidDataBinding实战-高级篇', '简介：本课程是Android官方数据绑定框架DataBinding的高级篇，大家会学习到DataBinding的一些复杂用法，比如列表绑定、自定义属性、双向绑定、表达式链、Lambda表达式、动画等', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1056.jpg', 113.52, 90.81, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:36', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1057, 2, 'Android高级特效-索引', '简介：本门课程为小伙伴们带来了一个APP中的熟面孔，索引功能。索引可以在通讯录的右侧实现字母搜索，有效增加了查找的便捷度。是应用中不可缺少的功能，放眼望去，微信，QQ等各大APP中都缺少不了他，还等什么？跟着李宁老师一起学习吧！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1057.jpg', 95.88, 76.71, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:37', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1058, 2, 'Flutter开发-Dart编程语言入门', '简介：Flutter作为移动跨平台框架，无论是效率、质量及性能都有非常好的表现，前景不可估量。工欲善其事，必先利其器,Dart就是Flutter开发的利器，课程将从基础入门，带你一步一步打磨出手中的利器。实战课程：《Flutter从入门到进阶实战携程网App》课程地址：https://coding.imooc.com/class/321.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1058.jpg', 71.53, 57.22, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:47', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1059, 2, 'Android-实用的App换肤功能', '简介：默认的皮肤风格看腻了吗？想做一套属于自己的风格吗？那你来对地方了~本课程将从零开始带领大家完成替换手机默认皮肤的功能！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1059.jpg', 154.27, 123.42, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:47', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1060, 2, 'Android视频播放器', '简介：本课程主要讲解Android系统自带的视频播放器来播放本地视频和网络视频，同时也讲解自定义播放器实现视频播放，包括视频亮度的调节，声音大小的改变和横竖屏的切换以及在开发中常见的一些问题', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1060.jpg', 42.05, 33.64, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:48', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1061, 2, 'Android应用发展趋势必备武器  热修复与插件化', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1061.jpg', 198.84, 159.07, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:48', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1062, 2, 'Android-Service系列之断点续传下载', '简介：本门课程将带大家从无到有搭建多线程断线续传的实用案例', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1062.jpg', 91.04, 72.84, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:49', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1063, 2, 'Android必学-AsyncTask基础', '简介：本次课程将带领大家了解Android中AsyncTask，体会如何在Android中进行异步操作进行各种网络请求，熟练掌握异步线程的使用。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1063.jpg', 13.10, 10.48, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:49', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1064, 2, 'iOS之分享集成', '简介：本课程主要带领大家了解集成分享功能的流程，告诉大家如何注册友盟、SDK环境的配置、分享功能的实现。并且让大家掌握该如何集成第三方，后续集成其它第三方功能时就可以轻松搞定。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1064.jpg', 198.17, 158.54, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:50', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1065, 2, '快速实现不一样的移动拼图', '简介：1、项目演示及搭建方法\n2、游戏逻辑判断\n（1）移动判断\n（2）手势判断\n（3）打乱顺序\n（4）判赢\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1065.jpg', 96.70, 77.36, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:50', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1066, 2, '即时通讯项目里面的语音处理-提高优化篇', '简介：在文件模式中实时获取录音时的音量大小，并动态展示到 ui 上。进行简单的变速播放，通过控制播放时的采样频率达到变速播放的效果，但是这种方式会改变声音的音调。进行变调不变速的处理，变调不变速通是通过对声音信号的 fft 变换实现的，可以达到多种不同的声音效果。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1066.jpg', 89.37, 71.49, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:51', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1067, 2, 'Swift之网络常见术语', '简介：本课程主要讲解Swift网络的常见术语，了解HTTPS、网络客户端、服务端以及socket。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1067.jpg', 67.04, 53.63, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:52', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1068, 2, 'Gradle3.0自动化项目构建技术精讲+实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1068.jpg', 108.48, 86.78, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:52', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1069, 2, 'RxJava与RxAndroid基础入门', '简介：RxJava与RxAndroid入门', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1069.jpg', 66.34, 53.07, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:53', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1070, 2, 'Android互动直播APP开发入门', '简介：斗鱼，映客，花椒…这些在你生活中不可缺的直播APP的现状是什么？流程是什么？工具有哪些，直播SDK怎么选择，本课程将为你揭秘这些问题，让直播APP开发不再神秘！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1070.jpg', 162.52, 130.02, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:53', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1071, 2, '应用自动更新组件开发', '简介：1.应用自动更新及其意义   2.自动更新原理及所需知识   3.开发一个自动更新组件  4.测试我们的自动更新组件   5.组件化开发思想介绍\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1071.jpg', 181.08, 144.87, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:54', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1072, 2, '视频WebRTC实时互动直播技术入门与实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1072.jpg', 32.36, 25.89, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:54', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1073, 2, 'Android与WebView的js交互', '简介：本课程为大家来了WebView的使用场景及常见交互，通过讲解演示让大家掌握WebView对java方法的调用以及实现js方法的调用参数的传递，还会介绍如何使用chrome浏览器调试客户端中网页的方法，以及注意的事项，最后会为大家分析WebView的js交互中常犯的几个错误。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1073.jpg', 66.20, 52.96, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:55', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1074, 2, 'Flutter从入门到进阶 实战携程网App', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1074.jpg', 111.09, 88.87, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:56', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1075, 2, '带你实现别样的Android侧滑菜单', '简介：引导学生进入侧滑菜单的学习，介绍常用菜单开源库SlidingMenu和安卓自带菜单DrawerLayout的实现\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1075.jpg', 199.44, 159.55, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:56', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1076, 2, 'Retrofit网络库', '简介：本门课将介绍什么是Retrofit，从Retrofit集成开始手把手带你学习Retrofit的使用，最后会使用Retrofit完成用户登录案例。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1076.jpg', 179.33, 143.47, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:57', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1077, 2, 'Android网络框架-OkHttp使用', '简介：本门课程主要给大家讲解Android SDK 6.0之后的网络请求的高级框架，其中包括Web端和服务器端的交互，常用的请求方式，请求图片，文件以及服务器搭建，session问题和常用框架的封装', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1077.jpg', 155.19, 124.15, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:57', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1078, 2, 'Unity3D刚体实现平衡球游戏', '简介：讲解 Rigidbody 组件和触发器的基础使用方法，串联讲解的内容，完成平衡球小游戏的制作，同时了解各种陷阱制作。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1078.jpg', 165.18, 132.14, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:58', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1079, 2, 'Android面试常客Handler详解', '简介：本课程将深入理解Android的Handler机制，并结合源码实例，讲解Looper、MessageqQueue、Handler之间的关系，同时介绍HandlerThread的原理和使用，并分析Handler在开发中遇到的异常的原因，最后从源码的角度分析一下Handler更新UI的流程', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1079.jpg', 142.09, 113.67, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:58', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1080, 2, 'Android面试解密-Layout_weight', '简介：本课程为Android面试系列第一课，短小精悍，切入要害。由Android大神为你详细解答面试最常见的问题，还等什么？快来学吧！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1080.jpg', 186.60, 149.28, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:59', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1081, 2, 'Unity3D-万圣前夜之惊声尖笑', '简介：夜空中出现点点光晕，仿佛将有大事发生。没错，今夜便是万圣前夜。看好你的宝贝，谁也不知道接下来会有什么惊喜等着你。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1081.jpg', 85.41, 68.32, NULL, '2022-03-27 20:21:58', '2022-06-28 15:54:59', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1082, 2, 'Android-Widget桌面小组件', '简介：AndroidAPP中，常有类似于天气预报、时钟、电量、流量检测等桌面小组件等看着高大上的功能。如何实现的呢？本节课由老师带领大家先引导再基础认知最后综合应用，一步步实现天气预报小例子。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1082.jpg', 6.56, 5.25, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:00', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1083, 2, 'Unity3D快速入门', '简介：Unity 3D是目前非常流行的游戏引擎，上手容易，功能强大，而且跨平台。unity3d教程将从零开始教大家使用Unity，从头开始开发一款小游戏。本课程为Unity 3D入门教程，将实例和理论结合起来，注重实用性， 是一门Unity基础的教程。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1083.jpg', 19.59, 15.67, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:09', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1084, 2, 'Android面试解密-自定义View', '简介：课程简介：本课程为Android面试系列课程，短小精悍，切入要害。由Android大神为你详细解答面试最常见的问题，还等什么？快来学吧！ 可以学到当前各大公司面试中最常见的问题的最完美解答！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1084.jpg', 122.26, 97.81, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:10', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1085, 2, 'Android中的Http通信', '简介：本门课程会带大家从Http基础知识包括Http协议，HttpURLConnection类的使用以及get、post、put、delete请求的处理开始，学习掌握json数据格式及解析方式，学习封装okhttp框架来适应现在主流app的使用，最后还会为大家总结Android中网络处理的常见问题和经验技巧。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1085.jpg', 185.19, 148.15, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:11', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1086, 2, 'Fragment应用上', '简介：将带领大家一起学习Fragment的应用场景，以及它的生命周期，最后利用Fragment实现一个小案例。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1086.jpg', 187.28, 149.82, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:11', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1087, 2, '剖析Framework面试 冲击Android高级职位', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1087.jpg', 170.12, 136.09, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:17', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1088, 2, 'AndroidUiAutomator2.0入门实战', '简介：零基础学习使用UiAutomator 2.0自动化测试，了解框架知识，环境配置，通过学习UI自动化三要素，通过搜索条件（文件、ID、属性等）找到组件（按钮、图标、文本框等），操作组件（点击、长按、滑动、输入等），快速掌握编写Android 自动化测试用例。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1088.jpg', 61.10, 48.88, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:17', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1089, 2, '大厂资深面试官 带你破解Android高级面试', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1089.jpg', 0.80, 0.64, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:18', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1090, 2, 'Android框架-GreenDao', '简介：GreenDao作为目前最火的数据库框架(没有之一)，其性能和效率远胜于ORMLite与Xutils。GreenDao的诞生简化了我们的SQLite操作，使得访问数据库变得如此简单。本课程将从零开始为大家介绍GreenDao的配置方法与使用步骤', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1090.jpg', 78.21, 62.57, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:18', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1091, 2, 'Android自定义任意层级树形控件', '简介：本课程将带领大家通过ListView打造一个任意层级的树形控件，大家可以学到巧妙的设计思想以及数据结构的知识。课程中也包含如何巧妙的利用反射加注解将设计通用化，同时可以进一步加深对ListView适配器的理解', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1091.jpg', 152.90, 122.32, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:19', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1092, 2, 'AIDL-小白成长记', '简介：AIDL是Android开发中比较常见的技术，想成为一名合格的Android攻城狮，看本次课程就对了！本节课将带领同学们快速入门AIDL相关技术，从基本语法，到案例解析。打造一键式学习过程！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1092.jpg', 17.60, 14.08, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:19', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1093, 2, '手机服务器微架构设计与实现', '简介：手机上那些文件互传、远程文件下载、WIFI传书是怎么做的？本课程带你深入移动应用研发的特定领域，搞定这些非大众化技术。不仅能夯实网络编程、HTTP协议基础，摆平面试官，还能积累项目经验亲手打造一款跑在手机上的服务器微架构的HTTP Server', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1093.jpg', 123.07, 98.46, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:20', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1094, 2, '明日之星-RecyclerView', '简介：本课程将为大家带来Android5.0新控件RecyclerView详解，结合案例实现ListView/GirdView/瀑布流 ，三种形式的转换。绝对干货！告别加班不是梦！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1094.jpg', 172.49, 137.99, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:20', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1095, 2, 'Android实现抽奖转盘', '简介：本课程将教大家通过SurfaceView实现一个Android抽奖转盘，剖析抽奖转盘背后的概率机制。课程涵盖了SurfaceView使用的场景和注意事项以及与View的区别等知识。实现过程中也使用了大量的Canvas绘制相关API，可以帮助大家深入了解和学会使用这些API。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1095.jpg', 68.01, 54.41, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:21', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1096, 2, 'RecyclerView优雅实现复杂列表布局', '简介：本课程介绍一种，Android5.0之后可取代之前ListView和GridView新的列表控件RecyclerView，告诉大家一些常见的复杂布局，如何用该控件更快捷优雅的实现出来，以及她和之前列表控件的区别和联系，快来掌握她吧，她等着你哦！\n慕课网Android讨论群② 170368200', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1096.jpg', 114.79, 91.83, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:21', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1097, 2, 'Android属性动画赏析', '简介：动画几乎是一个好的App所不可缺少的一部分，它体现了一种更友好的交互方式，在iOS、Android L中动画的使用越来越多，特别是后者更是着重强调设计更好的动画。从3.0开始，Android就提供了一种更为强大的属性动画框架。本次课程，将向你介绍如何使用属性动画做出更好的动画', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1097.jpg', 189.34, 151.47, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:22', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1098, 2, 'Android图像处理-打造美图秀秀从它开始', '简介：本次课程将带领大家了解Android中对图像色彩的处理和分析方法，并通过实例向大家演示市面上常见的图像处理特效的实现方法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1098.jpg', 115.08, 92.06, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:22', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1099, 2, 'Android图像处理-变\"换\"莫测的图像', '简介：本次课程将带领大家了解Android中对图像变形特效的处理和分析方法，并通过各种实例向大家演示市面上常见的图像处理特效的实现方法。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1099.jpg', 115.17, 92.13, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:27', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1100, 2, '集成MultiDex项目实战', '简介：介绍如何在实际项目中运用MultiDex，介绍如何在实际项目中运用代码混淆，介绍如何在实际项目中对单个Dex文件进行设置，介绍如何在实际项目中使用multiDexKeepProguard', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1100.jpg', 117.52, 94.02, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:28', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1101, 2, 'Android必学-BaseAdapter的使用与优化', '简介：本次课程将带领大家了解Android中BaseAdapter的使用，以及我们如何写出高效、文艺的BaseAdapter。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1101.jpg', 22.03, 17.63, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:29', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1102, 2, 'iOS基础之UIImageView知识拓展(下)', '简介：本课程将学习如何让图片任意角度旋转、图片任意位置的裁剪、图片的圆角剪切、图片任意位置拉伸、屏幕截屏以及图片水印的添加，让我们掌握更多对UIImage的处理。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1102.jpg', 33.74, 26.99, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:30', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1103, 2, '自定义实现日历控件', '简介：从零开始，循序渐进，教你如何搭建Android自定义控件，同时传授背后的理论知识。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1103.jpg', 52.51, 42.01, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:30', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1104, 2, '基于GitHub App业务深度讲解 Kotlin高级特性与框架设计', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1104.jpg', 65.68, 52.54, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:31', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1105, 2, 'Android引导页实现的四种方式', '简介：Android引导页实现的四种方式', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1105.jpg', 41.38, 33.10, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:31', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1106, 2, 'iOS-五子棋大战', '简介：从零开始，逐渐介绍游戏整体界面的搭建，游戏资源怎么去添加，点击手势判断，AI决策的思路和算法的详细讲解和最终AI的算法实现', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1106.jpg', 5.78, 4.62, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:32', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1107, 2, 'Cocos2d-x游戏开发初体验-C++篇', '简介：游戏开发博大精深，在这个后页游时期的手游时代，还在为无法入门游戏行业而烦恼吗？Cocos2d-x就是一款专门为手机游戏打造的开源游戏引擎，够轻量、够简单。在这个不一样的时代，雷哥将带着你走出一个不一样的自己', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1107.jpg', 171.59, 137.27, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:33', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1108, 2, '新版Kotlin从入门到精通', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1108.jpg', 104.90, 83.92, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:33', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1109, 2, 'Unity3D菜鸟先飞之NGUI实战篇', '简介：本课程为NGUI课程续篇，结合上一课学习的基础知识，老师讲带领同学们完成登陆以及游戏主界面的功能实现。在Unity3D开发中，NGUI的地位举足轻重，不论版本怎样变化。掌握NGUI技术还是有必要的。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1109.jpg', 73.27, 58.61, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:34', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1110, 2, 'Cocos2d-x游戏开发之贪吃蛇(上)', '简介：还记得早期Nokia手机上的贪吃蛇么？玩起来是不是很过瘾。今天我们有请徐波老师为大家带来用Cocos引起制作的贪吃蛇游戏，并且一定比原版的更好玩哦！本课程为游戏开发的入门课程，将为大家介绍如何在cocos环境中使用lua语言制作贪吃蛇的游戏', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1110.jpg', 10.87, 8.70, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:34', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1111, 2, 'Android基础-初识SQLite', '简介：本课程主要讲解Android数据库中数据的添加，修改  ，查询和删除等常用操作，常用的Sql语句等', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1111.jpg', 65.53, 52.42, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:35', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1112, 2, 'PullToRefresh', '简介：APP中刷新和加载数据的解决方案，以及PullToRefresh框架的使用', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1112.jpg', 131.98, 105.58, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:35', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1113, 2, 'AndroidUI模板设计', '简介：UI设计一直是程序设计中非常重要的一环，也是最让人抓狂的一环，好的设计需要不断修改、不断完善，那么我们如何才能减少UI设计中的重复劳动呢、如何在修改设计时减少工作量呢、如何一次开发，重复使用呢？如果你也有这样的疑问，那么本次课程一定会让你获益匪浅。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1113.jpg', 62.27, 49.81, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:36', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1114, 2, 'Android摄像头基础', '简介：本课程为Android摄像头的课程讲解。由浅入深，带领小伙伴们探索Camera的奥秘，带大家学会摄像头的摄像原理和底层的实现。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1114.jpg', 92.58, 74.06, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:37', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1115, 2, 'Android实现卫星菜单', '简介：本课程将带领大家通过自定义ViewGroup结合动画实现一个卫星式菜单，课程涵盖了自定义控件的整个过程，包括自定义属性的定义与获取、控件的测量、布局等相关知识。该菜单效果也包含相当多的传统View动画效果，大家可以对其进行深入理解', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1115.jpg', 34.97, 27.98, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:37', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1116, 2, '新浪微博资深大牛全方位剖析 iOS 高级面试', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1116.jpg', 146.66, 117.33, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:38', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1117, 2, '手把手开发一个完整即时通讯App', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1117.jpg', 195.30, 156.24, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:38', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1118, 2, 'Android-NDK进阶', '简介：帮助开发者在Android Studio中快速开发C（或C++）的动态库，并能自动将so和java应用一起打包成apk。包括方法签名的学习，以及常见异常的分析和处理', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1118.jpg', 79.06, 63.25, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:39', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1119, 2, 'Android-NDK入门', '简介：Android中的NDK提供了一系列的工具，帮助开发者快速开发C（或C++）的动态库，并能自动将so和java应用一起打包成apk。这些工具对开发者的帮助是巨大的.本课程将代带领大家一步一步的学习如何使用NDK开发', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1119.jpg', 50.05, 40.04, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:39', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1120, 2, 'App压力测试入门', '简介：本课程首先探讨2个压力测试问题：\n1、为什么要开展压力测试？\n2、什么时候开展压力测试？\n然后讲解7个压力测试必要基础知识、最后实战6个压力测试小案例,从而教会大家对任意一款Android App进行压力测试\n其他专项测试内容：http://coding.imooc.com/class/53.html', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1120.jpg', 33.67, 26.93, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:40', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1121, 2, 'Android-屏幕适配全攻略', '简介：就目前的Android开发环境来说，我们需要去适配什么样分辨率的手机？dp、sp、px这些常用单位的概念是什么？进行屏幕适配需要从哪些角度去考虑呢？有没有一种更通用的屏幕适配的方式呢？进行屏幕适配有哪些最佳实践呢？这些问题你都清楚吗？不清楚就赶快进来学习呀！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1121.jpg', 143.42, 114.74, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:40', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1122, 2, 'Cocos2d-x游戏开发基础之Lua基础篇', '简介：Lua，你也可以读成撸啊。什么？你不知道Lua？如果你玩过魔兽世界，那么你肯定知道大脚~大脚就是由Lua来开发的。本门课程为大家带来Lua语言从0开始的基础教程，希望大家学完以后也能做出类似大脚一样的插件', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1122.jpg', 98.47, 78.77, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:41', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1123, 2, '带您完成神秘的涟漪按钮效果-入门篇', '简介：本课程介绍了涟漪效果的几种实现方式，并针对Drawable实现方式进行开发；同时介绍了自定义View的基本知识点，并介绍了颜色叠加的几种计算方法。涟漪很炫，原理很简单；课程本着主线拉动、扩展介绍Drawable以及自定义控件相关知识点的原则，让同学深入浅出的理解相关知识点。', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1123.jpg', 166.30, 133.04, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:42', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1124, 2, 'Socket网络编程进阶与实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1124.jpg', 85.87, 68.70, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:42', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1125, 2, 'FFmpeg音视频核心技术精讲与实战', '', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1125.jpg', 136.94, 109.55, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:43', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1126, 2, 'Android性能优化之布局优化', '简介：从Android系统屏幕UI刷新机制,布局的选择，优化标签的使用，原生View控件的优化等布局角度去讲解如何提高Android性能', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1126.jpg', 65.07, 52.06, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:43', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1127, 2, '《小十传奇》Unity3D休闲游戏开发', '简介：有了好的创意，该如何把她实现成游戏呢？在这门课程中， @游戏开发极客 将手把手的带领小伙伴们应用 Unity3D 开发一款休闲游戏。好的架构保证质量，加上方便的工具和优良的方法，小伙伴们，还等什么，快来加入游戏开发的神奇之旅吧！！', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1127.jpg', 178.83, 143.06, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:44', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1128, 2, 'Android代码混淆与加固技术', '简介：Android代码混淆与加固技术实战', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1128.jpg', 123.89, 99.11, NULL, '2022-03-30 20:21:58', '2022-06-28 15:55:44', 0, 2, 3, NULL);
INSERT INTO `course` VALUES (1129, 2, 'Android-Service系列之多线程断点续传下载', '简介：在日常下载文件的过程，由于网速问题或者突然断电等等使我们正在下载的东西处于暂停状态，当我们在点击它时还能在之前下载的基础上进行下载，这就是今天我们要学习的多线程续传下载程序的开发', 'http://oss1.wuzhaoqi.top/course/2022-06-28/1129.jpg', 3.56, 2.84, NULL, '2022-03-27 20:21:58', '2022-06-28 15:55:45', 0, 2, 3, NULL);

-- ----------------------------
-- Table structure for coursevideo
-- ----------------------------
DROP TABLE IF EXISTS `coursevideo`;
CREATE TABLE `coursevideo`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cid` bigint NOT NULL COMMENT '课程id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频名字',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '视频资源路径\r\n',
  `is_try` int NOT NULL DEFAULT 0 COMMENT '是否可以试看',
  `video_number` double NULL DEFAULT NULL COMMENT '视频编号',
  `learn_times` datetime NULL DEFAULT NULL COMMENT '视频时长',
  `play_amount` int NOT NULL DEFAULT 0 COMMENT '播放量',
  `img_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_video` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `k_id`(`cid` ASC) USING BTREE,
  CONSTRAINT `k_id` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of coursevideo
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict
-- ----------------------------
DROP TABLE IF EXISTS `e_dict`;
CREATE TABLE `e_dict`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKf5wwh5osfukkeebw7h2yb4kmp`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_dict
-- ----------------------------

-- ----------------------------
-- Table structure for e_dict_item
-- ----------------------------
DROP TABLE IF EXISTS `e_dict_item`;
CREATE TABLE `e_dict_item`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `erupt_dict_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKl0kiq8otpn3fvtlvarebt8xkh`(`code` ASC, `erupt_dict_id` ASC) USING BTREE,
  INDEX `FKrrbi2dt94rjd8sjt830m3w0a`(`erupt_dict_id` ASC) USING BTREE,
  CONSTRAINT `FKrrbi2dt94rjd8sjt830m3w0a` FOREIGN KEY (`erupt_dict_id`) REFERENCES `e_dict` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_dict_item
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_login_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_login_log`;
CREATE TABLE `e_upms_login_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `device_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `login_time` datetime NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_login_log
-- ----------------------------
INSERT INTO `e_upms_login_log` VALUES (1, 'Chrome 10 100', 'Computer', '192.168.137.1', '2022-04-10 16:51:54', '0|0|0|内网IP|内网IP', 'Windows 10', 's32FLgoQ7NJ0Clmh', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (2, 'Chrome 10 100', 'Computer', '192.168.137.1', '2022-04-10 17:49:55', '0|0|0|内网IP|内网IP', 'Windows 10', 'VRcDlTYfdOclWaSk', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (3, 'Chrome 10 100', 'Computer', '192.168.137.1', '2022-04-19 04:53:09', '0|0|0|内网IP|内网IP', 'Windows 10', 'zOzzG8xCpk8KroBa', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (4, 'Chrome 10 101', 'Computer', '192.168.28.1', '2022-05-16 19:14:52', '0|0|0|内网IP|内网IP', 'Windows 10', 'yVp6pOgewsf6l0qO', 'erupt');
INSERT INTO `e_upms_login_log` VALUES (5, 'Chrome 10 101', 'Computer', '192.168.28.1', '2022-05-16 21:37:26', '0|0|0|内网IP|内网IP', 'Windows 10', 'xStOeDhM0D2CTM5l', 'erupt');

-- ----------------------------
-- Table structure for e_upms_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_menu`;
CREATE TABLE `e_upms_menu`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `param` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `parent_menu_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK95xpkppt33d2bka0g2d7rgwqt`(`code` ASC) USING BTREE,
  INDEX `FK5mkgea183mm02v7ic1pdwxy5s`(`parent_menu_id` ASC) USING BTREE,
  CONSTRAINT `FK5mkgea183mm02v7ic1pdwxy5s` FOREIGN KEY (`parent_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_menu
-- ----------------------------
INSERT INTO `e_upms_menu` VALUES (1, NULL, '2022-04-10 16:50:04', NULL, NULL, '$manager', 'fa fa-cogs', '系统管理', NULL, 1, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (2, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptMenu', '', '菜单管理', NULL, 0, 1, 'tree', 'EruptMenu', 1);
INSERT INTO `e_upms_menu` VALUES (3, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptMenu@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptMenu@ADD', 2);
INSERT INTO `e_upms_menu` VALUES (4, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptMenu@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptMenu@EDIT', 2);
INSERT INTO `e_upms_menu` VALUES (5, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptMenu@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptMenu@DELETE', 2);
INSERT INTO `e_upms_menu` VALUES (6, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptMenu@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptMenu@VIEW_DETAIL', 2);
INSERT INTO `e_upms_menu` VALUES (7, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptRole', '', '角色管理', NULL, 10, 1, 'table', 'EruptRole', 1);
INSERT INTO `e_upms_menu` VALUES (8, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptRole@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptRole@ADD', 7);
INSERT INTO `e_upms_menu` VALUES (9, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptRole@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptRole@EDIT', 7);
INSERT INTO `e_upms_menu` VALUES (10, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptRole@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptRole@DELETE', 7);
INSERT INTO `e_upms_menu` VALUES (11, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptRole@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptRole@VIEW_DETAIL', 7);
INSERT INTO `e_upms_menu` VALUES (17, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptPost', '', '岗位维护', NULL, 30, 1, 'table', 'EruptPost', 1);
INSERT INTO `e_upms_menu` VALUES (18, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptPost@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptPost@ADD', 17);
INSERT INTO `e_upms_menu` VALUES (19, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptPost@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptPost@EDIT', 17);
INSERT INTO `e_upms_menu` VALUES (20, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptPost@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptPost@DELETE', 17);
INSERT INTO `e_upms_menu` VALUES (21, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptPost@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptPost@VIEW_DETAIL', 17);
INSERT INTO `e_upms_menu` VALUES (22, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptUser', '', '用户配置', NULL, 40, 1, 'table', 'EruptUser', 1);
INSERT INTO `e_upms_menu` VALUES (23, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptUser@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptUser@ADD', 22);
INSERT INTO `e_upms_menu` VALUES (24, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptUser@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptUser@EDIT', 22);
INSERT INTO `e_upms_menu` VALUES (25, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptUser@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptUser@DELETE', 22);
INSERT INTO `e_upms_menu` VALUES (26, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptUser@VIEW_DETAIL', NULL, '详情', NULL, 40, 1, 'button', 'EruptUser@VIEW_DETAIL', 22);
INSERT INTO `e_upms_menu` VALUES (27, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDict', '', '数据字典', NULL, 50, 1, 'table', 'EruptDict', 1);
INSERT INTO `e_upms_menu` VALUES (28, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDict@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDict@ADD', 27);
INSERT INTO `e_upms_menu` VALUES (29, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDict@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDict@EDIT', 27);
INSERT INTO `e_upms_menu` VALUES (30, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDict@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDict@DELETE', 27);
INSERT INTO `e_upms_menu` VALUES (31, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDict@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDict@EXPORT', 27);
INSERT INTO `e_upms_menu` VALUES (32, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDict@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDict@VIEW_DETAIL', 27);
INSERT INTO `e_upms_menu` VALUES (33, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDictItem', '', '字典项', NULL, 60, 2, 'table', 'EruptDictItem', 1);
INSERT INTO `e_upms_menu` VALUES (34, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDictItem@ADD', NULL, '新增', NULL, 10, 1, 'button', 'EruptDictItem@ADD', 33);
INSERT INTO `e_upms_menu` VALUES (35, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDictItem@EDIT', NULL, '修改', NULL, 20, 1, 'button', 'EruptDictItem@EDIT', 33);
INSERT INTO `e_upms_menu` VALUES (36, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDictItem@DELETE', NULL, '删除', NULL, 30, 1, 'button', 'EruptDictItem@DELETE', 33);
INSERT INTO `e_upms_menu` VALUES (37, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDictItem@EXPORT', NULL, '导出', NULL, 40, 1, 'button', 'EruptDictItem@EXPORT', 33);
INSERT INTO `e_upms_menu` VALUES (38, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptDictItem@VIEW_DETAIL', NULL, '详情', NULL, 50, 1, 'button', 'EruptDictItem@VIEW_DETAIL', 33);
INSERT INTO `e_upms_menu` VALUES (39, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptOnline', '', '在线用户', NULL, 65, 1, 'table', 'EruptOnline', 1);
INSERT INTO `e_upms_menu` VALUES (40, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptOnline@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptOnline@EXPORT', 39);
INSERT INTO `e_upms_menu` VALUES (41, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptLoginLog', '', '登录日志', NULL, 70, 1, 'table', 'EruptLoginLog', 1);
INSERT INTO `e_upms_menu` VALUES (42, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptLoginLog@EXPORT', NULL, '导出', NULL, 10, 1, 'button', 'EruptLoginLog@EXPORT', 41);
INSERT INTO `e_upms_menu` VALUES (43, NULL, '2022-04-10 16:50:04', NULL, NULL, 'EruptOperateLog', '', '操作日志', NULL, 80, 1, 'table', 'EruptOperateLog', 1);
INSERT INTO `e_upms_menu` VALUES (44, NULL, '2022-04-10 16:50:04', NULL, NULL, 'monitor', 'fa fa-bullseye', '系统监控', NULL, 10, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (45, NULL, '2022-04-10 16:50:04', NULL, NULL, 'server.html', NULL, '服务监控', NULL, 10, 1, 'tpl', 'server.html', 44);
INSERT INTO `e_upms_menu` VALUES (46, NULL, '2022-04-10 16:50:04', NULL, NULL, 'redis.html', NULL, '缓存监控', NULL, 20, 1, 'tpl', 'redis.html', 44);
INSERT INTO `e_upms_menu` VALUES (47, 'erupt', '2022-04-10 17:01:39', 'erupt', '2022-04-10 17:01:39', 'xTu3dspy', NULL, '系统管理', NULL, 0, 1, NULL, NULL, NULL);
INSERT INTO `e_upms_menu` VALUES (48, 'erupt', '2022-04-10 17:02:23', 'erupt', '2022-04-10 17:02:23', 'It2vRhWS', NULL, '课程管理', NULL, 1, 1, 'table', 'Course', 47);
INSERT INTO `e_upms_menu` VALUES (49, NULL, '2022-04-10 17:02:23', NULL, NULL, 'HJHFvok3', NULL, '新增', NULL, 10, 1, 'button', 'Course@ADD', 48);
INSERT INTO `e_upms_menu` VALUES (50, NULL, '2022-04-10 17:02:23', NULL, NULL, 'n9lU6pkp', NULL, '修改', NULL, 20, 1, 'button', 'Course@EDIT', 48);
INSERT INTO `e_upms_menu` VALUES (51, NULL, '2022-04-10 17:02:23', NULL, NULL, 'R9aPO7nt', NULL, '删除', NULL, 30, 1, 'button', 'Course@DELETE', 48);
INSERT INTO `e_upms_menu` VALUES (52, NULL, '2022-04-10 17:02:23', NULL, NULL, 'PNGF6IzO', NULL, '详情', NULL, 40, 1, 'button', 'Course@VIEW_DETAIL', 48);
INSERT INTO `e_upms_menu` VALUES (67, 'erupt', '2022-04-10 17:09:43', 'erupt', '2022-04-10 17:09:43', 'HdQt9x15', NULL, '用户管理', NULL, 2, 1, 'table', 'User', 47);
INSERT INTO `e_upms_menu` VALUES (68, NULL, '2022-04-10 17:09:43', NULL, NULL, 'NUgFObTF', NULL, '新增', NULL, 10, 1, 'button', 'User@ADD', 67);
INSERT INTO `e_upms_menu` VALUES (69, NULL, '2022-04-10 17:09:43', NULL, NULL, 'i2Im9NrU', NULL, '修改', NULL, 20, 1, 'button', 'User@EDIT', 67);
INSERT INTO `e_upms_menu` VALUES (70, NULL, '2022-04-10 17:09:43', NULL, NULL, '3oRaVnbh', NULL, '删除', NULL, 30, 1, 'button', 'User@DELETE', 67);
INSERT INTO `e_upms_menu` VALUES (71, NULL, '2022-04-10 17:09:43', NULL, NULL, 'lSNV6Gl3', NULL, '详情', NULL, 40, 1, 'button', 'User@VIEW_DETAIL', 67);
INSERT INTO `e_upms_menu` VALUES (72, 'erupt', '2022-04-10 17:25:30', 'erupt', '2022-04-10 17:25:30', 'qFPx9CRn', NULL, '订单管理', NULL, 110, 1, 'table', 'Orders', 47);
INSERT INTO `e_upms_menu` VALUES (73, NULL, '2022-04-10 17:25:30', NULL, NULL, 'gG71kabv', NULL, '新增', NULL, 10, 1, 'button', 'Orders@ADD', 72);
INSERT INTO `e_upms_menu` VALUES (74, NULL, '2022-04-10 17:25:30', NULL, NULL, 'msXiy3zS', NULL, '修改', NULL, 20, 1, 'button', 'Orders@EDIT', 72);
INSERT INTO `e_upms_menu` VALUES (75, NULL, '2022-04-10 17:25:30', NULL, NULL, 'A6ue8rGU', NULL, '删除', NULL, 30, 1, 'button', 'Orders@DELETE', 72);
INSERT INTO `e_upms_menu` VALUES (76, NULL, '2022-04-10 17:25:30', NULL, NULL, 'qUgYAWn9', NULL, '详情', NULL, 40, 1, 'button', 'Orders@VIEW_DETAIL', 72);
INSERT INTO `e_upms_menu` VALUES (77, 'erupt', '2022-04-10 17:29:28', 'erupt', '2022-04-10 17:30:16', 'QvDnzQGc', NULL, '课程视频管理', NULL, 120, 1, 'table', 'CourseVideo', 47);
INSERT INTO `e_upms_menu` VALUES (78, NULL, '2022-04-10 17:29:28', NULL, NULL, 'TsRUEzkM', NULL, '新增', NULL, 10, 1, 'button', 'Orders@ADD', 77);
INSERT INTO `e_upms_menu` VALUES (79, NULL, '2022-04-10 17:29:28', 'erupt', '2022-04-19 05:40:50', 'ZEkcR5u5', NULL, '修改', NULL, 20, 1, 'button', 'Orders@EDIT', 77);
INSERT INTO `e_upms_menu` VALUES (80, NULL, '2022-04-10 17:29:28', NULL, NULL, 'KAYU5NTu', NULL, '删除', NULL, 30, 1, 'button', 'Orders@DELETE', 77);
INSERT INTO `e_upms_menu` VALUES (81, NULL, '2022-04-10 17:29:28', NULL, NULL, 'PSwx2SfC', NULL, '详情', NULL, 40, 1, 'button', 'Orders@VIEW_DETAIL', 77);
INSERT INTO `e_upms_menu` VALUES (96, 'erupt', '2022-04-19 05:32:27', 'erupt', '2022-04-19 05:32:27', '7sX7dldq', NULL, '测试', NULL, 140, 1, NULL, NULL, 1);
INSERT INTO `e_upms_menu` VALUES (102, 'erupt', '2022-04-19 05:33:44', 'erupt', '2022-04-19 05:33:44', 'uymhI7G0', NULL, '登录日志', NULL, 160, 1, 'table', 'UserLog', 47);
INSERT INTO `e_upms_menu` VALUES (103, NULL, '2022-04-19 05:33:44', NULL, NULL, 'yj8L2Bly', NULL, '新增', NULL, 10, 1, 'button', 'UserLog@ADD', 102);
INSERT INTO `e_upms_menu` VALUES (104, NULL, '2022-04-19 05:33:44', NULL, NULL, 'ck3s059Q', NULL, '修改', NULL, 20, 1, 'button', 'UserLog@EDIT', 102);
INSERT INTO `e_upms_menu` VALUES (105, NULL, '2022-04-19 05:33:44', NULL, NULL, 'xrCwB2mf', NULL, '删除', NULL, 30, 1, 'button', 'UserLog@DELETE', 102);
INSERT INTO `e_upms_menu` VALUES (106, NULL, '2022-04-19 05:33:44', NULL, NULL, 'lSTBS4sk', NULL, '详情', NULL, 40, 1, 'button', 'UserLog@VIEW_DETAIL', 102);

-- ----------------------------
-- Table structure for e_upms_operate_log
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_operate_log`;
CREATE TABLE `e_upms_operate_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `api_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `error_info` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `operate_user` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `region` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_addr` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_method` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `req_param` varchar(4000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `total_time` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 69 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_operate_log
-- ----------------------------
INSERT INTO `e_upms_operate_log` VALUES (1, '删除 | 菜单管理', '2022-04-10 16:52:46', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/13', 'DELETE', NULL, b'1', 87);
INSERT INTO `e_upms_operate_log` VALUES (2, '删除 | 菜单管理', '2022-04-10 16:52:49', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/14', 'DELETE', NULL, b'1', 41);
INSERT INTO `e_upms_operate_log` VALUES (3, '删除 | 菜单管理', '2022-04-10 16:52:52', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/15', 'DELETE', NULL, b'1', 52);
INSERT INTO `e_upms_operate_log` VALUES (4, '删除 | 菜单管理', '2022-04-10 16:52:55', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/16', 'DELETE', NULL, b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (5, '新增 | 菜单管理', '2022-04-10 17:01:24', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"status\":\"1\",\"sort\":90}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (6, '新增 | 菜单管理', '2022-04-10 17:01:39', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"系统管理\",\"status\":\"1\",\"sort\":0}', b'1', 41);
INSERT INTO `e_upms_operate_log` VALUES (7, '新增 | 菜单管理', '2022-04-10 17:02:23', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"课程管理\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"Course\",\"sort\":1}', b'1', 37);
INSERT INTO `e_upms_operate_log` VALUES (8, '新增 | 菜单管理', '2022-04-10 17:03:32', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"用户登录日志\",\"status\":\"1\",\"type\":\"table\",\"value\":\"UserLog\",\"sort\":90}', b'1', 41);
INSERT INTO `e_upms_operate_log` VALUES (9, '新增 | 菜单管理', '2022-04-10 17:04:06', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"用户登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"UserLog\",\"sort\":100}', b'1', 46);
INSERT INTO `e_upms_operate_log` VALUES (10, '删除 | 菜单管理', '2022-04-10 17:05:54', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/54', 'DELETE', NULL, b'1', 34);
INSERT INTO `e_upms_operate_log` VALUES (11, '删除 | 菜单管理', '2022-04-10 17:05:57', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/55', 'DELETE', NULL, b'1', 27);
INSERT INTO `e_upms_operate_log` VALUES (12, '删除 | 菜单管理', '2022-04-10 17:05:59', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/56', 'DELETE', NULL, b'1', 28);
INSERT INTO `e_upms_operate_log` VALUES (13, '删除 | 菜单管理', '2022-04-10 17:06:02', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/57', 'DELETE', NULL, b'1', 29);
INSERT INTO `e_upms_operate_log` VALUES (14, '删除 | 菜单管理', '2022-04-10 17:06:10', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/58', 'DELETE', NULL, b'1', 25);
INSERT INTO `e_upms_operate_log` VALUES (15, '删除 | 菜单管理', '2022-04-10 17:06:14', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/59', 'DELETE', NULL, b'1', 38);
INSERT INTO `e_upms_operate_log` VALUES (16, '删除 | 菜单管理', '2022-04-10 17:06:19', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu/53', 'DELETE', NULL, b'1', 40);
INSERT INTO `e_upms_operate_log` VALUES (17, '新增 | 菜单管理', '2022-04-10 17:09:43', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"用户管理\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"User\",\"sort\":2}', b'1', 243);
INSERT INTO `e_upms_operate_log` VALUES (18, '新增 | 菜单管理', '2022-04-10 17:25:30', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"订单管理\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"Orders\",\"sort\":110}', b'1', 225);
INSERT INTO `e_upms_operate_log` VALUES (19, '新增 | 菜单管理', '2022-04-10 17:29:28', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"订单管理\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"Orders\",\"sort\":120}', b'1', 193);
INSERT INTO `e_upms_operate_log` VALUES (20, '修改 | 菜单管理', '2022-04-10 17:30:16', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://127.0.0.1:8080/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"课程视频管理\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"CourseVideo\",\"sort\":120,\"code\":\"QvDnzQGc\",\"id\":77}', b'1', 77);
INSERT INTO `e_upms_operate_log` VALUES (21, '修改 | 菜单管理', '2022-04-19 04:54:34', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"用户登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"userLog\",\"sort\":100,\"code\":\"Spbr38bB\",\"id\":60}', b'1', 193);
INSERT INTO `e_upms_operate_log` VALUES (22, '删除 | 菜单管理', '2022-04-19 04:55:03', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/66', 'DELETE', NULL, b'1', 52);
INSERT INTO `e_upms_operate_log` VALUES (23, '删除 | 菜单管理', '2022-04-19 04:55:07', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/61', 'DELETE', NULL, b'1', 57);
INSERT INTO `e_upms_operate_log` VALUES (24, '删除 | 菜单管理', '2022-04-19 04:55:09', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/62', 'DELETE', NULL, b'1', 48);
INSERT INTO `e_upms_operate_log` VALUES (25, '删除 | 菜单管理', '2022-04-19 04:55:12', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/63', 'DELETE', NULL, b'1', 37);
INSERT INTO `e_upms_operate_log` VALUES (26, '删除 | 菜单管理', '2022-04-19 04:55:14', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/64', 'DELETE', NULL, b'1', 43);
INSERT INTO `e_upms_operate_log` VALUES (27, '删除 | 菜单管理', '2022-04-19 04:55:17', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/65', 'DELETE', NULL, b'1', 31);
INSERT INTO `e_upms_operate_log` VALUES (28, '删除 | 菜单管理', '2022-04-19 04:55:21', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/60', 'DELETE', NULL, b'1', 34);
INSERT INTO `e_upms_operate_log` VALUES (29, '新增 | 菜单管理', '2022-04-19 04:56:02', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"UserLog\",\"sort\":130}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (30, '新增 | 菜单管理', '2022-04-19 04:56:06', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"用户登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"UserLog\",\"sort\":130}', b'1', 37);
INSERT INTO `e_upms_operate_log` VALUES (31, '新增 | 菜单管理', '2022-04-19 05:07:30', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"LoginLog\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"LoginLog\",\"sort\":140}', b'1', 246);
INSERT INTO `e_upms_operate_log` VALUES (32, '删除 | 菜单管理', '2022-04-19 05:27:22', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/92', 'DELETE', NULL, b'1', 205);
INSERT INTO `e_upms_operate_log` VALUES (33, '删除 | 菜单管理', '2022-04-19 05:27:25', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/90', 'DELETE', NULL, b'1', 65);
INSERT INTO `e_upms_operate_log` VALUES (34, '删除 | 菜单管理', '2022-04-19 05:27:28', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/91', 'DELETE', NULL, b'1', 55);
INSERT INTO `e_upms_operate_log` VALUES (35, '删除 | 菜单管理', '2022-04-19 05:27:30', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/93', 'DELETE', NULL, b'1', 45);
INSERT INTO `e_upms_operate_log` VALUES (36, '删除 | 菜单管理', '2022-04-19 05:27:33', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/94', 'DELETE', NULL, b'1', 47);
INSERT INTO `e_upms_operate_log` VALUES (37, '删除 | 菜单管理', '2022-04-19 05:27:36', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/95', 'DELETE', NULL, b'1', 42);
INSERT INTO `e_upms_operate_log` VALUES (38, '删除 | 菜单管理', '2022-04-19 05:27:45', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/12', 'DELETE', NULL, b'1', 45);
INSERT INTO `e_upms_operate_log` VALUES (39, '删除 | 菜单管理', '2022-04-19 05:27:48', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/89', 'DELETE', NULL, b'1', 50);
INSERT INTO `e_upms_operate_log` VALUES (40, '修改 | 菜单管理', '2022-04-19 05:28:13', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"UserLog\",\"sort\":130,\"code\":\"pnGVsUE7\",\"id\":82}', b'1', 70);
INSERT INTO `e_upms_operate_log` VALUES (41, '新增 | 菜单管理', '2022-04-19 05:32:27', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"测试\",\"status\":\"1\",\"parentMenu\":{\"id\":1,\"name\":\"系统管理\"},\"sort\":140}', b'1', 199);
INSERT INTO `e_upms_operate_log` VALUES (42, '新增 | 菜单管理', '2022-04-19 05:33:02', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":96,\"name\":\"测试\"},\"value\":\"UserLog\",\"sort\":150}', b'1', 35);
INSERT INTO `e_upms_operate_log` VALUES (43, '新增 | 菜单管理', '2022-04-19 05:33:11', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":96,\"name\":\"测试\"},\"type\":\"table\",\"value\":\"UserLog\",\"sort\":150}', b'1', 58);
INSERT INTO `e_upms_operate_log` VALUES (44, '新增 | 菜单管理', '2022-04-19 05:33:44', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'POST', '{\"name\":\"登录日志\",\"status\":\"1\",\"parentMenu\":{\"id\":47,\"name\":\"系统管理\"},\"type\":\"table\",\"value\":\"UserLog\",\"sort\":160}', b'1', 46);
INSERT INTO `e_upms_operate_log` VALUES (45, '删除 | 菜单管理', '2022-04-19 05:34:16', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/98', 'DELETE', NULL, b'1', 63);
INSERT INTO `e_upms_operate_log` VALUES (46, '删除 | 菜单管理', '2022-04-19 05:34:19', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/99', 'DELETE', NULL, b'1', 59);
INSERT INTO `e_upms_operate_log` VALUES (47, '删除 | 菜单管理', '2022-04-19 05:34:21', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/100', 'DELETE', NULL, b'1', 43);
INSERT INTO `e_upms_operate_log` VALUES (48, '删除 | 菜单管理', '2022-04-19 05:34:24', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/101', 'DELETE', NULL, b'1', 36);
INSERT INTO `e_upms_operate_log` VALUES (49, '删除 | 菜单管理', '2022-04-19 05:34:29', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/97', 'DELETE', NULL, b'1', 38);
INSERT INTO `e_upms_operate_log` VALUES (50, '删除 | 菜单管理', '2022-04-19 05:34:50', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/83', 'DELETE', NULL, b'1', 57);
INSERT INTO `e_upms_operate_log` VALUES (51, '删除 | 菜单管理', '2022-04-19 05:34:53', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/84', 'DELETE', NULL, b'1', 35);
INSERT INTO `e_upms_operate_log` VALUES (52, '删除 | 菜单管理', '2022-04-19 05:34:55', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/85', 'DELETE', NULL, b'1', 39);
INSERT INTO `e_upms_operate_log` VALUES (53, '删除 | 菜单管理', '2022-04-19 05:34:57', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/86', 'DELETE', NULL, b'1', 30);
INSERT INTO `e_upms_operate_log` VALUES (54, '删除 | 菜单管理', '2022-04-19 05:35:03', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/87', 'DELETE', NULL, b'1', 40);
INSERT INTO `e_upms_operate_log` VALUES (55, '删除 | 菜单管理', '2022-04-19 05:35:05', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/88', 'DELETE', NULL, b'1', 30);
INSERT INTO `e_upms_operate_log` VALUES (56, '删除 | 菜单管理', '2022-04-19 05:35:12', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu/82', 'DELETE', NULL, b'1', 29);
INSERT INTO `e_upms_operate_log` VALUES (57, '修改 | 菜单管理', '2022-04-19 05:40:50', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/EruptMenu', 'PUT', '{\"name\":\"修改\",\"status\":\"1\",\"parentMenu\":{\"id\":77,\"name\":\"课程视频管理\"},\"type\":\"button\",\"value\":\"Orders@EDIT\",\"sort\":20,\"code\":\"ZEkcR5u5\",\"id\":79}', b'1', 189);
INSERT INTO `e_upms_operate_log` VALUES (58, '删除 | 用户管理', '2022-04-19 05:44:32', NULL, '192.168.137.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User/1446666198576553985', 'DELETE', NULL, b'1', 161);
INSERT INTO `e_upms_operate_log` VALUES (59, '修改 | 用户管理', '2022-05-16 19:15:12', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1,\"name\":\"老九学堂\",\"headImg\":\"https://edu-image.nosdn.127.net/B708E1BA2C626ABF7A91AE902406B6C6.png?imageView&quality=100&thumbnail=75y75|https://oss.wuzhaoqi.top/2022-05-16/ywBpjBWcamzP.png\",\"email\":\"1465922561@qq.com\",\"balance\":0,\"vipTime\":\"2030-11-17\",\"flag\":0}', b'1', 33);
INSERT INTO `e_upms_operate_log` VALUES (60, '修改 | 用户管理', '2022-05-16 19:15:19', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1,\"name\":\"老九学堂\",\"headImg\":\"https://oss.wuzhaoqi.top/2022-05-16/ywBpjBWcamzP.png\",\"email\":\"1465922561@qq.com\",\"balance\":0,\"vipTime\":\"2030-11-17\",\"flag\":0}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (61, '修改 | 用户管理', '2022-05-16 19:21:47', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1,\"name\":\"老九学堂\",\"headImg\":\"https://oss.wuzhaoqi.top/2022-05-16/ywBpjBWcamzP.png\",\"email\":\"1465922561@qq.com\",\"balance\":0,\"vipTime\":\"2030-11-17\",\"flag\":0}', b'1', 1101);
INSERT INTO `e_upms_operate_log` VALUES (62, '修改 | 用户管理', '2022-05-16 19:23:26', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1507416612423602200,\"name\":\"king\",\"headImg\":\"https://oss.wuzhaoqi.top/2022-05-16/IRcWffAUEgQM.png\",\"email\":\"a@qq.com\",\"balance\":0,\"vipTime\":\"2022-03-29 01:58:22\",\"flag\":0,\"createTime\":\"2022-03-26 01:58:22\",\"updateTime\":\"2022-03-26 01:58:22\"}', b'1', 83);
INSERT INTO `e_upms_operate_log` VALUES (63, '修改 | 用户管理', '2022-05-16 19:23:35', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1507416612423602200,\"name\":\"king\",\"headImg\":\"https://oss.wuzhaoqi.top/2022-05-16/IRcWffAUEgQM.png\",\"email\":\"a@qq.com\",\"balance\":0,\"vipTime\":\"2022-03-29 01:58:22\",\"flag\":0,\"createTime\":\"2022-03-26 01:58:22\",\"updateTime\":\"2022-03-26 01:58:22\"}', b'1', 19);
INSERT INTO `e_upms_operate_log` VALUES (64, '修改 | 用户管理', '2022-05-16 19:24:45', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1507416612423602200,\"name\":\"king\",\"headImg\":\"https://oss.wuzhaoqi.top/2022-05-16/iUXzlomahzOx.png\",\"email\":\"a@qq.com\",\"balance\":0,\"vipTime\":\"2022-03-29 01:58:22\",\"flag\":0,\"createTime\":\"2022-03-26 01:58:22\",\"updateTime\":\"2022-03-26 01:58:22\"}', b'1', 109);
INSERT INTO `e_upms_operate_log` VALUES (65, '修改 | 课程管理', '2022-05-16 19:25:46', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/Course', 'PUT', '{\"id\":19,\"uid\":2,\"name\":\"php构建即时通讯系统\",\"msg\":\"简介：用PHP构建一个Socket服务，以长链接为基础，开发在线游戏、实时聊天、监控、打点等即时通讯类应用。\",\"coverImage\":\"https://oss.wuzhaoqi.top/2022-05-16/hZtOMDihqHXC.png\",\"price\":3.26,\"vipPrice\":2.61,\"category\":{\"status\":3,\"text\":\"移动开发\"},\"flag\":0,\"createTime\":\"2022-03-27\",\"updateTime\":\"2022-03-27\"}', b'1', 13);
INSERT INTO `e_upms_operate_log` VALUES (66, '修改 | 课程管理', '2022-05-16 19:25:55', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/Course', 'PUT', '{\"id\":19,\"uid\":2,\"name\":\"php构建即时通讯系统\",\"msg\":\"简介：用PHP构建一个Socket服务，以长链接为基础，开发在线游戏、实时聊天、监控、打点等即时通讯类应用。\",\"coverImage\":\"https://oss.wuzhaoqi.top/2022-05-16/hZtOMDihqHXC.png\",\"price\":3.26,\"vipPrice\":2.61,\"flag\":0,\"createTime\":\"2022-03-27\",\"updateTime\":\"2022-03-27\"}', b'1', 18);
INSERT INTO `e_upms_operate_log` VALUES (67, '修改 | 课程管理', '2022-05-16 19:35:16', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/Course', 'PUT', '{\"id\":19,\"name\":\"php构建即时通讯系统\",\"msg\":\"简介：用PHP构建一个Socket服务，以长链接为基础，开发在线游戏、实时聊天、监控、打点等即时通讯类应用。\",\"coverImage\":\"https://oss.wuzhaoqi.top/2022-05-16/REEpSKBTdJDz.png\",\"price\":3.26,\"vipPrice\":2.61,\"category\":2,\"flag\":false,\"createTime\":\"2022-03-27 21:43:17\",\"updateTime\":\"2022-03-27 21:43:17\"}', b'1', 114);
INSERT INTO `e_upms_operate_log` VALUES (68, '修改 | 用户管理', '2022-05-16 20:27:58', NULL, '192.168.28.1', 'erupt', '0|0|0|内网IP|内网IP', 'http://localhost:8081/erupt-api/data/modify/User', 'PUT', '{\"id\":1,\"name\":\"老九学堂\",\"headImg\":\"https://oss.wuzhaoqi.top/2022-05-16/WLSqcjtEDALH.png\",\"email\":\"1465922561@qq.com\",\"balance\":0,\"vipTime\":\"2030-11-17 04:21:06\",\"flag\":0}', b'1', 593);

-- ----------------------------
-- Table structure for e_upms_org
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_org`;
CREATE TABLE `e_upms_org`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sort` int NULL DEFAULT NULL,
  `parent_org_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKc2wj35ujq2m84uw59dx6wy3gj`(`code` ASC) USING BTREE,
  INDEX `FKtj7222kjnkt7pv9kfn9g8ck4h`(`parent_org_id` ASC) USING BTREE,
  CONSTRAINT `FKtj7222kjnkt7pv9kfn9g8ck4h` FOREIGN KEY (`parent_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_org
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_post
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_post`;
CREATE TABLE `e_upms_post`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weight` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKltq5h3n5cyyk5nxtjhg9lhidg`(`code` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_post
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role`;
CREATE TABLE `e_upms_role`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `code` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `create_user_id` bigint NULL DEFAULT NULL,
  `update_user_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UKjgxkp7mr4183tcwosrbqpsl3a`(`code` ASC) USING BTREE,
  INDEX `FKad39xpgtpmhq0fp5newnabv1g`(`create_user_id` ASC) USING BTREE,
  INDEX `FKbghup2p4f1x9eokeygyg8p658`(`update_user_id` ASC) USING BTREE,
  CONSTRAINT `FKad39xpgtpmhq0fp5newnabv1g` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKbghup2p4f1x9eokeygyg8p658` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_role
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_role_menu`;
CREATE TABLE `e_upms_role_menu`  (
  `role_id` bigint NOT NULL,
  `menu_id` bigint NOT NULL,
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE,
  INDEX `FKr6bl403chgwjnb6jk0uqqd9x8`(`menu_id` ASC) USING BTREE,
  CONSTRAINT `FKgsdnakqsme4htxkiapwmf6tbi` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKr6bl403chgwjnb6jk0uqqd9x8` FOREIGN KEY (`menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_role_menu
-- ----------------------------

-- ----------------------------
-- Table structure for e_upms_user
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user`;
CREATE TABLE `e_upms_user`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `update_time` datetime NULL DEFAULT NULL,
  `account` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `is_admin` bit(1) NULL DEFAULT NULL,
  `is_md5` bit(1) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remark` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `reset_pwd_time` datetime NULL DEFAULT NULL,
  `status` bit(1) NULL DEFAULT NULL,
  `white_ip` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `erupt_org_id` bigint NULL DEFAULT NULL,
  `erupt_post_id` bigint NULL DEFAULT NULL,
  `create_user_id` bigint NULL DEFAULT NULL,
  `update_user_id` bigint NULL DEFAULT NULL,
  `erupt_menu_id` bigint NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `UK812t22yn0295dkkvx5gjgahax`(`account` ASC) USING BTREE,
  INDEX `FK1re8jv3614mkk2wfxscvgvmnm`(`erupt_org_id` ASC) USING BTREE,
  INDEX `FK53cice19aydjcuykpv847ocdv`(`erupt_post_id` ASC) USING BTREE,
  INDEX `FKdvwfw4x66ahh1tavd69cnx4i0`(`create_user_id` ASC) USING BTREE,
  INDEX `FKct3f9stm4eti10401f7rbh5ey`(`update_user_id` ASC) USING BTREE,
  INDEX `FKga0jd7sahnn1tv14mq4dy5kba`(`erupt_menu_id` ASC) USING BTREE,
  CONSTRAINT `FK1re8jv3614mkk2wfxscvgvmnm` FOREIGN KEY (`erupt_org_id`) REFERENCES `e_upms_org` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK53cice19aydjcuykpv847ocdv` FOREIGN KEY (`erupt_post_id`) REFERENCES `e_upms_post` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKct3f9stm4eti10401f7rbh5ey` FOREIGN KEY (`update_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKdvwfw4x66ahh1tavd69cnx4i0` FOREIGN KEY (`create_user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKga0jd7sahnn1tv14mq4dy5kba` FOREIGN KEY (`erupt_menu_id`) REFERENCES `e_upms_menu` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_user
-- ----------------------------
INSERT INTO `e_upms_user` VALUES (1, 'erupt', '2022-04-10 16:50:04', NULL, 'erupt', NULL, b'1', b'1', '610d44f73b7709169e8e06ca4ac5af8e', NULL, NULL, NULL, b'1', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for e_upms_user_role
-- ----------------------------
DROP TABLE IF EXISTS `e_upms_user_role`;
CREATE TABLE `e_upms_user_role`  (
  `user_id` bigint NOT NULL,
  `role_id` bigint NOT NULL,
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE,
  INDEX `FK3h4lekfh26f5f8b7by3ejges6`(`role_id` ASC) USING BTREE,
  CONSTRAINT `FK3h4lekfh26f5f8b7by3ejges6` FOREIGN KEY (`role_id`) REFERENCES `e_upms_role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FKes2ylim5w3ej690ss84sb956x` FOREIGN KEY (`user_id`) REFERENCES `e_upms_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of e_upms_user_role
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `uid` bigint NOT NULL,
  `cid` bigint NOT NULL,
  `trade_no` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '支付宝交易号',
  `state` int UNSIGNED NULL DEFAULT 0,
  `price` decimal(8, 2) NULL DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT NULL,
  `completion_time` datetime NULL DEFAULT NULL,
  `flag` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid_key`(`cid` ASC) USING BTREE,
  INDEX `uid_key`(`uid` ASC) USING BTREE,
  CONSTRAINT `cid_key` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `uid_key` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20220515013936 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (20220419025952, 2, 644, '2022041922001492560502103485', 4, 65.46, '2022-04-19 00:29:52', '2022-05-01 03:00:20', 0);
INSERT INTO `orders` VALUES (20220419034438, 2, 155, '2022041922001492560502103992', 2, 147.08, '2022-04-19 01:14:39', '2022-04-19 03:45:07', 0);
INSERT INTO `orders` VALUES (20220419035143, 2, 29, NULL, 3, 136.54, '2022-04-19 01:21:43', NULL, 0);
INSERT INTO `orders` VALUES (20220419035215, 2, 280, NULL, 1, 68.79, '2022-04-19 01:22:15', NULL, 0);
INSERT INTO `orders` VALUES (20220513190145, 2, 657, '2022051322001492560502115159', 4, 48.76, '2022-05-13 16:31:45', '2022-05-13 19:02:24', 0);
INSERT INTO `orders` VALUES (20220514034634, 2, 606, NULL, 1, 118.40, '2022-05-14 01:16:34', NULL, 0);
INSERT INTO `orders` VALUES (20220514034709, 2, 611, '2022051422001492560502114972', 4, 20.97, '2022-05-14 01:17:09', '2022-05-14 03:47:34', 0);
INSERT INTO `orders` VALUES (20220514220558, 2, 643, NULL, 3, 18.86, '2022-05-14 19:35:58', NULL, 1);
INSERT INTO `orders` VALUES (20220514220705, 2, 643, '2022051422001492560502115718', 2, 18.86, '2022-05-14 19:37:05', '2022-05-14 22:07:33', 0);
INSERT INTO `orders` VALUES (20220514220943, 2, 643, NULL, 3, 18.86, '2022-05-14 19:39:44', NULL, 1);
INSERT INTO `orders` VALUES (20220515013100, 2, 29, NULL, 1, 136.54, '2022-05-14 23:01:00', NULL, 1);
INSERT INTO `orders` VALUES (20220515013154, 2, 644, NULL, 1, 65.46, '2022-05-14 23:01:54', NULL, 1);
INSERT INTO `orders` VALUES (20220515013316, 2, 644, '2022051522001492560502115986', 2, 65.46, '2022-05-14 23:03:17', '2022-05-15 01:33:46', 0);
INSERT INTO `orders` VALUES (20220515013849, 2, 29, NULL, 3, 136.54, '2022-05-14 23:08:49', NULL, 0);
INSERT INTO `orders` VALUES (20220515013935, 2, 29, NULL, 3, 136.54, '2022-05-14 23:09:35', NULL, 0);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint NOT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `msg` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` bigint NULL DEFAULT NULL,
  `is_share` int NULL DEFAULT 0 COMMENT '是否可以分享课程,0不可以1可以',
  `balance` decimal(8, 2) NOT NULL COMMENT '账户余额',
  `version` int NULL DEFAULT NULL,
  `vip_time` timestamp NULL DEFAULT NULL,
  `flag` int UNSIGNED NOT NULL DEFAULT 0,
  `create_time` timestamp NULL DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `role` int NULL DEFAULT 2,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
