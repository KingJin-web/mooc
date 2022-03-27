/*
 Navicat Premium Data Transfer

 Source Server         : 本机
 Source Server Type    : MySQL
 Source Server Version : 80019
 Source Host           : localhost:3306
 Source Schema         : mooc

 Target Server Type    : MySQL
 Target Server Version : 80019
 File Encoding         : 65001

 Date: 27/03/2022 21:23:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(0) NOT NULL,
  `uid` bigint(0) NOT NULL COMMENT '拥有者用户id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程概述',
  `cover_image` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片路径',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `vip_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '会员价',
  `activity_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '活动价',
  `sales` int(0) NULL DEFAULT NULL COMMENT '销量',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `flag` int(0) NOT NULL DEFAULT 0 COMMENT '是否已经删除',
  `version` int(0) NOT NULL DEFAULT 0 COMMENT '版本',
  `category` int(0) NULL DEFAULT NULL COMMENT '分类',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_key`(`uid`) USING BTREE,
  INDEX `id_k2`(`category`) USING BTREE,
  CONSTRAINT `id_k2` FOREIGN KEY (`category`) REFERENCES `category` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (0, 1446666198576553985, '123344', '123344', '123344', 23.30, 3.99, 9.99, 123344, '2021-11-18 22:15:55', '2021-10-12 16:06:52', 0, 0, NULL);
INSERT INTO `course` VALUES (1, 1, '【零基础学Java】老九零基础学编程系列之Java', '这门课程是真正能够带大家零基础入门Java的视频课，里面配套了笔记、作业、答疑社群、游戏项目等，不管小伙伴们是出于兴趣热爱、过级考试、或者是想在开发领域取得一番成就，相信都能对大家有所帮助。\n课程是以实用和游戏化学习为主，也希望大家能坚持学下去，给我们多提一些建议，老九学堂大门永远为想要成长的小伙伴敞开!\n最后，谢谢大家对我们的爱，憋说了，给小伙伴们笔芯，我们也会越来越棒的!\n', 'https://edu-image.nosdn.127.net/15bc6a0864fc4989b58f892df6781cb2.png?imageView&quality=100&crop=3_0_1143_635&thumbnail=450y250', 0.00, 0.00, 0.00, 124, '2021-11-18 22:16:00', '0000-00-00 00:00:00', 0, 0, NULL);
INSERT INTO `course` VALUES (2, 2, ' React高级教程之高阶组件', '简介：高阶组件是React 中一个很重要且比较复杂的概念，高阶组件在很多第三方库（如Redux）中都被经常使用。在项目中用好高阶组件，可以显著提高代码质量。', 'https://course-1255691183.file.myqcloud.com/img/cover/201910302253303743.jpg!cover_270', 100.00, 88.00, NULL, 99, '2022-03-26 03:13:42', '0000-00-00 00:00:00', 0, 0, 1);
INSERT INTO `course` VALUES (1446666198576553123, 1446666198576553985, '【零基础学C++】老九零基础学编程系列之C++', '这是一门真正适合任何零基础学习的入门课，由教学经验超过十年的大咖级老师，老九学堂总教头徐嵩老师主讲。\r\n本课程与外面那些妖艳贱货不同，我们不古板的深究语法，只注重于实用，课程中有很多逗笔，开脑洞的玩法，所用项目都是真实原创，课程将以游戏作为案例，揭露程序本质，将会了解到更多程序思维，我们的终极目标是学完课程能做出自己', 'http://kingjin-web.gitee.io/my-img/mooc/cimg/c++.jpg', 0.00, 0.00, 0.00, NULL, '2021-11-14 01:19:07', '0000-00-00 00:00:00', 0, 0, NULL);
INSERT INTO `course` VALUES (1446666198576553999, 1446666198576553985, '【零基础学C语言】老九零基础学编程系列之C语言', '这是一门真正适合任何零基础学习的入门课，由教学经验超过十年的大咖级老师，老九学堂总教头徐嵩老师主讲。', 'http://kingjin-web.gitee.io/my-img/mooc/cimg/C%E8%AF%AD%E8%A8%80.png', 0.00, 0.00, 0.00, 122, '2021-11-14 00:50:33', '0000-00-00 00:00:00', 0, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
