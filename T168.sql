/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb3 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

DROP DATABASE IF EXISTS `t168`;
CREATE DATABASE IF NOT EXISTS `t168` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `t168`;

DROP TABLE IF EXISTS `config`;
CREATE TABLE IF NOT EXISTS `config` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(100) NOT NULL COMMENT '配置参数名称',
  `value` varchar(100) DEFAULT NULL COMMENT '配置参数值',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='配置文件';

DELETE FROM `config`;
INSERT INTO `config` (`id`, `name`, `value`) VALUES
	(1, '轮播图1', 'http://localhost:8080/keyangongzuoliang/upload/config1.jpg'),
	(2, '轮播图2', 'http://localhost:8080/keyangongzuoliang/upload/config2.jpg'),
	(3, '轮播图3', 'http://localhost:8080/keyangongzuoliang/upload/config3.jpg');

DROP TABLE IF EXISTS `dictionary`;
CREATE TABLE IF NOT EXISTS `dictionary` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `dic_code` varchar(200) DEFAULT NULL COMMENT '字段',
  `dic_name` varchar(200) DEFAULT NULL COMMENT '字段名',
  `code_index` int DEFAULT NULL COMMENT '编码',
  `index_name` varchar(200) DEFAULT NULL COMMENT '编码名字  Search111 ',
  `super_id` int DEFAULT NULL COMMENT '父字段id',
  `beizhu` varchar(200) DEFAULT NULL COMMENT '备注',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COMMENT='字典';

DELETE FROM `dictionary`;
INSERT INTO `dictionary` (`id`, `dic_code`, `dic_name`, `code_index`, `index_name`, `super_id`, `beizhu`, `create_time`) VALUES
	(1, 'sex_types', '性别类型', 1, '男', NULL, NULL, '2022-03-07 02:24:55'),
	(2, 'sex_types', '性别类型', 2, '女', NULL, NULL, '2022-03-07 02:24:55'),
	(3, 'xiangmu_yesno_types', '审核状态', 1, '待审核', NULL, NULL, '2022-03-07 02:24:55'),
	(4, 'xiangmu_yesno_types', '审核状态', 2, '同意', NULL, NULL, '2022-03-07 02:24:55'),
	(5, 'xiangmu_yesno_types', '审核状态', 3, '拒绝', NULL, NULL, '2022-03-07 02:24:55'),
	(6, 'xiangmu_types', '科研项目类型', 1, '科研项目类型1', NULL, '87', '2022-03-07 02:24:55'),
	(7, 'xiangmu_types', '科研项目类型', 2, '科研项目类型2', NULL, '71', '2022-03-07 02:24:55'),
	(8, 'xiangmu_types', '科研项目类型', 3, '科研项目类型3', NULL, '14', '2022-03-07 02:24:55'),
	(9, 'xiangmu_types', '科研项目类型', 4, '科研项目类型4', NULL, '65', '2022-03-07 02:24:55'),
	(10, 'keyanlunwen_yesno_types', '审核状态', 1, '待审核', NULL, NULL, '2022-03-07 02:24:55'),
	(11, 'keyanlunwen_yesno_types', '审核状态', 2, '同意', NULL, NULL, '2022-03-07 02:24:55'),
	(12, 'keyanlunwen_yesno_types', '审核状态', 3, '拒绝', NULL, NULL, '2022-03-07 02:24:55'),
	(13, 'keyanlunwen_types', '科研论文类型', 1, '科研论文类型1', NULL, NULL, '2022-03-07 02:24:55'),
	(14, 'keyanlunwen_types', '科研论文类型', 2, '科研论文类型2', NULL, NULL, '2022-03-07 02:24:55'),
	(15, 'keyanlunwen_types', '科研论文类型', 3, '科研论文类型3', NULL, NULL, '2022-03-07 02:24:55'),
	(16, 'keyanlunwen_types', '科研论文类型', 4, '科研论文类型4', NULL, NULL, '2022-03-07 02:24:56'),
	(17, 'keyanhuojiang_yesno_types', '审核状态', 1, '待审核', NULL, NULL, '2022-03-07 02:24:56'),
	(18, 'keyanhuojiang_yesno_types', '审核状态', 2, '同意', NULL, NULL, '2022-03-07 02:24:56'),
	(19, 'keyanhuojiang_yesno_types', '审核状态', 3, '拒绝', NULL, NULL, '2022-03-07 02:24:56'),
	(20, 'keyanhuojiang_types', '科研获奖类型', 1, '科研获奖类型1', NULL, NULL, '2022-03-07 02:24:56'),
	(21, 'keyanhuojiang_types', '科研获奖类型', 2, '科研获奖类型2', NULL, NULL, '2022-03-07 02:24:56'),
	(22, 'keyanhuojiang_types', '科研获奖类型', 3, '科研获奖类型3', NULL, NULL, '2022-03-07 02:24:56'),
	(23, 'keyanhuojiang_types', '科研获奖类型', 4, '科研获奖类型4', NULL, NULL, '2022-03-07 02:24:56'),
	(24, 'xiangmu_types', '科研项目类型', 5, '科研项目类型5', NULL, '10', '2022-03-07 03:04:43');

