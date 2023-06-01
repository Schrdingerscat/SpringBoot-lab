/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50741 (5.7.41)
 Source Host           : localhost:3306
 Source Schema         : hsj666

 Target Server Type    : MySQL
 Target Server Version : 50741 (5.7.41)
 File Encoding         : 65001

 Date: 01/06/2023 19:41:44
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(11) NOT NULL COMMENT '课程ID',
  `reservation_id` int(11) NULL DEFAULT NULL COMMENT '预约ID',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '课程名称',
  `reservation_time_slot_code` int(11) NULL DEFAULT NULL COMMENT '预约时间段',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `reservation_id`(`reservation_id`) USING BTREE,
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`reservation_id`) REFERENCES `reservation` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '课程表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, 2, 'Software Design ', 3);
INSERT INTO `course` VALUES (2, 1, 'Software Analysis', 1);
INSERT INTO `course` VALUES (3, 3, 'Operating System', 1);

-- ----------------------------
-- Table structure for dailyjob
-- ----------------------------
DROP TABLE IF EXISTS `dailyjob`;
CREATE TABLE `dailyjob`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `weekly` int(10) NULL DEFAULT NULL,
  `time` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_id` varchar(11) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '实验室助理ID',
  `content` varchar(120) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `systemTime` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '日常工作' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dailyjob
-- ----------------------------
INSERT INTO `dailyjob` VALUES (1, 1, '2019-12-09 ', '201706', '扫地', '2019-12-09 19:39:04');
INSERT INTO `dailyjob` VALUES (2, 3, '2019-12-10 ', '201801', '扫地', '2019-12-10 12:09:01');
INSERT INTO `dailyjob` VALUES (3, 5855, '2020-06-11', '201801', '555', '2020-06-11 16:03:15 ');
INSERT INTO `dailyjob` VALUES (4, 7, '2020-06-27', 'yonghu', '清洁教室', '2020-06-27 20:37:43 ');

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `dep_id` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dep_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dep_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '二级学院' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '大数据与软件工程');
INSERT INTO `department` VALUES ('2', '电子与信息工程');

-- ----------------------------
-- Table structure for experimentresult
-- ----------------------------
DROP TABLE IF EXISTS `experimentresult`;
CREATE TABLE `experimentresult`  (
  `id` int(11) NOT NULL COMMENT '实验结果ID',
  `student_id` int(11) NULL DEFAULT NULL COMMENT '学生ID',
  `location` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '文件存放位置',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `student_id`(`student_id`) USING BTREE,
  CONSTRAINT `experimentresult_ibfk_1` FOREIGN KEY (`student_id`) REFERENCES `student` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '实验结果表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of experimentresult
-- ----------------------------
INSERT INTO `experimentresult` VALUES (1, 1, '\\home\\usr\\Ragan\\LabResult');
INSERT INTO `experimentresult` VALUES (2, 2, '\\LabResult');
INSERT INTO `experimentresult` VALUES (3, 3, '\\LabResult');
INSERT INTO `experimentresult` VALUES (4, 4, '\\LabResult');
INSERT INTO `experimentresult` VALUES (5, 5, '\\LabResult');
INSERT INTO `experimentresult` VALUES (6, 6, '\\LabResult');

-- ----------------------------
-- Table structure for form
-- ----------------------------
DROP TABLE IF EXISTS `form`;
CREATE TABLE `form`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `plan_id` int(10) NULL DEFAULT NULL,
  `user_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `status` int(10) NULL DEFAULT NULL COMMENT '（0为报名中，1面试失败，2面试成功）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '报名表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of form
-- ----------------------------
INSERT INTO `form` VALUES (9, 1, '201706', 1);
INSERT INTO `form` VALUES (10, 8, '201706', 2);
INSERT INTO `form` VALUES (12, 8, 'yonghu', 2);
INSERT INTO `form` VALUES (13, 10, 'yonghu', 1);

