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

 Date: 14/10/2021 18:59:29
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` bigint(20) NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `head_img` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` int(11) NULL DEFAULT NULL,
  `is_share` int(1) NULL DEFAULT 0 COMMENT '是否可以分享课程,0不可以1可以',
  `balance` decimal(8, 2) NULL DEFAULT NULL COMMENT '账户余额',
  `version` int(11) NULL DEFAULT NULL,
  `vip_time` timestamp(0) NULL DEFAULT NULL,
  `flag` int(1) UNSIGNED NULL DEFAULT 0,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  INDEX `id`(`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1446666198576553985, 'king', 'aaaa', NULL, 'jinpeng.qmail@qq.com', NULL, 0, NULL, NULL, '2021-10-12 10:37:54', 0, '2021-10-09 10:37:54', '2021-10-09 10:37:54');

SET FOREIGN_KEY_CHECKS = 1;
