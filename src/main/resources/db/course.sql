/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50725
 Source Host           : localhost:3306
 Source Schema         : mooc

 Target Server Type    : MySQL
 Target Server Version : 50725
 File Encoding         : 65001

 Date: 14/10/2021 18:59:12
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` bigint(20) NOT NULL,
  `uid` bigint(20) NOT NULL COMMENT '用户id',
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程名',
  `summary` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程概述',
  `cover_image` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '封面图片',
  `price` decimal(8, 2) NOT NULL COMMENT '价格',
  `vip_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '会员价',
  `activity_price` decimal(8, 2) NULL DEFAULT NULL COMMENT '活动价',
  `owner` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '拥有者',
  `sales` int(11) NULL DEFAULT NULL COMMENT '销量',
  `create_time` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_time` timestamp(0) NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '修改时间',
  `flag` int(1) NOT NULL DEFAULT 0 COMMENT '是否已经删除',
  `version` int(11) NOT NULL COMMENT '版本',
  `file` json NULL COMMENT '文件',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `id_key`(`uid`) USING BTREE,
  CONSTRAINT `id_key` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 1446666198576553985, '123344', '123344', '123344', 23.30, 3.99, 9.99, '123344', 123344, '2021-10-14 13:58:23', '2021-10-12 16:06:52', 0, 0, NULL);

SET FOREIGN_KEY_CHECKS = 1;