-- ----------------------------
-- Table structure for issue
-- ----------------------------
DROP TABLE IF EXISTS `issue`;
CREATE TABLE `issue`  (
  `id` int(11) NOT NULL COMMENT '问题反馈ID',
  `enrollment_id` int(11) NULL DEFAULT NULL,
  `description` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT '问题描述',
  `feedback_time` datetime NULL DEFAULT NULL COMMENT '反馈时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '问题反馈表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of issue
-- ----------------------------
INSERT INTO `issue` VALUES (1, 1, 'Too late to apologise', '2023-06-02 19:40:40');
INSERT INTO `issue` VALUES (2, 2, 'I love you', '2023-06-27 19:41:04');
INSERT INTO `issue` VALUES (3, 3, 'I love President Xi', '2023-06-14 19:41:24');

-- ----------------------------
-- Table structure for lab
-- ----------------------------
DROP TABLE IF EXISTS `lab`;
CREATE TABLE `lab`  (
  `id` int(11) NOT NULL COMMENT '实验室ID',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '实验室名称',
  `hardware_info` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT '硬件配置信息',
  `software_info` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT '软件安装情况',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '实验室表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lab
-- ----------------------------
INSERT INTO `lab` VALUES (1, 'SoftwareDevLab', 'CPU:4th Generation Intel Xeon Scalable Processors', 'Visual Studio Code');
INSERT INTO `lab` VALUES (2, 'ComputerNetworkLab', 'CPU:Intel Core i9', 'IDEA');
INSERT INTO `lab` VALUES (3, 'BlueKingDevLab', 'CPU:AMD Ryzen 9', 'Pycharm');

-- ----------------------------
-- Table structure for labs
-- ----------------------------
DROP TABLE IF EXISTS `labs`;
CREATE TABLE `labs`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `lab_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10021 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '实验室' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of labs
-- ----------------------------
INSERT INTO `labs` VALUES (10010, '软件开发中心', '1');
INSERT INTO `labs` VALUES (10020, '电本实验室', '2');

-- ----------------------------
-- Table structure for recruitment
-- ----------------------------
DROP TABLE IF EXISTS `recruitment`;
CREATE TABLE `recruitment`  (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `plan_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '招聘名称',
  `required` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '岗位需求说明',
  `require_num` int(10) NULL DEFAULT NULL COMMENT '岗位需求人数',
  `section_id` int(10) NULL DEFAULT NULL COMMENT '部门id',
  `lab_id` int(10) NULL DEFAULT NULL COMMENT '实验技术人员ID',
  `status` int(10) NULL DEFAULT NULL COMMENT '审核状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `section_id`(`section_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '应聘计划表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recruitment
-- ----------------------------
INSERT INTO `recruitment` VALUES (1, 'javaEEE', '要求头发少00', 10, 1, 10010, 1);
INSERT INTO `recruitment` VALUES (8, 'ssh', '无', 47, 1, 10010, 2);
INSERT INTO `recruitment` VALUES (12, '6666', '6666', 6666, 666, 666, NULL);

-- ----------------------------
-- Table structure for repair
-- ----------------------------
DROP TABLE IF EXISTS `repair`;
CREATE TABLE `repair`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `e_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `descrip` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `fix_time` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '报修表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of repair
-- ----------------------------
INSERT INTO `repair` VALUES (2, '显示屏', '对的', '2019-12-09 20:20:13', '201801');
INSERT INTO `repair` VALUES (3, '8655', '55', '2020-06-11 16:32:06 ', '201801');
INSERT INTO `repair` VALUES (4, '22222', '5252', '2020-06-11 16:45:21 ', '201801');
INSERT INTO `repair` VALUES (5, '8888', '555', '2020-06-11 18:34:47 ', '201706');
INSERT INTO `repair` VALUES (6, '主机箱', '冒烟', '2020-06-27 20:38:29 ', 'yonghu');

-- ----------------------------
-- Table structure for reservation
-- ----------------------------
DROP TABLE IF EXISTS `reservation`;
CREATE TABLE `reservation`  (
  `id` int(11) NOT NULL COMMENT '预约ID',
  `lab_id` int(11) NULL DEFAULT NULL COMMENT '实验室ID',
  `teacher_id` int(11) NULL DEFAULT NULL COMMENT '上课老师ID',
  `reservation_time_slot_code` int(11) NULL DEFAULT NULL COMMENT '预约时间段',
  `requirements` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL COMMENT '实验环境要求',
  `reservation_status` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '预约情况',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `lab_id`(`lab_id`) USING BTREE,
  CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`lab_id`) REFERENCES `lab` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '预约表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of reservation
-- ----------------------------
INSERT INTO `reservation` VALUES (1, 1, 1, 1, 'CPU>=Pentium', 'Success');
INSERT INTO `reservation` VALUES (2, 1, 3, 3, 'CPU<=Xeron', 'Success');
INSERT INTO `reservation` VALUES (3, 2, 1, 1, 'CPU>=Pentium', 'Success');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `role_id` int(11) NOT NULL,
  `role_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '角色',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, '学生');
INSERT INTO `role` VALUES (2, '助理');
INSERT INTO `role` VALUES (3, '实验室技术人员');
INSERT INTO `role` VALUES (4, '管理员');

-- ----------------------------
-- Table structure for section
-- ----------------------------
DROP TABLE IF EXISTS `section`;
CREATE TABLE `section`  (
  `section_id` int(10) NOT NULL AUTO_INCREMENT,
  `section_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `laboratory_id` int(10) NULL DEFAULT NULL,
  PRIMARY KEY (`section_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci COMMENT = '部门' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of section
-- ----------------------------
INSERT INTO `section` VALUES (1, '开发部', 10010);
INSERT INTO `section` VALUES (2, '后勤部', 10010);

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int(11) NOT NULL COMMENT '学生ID',
  `name` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NULL DEFAULT NULL COMMENT '学生姓名',
  `class_id` int(11) NULL DEFAULT NULL COMMENT '班级ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci COMMENT = '学生表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, 'Yipper Huang', 1);
INSERT INTO `student` VALUES (2, 'Ragan Liang', 2);
INSERT INTO `student` VALUES (3, 'Eason Chan', 1);
INSERT INTO `student` VALUES (4, 'Jay Chou', 2);
INSERT INTO `student` VALUES (5, 'Joe Biden', 3);
INSERT INTO `student` VALUES (6, 'Jinpin Xi', 3);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户id',
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '用户姓名',
  `pwd` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '密码',
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL COMMENT '照片',
  `section_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '201706', '林才楗', '123', NULL, 1);
INSERT INTO `user` VALUES (2, '201801', '林亦博', '123', NULL, NULL);
INSERT INTO `user` VALUES (3, '50001', '许传本', '123', NULL, 1);
INSERT INTO `user` VALUES (7, 'admin', '管理员', '123', NULL, NULL);
INSERT INTO `user` VALUES (8, 'yonghu', '用户', '123', NULL, NULL);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role_id` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `role_id`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 'admin', 4);
INSERT INTO `user_role` VALUES (5, '50001', 3);
INSERT INTO `user_role` VALUES (6, '201706', 2);
INSERT INTO `user_role` VALUES (7, '201801', 1);
INSERT INTO `user_role` VALUES (8, 'yonghu', 2);

SET FOREIGN_KEY_CHECKS = 1;
