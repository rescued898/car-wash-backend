/*
 Navicat Premium Data Transfer

 Source Server         : homestead
 Source Server Type    : MySQL
 Source Server Version : 50727
 Source Host           : localhost:33060
 Source Schema         : smart_car_wash

 Target Server Type    : MySQL
 Target Server Version : 50727
 File Encoding         : 65001

 Date: 05/05/2020 01:21:41
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_menu`;
CREATE TABLE `admin_menu`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL DEFAULT 0,
  `order` int(11) NOT NULL DEFAULT 0,
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `uri` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `permission` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_menu
-- ----------------------------
INSERT INTO `admin_menu` VALUES (1, 0, 1, '仪表盘', 'fa-bar-chart', '/', NULL, NULL, '2020-04-15 22:04:52');
INSERT INTO `admin_menu` VALUES (2, 0, 7, '管理员设置', 'fa-tasks', NULL, NULL, NULL, '2020-04-15 22:12:11');
INSERT INTO `admin_menu` VALUES (3, 2, 8, '用户管理', 'fa-users', 'auth/users', NULL, NULL, '2020-04-15 22:12:11');
INSERT INTO `admin_menu` VALUES (4, 2, 9, '角色管理', 'fa-user', 'auth/roles', NULL, NULL, '2020-04-15 22:12:11');
INSERT INTO `admin_menu` VALUES (5, 2, 10, '权限管理', 'fa-ban', 'auth/permissions', NULL, NULL, '2020-04-15 22:12:11');
INSERT INTO `admin_menu` VALUES (6, 2, 11, '菜单管理', 'fa-bars', 'auth/menu', NULL, NULL, '2020-04-15 22:12:11');
INSERT INTO `admin_menu` VALUES (7, 2, 12, '操作日志', 'fa-history', 'auth/logs', NULL, NULL, '2020-04-15 22:12:11');
INSERT INTO `admin_menu` VALUES (8, 0, 5, '优惠包管理', 'fa-tags', '/package-coupons', NULL, '2020-04-15 22:08:49', '2020-04-15 22:11:35');
INSERT INTO `admin_menu` VALUES (9, 0, 2, '洗车点管理', 'fa-car', '/points', NULL, '2020-04-15 22:09:22', '2020-04-27 23:34:45');
INSERT INTO `admin_menu` VALUES (10, 0, 6, '用户管理', 'fa-users', '/users', NULL, '2020-04-15 22:11:05', '2020-04-27 23:36:42');
INSERT INTO `admin_menu` VALUES (11, 0, 4, '订单管理', 'fa-jpy', '/user-orders', NULL, '2020-04-15 22:11:28', '2020-04-27 23:35:44');
INSERT INTO `admin_menu` VALUES (12, 0, 3, '机器管理', 'fa-android', '/point-machines', NULL, '2020-04-15 22:12:00', '2020-04-27 23:35:08');

-- ----------------------------
-- Table structure for admin_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `admin_operation_log`;
CREATE TABLE `admin_operation_log`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `input` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_operation_log_user_id_index`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_operation_log
-- ----------------------------
INSERT INTO `admin_operation_log` VALUES (1, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-03-28 07:32:06', '2020-03-28 07:32:06');
INSERT INTO `admin_operation_log` VALUES (2, 1, 'admin/auth/login', 'GET', '192.168.10.1', '[]', '2020-03-28 07:33:54', '2020-03-28 07:33:54');
INSERT INTO `admin_operation_log` VALUES (3, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-04-15 22:04:20', '2020-04-15 22:04:20');
INSERT INTO `admin_operation_log` VALUES (4, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:04:26', '2020-04-15 22:04:26');
INSERT INTO `admin_operation_log` VALUES (5, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:04:30', '2020-04-15 22:04:30');
INSERT INTO `admin_operation_log` VALUES (6, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:04:38', '2020-04-15 22:04:38');
INSERT INTO `admin_operation_log` VALUES (7, 1, 'admin/auth/menu/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:04:43', '2020-04-15 22:04:43');
INSERT INTO `admin_operation_log` VALUES (8, 1, 'admin/auth/menu/1', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4eea\\u8868\\u76d8\",\"icon\":\"fa-bar-chart\",\"uri\":\"\\/\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:04:52', '2020-04-15 22:04:52');
INSERT INTO `admin_operation_log` VALUES (9, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:04:53', '2020-04-15 22:04:53');
INSERT INTO `admin_operation_log` VALUES (10, 1, 'admin/auth/menu/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:04:56', '2020-04-15 22:04:56');
INSERT INTO `admin_operation_log` VALUES (11, 1, 'admin/auth/menu/2', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7ba1\\u7406\\u5458\\u8bbe\\u7f6e\",\"icon\":\"fa-tasks\",\"uri\":null,\"roles\":[\"1\",null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:05:06', '2020-04-15 22:05:06');
INSERT INTO `admin_operation_log` VALUES (12, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:05:06', '2020-04-15 22:05:06');
INSERT INTO `admin_operation_log` VALUES (13, 1, 'admin/auth/menu/3/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:05:09', '2020-04-15 22:05:09');
INSERT INTO `admin_operation_log` VALUES (14, 1, 'admin/auth/menu/3', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"auth\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:05:19', '2020-04-15 22:05:19');
INSERT INTO `admin_operation_log` VALUES (15, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:05:19', '2020-04-15 22:05:19');
INSERT INTO `admin_operation_log` VALUES (16, 1, 'admin/auth/menu/4/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:05:22', '2020-04-15 22:05:22');
INSERT INTO `admin_operation_log` VALUES (17, 1, 'admin/auth/menu/4', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u89d2\\u8272\\u7ba1\\u7406\",\"icon\":\"fa-user\",\"uri\":\"auth\\/roles\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:05:32', '2020-04-15 22:05:32');
INSERT INTO `admin_operation_log` VALUES (18, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:05:32', '2020-04-15 22:05:32');
INSERT INTO `admin_operation_log` VALUES (19, 1, 'admin/auth/menu/5/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:05:35', '2020-04-15 22:05:35');
INSERT INTO `admin_operation_log` VALUES (20, 1, 'admin/auth/menu/5', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u6743\\u9650\\u7ba1\\u7406\",\"icon\":\"fa-ban\",\"uri\":\"auth\\/permissions\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:05:42', '2020-04-15 22:05:42');
INSERT INTO `admin_operation_log` VALUES (21, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:05:43', '2020-04-15 22:05:43');
INSERT INTO `admin_operation_log` VALUES (22, 1, 'admin/auth/menu/6/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:05:47', '2020-04-15 22:05:47');
INSERT INTO `admin_operation_log` VALUES (23, 1, 'admin/auth/menu/6', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u83dc\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"auth\\/menu\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:05:53', '2020-04-15 22:05:53');
INSERT INTO `admin_operation_log` VALUES (24, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:05:54', '2020-04-15 22:05:54');
INSERT INTO `admin_operation_log` VALUES (25, 1, 'admin/auth/menu/7/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:05:57', '2020-04-15 22:05:57');
INSERT INTO `admin_operation_log` VALUES (26, 1, 'admin/auth/menu/7', 'PUT', '192.168.10.1', '{\"parent_id\":\"2\",\"title\":\"\\u64cd\\u4f5c\\u65e5\\u5fd7\",\"icon\":\"fa-history\",\"uri\":\"auth\\/logs\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-15 22:06:03', '2020-04-15 22:06:03');
INSERT INTO `admin_operation_log` VALUES (27, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:06:04', '2020-04-15 22:06:04');
INSERT INTO `admin_operation_log` VALUES (28, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:06:15', '2020-04-15 22:06:15');
INSERT INTO `admin_operation_log` VALUES (29, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u4f18\\u60e0\\u5305\\u7ba1\\u7406\",\"icon\":\"fa-tags\",\"uri\":\"\\/package-coupons\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\"}', '2020-04-15 22:08:49', '2020-04-15 22:08:49');
INSERT INTO `admin_operation_log` VALUES (30, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:08:50', '2020-04-15 22:08:50');
INSERT INTO `admin_operation_log` VALUES (31, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-04-15 22:08:55', '2020-04-15 22:08:55');
INSERT INTO `admin_operation_log` VALUES (32, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:08:56', '2020-04-15 22:08:56');
INSERT INTO `admin_operation_log` VALUES (33, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d17\\u8f66\\u70b9\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/points\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\"}', '2020-04-15 22:09:22', '2020-04-15 22:09:22');
INSERT INTO `admin_operation_log` VALUES (34, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:09:23', '2020-04-15 22:09:23');
INSERT INTO `admin_operation_log` VALUES (35, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-04-15 22:09:28', '2020-04-15 22:09:28');
INSERT INTO `admin_operation_log` VALUES (36, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:09:29', '2020-04-15 22:09:29');
INSERT INTO `admin_operation_log` VALUES (37, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:09:31', '2020-04-15 22:09:31');
INSERT INTO `admin_operation_log` VALUES (38, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:09:34', '2020-04-15 22:09:34');
INSERT INTO `admin_operation_log` VALUES (39, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:09:36', '2020-04-15 22:09:36');
INSERT INTO `admin_operation_log` VALUES (40, 1, 'admin/points', 'POST', '192.168.10.1', '{\"name\":\"913265895@qq.com\",\"address\":\"sdfgb\",\"lng\":\"119.280934\",\"lat\":\"26.073378\",\"status\":\"on\",\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/points\"}', '2020-04-15 22:09:47', '2020-04-15 22:09:47');
INSERT INTO `admin_operation_log` VALUES (41, 1, 'admin/points/create', 'GET', '192.168.10.1', '[]', '2020-04-15 22:09:51', '2020-04-15 22:09:51');
INSERT INTO `admin_operation_log` VALUES (42, 1, 'admin/points', 'POST', '192.168.10.1', '{\"name\":\"913265895@qq.com\",\"address\":\"sdfgb\",\"lng\":\"119.280934\",\"lat\":\"26.073378\",\"status\":\"on\",\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\"}', '2020-04-15 22:10:22', '2020-04-15 22:10:22');
INSERT INTO `admin_operation_log` VALUES (43, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-04-15 22:10:23', '2020-04-15 22:10:23');
INSERT INTO `admin_operation_log` VALUES (44, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:10:26', '2020-04-15 22:10:26');
INSERT INTO `admin_operation_log` VALUES (45, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:10:37', '2020-04-15 22:10:37');
INSERT INTO `admin_operation_log` VALUES (46, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\"}', '2020-04-15 22:11:05', '2020-04-15 22:11:05');
INSERT INTO `admin_operation_log` VALUES (47, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:11:06', '2020-04-15 22:11:06');
INSERT INTO `admin_operation_log` VALUES (48, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":10},{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-04-15 22:11:11', '2020-04-15 22:11:11');
INSERT INTO `admin_operation_log` VALUES (49, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:11:11', '2020-04-15 22:11:11');
INSERT INTO `admin_operation_log` VALUES (50, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/user-orders\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\"}', '2020-04-15 22:11:28', '2020-04-15 22:11:28');
INSERT INTO `admin_operation_log` VALUES (51, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:11:28', '2020-04-15 22:11:28');
INSERT INTO `admin_operation_log` VALUES (52, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":10},{\\\"id\\\":11},{\\\"id\\\":9},{\\\"id\\\":8},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-04-15 22:11:35', '2020-04-15 22:11:35');
INSERT INTO `admin_operation_log` VALUES (53, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:11:35', '2020-04-15 22:11:35');
INSERT INTO `admin_operation_log` VALUES (54, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u673a\\u5668\\u7ba1\\u7406\",\"icon\":\"fa-bars\",\"uri\":\"\\/point-machines\",\"roles\":[null],\"permission\":null,\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\"}', '2020-04-15 22:11:59', '2020-04-15 22:11:59');
INSERT INTO `admin_operation_log` VALUES (55, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:12:00', '2020-04-15 22:12:00');
INSERT INTO `admin_operation_log` VALUES (56, 1, 'admin/auth/menu', 'POST', '192.168.10.1', '{\"_token\":\"vmSLQYm6MPP2qvjhyXfQc09BhKCOqkrdLxCh0rbi\",\"_order\":\"[{\\\"id\\\":1},{\\\"id\\\":9},{\\\"id\\\":12},{\\\"id\\\":11},{\\\"id\\\":8},{\\\"id\\\":10},{\\\"id\\\":2,\\\"children\\\":[{\\\"id\\\":3},{\\\"id\\\":4},{\\\"id\\\":5},{\\\"id\\\":6},{\\\"id\\\":7}]}]\"}', '2020-04-15 22:12:11', '2020-04-15 22:12:11');
INSERT INTO `admin_operation_log` VALUES (57, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:12:11', '2020-04-15 22:12:11');
INSERT INTO `admin_operation_log` VALUES (58, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-15 22:12:13', '2020-04-15 22:12:13');
INSERT INTO `admin_operation_log` VALUES (59, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:12:16', '2020-04-15 22:12:16');
INSERT INTO `admin_operation_log` VALUES (60, 1, 'admin/user-orders', 'GET', '192.168.10.1', '[]', '2020-04-15 22:12:39', '2020-04-15 22:12:39');
INSERT INTO `admin_operation_log` VALUES (61, 1, 'admin/user-orders/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:12:43', '2020-04-15 22:12:43');
INSERT INTO `admin_operation_log` VALUES (62, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:01', '2020-04-15 22:13:01');
INSERT INTO `admin_operation_log` VALUES (63, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:02', '2020-04-15 22:13:02');
INSERT INTO `admin_operation_log` VALUES (64, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:06', '2020-04-15 22:13:06');
INSERT INTO `admin_operation_log` VALUES (65, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:08', '2020-04-15 22:13:08');
INSERT INTO `admin_operation_log` VALUES (66, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:10', '2020-04-15 22:13:10');
INSERT INTO `admin_operation_log` VALUES (67, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:11', '2020-04-15 22:13:11');
INSERT INTO `admin_operation_log` VALUES (68, 1, 'admin/users/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:13', '2020-04-15 22:13:13');
INSERT INTO `admin_operation_log` VALUES (69, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:17', '2020-04-15 22:13:17');
INSERT INTO `admin_operation_log` VALUES (70, 1, 'admin/package-coupons/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:18', '2020-04-15 22:13:18');
INSERT INTO `admin_operation_log` VALUES (71, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:26', '2020-04-15 22:13:26');
INSERT INTO `admin_operation_log` VALUES (72, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:29', '2020-04-15 22:13:29');
INSERT INTO `admin_operation_log` VALUES (73, 1, 'admin/package-coupons/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:13:31', '2020-04-15 22:13:31');
INSERT INTO `admin_operation_log` VALUES (74, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-04-15 22:35:08', '2020-04-15 22:35:08');
INSERT INTO `admin_operation_log` VALUES (75, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:35:11', '2020-04-15 22:35:11');
INSERT INTO `admin_operation_log` VALUES (76, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:35:30', '2020-04-15 22:35:30');
INSERT INTO `admin_operation_log` VALUES (77, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:35:31', '2020-04-15 22:35:31');
INSERT INTO `admin_operation_log` VALUES (78, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-15 22:35:33', '2020-04-15 22:35:33');
INSERT INTO `admin_operation_log` VALUES (79, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:27:31', '2020-04-16 00:27:31');
INSERT INTO `admin_operation_log` VALUES (80, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:27:33', '2020-04-16 00:27:33');
INSERT INTO `admin_operation_log` VALUES (81, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:27:35', '2020-04-16 00:27:35');
INSERT INTO `admin_operation_log` VALUES (82, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:27:45', '2020-04-16 00:27:45');
INSERT INTO `admin_operation_log` VALUES (83, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:27:49', '2020-04-16 00:27:49');
INSERT INTO `admin_operation_log` VALUES (84, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:27:50', '2020-04-16 00:27:50');
INSERT INTO `admin_operation_log` VALUES (85, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-16 00:29:29', '2020-04-16 00:29:29');
INSERT INTO `admin_operation_log` VALUES (86, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-04-27 22:26:12', '2020-04-27 22:26:12');
INSERT INTO `admin_operation_log` VALUES (87, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:26:18', '2020-04-27 22:26:18');
INSERT INTO `admin_operation_log` VALUES (88, 1, 'admin/points/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:26:23', '2020-04-27 22:26:23');
INSERT INTO `admin_operation_log` VALUES (89, 1, 'admin/points/1', 'PUT', '192.168.10.1', '{\"name\":\"913265895@qq.com\",\"address\":\"\\u798f\\u5dde\\u5927\\u5b66\",\"lng\":\"119.271853\",\"lat\":\"26.074795\",\"status\":\"on\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/points\"}', '2020-04-27 22:27:09', '2020-04-27 22:27:09');
INSERT INTO `admin_operation_log` VALUES (90, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-04-27 22:27:10', '2020-04-27 22:27:10');
INSERT INTO `admin_operation_log` VALUES (91, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:27:14', '2020-04-27 22:27:14');
INSERT INTO `admin_operation_log` VALUES (92, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:30:38', '2020-04-27 22:30:38');
INSERT INTO `admin_operation_log` VALUES (93, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:31:06', '2020-04-27 22:31:06');
INSERT INTO `admin_operation_log` VALUES (94, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:32:01', '2020-04-27 22:32:01');
INSERT INTO `admin_operation_log` VALUES (95, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:33:43', '2020-04-27 22:33:43');
INSERT INTO `admin_operation_log` VALUES (96, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:36:19', '2020-04-27 22:36:19');
INSERT INTO `admin_operation_log` VALUES (97, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:37:07', '2020-04-27 22:37:07');
INSERT INTO `admin_operation_log` VALUES (98, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:40:59', '2020-04-27 22:40:59');
INSERT INTO `admin_operation_log` VALUES (99, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:41:27', '2020-04-27 22:41:27');
INSERT INTO `admin_operation_log` VALUES (100, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:42:03', '2020-04-27 22:42:03');
INSERT INTO `admin_operation_log` VALUES (101, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:42:23', '2020-04-27 22:42:23');
INSERT INTO `admin_operation_log` VALUES (102, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:42:45', '2020-04-27 22:42:45');
INSERT INTO `admin_operation_log` VALUES (103, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:42:56', '2020-04-27 22:42:56');
INSERT INTO `admin_operation_log` VALUES (104, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:43:02', '2020-04-27 22:43:02');
INSERT INTO `admin_operation_log` VALUES (105, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:45:52', '2020-04-27 22:45:52');
INSERT INTO `admin_operation_log` VALUES (106, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:45:57', '2020-04-27 22:45:57');
INSERT INTO `admin_operation_log` VALUES (107, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:46:01', '2020-04-27 22:46:01');
INSERT INTO `admin_operation_log` VALUES (108, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:46:03', '2020-04-27 22:46:03');
INSERT INTO `admin_operation_log` VALUES (109, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:46:37', '2020-04-27 22:46:37');
INSERT INTO `admin_operation_log` VALUES (110, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:46:49', '2020-04-27 22:46:49');
INSERT INTO `admin_operation_log` VALUES (111, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:47:26', '2020-04-27 22:47:26');
INSERT INTO `admin_operation_log` VALUES (112, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:47:56', '2020-04-27 22:47:56');
INSERT INTO `admin_operation_log` VALUES (113, 1, 'admin/point-machines', 'POST', '192.168.10.1', '{\"point_id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u673a\\u5668\",\"machine_no\":\"No1231241\",\"type\":\"1\",\"cost\":\"50000\",\"cost_at\":\"2020-04-27 22:47:56\",\"build_at\":\"2020-04-27 22:47:56\",\"remark\":\"zheshibeizu\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\"}', '2020-04-27 22:48:24', '2020-04-27 22:48:24');
INSERT INTO `admin_operation_log` VALUES (114, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '[]', '2020-04-27 22:48:27', '2020-04-27 22:48:27');
INSERT INTO `admin_operation_log` VALUES (115, 1, 'admin/point-machines', 'POST', '192.168.10.1', '{\"point_id\":\"1\",\"name\":\"\\u8d85\\u7ea7\\u673a\\u5668\",\"machine_no\":\"No1231241\",\"type\":\"1\",\"cost\":\"50000\",\"cost_at\":\"2020-04-27 22:47:56\",\"build_at\":\"2020-04-27 22:47:56\",\"remark\":\"zheshibeizu\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\"}', '2020-04-27 22:48:47', '2020-04-27 22:48:47');
INSERT INTO `admin_operation_log` VALUES (116, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:48:47', '2020-04-27 22:48:47');
INSERT INTO `admin_operation_log` VALUES (117, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:50:07', '2020-04-27 22:50:07');
INSERT INTO `admin_operation_log` VALUES (118, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:50:46', '2020-04-27 22:50:46');
INSERT INTO `admin_operation_log` VALUES (119, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:52:03', '2020-04-27 22:52:03');
INSERT INTO `admin_operation_log` VALUES (120, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:52:30', '2020-04-27 22:52:30');
INSERT INTO `admin_operation_log` VALUES (121, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:53:02', '2020-04-27 22:53:02');
INSERT INTO `admin_operation_log` VALUES (122, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:54:03', '2020-04-27 22:54:03');
INSERT INTO `admin_operation_log` VALUES (123, 1, 'admin/point-machines', 'GET', '192.168.10.1', '[]', '2020-04-27 22:54:35', '2020-04-27 22:54:35');
INSERT INTO `admin_operation_log` VALUES (124, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:54:39', '2020-04-27 22:54:39');
INSERT INTO `admin_operation_log` VALUES (125, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:54:42', '2020-04-27 22:54:42');
INSERT INTO `admin_operation_log` VALUES (126, 1, 'admin/points', 'POST', '192.168.10.1', '{\"name\":\"\\u9ed1\\u4eba\\u5927\\u5b66\",\"address\":\"\\u9ed1\\u4eba\\u5927\\u5b66\",\"lng\":\"119.30803\",\"lat\":\"26.031426\",\"status\":\"on\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/points\"}', '2020-04-27 22:55:23', '2020-04-27 22:55:23');
INSERT INTO `admin_operation_log` VALUES (127, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-04-27 22:55:23', '2020-04-27 22:55:23');
INSERT INTO `admin_operation_log` VALUES (128, 1, 'admin/points/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:55:28', '2020-04-27 22:55:28');
INSERT INTO `admin_operation_log` VALUES (129, 1, 'admin/points/2', 'PUT', '192.168.10.1', '{\"name\":\"\\u4e07\\u91cc\\u5b66\\u751f\\u8857\",\"address\":\"\\u4e07\\u91cc\\u5b66\\u751f\\u8857\",\"lng\":\"119.30803\",\"lat\":\"26.031426\",\"status\":\"on\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/points\"}', '2020-04-27 22:55:47', '2020-04-27 22:55:47');
INSERT INTO `admin_operation_log` VALUES (130, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-04-27 22:55:47', '2020-04-27 22:55:47');
INSERT INTO `admin_operation_log` VALUES (131, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:55:49', '2020-04-27 22:55:49');
INSERT INTO `admin_operation_log` VALUES (132, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:55:51', '2020-04-27 22:55:51');
INSERT INTO `admin_operation_log` VALUES (133, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:56:52', '2020-04-27 22:56:52');
INSERT INTO `admin_operation_log` VALUES (134, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:56:58', '2020-04-27 22:56:58');
INSERT INTO `admin_operation_log` VALUES (135, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:57:00', '2020-04-27 22:57:00');
INSERT INTO `admin_operation_log` VALUES (136, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:57:02', '2020-04-27 22:57:02');
INSERT INTO `admin_operation_log` VALUES (137, 1, 'admin/user-orders/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:57:05', '2020-04-27 22:57:05');
INSERT INTO `admin_operation_log` VALUES (138, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 22:57:08', '2020-04-27 22:57:08');
INSERT INTO `admin_operation_log` VALUES (139, 1, 'admin/user-orders', 'GET', '192.168.10.1', '[]', '2020-04-27 22:57:43', '2020-04-27 22:57:43');
INSERT INTO `admin_operation_log` VALUES (140, 1, 'admin/user-orders', 'GET', '192.168.10.1', '[]', '2020-04-27 22:59:31', '2020-04-27 22:59:31');
INSERT INTO `admin_operation_log` VALUES (141, 1, 'admin/user-orders', 'GET', '192.168.10.1', '[]', '2020-04-27 23:01:16', '2020-04-27 23:01:16');
INSERT INTO `admin_operation_log` VALUES (142, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:04:15', '2020-04-27 23:04:15');
INSERT INTO `admin_operation_log` VALUES (143, 1, 'admin/point-machines/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:04:19', '2020-04-27 23:04:19');
INSERT INTO `admin_operation_log` VALUES (144, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:04:24', '2020-04-27 23:04:24');
INSERT INTO `admin_operation_log` VALUES (145, 1, 'admin/user-orders/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:04:27', '2020-04-27 23:04:27');
INSERT INTO `admin_operation_log` VALUES (146, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:04:43', '2020-04-27 23:04:43');
INSERT INTO `admin_operation_log` VALUES (147, 1, 'admin/user-orders', 'GET', '192.168.10.1', '[]', '2020-04-27 23:06:53', '2020-04-27 23:06:53');
INSERT INTO `admin_operation_log` VALUES (148, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:07:05', '2020-04-27 23:07:05');
INSERT INTO `admin_operation_log` VALUES (149, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:07:29', '2020-04-27 23:07:29');
INSERT INTO `admin_operation_log` VALUES (150, 1, 'admin/users/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:07:49', '2020-04-27 23:07:49');
INSERT INTO `admin_operation_log` VALUES (151, 1, 'admin/users/1', 'PUT', '192.168.10.1', '{\"name\":\"Send\",\"email\":\"xiya9607@gmail.com\",\"binding\":\"156 5941 1565\",\"nickname\":\"Senkorl\",\"money\":\"10000\",\"contact_way\":\"fuzhoushi\",\"comments\":\"\\u963f\\u65af\\u987f\\u53d1\\u987a\\u4e30\",\"blacklist\":\"off\",\"level\":\"-1\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/users\"}', '2020-04-27 23:09:04', '2020-04-27 23:09:04');
INSERT INTO `admin_operation_log` VALUES (152, 1, 'admin/users/1/edit', 'GET', '192.168.10.1', '[]', '2020-04-27 23:09:06', '2020-04-27 23:09:06');
INSERT INTO `admin_operation_log` VALUES (153, 1, 'admin/users/1', 'PUT', '192.168.10.1', '{\"name\":\"Send\",\"email\":\"xiya9607@gmail.com\",\"binding\":\"156 5941 1565\",\"nickname\":\"Senkorl\",\"money\":\"10000\",\"contact_way\":\"fuzhoushi\",\"comments\":\"\\u963f\\u65af\\u987f\\u53d1\\u987a\\u4e30\",\"blacklist\":\"off\",\"level\":\"-1\",\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\"}', '2020-04-27 23:09:38', '2020-04-27 23:09:38');
INSERT INTO `admin_operation_log` VALUES (154, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:09:39', '2020-04-27 23:09:39');
INSERT INTO `admin_operation_log` VALUES (155, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:18:40', '2020-04-27 23:18:40');
INSERT INTO `admin_operation_log` VALUES (156, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:19:31', '2020-04-27 23:19:31');
INSERT INTO `admin_operation_log` VALUES (157, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:20:02', '2020-04-27 23:20:02');
INSERT INTO `admin_operation_log` VALUES (158, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:20:24', '2020-04-27 23:20:24');
INSERT INTO `admin_operation_log` VALUES (159, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:21:15', '2020-04-27 23:21:15');
INSERT INTO `admin_operation_log` VALUES (160, 1, 'admin/users', 'GET', '192.168.10.1', '[]', '2020-04-27 23:24:06', '2020-04-27 23:24:06');
INSERT INTO `admin_operation_log` VALUES (161, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:14', '2020-04-27 23:24:14');
INSERT INTO `admin_operation_log` VALUES (162, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:17', '2020-04-27 23:24:17');
INSERT INTO `admin_operation_log` VALUES (163, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:19', '2020-04-27 23:24:19');
INSERT INTO `admin_operation_log` VALUES (164, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:22', '2020-04-27 23:24:22');
INSERT INTO `admin_operation_log` VALUES (165, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:23', '2020-04-27 23:24:23');
INSERT INTO `admin_operation_log` VALUES (166, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2020-04-27 23:24:32', '2020-04-27 23:24:32');
INSERT INTO `admin_operation_log` VALUES (167, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:42', '2020-04-27 23:24:42');
INSERT INTO `admin_operation_log` VALUES (168, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2020-04-27 23:24:45', '2020-04-27 23:24:45');
INSERT INTO `admin_operation_log` VALUES (169, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:24:53', '2020-04-27 23:24:53');
INSERT INTO `admin_operation_log` VALUES (170, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '[]', '2020-04-27 23:31:28', '2020-04-27 23:31:28');
INSERT INTO `admin_operation_log` VALUES (171, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:31:31', '2020-04-27 23:31:31');
INSERT INTO `admin_operation_log` VALUES (172, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:31:39', '2020-04-27 23:31:39');
INSERT INTO `admin_operation_log` VALUES (173, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:31:48', '2020-04-27 23:31:48');
INSERT INTO `admin_operation_log` VALUES (174, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\",\"_export_\":\"all\"}', '2020-04-27 23:31:52', '2020-04-27 23:31:52');
INSERT INTO `admin_operation_log` VALUES (175, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:32:39', '2020-04-27 23:32:39');
INSERT INTO `admin_operation_log` VALUES (176, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:32:42', '2020-04-27 23:32:42');
INSERT INTO `admin_operation_log` VALUES (177, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:32:43', '2020-04-27 23:32:43');
INSERT INTO `admin_operation_log` VALUES (178, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:32:45', '2020-04-27 23:32:45');
INSERT INTO `admin_operation_log` VALUES (179, 1, 'admin/auth/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:32:48', '2020-04-27 23:32:48');
INSERT INTO `admin_operation_log` VALUES (180, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:32:51', '2020-04-27 23:32:51');
INSERT INTO `admin_operation_log` VALUES (181, 1, 'admin', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:03', '2020-04-27 23:33:03');
INSERT INTO `admin_operation_log` VALUES (182, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:06', '2020-04-27 23:33:06');
INSERT INTO `admin_operation_log` VALUES (183, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:08', '2020-04-27 23:33:08');
INSERT INTO `admin_operation_log` VALUES (184, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:24', '2020-04-27 23:33:24');
INSERT INTO `admin_operation_log` VALUES (185, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:26', '2020-04-27 23:33:26');
INSERT INTO `admin_operation_log` VALUES (186, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_columns_\":\"apply_delete,created_at,id,is_pay,machine.machine_no,order_no,pay_price,pay_type,type,updated_at,user_id\",\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:37', '2020-04-27 23:33:37');
INSERT INTO `admin_operation_log` VALUES (187, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:42', '2020-04-27 23:33:42');
INSERT INTO `admin_operation_log` VALUES (188, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:44', '2020-04-27 23:33:44');
INSERT INTO `admin_operation_log` VALUES (189, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:48', '2020-04-27 23:33:48');
INSERT INTO `admin_operation_log` VALUES (190, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:33:51', '2020-04-27 23:33:51');
INSERT INTO `admin_operation_log` VALUES (191, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:34:06', '2020-04-27 23:34:06');
INSERT INTO `admin_operation_log` VALUES (192, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '[]', '2020-04-27 23:34:12', '2020-04-27 23:34:12');
INSERT INTO `admin_operation_log` VALUES (193, 1, 'admin/users', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:34:16', '2020-04-27 23:34:16');
INSERT INTO `admin_operation_log` VALUES (194, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:34:18', '2020-04-27 23:34:18');
INSERT INTO `admin_operation_log` VALUES (195, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:34:26', '2020-04-27 23:34:26');
INSERT INTO `admin_operation_log` VALUES (196, 1, 'admin/auth/menu/9/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:34:30', '2020-04-27 23:34:30');
INSERT INTO `admin_operation_log` VALUES (197, 1, 'admin/auth/menu/9', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u6d17\\u8f66\\u70b9\\u7ba1\\u7406\",\"icon\":\"fa-car\",\"uri\":\"\\/points\",\"roles\":[null],\"permission\":null,\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-27 23:34:45', '2020-04-27 23:34:45');
INSERT INTO `admin_operation_log` VALUES (198, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:34:46', '2020-04-27 23:34:46');
INSERT INTO `admin_operation_log` VALUES (199, 1, 'admin/auth/menu/12/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:34:51', '2020-04-27 23:34:51');
INSERT INTO `admin_operation_log` VALUES (200, 1, 'admin/auth/menu/12', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u673a\\u5668\\u7ba1\\u7406\",\"icon\":\"fa-m\",\"uri\":\"\\/point-machines\",\"roles\":[null],\"permission\":null,\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-27 23:34:58', '2020-04-27 23:34:58');
INSERT INTO `admin_operation_log` VALUES (201, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:34:58', '2020-04-27 23:34:58');
INSERT INTO `admin_operation_log` VALUES (202, 1, 'admin/auth/menu/12/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:35:02', '2020-04-27 23:35:02');
INSERT INTO `admin_operation_log` VALUES (203, 1, 'admin/auth/menu/12', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u673a\\u5668\\u7ba1\\u7406\",\"icon\":\"fa-android\",\"uri\":\"\\/point-machines\",\"roles\":[null],\"permission\":null,\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-27 23:35:08', '2020-04-27 23:35:08');
INSERT INTO `admin_operation_log` VALUES (204, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:35:09', '2020-04-27 23:35:09');
INSERT INTO `admin_operation_log` VALUES (205, 1, 'admin/auth/menu/11/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:35:12', '2020-04-27 23:35:12');
INSERT INTO `admin_operation_log` VALUES (206, 1, 'admin/auth/menu/11', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u8ba2\\u5355\\u7ba1\\u7406\",\"icon\":\"fa-jpy\",\"uri\":\"\\/user-orders\",\"roles\":[null],\"permission\":null,\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-27 23:35:44', '2020-04-27 23:35:44');
INSERT INTO `admin_operation_log` VALUES (207, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:35:45', '2020-04-27 23:35:45');
INSERT INTO `admin_operation_log` VALUES (208, 1, 'admin/auth/menu/10/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:35:49', '2020-04-27 23:35:49');
INSERT INTO `admin_operation_log` VALUES (209, 1, 'admin/auth/menu/10', 'PUT', '192.168.10.1', '{\"parent_id\":\"0\",\"title\":\"\\u7528\\u6237\\u7ba1\\u7406\",\"icon\":\"fa-users\",\"uri\":\"\\/users\",\"roles\":[null],\"permission\":null,\"_token\":\"jAiNgTIs2hc6mKdWySoBy9O1pbK2SEpunlx8QAB3\",\"_method\":\"PUT\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/auth\\/menu\"}', '2020-04-27 23:36:42', '2020-04-27 23:36:42');
INSERT INTO `admin_operation_log` VALUES (210, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:36:43', '2020-04-27 23:36:43');
INSERT INTO `admin_operation_log` VALUES (211, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:36:45', '2020-04-27 23:36:45');
INSERT INTO `admin_operation_log` VALUES (212, 1, 'admin/auth/menu', 'GET', '192.168.10.1', '[]', '2020-04-27 23:37:01', '2020-04-27 23:37:01');
INSERT INTO `admin_operation_log` VALUES (213, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:37:11', '2020-04-27 23:37:11');
INSERT INTO `admin_operation_log` VALUES (214, 1, 'admin/point-machines', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:37:16', '2020-04-27 23:37:16');
INSERT INTO `admin_operation_log` VALUES (215, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:37:18', '2020-04-27 23:37:18');
INSERT INTO `admin_operation_log` VALUES (216, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:37:19', '2020-04-27 23:37:19');
INSERT INTO `admin_operation_log` VALUES (217, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '[]', '2020-04-27 23:38:35', '2020-04-27 23:38:35');
INSERT INTO `admin_operation_log` VALUES (218, 1, 'admin/package-coupons', 'GET', '192.168.10.1', '[]', '2020-04-27 23:39:03', '2020-04-27 23:39:03');
INSERT INTO `admin_operation_log` VALUES (219, 1, 'admin/user-orders', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:39:05', '2020-04-27 23:39:05');
INSERT INTO `admin_operation_log` VALUES (220, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-27 23:39:12', '2020-04-27 23:39:12');
INSERT INTO `admin_operation_log` VALUES (221, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-04-28 21:54:43', '2020-04-28 21:54:43');
INSERT INTO `admin_operation_log` VALUES (222, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-04-28 21:54:44', '2020-04-28 21:54:44');
INSERT INTO `admin_operation_log` VALUES (223, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-04-28 21:54:47', '2020-04-28 21:54:47');
INSERT INTO `admin_operation_log` VALUES (224, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-28 21:54:51', '2020-04-28 21:54:51');
INSERT INTO `admin_operation_log` VALUES (225, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-04-28 21:54:59', '2020-04-28 21:54:59');
INSERT INTO `admin_operation_log` VALUES (226, 1, 'admin/points/create', 'GET', '192.168.10.1', '[]', '2020-04-28 21:56:43', '2020-04-28 21:56:43');
INSERT INTO `admin_operation_log` VALUES (227, 1, 'admin/points/create', 'GET', '192.168.10.1', '[]', '2020-04-28 21:57:00', '2020-04-28 21:57:00');
INSERT INTO `admin_operation_log` VALUES (228, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-05-04 01:03:17', '2020-05-04 01:03:17');
INSERT INTO `admin_operation_log` VALUES (229, 1, 'admin/auth/logout', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:07:56', '2020-05-04 01:07:56');
INSERT INTO `admin_operation_log` VALUES (230, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-05-04 01:08:27', '2020-05-04 01:08:27');
INSERT INTO `admin_operation_log` VALUES (231, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:08:31', '2020-05-04 01:08:31');
INSERT INTO `admin_operation_log` VALUES (232, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:08:34', '2020-05-04 01:08:34');
INSERT INTO `admin_operation_log` VALUES (233, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:08:48', '2020-05-04 01:08:48');
INSERT INTO `admin_operation_log` VALUES (234, 1, 'admin/points/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:08:52', '2020-05-04 01:08:52');
INSERT INTO `admin_operation_log` VALUES (235, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:09:02', '2020-05-04 01:09:02');
INSERT INTO `admin_operation_log` VALUES (236, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:09:04', '2020-05-04 01:09:04');
INSERT INTO `admin_operation_log` VALUES (237, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:09:38', '2020-05-04 01:09:38');
INSERT INTO `admin_operation_log` VALUES (238, 1, 'admin/points/2/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:09:41', '2020-05-04 01:09:41');
INSERT INTO `admin_operation_log` VALUES (239, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:09:53', '2020-05-04 01:09:53');
INSERT INTO `admin_operation_log` VALUES (240, 1, 'admin/points/create', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:09:55', '2020-05-04 01:09:55');
INSERT INTO `admin_operation_log` VALUES (241, 1, 'admin/points', 'POST', '192.168.10.1', '{\"name\":\"\\u8fde\\u6c5f\\u53bf\\u653f\\u5e9c\",\"address\":\"\\u8fde\\u6c5f\\u53bf\\u653f\\u5e9c\",\"lng\":\"119.539508\",\"lat\":\"26.197566\",\"status\":\"on\",\"_token\":\"KMdA2Y5mDuvnuIAESpvbAjjxeLPeIHcQjzoOFIZ6\",\"_previous_\":\"http:\\/\\/carwash.test\\/admin\\/points\"}', '2020-05-04 01:10:54', '2020-05-04 01:10:54');
INSERT INTO `admin_operation_log` VALUES (242, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-05-04 01:10:55', '2020-05-04 01:10:55');
INSERT INTO `admin_operation_log` VALUES (243, 1, 'admin/points/1/edit', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 01:11:04', '2020-05-04 01:11:04');
INSERT INTO `admin_operation_log` VALUES (244, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-05-04 12:16:24', '2020-05-04 12:16:24');
INSERT INTO `admin_operation_log` VALUES (245, 1, 'admin', 'GET', '192.168.10.1', '[]', '2020-05-04 12:16:24', '2020-05-04 12:16:24');
INSERT INTO `admin_operation_log` VALUES (246, 1, 'admin/points', 'GET', '192.168.10.1', '{\"_pjax\":\"#pjax-container\"}', '2020-05-04 12:16:41', '2020-05-04 12:16:41');
INSERT INTO `admin_operation_log` VALUES (247, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-05-04 13:32:17', '2020-05-04 13:32:17');
INSERT INTO `admin_operation_log` VALUES (248, 1, 'admin/points', 'GET', '192.168.10.1', '[]', '2020-05-04 13:51:21', '2020-05-04 13:51:21');

-- ----------------------------
-- Table structure for admin_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_permissions`;
CREATE TABLE `admin_permissions`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `http_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `http_path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_permissions_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_permissions_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_permissions
-- ----------------------------
INSERT INTO `admin_permissions` VALUES (1, 'All permission', '*', '', '*', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (2, 'Dashboard', 'dashboard', 'GET', '/', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (3, 'Login', 'auth.login', '', '/auth/login\r\n/auth/logout', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (4, 'User setting', 'auth.setting', 'GET,PUT', '/auth/setting', NULL, NULL);
INSERT INTO `admin_permissions` VALUES (5, 'Auth management', 'auth.management', '', '/auth/roles\r\n/auth/permissions\r\n/auth/menu\r\n/auth/logs', NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_menu`;
CREATE TABLE `admin_role_menu`  (
  `role_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_menu_role_id_menu_id_index`(`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_menu
-- ----------------------------
INSERT INTO `admin_role_menu` VALUES (1, 2, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_permissions`;
CREATE TABLE `admin_role_permissions`  (
  `role_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_permissions_role_id_permission_id_index`(`role_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_permissions
-- ----------------------------
INSERT INTO `admin_role_permissions` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_role_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_role_users`;
CREATE TABLE `admin_role_users`  (
  `role_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_role_users_role_id_user_id_index`(`role_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_role_users
-- ----------------------------
INSERT INTO `admin_role_users` VALUES (1, 1, NULL, NULL);

-- ----------------------------
-- Table structure for admin_roles
-- ----------------------------
DROP TABLE IF EXISTS `admin_roles`;
CREATE TABLE `admin_roles`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_roles_name_unique`(`name`) USING BTREE,
  UNIQUE INDEX `admin_roles_slug_unique`(`slug`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_roles
-- ----------------------------
INSERT INTO `admin_roles` VALUES (1, 'Administrator', 'administrator', '2020-03-28 07:30:27', '2020-03-28 07:30:27');

-- ----------------------------
-- Table structure for admin_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `admin_user_permissions`;
CREATE TABLE `admin_user_permissions`  (
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `admin_user_permissions_user_id_permission_id_index`(`user_id`, `permission_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for admin_users
-- ----------------------------
DROP TABLE IF EXISTS `admin_users`;
CREATE TABLE `admin_users`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(190) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `admin_users_username_unique`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of admin_users
-- ----------------------------
INSERT INTO `admin_users` VALUES (1, 'admin', '$2y$10$.PnDxqWgBonHT3ls6LMSd.QlZ4JeCqfkvBGzsNJ0rr/qeXtdM5ihK', 'Administrator', NULL, 'YwKtvFGiW9dRrPpOTO47JrHuukUWDSmYInQt9voIIiOTHgTWDU2ItaB9zQl4', '2020-03-28 07:30:27', '2020-03-28 07:30:27');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2016_01_04_173148_create_admin_tables', 1);
INSERT INTO `migrations` VALUES (4, '2019_08_19_000000_create_failed_jobs_table', 1);

-- ----------------------------
-- Table structure for package_coupon
-- ----------------------------
DROP TABLE IF EXISTS `package_coupon`;
CREATE TABLE `package_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `pic_url` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `coupon type` tinyint(1) NULL DEFAULT NULL COMMENT '洗车券使用类型 1-自助洗车 2-全自动洗车',
  `quantity` smallint(6) NULL DEFAULT 10 COMMENT '购买洗车券的数量',
  `additional_coupon _type` tinyint(1) NULL DEFAULT NULL COMMENT '额外送的券的使用类型 1-自助洗车 2-全自动洗车',
  `additional_quantity` smallint(6) NULL DEFAULT 0 COMMENT '购买送的券的数量',
  `price` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '售价',
  `sort` int(11) NULL DEFAULT 100 COMMENT '排序按升序排列',
  `user_num` int(11) NULL DEFAULT 0 COMMENT '每人限制兑换数量',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用说明',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '洗车优惠包' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of package_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for package_recharge
-- ----------------------------
DROP TABLE IF EXISTS `package_recharge`;
CREATE TABLE `package_recharge`  (
  `id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '优惠券名称',
  `amount` decimal(10, 2) NULL DEFAULT NULL COMMENT '充值金额',
  `additional_quantity` int(10) NULL DEFAULT NULL COMMENT '充值送的券的数量',
  `additional_coupon _type` tinyint(1) NULL DEFAULT NULL COMMENT '额外送的券的使用类型 1-自助洗车 2-全自动洗车',
  `desc` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `rule` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '使用说明',
  `sort` int(11) NULL DEFAULT 100 COMMENT '排序按升序排列',
  `user_num` int(11) NULL DEFAULT 0 COMMENT '每人限制兑换数量',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `deleted_at` datetime(0) NULL DEFAULT NULL,
  `pic_url` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '充值优惠包' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of package_recharge
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for pic
-- ----------------------------
DROP TABLE IF EXISTS `pic`;
CREATE TABLE `pic`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `table_type` int(11) NOT NULL COMMENT '表名',
  `table_id` int(11) NULL DEFAULT NULL COMMENT '表id',
  `pic_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '',
  `delete_at` datetime(0) NULL DEFAULT NULL COMMENT '是否删除',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pic
-- ----------------------------

-- ----------------------------
-- Table structure for point
-- ----------------------------
DROP TABLE IF EXISTS `point`;
CREATE TABLE `point`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `lng` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point
-- ----------------------------
INSERT INTO `point` VALUES (1, '福州大学', '福州大学', '26.074795', '119.271853', '1', '2020-04-27 22:27:09', '2020-04-15 22:10:22');
INSERT INTO `point` VALUES (2, '万里学生街', '万里学生街', '26.031426', '119.30803', '1', '2020-04-27 22:55:47', '2020-04-27 22:55:23');
INSERT INTO `point` VALUES (3, '连江县政府', '连江县政府', '26.197566', '119.539508', '1', '2020-05-04 01:10:54', '2020-05-04 01:10:54');

-- ----------------------------
-- Table structure for point_machine
-- ----------------------------
DROP TABLE IF EXISTS `point_machine`;
CREATE TABLE `point_machine`  (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `point_id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `machine_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT NULL COMMENT '1-自助型 2-全自动型',
  `cost` int(11) UNSIGNED NULL DEFAULT NULL COMMENT '机器购买所花费金额',
  `cost_at` datetime(0) NULL DEFAULT NULL COMMENT '机器购买时间',
  `build_at` datetime(0) NULL DEFAULT NULL COMMENT '机器运营时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of point_machine
-- ----------------------------
INSERT INTO `point_machine` VALUES (1, 1, '超级机器', 'No1231241', 1, 50000, '2020-04-27 22:47:56', '2020-04-27 22:47:56', 'zheshibeizu', '2020-04-27 22:48:47', '2020-04-27 22:48:47');

-- ----------------------------
-- Table structure for user_account_log
-- ----------------------------
DROP TABLE IF EXISTS `user_account_log`;
CREATE TABLE `user_account_log`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `type` smallint(6) NOT NULL COMMENT '类型：1=收入，2=支出',
  `price` decimal(10, 2) NOT NULL COMMENT '变动金额',
  `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '变动说明',
  `order_type` int(11) NOT NULL DEFAULT 0 COMMENT '订单类型 0--充值 1--自助洗车消费 2--全自动洗车消费',
  `order_id` int(11) NULL DEFAULT 0 COMMENT '订单ID',
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户账户余额变动记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_account_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_address
-- ----------------------------
DROP TABLE IF EXISTS `user_address`;
CREATE TABLE `user_address`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '姓名',
  `mobile` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '手机号',
  `province_id` int(11) NOT NULL DEFAULT 0,
  `province` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '省份名称',
  `city_id` int(11) NOT NULL DEFAULT 0,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '城市名称',
  `district_id` int(11) NOT NULL DEFAULT 0,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '县区名称',
  `detail` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '详细地址',
  `is_default` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否是默认地址：0=否，1=是',
  `addtime` int(11) NOT NULL DEFAULT 0,
  `is_delete` smallint(6) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户收货地址' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_address
-- ----------------------------
INSERT INTO `user_address` VALUES (1, 1, '张三', '020-81167888', 1941, '广东省', 1942, '广州市', 1945, '海珠区', '新港中路397号', 0, 1583651776, 0);

-- ----------------------------
-- Table structure for user_auth_login
-- ----------------------------
DROP TABLE IF EXISTS `user_auth_login`;
CREATE TABLE `user_auth_login`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL DEFAULT 0,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `token` varchar(225) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `is_pass` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否已确认登录：0=未扫码，1=已确认登录',
  `addtime` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `token`(`token`(191)) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户授权登录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_auth_login
-- ----------------------------

-- ----------------------------
-- Table structure for user_coupon
-- ----------------------------
DROP TABLE IF EXISTS `user_coupon`;
CREATE TABLE `user_coupon`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `package_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `package_id` int(11) NOT NULL,
  `coupon_type` tinyint(1) NULL DEFAULT NULL COMMENT '使用方式 1-自助洗车 2-全自动洗车',
  `is_use` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否已使用：0=未使用，1=已使用',
  `delete_at` datetime(0) NULL DEFAULT NULL,
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `coupon_id`(`package_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户-优惠券关系' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_coupon
-- ----------------------------

-- ----------------------------
-- Table structure for user_log
-- ----------------------------
DROP TABLE IF EXISTS `user_log`;
CREATE TABLE `user_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '改变的字段',
  `before_change` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '改变前字段的值',
  `after_change` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '改变后字段的值',
  `is_delete` smallint(6) NOT NULL DEFAULT 0,
  `created_at` datetime(0) NOT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_orders
-- ----------------------------
DROP TABLE IF EXISTS `user_orders`;
CREATE TABLE `user_orders`  (
  `id` int(11) NOT NULL,
  `user_id` int(11) NULL DEFAULT NULL,
  `type` tinyint(1) NULL DEFAULT 1 COMMENT '1--自助 2--全自动',
  `pay_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '1--直接消费 2--余额 3--洗车券',
  `pay_price` int(11) NULL DEFAULT NULL COMMENT '消费金额',
  `point` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `point_id` int(11) NULL DEFAULT NULL,
  `point_machine_id` int(11) NULL DEFAULT NULL,
  `order_no` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `apply_delete` smallint(1) NOT NULL DEFAULT 0 COMMENT '是否申请取消订单：0=否，1=申请取消订单',
  `is_pay` smallint(6) NOT NULL DEFAULT 0 COMMENT '支付状态：0=未支付，1=已支付',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_orders
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '授权手机号',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `weixin_openid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信openid',
  `weixin_unionid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '微信用户union id',
  `money` decimal(10, 2) NULL DEFAULT 0.00 COMMENT '余额',
  `avatar_url` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '头像url',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_black` tinyint(1) NULL DEFAULT 0 COMMENT '黑名单 0.否 | 1.是',
  `parent_id` int(11) NULL DEFAULT 0 COMMENT '父级ID',
  `created_at` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `updated_at` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `binding`(`phone`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Send', '15659411565', 'xiya9607@gmail.com', NULL, '$2y$10$6GjXcxbY.4VyrdVL/bmWGuRiFWlz8/VruYIh8vVga7EslD636m3UC', NULL, 'oOgla5Dj040jbx9a5TntplSQCtso', '', 10000.00, 'https://wx.qlogo.cn/mmopen/vi_32/oVTZZspdwoGKJricIb2ygTVG7LKm6lvCNXYLrgI56eQpJkJiaeUDjj3FV7fYNn2G16hicVsPyxbGnwibmAl3x6icEAg/132', '阿斯顿发顺丰', 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (2, 'qiuxi', NULL, '913265895@qq.com', NULL, '$2y$10$6GjXcxbY.4VyrdVL/bmWGuRiFWlz8/VruYIh8vVga7EslD636m3UC', NULL, '', '', 0.00, NULL, NULL, 0, 0, NULL, NULL);
INSERT INTO `users` VALUES (3, 'qiuxi12', NULL, '235689@qq.com', NULL, '$2y$10$6GjXcxbY.4VyrdVL/bmWGuRiFWlz8/VruYIh8vVga7EslD636m3UC', NULL, '', '', 0.00, NULL, NULL, 0, 0, NULL, NULL);

-- ----------------------------
-- Table structure for wechat_form_id
-- ----------------------------
DROP TABLE IF EXISTS `wechat_form_id`;
CREATE TABLE `wechat_form_id`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `wechat_open_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '微信openid',
  `form_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `order_no` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '可选值：form_id或prepay_id',
  `send_count` int(11) NOT NULL DEFAULT 0 COMMENT '使用次数',
  `created_at` datetime(0) NULL DEFAULT NULL,
  `updated_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `order_no`(`order_no`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '小程序form_id和prepay_id记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wechat_form_id
-- ----------------------------

-- ----------------------------
-- Table structure for wechat_template_message
-- ----------------------------
DROP TABLE IF EXISTS `wechat_template_message`;
CREATE TABLE `wechat_template_message`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store_id` int(11) NOT NULL,
  `pay_tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '支付通知模板消息id',
  `send_tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '发货通知模板消息id',
  `refund_tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '退款通知模板消息id',
  `not_pay_tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单未支付通知模板消息id',
  `revoke_tpl` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '订单取消通知模板消息id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of wechat_template_message
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