DROP TABLE IF EXISTS `gongzuoliang`;
CREATE TABLE IF NOT EXISTS `gongzuoliang` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `xiangmu_id` int DEFAULT NULL COMMENT '项目',
  `gongzuoliang_content` text COMMENT '工作量详情',
  `tijiaozongshu` int DEFAULT NULL COMMENT '提交总数',
  `zonggongzuoliang` int DEFAULT NULL COMMENT '总工作量',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb3 COMMENT='工作量';

DELETE FROM `gongzuoliang`;
INSERT INTO `gongzuoliang` (`id`, `xiangmu_id`, `gongzuoliang_content`, `tijiaozongshu`, `zonggongzuoliang`, `insert_time`, `create_time`) VALUES
	(1, 1, '工作量详情1', 236, 149, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(2, 2, '工作量详情2', 144, 404, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(3, 3, '工作量详情3', 481, 281, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(4, 4, '工作量详情4', 14, 186, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(5, 5, '工作量详情5', 242, 196, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(6, 3, '工作量详情3', 481, 281, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(7, 4, '工作量详情4', 14, 186, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(8, 5, '工作量详情5', 242, 196, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(11, 3, '工作量详情3', 481, 281, '2022-02-07 02:27:54', '2022-02-07 02:27:54'),
	(12, 4, '工作量详情4', 14, 186, '2022-02-07 02:27:54', '2022-02-07 02:27:54'),
	(13, 5, '工作量详情5', 242, 196, '2022-02-07 02:27:54', '2022-02-07 02:27:54');

DROP TABLE IF EXISTS `jiaoshi`;
CREATE TABLE IF NOT EXISTS `jiaoshi` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `jiaoshi_uuid_number` varchar(200) DEFAULT NULL COMMENT '教师工号 Search111 ',
  `jiaoshi_name` varchar(200) DEFAULT NULL COMMENT '教师姓名 Search111 ',
  `jiaoshi_phone` varchar(200) DEFAULT NULL COMMENT '教师手机号',
  `jiaoshi_id_number` varchar(200) DEFAULT NULL COMMENT '教师身份证号',
  `jiaoshi_photo` varchar(200) DEFAULT NULL COMMENT '教师头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `jiaoshi_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='教师';

DELETE FROM `jiaoshi`;
INSERT INTO `jiaoshi` (`id`, `username`, `password`, `jiaoshi_uuid_number`, `jiaoshi_name`, `jiaoshi_phone`, `jiaoshi_id_number`, `jiaoshi_photo`, `sex_types`, `jiaoshi_email`, `create_time`) VALUES
	(1, '教师1', '123456', '164662007441311', '教师姓名1', '17703786901', '410224199610232001', 'http://localhost:8080/keyangongzuoliang/upload/jiaoshi1.jpg', 1, '1@qq.com', '2022-03-07 02:27:54'),
	(2, '教师2', '123456', '164662007441314', '教师姓名2', '17703786902', '410224199610232002', 'http://localhost:8080/keyangongzuoliang/upload/jiaoshi2.jpg', 1, '2@qq.com', '2022-03-07 02:27:54'),
	(3, '教师3', '123456', '16466200744139', '教师姓名3', '17703786903', '410224199610232003', 'http://localhost:8080/keyangongzuoliang/upload/jiaoshi3.jpg', 1, '3@qq.com', '2022-03-07 02:27:54');

DROP TABLE IF EXISTS `keyanhuojiang`;
CREATE TABLE IF NOT EXISTS `keyanhuojiang` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `jiaoshi_id` int DEFAULT NULL COMMENT '教师',
  `keyanhuojiang_name` varchar(200) DEFAULT NULL COMMENT '科研获奖名称  Search111 ',
  `keyanhuojiang_types` int DEFAULT NULL COMMENT '科研获奖类型 Search111',
  `keyanhuojiang_file` varchar(200) DEFAULT NULL COMMENT '相关文件',
  `keyanhuojiang_content` text COMMENT '科研获奖详情',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `keyanhuojiang_yesno_types` int DEFAULT NULL COMMENT '审核状态 Search111',
  `keyanhuojiang_yesno_text` text COMMENT '审核意见',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb3 COMMENT='科研获奖';

DELETE FROM `keyanhuojiang`;
INSERT INTO `keyanhuojiang` (`id`, `jiaoshi_id`, `keyanhuojiang_name`, `keyanhuojiang_types`, `keyanhuojiang_file`, `keyanhuojiang_content`, `insert_time`, `keyanhuojiang_yesno_types`, `keyanhuojiang_yesno_text`, `update_time`, `create_time`) VALUES
	(1, 3, '科研获奖名称1', 2, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情1', '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(2, 3, '科研获奖名称2', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情2', '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(3, 1, '科研获奖名称3', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情3', '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(4, 2, '科研获奖名称4', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情4', '2022-03-07 02:27:54', 1, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(5, 3, '科研获奖名称5', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情5', '2022-03-07 02:27:54', 1, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(8, 3, '科研获奖名称2', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情2', '2022-02-07 02:27:54', 2, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54'),
	(9, 1, '科研获奖名称3', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情3', '2022-02-07 02:27:54', 2, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54'),
	(10, 2, '科研获奖名称4', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研获奖详情4', '2022-02-07 02:27:54', 1, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54');

DROP TABLE IF EXISTS `keyanlunwen`;
CREATE TABLE IF NOT EXISTS `keyanlunwen` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `jiaoshi_id` int DEFAULT NULL COMMENT '教师',
  `keyanlunwen_name` varchar(200) DEFAULT NULL COMMENT '科研论文名称  Search111 ',
  `keyanlunwen_types` int DEFAULT NULL COMMENT '科研论文类型 Search111',
  `keyanlunwen_file` varchar(200) DEFAULT NULL COMMENT '相关文件',
  `keyanlunwen_content` text COMMENT '科研论文详情 ',
  `keyanlunwen_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '添加时间',
  `keyanlunwen_yesno_types` int DEFAULT NULL COMMENT '审核状态 Search111',
  `keyanlunwen_yesno_text` text COMMENT '审核意见',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='科研论文';

DELETE FROM `keyanlunwen`;
INSERT INTO `keyanlunwen` (`id`, `jiaoshi_id`, `keyanlunwen_name`, `keyanlunwen_types`, `keyanlunwen_file`, `keyanlunwen_content`, `keyanlunwen_delete`, `insert_time`, `keyanlunwen_yesno_types`, `keyanlunwen_yesno_text`, `update_time`, `create_time`) VALUES
	(1, 2, '科研论文名称1', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情1', 1, '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(2, 1, '科研论文名称2', 4, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情2', 1, '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(3, 2, '科研论文名称3', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情3', 1, '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(4, 2, '科研论文名称4', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情4', 1, '2022-03-07 02:27:54', 1, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(5, 3, '科研论文名称5', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情5', 1, '2022-03-07 02:27:54', 1, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
	(7, 2, '科研论文名称1', 3, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情1', 1, '2022-02-07 02:27:54', 2, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54'),
	(8, 2, '科研论文名称2', 4, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研论文详情2', 1, '2022-02-07 02:27:54', 2, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54');

DROP TABLE IF EXISTS `mishu`;
CREATE TABLE IF NOT EXISTS `mishu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(200) DEFAULT NULL COMMENT '账户',
  `password` varchar(200) DEFAULT NULL COMMENT '密码',
  `mishu_uuid_number` varchar(200) DEFAULT NULL COMMENT '秘书工号 Search111 ',
  `mishu_name` varchar(200) DEFAULT NULL COMMENT '秘书姓名 Search111 ',
  `mishu_phone` varchar(200) DEFAULT NULL COMMENT '秘书手机号',
  `mishu_photo` varchar(200) DEFAULT NULL COMMENT '秘书头像',
  `sex_types` int DEFAULT NULL COMMENT '性别',
  `mishu_email` varchar(200) DEFAULT NULL COMMENT '电子邮箱',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COMMENT='秘书';

DELETE FROM `mishu`;
INSERT INTO `mishu` (`id`, `username`, `password`, `mishu_uuid_number`, `mishu_name`, `mishu_phone`, `mishu_photo`, `sex_types`, `mishu_email`, `create_time`) VALUES
	(1, '秘书1', '123456', '16466200744084', '秘书姓名1', '17703786901', 'http://localhost:8080/keyangongzuoliang/upload/mishu1.jpg', 2, '1@qq.com', '2022-03-07 02:27:54'),
	(2, '秘书2', '123456', '16466200744089', '秘书姓名2', '17703786902', 'http://localhost:8080/keyangongzuoliang/upload/mishu2.jpg', 2, '2@qq.com', '2022-03-07 02:27:54'),
	(3, '秘书3', '123456', '164662007440813', '秘书姓名3', '17703786903', 'http://localhost:8080/keyangongzuoliang/upload/mishu3.jpg', 1, '3@qq.com', '2022-03-07 02:27:54');

DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `userid` bigint NOT NULL COMMENT '用户id',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `tablename` varchar(100) DEFAULT NULL COMMENT '表名',
  `role` varchar(100) DEFAULT NULL COMMENT '角色',
  `token` varchar(200) NOT NULL COMMENT '密码',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  `expiratedtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='token表';

DELETE FROM `token`;
INSERT INTO `token` (`id`, `userid`, `username`, `tablename`, `role`, `token`, `addtime`, `expiratedtime`) VALUES
	(1, 6, 'admin', 'users', '管理员', 'ni8lbjwczyrv8rl46m0sqfvn8x9t7o7s', '2022-03-07 02:31:22', '2024-04-29 13:46:18'),
	(2, 1, '秘书1', 'mishu', '秘书', 'kildys4kgmxxmki4qfopagsll3af91ue', '2024-04-29 11:33:02', '2024-04-29 13:47:15'),
	(3, 1, '教师1', 'jiaoshi', '教师', 'eb3e94cgkteictirz3zntcls4psn011r', '2024-04-29 11:33:21', '2024-04-29 13:47:27');

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `username` varchar(100) NOT NULL COMMENT '用户名',
  `password` varchar(100) NOT NULL COMMENT '密码',
  `role` varchar(100) DEFAULT '管理员' COMMENT '角色',
  `addtime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '新增时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC COMMENT='管理员';

DELETE FROM `users`;
INSERT INTO `users` (`id`, `username`, `password`, `role`, `addtime`) VALUES
	(6, 'admin', '123456', '管理员', '2022-05-02 06:51:13');

DROP TABLE IF EXISTS `xiangmu`;
CREATE TABLE IF NOT EXISTS `xiangmu` (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键 ',
  `jiaoshi_id` int DEFAULT NULL COMMENT '教师',
  `xiangmu_name` varchar(200) DEFAULT NULL COMMENT '科研项目名称  Search111 ',
  `xiangmu_types` int DEFAULT NULL COMMENT '科研项目类型 Search111',
  `xiangmu_file` varchar(200) DEFAULT NULL COMMENT '相关文件',
  `xiangmu_content` text COMMENT '科研项目介绍 ',
  `xiangmu_delete` int DEFAULT NULL COMMENT '逻辑删除',
  `insert_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  `xiangmu_yesno_types` int DEFAULT NULL COMMENT '审核状态 Search111',
  `xiangmu_yesno_text` text COMMENT '审核意见',
  `update_time` timestamp NULL DEFAULT NULL COMMENT '审核时间',
  `create_time` timestamp NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb3 COMMENT='科研项目';

DELETE FROM `xiangmu`;
INSERT INTO `xiangmu` (`id`, `jiaoshi_id`, `xiangmu_name`, `xiangmu_types`, `xiangmu_file`, `xiangmu_content`, `xiangmu_delete`, `insert_time`, `xiangmu_yesno_types`, `xiangmu_yesno_text`, `update_time`, `create_time`) VALUES
	(1, 1, '科研项目名称1', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍1', 1, '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(2, 2, '科研项目名称2', 4, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍2', 1, '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(3, 2, '科研项目名称3', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍3', 1, '2022-03-07 02:27:54', 2, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(4, 1, '科研项目名称4', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍4', 1, '2022-03-07 02:27:54', 1, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(5, 1, '科研项目名称5', 4, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍5', 1, '2022-03-07 02:27:54', 1, NULL, '2022-03-07 02:27:54', '2022-03-07 02:27:54'),
	(7, 1, '科研项目名称1', 1, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍1', 1, '2022-02-07 02:27:54', 2, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54'),
	(8, 2, '科研项目名称2', 4, 'http://localhost:8080/keyangongzuoliang/upload/file.rar', '科研项目介绍2', 1, '2022-02-07 02:27:54', 2, '', '2022-02-07 02:27:54', '2022-02-07 02:27:54');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
