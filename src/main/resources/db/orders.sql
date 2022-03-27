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

 Date: 27/03/2022 21:22:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders`  (
  `id` bigint(0) NOT NULL,
  `uid` bigint(0) NOT NULL,
  `cid` bigint(0) NOT NULL,
  `state` int(0) UNSIGNED NULL DEFAULT 0,
  `create_time` timestamp(0) NULL DEFAULT NULL,
  `update_time` timestamp(0) NULL DEFAULT NULL,
  `price` decimal(10, 2) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `cid_key`(`cid`) USING BTREE,
  INDEX `uid_key`(`uid`) USING BTREE,
  CONSTRAINT `cid_key` FOREIGN KEY (`cid`) REFERENCES `course` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `uid_key` FOREIGN KEY (`uid`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES (1488545296878665730, 1, 1, 1, '2022-02-02 00:10:29', '2022-02-02 00:10:29', 1.20);
INSERT INTO `orders` VALUES (1505126417049448450, 1, 1, 1, '2022-03-19 18:17:56', '2022-03-19 18:17:56', 1.20);
INSERT INTO `orders` VALUES (1505136732117950466, 1, 1, 1, '2022-03-19 18:58:56', '2022-03-19 18:58:56', 1.20);

SET FOREIGN_KEY_CHECKS = 1;
