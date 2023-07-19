/*
 Navicat Premium Data Transfer

 Source Server         : hh_mysql
 Source Server Type    : MySQL
 Source Server Version : 80031 (8.0.31)
 Source Host           : localhost:3306
 Source Schema         : jf

 Target Server Type    : MySQL
 Target Server Version : 80031 (8.0.31)
 File Encoding         : 65001

 Date: 03/06/2023 11:23:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for clazz
-- ----------------------------
DROP TABLE IF EXISTS `clazz`;
CREATE TABLE `clazz`  (
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '班级名称',
  `major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `number` int NULL DEFAULT NULL COMMENT '学生人数',
  `start` date NULL DEFAULT NULL COMMENT '入学年份',
  `counsellor` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '辅导员',
  PRIMARY KEY (`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of clazz
-- ----------------------------
INSERT INTO `clazz` VALUES ('材料2班', '材料工程', 44, '2023-05-01', '鲁浪');
INSERT INTO `clazz` VALUES ('计科1班', '计算机科学与技术', 34, '2023-05-01', '杨晟烨');
INSERT INTO `clazz` VALUES ('计科2班', '计算机科学与技术', 45, '2023-06-06', '斯特罗斯');
INSERT INTO `clazz` VALUES ('软件1班', '软件工程', 35, '2023-05-01', '吴何涛');

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `c_no` int NOT NULL COMMENT '课程号',
  `c_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名',
  `c_hours` int NULL DEFAULT NULL COMMENT '学时',
  `c_score` double NULL DEFAULT NULL COMMENT '学分',
  PRIMARY KEY (`c_no`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (17000, '数据库原理与技术', 16, 3);
INSERT INTO `course` VALUES (17001, '数据结构', 20, 4);
INSERT INTO `course` VALUES (17002, '材料科学基础', 16, 2);
INSERT INTO `course` VALUES (17003, 'Java从入门到入土', 22, 3);
INSERT INTO `course` VALUES (17004, '如何快速提升说话能力', 10, 1);
INSERT INTO `course` VALUES (17005, '日语从入门到八嘎', 20, 2);
INSERT INTO `course` VALUES (17006, '马克思主义基本原理', 24, 4);
INSERT INTO `course` VALUES (17007, '法语综合教程', 20, 3);

-- ----------------------------
-- Table structure for curriculum
-- ----------------------------
DROP TABLE IF EXISTS `curriculum`;
CREATE TABLE `curriculum`  (
  `id` int NOT NULL COMMENT '排课id',
  `c_no` int NULL DEFAULT NULL COMMENT '课程号',
  `class_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班级名称',
  `teacher` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授课老师',
  `teach_time` date NULL DEFAULT NULL COMMENT '授课时间',
  `teach_place` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '授课地点',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `c_no`(`c_no` ASC) USING BTREE,
  INDEX `class_name`(`class_name` ASC) USING BTREE,
  INDEX `teacher`(`teacher` ASC) USING BTREE,
  CONSTRAINT `curriculum_ibfk_1` FOREIGN KEY (`c_no`) REFERENCES `course` (`c_no`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `curriculum_ibfk_2` FOREIGN KEY (`class_name`) REFERENCES `clazz` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `curriculum_ibfk_3` FOREIGN KEY (`teacher`) REFERENCES `teacher` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of curriculum
-- ----------------------------
INSERT INTO `curriculum` VALUES (770001, 17000, '计科1班', '丁真', '2023-04-03', '三元区5304');
INSERT INTO `curriculum` VALUES (770002, 17001, '计科1班', '丁真', '2023-04-24', '三元区2234');
INSERT INTO `curriculum` VALUES (770003, 17002, '材料2班', '汪嘉靖', '2023-05-01', '明德楼1024');
INSERT INTO `curriculum` VALUES (770004, 17003, '计科1班', '丁真', '2023-04-26', '三元区5301');
INSERT INTO `curriculum` VALUES (770005, 17004, '软件1班', '王新杰', '2023-05-09', '计科楼203');
INSERT INTO `curriculum` VALUES (770006, 17005, '材料2班', '石原里美', '2023-05-29', '经法楼学术报告厅');
INSERT INTO `curriculum` VALUES (770007, 17006, '计科1班', '王冰冰', '2023-04-24', '经法楼学术报告厅');
INSERT INTO `curriculum` VALUES (770008, 17007, '计科1班', '陈玉', '2023-05-02', '经法楼学术报告厅');

-- ----------------------------
-- Table structure for grade_sheet
-- ----------------------------
DROP TABLE IF EXISTS `grade_sheet`;
CREATE TABLE `grade_sheet`  (
  `stu_no` int NULL DEFAULT NULL COMMENT '学号',
  `c_no` int NOT NULL COMMENT '课程号',
  `grade` double NULL DEFAULT NULL COMMENT '成绩',
  INDEX `c_no`(`c_no` ASC) USING BTREE,
  CONSTRAINT `grade_sheet_ibfk_1` FOREIGN KEY (`c_no`) REFERENCES `course` (`c_no`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of grade_sheet
-- ----------------------------
INSERT INTO `grade_sheet` VALUES (1001, 17000, 98.1);
INSERT INTO `grade_sheet` VALUES (1001, 17001, 97.5);
INSERT INTO `grade_sheet` VALUES (1001, 17004, 77);
INSERT INTO `grade_sheet` VALUES (1002, 17004, 87);
INSERT INTO `grade_sheet` VALUES (1003, 17002, 67);
INSERT INTO `grade_sheet` VALUES (1004, 17004, 123);

-- ----------------------------
-- Table structure for stu
-- ----------------------------
DROP TABLE IF EXISTS `stu`;
CREATE TABLE `stu`  (
  `stu_no` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '学号',
  `stu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `stu_gender` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `stu_birth` date NULL DEFAULT NULL COMMENT '日期',
  `stu_major` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '专业',
  `stu_class` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '班级',
  `stu_area` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '家庭住址',
  `stu_tele` bigint NULL DEFAULT NULL COMMENT '联系电话',
  `stu_ps` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`stu_no`) USING BTREE,
  INDEX `stu_class`(`stu_class` ASC) USING BTREE,
  CONSTRAINT `stu_class` FOREIGN KEY (`stu_class`) REFERENCES `clazz` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stu
-- ----------------------------
INSERT INTO `stu` VALUES ('1001', '胡航', '男', '2023-05-03', '计算机科学与技术', '计科1班', '湖北省仙桃市', 1111111, '其实我是一个鄂州人');
INSERT INTO `stu` VALUES ('1002', '孙艺文', '女', '2023-05-01', '软件工程', '软件1班', '山东省青岛市', 22222222, NULL);
INSERT INTO `stu` VALUES ('1003', '张伟', '男', '2023-05-16', '材料工程', '材料2班', '辽宁省鞍山市', 213123123, NULL);

-- ----------------------------
-- Table structure for teacher
-- ----------------------------
DROP TABLE IF EXISTS `teacher`;
CREATE TABLE `teacher`  (
  `id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '工号',
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '姓名',
  `gender` char(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '性别',
  `birth` date NULL DEFAULT NULL COMMENT '出生日期',
  `dept` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '院系',
  `tele` bigint NULL DEFAULT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of teacher
-- ----------------------------
INSERT INTO `teacher` VALUES ('230001', '丁真', '男', '2023-05-02', '计算机学院', 123123);
INSERT INTO `teacher` VALUES ('230002', '汪嘉靖', '男', '2023-05-04', '材料工程学院', 4123);
INSERT INTO `teacher` VALUES ('230003', '王新杰', '男', '2023-04-24', '通识学院', 123123);
INSERT INTO `teacher` VALUES ('230004', '石原里美', '女', '2023-04-24', '外国语学院', 1231232);
INSERT INTO `teacher` VALUES ('230005', '王冰冰', '女', '2023-05-01', '马克思学院', 123123);
INSERT INTO `teacher` VALUES ('230006', '陈玉', '女', '2021-06-09', '外国语学院', 223217121);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '用户名',
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `usertype` int NULL DEFAULT NULL COMMENT '用户类别（0教师，1学生，2管理员）',
  PRIMARY KEY (`username`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1001', 'huhang', 1);
INSERT INTO `user` VALUES ('1002', 'sunyiwen', 1);
INSERT INTO `user` VALUES ('1003', '123456', 1);
INSERT INTO `user` VALUES ('230004', 'shiyuan', 0);
INSERT INTO `user` VALUES ('dingzhen', 'dingzhen', 2);

SET FOREIGN_KEY_CHECKS = 1;
