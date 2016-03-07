/*
SQLyog Ultimate v11.27 (32 bit)
MySQL - 5.5.24-CDB-2.0.0-log : Database - e-bank
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`e-bank` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `e-bank`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员id',
  `admin_name` varchar(10) NOT NULL COMMENT '管理员姓名',
  `admin_phone` varchar(10) DEFAULT NULL COMMENT '管理员账号',
  `admin_password` varchar(10) DEFAULT NULL COMMENT '管理员密码',
  `admin_last_login` datetime DEFAULT NULL COMMENT '上次登录时间',
  `admin_power` int(11) DEFAULT NULL COMMENT '管理员权限',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `admin_type` */

DROP TABLE IF EXISTS `admin_type`;

CREATE TABLE `admin_type` (
  `admin_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '管理员权限类型主键',
  `admin_type` char(10) DEFAULT NULL COMMENT '类型',
  PRIMARY KEY (`admin_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

/*Table structure for table `bank_card` */

DROP TABLE IF EXISTS `bank_card`;

CREATE TABLE `bank_card` (
  `card_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '卡种id',
  `card_name` varchar(20) DEFAULT NULL COMMENT '卡片名称',
  `card_location` varchar(20) DEFAULT NULL COMMENT '发行地区',
  `card_currency` varchar(20) DEFAULT NULL COMMENT '币种',
  `card_face` varchar(200) DEFAULT NULL COMMENT '卡面',
  `card_info` varchar(200) DEFAULT NULL COMMENT '卡片描述',
  PRIMARY KEY (`card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `bank_msgbox` */

DROP TABLE IF EXISTS `bank_msgbox`;

CREATE TABLE `bank_msgbox` (
  `msg_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `msg_title` varchar(50) DEFAULT NULL COMMENT '消息标题',
  `msg_content` text COMMENT '消息内容',
  `msg_type` int(11) DEFAULT NULL COMMENT '消息类型',
  `msg_user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `msg_state` tinyint(1) DEFAULT NULL COMMENT '消息状态',
  `msg_time` timestamp NULL DEFAULT NULL COMMENT '消息时间',
  PRIMARY KEY (`msg_id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;

/*Table structure for table `card_check` */

DROP TABLE IF EXISTS `card_check`;

CREATE TABLE `card_check` (
  `card_check_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `card_check_user` int(10) DEFAULT NULL COMMENT '申请的用户id',
  `card_check_cardtype` int(10) DEFAULT NULL COMMENT '申请的卡片id',
  `card_check_opencard_id` int(11) DEFAULT NULL COMMENT '生成的卡片id',
  `card_check_time` timestamp NULL DEFAULT NULL COMMENT '申请时间',
  PRIMARY KEY (`card_check_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Table structure for table `entry_comment` */

DROP TABLE IF EXISTS `entry_comment`;

CREATE TABLE `entry_comment` (
  `comment_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '一级评论id',
  `comment_content` text COMMENT '评论内容',
  `comment_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间',
  `comment_user_id` int(10) DEFAULT NULL COMMENT '发布者id',
  `comment_praise` int(10) DEFAULT NULL COMMENT '点赞数量',
  `comment_parent_id` int(10) DEFAULT NULL COMMENT '父评论id',
  `comment_entry_id` int(10) DEFAULT NULL COMMENT '所属文章id',
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8;

/*Table structure for table `entry_label` */

DROP TABLE IF EXISTS `entry_label`;

CREATE TABLE `entry_label` (
  `label_name` varchar(20) NOT NULL COMMENT '标签名',
  PRIMARY KEY (`label_name`),
  UNIQUE KEY `label_name` (`label_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `entry_relation_label` */

DROP TABLE IF EXISTS `entry_relation_label`;

CREATE TABLE `entry_relation_label` (
  `entry_relation_label_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `entry_id` int(20) DEFAULT NULL COMMENT '文章id',
  `label_name` varchar(255) DEFAULT NULL COMMENT '标签名',
  PRIMARY KEY (`entry_relation_label_id`),
  KEY `entry_delete_relation_delete` (`entry_id`),
  CONSTRAINT `entry_delete_relation_delete` FOREIGN KEY (`entry_id`) REFERENCES `index_entry` (`index_id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8;

/*Table structure for table `index_entry` */

DROP TABLE IF EXISTS `index_entry`;

CREATE TABLE `index_entry` (
  `index_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键',
  `index_pid` int(11) NOT NULL COMMENT '分类',
  `index_title` varchar(255) DEFAULT NULL COMMENT '标题',
  `index_content` mediumtext COMMENT '正文',
  `index_uptime` datetime DEFAULT NULL COMMENT '上传日期',
  `index_aid` int(11) NOT NULL COMMENT '上传者id',
  `index_state` varchar(10) DEFAULT NULL COMMENT '文章状态',
  `index_isindex` tinyint(1) DEFAULT NULL COMMENT '是否推送到首页',
  `index_hitsnum` int(20) DEFAULT NULL COMMENT '点击量',
  `index_label` varchar(255) DEFAULT NULL COMMENT '文章标签',
  `index_from` varchar(255) DEFAULT NULL COMMENT '文章来源',
  `index_href` varchar(255) DEFAULT NULL COMMENT '文章来源链接',
  `index_preview_image_url` varchar(200) DEFAULT NULL COMMENT '文章预览图',
  PRIMARY KEY (`index_id`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Table structure for table `index_type` */

DROP TABLE IF EXISTS `index_type`;

CREATE TABLE `index_type` (
  `index_type_id` int(11) NOT NULL AUTO_INCREMENT,
  `index_type` varchar(10) NOT NULL COMMENT '类型',
  PRIMARY KEY (`index_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Table structure for table `trade_type` */

DROP TABLE IF EXISTS `trade_type`;

CREATE TABLE `trade_type` (
  `id` int(11) NOT NULL,
  `trade_type` varchar(20) DEFAULT NULL,
  `trade_type_img` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_card` */

DROP TABLE IF EXISTS `user_card`;

CREATE TABLE `user_card` (
  `user_card_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户卡id',
  `user_card_num` varchar(50) DEFAULT NULL COMMENT '卡号',
  `user_card_balance` double(50,0) DEFAULT NULL COMMENT '余额',
  `user_card_state` int(11) DEFAULT NULL COMMENT '银行卡状态',
  `user_card_user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `user_card_type` int(11) DEFAULT NULL COMMENT '银行卡种类',
  `user_card_opentime` timestamp NULL DEFAULT NULL COMMENT '开卡时间',
  PRIMARY KEY (`user_card_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

/*Table structure for table `user_card_state` */

DROP TABLE IF EXISTS `user_card_state`;

CREATE TABLE `user_card_state` (
  `state_id` int(11) NOT NULL COMMENT '状态id',
  `state_name` varchar(10) DEFAULT NULL COMMENT '状态名称',
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Table structure for table `user_trade` */

DROP TABLE IF EXISTS `user_trade`;

CREATE TABLE `user_trade` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `trade_number` varchar(200) DEFAULT NULL COMMENT '交易单号',
  `trade_type_id` int(11) DEFAULT NULL COMMENT '交易类型',
  `trade_user_id` int(11) DEFAULT NULL COMMENT '本方id',
  `trade_other_user_id` int(11) DEFAULT NULL COMMENT '对方id',
  `trade_user_card` varchar(200) DEFAULT NULL COMMENT '本方卡号',
  `trade_other_card` varchar(200) DEFAULT NULL COMMENT '对方卡号',
  `trade_expend_money` double DEFAULT NULL COMMENT '支出金额',
  `trade_income_money` double DEFAULT NULL COMMENT '收入金额',
  `trade_state` int(11) DEFAULT NULL COMMENT '交易状态',
  `trade_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '交易时间',
  `trade_info` varchar(200) DEFAULT NULL COMMENT '交易备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

/*Table structure for table `user_userinfo` */

DROP TABLE IF EXISTS `user_userinfo`;

CREATE TABLE `user_userinfo` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户主键',
  `user_name` varchar(10) DEFAULT NULL COMMENT '用户姓名',
  `user_pass` varchar(20) DEFAULT NULL COMMENT '用户密码',
  `user_paypass` int(6) DEFAULT NULL COMMENT '用户支付密码',
  `user_city` varchar(10) DEFAULT NULL COMMENT '用户所在地',
  `user_obligate_info` varchar(20) DEFAULT NULL COMMENT '用户预留信息',
  `user_face` varchar(200) DEFAULT NULL COMMENT '用户头像(路径)',
  `user_idcard` varchar(18) DEFAULT NULL COMMENT '用户身份证',
  `user_phone` varchar(20) DEFAULT NULL COMMENT '用户手机号',
  `user_email` varchar(20) DEFAULT NULL COMMENT '用户邮箱',
  `user_state` int(1) DEFAULT NULL COMMENT '用户状态',
  `user_last_login_time` datetime DEFAULT NULL COMMENT '用户最后一次登录时间',
  `user_regist_time` datetime DEFAULT NULL COMMENT '用户注册时间',
  `user_account_money` double DEFAULT NULL COMMENT '账户余额',
  `user_account_balance` double DEFAULT NULL COMMENT '余额宝',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_idcard` (`user_idcard`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

/* Function  structure for function  `func_get_split_string` */

/*!50003 DROP FUNCTION IF EXISTS `func_get_split_string` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `func_get_split_string`(
f_string varchar(1000),f_delimiter varchar(5),f_order int) RETURNS varchar(255) CHARSET utf8
BEGIN
  declare result varchar(255) default '';
  set result = reverse(substring_index(reverse(substring_index(f_string,f_delimiter,f_order)),f_delimiter,1));
  return result;
END */$$
DELIMITER ;

/* Function  structure for function  `func_get_split_string_total` */

/*!50003 DROP FUNCTION IF EXISTS `func_get_split_string_total` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `func_get_split_string_total`(
f_string varchar(1000),f_delimiter varchar(5)
) RETURNS int(11)
BEGIN
  return 1+(length(f_string) - length(replace(f_string,f_delimiter,'')));
END */$$
DELIMITER ;

/* Procedure structure for procedure `AddEnrtyToAddLabel` */

/*!50003 DROP PROCEDURE IF EXISTS  `AddEnrtyToAddLabel` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `AddEnrtyToAddLabel`(in index_id int,in index_label varchar(255))
BEGIN
    DECLARE i,_err INT DEFAULT 1;
    DECLARE l_len INT UNSIGNED DEFAULT 0;
    DECLARE l_str varchar(255);
    declare continue handler for sqlexception, sqlwarning, not found set _err=1;
    set l_len = func_get_split_string_total(index_label,",");
	while i<=l_len do
	set l_str = func_get_split_string(index_label,",",i);
	insert into entry_label values(TRIM(l_str));
	
	insert into entry_relation_label values(null,index_id,l_str);
	set i = i+1;
	end while;
	commit;
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
