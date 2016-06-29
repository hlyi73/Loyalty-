/*
SQLyog Job Agent Version 8.14 Copyright(c) Webyog Softworks Pvt. Ltd. All Rights Reserved.


MySQL - 5.5.17 : Database - jol_areca
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jol_areca` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jol_areca`;

/*Table structure for table `b_task_attr` */

DROP TABLE IF EXISTS `b_task_attr`;

CREATE TABLE `b_task_attr` (
  `ID` varchar(40) NOT NULL COMMENT 'id',
  `CREATE_TID` bigint(20) unsigned NOT NULL COMMENT '产生任务id',
  `CONSUME_TID` bigint(20) unsigned DEFAULT NULL COMMENT '消费任务id',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '属性状态 {CR:产生,SE:消费中,ED:结束,DP:丢弃}',
  `ACTIVITY` tinyint(4) NOT NULL DEFAULT '1' COMMENT '属性有效标志',
  `GROUP_KEY` varchar(40) DEFAULT NULL COMMENT '分组关键字',
  `P1` varchar(40) DEFAULT NULL COMMENT '属性1的值',
  `P2` varchar(40) DEFAULT NULL COMMENT '属性2的值',
  `P3` varchar(40) DEFAULT NULL COMMENT '属性3的值',
  `P4` varchar(40) DEFAULT NULL COMMENT '属性4的值',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `IDX_B_TASK_ATTR_1` (`CREATE_TID`),
  KEY `IDX_B_TASK_ATTR_2` (`CONSUME_TID`),
  KEY `IDX_B_TASK_ATTR_3` (`GROUP_KEY`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务中间流程属性';

/*Data for the table `b_task_attr` */

/*Table structure for table `b_task_log` */

DROP TABLE IF EXISTS `b_task_log`;

CREATE TABLE `b_task_log` (
  `TID` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT '任务id',
  `NAME` varchar(32) NOT NULL COMMENT '任务名称',
  `TYPE` varchar(6) NOT NULL COMMENT '任务类型 {SYNC:同步,ASYNC:异步,MAIN:主任务}',
  `START_TIME` datetime DEFAULT NULL COMMENT '开始时间',
  `END_TIME` datetime DEFAULT NULL COMMENT '结束时间',
  `STATUS` varchar(2) DEFAULT NULL COMMENT '任务状态 {DE:定义,ST:开始,PR:处理中,OK:正常结束,NG:异常结束,BK:中断}',
  `HOST` varchar(100) DEFAULT NULL COMMENT '任务执行主机地址',
  `PROCESSOR` varchar(20) DEFAULT NULL COMMENT '任务执行线程ID',
  `ACTIVITY` tinyint(4) NOT NULL DEFAULT '1' COMMENT '任务有效标志',
  `P1` varchar(40) DEFAULT NULL COMMENT '任务执行参数1',
  `P2` varchar(40) DEFAULT NULL COMMENT '任务执行参数2',
  `P3` varchar(40) DEFAULT NULL COMMENT '任务执行参数3',
  `P4` varchar(40) DEFAULT NULL COMMENT '任务执行参数4',
  `P5` varchar(40) DEFAULT NULL COMMENT '任务执行参数5',
  `P6` varchar(40) DEFAULT NULL COMMENT '任务执行参数6',
  PRIMARY KEY (`TID`),
  UNIQUE KEY `TID` (`TID`),
  KEY `IDX_B_TASK_LOG_1` (`NAME`),
  KEY `IDX_B_TASK_LOG_2` (`TYPE`)
) ENGINE=MyISAM AUTO_INCREMENT=197 DEFAULT CHARSET=utf8 COMMENT='任务日志信息';

/*Data for the table `b_task_log` */

insert  into `b_task_log` values (188,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2001-01-01 00:00:00','2014-08-11 00:00:00','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(189,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2001-01-01 00:00:00','2014-08-11 00:00:00','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(190,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2001-01-01 00:00:00','2014-08-15 14:18:10','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(191,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2001-01-01 00:00:00','2014-08-15 14:18:10','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(192,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2001-01-01 00:00:00','2014-08-15 14:18:10','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(193,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2001-01-01 00:00:00','2014-08-15 14:18:10','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(194,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2014-08-15 14:18:10','2014-08-22 15:40:03','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(195,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2014-08-22 15:40:03','2014-08-23 23:40:04','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL),(196,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,1,'2014-08-23 23:40:04','2014-08-26 09:40:03','7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL);

/*Table structure for table `b_task_message` */

DROP TABLE IF EXISTS `b_task_message`;

CREATE TABLE `b_task_message` (
  `ID` varchar(40) NOT NULL COMMENT 'id',
  `TID` bigint(20) unsigned NOT NULL COMMENT '任务id',
  `LEVEL` varchar(5) NOT NULL COMMENT '信息级别 同LOG4J{DEBUG,INFO,ERROR,WARN}',
  `CLAZZ` varchar(160) NOT NULL COMMENT '记录信息类名',
  `HANDLE` varchar(40) NOT NULL COMMENT '记录信息方法名',
  `MSG` varchar(200) NOT NULL COMMENT '记录消息',
  `DETAIL` blob COMMENT '详细信息',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID` (`ID`),
  KEY `IDX_B_TASK_MESSAGE_1` (`TID`),
  KEY `IDX_B_TASK_MESSAGE_2` (`LEVEL`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='任务执行中消息记录';

/*Data for the table `b_task_message` */

/*Table structure for table `fact_groupcustomer` */

DROP TABLE IF EXISTS `fact_groupcustomer`;

CREATE TABLE `fact_groupcustomer` (
  `group_id` varchar(40) DEFAULT NULL,
  `group_type` varchar(40) DEFAULT NULL,
  `customer_id` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `fact_groupcustomer` */

/*Table structure for table `m_a_campaign_calendar` */

DROP TABLE IF EXISTS `m_a_campaign_calendar`;

CREATE TABLE `m_a_campaign_calendar` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `PROGRAM_NAME` varchar(128) DEFAULT NULL,
  `PROGRAM_COST` float DEFAULT NULL,
  `PROGRAM_START_DATE` datetime DEFAULT NULL,
  `PROGRAM_END_DATE` datetime DEFAULT NULL,
  `TOTAL_ORDER_RATE` float DEFAULT NULL,
  `TOTAL_RESP_RATE` float DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_NAME` varchar(128) DEFAULT NULL,
  `CAMPAIGN_code` varchar(36) DEFAULT NULL,
  `PLAN_RESP_RATE` float DEFAULT NULL,
  `CAMP_RESP_QUALIFIED` float DEFAULT NULL,
  `CAMP_RESP_EXCELLENT` float DEFAULT NULL,
  `PLAN_ORDER_RATE` float DEFAULT NULL,
  `CAMP_ORDER_QUALIFIED` float DEFAULT NULL,
  `CAMP_ORDER_EXCELLENT` float DEFAULT NULL,
  `PLAN_NUM` int(11) DEFAULT NULL,
  `PLAN_COST` float DEFAULT NULL,
  `PLAN_MAORI` float DEFAULT NULL,
  `CAMPAIGN_COST` float DEFAULT NULL,
  `CAMPAGIN_START_DATE` datetime DEFAULT NULL,
  `CAMPAIGN_END_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) NOT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_a_campaign_calendar` */

/*Table structure for table `m_a_campaign_channel` */

DROP TABLE IF EXISTS `m_a_campaign_channel`;

CREATE TABLE `m_a_campaign_channel` (
  `ID` varchar(40) NOT NULL,
  `M_CAMPAIGN_CALENDAR_ID` varchar(40) NOT NULL,
  `TYPE_FLG` int(11) DEFAULT NULL,
  `CHANNEL_TYPE` varchar(64) DEFAULT NULL,
  `SEND_DATE` datetime DEFAULT NULL,
  `TARGET_NUM` int(11) DEFAULT NULL,
  `SEND_NUM` int(11) DEFAULT NULL,
  `RUN_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_a_campaign_channel` */

/*Table structure for table `m_a_campaign_expense` */

DROP TABLE IF EXISTS `m_a_campaign_expense`;

CREATE TABLE `m_a_campaign_expense` (
  `ID` varchar(40) NOT NULL,
  `M_CAMPAIGN_CALENDAR_ID` varchar(40) NOT NULL,
  `EXPENSE_DETAIL` varchar(128) DEFAULT NULL,
  `EXPENSE_AMT` float DEFAULT NULL,
  `EXPENSE_TYPE` varchar(32) DEFAULT NULL,
  `EXPENSE_DATE` date DEFAULT NULL,
  `RUN_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_a_campaign_expense` */

/*Table structure for table `m_a_campaign_order` */

DROP TABLE IF EXISTS `m_a_campaign_order`;

CREATE TABLE `m_a_campaign_order` (
  `ID` varchar(36) NOT NULL,
  `M_CAMPAIGN_CALENDAR_ID` varchar(36) NOT NULL,
  `ORDER_DATE` datetime DEFAULT NULL,
  `ORDER_NUM` int(11) DEFAULT NULL,
  `ORDER_AMT` float DEFAULT NULL,
  `ORDER_MAORI` float DEFAULT NULL,
  `CUST_TYPE` int(11) DEFAULT NULL,
  `TARGET_NUM` int(11) DEFAULT NULL,
  `RUN_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_a_campaign_order` */

/*Table structure for table `m_a_campaign_response` */

DROP TABLE IF EXISTS `m_a_campaign_response`;

CREATE TABLE `m_a_campaign_response` (
  `ID` varchar(36) NOT NULL,
  `M_CAMPAIGN_CALENDAR_ID` varchar(36) NOT NULL,
  `TYPE_FLG` int(11) DEFAULT NULL,
  `CHANNEL_TYPE` varchar(64) DEFAULT NULL,
  `SEND_DATE` datetime DEFAULT NULL,
  `RESPONSE_NUM` int(11) DEFAULT NULL,
  `RESPONSE_TYPE` varchar(64) DEFAULT NULL,
  `RUN_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_a_campaign_response` */

/*Table structure for table `m_a_temp_customer` */

DROP TABLE IF EXISTS `m_a_temp_customer`;

CREATE TABLE `m_a_temp_customer` (
  `CUTM_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_a_temp_customer` */

/*Table structure for table `m_action` */

DROP TABLE IF EXISTS `m_action`;

CREATE TABLE `m_action` (
  `ID` varchar(40) NOT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `TARGET_ATTR_ID` varchar(40) DEFAULT NULL,
  `ACTION` varchar(40) DEFAULT NULL,
  `SOURCE_ATTR_ID` varchar(40) DEFAULT NULL,
  `OPERATE` varchar(40) DEFAULT NULL,
  `CRITERIA_VALUE` varchar(40) DEFAULT NULL,
  `POINT_TYPE_ID` varchar(40) DEFAULT NULL,
  `FROM_ATTR_ID` varchar(40) DEFAULT NULL,
  `TARGET_TIER_ID` varchar(40) DEFAULT NULL,
  `UPDATE_MEMBER_PERIOD` int(11) DEFAULT NULL,
  `SERIAL_NUM` int(11) DEFAULT NULL,
  `VALUE_ATTR_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_action` */

insert  into `m_action` values ('020c84e3-49df-4eff-8a74-fe23832da3dd','b7b8b5a6-6e00-40a7-8b93-1325ed3ea2d3','升级VIP会员','M_UPGRADE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'d0c3cab8-f65f-4784-b4a3-7c05c6bdc71b',0,1,NULL),('078081b4-098f-49c7-8d03-687ff74673bf','38577303-c2ae-4ea0-bc46-96a2d29679b3','升级认证会员','M_UPGRADE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9a4f076e-0b13-44ff-b2d7-727913c0d3d6',0,1,NULL),('1f3c07a3-1783-43b6-b78e-2ae5ea838f48','79e9c691-6620-4f71-8761-40a81d1f3173','推荐返利送分','M_ASSIGNPOINTS',NULL,NULL,NULL,'M_MULTIPLE','0.01','60c8ed70-754b-4d4d-b13a-f3d44a009d3a','7330c210-0ac4-4b07-80f1-5bd13098d61a',NULL,NULL,1,NULL),('4c0b8ca1-50c4-4cbe-b3e8-2dc707624ce1','7cf1447d-618b-41d0-b2ad-1f72f9cfa8cf','降级认证会员','M_DEGRADE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'9a4f076e-0b13-44ff-b2d7-727913c0d3d6',0,1,NULL),('67cf2a62-1757-4a6b-93f3-ff04c8464021','ca49d2d1-b2c6-4b17-9c2e-5c4df74e4984','扣除返利积分','M_REDEEMPOINTS',NULL,NULL,NULL,'','','60c8ed70-754b-4d4d-b13a-f3d44a009d3a','7330c210-0ac4-4b07-80f1-5bd13098d61a',NULL,NULL,1,NULL),('7b871daa-6516-4505-897c-4220f019b13e','f919b4cc-8b4e-49f9-a716-7c1740f4d390','优惠码返利积分','M_ASSIGNPOINTS',NULL,NULL,NULL,'M_MULTIPLE','0.01','60c8ed70-754b-4d4d-b13a-f3d44a009d3a','7330c210-0ac4-4b07-80f1-5bd13098d61a',NULL,NULL,1,NULL),('f709b550-f81c-4ae5-8467-2c9a5a0c3c4a','af533dc3-2154-4e5f-b83b-e5e66717274b','降级普通会员','M_DEGRADE',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'b77555b8-fcb8-41aa-9bf5-b7c273e94f25',0,1,NULL);

/*Table structure for table `m_answer` */

DROP TABLE IF EXISTS `m_answer`;

CREATE TABLE `m_answer` (
  `ID` varchar(40) NOT NULL,
  `MQ_ID` varchar(40) DEFAULT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  `Value` varchar(200) DEFAULT NULL,
  `QUESTION_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_answer` */

/*Table structure for table `m_attachment` */

DROP TABLE IF EXISTS `m_attachment`;

CREATE TABLE `m_attachment` (
  `ID` varchar(40) NOT NULL,
  `TREATMENT_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `SIZE` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `UPDATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_attachment` */

/*Table structure for table `m_attributes` */

DROP TABLE IF EXISTS `m_attributes`;

CREATE TABLE `m_attributes` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `TABLE_NAME` varchar(40) DEFAULT NULL,
  `FIELD_NAME` varchar(40) DEFAULT NULL,
  `DATA_TYPE` varchar(40) DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `TOTAL_TYPE` varchar(40) DEFAULT NULL,
  `PERIOD` int(11) DEFAULT NULL,
  `UOM` varchar(40) DEFAULT NULL,
  `ATTR_TYPE` varchar(40) DEFAULT NULL,
  `INIT_VALUE` varchar(40) DEFAULT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `POINT_TYPE_ID` varchar(40) DEFAULT NULL,
  `TIER_CLASS_ID` varchar(40) DEFAULT NULL,
  `PROCEDURE_NAME` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_attributes` */

insert  into `m_attributes` values ('11664e78-64e5-4b95-a47d-0397f222a6f4','是否员工','M_MEMBER','IS_EMPLOYEE','M_INTEGER',1,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,0,NULL,'M_MEMBER',NULL,NULL,NULL,NULL,NULL),('1d766707-9fd6-4375-9039-2006db120f18','会员等级','M_TIER','TIER_NAME','M_STRING',1,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,0,NULL,'M_MEMBERTIER',NULL,NULL,NULL,'1842b1ae-f301-49e7-a13e-96086fee03e0',NULL),('290828d7-f999-4fc6-b3f6-e81ea42d29fa','是否注册','M_MEMBER','IS_MOBILE_REGISTER','M_INTEGER',1,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,0,NULL,'M_MEMBER',NULL,NULL,NULL,NULL,NULL),('7330c210-0ac4-4b07-80f1-5bd13098d61a','订单金额','M_LOY_ORDER','ORDER_AMOUNT','M_FLOAT',1,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,0,NULL,'M_TRANSACTION',NULL,NULL,NULL,NULL,NULL),('abfe0e9b-4147-4e90-ad38-508a1cb7ce0b','是否关注','M_MEMBER','IS_ATTENTION','M_INTEGER',1,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,0,NULL,'M_MEMBER',NULL,NULL,NULL,NULL,NULL),('becab925-6470-4f16-8483-a4b48ec9fb67','交易订单类型','M_LOY_ORDER','STATUS','M_STRING',1,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,0,NULL,'M_TRANSACTION',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `m_call_history` */

DROP TABLE IF EXISTS `m_call_history`;

CREATE TABLE `m_call_history` (
  `ID` varchar(40) NOT NULL,
  `CALL_STATUS` varchar(40) DEFAULT NULL,
  `POS_ID` varchar(40) DEFAULT NULL,
  `TIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  `PRE_CALL_STATUS` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_call_history` */

/*Table structure for table `m_camp_budget` */

DROP TABLE IF EXISTS `m_camp_budget`;

CREATE TABLE `m_camp_budget` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `MONEY_TYPE` varchar(20) DEFAULT NULL,
  `QUANTITY` double DEFAULT NULL,
  `MONEY` double DEFAULT NULL,
  `DESCRIPTION` text,
  `CAMPAIGN` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_camp_budget` */

/*Table structure for table `m_camp_expense` */

DROP TABLE IF EXISTS `m_camp_expense`;

CREATE TABLE `m_camp_expense` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `MONEY_TYPE` varchar(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `MONEY` decimal(19,4) DEFAULT NULL,
  `DESCRIPTION` text,
  `CAMPAIGN` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  `PROGRAM` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_camp_expense` */

/*Table structure for table `m_camp_log` */

DROP TABLE IF EXISTS `m_camp_log`;

CREATE TABLE `m_camp_log` (
  `ID` varchar(36) NOT NULL,
  `CAMPAIGN_ID` varchar(36) DEFAULT NULL,
  `NODE_ID` varchar(36) DEFAULT NULL,
  `NODE_NAME` text,
  `EXEC_DATE` datetime DEFAULT NULL,
  `EXEC_NUM` int(11) DEFAULT NULL,
  `STATUS` varchar(36) DEFAULT NULL,
  `CREATOR` varchar(64) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(36) DEFAULT NULL,
  `DESCRIPTION` text,
  `TEMPTABLE` varchar(50) DEFAULT NULL,
  `TYPE` varchar(30) DEFAULT NULL,
  `SORT_NO` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`),
  KEY `SORT_NO` (`SORT_NO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_camp_log` */

/*Table structure for table `m_camp_offer` */

DROP TABLE IF EXISTS `m_camp_offer`;

CREATE TABLE `m_camp_offer` (
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `OFFER_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_camp_offer` */

/*Table structure for table `m_campaign` */

DROP TABLE IF EXISTS `m_campaign`;

CREATE TABLE `m_campaign` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `CODE` varchar(30) DEFAULT NULL,
  `CLASSIFICATION` varchar(40) DEFAULT NULL,
  `CAMPAIGN_TYPE` varchar(40) DEFAULT NULL,
  `CURRENCY` varchar(40) DEFAULT NULL,
  `START_DATE` date DEFAULT NULL,
  `END_DATE` date DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `GOAL` text,
  `PLAN_TARGETS` int(11) NOT NULL DEFAULT '0',
  `REAL_TARGETS` int(11) DEFAULT NULL,
  `PLAN_COST` decimal(19,4) DEFAULT '0.0000',
  `REAL_COST` decimal(19,4) DEFAULT '0.0000',
  `PLAN_REVENUE` int(11) DEFAULT '0',
  `REAL_REVENUE` int(11) DEFAULT '0',
  `PROGRAM` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  `OFFERID` longtext,
  `OFFER_NAME` text,
  `PRODUCTID` longtext,
  `GROUPID` varchar(40) DEFAULT NULL,
  `USERID` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `FORECAST_ORDER_RATE` float DEFAULT '0',
  `ORDER_RATE_QUALIFIED` float DEFAULT '0',
  `ORDER_RATE_EXCELLENT` float DEFAULT '0',
  `FORECAST_RESP_RATE` float DEFAULT '0',
  `RESP_RATE_QUALIFIED` float DEFAULT '0',
  `RESP_RATE_EXCELLENT` float DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_M_CAMPAIGN_1` (`START_DATE`),
  KEY `IX_M_CAMPAIGN_2` (`END_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_campaign` */

insert  into `m_campaign` values ('001','test',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,'0.0000','0.0000',0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,0,0,0,0,0);

/*Table structure for table `m_campaign_history` */

DROP TABLE IF EXISTS `m_campaign_history`;

CREATE TABLE `m_campaign_history` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `GROUP_ID` varchar(40) DEFAULT NULL,
  `RESPOSE_ID` varchar(40) DEFAULT NULL,
  `GROUP_TYPE` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_campaign_history` */

/*Table structure for table `m_campaign_job` */

DROP TABLE IF EXISTS `m_campaign_job`;

CREATE TABLE `m_campaign_job` (
  `ID` varchar(40) NOT NULL,
  `CAMPAIGN_ID` varchar(40) NOT NULL,
  `SCHEDULER_ID` varchar(40) NOT NULL,
  `FREQUENCY` varchar(32) NOT NULL,
  `DELIVERY_ID` varchar(40) NOT NULL,
  `DELIVERY_START_DATE` datetime DEFAULT NULL,
  `DELIVERY_END_DATE` datetime DEFAULT NULL,
  `TRIG_NAME` varchar(128) DEFAULT NULL,
  `TRIG_GROUP` varchar(128) DEFAULT NULL,
  `JOB_NAME` varchar(128) DEFAULT NULL,
  `JOB_GROUP` varchar(128) DEFAULT NULL,
  `JOB_START_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(32) DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_campaign_job` */

/*Table structure for table `m_camtemplate` */

DROP TABLE IF EXISTS `m_camtemplate`;

CREATE TABLE `m_camtemplate` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `FLOWXML` longtext,
  `CREATEBY` varchar(40) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `MODIFYBY` varchar(40) DEFAULT NULL,
  `MODIFYTIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_camtemplate` */

/*Table structure for table `m_category` */

DROP TABLE IF EXISTS `m_category`;

CREATE TABLE `m_category` (
  `ID` varchar(40) NOT NULL,
  `CATEGORY_NUM` varchar(60) DEFAULT NULL,
  `CATEGORY_NAME` varchar(50) DEFAULT NULL,
  `PARENT_CATEGORY` varchar(40) DEFAULT NULL,
  `CATEGORY_NAME_EN` varchar(50) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_category` */

/*Table structure for table `m_category_bk` */

DROP TABLE IF EXISTS `m_category_bk`;

CREATE TABLE `m_category_bk` (
  `ID` varchar(40) NOT NULL,
  `CATEGORY_NUM` varchar(60) DEFAULT NULL,
  `CATEGORY_NAME` varchar(50) DEFAULT NULL,
  `PARENT_CATEGORY` varchar(40) DEFAULT NULL,
  `CATEGORY_NAME_EN` varchar(50) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_category_bk` */

/*Table structure for table `m_commands` */

DROP TABLE IF EXISTS `m_commands`;

CREATE TABLE `m_commands` (
  `ID` varchar(40) NOT NULL,
  `STAGE_ID` varchar(40) NOT NULL,
  `DELIVERY_ID` varchar(40) DEFAULT NULL,
  `CHANNEL` varchar(15) DEFAULT NULL,
  `TEMPTNAME` varchar(50) DEFAULT NULL,
  `TEMPTSQL` longtext,
  `SEQ` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_commands` */

/*Table structure for table `m_contact` */

DROP TABLE IF EXISTS `m_contact`;

CREATE TABLE `m_contact` (
  `ID` varchar(40) NOT NULL,
  `CHINESE_NAME` varchar(20) DEFAULT NULL,
  `ENGLISH_NAME` varchar(30) DEFAULT NULL,
  `CARD_NO` varchar(30) DEFAULT NULL,
  `SEX` varchar(40) DEFAULT NULL,
  `CONTACT_TYPE` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime NOT NULL,
  `OPERATE_BY` varchar(40) DEFAULT NULL,
  `OPERATE_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_contact` */

/*Table structure for table `m_control` */

DROP TABLE IF EXISTS `m_control`;

CREATE TABLE `m_control` (
  `id` varchar(40) NOT NULL,
  `procedure_name` varchar(40) DEFAULT NULL,
  `interval` int(11) DEFAULT NULL,
  `source` varchar(40) DEFAULT NULL,
  `all_column_name` text,
  `manual_call` varchar(40) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `status` varchar(40) DEFAULT NULL,
  `repeat_unit` varchar(40) DEFAULT NULL,
  `schedule_name` varchar(40) DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  `end_time` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_control` */

/*Table structure for table `m_corp` */

DROP TABLE IF EXISTS `m_corp`;

CREATE TABLE `m_corp` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_corp` */

/*Table structure for table `m_corp_org` */

DROP TABLE IF EXISTS `m_corp_org`;

CREATE TABLE `m_corp_org` (
  `ID` varchar(40) NOT NULL,
  `CORP_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_corp_org` */

/*Table structure for table `m_criteria` */

DROP TABLE IF EXISTS `m_criteria`;

CREATE TABLE `m_criteria` (
  `ID` varchar(40) NOT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ATTR_ID` varchar(40) DEFAULT NULL,
  `COMPARE_COND` varchar(40) DEFAULT NULL,
  `COMPARE_ATTR_ID` varchar(40) DEFAULT NULL,
  `OPERATE` varchar(40) DEFAULT NULL,
  `CRITERIA_VALUE` varchar(40) DEFAULT NULL,
  `GROUP_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_criteria` */

insert  into `m_criteria` values ('06105681-4e58-0813-d558-31361758dfcc','38577303-c2ae-4ea0-bc46-96a2d29679b3','普通升级认证会员','1d766707-9fd6-4375-9039-2006db120f18','M_EQUALS','','','b4ae2a6d-8ecf-399d-152b-c92f331e317a','78039cfa-5110-6d29-765f-b39393c25067'),('3cfe5547-fd06-2bb4-810a-082f5c76a025','ca49d2d1-b2c6-4b17-9c2e-5c4df74e4984','扣除积分','becab925-6470-4f16-8483-a4b48ec9fb67','M_EQUALS','','','c58f7a7a-ef7f-a742-fdea-26a31d8716be','32996045-0fdf-1ea4-09ce-bd32f5514cd7'),('4361f550-218b-d078-9beb-6cf45fedd690','af533dc3-2154-4e5f-b83b-e5e66717274b','认证降级普通会员','1d766707-9fd6-4375-9039-2006db120f18','M_EQUALS','','','ec31b269-4f26-9da5-1b0a-7ec4a2acbba9','b08df6b3-ba88-379f-c70f-0cfbec797c49'),('8eb89cbf-60a2-c427-b22d-2c13dd6a3be4','7cf1447d-618b-41d0-b2ad-1f72f9cfa8cf','vip降级认证会员','1d766707-9fd6-4375-9039-2006db120f18','M_EQUALS','','','4f345813-af82-4be7-8b56-f07b1d31c256','334b5b7a-0910-1b80-d101-07cd4853cc22'),('a8b28822-5ce0-3f14-bea5-c501ed816f0c','af533dc3-2154-4e5f-b83b-e5e66717274b','认证降级普通会员','290828d7-f999-4fc6-b3f6-e81ea42d29fa','M_EQUALS','','','a6636cd5-17dc-63b6-5f7b-60f976848d54','b08df6b3-ba88-379f-c70f-0cfbec797c49'),('da79952c-112e-e259-1b67-4a4216c5f459','79e9c691-6620-4f71-8761-40a81d1f3173','推荐返利交易','becab925-6470-4f16-8483-a4b48ec9fb67','M_EQUALS','','','f8fe9141-befb-3cd4-537c-5cb286487e98','962d3e11-6cb5-96dc-888f-f6d82e3514fb'),('da7edf8b-02ca-4578-e386-4f22a27643da','b7b8b5a6-6e00-40a7-8b93-1325ed3ea2d3','认证会员升级为Vip会员','1d766707-9fd6-4375-9039-2006db120f18','M_EQUALS','','','2540f725-33af-7054-908f-8d1743df955f','44a61f53-2780-df04-73e5-2e25c158af12'),('ddfef65d-4368-99e9-616d-33addfadaeb9','7cf1447d-618b-41d0-b2ad-1f72f9cfa8cf','vip降级认证会员','11664e78-64e5-4b95-a47d-0397f222a6f4','M_EQUALS','','','df7805c1-ce7b-da48-2bf7-aed3f4c02f65','334b5b7a-0910-1b80-d101-07cd4853cc22'),('ee1bca40-867f-af28-0ba7-f13dd5f92eb3','b7b8b5a6-6e00-40a7-8b93-1325ed3ea2d3','认证会员升级为Vip会员','11664e78-64e5-4b95-a47d-0397f222a6f4','M_EQUALS','','','3ff29aaf-e766-a8e8-714e-a03a1fa4d893','44a61f53-2780-df04-73e5-2e25c158af12'),('f3ae80ac-6381-3bdd-9447-0af92b42a7e8','38577303-c2ae-4ea0-bc46-96a2d29679b3','普通升级认证会员','290828d7-f999-4fc6-b3f6-e81ea42d29fa','M_EQUALS','','','74df6caf-b42a-aecb-e607-3a5617789086','78039cfa-5110-6d29-765f-b39393c25067'),('fc5b7300-daf2-6e58-e5c3-cf67f24f3c31','f919b4cc-8b4e-49f9-a716-7c1740f4d390','优惠码返利交易','becab925-6470-4f16-8483-a4b48ec9fb67','M_EQUALS','','','355b73f3-4575-3f89-ea84-06b6d4c86a6a','72e96c97-d88c-743c-2792-4b7e7e5e943c');

/*Table structure for table `m_cus_cam` */

DROP TABLE IF EXISTS `m_cus_cam`;

CREATE TABLE `m_cus_cam` (
  `ID` varchar(40) DEFAULT NULL,
  `M_C_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_cus_cam` */

/*Table structure for table `m_cust_action` */

DROP TABLE IF EXISTS `m_cust_action`;

CREATE TABLE `m_cust_action` (
  `ID` varchar(40) NOT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `METHOD_NAME` varchar(40) DEFAULT NULL,
  `PROCEDURE_CONTENT` longtext,
  `SERIAL_NUM` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_cust_action` */

/*Table structure for table `m_cust_criteria` */

DROP TABLE IF EXISTS `m_cust_criteria`;

CREATE TABLE `m_cust_criteria` (
  `ID` varchar(40) NOT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `METHOD_NAME` varchar(40) DEFAULT NULL,
  `PROCEDURE_CONTENT` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_cust_criteria` */

/*Table structure for table `m_customer` */

DROP TABLE IF EXISTS `m_customer`;

CREATE TABLE `m_customer` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_NUM` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(40) DEFAULT NULL,
  `LAST_NAME` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `PINYIN` varchar(20) DEFAULT NULL,
  `GENDER` varchar(40) DEFAULT NULL,
  `COUNTRY` varchar(40) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `ID_TYPE` varchar(40) DEFAULT NULL,
  `ID_CARD` varchar(30) DEFAULT NULL,
  `REGISTER_COUNTER` varchar(40) DEFAULT NULL,
  `ADMIN_COUNTER` varchar(40) DEFAULT NULL,
  `REGISTER_TIME` datetime DEFAULT NULL,
  `SALESMAN_ID` varchar(40) DEFAULT NULL,
  `MODE` varchar(40) DEFAULT NULL,
  `IF_MEMBER` int(11) DEFAULT NULL,
  `INDUSTRY` varchar(40) DEFAULT NULL,
  `DUTY` varchar(40) DEFAULT NULL,
  `HOPPY` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(40) DEFAULT NULL,
  `INCOME` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `MOBILE_TEL` varchar(50) DEFAULT NULL,
  `MOBILETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_MOBILETEL` int(11) DEFAULT NULL,
  `HOME_TEL_REGION` varchar(20) DEFAULT NULL,
  `HOME_TEL` varchar(50) DEFAULT NULL,
  `HOME_TEL_EXT` varchar(20) DEFAULT NULL,
  `HOMETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_HOMETEL` int(11) DEFAULT NULL,
  `COMPANY_TEL_REGION` varchar(20) DEFAULT NULL,
  `COMPANY_TEL` varchar(20) DEFAULT NULL,
  `COMPANY_TEL_EXT` varchar(20) DEFAULT NULL,
  `COMPANYTEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_POST` int(11) DEFAULT NULL,
  `IF_COMPANYTEL` int(11) DEFAULT NULL,
  `SPARE_TEL` varchar(20) DEFAULT NULL,
  `SPARETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_SPARETEL` int(11) DEFAULT NULL,
  `EMAIL` text,
  `EMAIL_STATUS` varchar(40) DEFAULT NULL,
  `IF_EMAIL` int(11) DEFAULT NULL,
  `POSTADDR_STATUS` varchar(40) DEFAULT NULL,
  `POSTCODE_STATUS` varchar(40) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `SOURCE_OTHER` varchar(40) DEFAULT NULL,
  `MAIN_ADDRESS_ID` varchar(40) DEFAULT NULL,
  `DATA_ENTER_ID` varchar(40) DEFAULT NULL,
  `WARNING_INFO` varchar(200) DEFAULT NULL,
  `OCCUPATION` varchar(40) DEFAULT NULL,
  `INCOME_LIST` varchar(40) DEFAULT NULL,
  `SKIN_TYPE` varchar(40) DEFAULT NULL,
  `USED_BRAND` varchar(40) DEFAULT NULL,
  `KNOW_PRODUCT_MODE` varchar(40) DEFAULT NULL,
  `MOST_CARE_INFO` varchar(40) DEFAULT NULL,
  `SKIN_CARE_INFO` varchar(40) DEFAULT NULL,
  `ACTIVITY_NOTIFY` varchar(40) DEFAULT NULL,
  `CARE_PRODUCT` varchar(40) DEFAULT NULL,
  `SALE_TYPE` varchar(40) DEFAULT NULL,
  `REMARK` text,
  `Summary` int(11) DEFAULT NULL,
  `REGION` varchar(64) DEFAULT NULL,
  `PROVINCE` varchar(64) DEFAULT NULL,
  `CITY` varchar(64) DEFAULT NULL,
  `ADDRESS` text,
  `POSTALCODE` varchar(50) DEFAULT NULL,
  `FIRST_PUR_DATE` datetime DEFAULT NULL,
  `FIRST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_PRODUCT` varchar(100) DEFAULT NULL,
  `BUY_NUMBER` int(11) DEFAULT NULL,
  `LAST_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `MAX_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `AGE` int(11) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `BUYER_CREDIT` varchar(64) DEFAULT NULL,
  `NICK` varchar(50) DEFAULT NULL,
  `PROMOTED_TYPE` int(11) DEFAULT NULL,
  `CONSUMER_PROTECTION` varchar(32) DEFAULT NULL,
  `VIP_INFO` varchar(10) DEFAULT NULL,
  `SOURCEID` varchar(36) DEFAULT NULL,
  `CUS_LEVEL` varchar(40) DEFAULT NULL,
  `PER_CUSTOMER_TRANSACT` decimal(11,2) DEFAULT '0.00',
  `REFUND_TIMES` int(11) DEFAULT '0',
  `REFUND_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `COMPANY_NAME` varchar(100) DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `WXSHOP` varchar(40) DEFAULT NULL COMMENT '微信公众账号',
  `WECHAT` varchar(20) DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `GRANDFATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  `IS_ATTENTION` int(11) DEFAULT NULL,
  `IS_MOBILE_REGISTER` int(11) DEFAULT NULL,
  `IS_EMPLOYEES` int(11) DEFAULT NULL,
  `HEY_CONPONS` varchar(20) DEFAULT NULL,
  `EMP_RECOMMEND` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_CUSTOMER_1` (`BELONG_ORG`),
  KEY `IX_M_CUSTOMER_2` (`CUSTOMER_NUM`),
  KEY `IX_M_CUSTOMER_3` (`MAIN_ADDRESS_ID`) USING BTREE,
  KEY `IX_M_CUSTOMER_4` (`GRANDFATHER_GUID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer` */

insert  into `m_customer` values ('20140815141810465','6',NULL,NULL,'杨洪鹏',NULL,'1',NULL,'1989-04-20 00:00:00',NULL,NULL,NULL,NULL,'2014-08-12 08:27:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18563923532',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370212','370000','370200','松岭路169号崂山软件园B503','266000',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,'0',1,0,1,NULL,'0'),('20140815141810730','1',NULL,NULL,'绍瑞',NULL,NULL,NULL,'1987-03-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 11:52:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370202','370000','370200','漳州二路','266520',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,'0',1,0,1,NULL,'1'),('20140815141810739','4',NULL,NULL,'王斌',NULL,'1',NULL,'2014-01-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 21:33:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18954834868',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','110000','110100','丰台区88号','100000',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,'0',1,0,1,NULL,'0'),('20140826094003641','16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-20 16:58:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL,NULL,'0',1,0,0,NULL,'0');

/*Table structure for table `m_customer_address` */

DROP TABLE IF EXISTS `m_customer_address`;

CREATE TABLE `m_customer_address` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `REGION` varchar(40) DEFAULT NULL,
  `PROVINCE` varchar(40) DEFAULT NULL,
  `CITY` varchar(40) DEFAULT NULL,
  `ADDRESS` text,
  `POSTALCODE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer_address` */

/*Table structure for table `m_customer_bak` */

DROP TABLE IF EXISTS `m_customer_bak`;

CREATE TABLE `m_customer_bak` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_NUM` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(40) DEFAULT NULL,
  `LAST_NAME` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `PINYIN` varchar(20) DEFAULT NULL,
  `GENDER` varchar(40) DEFAULT NULL,
  `COUNTRY` varchar(40) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `ID_TYPE` varchar(40) DEFAULT NULL,
  `ID_CARD` varchar(30) DEFAULT NULL,
  `REGISTER_COUNTER` varchar(40) DEFAULT NULL,
  `ADMIN_COUNTER` varchar(40) DEFAULT NULL,
  `REGISTER_TIME` datetime DEFAULT NULL,
  `SALESMAN_ID` varchar(40) DEFAULT NULL,
  `MODE` varchar(40) DEFAULT NULL,
  `IF_MEMBER` int(11) DEFAULT NULL,
  `INDUSTRY` varchar(40) DEFAULT NULL,
  `DUTY` varchar(40) DEFAULT NULL,
  `HOPPY` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(40) DEFAULT NULL,
  `INCOME` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `MOBILE_TEL` varchar(50) DEFAULT NULL,
  `MOBILETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_MOBILETEL` int(11) DEFAULT NULL,
  `HOME_TEL_REGION` varchar(20) DEFAULT NULL,
  `HOME_TEL` varchar(50) DEFAULT NULL,
  `HOME_TEL_EXT` varchar(20) DEFAULT NULL,
  `HOMETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_HOMETEL` int(11) DEFAULT NULL,
  `COMPANY_TEL_REGION` varchar(20) DEFAULT NULL,
  `COMPANY_TEL` varchar(20) DEFAULT NULL,
  `COMPANY_TEL_EXT` varchar(20) DEFAULT NULL,
  `COMPANYTEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_POST` int(11) DEFAULT NULL,
  `IF_COMPANYTEL` int(11) DEFAULT NULL,
  `SPARE_TEL` varchar(20) DEFAULT NULL,
  `SPARETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_SPARETEL` int(11) DEFAULT NULL,
  `EMAIL` text,
  `EMAIL_STATUS` varchar(40) DEFAULT NULL,
  `IF_EMAIL` int(11) DEFAULT NULL,
  `POSTADDR_STATUS` varchar(40) DEFAULT NULL,
  `POSTCODE_STATUS` varchar(40) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `SOURCE_OTHER` varchar(40) DEFAULT NULL,
  `MAIN_ADDRESS_ID` varchar(40) DEFAULT NULL,
  `DATA_ENTER_ID` varchar(40) DEFAULT NULL,
  `WARNING_INFO` varchar(200) DEFAULT NULL,
  `OCCUPATION` varchar(40) DEFAULT NULL,
  `INCOME_LIST` varchar(40) DEFAULT NULL,
  `SKIN_TYPE` varchar(40) DEFAULT NULL,
  `USED_BRAND` varchar(40) DEFAULT NULL,
  `KNOW_PRODUCT_MODE` varchar(40) DEFAULT NULL,
  `MOST_CARE_INFO` varchar(40) DEFAULT NULL,
  `SKIN_CARE_INFO` varchar(40) DEFAULT NULL,
  `ACTIVITY_NOTIFY` varchar(40) DEFAULT NULL,
  `CARE_PRODUCT` varchar(40) DEFAULT NULL,
  `SALE_TYPE` varchar(40) DEFAULT NULL,
  `REMARK` text,
  `Summary` int(11) DEFAULT NULL,
  `REGION` varchar(64) DEFAULT NULL,
  `PROVINCE` varchar(64) DEFAULT NULL,
  `CITY` varchar(64) DEFAULT NULL,
  `ADDRESS` text,
  `POSTALCODE` varchar(50) DEFAULT NULL,
  `FIRST_PUR_DATE` datetime DEFAULT NULL,
  `FIRST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_PRODUCT` varchar(100) DEFAULT NULL,
  `BUY_NUMBER` int(11) DEFAULT NULL,
  `LAST_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `MAX_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `AGE` int(11) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `BUYER_CREDIT` varchar(64) DEFAULT NULL,
  `NICK` varchar(50) DEFAULT NULL,
  `PROMOTED_TYPE` int(11) DEFAULT NULL,
  `CONSUMER_PROTECTION` varchar(32) DEFAULT NULL,
  `VIP_INFO` varchar(10) DEFAULT NULL,
  `SOURCEID` varchar(36) DEFAULT NULL,
  `CUS_LEVEL` varchar(40) DEFAULT NULL,
  `PER_CUSTOMER_TRANSACT` decimal(11,2) DEFAULT '0.00',
  `REFUND_TIMES` int(11) DEFAULT '0',
  `REFUND_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `COMPANY_NAME` varchar(100) DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `WECHAT` varchar(20) DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `GRANDFATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_M_CUSTOMER_1` (`BELONG_ORG`),
  KEY `IX_M_CUSTOMER_2` (`CUSTOMER_NUM`),
  KEY `IX_M_CUSTOMER_3` (`MAIN_ADDRESS_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer_bak` */

/*Table structure for table `m_customer_group` */

DROP TABLE IF EXISTS `m_customer_group`;

CREATE TABLE `m_customer_group` (
  `ID` varchar(40) DEFAULT NULL,
  `M_G_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer_group` */

/*Table structure for table `m_customer_period` */

DROP TABLE IF EXISTS `m_customer_period`;

CREATE TABLE `m_customer_period` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `PERIOD_ID` varchar(40) DEFAULT NULL,
  `EXPECTED_PERIOD_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer_period` */

/*Table structure for table `m_customer_remark` */

DROP TABLE IF EXISTS `m_customer_remark`;

CREATE TABLE `m_customer_remark` (
  `ID` varchar(40) NOT NULL,
  `POS_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `REMARK` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer_remark` */

/*Table structure for table `m_data_enter` */

DROP TABLE IF EXISTS `m_data_enter`;

CREATE TABLE `m_data_enter` (
  `ID` varchar(40) NOT NULL,
  `NUM` varchar(40) DEFAULT NULL,
  `TOTAL_NUM` int(11) DEFAULT NULL,
  `COMPLETED_NUM` int(11) DEFAULT NULL,
  `JOB_DESC` varchar(200) DEFAULT NULL,
  `OWNER_ID` varchar(40) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `EXPECTED_END_TIME` datetime DEFAULT NULL,
  `ACTUAL_END_TIME` datetime DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `JOB_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_data_enter` */

/*Table structure for table `m_dataimp_history` */

DROP TABLE IF EXISTS `m_dataimp_history`;

CREATE TABLE `m_dataimp_history` (
  `ID` varchar(36) NOT NULL,
  `BATCH_NO` varchar(30) DEFAULT NULL,
  `DATA_FILE` text,
  `LOG_FILE` text,
  `TOTAL` int(11) DEFAULT NULL,
  `TOTAL_SUCCESS` int(11) DEFAULT NULL,
  `TOTAL_FAILURE` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(36) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `DATA_FILE_RANDOM` text,
  `LOG_FILE_RANDOM` text,
  `DATA_TYPE` varchar(100) DEFAULT NULL,
  `COMPLETE_PERCENT` varchar(100) DEFAULT NULL,
  `DUP_RULE` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dataimp_history` */

/*Table structure for table `m_delivery` */

DROP TABLE IF EXISTS `m_delivery`;

CREATE TABLE `m_delivery` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(120) DEFAULT NULL,
  `CODE` varchar(30) DEFAULT NULL,
  `OFFER_ID` varchar(40) DEFAULT NULL,
  `OFFER_NAME` varchar(50) DEFAULT NULL,
  `PRICE` decimal(20,2) DEFAULT NULL,
  `CHANNEL` varchar(20) DEFAULT NULL,
  `GROUP_ID` varchar(40) DEFAULT NULL,
  `GROUP_NAME` varchar(100) DEFAULT NULL,
  `DEDUPE_TYPE` varchar(100) DEFAULT NULL,
  `PLAN_COUNT` int(11) DEFAULT NULL,
  `PLAN_COST` decimal(20,2) DEFAULT NULL,
  `ACTUAL_COUNT` int(11) DEFAULT NULL,
  `ACTUAL_COST` decimal(20,2) DEFAULT NULL,
  `BEGIN_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_TIME` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_TIME` datetime DEFAULT NULL,
  `DELIVERY_SQL` longtext,
  `CAMPAIGN_ID` varchar(40) NOT NULL,
  `POSITION_ID` varchar(40) DEFAULT NULL,
  `POSITION_NAME` varchar(200) DEFAULT NULL,
  `SEND_CHANNEL` varchar(4) DEFAULT NULL,
  `SMS_PRIORITY` varchar(4) DEFAULT NULL,
  `SMS_SENDTIME` datetime DEFAULT NULL,
  `TEMPTNAME` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_delivery` */

/*Table structure for table `m_dm` */

DROP TABLE IF EXISTS `m_dm`;

CREATE TABLE `m_dm` (
  `ID` varchar(40) NOT NULL,
  `CAMPAIGN_CODE` varchar(40) DEFAULT NULL,
  `GROUP_CODE` varchar(40) DEFAULT NULL,
  `ACCOUNT_CODE` varchar(40) DEFAULT NULL,
  `IFPOST` int(11) DEFAULT NULL,
  `IFBOUNCE` int(11) DEFAULT NULL,
  `POSTTIME` datetime DEFAULT NULL,
  `GREATTIME` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dm` */

/*Table structure for table `m_dm_sender` */

DROP TABLE IF EXISTS `m_dm_sender`;

CREATE TABLE `m_dm_sender` (
  `ID` varchar(50) DEFAULT NULL,
  `CampaignCode` varchar(32) NOT NULL,
  `CampaignTheme` varchar(128) NOT NULL,
  `Brandname` varchar(200) NOT NULL,
  `CampBeginDate` datetime DEFAULT NULL,
  `CampEndDate` datetime DEFAULT NULL,
  `Groupno` int(11) NOT NULL,
  `GroupDescription` varchar(100) NOT NULL,
  `UniqueCode` varchar(50) NOT NULL,
  `DeliveryDate` datetime NOT NULL,
  `Groupcustomernum` int(11) DEFAULT NULL,
  `Name` varchar(128) NOT NULL,
  `Title` varchar(32) DEFAULT NULL,
  `Province` varchar(32) DEFAULT NULL,
  `City` varchar(32) DEFAULT NULL,
  `County` varchar(32) DEFAULT NULL,
  `Address` text NOT NULL,
  `Shoppe` varchar(64) DEFAULT NULL,
  `Remark` varchar(128) DEFAULT NULL,
  `PostCode` varchar(32) NOT NULL,
  `NameId` varchar(50) DEFAULT NULL,
  `PC_SerialNo` int(11) NOT NULL,
  `Delivery_ID` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dm_sender` */

/*Table structure for table `m_dqm_dataprofiling` */

DROP TABLE IF EXISTS `m_dqm_dataprofiling`;

CREATE TABLE `m_dqm_dataprofiling` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_dataprofiling` */

/*Table structure for table `m_dqm_dataprofiling_rule` */

DROP TABLE IF EXISTS `m_dqm_dataprofiling_rule`;

CREATE TABLE `m_dqm_dataprofiling_rule` (
  `ID` varchar(40) NOT NULL,
  `DF_ID` varchar(40) DEFAULT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_dataprofiling_rule` */

/*Table structure for table `m_dqm_enrichment` */

DROP TABLE IF EXISTS `m_dqm_enrichment`;

CREATE TABLE `m_dqm_enrichment` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `TASK_NUM` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_enrichment` */

/*Table structure for table `m_dqm_enrichment_rule` */

DROP TABLE IF EXISTS `m_dqm_enrichment_rule`;

CREATE TABLE `m_dqm_enrichment_rule` (
  `ID` varchar(40) NOT NULL,
  `DE_ID` varchar(40) DEFAULT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_enrichment_rule` */

/*Table structure for table `m_dqm_monitor` */

DROP TABLE IF EXISTS `m_dqm_monitor`;

CREATE TABLE `m_dqm_monitor` (
  `ID` varchar(40) DEFAULT NULL,
  `DATA_ID` varchar(40) DEFAULT NULL,
  `RULE_NAME` varchar(40) DEFAULT NULL,
  `OBJ_TABLE` varchar(40) DEFAULT NULL,
  `OBJ_FIELD` varchar(40) DEFAULT NULL,
  `OLD_VALUE` varchar(40) DEFAULT NULL,
  `NEW_VALUE` varchar(40) DEFAULT NULL,
  `ON_DATE` datetime DEFAULT NULL,
  `ACTION` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_monitor` */

/*Table structure for table `m_dqm_quality` */

DROP TABLE IF EXISTS `m_dqm_quality`;

CREATE TABLE `m_dqm_quality` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `TASK_NUM` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_quality` */

/*Table structure for table `m_dqm_quality_rule` */

DROP TABLE IF EXISTS `m_dqm_quality_rule`;

CREATE TABLE `m_dqm_quality_rule` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `RULE_ID` varchar(40) DEFAULT NULL,
  `ON_FIELD` varchar(40) DEFAULT NULL,
  `ON_VALUE` varchar(40) DEFAULT NULL,
  `DQ_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_quality_rule` */

/*Table structure for table `m_dqm_rule` */

DROP TABLE IF EXISTS `m_dqm_rule`;

CREATE TABLE `m_dqm_rule` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(60) DEFAULT NULL,
  `IMPL_TYPE` varchar(20) DEFAULT NULL,
  `PROCEDURE_NAME` varchar(40) DEFAULT NULL,
  `INTERFACE_CLASS` varchar(40) DEFAULT NULL,
  `INTERFACE_METHOD` varchar(40) DEFAULT NULL,
  `OBJ_TABLE` varchar(40) DEFAULT NULL,
  `OBJ_FIELD` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_dqm_rule` */

/*Table structure for table `m_edm_schedule` */

DROP TABLE IF EXISTS `m_edm_schedule`;

CREATE TABLE `m_edm_schedule` (
  `ID` varchar(40) DEFAULT NULL,
  `DELIVERY_ID` varchar(40) DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TASK_ID` varchar(50) DEFAULT NULL,
  `SEND_NUM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_edm_schedule` */

/*Table structure for table `m_edm_sender` */

DROP TABLE IF EXISTS `m_edm_sender`;

CREATE TABLE `m_edm_sender` (
  `EDM_TASK_ID` varchar(40) NOT NULL,
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `CUSTOMER_INFO` text,
  `BATCH` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_edm_sender` */

/*Table structure for table `m_edm_task` */

DROP TABLE IF EXISTS `m_edm_task`;

CREATE TABLE `m_edm_task` (
  `ID` varchar(40) NOT NULL,
  `DELIVERY_NAME` varchar(120) DEFAULT NULL,
  `DELIVERY_CODE` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `TEMPLATE_NAME` varchar(100) DEFAULT NULL,
  `SENDER_CHINESE` varchar(40) DEFAULT NULL,
  `SENDER_EMAIL` varchar(200) DEFAULT NULL,
  `SUBJECT` varchar(200) DEFAULT NULL,
  `TEMPLATE_CONTENT` longtext,
  `TEMPLATE_VARCHAR` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_edm_task` */

/*Table structure for table `m_element` */

DROP TABLE IF EXISTS `m_element`;

CREATE TABLE `m_element` (
  `ID` varchar(40) NOT NULL,
  `TARGETLIST_ID` varchar(40) NOT NULL,
  `FULL_NAME` varchar(40) DEFAULT NULL,
  `GENDER` varchar(40) DEFAULT NULL,
  `COUNTRY` varchar(40) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `ID_TYPE` varchar(40) DEFAULT NULL,
  `ID_CARD` varchar(30) DEFAULT NULL,
  `INDUSTRY` varchar(40) DEFAULT NULL,
  `DUTY` varchar(40) DEFAULT NULL,
  `HOPPY` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(40) DEFAULT NULL,
  `INCOME` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(30) DEFAULT NULL,
  `MOBILE_TEL` varchar(20) DEFAULT NULL,
  `HOME_TEL` varchar(20) DEFAULT NULL,
  `COMPANY_TEL` varchar(20) DEFAULT NULL,
  `SPARE_TEL` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `POST_PROVINCE` varchar(20) DEFAULT NULL,
  `POST_CITY` varchar(20) DEFAULT NULL,
  `POST_ADDRESS` varchar(128) DEFAULT NULL,
  `POST_CODE` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_element` */

/*Table structure for table `m_email_content` */

DROP TABLE IF EXISTS `m_email_content`;

CREATE TABLE `m_email_content` (
  `ID` varchar(40) NOT NULL,
  `MESSAGE_BODY` longtext,
  `REPLY_CONTENT` longtext,
  `RECEIVER_EMAIL` varchar(200) DEFAULT NULL,
  `SENDER_EMAIL` varchar(200) DEFAULT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_email_content` */

/*Table structure for table `m_employee` */

DROP TABLE IF EXISTS `m_employee`;

CREATE TABLE `m_employee` (
  `ID` varchar(40) NOT NULL,
  `EMPLOYEE_NUM` varchar(40) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `BELONG_STORE` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `MOBILE_TEL` varchar(20) DEFAULT NULL,
  `OFFICE_TEL` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(128) DEFAULT NULL,
  `ADDRESS` varchar(200) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_employee` */

/*Table structure for table `m_event` */

DROP TABLE IF EXISTS `m_event`;

CREATE TABLE `m_event` (
  `ID` varchar(40) NOT NULL,
  `EVENT_NUM` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CATEGORY` varchar(40) DEFAULT NULL,
  `CHILD_CATEGORY` varchar(40) DEFAULT NULL,
  `EXPECTED_END_TIME` datetime DEFAULT NULL,
  `CONTACT` varchar(40) DEFAULT NULL,
  `ACTUAL_END_TIME` datetime DEFAULT NULL,
  `CONTACT_PHONE` varchar(40) DEFAULT NULL,
  `OWNER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(40) DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `SMART_SCRIPT_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `JOB_ID` varchar(40) DEFAULT NULL,
  `EVENT_STATE` varchar(40) DEFAULT NULL,
  `CALL_STATE` varchar(40) DEFAULT NULL,
  `BUSINESS_STATE` varchar(40) DEFAULT NULL,
  `TIMES` int(11) DEFAULT NULL,
  `THEME` varchar(250) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `EMAIL_ID` varchar(40) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(40) DEFAULT NULL,
  `EVENT_ANSWER` text,
  `CALL_END_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_event` */

/*Table structure for table `m_event_attachment` */

DROP TABLE IF EXISTS `m_event_attachment`;

CREATE TABLE `m_event_attachment` (
  `ID` varchar(40) NOT NULL,
  `FILE_NAME` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `SIZE` int(11) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `LAST_UPDATED` datetime DEFAULT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  `FILE_PATH` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_event_attachment` */

/*Table structure for table `m_event_campaign` */

DROP TABLE IF EXISTS `m_event_campaign`;

CREATE TABLE `m_event_campaign` (
  `ID` varchar(40) NOT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_event_campaign` */

/*Table structure for table `m_event_category` */

DROP TABLE IF EXISTS `m_event_category`;

CREATE TABLE `m_event_category` (
  `ID` varchar(40) NOT NULL,
  `CATEAGORY_NUM` varchar(40) DEFAULT NULL,
  `CATCATEAGORY_NAME` varchar(80) DEFAULT NULL,
  `PARENT_CATEAGORY` varchar(40) DEFAULT NULL,
  `BLONG_TYPE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_event_category` */

/*Table structure for table `m_event_rule` */

DROP TABLE IF EXISTS `m_event_rule`;

CREATE TABLE `m_event_rule` (
  `ID` varchar(40) NOT NULL,
  `CALL_STATUS` varchar(40) DEFAULT NULL,
  `CHILD_TYPE` varchar(40) DEFAULT NULL,
  `CALL_TIMES` int(11) DEFAULT NULL,
  `EVENT_TYPE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_event_rule` */

/*Table structure for table `m_event_sr` */

DROP TABLE IF EXISTS `m_event_sr`;

CREATE TABLE `m_event_sr` (
  `ID` varchar(40) NOT NULL,
  `SR_ID` varchar(40) DEFAULT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_event_sr` */

/*Table structure for table `m_exclusive` */

DROP TABLE IF EXISTS `m_exclusive`;

CREATE TABLE `m_exclusive` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_exclusive` */

/*Table structure for table `m_exclusive_condition` */

DROP TABLE IF EXISTS `m_exclusive_condition`;

CREATE TABLE `m_exclusive_condition` (
  `ID` varchar(40) NOT NULL,
  `EXCLUSIVE_ID` varchar(40) NOT NULL,
  `ATTR_ID` varchar(40) DEFAULT NULL,
  `OPERATE` varchar(40) DEFAULT NULL,
  `CRITERIA_VALUE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_exclusive_condition` */

/*Table structure for table `m_exclusive_rela` */

DROP TABLE IF EXISTS `m_exclusive_rela`;

CREATE TABLE `m_exclusive_rela` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) NOT NULL,
  `EXCLUSIVE_ID` varchar(40) NOT NULL,
  `CONDITION_TYPE` varchar(40) NOT NULL,
  `PROMOTION_ID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_exclusive_rela` */

/*Table structure for table `m_faq` */

DROP TABLE IF EXISTS `m_faq`;

CREATE TABLE `m_faq` (
  `ID` varchar(40) NOT NULL,
  `LAST_UPDATE` datetime DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `FILE_CONTENT` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_faq` */

/*Table structure for table `m_gift` */

DROP TABLE IF EXISTS `m_gift`;

CREATE TABLE `m_gift` (
  `ID` varchar(40) NOT NULL,
  `NUM` varchar(40) DEFAULT NULL,
  `GIFT_NAME` varchar(40) DEFAULT NULL,
  `GIFT_POINT` int(11) DEFAULT NULL,
  `STORED_NUM` int(11) DEFAULT NULL,
  `QUANTITY_LEFT` int(11) DEFAULT NULL,
  `VALID_START_TIME` datetime DEFAULT NULL,
  `VALID_END_TIME` datetime DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `UPDATED_BY` varchar(40) DEFAULT NULL,
  `UPDATED` datetime DEFAULT NULL,
  `SAFE_STORED_NUM` int(11) DEFAULT NULL,
  `PRICE` double DEFAULT NULL,
  `MARKET_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_gift` */

/*Table structure for table `m_gift_detail` */

DROP TABLE IF EXISTS `m_gift_detail`;

CREATE TABLE `m_gift_detail` (
  `ID` varchar(40) NOT NULL,
  `GIFT_ID` varchar(40) DEFAULT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  `GIFT_ORDER_ID` varchar(40) DEFAULT NULL,
  `GIFT_DETAIL_NUM` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_gift_detail` */

/*Table structure for table `m_gift_order` */

DROP TABLE IF EXISTS `m_gift_order`;

CREATE TABLE `m_gift_order` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `GIFT_POINT` int(11) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `REMARK` varchar(200) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `POINTS_ID` varchar(40) DEFAULT NULL,
  `PERIOD_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_gift_order` */

/*Table structure for table `m_group` */

DROP TABLE IF EXISTS `m_group`;

CREATE TABLE `m_group` (
  `ID` varchar(40) NOT NULL,
  `GROUP_NAME` varchar(120) DEFAULT NULL,
  `GROUP_CODE` varchar(50) DEFAULT NULL,
  `SENDINGGROUP_SUM` int(11) DEFAULT NULL,
  `SENDINGGROUP_EXPENSE` decimal(19,4) DEFAULT NULL,
  `SENDINGGROUP_PLANSUM` int(11) DEFAULT NULL,
  `SENDINGGROUP_PLANEXPENSE` decimal(19,4) DEFAULT NULL,
  `SEED_ID` varchar(40) DEFAULT NULL,
  `SEED_ID_GROUP` longtext,
  `SEED_NAME` varchar(50) DEFAULT NULL,
  `SPLITTYPE` varchar(50) DEFAULT NULL,
  `SPLITSUM` int(11) DEFAULT NULL,
  `SPLITPERCENT` int(11) DEFAULT NULL,
  `CAMPAGIN_ID` varchar(40) DEFAULT NULL,
  `SENDINGGROUP_SCRIPT` longtext,
  `GROUP_SCRIPT` longtext,
  `CREATEBY` varchar(40) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `MODIFYBY` varchar(40) DEFAULT NULL,
  `MODIFYTIME` datetime DEFAULT NULL,
  `BI_MARK` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_group` */

/*Table structure for table `m_group_code` */

DROP TABLE IF EXISTS `m_group_code`;

CREATE TABLE `m_group_code` (
  `GROUP_CODE` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_group_code` */

/*Table structure for table `m_group_type` */

DROP TABLE IF EXISTS `m_group_type`;

CREATE TABLE `m_group_type` (
  `ID` varchar(50) DEFAULT NULL,
  `CODE` varchar(50) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `GROUP_SQL` longtext,
  `FLAG` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_group_type` */

/*Table structure for table `m_group_warehouse` */

DROP TABLE IF EXISTS `m_group_warehouse`;

CREATE TABLE `m_group_warehouse` (
  `ID` varchar(40) NOT NULL,
  `GROUP_ID` varchar(40) DEFAULT NULL,
  `GROUP_TYPE` varchar(10) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_GROUP_WAREHOUSE` (`CUSTOMER_ID`),
  KEY `IX_M_GROUP_WAREHOUSE_1` (`CAMPAIGN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_group_warehouse` */

/*Table structure for table `m_grouplist` */

DROP TABLE IF EXISTS `m_grouplist`;

CREATE TABLE `m_grouplist` (
  `GROUPID` varchar(40) DEFAULT NULL,
  `TARGETLISTID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_grouplist` */

/*Table structure for table `m_household` */

DROP TABLE IF EXISTS `m_household`;

CREATE TABLE `m_household` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_household` */

/*Table structure for table `m_household_org` */

DROP TABLE IF EXISTS `m_household_org`;

CREATE TABLE `m_household_org` (
  `ID` varchar(40) NOT NULL,
  `HOUSEHOLD_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_household_org` */

/*Table structure for table `m_import_rule` */

DROP TABLE IF EXISTS `m_import_rule`;

CREATE TABLE `m_import_rule` (
  `id` varchar(40) NOT NULL,
  `procedure_name` varchar(40) DEFAULT NULL,
  `column_name` varchar(40) DEFAULT NULL,
  `enable` varchar(40) DEFAULT NULL,
  `source` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_import_rule` */

/*Table structure for table `m_import_template` */

DROP TABLE IF EXISTS `m_import_template`;

CREATE TABLE `m_import_template` (
  `ID` varchar(40) NOT NULL,
  `TEMPLATE_NAME` varchar(200) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `CODE` varchar(40) DEFAULT NULL,
  `MAPPING_RELATION` text,
  `TEMPLATE_TYPE` varchar(40) DEFAULT NULL,
  `SAVE_DATE` datetime DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_import_template` */

/*Table structure for table `m_include_product` */

DROP TABLE IF EXISTS `m_include_product`;

CREATE TABLE `m_include_product` (
  `ID` varchar(40) NOT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_include_product` */

/*Table structure for table `m_include_tier` */

DROP TABLE IF EXISTS `m_include_tier`;

CREATE TABLE `m_include_tier` (
  `ID` varchar(40) NOT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `TIER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_include_tier` */

/*Table structure for table `m_invitation` */

DROP TABLE IF EXISTS `m_invitation`;

CREATE TABLE `m_invitation` (
  `ID` varchar(40) NOT NULL,
  `APPLY_NUM` int(11) DEFAULT NULL,
  `PLAN_NUM` int(11) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `CAMPAIGN` varchar(40) DEFAULT NULL,
  `INVITATION_NUM` varchar(40) DEFAULT NULL,
  `EXPECTED_START_TIME` datetime DEFAULT NULL,
  `EXPECTED_END_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_invitation` */

/*Table structure for table `m_invitation_history` */

DROP TABLE IF EXISTS `m_invitation_history`;

CREATE TABLE `m_invitation_history` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `INVITATION_ID` varchar(40) DEFAULT NULL,
  `PERIOD_ID` varchar(40) DEFAULT NULL,
  `EXPECTED_START_TIME` datetime DEFAULT NULL,
  `EXPECTED_END_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_invitation_history` */

/*Table structure for table `m_job` */

DROP TABLE IF EXISTS `m_job`;

CREATE TABLE `m_job` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `STARTTIME` datetime DEFAULT NULL,
  `REPEAT_FLAG` varchar(1) DEFAULT NULL,
  `REPEAT_UNIT` varchar(40) DEFAULT NULL,
  `REPEAT_INTERVAL` int(11) DEFAULT NULL,
  `SYSDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_job` */

insert  into `m_job` values ('001','基于订单','TASK_STATUS_RUNNING','2014-08-17 15:00:00','1','TASK_REPEATUNIT_DAY',1,'2013-08-14 00:00:00'),('002','基于会员','TASK_STATUS_RUNNING','2014-08-17 14:00:00','1','TASK_REPEATUNIT_DAY',1,'2013-08-14 00:00:00');

/*Table structure for table `m_job_param` */

DROP TABLE IF EXISTS `m_job_param`;

CREATE TABLE `m_job_param` (
  `ID` varchar(40) NOT NULL,
  `NUMBER` int(11) DEFAULT NULL,
  `JOB_ID` varchar(40) DEFAULT NULL,
  `PARAM_TYPE` varchar(40) DEFAULT NULL,
  `PARAM_VALUE` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_job_param` */

insert  into `m_job_param` values ('32a61c8a-5050-4273-8b1c-a144b64b7840',2,'001','TASKPARAM_TYPE_METHOD','onOrder'),('8c312058-c578-467f-83bd-fa3433dbd855',1,'002','TASKPARAM_TYPE_CLASS','LoyaltyTask'),('91be8677-db02-4456-a514-636ef13f0290',2,'002','TASKPARAM_TYPE_METHOD','onMember'),('fa94642b-edba-4dcb-a837-f714bbd599a4',1,'001','TASKPARAM_TYPE_CLASS','LoyaltyTask');

/*Table structure for table `m_jol_rebate_rate` */

DROP TABLE IF EXISTS `m_jol_rebate_rate`;

CREATE TABLE `m_jol_rebate_rate` (
  `ID` int(11) DEFAULT NULL,
  `NAME` varchar(50) DEFAULT NULL,
  `RAT` double DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_jol_rebate_rate` */

insert  into `m_jol_rebate_rate` values (1,'推荐人利率',0.1),(2,'优惠券利率',0.1);

/*Table structure for table `m_keydata_trace` */

DROP TABLE IF EXISTS `m_keydata_trace`;

CREATE TABLE `m_keydata_trace` (
  `ID` varchar(40) NOT NULL,
  `RECORD_ID` varchar(40) DEFAULT NULL,
  `MODULE_CODE` varchar(40) DEFAULT NULL,
  `UPDATE_ITEM` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `BEFORE_UPDATE` text,
  `LATEST_UPDATE` text,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_keydata_trace` */

/*Table structure for table `m_lov` */

DROP TABLE IF EXISTS `m_lov`;

CREATE TABLE `m_lov` (
  `ID` varchar(40) NOT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `LANGUAGE` varchar(10) DEFAULT NULL,
  `CODE` varchar(100) DEFAULT NULL,
  `DISPLAY_VALUE` varchar(100) DEFAULT NULL,
  `PARENT_CODE` text,
  `DISPLAY_ORDER` int(11) DEFAULT NULL,
  `ISEDIT` varchar(1) DEFAULT 'N',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_lov` */

insert  into `m_lov` values ('005F00D9-04F2-4785-9720-507E98A733D9','LOV_CITY','en','金华市','J-金华市','浙江省',145,'Y'),('009BBA53-F66B-4077-83E0-E4F671101EAC','LOV_CITY','en','钦州市','Q-钦州市','广西壮族自治区',230,'Y'),('00E6AC53-7FDF-4E44-8CA3-0F2ADED71896','LOV_CITY','en','内江市','N-内江市','四川省',200,'Y'),('0129b6b3-fae0-4255-a5ad-d3ed8c884106','TRANS_STATUS','zh','M_PROCESSED','完成','',2,'N'),('013','ACTION_ACTIONTYPE','zh','M_ASSIGNPOINTS','送分','',1,'N'),('014','ACTION_ACTIONTYPE','zh','M_REDEEMPOINTS','扣分','',2,'N'),('0141a0c9-bf05-4250-8f46-3e151a648b26','INCOME_INTERVAL_EXT','zh','(INCOME >10000)','1万以上','',5,NULL),('015','ACTION_ACTIONTYPE','zh','M_UPGRADE','升级','',3,'N'),('0157C4C3-1223-4991-8E7A-9A70B3701798','LOV_CITY','zh','兰州市','L-兰州市','甘肃省',164,'Y'),('016','ACTION_ACTIONTYPE','zh','M_DEGRADE','降级','',4,'N'),('017','ACTION_ACTIONTYPE','zh','M_UPDATEATTR','修改属性','',5,'N'),('017204C0-B5F5-45B4-B0BF-5FFE1F9B0344','LOV_CITY','zh','百色市','B-百色市','广西壮族自治区',20,'Y'),('018','ACTION_ACTIONTYPE','zh','M_QUALIFYMEMBER','会员判定','',6,'N'),('019','CRITERIA_COMPARECRITERIA','zh','M_EQUALS','等于','000',1,'N'),('01A534CD-5CA8-4C2F-92E4-F984784EDFC4','LOV_CITY','zh','吉安市','J-吉安市','江西省',131,'Y'),('01FFC02E-E668-4165-8EC1-571AD8F4ED21','LOV_CITY','zh','马鞍山市','M-马鞍山市','安徽省',193,'Y'),('020','CRITERIA_COMPARECRITERIA','zh','M_NOTEQUAL','不等于','000',2,'N'),('021','CRITERIA_COMPARECRITERIA','zh','M_GREATER','大于','000',3,'N'),('022','CRITERIA_COMPARECRITERIA','zh','M_GREATERANDEQUAL','大于等于','000',4,'N'),('022830BF-E354-459D-802D-254ECA505808','PRODUCT_FIELD','zh','createBy','创建人','CREATE_BY',0,'N'),('022F0FE4-6056-4508-BB70-A5776CDA1135','SOURCE_WEBSITE','zh','中粮兑换卡','中粮兑换卡',NULL,6,'y'),('023','CRITERIA_COMPARECRITERIA','zh','M_LESS','小于','000',5,'N'),('024','CRITERIA_COMPARECRITERIA','zh','M_LESSANDEQUAL','小于等于','000',6,'N'),('02478F18-A7CC-42DB-9B7D-2E34BBAF3F71','LOV_CITY','zh','阿拉善盟','A-阿拉善盟','内蒙古自治区',4,'Y'),('025','CRITERIA_COMPARECRITERIA','zh','M_BIRTHMONTH','生日当月','000',7,'N'),('026','CRITERIA_COMPARECRITERIA','zh','M_BIRTHWEEK','生日当周','000',8,'N'),('027','CRITERIA_COMPARECRITERIA','zh','M_BIRTHDAY','生日当天','000',9,'N'),('028','CRITERIA_COMPARECRITERIA','zh','M_INCLUDECOUPON','包含','000',10,'N'),('029','CRITERIA_OPERATE','zh','M_PLUS','加','000',1,'N'),('030','CRITERIA_OPERATE','zh','M_SUBTRACT','减','000',2,'N'),('031','CRITERIA_OPERATE','zh','M_MULTIPLE','乘','000',3,'N'),('032','CRITERIA_OPERATE','zh','M_DIVIDE','除','000',4,'N'),('033','ATTR_ATTRTYPE','zh','M_TOTAL','累计','000',1,'N'),('034','ATTR_ATTRTYPE','zh','M_MEMBER','会员','000',2,'N'),('035','ATTR_ATTRTYPE','zh','M_TRANSACTION','交易','000',3,'N'),('036','ATTR_ATTRTYPE','zh','M_PROGRAM','俱乐部','000',4,'N'),('037','ATTR_ATTRTYPE','zh','M_PROMOTION','规则集属性','000',5,'N'),('038','ATTR_ATTRTYPE','zh','M_SYSTEM','系统','000',6,'N'),('039','PROMOTION_TYPE','zh','M_BASE','基本累积','',1,'N'),('03AD2773-9C09-42FD-9D5F-B2136FDD1535','CAMPAIGN_ROI_ANALYSIS','zh','respCustNum','实际响应数量','',3,'N'),('040','PROMOTION_TYPE','zh','M_BONUS','积分奖励','',2,'N'),('041','PROMOTION_TYPE','zh','M_TIER','等级变更','',3,'N'),('041F828E-FE72-4CD9-BBEE-2EE70E49A59A','SOURCE_WEBSITE','zh','中国移动','中国移动',NULL,9,'y'),('042','PROMOTION_TYPE','zh','M_QUALIFY','会员判定','',4,'N'),('043','PROMOTION_TYPE','zh','M_REDEEM','兑换','',5,'N'),('0434fff4-3cc3-4cc5-bd25-f2dd3128dc00','DQM_RULETYPE','zh','M_PROCEDURE','存储过程','',0,'N'),('044','PROMOTION_TYPE','zh','M_CANCEL','退货','',6,'N'),('045','PROMOTION_TYPE','zh','M_RENEWAL','续会','',7,'N'),('046','PROMOTION_INCLUDEPRODUCT','zh','M_ALLPRODUCT','所有产品','000',1,'N'),('047','PROMOTION_INCLUDEPRODUCT','zh','M_INCLUDEPRODUCT','包含产品','000',2,'N'),('047BFEFB-9C30-466A-9194-57E7984340BF','TRATE_STATUS','zh','E','待财审（客审完毕）',NULL,1,'N'),('048','PROMOTION_INCLUDEPRODUCT','zh','M_EXCLUDEPRODUCT','排除产品','000',3,'N'),('048D17B9-B901-4C1E-9B0E-8D872C721FF1','LOV_CITY','zh','西沙群岛','X-西沙群岛','海南省',315,'Y'),('049','PROMOTION_SOURCE','zh','M_ORDER','基本订单','000',1,'N'),('04B64B9F-C873-42E1-A7BF-F46C514DCF1E','LOV_CITY','zh','惠州市','H-惠州市','广东省',128,'Y'),('050','PROMOTION_SOURCE','zh','M_MEMBER','基于会员','000',2,'N'),('050A4DF7-72AF-4BAA-BF4D-7E5BBF0265D4','LOV_CITY','zh','渭南市','W-渭南市','陕西省',298,'Y'),('051','PROMOTION_SOURCE','zh','M_ORDER_ITEM','基于订单项','000',3,'N'),('052','PROMOTION_GRADE','zh','M_ALLTIER','所有等级','000',1,'N'),('053','PROMOTION_GRADE','zh','M_INCLUDETIER','包含等级','000',2,'N'),('054','PROMOTION_GRADE','zh','M_EXCLUDETIER','排除等级','000',3,'N'),('055','PROMOTION_RUNMODE','zh','M_REALTIME','实时','000',1,'N'),('056','PROMOTION_RUNMODE','zh','M_TIMING','定时','000',2,'N'),('057','PROMOTION_SOURCE','zh','M_REAL_TIME','实时','000',4,'N'),('058','PROMOTION_SOURCE','en','M_REAL_TIME','Real Time','',4,'N'),('060666C6-C183-4185-BB12-7130336BF1DD','LOV_CITY','zh','洛阳市','L-洛阳市','河南省',191,'Y'),('061A307B-9885-4162-AF54-76729A88D412','LOV_CITY','zh','石家庄市','S-石家庄市','河北省',260,'Y'),('067BB680-C4C5-4DDA-9033-E92CA468346F','LOV_CITY','zh','大同市','D-大同市','山西省',58,'Y'),('069008E1-08EA-4708-9C9F-2830798C4BA7','LOV_CITY','zh','沧州市','C-沧州市','河北省',34,'Y'),('06F78183-F8F3-4C42-90DC-C7E19B135DA1','LOV_CITY','zh','宜春市','Y-宜春市','江西省',352,'Y'),('071790D7-540B-498F-925A-F4118CAF9C6B','LOV_CITY','zh','黄山市','H-黄山市','安徽省',126,'Y'),('079267B4-383E-4CC9-9BD9-A3C76477DFE8','LOV_CITY','zh','阿坝藏族羌族自治州','A-阿坝藏族羌族自治州','四川省',1,'Y'),('07a3b172-cc5c-11e3-a5c8-448a5b5b8496','PROCEDURE_NAME','zh','ordersitem_to_ORDERSITEM','订单明细','',4,'N'),('07B42E9B-C188-4388-B321-B991E094754C','CUSTOMER_FIELD','zh','email','邮箱','EMAIL',0,'N'),('08d15387-b4bc-4621-9577-7633217badfc','CUSTOMER_PHONE_STATUS','zh','CUSTOMER_PHONE_ACTIVITY','有效','',1,'N'),('09830473-5850-4602-8CFC-02480B37C73D','SURVEY_QUES_TYPE','zh','SURVEY_INPUT','文本','',3,'N'),('09efec47-51d9-4655-9691-1e91b880d96d','DQM_DATA_STATUS','zh','M_INVALID','无效','',0,'N'),('0A037EB2-6EB1-4886-89C1-C91AB12DEF93','PRODUCT_FIELD','zh','productType','品种类别','PRODUCT_TYPE',0,'N'),('0a1cbbda-3d73-4fe4-a1b9-bf7326c7da85','PER_CUSTOMER_TRANSACT_EXT','zh','(PER_CUSTOMER_TRANSACT > 5000)','5000以上','',5,NULL),('0a751ff1-c7a9-4014-a6c8-10b5b2cb2eab','POSITION_TYPE','zh','M_OTHERS','其他','',4,'N'),('0AEF7F6C-A713-4531-926E-AACDF6D2DC45','LOV_CITY','zh','双鸭山市','S-双鸭山市','黑龙江省',262,'Y'),('0AFD11CC-51A5-4961-B64F-8B6D4364F0CA','LOV_CITY','zh','天津市','T-天津市','天津',283,'Y'),('0B40E19A-E3D6-4984-B018-351C3FA91423','LOV_CITY','zh','信阳市','X-信阳市','河南省',334,'Y'),('0B59CCD2-284C-43C6-AF1C-C6C0837F783D','CUSTOMER_FIELD','zh','originalId','原系统ID','O_ID',0,'N'),('0BE655EF-6120-4787-A0A4-FD041D36A92C','LOV_CITY','zh','通化市','T-通化市','吉林省',287,'Y'),('0C94BC09-4F7A-40CF-8E5C-FD1702CC9C27','LOV_CITY','zh','淮安市','H-淮安市','江苏省',121,'Y'),('0D87E265-A953-41DF-9C23-D9F379A21084','LOV_CITY','zh','苗栗县','M-苗栗县','台湾省',198,'Y'),('0E1A5A64-C981-47E9-8988-EFBFF7F36091','LOV_CITY','zh','深圳市','S-深圳市','广东省',255,'Y'),('0e286354-6858-41a0-9017-c7e6331a0228','SKIP_TYPE','zh','3','油性','',3,'N'),('0E2A1F73-3A53-482F-8A5A-35B39A9FC621','LOV_CITY','zh','绍兴市','S-绍兴市','浙江省',254,'Y'),('0E54039B-E08A-46F1-92CE-AB7E1330344F','CUSTOMER_FIELD','zh','incomeList','月收入','DUTY',0,'N'),('0E7E436B-3DF5-4449-A6CA-D09EF7F36A7E','PRIMARY_PRODUCT_CATEGORY','zh','PT_14','夹克',NULL,1,'N'),('0E90AD57-D0B6-4A7A-9B22-501D1CE7F0D2','MM_RE_RESPONSE_TYPE','zh','COMMUNICATE_AGAIN','进一步沟通',NULL,18,'N'),('0EBD1A79-DDAE-429F-9388-EC11F27E6F97','LOV_CITY','zh','沈阳市','S-沈阳市','辽宁省',257,'Y'),('0EFCE6CC-3F2C-4ABC-908A-8ED037B30A79','LOV_CITY','zh','日照市','R-日照市','山东省',241,'Y'),('0F7687C1-08E6-46A0-9AF4-C729DF8A1786','LOV_CITY','zh','邢台市','X-邢台市','河北省',336,'Y'),('0FDDB570-2367-4529-A50A-E49D9D5BA390','ANALYTICS_CUST_DIM','zh','BIRTHDAY','客户年龄分布','',8,'N'),('0ff5dbb5-3ace-4733-b6ff-7ca0b3154833','ADJUST_STATUS','zh','M_PROCESSED','完成','',2,'N'),('1','MM_QUERY_TYPE','zh','=','等于','000',1,'N'),('10','MM_QUERY_TYPE1','zh','not in','不包含','000',10,'N'),('100','Campaign_Type','zh','Campaign_Type_JRCX','节日促销','000',3,'N'),('10001','MM_QUERY_TYPE','en','=','=','000',1,'N'),('10002','MM_QUERY_TYPE','en','not in123233','not in123','000',10,'N'),('10003','MM_QUERY_TYPE','en','between','between','NULL',11,'N'),('10004','MM_QUERY_TYPE','en','>','>','NULL',2,'N'),('10005','MM_QUERY_TYPE','en','<','<','NULL',3,'N'),('10006','MM_QUERY_TYPE','en','>=','>=','NULL',4,'N'),('10007','MM_QUERY_TYPE','en','<=','<=','NULL',5,'N'),('10008','MM_QUERY_TYPE','en','!=','!=','NULL',6,'N'),('10009','MM_QUERY_TYPE','en','is null','is null','NULL',7,'N'),('1001','TRANS_TYPE','zh','M_EMPLOYEE','员工推荐','',6,'N'),('10010','MM_QUERY_TYPE','en','is not null','is not null','NULL',8,'N'),('10011','MM_QUERY_TYPE','en','in','in','NULL',9,'N'),('10012','MM_QUERY_CLASS','zh','and','AND','000',1,'N'),('10013','MM_QUERY_CLASS','zh','or','OR','000',2,'N'),('1002','TRANS_TYPE','en','M_EMPLOYEE','EMPLOYEE','',6,'N'),('10020','MM_CUS_GENDER','zh','m','男','24',1,'Y'),('100200','MM_SPLIT_TYPE','zh','MM_SPLIT_CITY','城市',NULL,2,'N'),('100202','MM_SPLIT_TYPE','zh','MM_SPLIT_RESPONSE','响应类型',NULL,3,'N'),('100203','MM_SPLIT_TYPE','zh','MM_SPLIT_SIGNON','最近登录',NULL,4,'N'),('100204','MM_SPLIT_TYPE','zh','MM_SPLIT_MAIL','有无邮箱',NULL,5,'N'),('10021','MM_CUS_GENDER','zh','f','女','24',2,'Y'),('1003','TRANS_TYPE','zh','M_CONPONS','优惠码','',7,'N'),('1004','TRANS_TYPE','en','M_CONPONS','CONPONS','',7,'N'),('1005','TRANS_TYPE','zh','M_DEDUCTION','积分扣除','',8,'N'),('1006','TRANS_TYPE','en','M_DEDUCTION','POINT DEDUCTION','',8,'N'),('1007B070-A66B-4648-B99F-EBD6C4B3AE8B','LOV_CITY','zh','舟山市','Z-舟山市','浙江省',382,'Y'),('101','Campaign_Type','zh','Campaign_Type_GWP','GWP（买就送）','000',4,'N'),('102','Campaign_Type','zh','Campaign_Type_JCXS','交叉销售','000',5,'N'),('103','Campaign_Type','zh','Campaign_Type_XSXS','向上销售','000',6,'N'),('104','Campaign_Type','zh','Campaign_Type_ZCD','忠诚度','000',7,'N'),('1041D907-DC7D-4B57-8A50-475B378F9BA7','LOV_CITY','zh','中山市','Z-中山市','广东省',379,'Y'),('105','Campaign_Type','zh','Campaign_Type_LY','路演','000',8,'N'),('10593102-070b-4433-900f-28a375ed614a','ADJUST_ADJUSTTYPE','zh','M_SUBTRACT','减','',2,'N'),('105DA0ED-C876-493A-A5ED-C98BF4372F40','SOURCE_WEBSITE','zh','中粮B2C商城','中粮B2C商城',NULL,3,'y'),('106','Campaign_Type','zh','Campaign_Type_TJ','推介','000',9,'N'),('107','Campaign_Class','zh','Campaign_Class_XS','销售','000',1,'N'),('10711147-6BAA-471E-B2A3-B31302504A74','LOV_CITY','zh','牡丹江市','M-牡丹江市','黑龙江省',199,'Y'),('108','Campaign_Class','zh','Campaign_Class_GG','广告','000',2,'N'),('109','Offer_Type','zh','Offer_Type_XPSS','新品上市','000',1,'N'),('11','MM_QUERY_CLASS','EN','and','AND','000',1,'N'),('110','Offer_Type','zh','Offer_Type_SRCX','生日促销','000',2,'N'),('111','Offer_Type','zh','Offer_Type_JRCX','节日促销','000',3,'N'),('112','Offer_Type','zh','Offer_Type_GWP','GWP（买就送）','000',4,'N'),('113','Offer_Type','zh','Offer_Type_JCXS','交叉销售','000',5,'N'),('114','Offer_Type','zh','Offer_Type_XSXS','向上销售','000',6,'N'),('115','Offer_Type','zh','Offer_Type_ZCD','忠诚度','000',7,'N'),('116','Offer_Type','zh','Offer_Type_LY','路演','000',8,'N'),('117','Offer_Type','zh','Offer_Type_TJ','推介','000',9,'N'),('118','OfferContent_Type','zh','OfferContent_Type_Coupon','Coupon','000',1,'N'),('119','OfferContent_Type','zh','OfferContent_Type_XY','小样','000',2,'N'),('11A3977C-1803-4500-B839-D38A9CF33D9F','LOV_CITY','zh','保定市','B-保定市','河北省',24,'Y'),('11AE6E8A-168B-428D-A156-0FDFC08EAE9B','ORDER_FIELD','zh','order.currency','货币类型','CURRENCY',0,'N'),('12','MM_QUERY_CLASS','EN','or','OR','000',2,'N'),('120','OfferContent_Type','zh','OfferContent_Type_QT','其它','000',3,'N'),('121','Treatment_Channel','zh','Treatment_Channel_DZYJ','电子邮件','000',1,'N'),('122','Treatment_Channel','zh','Treatment_Channel_DH','电话','000',2,'N'),('123','Treatment_Channel','zh','Treatment_Channel_DX','短信','000',3,'N'),('12343ae2-6896-45d5-a742-c324c9acd627','MEMBER_CARD_STATUS','zh','MEMBER_CARD_STATUS_HD','活动','',1,'N'),('124','Treatment_Channel','zh','Treatment_Channel_ZY','直邮','000',4,'N'),('12B0F1FD-AF54-4AE0-86EA-7E7DF3CC0943','PRIMARY_PRODUCT_CATEGORY','zh','PT_12','连衣裙',NULL,1,'N'),('12D7E201-8D6A-411B-8B97-065EDAB1E65D','LOV_CITY','zh','宜兰县','Y-宜兰县','台湾省',353,'Y'),('1310177b-d8fc-42db-a72c-8788d4d388c6','PRODUCT_TYPE','zh','M_SPECIMEN','样品','',2,'Y'),('13F15E14-9C65-4162-920C-310AD31FC010','LOV_CITY','zh','澳门半岛','A-澳门半岛','澳门特别行政区',12,'Y'),('13fc9b56-f34c-4a3e-a00f-e0fee7f32da4','CUSTOMER_COUNTORY','zh','M_COUNTRY_GERMANY','德国','',2,'N'),('147','MM_RESPOSE_TYPE','zh','1','到场',NULL,1,'N'),('148','MM_RESPOSE_TYPE','zh','2','未到场',NULL,2,'N'),('149','MM_RESPOSE_TYPE','zh','3','不确定且未到场',NULL,3,'N'),('14DC3538-41DC-4DA9-A241-A349EF84CC87','LOV_CITY','zh','吐鲁番地区','T-吐鲁番地区','新疆维吾尔自治区',293,'Y'),('15','MM_EXCLUDE_TYPE','EN','MOBILE_TEL','MOBIL',NULL,1,'N'),('150','MM_RESPOSE_TYPE','zh','4','邀约失败',NULL,4,'N'),('151','MM_RESPOSE_TYPE','zh','9','其他',NULL,9,'N'),('152','Respose_Type','zh','Respose_Type_ER','Email Reply',NULL,1,'N'),('153','Respose_Type','zh','Respose_Type_CFD','Confirmed',NULL,2,'N'),('154','Respose_Type','zh','Respose_Type_RJ','Rejected',NULL,3,'N'),('155','Respose_Type','zh','Respose_Type_CU','Clicked on URL',NULL,4,'N'),('15e392fb-319e-4d5f-915c-a84377eb7e7d','LOV_CITY','en','金华市','J-金华市','浙江省',1,'Y'),('16','MM_EXCLUDE_TYPE','EN','EMAIL','EMAIL',NULL,2,'N'),('161F422B-316C-4525-8927-CFC3630C250B','ELEMENT_FIELD','zh','postProvince','省份','PROVINCE',0,'N'),('16E155F9-9CF4-443B-8DE8-DED7701CAD7C','ELEMENT_FIELD','zh','mobileTel','移动电话','MOBILE_TEL',0,'N'),('17','MM_EXCLUDE_TYPE','EN','HOME_TEL','TEL',NULL,3,'N'),('17ABD3FD-41F2-49DD-8EAB-36CD33479889','LOV_CITY','zh','柳州市','L-柳州市','广西壮族自治区',183,'Y'),('18','MM_EXCLUDE_TYPE','EN','POST_ADDRESS','ADDRESS',NULL,4,'N'),('188EE27D-B72B-4AAF-A18A-ED1AB6F2FFDC','RESPOSE_FIELD','zh','responseType','响应类型','RESPONSE_TYPE',0,'N'),('18B410BC-589B-4DC8-9A3F-6B59D11A8615','LOV_CITY','zh','河源市','H-河源市','广东省',106,'Y'),('18c720ff-70ce-485b-81af-b2181e41bbfc','DQM_RULETYPE','zh','M_JAVACODE','JAVA接口方法','',0,'N'),('18C9117B-5AF3-4C79-AB94-312B67AA129F','LOV_CITY','zh','晋城市','J-晋城市','山西省',148,'Y'),('19','MM_QUERY_TYPE1','zh','between','两者之间','',11,'N'),('192728F9-0066-4D3C-A7C3-55DEF9FDD267','TRATE_STATUS','zh','I','待发货（财审完毕）',NULL,1,'N'),('199','TOTALATTR_TOTALTYPE','zh','M_AMOUNT','金额',NULL,2,'N'),('19ac37fb-9c75-4cfd-96e4-4aacdf5b5880','CUSTOMER_EDUCATION','zh','CUSTOMER_EDUCATION_COLLEGE','大学','',1,'N'),('1A440785-84D9-407F-9130-4710052AC237','LOV_CITY','zh','南平市','N-南平市','福建省',206,'Y'),('1A536EF5-4B6E-4BD9-92ED-2DFEC5FE436E','PRODUCT_FIELD','zh','description','商品描述','DESCRIPTION',0,'N'),('1AC7A19D-5E42-4D00-8D16-E91FB58BFF94','CUSTOMER_FIELD','zh','hoppy','兴趣爱好','INCOME_LIST',0,'N'),('1B6875CF-2399-44C1-A974-A249B07D940C','PRODUCT_FIELD','zh','modifyBy','更新人','MODIFY_BY',0,'N'),('1B854B35-DDDB-446A-B6C5-9DC14F59B88B','LOV_CITY','zh','达州市','D-达州市','四川省',54,'Y'),('1B9DAFE9-AAB5-413C-8289-EBE4E809E2F7','LOV_CITY','zh','澄迈县','C-澄迈县','海南省',48,'Y'),('1BB03BEC-9CED-4840-ABE6-3D1B29586C28','CUSTOMER_FIELD','zh','city','城市','CITY',0,'N'),('1CDEAE57-26AD-4ECE-8092-71DD3565230E','LOV_CITY','zh','台北市','T-台北市','台湾省',273,'Y'),('1d4c574d-2eba-4dee-b508-1776d3f40a24','CUSTOMER_POSTITION','zh','CUSTOMER_POSTITION_OFFICER','职员','',1,'N'),('1d73ef45-5b99-48ce-a541-c91709b17df2','DQM_DATA_ACTION','zh','M_NEW','新建','',0,'N'),('1DC64141-E088-4B0C-8609-31873BDCF077','REPEAT_UNIT','zh','day','日','',3,'N'),('1DE511C1-0DB2-4BC6-A37F-6458DB0FE9D0','LOV_CITY','zh','益阳市','Y-益阳市','湖南省',354,'Y'),('1DE61498-1C9A-4877-8092-8B1444CF4AE5','PRIMARY_PRODUCT_CATEGORY','zh','PT_4','皮衣皮草',NULL,1,'N'),('1e16273b-b750-4d6d-bd49-95802e51ad3a','REDEEM_STATUS','zh','M_WAITING','等待','',1,'N'),('1E1B6BC7-D68A-4E99-B7BB-1461B23C9CC9','SURVEY_MODE','zh','SURVEY_WEBSITE','网络','',1,'N'),('1EE1867F-057A-42BB-8E1B-A03D67D81932','Budget_Type','zh','Budget_Type_CDF','场地费','',3,'Y'),('1F144120-78DE-4EA7-ABC7-40FC9B16AEAD','LOV_CITY','zh','张家界市','Z-张家界市','湖南省',369,'Y'),('1F1489F2-6ED5-467F-BE36-385FFCD5F2AE','PRODUCT_FIELD','zh','startDate','上架时间','START_DATE',0,'N'),('1F3874FA-98A3-456F-80EB-3923FB54002E','LOV_CITY','zh','鄂尔多斯市','E-鄂尔多斯市','内蒙古自治区',71,'Y'),('1FBFB5B0-834C-4EBE-A07F-EBFF65C2F70C','IMPORT_RULE','zh','homeTEL=HOME_TEL','家庭电话','',3,'N'),('1ff2f58b-807d-4495-a4c4-9fff40b0ce50','TASKPARAM_TYPE','zh','TASKPARAM_TYPE_DATETIME','日期','',5,'N'),('2','MM_QUERY_TYPE','zh','>','大于','',2,'N'),('20','MC_CUSTOMER_EDU','zh','1','高中及以下',NULL,1,'N'),('200','TOTALATTR_TOTALTYPE','zh','M_COUNT','次数',NULL,1,'N'),('201','ATTR_DATATYPE','zh','M_INTEGER','Integer','1',1,'N'),('202','ATTR_DATATYPE','zh','M_STRING','String',NULL,2,'N'),('203','ATTR_DATATYPE','zh','M_FLOAT','Number',NULL,3,'N'),('204','ATTR_DATATYPE','zh','M_DATE','Date',NULL,4,'N'),('205','POINTTYPE_EXPIRE','zh','M_MEMBERPERIOD','与会员有效期一致',NULL,1,'N'),('206','POINTTYPE_EXPIRE','zh','M_FIXDATE','固定日期',NULL,2,'N'),('207','POINTTYPE_UOM','zh','M_YEAR','年',NULL,1,'N'),('208','POINTTYPE_UOM','zh','M_MONTH','月',NULL,2,'N'),('20801158-DBA7-452A-815C-165EAF3E24A7','LOV_CITY','zh','宿迁市','S-宿迁市','江苏省',267,'Y'),('209','POINTTYPE_EXPIRE','zh','M_PERIOD','期间',NULL,3,'N'),('20e6e24c-e530-4764-96ac-cb8e43d9909a','ACTION_ACTIONTYPE','zh','M_DISQUALIFY','退会','',8,'N'),('21','MC_CUSTOMER_EDU','zh','2','大专',NULL,2,'N'),('210','TIER_UOM','zh','M_MONTH','月',NULL,2,'N'),('211','TIER_UOM','zh','M_YEAR','年',NULL,1,'N'),('211E2F11-CD53-46CB-AAE6-D143F8D48CC3','LOV_CITY','zh','银川市','Y-银川市','宁夏回族自治区',355,'Y'),('212','TIER_PERIODCALCULATE','zh','M_DAY','按自然日',NULL,1,'N'),('213','TIER_PERIODCALCULATE','zh','M_MONTH','按自然月当月',NULL,2,'N'),('214','TIER_PERIODCALCULATE','zh','M_NEXTMONTH','按自然月下月',NULL,3,'N'),('215','TIER_PERIODCALCULATE','zh','M_YEAR','按自然年当月',NULL,4,'N'),('216','TIER_PERIODCALCULATE','zh','M_YEARNEXTMONTH','按自然年下月',NULL,5,'N'),('217','TIER_PERIODCALCULATE','zh','M_YEARLASTDAY','按自然年年末',NULL,6,'N'),('218','CONTACTWAY_STATUS','zh','M_INVALID','无效',NULL,2,'Y'),('219','CONTACTWAY_STATUS','zh','M_UNKNOWN','未知',NULL,3,'Y'),('21C881F7-1FBD-4345-ADC4-6301C1034D11','LOV_CITY','zh','红河哈尼族彝族自治州','H-红河哈尼族彝族自治州','云南省',114,'Y'),('22','MC_CUSTOMER_EDU','zh','3','大学',NULL,3,'N'),('220','EDUCATIONAL_BACKGROUND','zh','M_BEHIND_HIGHSCHOOL','高中及以下',NULL,1,'Y'),('221','EDUCATIONAL_BACKGROUND','zh','M_JUNIOR_COLLEGE','大专',NULL,2,'Y'),('2214F38D-2EB2-4D1C-9183-8BA25DC526E0','DATA_TYPE','zh','customer','客户','',0,'N'),('222','EDUCATIONAL_BACKGROUND','zh','M_UNIVERSITY','大学',NULL,3,'Y'),('222DDBEC-D4BC-4408-B824-E64BD14DE74C','LOV_CITY','zh','金门县','J-金门县','台湾省',146,'Y'),('223','EDUCATIONAL_BACKGROUND','zh','M_ABOVE_GRADUATESTUDENT','研究生及以上',NULL,4,'Y'),('225','CUSTOMER_STATUS','zh','M_ACTIVITY','活动',NULL,1,'N'),('226','CUSTOMER_STATUS','zh','M_CANCEL','取消',NULL,2,'N'),('227','CUSTOMER_STATUS','zh','M_CANDIDATE','候选人',NULL,3,'N'),('228','CUSTOMER_STATUS','zh','M_BLACKLIST','黑名单',NULL,4,'N'),('228BE7C2-3B93-4ECA-A0B2-45569386637F','LOV_CITY','zh','中沙群岛的岛礁及其海域','Z-中沙群岛的岛礁及其海域','海南省',378,'Y'),('229b0e8d-8f21-4e3b-afa1-afb1d1c2feaa','SKIP_TYPE','en','4','miscibility','',4,'N'),('23','MC_CUSTOMER_EDU','zh','4','研究生及以上',NULL,4,'N'),('230','POST_STATUS','zh','M_VALID','有效',NULL,1,'Y'),('231','POST_STATUS','zh','M_INVALID','无效',NULL,2,'Y'),('232','POST_STATUS','zh','M_UNKNOWN','未知',NULL,3,'Y'),('23263DBD-F58A-4002-BD6F-ADF7AF5F28EF','LOV_CITY','zh','河池市','H-河池市','广西壮族自治区',105,'Y'),('233d9921-0b38-4b22-be8b-9a1fe85a9475','MEMBER_CARD_STATUS','zh','MEMBER_CARD_STATUS_GQ','过期','',2,'N'),('233f431e-cec6-4f3d-bfdf-5cb5e44ed27b','MODIFY_ATTRIBUTE','zh','M_SUBTRACT','减','',2,'N'),('23585572-FA80-4FEF-83BB-834F9354C305','CUSTOMER_FIELD','zh','companyName','公司名称','COMPANY_NAME',0,'N'),('23EF0698-849E-49E4-93AA-A4A670F381C0','SOURCE_WEBSITE','zh','其它','其它',NULL,12,'y'),('24','MM_SPLIT_TYPE','zh','MM_SPLIT_SEX','性别',NULL,1,'N'),('24183B12-FB80-4D6E-88E2-04646977A699','CUSTOMER_FIELD','zh','mode','客户类型','MODE',0,'N'),('241B1966-45C2-4FA0-9404-117B0F4A8A87','LOV_CITY','zh','新竹市','X-新竹市','台湾省',332,'Y'),('2498a669-2f68-43d6-8ad2-811328bd6e22','EVENT_TYPE','zh','M_EMAIL','EMAIL','',3,'N'),('24FF57B6-5371-4656-9D27-81FE456AD1E9','LOV_CITY','zh','琼海市','Q-琼海市','海南省',235,'Y'),('252AB247-8267-413A-818C-5639EEFD4B46','LOV_CITY','zh','常德市','C-常德市','湖南省',41,'Y'),('2555B75B-8832-4746-9E10-3DF9F0334AC2','LOV_CITY','zh','铁岭市','T-铁岭市','辽宁省',286,'Y'),('259E8A9D-BD34-447C-B5E5-1FCBDC4B046B','LOV_CITY','zh','台东县','T-台东县','台湾省',274,'Y'),('25A7E29D-7629-4D52-AEA5-AFF53B4F90DD','PRIMARY_PRODUCT_CATEGORY','zh','PT_11','打底裤',NULL,1,'N'),('26BB44E5-6172-41CA-AC69-D438600A6879','LOV_CITY','zh','拉萨市','L-拉萨市','西藏自治区',161,'Y'),('27','MC_CUSTOMER_DUTY','zh','1','服装',NULL,1,'N'),('273acd5c-9aaa-4e7e-88fb-ed01fca6aee0','TASK_STATUS','zh','TASK_STATUS_NOTRUN','未运行','',3,'N'),('274','MM_Offer_Type','zh','new_listing','新品上市',NULL,1,'N'),('274B8AB6-62FF-468D-968C-120319947EE3','PRIMARY_PRODUCT_CATEGORY','zh','PT_6','休闲库',NULL,1,'N'),('275','MM_Offer_Type','zh','birthday_promotion','生日促销',NULL,2,'N'),('275BFA69-C8DC-425B-9244-8328004FF27F','RESPOSE_FIELD','zh','customerNum','客户编号','CUSTOMER_NUM',0,'N'),('276','MM_Offer_Type','zh','holiday_promotion','节日促销',NULL,3,'N'),('277','MM_Offer_Type','zh','gwp','GWP',NULL,4,'N'),('278','MM_Offer_Type','zh','roadshow','路演',NULL,5,'N'),('278C05E1-F11E-4E8E-B0C2-E6D996A3ED0C','PROCEDURE_NAME','zh','users_to_CUSTOMER','客户','',2,'N'),('279','MM_Offer_Type','zh','offer','邀约',NULL,6,'N'),('28','MC_CUSTOMER_DUTY','zh','2','银行',NULL,2,'N'),('280','MM_Offer_Type','zh','survey','问券调查',NULL,7,'N'),('281','MM_Offer_Type','zh','Recommendation','推介',NULL,8,'N'),('282','LOV_REGION','zh','LOV_REGION_DB','东北区',NULL,1,'N'),('283','LOV_REGION','zh','LOV_REGION_HB','华北区',NULL,2,'N'),('284','LOV_REGION','zh','LOV_REGION_HD','华东区',NULL,3,'N'),('285','LOV_REGION','zh','LOV_REGION_XN','西南区',NULL,4,'N'),('286','LOV_REGION','zh','LOV_REGION_HN','华南区',NULL,5,'N'),('287','LOV_REGION','zh','LOV_REGION_HX','华西区',NULL,6,'N'),('288','LOV_REGION','zh','LOV_REGION_HZ','华中区',NULL,7,'N'),('289','LOV_REGION','zh','LOV_REGION_XB','西北区',NULL,8,'N'),('29','MC_CUSTOMER_DUTY','zh','3','生物技术',NULL,3,'N'),('290','STORE_TYPE','zh','STORE_TYPE_Online','在线',NULL,1,'N'),('291','STORE_TYPE','zh','STORE_TYPE_Offline','离线',NULL,2,'N'),('292','STORE_STATUS','zh','STORE_STATUS_Active','活跃',NULL,1,'N'),('293','STORE_STATUS','zh','STORE_STATUS_InActive','非活跃',NULL,2,'N'),('294','EMPLOYEE_TYPE','zh','EMPLOYEE_STATUS_MKT','营销人员','',1,'N'),('295','EMPLOYEE_TYPE','zh','EMPLOYEE_STATUS_NQ','内勤','',5,'N'),('296','EMPLOYEE_STATUS','zh','EMPLOYEE_STATUS_Active','在职','',1,'N'),('297','EMPLOYEE_STATUS','zh','EMPLOYEE_STATUS_InActive','离职','',2,'N'),('299EECEA-6BDC-42E7-89C9-22B9D5C83E6A','CAMPAIGN_ROI_ANALYSIS','zh','orderMaori','毛利','',8,'N'),('29A7CF4A-9758-4891-9451-DAEEA84B09D5','LOV_CITY','zh','廊坊市','L-廊坊市','河北省',165,'Y'),('2a52327b-7577-4fcc-88c3-cff64db2d441','CREDENTIALS_TYPE','zh','M_PASSPORT','护照','',2,'Y'),('2A6052AE-A65D-4DE4-98E6-9AA5886BB3AE','LOV_CITY','zh','东方市','D-东方市','海南省',68,'Y'),('2A730190-B8C9-447C-8B39-407FCBC0EDFA','LOV_CITY','zh','抚顺市','F-抚顺市','辽宁省',77,'Y'),('2AC1A19C-4881-49D1-91B5-D568AA28824B','ORDER_FIELD','zh','product.originalId','商品ID','PRODUCT_ID',0,'N'),('2B272449-1DB1-4973-92DD-CE0800DC7F7A','LOV_CITY','zh','金昌市','J-金昌市','甘肃省',144,'Y'),('2C30C914-4736-4FBB-A735-C7ACC32154D0','LOV_CITY','zh','绥化市','S-绥化市','黑龙江省',269,'Y'),('2CC8218B-9934-497E-9BA0-9C21EC6A3FEA','LOV_CITY','zh','广元市','G-广元市','四川省',87,'Y'),('2CEFE159-5EF1-4FA9-BCA5-EE7AF46A6D85','LOV_CITY','zh','呼和浩特市','H-呼和浩特市','内蒙古自治区',115,'Y'),('2D0D5D51-1C91-4623-8B66-C86BE2691ABF','TRATE_STATUS','zh','ORDER_STATUS_1','交易成功',NULL,1,'N'),('2D1D2C9A-A10E-43D1-B3BD-9F474CA766C7','LOV_CITY','zh','随州市','S-随州市','湖北省',270,'Y'),('2D1F916D-5146-4BD7-8635-E72D77ABE0CF','LOV_CITY','zh','贺州市','H-贺州市','广西壮族自治区',108,'Y'),('2D3DB24C-0009-489B-BCAD-0FF403AB2F82','LOV_CITY','zh','武汉市','W-武汉市','湖北省',311,'Y'),('2D477CC7-D717-4B14-B3D2-C5CD278B6EE4','LOV_CITY','zh','嘉兴市','J-嘉兴市','浙江省',137,'Y'),('2E1AECC6-3B58-4DF5-91B3-E4308D5B9B5D','LOV_CITY','zh','吴忠市','W-吴忠市','宁夏回族自治区',306,'Y'),('2E2AC288-3B51-4E27-8259-5FE3FE5FA0CD','LOV_CITY','zh','漳州市','Z-漳州市','福建省',373,'Y'),('2eca223b-7f23-4f39-83d8-9ee8006f7fe9','ACTION_ACTIONTYPE','zh','M_RENEWAL','续会','',7,'N'),('2ee74cbc-b939-40cb-8a50-86f0b45fb32c','TOTAL_ORDER_AMOUNT_EXT','zh','(MONEY >10000)','1万以上','',5,NULL),('2F659C0E-A9CD-446C-A074-CDD474D1331A','ORDER_FIELD','zh','customer.fullName','客户姓名','FULL_NAME',0,'N'),('3','MM_QUERY_TYPE','zh','<','小于','',3,'N'),('30','MC_CUSTOMER_DUTY','zh','4','化学化工',NULL,4,'N'),('301','MM_QUERY_OPTION','zh','buy','买过',NULL,1,'N'),('302','MM_QUERY_OPTION','zh','not_bought','没有买过',NULL,2,'N'),('303','MM_QUERY_PROPERTY','zh','consume','消费数量',NULL,1,'N'),('3035A0C3-920A-4797-A71B-8FE5611EAD19','CUSTOMER_FIELD','zh','source','客户来源','SOURCE',0,'N'),('304','MM_QUERY_PROPERTY','zh','amount','消费金额',NULL,2,'N'),('305','MM_QUERY_PROPERTY','zh','frequency','消费频次',NULL,3,'N'),('30616230-5F1E-47B9-8DED-3EB1993AA2CB','CUSTOMER_FIELD','zh','country','国家','COUNTRY',0,'N'),('308F5A13-B82F-4E92-9304-F88B7A1EDDFE','LOV_CITY','zh','锡林郭勒盟','X-锡林郭勒盟','内蒙古自治区',317,'Y'),('30C16363-7992-4460-BBFB-A3A1713A448B','ORDER_FIELD','zh','originalId','订单原系统ID','ORIGINAL_ID',0,'N'),('30E09CB7-4EEB-4A9E-9CAC-1D02F29D7BF8','LOV_CITY','zh','乐山市','L-乐山市','四川省',167,'Y'),('30E86470-9709-420A-A73C-E491F3C8AC4C','LOV_CITY','zh','花莲县','H-花莲县','台湾省',119,'Y'),('30efe83a-8601-45cd-80e2-12c24386b23a','DATAENTER_STATE','zh','M_DATAENTER_BEFORE_ASSIGN','待分配','',1,'N'),('31','MC_CUSTOMER_DUTY','zh','5','通讯',NULL,5,'N'),('31A1AFA1-291C-47A8-8789-9E503711BDA7','CUSTOMER_FIELD','zh','duty','职位','HOPPY',0,'N'),('31c8a2ea-b439-4302-9d2c-717dc0b2e00b','GIFT_ORDER_STATUS','zh','GIFT_ORDER_STATUS_APPLICATION','已申请','',1,'N'),('32','MC_CUSTOMER_DUTY','zh','6','建筑',NULL,6,'N'),('3246E189-35F2-4DA5-99E6-1ADA410F4623','LOV_CITY','zh','济源市','J-济源市','河南省',135,'Y'),('33','MC_CUS_IFMOBTEL','zh','0','接受移动电话',NULL,1,'N'),('3318D686-A2F8-4A66-BA2E-60521B7066D0','PRODUCT_FIELD','zh','productViolation','商品是否违规','PRODUCT_VIOLATION',0,'N'),('3326e9cc-2355-456b-b5b5-297a5fd4906f','SEX_TYPE','zh','m','男','',1,'N'),('333283C4-05C6-4EDB-B4EF-5012D4451647','LOV_CITY','zh','榆林市','Y-榆林市','陕西省',359,'Y'),('337057F5-D6EE-4E7C-90E9-8D4B671E1CEA','LOV_CITY','zh','阳江市','Y-阳江市','广东省',346,'Y'),('3376AC2C-D62C-4D39-AB2E-AAEF33DC00B9','SOURCE_WEBSITE','zh','淘宝','淘宝',NULL,1,'y'),('34','MC_CUS_IFMOBTEL','zh','1','不接受移动电话',NULL,2,'N'),('3402beec-9c47-4da9-859f-d3018cbf091b','TASK_REPEATUNIT','zh','TASK_REPEATUNIT_WEEK','周','',3,'N'),('34988A79-EC23-4BAE-9097-83B22D760A5B','CUSTOMER_FIELD','zh','education','教育程度','EDUCATION',0,'N'),('35','MC_CUS_MOBTELSTA','zh','0','移动电话状态未知',NULL,1,'N'),('3558ae75-2682-4bdf-8c39-653275ea04ac','TOTAL_ORDER_AMOUNT_EXT','zh','(MONEY >3000 AND MONEY<=5000)','3000~5000','',3,NULL),('35647A00-4E88-4D76-88FF-829154E7F74D','LOV_CITY','zh','日喀则地区','R-日喀则地区','西藏自治区',240,'Y'),('358370E7-8B7E-475C-AACB-32CB2F8B6C47','LOV_CITY','zh','台中市','T-台中市','台湾省',276,'Y'),('3592DC92-6BE2-497A-983D-6F36E40F07B3','PROCEDURE_NAME','zh','batch_statistics','批量统计','',1,'N'),('35d21879-bdb8-4587-9e4b-51ecd11e82df','MEMBER_CARD_STATUS','zh','MEMBER_CARD_STATUS_DS','丢失','',3,'N'),('35E5F90C-BCB3-4C58-ADA1-C7089AB447FF','LOV_CITY','zh','那曲地区','N-那曲地区','西藏自治区',201,'Y'),('36','MC_CUS_MOBTELSTA','zh','1','移动电话状态有效',NULL,2,'N'),('3602449A-3923-4E3B-B689-B1A695B0388D','ELEMENT_FIELD','zh','birthday','生日','BIRTHDAY',0,'N'),('360C78CF-30BE-4F34-85CB-84D769F60908','LOV_CITY','zh','离岛','L-离岛','澳门特别行政区',168,'Y'),('366CA64D-7D7D-486B-A862-EC8E49AA6E39','MM_RE_RESPONSE_TYPE','zh','MMS_SEND_ERROR','彩信发送失败',NULL,8,'N'),('36C6336F-5505-437E-8833-8796F9094C3A','LOV_CITY','zh','荆州市','J-荆州市','湖北省',151,'Y'),('37','MC_CUS_MOBTELSTA','zh','2','移动电话状态无效',NULL,3,'N'),('3799d513-8762-46c5-be4f-714b85f9dacd','PROMOTION_SOURCE','zh','M_ORDER_POINT','订单转积分','',5,'Y'),('37A0752F-360E-43B5-9E25-66BC8BCC92BE','LOV_CITY','zh','莱芜市','L-莱芜市','山东省',163,'Y'),('37b1a13a-3bae-453f-9650-66e8c642940a','TOTAL_ATTRIBUTE_UOM','zh','M_MONTH','月','',2,'N'),('38','MC_CUS_HOMETELSTA','zh','0','家庭电话状态未知',NULL,1,'N'),('3838AA85-B49F-47B9-8237-659C20DC852E','CAMPAIGN_ROI_ANALYSIS','zh','re','ROI','',9,'N'),('3872e21a-2e26-4773-94e6-ce65db5a4971','TOTAL_ORDER_AMOUNT_EXT','zh','(MONEY >2000 AND MONEY<=3000)','2000~3000','',2,NULL),('38a9eed9-1656-4b1f-9fed-2baac7802e35','ADJUST_ADJUSTTYPE','zh','M_PURGE','清零','',3,'N'),('38AE11B9-792B-4634-8D62-ECF296F8C253','LOV_CITY','zh','黄冈市','H-黄冈市','湖北省',124,'Y'),('38CDF15F-BA9B-47C2-BBC4-B3C601F3ADCD','LOV_CITY','zh','清远市','Q-清远市','广东省',233,'Y'),('39','MC_CUS_HOMETELSTA','zh','1','家庭电话状态有效',NULL,2,'N'),('3926dba7-d2d5-4cc7-a9d8-44efdd32cffa','ADJUST_STATUS','zh','M_PENDING','待处理','',1,'N'),('39518742-8DBF-4408-92E5-23099C1E2FA4','LOV_CITY','zh','盐城市','Y-盐城市','江苏省',344,'Y'),('39c4d083-1a33-4c2d-9106-afb8c75ebe95','MEMBER_CARD_TIER','zh','MEMBER_CARD_TIER_LS','临时','',1,'N'),('3a108473-dc22-4f23-97b2-9cff0b06b8f4','TOTAL_ATTRIBUTE_UOM','zh','M_DAY','日','',3,'N'),('3A3EBB27-439F-4724-995B-CCFFBCCF3784','REPEAT_UNIT','zh','hour','小时','',4,'N'),('3A418785-90F3-4D07-9B39-C2592490B907','LOV_CITY','zh','昌吉回族自治州','C-昌吉回族自治州','新疆维吾尔自治区',36,'Y'),('3A88B76C-0E8F-4FF8-8820-0FA1C27B2257','LOV_CITY','zh','临高县','L-临高县','海南省',179,'Y'),('3B09A6B5-2950-44C2-B5D1-BC310CE0B76D','LOV_PROVINCE','zh','澳门特别行政区','A-澳门特别行政区','',0,'Y'),('3B0E0950-3F1B-4654-9B9E-8352ACFD0D9A','LOV_CITY','zh','鞍山市','A-鞍山市','辽宁省',11,'Y'),('3B7C9157-BF4D-42FC-8575-C956246A3087','ORDER_FIELD','zh','comment','备注','COMMENT',0,'N'),('3B843CF0-212B-4702-8A7B-0ED411464917','LOV_CITY','zh','玉树藏族自治州','Y-玉树藏族自治州','青海省',361,'Y'),('3BDE5D52-06A0-49AC-80EB-A75A201D0533','LOV_CITY','zh','石嘴山市','S-石嘴山市','宁夏回族自治区',261,'Y'),('3BEBE891-DAFB-4114-BB1A-4BD562DC4BC3','LOV_CITY','zh','怀化市','H-怀化市','湖南省',120,'Y'),('3C979F73-E9C0-4AC7-8AEA-C82AEA3D4C25','LOV_CITY','zh','儋州市','D-儋州市','海南省',61,'Y'),('3DC9E233-3280-436E-8684-B081EC6A1B6B','LOV_CITY','zh','北海市','B-北海市','广西壮族自治区',27,'Y'),('3E4C70A8-A175-4DB9-85DE-B28E1CDACD2D','LOV_CITY','zh','甘南藏族自治州','G-甘南藏族自治州','甘肃省',81,'Y'),('3EAD4891-5D12-4243-8CEC-1EBBB186AB0C','LOV_CITY','zh','庆阳市','Q-庆阳市','甘肃省',234,'Y'),('3EB7D31E-77C6-45BD-9D8F-331E65A877D4','LOV_CITY','zh','普洱市','P-普洱市','云南省',223,'Y'),('3F290465-E3DB-4C9C-B8E4-7DEC9ED8DE81','SURVEY_QUES_TYPE','zh','SURVEY_CHECKBOX','多选','',1,'N'),('3f47da1d-2cae-4c47-b98f-82d0eec15b58','CUSTOMER_POSITION','zh','CUSTOMER_POSITION_PERSON','个体户','',1,'Y'),('3F7360DE-D3A2-4DE6-96C2-5935D084D6B3','LOV_CITY','zh','汕尾市','S-汕尾市','广东省',247,'Y'),('3f823dbe-05b8-4f76-9aad-8ffe16d1a2b7','ATTR_ATTRTYPE','zh','M_MEMBERPOINTS','会员积分','',7,'N'),('3FA614B9-7F09-4C11-BEF7-6C2891BC5D9C','LOV_CITY','zh','池州市','C-池州市','安徽省',49,'Y'),('3FA92075-EF24-4237-8B01-971697B0C624','LOV_CITY','zh','丹东市','D-丹东市','辽宁省',60,'Y'),('3fc35a7c-e636-4c49-b665-cd4bc33a42f3','PROMOTION_TYPE','zh','M_CAMPAIGN','参加活动','',8,'N'),('4','MM_QUERY_TYPE','zh','>=','大于等于','',4,'N'),('40','MC_CUS_HOMETELSTA','zh','2','家庭电话状态无效',NULL,3,'N'),('4000','MM_TREATMENT_VARIABLE_SMS','zh','account','客户',NULL,2,'N'),('40006A4F-792A-41A1-AFC5-5CE6F73CB661','ELEMENT_FIELD','zh','promotedType','有无实名认证','PROMOTED_TYPE',0,'N'),('4001','MM_TREATMENT_VARIABLE_SMS_bak','zh','member','会员',NULL,2,'N'),('4002','MM_TREATMENT_VARIABLE_SMS2','zh','account_name','客户名称','account',3,'N'),('4003','MM_TREATMENT_VARIABLE_SMS2','zh','account_birthday','客户生日','account',5,'N'),('4008','MM_TREATMENT_VARIABLE_SMS2','zh','name','会员名称','member',10,'N'),('4009','MM_TREATMENT_VARIABLE_SMS2','zh','avablePoints','可用积分','member',11,'N'),('4010','MM_TREATMENT_VARIABLE_SMS2','zh','terminteDate','积分到期日','member',12,'N'),('4011','MM_TREATMENT_VARIABLE_SMS2','zh','memberTier','会员级别','member',13,'N'),('4012','MM_TREATMENT_VARIABLE_SMS2','zh','tierTerDate','会员级别到期日','member',14,'N'),('4013','MM_TREATMENT_VARIABLE_SMS2','zh','birthday','会员生日','member',15,'N'),('4014','MM_TREATMENT_VARIABLE_SMS2','zh','joinDate','入会日期','member',16,'N'),('4015','MM_TREATMENT_VARIABLE_SMS2','zh','memberTerDate','会员期结束','member',17,'N'),('4025','MM_TREATMENT_VARIABLE_SMS3','zh','@name@','@name@','account_name',3,'N'),('4026','MM_TREATMENT_VARIABLE_SMS3','zh','@birthday@','@birthday@','account_birthday',5,'N'),('402c0a2e-78cd-4fb2-9a35-79740568bb2e','GIFT_ORDER_STATUS','zh','GIFT_ORDER_STATUS_DELIVERY','已发货','',2,'N'),('4031','MM_TREATMENT_VARIABLE_SMS3','zh','@name@','@name@','name',10,'N'),('4032','MM_TREATMENT_VARIABLE_SMS3','zh','@avablePoints@','@avablePoints@','avablePoints',11,'N'),('4033','MM_TREATMENT_VARIABLE_SMS3','zh','@terminteDate@','@terminteDate@','terminteDate',12,'N'),('4034','MM_TREATMENT_VARIABLE_SMS3','zh','@memberTier@','@memberTier@','memberTier',13,'N'),('4035','MM_TREATMENT_VARIABLE_SMS3','zh','@tierTerDate@','@tierTerDate@','tierTerDate',14,'N'),('4036','MM_TREATMENT_VARIABLE_SMS3','zh','@birthday@','@birthday@','birthday',15,'N'),('4037','MM_TREATMENT_VARIABLE_SMS3','zh','@joinDate@','@joinDate@','joinDate',16,'N'),('4038','MM_TREATMENT_VARIABLE_SMS3','zh','@memberTerDate@','@memberTerDate@','memberTerDate',17,'N'),('4051','MM_RE_RESPONSE_TYPE','zh','OPEN_EMAIL','打开电子邮件',NULL,1,'N'),('4052','MM_RE_RESPONSE_TYPE','zh','OPEN_URL','访问活动网址的链接',NULL,2,'N'),('4053','MM_RE_RESPONSE_TYPE','zh','EDM_SEND_OK','电子邮件发送成功',NULL,4,'N'),('4054','MM_RE_RESPONSE_TYPE','zh','INVALID_MAIL','无效的电子邮件地址',NULL,6,'N'),('4055','MM_RE_RESPONSE_TYPE','zh','REJECT','电子邮件被拒收',NULL,9,'N'),('4056','MM_RE_RESPONSE_TYPE','zh','ALLNOTSEND','电子邮件发送失败',NULL,10,'N'),('4057','MM_RE_RESPONSE_TYPE','zh','SMS_SEND_OK','短信发送成功',NULL,11,'N'),('4058','MM_RE_RESPONSE_TYPE','zh','SEND_ERROR','短信发送失败',NULL,12,'N'),('4059','MM_RE_RESPONSE_TYPE','zh','NVALID_MOBLE','手机号码无效',NULL,13,'N'),('4060','MM_RE_RESPONSE_TYPE','zh','REPLY','短信已经回复',NULL,14,'N'),('4061','MM_RE_RESPONSE_TYPE','zh','DIDNOT_OPEN_URL','未访问活动网址的链接',NULL,3,'N'),('40665f9b-e088-4ba8-a9f5-3793eecf6336','INCOME_INTERVAL','zh','1','0~2000','',1,'Y'),('40C73B0D-FC55-47D8-8BBE-23794E624AEA','LOV_PROVINCE','zh','台湾省','T-台湾省','',26,'Y'),('40DADC98-E63F-4F70-BE1F-42AE89B6FD44','PRODUCT_FIELD','zh','createDate','发布时间','CREATE_DATE',0,'N'),('41','MC_CUS_IFHOMETEL','zh','0','接受家庭电话',NULL,1,'N'),('4194CBC4-3705-4186-BCD6-FB6445D51209','LOV_CITY','zh','成都市','C-成都市','四川省',46,'Y'),('42','MC_CUS_IFHOMETEL','zh','1','不接受家庭电话',NULL,2,'N'),('4255C2AB-214F-4DA2-ADCC-8F2C05953E81','LOV_CITY','zh','玉林市','Y-玉林市','广西壮族自治区',360,'Y'),('43','MC_CUS_COMTELSTA','zh','0','公司电话状态未知',NULL,1,'N'),('431','MM_CAMPAIGN_TYPE','zh','news','新品上市',NULL,1,'Y'),('432','MM_CAMPAIGN_TYPE','zh','birthday','生日促销',NULL,2,'Y'),('433','MM_CAMPAIGN_TYPE','zh','festivals','节日促销',NULL,3,'Y'),('434','MM_CAMPAIGN_TYPE','zh','gwp','GWP（买就送）',NULL,4,'Y'),('435','MM_CAMPAIGN_TYPE','zh','roadshow','路演',NULL,5,'Y'),('435B4147-8CEA-49E7-BB58-1614C0FB0F9D','ORDER_FIELD','zh','amount','商品单价','AMOUNT',0,'N'),('435FFB9D-97CA-4566-8F1B-2A2A41F4D5BA','LOV_PROVINCE','zh','香港特别行政区','X-香港特别行政区','',28,'Y'),('436','MM_CAMPAIGN_TYPE','zh','offer','邀约',NULL,6,'Y'),('437','MM_CAMPAIGN_TYPE','zh','survey','问卷调查',NULL,7,'Y'),('438','MM_CAMPAIGN_TYPE','zh','recommendation','推介',NULL,8,'Y'),('43881397-E121-4A0E-8516-036BC33A1EE1','LOV_CITY','zh','西双版纳傣族自治州','X-西双版纳傣族自治州','云南省',316,'Y'),('439','MM_CAMPAIGN_CLASS','zh','notices','通告',NULL,1,'Y'),('43aa4b34-a17a-40af-9e0a-1de676c80eef','CUSTOMER_POSITION','zh','CUSTOMER_POSITION_MANAGER','经理','',2,'Y'),('43d76b19-44d3-4ccb-b556-bf196a9e20a2','CUSTOMER_POSITION','zh','CUSTOMER_POSITION_DIRECTOR','主管','',5,'Y'),('43ee3373-8ad2-4495-8a5d-ef71bf4bd870','POINTS_DETAIL_TYPE','zh','M_CAMPAIGN','参加活动','',5,'N'),('44','MC_CUS_COMTELSTA','zh','1','公司电话状态有效',NULL,2,'N'),('440','MM_CAMPAIGN_CLASS','zh','survey','调查',NULL,2,'Y'),('441','MM_CAMPAIGN_CLASS','zh','cross-selling','交叉销售',NULL,3,'Y'),('442','MM_CAMPAIGN_CLASS','zh','up-selling','向上销售',NULL,4,'Y'),('443','MM_CAMPAIGN_CLASS','zh','loyalty','忠诚度',NULL,5,'Y'),('444','MM_CAMPAIGN_CLASS','zh','market','销售',NULL,6,'Y'),('445','MM_CAMPAIGN_CLASS','zh','introduction','介绍',NULL,7,'Y'),('446','MM_CAMPAIGN_CLASS','zh','congratulation','祝贺/问候',NULL,8,'Y'),('44AFF1EC-9BDD-4601-8C79-311E83349B44','LOV_CITY','zh','西安市','X-西安市','陕西省',313,'Y'),('45','MC_CUS_COMTELSTA','zh','2','公司电话状态无效',NULL,3,'N'),('45433080-D3C7-43BF-A841-FF00D9CECA25','LOV_CITY','zh','神农架林区','S-神农架林区','湖北省',256,'Y'),('457','MM_RESPONSE_COLUMN','zh','RESPONSE_NAME','响应名称',NULL,1,'N'),('458','MM_RESPONSE_COLUMN','zh','RESPONSE_CODE','响应代码',NULL,2,'N'),('459','MM_RESPONSE_COLUMN','zh','RESPONSE_TYPE','响应类型',NULL,3,'N'),('45cf137d-92fa-4ef7-9bd1-dafcc7bdee5c','POSTADDR_STATUS','zh','POSTADDR_ACTIVITY','有效','',1,'N'),('45EC74D1-F21C-47B3-BF03-D667C97E5F6E','LOV_CITY','zh','遵义市','Z-遵义市','贵州省',390,'Y'),('45F835AB-B842-440B-8D95-BE4B106E3089','LOV_CITY','zh','宜宾市','Y-宜宾市','四川省',350,'Y'),('45FC08B0-6276-44BD-B440-72157B7B3C1A','LOV_CITY','zh','珠海市','Z-珠海市','广东省',385,'Y'),('46','MC_CUS_IFCOMTEL','zh','0','接受公司电话',NULL,1,'N'),('460','MM_RESPONSE_COLUMN','zh','DESCRIPTION','响应描述',NULL,4,'N'),('461','MM_RESPONSE_COLUMN','zh','CUSTOMER_NUM','客户编号',NULL,5,'N'),('462','MM_RESPONSE_COLUMN','zh','CUSTOMER_NAME','客户名称',NULL,6,'N'),('463','MM_RESPONSE_COLUMN','zh','CAMPAIGN_NAME','营销活动名称',NULL,7,'N'),('464','MM_RESPONSE_COLUMN','zh','CAMPAIGN_CODE','营销活动编码',NULL,8,'N'),('464bf493-f647-41ef-bfff-98dd29369917','INCOME_INTERVAL_EXT','zh','(INCOME >2000 and INCOME<=3000)','2000~3000','',2,NULL),('465','MM_RESPONSE_COLUMN','zh','DELIVERY_NAME','Delivery名称',NULL,9,'N'),('466','MM_RESPONSE_COLUMN','zh','DELIVERY_CODE','Delivery编码',NULL,10,'N'),('467','MM_RESPONSE_COLUMN','zh','RESPONSE_DATE','响应日期',NULL,11,'N'),('467982CC-05ED-4F5E-A8C6-2E175D3F4F94','LOV_CITY','zh','江门市','J-江门市','广东省',141,'Y'),('47','MC_CUS_IFCOMTEL','zh','1','不接受公司电话',NULL,2,'N'),('473F525E-C9F6-454F-9776-DFB9D46A4334','LOV_CITY','zh','呼伦贝尔市','H-呼伦贝尔市','内蒙古自治区',116,'Y'),('48','MC_CUS_SPARETELSTA','zh','0','备份电话状态未知',NULL,1,'N'),('481','VOCATION_TYPE','zh','M_COSTUME','服装',NULL,2,'Y'),('482','VOCATION_TYPE','zh','M_BIOTECHNOLOGY','生物技术',NULL,3,'Y'),('483','VOCATION_TYPE','zh','M_BIOTECHNOLOGYX','化学化工',NULL,4,'Y'),('484','VOCATION_TYPE','zh','M_CHEMISTRY','通讯',NULL,5,'Y'),('485','VOCATION_TYPE','zh','M_COMMUNICATIONS','建筑',NULL,6,'Y'),('486','VOCATION_TYPE','zh','M_CONSTRUCT','咨询',NULL,7,'Y'),('487','VOCATION_TYPE','zh','M_CONSULT','教育',NULL,8,'Y'),('488','VOCATION_TYPE','zh','M_EDUCATION','电子',NULL,9,'Y'),('489','VOCATION_TYPE','zh','M_ELECTRON','能源',NULL,10,'Y'),('489eef43-ce69-4f4f-b645-3def50a666ce','MEMBER_CARD_TIER','zh','MEMBER_CARD_TIER_TK','铜卡','',2,'N'),('49','MC_CUS_SPARETELSTA','zh','1','备份电话状态有效',NULL,2,'N'),('490','VOCATION_TYPE','zh','M_ENERGY','工程设计',NULL,11,'Y'),('491','MM_SEG_IF','zh','1','是',NULL,1,'N'),('492','MM_SEG_IF','zh','0','否',NULL,2,'N'),('4951a43d-58d7-4934-b163-cf92c6475258','INCOME_INTERVAL_EXT','zh','(INCOME IS NULL or INCOME<=2000)','2千以下','',1,NULL),('496','MM_RESPONSE_TYPE','zh','CAMPAIGN','Campaign级别响应',NULL,1,'N'),('497','MM_RESPONSE_TYPE','zh','DELIVERY','Delivery级别响应',NULL,2,'N'),('49917DFD-919D-4604-8FE8-55BDAD0EE7AE','LOV_CITY','zh','大庆市','D-大庆市','黑龙江省',57,'Y'),('49B8811C-E5C9-4DA5-9737-B49F4748B2B0','LOV_CITY','zh','黑河市','H-黑河市','黑龙江省',111,'Y'),('4A27F773-10A2-4188-862B-B6ABF9CBD8DC','LOV_CITY','zh','贵港市','G-贵港市','广西壮族自治区',89,'Y'),('4A45AA8F-1398-4E59-B611-E90345DC1270','ELEMENT_FIELD','zh','nick','昵称','NICK',0,'N'),('4AC06391-EBBE-4E57-8852-4009A2E5C2FF','LOV_CITY','zh','阿拉尔市','A-阿拉尔市','新疆维吾尔自治区',3,'Y'),('4B584A8E-CC90-4A07-86F5-5B701947AD32','LOV_CITY','zh','彰化县','Z-彰化县','台湾省',372,'Y'),('4C13CDC5-FB48-4595-B649-367F42B17EE1','LOV_CITY','zh','乌海市','W-乌海市','内蒙古自治区',302,'Y'),('4C79BDF0-AD78-4BD0-B6B5-3977C3487F5C','LOV_CITY','zh','七台河市','Q-七台河市','黑龙江省',224,'Y'),('4CA846FE-92FF-430C-A1DA-B605DC65B9DB','PROCEDURE_STATUS','zh','1','启用','',1,'N'),('4d0528bd-79f4-4443-8734-d88cafcf84f6','TRANS_TYPE','zh','M_ACCRUAL','购买','',1,'N'),('4DB32D48-4C93-458A-9742-B03117E949E0','MM_RE_RESPONSE_TYPE','zh','UNABLE_ATTEND','无法参加',NULL,17,'N'),('4DF80B05-B3B8-46CB-97DC-17E88D9B3704','RESPOSE_FIELD','zh','campaignCode','营销活动编码','CAMPAIGN_CODE',0,'N'),('4e3ae66f-6063-4696-a665-5e7751fd85a3','ATTR_ATTRTYPE','zh','M_MEMBERTIER','会员等级','',8,'N'),('4e9bce8b-32c3-4000-94d0-e610d5660cbb','TASK_STATUS','zh','TASK_STATUS_RUNNING','运行中','',2,'N'),('5','MM_QUERY_TYPE','zh','<=','小于等于','',5,'N'),('50','MC_CUS_SPARETELSTA','zh','2','备份电话状态无效',NULL,3,'N'),('501                             ','EVENT_TYPE','zh','M_INBOUND','CALL-INBOUND','',1,'N'),('5010                            ','EVENT_CATEGORY','zh','M_INVITE','邀约','M_OUTBOUND',8,'N'),('5011                            ','EVENT_CATEGORY','zh','M_SURVEY','问卷调查','M_OUTBOUND',9,'N'),('5012                            ','EVENT_SOURCE','zh','M_GUSTOMER','客户','',2,'N'),('5013                            ','EVENT_SOURCE','zh','M_MEMBER','会员',NULL,2,'N'),('5014                            ','EVENT_SOURCE','zh','M_BRAND','品牌',NULL,3,'N'),('5015                            ','EVENT_SOURCE','zh','M_STORE','门店',NULL,4,'N'),('5016                            ','EVENT_SOURCE','zh','M_UNKNOW','未知',NULL,5,'N'),('5017                            ','EVENT_STATE','zh','M_BEFORE_ASSIGN','未分配','M_OUTBOUND',1,'N'),('5018                            ','EVENT_STATE','zh','M_INBOUND_UNSOLVED','待解决','M_INBOUND',2,'N'),('502                             ','EVENT_TYPE','zh','M_OUTBOUND','CALL-OUTBOUND','',2,'N'),('5020                            ','EVENT_STATE','zh','M_UPGRADE','升级','M_INBOUND',4,'N'),('5021                            ','EVENT_STATE','zh','M_INBOUND_SOLVED','已解决','M_INBOUND',5,'N'),('5023                            ','EVENT_STATE','zh','M_CANCEL','取消','M_OUTBOUND',7,'N'),('5024                            ','CALL_STATE','zh','M_SUCCESS_CALL','成功接听','M_OUTBOUND',1,'N'),('5025                            ','CALL_STATE','zh','M_BUSY_LINE','忙音','M_OUTBOUND',2,'N'),('5026                            ','CALL_STATE','zh','M_DEAD_NUMBER','空号','M_OUTBOUND',3,'N'),('5027                            ','CALL_STATE','zh','M_NO_ANSWER','无人接听','M_OUTBOUND',4,'N'),('5028                            ','CALL_STATE','zh','M_REJECT','拒接应答','M_OUTBOUND',5,'N'),('5029                            ','CALL_STATE','zh','M_NO_PERSON','接通无此人','M_OUTBOUND',6,'N'),('503                             ','EVENT_CATEGORY','zh','M_CONSULT','咨询','M_INBOUND',1,'N'),('5030                            ','CALL_STATE','zh','M_NO_KEY_MAN','无关键人','M_OUTBOUND',7,'N'),('5031                            ','CALL_STATE','zh','M_LATER_CALL','稍后致电','M_OUTBOUND',8,'N'),('5032                            ','CALL_STATE','zh','M_OTHERS','其它','M_OUTBOUND',9,'N'),('5033                            ','BUSINESS_STATE','zh','M_SUCCESSED','成功',NULL,1,'N'),('5034                            ','BUSINESS_STATE','zh','M_FAILED','失败',NULL,2,'N'),('5035                            ','SR_TYPE','zh','M_SR_CONSULT','咨询',NULL,1,'N'),('5036                            ','SR_TYPE','zh','M_SR_COMPLAIN','投诉',NULL,2,'N'),('5037                            ','SR_TYPE','zh','M_SR_EXCHANGE_GIFT','兑礼',NULL,3,'N'),('5038                            ','SR_TYPE','zh','M_SR_INFO_MODIFY','信息修改',NULL,4,'N'),('5039                            ','SR_TYPE','zh','M_SR_CUSTOMER_MERGE','客户合并',NULL,5,'N'),('503a492b-de0e-4dee-bfe4-80c1fe9e6105','PRODUCT_TYPE','zh','M_COUPON','Coupon','',3,'Y'),('503C583A-2BA0-4B59-AED2-CF31160CAD46','ELEMENT_FIELD','zh','postCode','邮编','POSTALCODE',0,'N'),('503E72C4-E0E3-4C2A-AEB4-F54BA60FA6CE','LOV_CITY','zh','乌鲁木齐市','W-乌鲁木齐市','新疆维吾尔自治区',304,'Y'),('504                             ','EVENT_CATEGORY','zh','M_COMPLAIN','投诉','M_INBOUND',2,'N'),('5040                            ','SR_SUB_TYPE','zh','M_SR_PACKAGE','产品包装','M_SR_CONSULT',1,'N'),('5041                            ','SR_SUB_TYPE','zh','M_SR_QUALITY','产品质量','M_SR_CONSULT',2,'N'),('5042                            ','SR_SUB_TYPE','zh','M_SR_SERVICE','会员服务','M_SR_CONSULT',3,'N'),('5043                            ','SR_SUB_TYPE','zh','M_SR_ACTIVITY','市场活动','M_SR_CONSULT',4,'N'),('5044                            ','SR_STATE','zh','M_SR_PENDING','待定',NULL,1,'N'),('5045                            ','SR_STATE','zh','M_SR_UPGRADE','升级',NULL,2,'N'),('5046                            ','SR_STATE','zh','M_SR_SOLVED','已解决',NULL,3,'N'),('5047                            ','INVITE_STATE','zh','M_INVITE_ACTIVE','活动',NULL,1,'N'),('5048                            ','INVITE_STATE','zh','M_INVITE_CLOSED','关闭',NULL,2,'N'),('5049                            ','INVITE_STATE','zh','M_INVITE_CANCEL','取消',NULL,3,'N'),('505                             ','EVENT_CATEGORY','zh','M_EXCHANGE_GIFT','兑礼','M_INBOUND',3,'N'),('5050                            ','PERIOD_STATE','zh','M_PERIOD_ACTIVE','活动',NULL,1,'N'),('5051                            ','PERIOD_STATE','zh','M_PERIOD_CLOSED','关闭',NULL,2,'N'),('5052                            ','PERIOD_STATE','zh','M_PERIOD_CANCEL','取消',NULL,3,'N'),('5053                            ','EXPORT_FIELD','zh','M_EXPORT_FIELD_COUNTER','柜台',NULL,0,'N'),('5054                            ','EXPORT_FIELD','zh','M_EXPORT_FIELD_WAREHOUSE','仓库',NULL,0,'N'),('5055                            ','EXPORT_FIELD','zh','M_EXPORT_FIELD_EXPRESS','快递',NULL,0,'N'),('5056                            ','TASK_TYPE','zh','M_TASK_INVITE','邀约',NULL,1,'N'),('5057                            ','TASK_TYPE','zh','M_TASK_SURVEY','问卷调查',NULL,2,'N'),('5058                            ','TASK_TYPE','zh','M_TASK_DATA_ENTRY','数据录入',NULL,3,'N'),('5059                            ','TASK_STATE','zh','M_TASK_BEFORE_ASSIGN','待分配',NULL,1,'N'),('506                             ','EVENT_CATEGORY','zh','M_INFO_SEARCH','信息查询','M_INBOUND',4,'N'),('5060                            ','TASK_STATE','zh','M_TASK_AFTER_ASSIGN','已分配',NULL,2,'N'),('5061                            ','TASK_STATE','zh','M_TASK_FINISH','已完成',NULL,3,'N'),('5062                            ','MESSAGE_TYPE','zh','M_MESSAGE_LIGHT','跑马灯',NULL,1,'N'),('5063                            ','MESSAGE_TYPE','zh','M_MESSAGE_BOARD','公告栏',NULL,2,'N'),('5064                            ','ANSWER_TYPE','zh','M_ANSWER_RADIO','单选框',NULL,1,'N'),('5065                            ','ANSWER_TYPE','zh','M_ANSWER_CHECKBOX','复选框',NULL,2,'N'),('5066                            ','ANSWER_TYPE','zh','M_ANSWER_INPUT','输入框',NULL,3,'N'),('5067','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_GT','柜台','M_COMPLAIN',1,'N'),('5068','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_ZX','坐席','M_COMPLAIN',2,'N'),('5069','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_SHFW','售后服务','M_COMPLAIN',3,'N'),('507                             ','EVENT_CATEGORY','zh','M_INFO_MODIFY','信息修改','M_INBOUND',5,'N'),('5070','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_CP','产品','M_COMPLAIN',4,'N'),('5071','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_FW','服务','M_CONSULT',5,'N'),('5072','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_CHP','产品','M_CONSULT',6,'N'),('5073','EVENT_CHILD_CATEGORY','zh','EVENT_CHILD_CATEGORY_LP','礼品','M_CONSULT',7,'N'),('50759827-EB79-4CEE-902B-E477087699FD','LOV_CITY','zh','景德镇市','J-景德镇市','江西省',152,'Y'),('508                             ','EVENT_CATEGORY','zh','M_CUSTOMER_MERGE','客户合并','M_INBOUND',6,'N'),('509                             ','EVENT_CATEGORY','zh','M_REPLY','回访','M_OUTBOUND',7,'N'),('50d450d3-11ed-4d42-b0e7-5e150f8bb833','PROMOTION_SOURCE','en','M_ORDER_POINT','Order to Points','',5,'Y'),('50DFF423-657D-45FB-9C90-3ECAE7349FEB','LOV_CITY','zh','鹰潭市','Y-鹰潭市','江西省',356,'Y'),('51','MC_CUS_IFSPARETEL','zh','0','接受备份电话',NULL,1,'N'),('510','MM_PRG_TYPE','zh','news','新品上市',NULL,1,'N'),('5100','EVENT_STATE','zh','M_EMAIL_SOLVED','已解决','M_EMAIL',9,'N'),('5101','EVENT_STATE','zh','M_EMAIL_UNSOLVED','待解决','M_EMAIL',8,'N'),('511','MM_PRG_TYPE','zh','birthday','生日促销',NULL,2,'N'),('512','MM_PRG_TYPE','zh','festivals','节日促销',NULL,3,'N'),('513','MM_PRG_TYPE','zh','gwp','GWP（买就送）',NULL,4,'N'),('514','MM_PRG_TYPE','zh','cross-selling','交叉销售',NULL,5,'N'),('515','MM_PRG_TYPE','zh','up-selling','向上销售',NULL,6,'N'),('516','MM_PRG_TYPE','zh','loyalty','忠诚度',NULL,7,'N'),('517','MM_PRG_TYPE','zh','roadshow','路演',NULL,8,'N'),('518','MM_PRG_TYPE','zh','recommendation','推介',NULL,9,'N'),('519','MM_TARGERUSER','zh','customerlist','正式',NULL,1,'Y'),('51b3dcd4-6a55-412e-9dea-c203c6693cea','PROMOTION_TYPE','zh','M_DISQUALIFY','退会','',10,'N'),('51B5615B-82E2-49D9-8E1C-97FCF2DB38A7','LOV_CITY','zh','鄂州市','E-鄂州市','湖北省',72,'Y'),('51EDD97C-D895-4DA7-A969-A922CC511B89','LOV_CITY','zh','岳阳市','Y-岳阳市','湖南省',363,'Y'),('52','MC_CUS_IFSPARETEL','zh','1','不接受备份电话',NULL,2,'N'),('520','MM_TARGERUSER','zh','seedlist','种子',NULL,2,'Y'),('521','MM_TARGERUSER','zh','testlist','测试',NULL,3,'Y'),('5210E833-604C-4851-9A01-A6B31C19A244','LOV_CITY','zh','新北市','X-新北市','台湾省',328,'Y'),('522','MM_ELEMENTLIST_COLUMN','zh','FULL_NAME','姓名全称',NULL,1,'N'),('523','MM_ELEMENTLIST_COLUMN','zh','GENDER','性别',NULL,2,'N'),('524','MM_ELEMENTLIST_COLUMN','zh','COUNTRY','国籍',NULL,3,'N'),('524C2B1C-773C-41C4-A947-4FC54156F2AE','SOURCE_WEBSITE','zh','京东','京东',NULL,2,'y'),('525','MM_ELEMENTLIST_COLUMN','zh','BIRTHDAY','生日',NULL,4,'N'),('526','MM_ELEMENTLIST_COLUMN','zh','ID_TYPE','证件类型',NULL,5,'N'),('527','MM_ELEMENTLIST_COLUMN','zh','ID_CARD','证件号码',NULL,6,'N'),('528','MM_ELEMENTLIST_COLUMN','zh','INDUSTRY','所属行业',NULL,7,'N'),('528831B6-EEF0-486C-ABDF-87E07DEC8E36','CUSTOMER_FIELD','zh','idType','证件类型','ID_TYPE',0,'N'),('529','MM_ELEMENTLIST_COLUMN','zh','DUTY','职位',NULL,8,'N'),('52A3F087-E8E6-4EE4-9949-FDC0E26F1D2C','LOV_CITY','zh','大连市','D-大连市','辽宁省',56,'Y'),('52EC536E-3E5D-443D-B952-A55EE741887F','PRIMARY_PRODUCT_CATEGORY','zh','PT_13','半身裙',NULL,1,'N'),('52F4C19D-224E-4206-A793-62D8DCF887F6','LOV_CITY','zh','湛江市','Z-湛江市','广东省',368,'Y'),('53','MC_CUS_EMAILSTA','zh','0','电子邮件状态未知',NULL,1,'N'),('530','MM_ELEMENTLIST_COLUMN','zh','HOPPY','兴趣爱好',NULL,9,'N'),('531','MM_ELEMENTLIST_COLUMN','zh','EDUCATION','教育水平',NULL,10,'N'),('532','MM_ELEMENTLIST_COLUMN','zh','INCOME','月收入状况',NULL,11,'N'),('533','MM_ELEMENTLIST_COLUMN','zh','SOURCE','客户信息来源',NULL,12,'N'),('5339D2EC-0B2F-4E36-B8D4-4A097C5BC614','LOV_CITY','zh','上饶市','S-上饶市','江西省',251,'Y'),('534','MM_ELEMENTLIST_COLUMN','zh','MOBILE_TEL','移动电话',NULL,13,'N'),('535','MM_ELEMENTLIST_COLUMN','zh','HOME_TEL','家庭电话',NULL,14,'N'),('53504A09-629A-41B4-ADFB-CF8B763B067A','LOV_CITY','zh','忻州市','X-忻州市','山西省',327,'Y'),('536','MM_ELEMENTLIST_COLUMN','zh','COMPANY_TEL','公司电话',NULL,15,'N'),('536cbd69-34bb-4e73-8908-179056286c76','DATAENTER_STATE','zh','M_DATAENTER_AFTER_ASSIGN','已分配','',2,'N'),('537','MM_ELEMENTLIST_COLUMN','zh','SPARE_TEL','备用电话',NULL,16,'N'),('538','MM_ELEMENTLIST_COLUMN','zh','EMAIL','Email',NULL,17,'N'),('539','MM_ELEMENTLIST_COLUMN','zh','POST_PROVINCE','邮寄省市',NULL,18,'N'),('54','MC_CUS_EMAILSTA','zh','1','电子邮件状态有效',NULL,2,'N'),('540','MM_ELEMENTLIST_COLUMN','zh','POST_CITY','邮寄城市',NULL,19,'N'),('541','MM_ELEMENTLIST_COLUMN','zh','POST_ADDRESS','邮寄地址',NULL,20,'N'),('542','MM_ELEMENTLIST_COLUMN','zh','POST_CODE','邮政编码',NULL,21,'N'),('543','MM_GROUPLIST_ITEM','zh','FULL_NAME','客户名称',NULL,1,'N'),('544','MM_TREATMENT_VARIABLE2','zh','account_code','客户编号','account',4,'N'),('545','MM_TREATMENT_VARIABLE3','zh','$$data.account_code$$','$$data.account_code$$','account_code',5,'N'),('545A9A6A-D429-46D5-8587-29B5A7081D97','PRIMARY_PRODUCT_CATEGORY','zh','PT_9','针织衫',NULL,1,'N'),('546','MM_TREATMENT_VARIABLE-','zh','member','会员','account',6,'N'),('547','MM_TREATMENT_VARIABLE2','zh','account_birthday','生日','account-',7,'N'),('548','MM_TREATMENT_VARIABLE2','zh','account_mobile','移动电话','account-',8,'N'),('549','MM_TREATMENT_VARIABLE2','zh','account_hometel','家庭电话','account-',9,'N'),('54d29548-462a-445e-9a3e-87dd0ff2f9c8','MEMBER_CARD_TIER','zh','MEMBER_CARD_TIER_YK','银卡','',3,'N'),('55','MC_CUS_EMAILSTA','zh','2','电子邮件状态无效',NULL,3,'N'),('550','MM_TREATMENT_VARIABLE2','zh','account_camtel','公司电话','account-',10,'N'),('551','MM_TREATMENT_VARIABLE2','zh','account_mail','电子邮箱','account-',11,'N'),('552','MM_TREATMENT_VARIABLE2','zh','account_province','邮寄地址-省/（直辖）市','account-',12,'N'),('553','MM_TREATMENT_VARIABLE2','zh','account_city','邮寄地址-城市','account-',13,'N'),('553B93A3-227B-408D-8E85-A3E84EF8F37C','LOV_CITY','zh','茂名市','M-茂名市','广东省',194,'Y'),('554','MM_TREATMENT_VARIABLE2','zh','account_address','邮寄地址-地址','account-',14,'N'),('555','MM_TREATMENT_VARIABLE2','zh','account_postcode','邮寄地址-邮编','account-',15,'N'),('556','MM_TREATMENT_VARIABLE2','zh','account_store','注册门店','account-',16,'N'),('557','MM_TREATMENT_VARIABLE2','zh','account_registered','注册时间','account-',17,'N'),('557b2cd1-8ea0-48fa-8e72-6fc475c7a517','CUSTOMER_POSITION','zh','CUSTOMER_POSITION_MAJORDOMO','总监','',6,'Y'),('558','MM_TREATMENT_VARIABLE3','zh','$$data.account_code$$','$$data.account_code$$','account_code',18,'N'),('559','MM_TREATMENT_VARIABLE3','zh','$$data.account_name$$','$$data.account_name$$','account_name',19,'N'),('55c07e9c-b0cf-4a99-9028-4e04d75b7369','POSITION_TYPE','zh','M_MARKETER','市场执行人员','',3,NULL),('55DBE9AC-B341-4A69-A33F-FD7FDD717715','Budget_Type','zh','Budget_Type_PERSONF','人工费','',4,'Y'),('55DDC30B-550C-4C14-815E-7915D4C167FF','LOV_CITY','zh','恩施土家族苗族自治州','E-恩施土家族苗族自治州','湖北省',73,'Y'),('55F1D1D8-CC29-4644-B99B-BE93C9894BAF','LOV_CITY','zh','衡水市','H-衡水市','河北省',112,'Y'),('55ff8233-e9e5-4005-a766-ececaaed8871','KEYDATATRACE_MODULE','zh','M_ORDER','订单','',3,'N'),('56','MC_CUS_IFEMAIL','zh','0','接受电子邮件',NULL,1,'N'),('560','MM_TREATMENT_VARIABLE3','zh','$$data.account_birthday$$','$$data.account_birthday$$','account_birthday',20,'N'),('561','MM_TREATMENT_VARIABLE3','zh','$$data.account_mobile$$','$$data.account_mobile$$','account_mobile',21,'N'),('562','MM_TREATMENT_VARIABLE3','zh','$$data.account_hometel$$','$$data.account_hometel$$','account_hometel',22,'N'),('563','MM_TREATMENT_VARIABLE3','zh','$$data.account_camtel$$','$$data.account_camtel$$','account_camtel',23,'N'),('564','MM_TREATMENT_VARIABLE3','zh','$$data.account_mail$$','$$data.account_mail$$','account_mail',24,'N'),('564ecd1d-2691-4750-8855-063685ec8cb4','TOTAL_ATTRIBUTE_UOM','zh','M_YEAR','年','',1,'N'),('565','MM_TREATMENT_VARIABLE3','zh','$$data.account_province$$','$$data.account_province$$','account_province',25,'N'),('566','MM_TREATMENT_VARIABLE3','zh','$$data.account_city$$','$$data.account_city$$','account_city',26,'N'),('567','MM_TREATMENT_VARIABLE3','zh','$$data.account_address$$','$$data.account_address$$','account_address',27,'N'),('568','MM_TREATMENT_VARIABLE3','zh','$$data.account_postcode$$','$$data.account_postcode$$','account_postcode',28,'N'),('569','MM_TREATMENT_VARIABLE3','zh','$$data.account_store$$','$$data.account_store$$','account_store',29,'N'),('56F221B8-0924-44F2-8285-3FA1770F9BC2','CUSTOMER_TYPE','zh','C','C商家',NULL,2,'N'),('57','MC_CUS_IFEMAIL','zh','1','不接受电子邮件',NULL,2,'N'),('570','MM_TREATMENT_VARIABLE3','zh','$$data.account_registered$$','$$data.account_registered$$','account_registered',30,'N'),('571','MM_TREATMENT_VARIABLE2','zh','membership_time','入会时间','member',31,'N'),('572','MM_TREATMENT_VARIABLE2','zh','member_begin','会员期开始','member',32,'N'),('573','MM_TREATMENT_VARIABLE2','zh','member_end','会员期结束','member',33,'N'),('574','MM_TREATMENT_VARIABLE2','zh','member_type','会员等级分类','member',34,'N'),('575','MM_TREATMENT_VARIABLE2','zh','member_rank','会员等级','member',35,'N'),('576','MM_TREATMENT_VARIABLE2','zh','member_pointstype','积分类型','member',36,'N'),('577','MM_TREATMENT_VARIABLE2','zh','member_pointall','总积分','member',37,'N'),('578','MM_TREATMENT_VARIABLE2','zh','member_pointalluse','总可用积分','member',38,'N'),('579','MM_TREATMENT_VARIABLE2','zh','member_pointthis','本期累计积分','member',39,'N'),('58','MC_CUS_POSTSTA','zh','0','邮寄状态未知',NULL,0,'N'),('580','MM_TREATMENT_VARIABLE2','zh','member_pointuse','本期可用积分','member',40,'N'),('581','MM_TREATMENT_VARIABLE2','zh','member_pointfreeze','本期冻结积分','member',41,'N'),('582','MM_TREATMENT_VARIABLE2','zh','member_pointlast','上期剩余积分','member',42,'N'),('583','MM_TREATMENT_VARIABLE3','zh','$$data.membership_time$$','$$data.membership_time$$','membership_time',43,'N'),('5835FBD1-AA56-45C5-8F8B-FAFBBED8890C','LOV_CITY','zh','崇左市','C-崇左市','广西壮族自治区',51,'Y'),('584','MM_TREATMENT_VARIABLE3','zh','$$data.member_begin$$','$$data.member_begin$$','member_begin',44,'N'),('585','MM_TREATMENT_VARIABLE3','zh','$$data.member_end$$','$$data.member_end$$','member_end',45,'N'),('586','MM_TREATMENT_VARIABLE3','zh','$$data.member_type$$','$$data.member_type$$','member_type',46,'N'),('587','MM_TREATMENT_VARIABLE3','zh','$$data.member_rank$$','$$data.member_rank$$','member_rank',47,'N'),('588','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointstype$$','$$data.member_pointstype$$','member_pointstype',48,'N'),('589','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointall$$','$$data.member_pointall$$','member_pointall',49,'N'),('58C9ECB5-44B2-443C-9CA0-9AB91EDAB72F','LOV_CITY','zh','白沙黎族自治县','B-白沙黎族自治县','海南省',17,'Y'),('58E55E96-CF47-4385-9883-A8BC71F727FD','ORDER_FIELD','zh','order.type','交易类型','TYPE',0,'N'),('59','MC_CUS_POSTSTA','zh','1','邮寄状态有效',NULL,1,'N'),('590','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointalluse$$','$$data.member_pointalluse$$','member_pointalluse',50,'N'),('591','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointthis$$','$$data.member_pointthis$$','member_pointthis',51,'N'),('592','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointuse$$','$$data.member_pointuse$$','member_pointuse',52,'N'),('593','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointfreeze$$','$$data.member_pointfreeze$$','member_pointfreeze',53,'N'),('593A8ED6-CB73-4B42-9E78-E624BA5CFA05','LOV_CITY','zh','淮南市','H-淮南市','安徽省',123,'Y'),('593CEA5B-2620-4216-B553-13DD07CCAD1A','LOV_CITY','zh','锦州市','J-锦州市','辽宁省',147,'Y'),('594','MM_TREATMENT_VARIABLE3','zh','$$data.member_pointlast$$','$$data.member_pointlast$$','member_pointlast',54,'N'),('594A9B42-89B3-448C-B4BF-04385748C695','LOV_CITY','zh','淮北市','H-淮北市','安徽省',122,'Y'),('596','MM_GROUPLIST_ITEM','zh','gender','性别',NULL,2,'N'),('597','MM_GROUPLIST_ITEM','zh','account_store','注册门店',NULL,3,'N'),('598','MM_GROUPLIST_ITEM','zh','account_registered','注册时间',NULL,4,'N'),('5984EC2E-D657-44DF-8E8E-96156BA5EA1B','CUSTOMER_FIELD','zh','nick','客户昵称','NICK',0,'N'),('599','MM_EDM_RESPONSE','zh','OPEN_EMAIL','打开电子邮件',NULL,1,'N'),('5999D80F-C324-46EB-A138-4B4A539BF6F3','LOV_CITY','zh','吉林市','J-吉林市','吉林省',132,'Y'),('59B7ABA6-4710-4611-B1FE-223D800E6DA9','LOV_CITY','zh','丽江市','L-丽江市','云南省',169,'Y'),('59C46A3E-F55A-4F84-B710-726B74069EA1','LOV_PROVINCE','zh','海外','H-海外','',9,'Y'),('59E2F85D-173C-4786-B1DC-E5290801B87C','CAMPAIGN_ROI_ANALYSIS','zh','campaignName','营销活动','',1,'N'),('5A8DDB9F-AD0B-4DFC-B035-96E0CEE58695','LOV_CITY','zh','蚌埠市','B-蚌埠市','安徽省',21,'Y'),('5AB976B2-320A-4DAF-908B-B81A23FC96E3','LOV_CITY','zh','平凉市','P-平凉市','甘肃省',218,'Y'),('5ac47cf1-e443-4da0-b241-04d041379762','SKIP_TYPE','en','5','sensitive ','',5,'N'),('5B7FCC43-45B8-485B-9891-563619CC6E5B','LOV_CITY','zh','九江市','J-九江市','江西省',153,'Y'),('5be0b338-847d-4b02-9a05-7b4a9c9b6724','TASKPARAM_TYPE','zh','TASKPARAM_TYPE_NUMBER','数字','',4,'N'),('5C4FF396-30AC-4E6A-A2CD-5C39F7251B76','LOV_CITY','zh','山南地区','S-山南地区','西藏自治区',245,'Y'),('5CE9970E-D8D8-4B84-ABA8-0C58B3F980DD','LOV_CITY','zh','唐山市','T-唐山市','河北省',281,'Y'),('5D1614B5-BB2D-4B1A-BBF9-9CC4478985A8','LOV_CITY','zh','曲靖市','Q-曲靖市','云南省',237,'Y'),('5D5ECFD5-F090-4CB9-94A6-89DDDB98E0C1','LOV_CITY','zh','海东地区','H-海东地区','青海省',96,'Y'),('5D67F6E4-5FD8-4999-B5E9-B24200C3FFB9','PRODUCT_FIELD','zh','productAttrs','商品属性','PRODUCT_ATTRS',0,'N'),('5E520D9E-53CF-407D-B8AC-089DE3CAA49E','TRATE_STATUS','zh','K','已分派（发货中）',NULL,1,'N'),('5E7DAF50-AF2F-4D94-9272-74F9D47F226F','LOV_CITY','zh','潍坊市','W-潍坊市','山东省',297,'Y'),('5f2a9568-3210-45f0-a88e-7f445c62d620','CUSTOMER_SOURCE','zh','M_OTHERS','其他','',4,'N'),('5f3e5b8d-03bd-4426-9dd3-5a776ae00987','POINTS_DETAIL_TYPE','zh','M_ADJUST','积分调整','',7,'N'),('5fe7610a-f147-45b6-a7a0-48c8c4241ea8','NATIONALITY','zh','M_USA','D-德国','',2,'Y'),('5FF59CBB-1102-4BEA-AD8D-ACB23D1B399A','LOV_CITY','zh','杭州市','H-杭州市','浙江省',102,'Y'),('6','MM_QUERY_TYPE1','zh','!=','不等于','',6,'N'),('60','MC_CUS_POSTSTA','zh','2','邮寄状态无效',NULL,2,'N'),('600','MM_EDM_RESPONSE','zh','OPEN_URL','点击电子邮件中链接',NULL,2,'N'),('601','MM_EDM_RESPONSE','zh','SEND_OK','电子邮件发送成功',NULL,3,'N'),('602','MM_EDM_RESPONSE','zh','INVALID_MAIL','无效的电子邮件地址',NULL,4,'N'),('603','MM_EDM_RESPONSE','zh','REJECT','电子邮件被拒收',NULL,5,'N'),('603BB0C0-0658-450F-93B5-96A6B068DF5D','LOV_CITY','zh','五家渠市','W-五家渠市','新疆维吾尔自治区',309,'Y'),('604','MM_EDM_RESPONSE','zh','ALLNOTSEND','电子邮件发送失败',NULL,6,'N'),('6040054e-6d6e-4c52-9b69-c2554dde7aeb','PROMOTION_TYPE','zh','M_GIFT','赠分','',9,'N'),('607723A3-177C-426D-BA92-496FED354091','LOV_CITY','zh','西宁市','X-西宁市','青海省',314,'Y'),('60D06BCF-F426-4506-8E5E-493C37992D2B','ANALYTICS_CUST_DIM','zh','CITY','客户所在城市分布','',3,'N'),('61','MC_CUS_POSTCODESTA','zh','0','邮政编码状态未知',NULL,1,'N'),('612B831C-AC61-47D6-8BB4-CCB167ACE5A6','RESPOSE_FIELD','zh','deliveryCode','渠道编码','DELIVERY_CODE',0,'N'),('6135f414-a3f0-4026-9b33-f72d4782328e','CUSTOMER_CAREER','zh','CUSTOMER_CAREER_COMPUTER','计算机业','',2,'N'),('615DC663-1603-48BB-8BE4-64DF913D0C6D','SOURCE_WEBSITE','zh','淘宝分销','淘宝分销',NULL,8,'y'),('618B306C-CAE5-4A0A-B3B4-092A91E5222F','PROCEDURE_STATUS','zh','0','暂停','',2,'N'),('61E508FE-67A0-4F02-B70A-CECB51C808B1','ELEMENT_FIELD','zh','consumerProtection','是否参加消保','CONSUMER_PROTECTION',0,'N'),('61E539DD-3789-4369-B671-E58808599A33','LOV_CITY','zh','来宾市','L-来宾市','广西壮族自治区',162,'Y'),('62','MC_CUS_POSTCODESTA','zh','1','邮政编码状态有效',NULL,2,'N'),('6208E852-D7F3-44FF-84BB-C8659EB87944','LOV_CITY','zh','临沂市','L-临沂市','山东省',181,'Y'),('6218be37-e6b3-4a25-85dc-f1fe4170ae97','SKIP_TYPE','zh','1','干性','',1,'N'),('63','MC_CUS_POSTCODESTA','zh','2','邮政编码状态无效',NULL,3,'N'),('63283833-0CF6-4EA5-BC11-099A63D6CAFB','SOURCE_WEBSITE','zh','拍拍','拍拍',NULL,5,'y'),('63504A94-434B-4B1C-B740-38E0774422A2','CUSTOMER_FIELD','zh','sourceid','客户数字id','SOURCEID',0,'N'),('6376D7F5-6F1D-4318-980F-398570567E81','LOV_CITY','zh','嘉义县','J-嘉义县','台湾省',139,'Y'),('63BB7EDC-4A98-4A35-A21F-A23BFF23D943','LOV_CITY','zh','承德市','C-承德市','河北省',47,'Y'),('63F8FA89-33BF-40BE-B6E6-509F4A00BD5E','LOV_CITY','zh','海西蒙古族藏族自治州','H-海西蒙古族藏族自治州','青海省',99,'Y'),('64','MC_CUS_IFPOST','zh','0','接受邮寄',NULL,1,'N'),('641c26c5-4e7c-48b8-872f-ef0d3eb2605b','MAX_ORDER_AMOUNT_EXT','zh','(MAX_ORDER_AMOUNT >4000 and MAX_ORDER_AMOUNT<=5000)','4000~5000','',4,NULL),('64B96A46-B078-4E56-B4F2-C5DB4C819118','LOV_CITY','zh','资阳市','Z-资阳市','四川省',387,'Y'),('65','MC_CUS_IFPOST','zh','1','不接受邮寄',NULL,2,'N'),('657365E9-80EC-42E8-927B-6281CED3BA48','CUSTOMER_FIELD','zh','address','详细地址','ADDRESS',0,'N'),('65C92F38-FCAF-4F79-BFB7-951FFB437C31','LOV_CITY','zh','十堰市','S-十堰市','湖北省',258,'Y'),('66','MC_CUS_COUNTRY','zh','0','中国',NULL,1,'N'),('6639050A-7CC7-4509-94FC-447FFA820D39','SOURCE_WEBSITE','zh','独立商城','独立商城',NULL,11,'y'),('666B3D0D-1C0E-4742-A5CC-16D21C12AEE6','LOV_CITY','zh','大兴安岭地区','D-大兴安岭地区','黑龙江省',59,'Y'),('666D1A7E-D416-4AFF-BA01-ED7A47B234BA','LOV_CITY','zh','黄石市','H-黄石市','湖北省',127,'Y'),('667E3C95-7993-41B2-A495-F3B0C8891E24','CUSTOMER_FIELD','zh','gender','性别','GENDER',0,'N'),('67','MC_CUS_COUNTRY','zh','1','德国',NULL,2,'N'),('671CE337-047A-4F83-BDC2-41BB3209A499','LOV_CITY','zh','邯郸市','H-邯郸市','河北省',100,'Y'),('67238A12-D187-4D7E-A350-1230640DBB15','LOV_CITY','zh','三明市','S-三明市','福建省',243,'Y'),('68','MC_CUS_COUNTRY','zh','2','其它',NULL,3,'N'),('69','MC_CUS_PROVINCE','zh','0','北京市',NULL,1,'N'),('6907bacb-1185-4ca1-914c-12b763997977','EMPLOYEE_TYPE','zh','EMPLOYEE_TYPE_MANAGE','管理人员','',2,'N'),('6919CA33-B1D7-4791-970F-1A8CA13B7EBB','ORDER_FIELD','zh','oriAmount','商品原价','ORI_AMOUNT',0,'N'),('6984F20B-BD00-4DE5-A7F6-5A41A8BA743F','LOV_CITY','zh','邵阳市','S-邵阳市','湖南省',253,'Y'),('6994370F-7EF2-4152-9E4C-5582D6865008','CUSTOMER_TYPE','zh','B','B商家',NULL,1,'N'),('69b3420c-ac92-4280-a120-fc304565cb77','TOTAL_ORDER_AMOUNT_EXT','zh','(MONEY >5000 AND MONEY<=10000)','5000~10000','',4,NULL),('6a642ff7-8fdb-43cd-a64d-26f324d44edb','ADJUST_ADJUSTTYPE','zh','M_PLUS','加','',1,'N'),('6A993F80-17C3-4624-8AA8-2D1687466DB1','LOV_CITY','zh','焦作市','J-焦作市','河南省',142,'Y'),('6B6503CC-E90D-493E-AD6E-DC19B1EE9DB7','LOV_CITY','zh','大理白族自治州','D-大理白族自治州','云南省',55,'Y'),('6B8B0041-CDF6-4A40-A1AC-DC07DFEF6920','LOV_CITY','zh','徐州市','X-徐州市','江苏省',337,'Y'),('6bc81bc9-3e18-4297-9fea-844a4f702f9f','MM_RE_RESPONSE_TYPE','zh','MMS_SEND_OK','彩信发送成功','',7,'N'),('6c68dbc3-bb38-4871-bd8e-5a32165f702d','PRODUCT_TYPE','zh','M_QUALITYGOODS','销售产品','',1,'Y'),('6C70B8D3-945A-4AA4-AA2E-11A63B787D05','LOV_CITY','zh','衡阳市','H-衡阳市','湖南省',113,'Y'),('6d12f105-54fe-404e-90ab-2f7fba807529','test1','en','411','4111','4112',1,NULL),('6D167347-EE5F-487E-8454-74A50A1F133E','LOV_CITY','zh','临沧市','L-临沧市','云南省',177,'Y'),('6d5b8420-9d10-4418-839d-339cfbeb4c87','CUSTOMER_ID_TYPE','zh','CUSTOMER_ID_IDC','身份证','',1,'N'),('6d7bc243-25f6-4da2-b3ad-2f202a522796','GIFT_ORDER_STATUS','zh','GIFT_ORDER_STATUS_CABINET','已到柜','',3,'N'),('6D903766-FB51-43E3-966F-A4B3DEFA45B4','RESPOSE_FIELD','zh','deliveryName','渠道名称','DELIVERY_NAME',0,'N'),('6dcd29ef-4950-46a6-a2bb-de0207a54dc0','CREDENTIALS_TYPE','zh','M_CREDENTIALS_OTHERS','其他','',6,'Y'),('6E207BE2-C24B-4303-9BEE-AC7F69AEF318','LOV_CITY','zh','新界','X-新界','香港特别行政区',329,'Y'),('6ED2FB1C-DBE3-41F9-A891-022596493438','LOV_CITY','zh','南京市','N-南京市','江苏省',204,'Y'),('6EE3152B-6051-478A-A7DF-9197A5DB4F2F','LOV_CITY','zh','汕头市','S-汕头市','广东省',246,'Y'),('6F1D2ECC-A239-4854-97C5-1D85151DB680','LOV_CITY','zh','防城港市','F-防城港市','广西壮族自治区',74,'Y'),('6f501254-2fb6-4d62-b46e-2b131c406520','CUSTOMER_PHONE_STATUS','zh','CUSTOMER_PHONE_INACTIVITY','无效','',2,'N'),('6F7798F8-8D8A-4250-8BE0-512183C3F8D9','LOV_CITY','zh','宣城市','X-宣城市','安徽省',339,'Y'),('6f88781a-5821-48f0-a707-cc3d41007423','TOTAL_ATTRIBUTE_UOM','zh','M_MEMBER_PERIOD','会员期','',4,'N'),('6FDD13D2-798B-4117-9261-1AEBB927CDC1','LOV_CITY','zh','平顶山市','P-平顶山市','河南省',217,'Y'),('6FF9FB67-52F6-490F-8166-3A8852129924','ELEMENT_FIELD','zh','email','电子邮箱','EMAIL',0,'N'),('7','MM_QUERY_TYPE1','zh','is null','为空','',7,'N'),('70','MC_CUS_PROVINCE','zh','1','上海市',NULL,2,'N'),('7011057F-B9F1-4E18-BEA2-9D27EF51CA77','LOV_CITY','zh','韶关市','S-韶关市','广东省',252,'Y'),('7012F56F-4B32-4AB1-8536-DBB941FA5A0C','LOV_CITY','zh','酒泉市','J-酒泉市','甘肃省',155,'Y'),('704A154F-A58F-411D-82C7-84BF6386A7CA','LOV_CITY','zh','三亚市','S-三亚市','海南省',244,'Y'),('7084A1E6-26D1-40FB-BF6E-39067BA19303','LOV_CITY','zh','定西市','D-定西市','甘肃省',67,'Y'),('71','MC_CUS_PROVINCE','zh','2','其它',NULL,3,'N'),('7121DFB5-17EB-4DB2-B7FA-677CAF1B8AC6','LOV_CITY','zh','塔城地区','T-塔城地区','新疆维吾尔自治区',272,'Y'),('7122EF1E-D0B8-4994-BAA1-5F5B4D536653','LOV_CITY','zh','眉山市','M-眉山市','四川省',195,'Y'),('712E1CB0-3EAD-4A75-AE60-FA2B32311C76','CAMPAIGN_ROI_ANALYSIS','zh','campaignCost','营销成本','',4,'N'),('72','MC_CUS_CITY','zh','0','浦东区',NULL,1,'N'),('720AD180-1E5D-48C5-9D31-C4145DE568B8','LOV_CITY','zh','阿克苏地区','A-阿克苏地区','新疆维吾尔自治区',2,'Y'),('725C130D-5C4B-430C-BFDA-C358DB3671D2','LOV_CITY','zh','宜昌市','Y-宜昌市','湖北省',351,'Y'),('7279c163-6caa-450f-8dc9-25ecf8c8cce3','POINTS_DETAIL_TYPE','zh','M_CANCEL','退货','',4,'N'),('72CA6A63-85AE-4674-8678-968705FC555F','LOV_CITY','zh','昭通市','Z-昭通市','云南省',374,'Y'),('72D78F40-E193-4CB0-9705-DFF04C2ABBF0','LOV_CITY','zh','滁州市','C-滁州市','安徽省',52,'Y'),('73','MC_CUS_CITY','zh','1','徐汇区',NULL,2,'N'),('7339E5FA-B445-455D-BEEF-3435BB579F31','LOV_CITY','zh','青岛市','Q-青岛市','山东省',232,'Y'),('74','MC_CUS_CITY','zh','2','其它',NULL,3,'N'),('74128EC8-F2C6-4608-B1CE-5974765EA861','LOV_CITY','zh','攀枝花市','P-攀枝花市','四川省',214,'Y'),('743F18FA-6134-4139-A709-F1FC53CD9621','RESPOSE_FIELD','zh','responseName','响应名称','RESPONSE_NAME',0,'N'),('75','Program_Status','zh','Program_Status_JHZ','计划中',NULL,1,'N'),('75047CC9-1398-467B-BBB6-95D556BD5ABA','LOV_CITY','zh','荆门市','J-荆门市','湖北省',150,'Y'),('757A02A8-F597-43DA-BEB1-49D5D9051CC2','ORDER_FIELD','zh','quantity','商品数量','QUANTITY',0,'N'),('76','Program_Status','zh','Program_Status_YX','运行',NULL,2,'N'),('76114B5F-B31A-48B4-AF70-D1A57A767DAA','LOV_CITY','zh','梧州市','W-梧州市','广西壮族自治区',308,'Y'),('76122FC2-8588-4290-A11E-F89D4A9D34AB','LOV_CITY','zh','福州市','F-福州市','福建省',76,'Y'),('761F4351-F169-469B-8EB5-C93F7E5FE7BF','LOV_CITY','zh','萍乡市','P-萍乡市','江西省',220,'Y'),('763DE31A-1816-450F-961A-E7D1C9F7C21E','DATA_TYPE','zh','respose','响应','',0,'N'),('76B09371-55C7-421B-B710-14FCBBED534C','LOV_CITY','zh','重庆市','Z-重庆市','重庆',381,'Y'),('77','Program_Status','zh','Program_Status_WC','完成',NULL,3,'N'),('77238E50-BED3-454A-ADCB-2CFCD8C28788','LOV_CITY','zh','长春市','C-长春市','吉林省',38,'Y'),('77644A54-7BE6-4ED2-B9A9-4A8969167C83','LOV_CITY','zh','屯昌县','T-屯昌县','海南省',294,'Y'),('7796D461-3F3F-4A8A-9F42-32EA5FDB21FB','LOV_CITY','zh','天水市','T-天水市','甘肃省',285,'Y'),('77E32D00-173F-4132-AD3E-929FFD294C08','RESPOSE_FIELD','zh','responseCode','响应代码','RESPONSE_CODE',0,'N'),('77F1517F-74E7-4ACA-B701-E8CC3EF58B83','LOV_CITY','zh','九龙','J-九龙','香港特别行政区',154,'Y'),('78','Program_Status','zh','Program_Status_QX','取消',NULL,4,'N'),('78452c1e-a8bd-44db-bbbf-daad5b72b67d','INCOME_INTERVAL','zh','6','25000~50000','',6,'Y'),('7871873F-D0C8-4449-80D2-31D3CC5AA2AD','LOV_CITY','zh','黔西南布依族苗族自治州','Q-黔西南布依族苗族自治州','贵州省',229,'Y'),('789155AF-6DE5-4495-A139-0852F78FE3B9','PRODUCT_FIELD','zh','name','商品名称','NAME',0,'N'),('78B97E8F-9252-4C4C-9067-8D8A81E1245F','LOV_CITY','zh','株洲市','Z-株洲市','湖南省',384,'Y'),('79','Program_Type','zh','Program_Type_JJR','节假日',NULL,1,'N'),('796C0007-0A17-4F10-BD44-068E7CC67E49','LOV_CITY','zh','铜仁市','T-铜仁市','贵州省',291,'Y'),('79B3C986-DBB4-4F5C-8696-6AC5D7E28D16','LOV_CITY','zh','揭阳市','J-揭阳市','广东省',143,'Y'),('79f4a3c5-775d-4ac7-9123-77edd3e7df32','CUSTOMER_MODE','zh','CUSTOMER_MODE_ACTIVITY','有效','',1,'N'),('7A28DA94-5954-462A-B3E6-636E813C0268','PRODUCT_FIELD','zh','belongOrg','商家ID','BELONG_ORG',0,'N'),('7a39edf8-dd7b-465c-8ddb-798e03aae3b7','CUSTOMER_ID_TYPE','zh','CUSTOMER_ID_PASSPORT','护照','',2,'N'),('7A51795D-7352-4076-9432-D4E0F647EADB','TRATE_TYPE','zh','cod','货到付款',NULL,2,'N'),('7a5a1a74-b368-44f6-ae8f-b0c0cd2d6587','MODIFY_ATTRIBUTE','zh','M_PLUS','加','',1,'N'),('7A6051D5-C8AB-400E-969C-5A412114032D','CUSTOMER_FIELD','zh','province','省份','PROVINCE',0,'N'),('7C172AFA-63DB-4241-88D7-90EDB0A7D8AE','RESPOSE_FIELD','zh','campaignName','营销活动名称','CAMPAIGN_NAME',0,'N'),('7C383298-132D-4C81-8526-8777BB4DDA40','LOV_CITY','zh','中卫市','Z-中卫市','宁夏回族自治区',380,'Y'),('7C741386-5B41-42DF-B67D-FEF5A529CB1B','LOV_CITY','zh','德阳市','D-德阳市','四川省',63,'Y'),('7cdb12e3-89e6-4d3c-ae90-d57ee661287b','MM_SEG_IF','en','0','No','',2,'N'),('7D2E4C20-A1FF-4162-8575-A3ACB0178AE8','PRIMARY_PRODUCT_CATEGORY','zh','PT_3','短外套',NULL,1,'N'),('7D4CBF10-CCBF-4C09-8887-6258F1D49E7A','TRATE_STATUS','zh','R','发货',NULL,1,'N'),('7D4D4A65-045E-4F53-8DF8-84B900F9A392','CUSTOMER_FIELD','zh','idCard','证件号码','ID_CARD',0,'N'),('7D680C99-4E4C-40C2-8212-80BBB306ACF8','LOV_CITY','zh','天门市','T-天门市','湖北省',284,'Y'),('7DEB2B83-337C-46F2-B5AA-AEC6B21F4F07','PRODUCT_FIELD','zh','productOutId','外部编码','PRODUCT_OUT_ID',0,'N'),('7DF285D5-4A2A-4178-91C4-45372FB056DF','LOV_CITY','zh','克拉玛依市','K-克拉玛依市','新疆维吾尔自治区',158,'Y'),('7E18F6F2-393C-4564-BD12-4C2E1A083188','LOV_CITY','zh','延边朝鲜族自治州','Y-延边朝鲜族自治州','吉林省',343,'Y'),('7E392CEB-9FBB-461B-90FE-C1B6E0408E70','PRODUCT_FIELD','zh','modifyDate','最后修改时间','MODIFY_DATE',0,'N'),('7EAE1EE5-3700-4230-8555-FC94B14CB8DE','LOV_CITY','zh','阿勒泰地区','A-阿勒泰地区','新疆维吾尔自治区',5,'Y'),('7EF7E651-CFC5-473F-B87D-F1DB54F66230','LOV_CITY','zh','亳州市','B-亳州市','安徽省',32,'Y'),('7f0dcafb-3704-4055-ab51-f9552c52def7','INCOME_INTERVAL_EXT','zh','(INCOME >3000 and INCOME<=4000)','3001~4000','',3,NULL),('7f7bbe07-8402-4875-9370-b6536f6d2c95','NATIONALITY','zh','M_CHINA','Z-中国','',1,'Y'),('7F8EEAD8-DA90-41F6-B6D0-655E3E8C0DAF','ORDER_STATUS','zh','ORDER_STATUS_ORDERED','完成','',3,'N'),('8','MM_QUERY_TYPE1','zh','is not null','不为空','',8,'N'),('80','Program_Type','zh','Program_Type_XPSS','新品上市','',2,'N'),('802eb68d-b7c4-4f33-b24d-a3012780f6d8','EVENT_STATE','zh','M_OUTBOUND_SOLVED','已解决','M_OUTBOUND',6,'N'),('804F90D2-FDD4-4115-861B-BBFA74591CE2','LOV_CITY','zh','云浮市','Y-云浮市','广东省',364,'Y'),('806a6e06-bf46-4ab2-8e65-7135606d27a2','CREDENTIALS_TYPE','zh','M_STUDENTID','学生证','',4,'Y'),('80A86111-01E8-42F7-A4BB-D35C07FD7468','CUSTOMER_FIELD','zh','fullName','姓名','FULL_NAME',0,'N'),('80b7d187-fd74-4d3f-9edb-decad01bcc06','PER_CUSTOMER_TRANSACT_EXT','zh','(PER_CUSTOMER_TRANSACT IS NULL OR PER_CUSTOMER_TRANSACT<=2000)','2000以下','',1,NULL),('81','Program_Type','zh','Program_Type_GWP','GWP',NULL,3,'N'),('81679504-0906-47DA-A369-7E3A9F7006D2','SOURCE_WEBSITE','zh','亚马逊','亚马逊',NULL,7,'y'),('8176c3bb-1f4b-437d-aac9-3e9d77a08eca','GIFT_ORDER_STATUS','zh','GIFT_ORDER_STATUS_RECEIVEING','已领取','',4,'N'),('819B7C9E-BAFC-44E3-944F-2804445E125F','LOV_CITY','zh','无锡市','W-无锡市','江苏省',305,'Y'),('81F88EF9-588E-401C-B03B-A905CC4BC589','LOV_CITY','zh','固原市','G-固原市','宁夏回族自治区',85,'Y'),('82','Program_Type','zh','Program_Type_VIP','VIP',NULL,4,'N'),('822a717b-bb95-4072-b99c-1b52b8c82a78','TASK_REPEATUNIT','zh','TASK_REPEATUNIT_DAY','天','',2,'N'),('827520EF-FDDD-4A97-9963-A2ADECF45AEB','SURVEY_STATUS','zh','1','进行中','',1,'N'),('82F4A07B-4F08-4961-B37B-0F46EE30B21D','LOV_CITY','zh','淄博市','Z-淄博市','山东省',388,'Y'),('83','Program_Type','zh','Program_Type_JETS','金额提升',NULL,5,'N'),('8309BCBE-E781-457B-B3ED-2C8542F78EA3','LOV_CITY','zh','白山市','B-白山市','吉林省',18,'Y'),('83a201c6-7127-46ea-9772-55a51e9d05ee','ATTR_ATTRTYPE','zh','M_REAL_TIME','实时','',10,'N'),('83F83F46-AD27-47B8-8709-B50E84400D04','LOV_CITY','zh','伊春市','Y-伊春市','黑龙江省',348,'Y'),('84','Program_Type','zh','Program_Type_OTP','One-time purchase',NULL,6,'N'),('84360058-cf47-11e3-a84c-448a5b5b8496','PROCEDURE_NAME','zh','store_to_STORE','门店','',5,'N'),('848BC9C1-6A20-4831-BE42-5E1A0E541DEF','DATA_TYPE','zh','orderItem','订单','',0,'N'),('848D02D3-22EF-491A-9311-0DCFDB3CB61F','ORDER_FIELD','zh','order.orderNum','订单编号','ORDER_NUM',0,'N'),('84E1CF34-2C2B-45C3-8E33-20E0B0D1638A','PROCEDURE_NAME','zh','items_to_PRODUCT','商品','',1,'N'),('85','Money_Type','zh','Money_Type_RMB','人民币',NULL,1,'N'),('8584299B-DF5F-4F23-95B0-B9A119CF9B98','LOV_CITY','zh','永州市','Y-永州市','湖南省',358,'Y'),('86','Money_Type','zh','Money_Type_MY','美元',NULL,2,'N'),('865D6ACF-ECA2-472B-872E-E44264119C2D','PRODUCT_STATUS','zh','N','不可用','',2,'N'),('866d8035-449f-4f60-a415-54f9e7311d07','DATAENTER_STATE','zh','M_DATAENTER_FINISH','已完成','',3,'N'),('87','Money_Type','zh','Money_Type_OY','欧元',NULL,3,'N'),('8712BC1E-B0AD-498E-B4FE-161E81F880D4','LOV_CITY','zh','盘锦市','P-盘锦市','辽宁省',215,'Y'),('88','Money_Type','zh','Money_Type_RY','日元',NULL,4,'N'),('883c88d8-cbb3-41de-87b2-2ccc6783e99c','SEX_TYPE','zh','f','女','',2,'N'),('884B3A01-3B5F-4B38-BB40-9F79025843D6','PRODUCT_FIELD','zh','endDate','下架时间','END_DATE',0,'N'),('888D194D-0E30-448B-86E2-47D0FCF1470D','REPEAT_UNIT','zh','month','月','',1,'N'),('89','Budget_Type','zh','Budget_Type_YSF','运输费',NULL,1,'Y'),('8919c90c-34f0-4e9e-b922-9433ce84ced1','SKIP_TYPE','zh','2','中性','',2,'N'),('892491F3-B312-4AD1-8430-19E533FD098B','LOV_CITY','zh','巴彦淖尔市','B-巴彦淖尔市','内蒙古自治区',13,'Y'),('894B2F6A-85DF-42F3-8C33-6B1705D823D4','LOV_CITY','zh','昌都地区','C-昌都地区','西藏自治区',35,'Y'),('896D49B2-5424-4685-A111-EA1252305479','LOV_CITY','zh','张掖市','Z-张掖市','甘肃省',371,'Y'),('899F319E-4AE5-438E-85CC-58F0E38FF57B','LOV_CITY','zh','厦门市','X-厦门市','福建省',318,'Y'),('89C949B6-E6D4-4614-9CE3-A01AA16D42BC','PRIMARY_PRODUCT_CATEGORY','zh','PT_1','西服',NULL,1,'N'),('8A0BDF28-ECE7-4FF1-B17B-F985486FF82F','LOV_CITY','zh','伊犁哈萨克自治州','Y-伊犁哈萨克自治州','新疆维吾尔自治区',349,'Y'),('8A110492-A66F-48C4-A996-C903BF150454','ORDER_FIELD','zh','order.status','订单状态','STATUS',0,'N'),('8A5B1FF9-A885-4338-B255-137955624614','LOV_CITY','zh','扬州市','Y-扬州市','江苏省',345,'Y'),('8aea65c3-0df5-45cb-8638-a04ec75c84ca','CREDENTIALS_TYPE','zh','M_HOMERETURNPERMIT','回乡证','',5,'Y'),('8B2CD06A-1C70-4983-BEBF-4FAA60DE8F2C','CUSTOMER_FIELD','zh','registerTime','注册时间','REGISTER_TIME',0,'N'),('8CB700CE-4030-46F0-A49F-B4B3AFDD38FC','LOV_CITY','zh','桂林市','G-桂林市','广西壮族自治区',91,'Y'),('8D8DA8BB-72DD-4AB9-BDF0-4D140DCAB471','LOV_CITY','zh','鸡西市','J-鸡西市','黑龙江省',129,'Y'),('8DDE166C-3A17-45DB-97F7-15C0C616DC75','LOV_CITY','zh','德州市','D-德州市','山东省',64,'Y'),('8EF6044F-2FA1-4454-8249-1B57F606D6EE','LOV_CITY','zh','齐齐哈尔市','Q-齐齐哈尔市','黑龙江省',225,'Y'),('8EF8DF72-BA4C-4A76-A38D-A942CCB39970','ELEMENT_FIELD','zh','country','国家','COUNTRY',0,'N'),('8F265FD7-9D6F-4DA8-980E-7315CD06B3D5','LOV_CITY','zh','南投县','N-南投县','台湾省',209,'Y'),('8F4FAC9B-E07C-4741-8208-B79A6FCDB869','LOV_CITY','zh','湘西土家族苗族自治州','X-湘西土家族苗族自治州','湖南省',324,'Y'),('8F9F0BDD-0E97-4E8E-980B-9FB06313D6E1','LOV_CITY','zh','莆田市','P-莆田市','福建省',221,'Y'),('9','MM_QUERY_TYPE1','zh','in','in',NULL,9,'N'),('90','Budget_Type','zh','Budget_Type_RGF','活动渠道费用',NULL,2,'Y'),('902DF092-B36A-4FDD-A46A-9439365BB3E0','LOV_CITY','zh','泰州市','T-泰州市','江苏省',280,'Y'),('903DA1EF-09B1-49B8-A64F-D57C1F6A4B31','LOV_CITY','zh','驻马店市','Z-驻马店市','河南省',386,'Y'),('9051B0FB-4D77-4517-8D39-ACBC4CF0D736','LOV_CITY','zh','赣州市','G-赣州市','江西省',83,'Y'),('90C81BB6-5E00-4F94-A782-98A74EA14ACF','LOV_CITY','zh','海南藏族自治州','H-海南藏族自治州','青海省',98,'Y'),('90cfef31-31fd-4f52-91ea-fec7448a9456','CREDENTIALS_TYPE','zh','M_IDENTITYCARD','身份证','',1,'Y'),('90f69f14-3cc9-47b8-8f3f-ea0e34aadd7b','MEMBER_CARD_TIER','zh','MEMBER_CARD_TIER_JK','金卡','',4,'N'),('91','MEMBER_MEMBERTYPE','zh','M_INDIVIDUAL','个人',NULL,1,'N'),('917f0638-18f6-4f20-8f47-bfbeb35e5373','MODIFY_ATTRIBUTE','zh','M_ASSIGN','赋值','',5,'N'),('92','MEMBER_MEMBERTYPE','zh','M_HOUSEHOLD','家庭',NULL,2,'N'),('93','MEMBER_MEMBERTYPE','zh','M_GROUP','团体',NULL,3,'N'),('931FD237-17F1-4B70-A15D-8EF5E7D25B57','LOV_CITY','zh','自贡市','Z-自贡市','四川省',389,'Y'),('932387e2-5e34-4b9a-8f3b-fbd41c4486cf','SKIP_TYPE','zh','5','敏感','',5,'N'),('93241415-5075-4EEB-BD7A-354EAA253864','CAMPAIGN_ROI_ANALYSIS','zh','totalOrderRate','成单率','needTransform',7,'N'),('93411012-5175-4628-a411-f4b3b0952015','SKIP_TYPE','zh','4','混合性','',4,'N'),('935fe19e-6195-4ea2-ab6c-e5c28ea57968','DQM_DATA_STATUS','zh','M_VALID','有效','',0,'N'),('94','Campaign_Status','zh','Campaign_Status_JHZ','计划中',NULL,1,'N'),('942754CA-18BF-4491-80B5-CDBB95C8AFC8','ELEMENT_FIELD','zh','activityNotify','状态','ACTIVITY_NOTIFY',0,'N'),('947b2b9a-24c9-4d08-b176-f523bfb51373','INCOME_INTERVAL','zh','5','12000~25000','',5,'Y'),('94832D43-FF06-4C89-82A3-5EBD817503D3','CUSTOMER_FIELD','zh','activityNotify','客户状态','ACTIVITY_NOTIFY',0,'N'),('948B7F98-8999-42E7-9B4E-E34508F20A9A','ORDER_FIELD','zh','customer.email','电子邮箱','EMAIL',0,'N'),('949A8F45-F87E-41D0-A86B-6950CFAE4868','LOV_CITY','zh','泉州市','Q-泉州市','福建省',239,'Y'),('949af722-728d-4419-b6d7-290419ca72af','GIFT_ORDER_STATUS','zh','GIFT_ORDER_STATUS_SUSPENDED','暂缓','',5,'N'),('94ABF1E9-5FCE-4AE6-94C5-798EE8A307A2','PROCEDURE_NAME','zh','orders_to_ORDER','订单','',3,'N'),('95','Campaign_Status','zh','Campaign_Status_YX','运行',NULL,2,'N'),('950655f8-7b14-42c2-a0c3-08eabee60475','MEMBER_CARD_STATUS','zh','MEMBER_CARD_STATUS_ZX','注销','',4,'N'),('96','Campaign_Status','zh','Campaign_Status_WC','完成',NULL,3,'N'),('961ebffb-184e-4deb-a2ef-9fdfafca4900','EVENT_STATE','zh','M_OUTBOUND_UNSOLVED','待解决','M_OUTBOUND',3,'N'),('9629dc2b-5248-481a-93d0-591832fbd1fc','TASK_REPEATUNIT','zh','TASK_REPEATUNIT_HOUR','小时','',1,'N'),('96729317-F74E-49C7-A4FB-B37BA5678CE2','LOV_CITY','zh','济南市','J-济南市','山东省',133,'Y'),('96AB4F73-4BF6-4048-B45B-4ADED7397922','LOV_CITY','zh','屏东县','P-屏东县','台湾省',219,'Y'),('97','Campaign_Status','zh','Campaign_Status_QX','取消',NULL,4,'N'),('972CB2EB-1B78-4167-A62E-7205CE40B105','LOV_CITY','zh','武威市','W-武威市','甘肃省',312,'Y'),('97EEF8B8-9A20-40C1-82C7-8EBE78E4948E','LOV_CITY','zh','文昌市','W-文昌市','海南省',300,'Y'),('97efbd5f-3819-4b75-abdb-1defb49967e3','CUSTOMER_COUNTORY','zh','M_COUNTRY_CHINA','中国','',1,'N'),('98','Campaign_Type','zh','Campaign_Type_XPSS','新品上市',NULL,1,'N'),('989FD649-8B03-48A0-B240-7A1B7AF29C46','LOV_CITY','zh','南昌市','N-南昌市','江西省',202,'Y'),('98CEA67D-B7D9-4734-A5FA-7F63DF2730B4','LOV_CITY','zh','石河子市','S-石河子市','新疆维吾尔自治区',259,'Y'),('98D60BFA-4779-4FF8-8BA8-0244C44C1CD7','LOV_CITY','zh','白城市','B-白城市','吉林省',16,'Y'),('99','Campaign_Type','zh','Campaign_Type_SRCX','生日促销',NULL,2,'N'),('9922CB89-6F64-4BB7-9CA5-D68EC7803324','RESPOSE_FIELD','zh','customerName','客户名称','CUSTOMER_NAME',0,'N'),('9988b654-e406-4fbf-b568-5289b9c83b3c','INCOME_INTERVAL','zh','2','2000~5000','',2,'Y'),('9A4C861D-D071-4EF5-B967-A965E23C6623','LOV_CITY','zh','松原市','S-松原市','吉林省',265,'Y'),('9AFFFCBF-089F-42A6-9F27-7977376B1990','LOV_CITY','zh','阜阳市','F-阜阳市','安徽省',80,'Y'),('9B1422EA-1033-41AB-B604-0A75A8D03220','ORDER_FIELD','zh','order.orderAmount','订单总额','ORDER_AMOUNT',0,'N'),('9B49EC02-2FD3-47A9-8261-FC439FF99272','TRATE_STATUS','zh','W','确认收货',NULL,1,'N'),('9BE05F7B-EAC7-4D2B-8C5F-765DE6853804','LOV_CITY','zh','辽源市','L-辽源市','吉林省',174,'Y'),('9bee55a9-7320-4f7e-9adb-0887b16db42c','MERGE_STATUS','zh','M_MERGE','已合并','',1,'N'),('9bfd7d4c-9d2e-42d8-a3f2-435d137f7da9','MAX_ORDER_AMOUNT_EXT','zh','(MAX_ORDER_AMOUNT >3000 and MAX_ORDER_AMOUNT<=4000)','3000~4000','',3,NULL),('9c743825-7143-4665-8b37-3486103fd083','MEMBER_CARD_TIER','zh','MEMBER_CARD_TIER_BJK','白金卡','',5,'N'),('9D37D927-BD6F-43F8-ADF5-B8B27743F65A','LOV_CITY','zh','云林县','Y-云林县','台湾省',365,'Y'),('9DB148D5-9066-4CE3-83BF-B030ED1039B8','LOV_CITY','zh','博尔塔拉蒙古自治州','B-博尔塔拉蒙古自治州','新疆维吾尔自治区',33,'Y'),('9DEEB36F-BEA3-4118-9CC3-F5F705AE7CD0','LOV_CITY','zh','朔州市','S-朔州市','山西省',263,'Y'),('9E629FA6-AEF3-4193-85AE-16EB557E3E1F','LOV_CITY','zh','通辽市','T-通辽市','内蒙古自治区',288,'Y'),('9e773b21-f0be-40f9-8321-b38fc50e99a8','SKIP_TYPE','en','1','drying','',1,'N'),('9E884AA8-8D43-47BE-B7AB-975D5BAAFF83','LOV_CITY','zh','延安市','Y-延安市','陕西省',342,'Y'),('9F385297-0356-420B-977B-5FF73A047458','PRODUCT_FIELD','zh','nameEn','商品英文名称','NAME_EN',0,'N'),('9f7351e4-5e83-4fac-a9b4-bc7a7a08a577','EMPLOYEE_TYPE','zh','EMPLOYEE_TYPE_OTHER','其他','',6,'N'),('9F9E24AD-2047-4437-823C-DF585BF6F769','LOV_CITY','zh','辽阳市','L-辽阳市','辽宁省',173,'Y'),('9FD67B03-9774-4712-98AA-2A45B0F7BC5A','ORDER_FIELD','zh','productSku','商品SKU','PRODUCT_SKU',0,'N'),('a04b21a8-1c81-4398-a47c-3416a8dc1a04','MODIFY_ATTRIBUTE','zh','M_DIVIDE','除','',4,'N'),('a0c2c0aa-4c85-46dd-8559-7ec72ec7a452','CUSTOMER_SOURCE','zh','M_MEDIA','媒体','',2,'N'),('A17EB753-1A93-428C-AB67-4CBD2D2C62EA','PRODUCT_FIELD','zh','productStatus','商品状态','PRODUCT_STATUS',0,'N'),('A38AAA44-22C4-4108-89C5-32ACC7D5491D','LOV_CITY','zh','苏州市','S-苏州市','江苏省',266,'Y'),('a3cc3bc2-dab4-4992-b79e-762c605445f3','TASKPARAM_TYPE','zh','TASKPARAM_TYPE_CLASS','类名(可含包名)','',1,'N'),('A404153B-3562-43ED-ABF3-54BE19BC09D2','LOV_CITY','zh','长沙市','C-长沙市','湖南省',39,'Y'),('A4470ABA-3BAA-4B18-A15D-876981604A48','LOV_CITY','zh','佳木斯市','J-佳木斯市','黑龙江省',136,'Y'),('A4975A56-2B09-4AD1-8F1F-F0239FC6283C','LOV_CITY','zh','凉山彝族自治州','L-凉山彝族自治州','四川省',172,'Y'),('A4D25879-5155-40AD-B819-3BFB437BC9BF','LOV_CITY','zh','湘潭市','X-湘潭市','湖南省',323,'Y'),('a4df21aa-730e-4a07-9552-183a75a58329','AGE_EXT','zh','(AGE >=26 and AGE<=35)','26-35岁','',2,'N'),('A5226BDD-F0D0-4AC2-990A-90DFB546141E','LOV_CITY','zh','玉溪市','Y-玉溪市','云南省',362,'Y'),('A581F5A0-0425-4A65-B078-C74577BC14AA','PRODUCT_FIELD','zh','originalId','商品原系统ID','O_ID',0,'N'),('A607A7E3-3EFE-45ED-9200-4CF1C21B8F29','LOV_CITY','zh','运城市','Y-运城市','山西省',366,'Y'),('A6C02905-3128-4C7C-AD66-4F23AD8362FC','LOV_CITY','zh','龙岩市','L-龙岩市','福建省',186,'Y'),('A6C31750-41D1-4996-953A-F0128DBAD01C','PRODUCT_FIELD','zh','productNumber','商品数量','PRODUCT_NUMBER',0,'N'),('A6F9C295-9076-490A-86D9-22FE8220B0DC','ELEMENT_FIELD','zh','customerNum','客户编号','CUSTOMER_NUM',0,'N'),('A73C5BFF-3F9D-4485-8352-C8EA29DD67A9','LOV_CITY','zh','芜湖市','W-芜湖市','安徽省',307,'Y'),('A7A8DB35-C64B-46B0-BA8F-0DEB14BB67FC','LOV_CITY','zh','巴中市','B-巴中市','四川省',15,'Y'),('A7EF4050-0447-4DB3-AAC8-5BBFBA9BC9B4','PRIMARY_PRODUCT_CATEGORY','zh','PT_5','风衣',NULL,1,'N'),('A86AA304-484E-422B-B489-89CB517FD604','LOV_CITY','zh','秦皇岛市','Q-秦皇岛市','河北省',231,'Y'),('A88230F5-BABA-43B7-AEE3-8E18DCD6CFA2','CAMPAIGN_ROI_ANALYSIS','zh','targetCustNum','实际发送人数','',2,'N'),('A8E97C49-149B-41A4-A37F-7041AB01FB9E','LOV_CITY','zh','保亭黎族苗族自治县','B-保亭黎族苗族自治县','海南省',26,'Y'),('A9511F88-794B-4122-8AAC-2590CD1F11FC','CAMPAIGN_ROI_ANALYSIS','zh','orderAmt','订单金额','',6,'N'),('a983322a-1fa1-4419-9b63-6334f2060608','POINTS_DETAIL_TYPE','zh','M_BASE','基本累积','',1,'N'),('A99D0E42-77E3-45A5-8EAD-8435BB68CC16','LOV_CITY','zh','德宏傣族景颇族自治州','D-德宏傣族景颇族自治州','云南省',62,'Y'),('aa1bc65b-0c0f-443f-8df2-46689de83f10','REDEEM_PERIOD','zh','M_CURRENT','本期','',1,'N'),('AA418CAB-25DC-4FF5-9087-B3BCDAC17975','LOV_CITY','zh','和田地区','H-和田地区','新疆维吾尔自治区',104,'Y'),('AB0A8E28-D449-49BC-AD91-375F85CC1839','LOV_CITY','zh','许昌市','X-许昌市','河南省',338,'Y'),('ABA7E721-EAF1-48B4-8B9E-03E890A9A1B7','LOV_CITY','zh','聊城市','L-聊城市','山东省',175,'Y'),('AC07EC85-C927-434A-BFA6-12FD9738FB2A','ELEMENT_FIELD','zh','fullName','姓名','FULL_NAME',0,'N'),('AC1A4945-82F8-4397-AF1A-46D7A673522B','LOV_CITY','zh','晋中市','J-晋中市','山西省',149,'Y'),('ac1bd9ce-6879-484c-9c3b-b672d93b361b','ATTR_ATTRTYPE','zh','M_CUSTOMIZE','自定义','',9,'N'),('AC4FE3F2-3203-4579-87C7-60F56FC5CB93','LOV_CITY','zh','宿州市','S-宿州市','安徽省',268,'Y'),('ACCC867F-0157-48A7-8767-6EEEF3412B39','LOV_CITY','zh','上海市','S-上海市','上海',250,'Y'),('ad277241-ec3f-4291-8061-6bb7de48e019','FREQUENCY_EXT','zh','(PRIVERY > 3)','3次以上','',5,NULL),('ad2ca353-d369-48ad-809c-3fb7aff77a1f','POSITION_TYPE','zh','M_MARKETING_DIRECTOR','市场总监','',2,NULL),('ad5aaaa2-5e51-455f-bf58-51c1367ae685','INCOME_INTERVAL','zh','4','8000~12000','',4,'Y'),('AD67CA59-CBAC-4314-B0FA-1F84581EB091','LOV_CITY','zh','阜新市','F-阜新市','辽宁省',79,'Y'),('adafa543-cccd-40bd-9145-3ecb9e06f433','CUSTOMER_CAREER','zh','CUSTOMER_CAREER_SERVICE','服务业','',1,'N'),('ADB3C646-CA9C-481B-BE51-4D2A96966F04','LOV_CITY','zh','兴安盟','X-兴安盟','内蒙古自治区',335,'Y'),('AE800673-B683-47D2-A689-974E4FF4F786','LOV_CITY','zh','嘉峪关市','J-嘉峪关市','甘肃省',140,'Y'),('aea4517a-7be3-4bc2-bc68-9e336fcbfbbe','TRANS_TYPE','zh','M_REDEEM','兑换','',2,'N'),('aea552ab-bcf2-4c79-ba0b-dc9568d95aea','MM_RESPONSE_COLUMN','zh','RESPONSE_CHANNEL','渠道','',12,'N'),('AEF91198-60BE-42C0-95D5-3B396888408A','CUSTOMER_FIELD','zh','mobileTel','手机','MOBILE_TEL',0,'N'),('AFD125E3-865A-4D59-BE70-BBC92B956E90','LOV_CITY','zh','安阳市','A-安阳市','河南省',10,'Y'),('AFE96E9B-AE22-4E98-8AA4-E157B5A92B1F','LOV_CITY','zh','菏泽市','H-菏泽市','山东省',107,'Y'),('B01F0C9C-536D-4AA3-A044-81E5CE073FE9','LOV_CITY','zh','南宁市','N-南宁市','广西壮族自治区',205,'Y'),('b0700a8c-f953-497f-ad1a-3b9d10be6f76','INCOME_INTERVAL','zh','3','5000~8000','',3,'Y'),('b08200f0-9746-42ef-b513-eac45277bbb2','TASK_STATUS','zh','TASK_STATUS_NEW','新建','',1,'N'),('B13FC951-1C20-45D1-9907-52E9B6C55284','LOV_CITY','zh','常州市','C-常州市','江苏省',42,'Y'),('B1B009EC-5BBF-45DC-9834-6FC54F84ACEC','LOV_CITY','zh','白银市','B-白银市','甘肃省',19,'Y'),('B1F4B150-7433-4496-AD3A-FD977AE2CBF7','TRATE_STATUS','zh','M','系统内发货',NULL,1,'N'),('B202B26D-018A-4E3B-B8EF-BBC09462995F','LOV_CITY','zh','遂宁市','S-遂宁市','四川省',271,'Y'),('b29ec9df-3eba-4662-9546-aa3e4e460b8e','DQM_DATA_STATUS','zh','M_UNKNOWN','未知','',0,'N'),('B2A9439A-06CE-4CDE-9003-BBC7395902C3','LOV_CITY','zh','长治市','C-长治市','山西省',40,'Y'),('B30F822B-EA80-4767-A275-B0F87E34CA32','REPEAT_UNIT','zh','week','周','',2,'N'),('B32586BF-26A2-4C2F-8060-496E9C0507C8','ELEMENT_FIELD','zh','postCity','城市','CITY',0,'N'),('b35c388b-83de-4705-9d08-3eb27b644eb0','INCOME_INTERVAL','zh','7','50000以上','',7,'Y'),('B3AB9D94-937F-4435-8F14-5E80BD835125','ELEMENT_FIELD','zh','sourceid','客户数字id','SOURCEID',0,'N'),('B3F6E936-8461-4318-B7BF-C06410FEE3D9','LOV_CITY','zh','安庆市','A-安庆市','安徽省',8,'Y'),('b43630ae-1114-4553-be39-8c5e578757e6','MAX_ORDER_AMOUNT_EXT','zh','(MAX_ORDER_AMOUNT IS NULL OR MAX_ORDER_AMOUNT<=2000)','2千以下','',1,NULL),('B43BEB9B-DE33-4602-9530-26144AADB457','LOV_CITY','zh','包头市','B-包头市','内蒙古自治区',22,'Y'),('b45f91f6-4f46-4348-b9ab-8005b4fc5dd5','TRANS_TYPE','zh','M_REFUND','退货','',3,'N'),('b50fcd06-2244-48eb-a3fe-7f842e0f8abe','POINTS_DETAIL_TYPE','zh','M_GIFT','赠分','',6,'N'),('B55986F8-EFF8-4FF5-B869-5DD8D5F46C32','LOV_CITY','zh','东营市','D-东营市','山东省',70,'Y'),('B57B163D-23A8-4B85-B29E-E4F1F8194473','LOV_CITY','zh','太原市','T-太原市','山西省',278,'Y'),('B5B70361-8A22-487B-8E3B-BE7AB21DC587','LOV_CITY','zh','镇江市','Z-镇江市','江苏省',376,'Y'),('B6AA49A6-9C36-497D-8D09-816A6016CD9D','LOV_CITY','zh','乐东黎族自治县','L-乐东黎族自治县','海南省',166,'Y'),('B706E634-147A-41E2-ABD8-8478847EA49F','CUSTOMER_FIELD','zh','birthday','生日','BIRTHDAY',0,'N'),('B72C2A2A-248F-44F8-8172-2474A510F8FA','LOV_CITY','zh','铜陵市','T-铜陵市','安徽省',290,'Y'),('B76F99A4-A145-43ED-BA6D-1CA05873E450','DATA_TYPE','zh','element','潜客','',0,'N'),('b7c86404-20bd-4f1f-90cd-39f0bba5a957','MERGE_STATUS','zh','M_CANCEL','已撤销','',2,'N'),('b85e142c-b178-4bd3-b7aa-55986d595820','PER_CUSTOMER_TRANSACT_EXT','zh','(PER_CUSTOMER_TRANSACT >3000 AND PER_CUSTOMER_TRANSACT<=4000)','3000~4000','',3,NULL),('B87F2832-0DF1-4BCF-983D-A1DF6DA45461','LOV_CITY','zh','雅安市','Y-雅安市','四川省',340,'Y'),('b8fdaa72-2e78-4617-8b8d-add93f8f2244','CUSTOMER_SOURCE','zh','M_FRIENDINTRODUCTION','朋友介绍','',1,'N'),('B9B372B9-B3CF-4C24-83CC-56DFD5CE796E','LOV_CITY','zh','滨州市','B-滨州市','山东省',31,'Y'),('BA63510C-8FDD-4BF7-8527-5D54DE22DD37','LOV_CITY','zh','新竹县','X-新竹县','台湾省',333,'Y'),('BBCC1F67-2774-4638-9E61-0AE02E1BD9A5','LOV_CITY','zh','临夏回族自治州','L-临夏回族自治州','甘肃省',180,'Y'),('BC1B2FF8-B1AD-4399-A8F0-C2AC6E430873','LOV_CITY','zh','甘孜藏族自治州','G-甘孜藏族自治州','四川省',82,'Y'),('BC4B3EBB-662C-436E-B6CB-0A219A115C7C','ORDER_FIELD','zh','province','省份','PROVINCE',0,'N'),('BCCAC286-DFF2-4C81-AE29-D64623143556','LOV_CITY','zh','哈密地区','H-哈密地区','新疆维吾尔自治区',94,'Y'),('bcef5156-839f-46f5-b62f-12e269eb5181','POSITION_TYPE','zh','M_GENERAL_MANAGER','总经理','',1,NULL),('bda13f7c-9e8d-4bc0-bda0-e31f9c12571a','REDEEM_STATUS','zh','M_FINISH','完成','',2,'N'),('bea40b8e-5b9d-47bc-99e0-b6f3bf6cc86e','FREQUENCY_EXT','zh','(PRIVERY = 2)','2次','',3,NULL),('BF0C8D6D-9047-4436-A0CE-87A5D93BA4FC','SOURCE_WEBSITE','zh','中粮B2B商城','中粮B2B商城',NULL,10,'y'),('BF0CB71F-12DD-4979-AC7C-8A2D83C4ADB2','ELEMENT_FIELD','zh','idType','客户类型','ID_TYPE',0,'N'),('BF24161E-E096-492A-A678-D9E71EFAEDA8','LOV_CITY','zh','宁波市','N-宁波市','浙江省',211,'Y'),('BF3A2D05-B30C-4AD0-9F33-BD64684105DB','LOV_CITY','zh','澎湖县','P-澎湖县','台湾省',216,'Y'),('BFF072A7-C48C-44AE-9421-DBC8C53BFB21','LOV_CITY','zh','五指山市','W-五指山市','海南省',310,'Y'),('C049C0AD-B93B-4918-9B85-F63FECA14613','ORDER_FIELD','zh','customer.mobileTel','移动电话','MOBILE_TEL',0,'N'),('C08E52AE-815C-44A0-AF8F-C7617FF37D12','LOV_CITY','zh','宁德市','N-宁德市','福建省',212,'Y'),('C11489F3-2CCD-46BB-8F0A-BB3146801944','PRODUCT_FIELD','zh','productPrice','商品价格','PRODUCT_PRICE',0,'N'),('C1A0B8E8-D410-4C8A-BC92-113AF781594A','TRATE_STATUS','zh','A','待客审',NULL,1,'N'),('c204ca5e-8657-4da5-8075-b3f379019f71','MAX_ORDER_AMOUNT_EXT','zh','(MAX_ORDER_AMOUNT >2000 and MAX_ORDER_AMOUNT<=3000)','2000~3000','',2,NULL),('C21C6929-0409-49D7-9C60-5A81DA534726','MM_RE_RESPONSE_TYPE','zh','REJECTED','电话拒绝',NULL,16,'N'),('C2339B96-5B8C-4432-9D53-B4FC5A346186','LOV_CITY','zh','连云港市','L-连云港市','江苏省',171,'Y'),('C2872081-FEEE-4525-A849-CBA82954646B','LOV_CITY','zh','嘉义市','J-嘉义市','台湾省',138,'Y'),('C2A36077-A436-4EA4-A10A-5F253B889F4B','LOV_CITY','zh','襄阳市','X-襄阳市','湖北省',325,'Y'),('C2AC80FB-53C3-4311-8EC5-FE140B1F5885','ELEMENT_FIELD','zh','gender','性别','GENDER',0,'N'),('C2AF77AF-FF8F-4920-B16C-4729C9F5D8B3','LOV_CITY','zh','万宁市','W-万宁市','海南省',295,'Y'),('C2B590F8-8680-46E7-97A5-270CF2917988','LOV_CITY','zh','丽水市','L-丽水市','浙江省',170,'Y'),('C2B869EA-6810-42B0-8F5D-E21F55F7FC41','LOV_CITY','zh','南阳市','N-南阳市','河南省',210,'Y'),('C37F986B-BD5D-4FA3-9980-A41B1F399416','IMPORT_RULE','zh','fullName=FULL_NAME','姓名','',1,'N'),('C3B15A5D-05A9-4B3B-9A8F-F09514108B5A','CUSTOMER_FIELD','zh','customerNum','客户编号','CUSTOMER_NUM',0,'N'),('c3ea5907-b44d-44e3-93a4-e42c5328e740','REDEEM_STATUS','zh','M_CANCEL','取消','',3,'N'),('c49ea3b6-a69f-4912-b57d-8482ca72d7a0','CUSTOMER_POSITION','zh','CUSTOMER_POSITION_STAFF','职员','',3,'Y'),('C4A4CEC7-2586-4C97-B760-B9142DD8EFEC','LOV_CITY','zh','漯河市','L-漯河市','河南省',192,'Y'),('C4A93F3E-969C-4D41-A22C-3A0B0CB91221','PRIMARY_PRODUCT_CATEGORY','zh','PT_8','衬衫',NULL,1,'N'),('C4B4D8E3-5B84-4880-99A2-663028933B60','LOV_CITY','zh','商丘市','S-商丘市','河南省',249,'Y'),('C4BB25F1-E635-46F2-86FE-39D9AEAC5B26','SURVEY_QUES_TYPE','zh','SURVEY_RADIO','单选','',2,'N'),('c4f54a33-d2f2-4f30-b053-627a7b2759e7','CUSTOMER_SOURCE','zh','M_NETWORK','网络','',3,'N'),('C524107B-DE35-44D4-A8F7-56CA6A5BCAAE','LOV_CITY','zh','湖州市','H-湖州市','浙江省',117,'Y'),('c53bfbc3-2201-4a09-ac24-7f4db1269255','EMPLOYEE_TYPE','zh','EMPLOYEE_TYPE_SALES','销售人员','',3,'N'),('C56182BD-5D4A-46C9-A952-48A9711FE130','LOV_CITY','zh','黄南藏族自治州','H-黄南藏族自治州','青海省',125,'Y'),('C5A02401-ED7C-42CA-87BE-D0D51852EFAF','CUSTOMER_FIELD','zh','postalcode','邮编','POSTALCODE',0,'N'),('C5A6D6BC-D75E-4924-978F-84090C6B45F4','LOV_CITY','zh','安顺市','A-安顺市','贵州省',9,'Y'),('c6005592-2339-459b-a89d-4d3d1d4c7870','PER_CUSTOMER_TRANSACT_EXT','zh','(PER_CUSTOMER_TRANSACT >4000 AND PER_CUSTOMER_TRANSACT<=5000)','4000~5000','',4,NULL),('C6126F6A-5E7D-45C3-AFE3-8AABF0DAFAA4','LOV_CITY','zh','怒江傈僳族自治州','N-怒江傈僳族自治州','云南省',213,'Y'),('C661343F-C513-480F-864A-5A144BF38AC3','IMPORT_RULE','zh','email=EMAIL','电子邮箱','',4,'N'),('C6A2531C-3750-4DC9-86A3-BA090E5844C2','LOV_CITY','zh','宝鸡市','B-宝鸡市','陕西省',23,'Y'),('C6F085CB-CF7F-4D18-AD86-E978820C6351','Budget_Type','zh','Budget_Type_OTHER','其他费用','',5,'Y'),('C75EB23B-751D-4EEB-8EC8-6B545DAE0C0B','MM_RE_RESPONSE_TYPE','zh','NOT_CONNECTED','电话未接通',NULL,15,'N'),('C7A6E837-CEAD-466E-81BE-E855C1D8F02F','RESPOSE_FIELD','zh','responseDate','响应日期','RESPONSE_DATE',0,'N'),('c81b9759-18d3-4df9-8691-d749d2846630','MEMBER_CARD_TIER','zh','MEMBER_CARD_TIER_ZSK','钻石卡','',6,'N'),('c83ebac4-4410-464f-9099-1a77db94d16b','AGE_EXT','zh','(AGE>45)','45岁以上','',4,'N'),('C85D4472-53BC-40E9-9C32-6E2E6AAA28EB','LOV_CITY','zh','合肥市','H-合肥市','安徽省',103,'Y'),('C8FBC2E9-DBC8-4CDC-AF2A-55BEA84F0F1F','PRIMARY_PRODUCT_CATEGORY','zh','PT_10','马甲',NULL,1,'N'),('C97FD2F9-675B-4664-BDCE-430038296595','LOV_CITY','zh','南沙群岛','N-南沙群岛','海南省',207,'Y'),('C98DBA2C-EE3C-48A7-B6DA-991BA8370491','ANALYTICS_CUST_DIM','zh','SOURCE','客户来源','',7,'N'),('CAAA10E4-EEFA-422A-ABDC-19C4A9C60996','LOV_CITY','zh','绵阳市','M-绵阳市','四川省',197,'Y'),('CAMPAIGN_CUSTOMER_ANALYSIS001','CAMPAIGN_CUSTOMER_ANALYSIS','zh','rowNumber','排名','',1,'N'),('CAMPAIGN_CUSTOMER_ANALYSIS002','CAMPAIGN_CUSTOMER_ANALYSIS','zh','productName','商品名称','',2,'N'),('CAMPAIGN_CUSTOMER_ANALYSIS003','CAMPAIGN_CUSTOMER_ANALYSIS','zh','prodNum','商品编号','',3,'N'),('CAMPAIGN_CUSTOMER_ANALYSIS004','CAMPAIGN_CUSTOMER_ANALYSIS','zh','prodCategory','商品类别','',4,'N'),('CAMPAIGN_CUSTOMER_ANALYSIS005','CAMPAIGN_CUSTOMER_ANALYSIS','zh','orderNum','订单数量','',5,'N'),('CAMPAIGN_CUSTOMER_ANALYSIS006','CAMPAIGN_CUSTOMER_ANALYSIS','zh','orderAmt','订单金额','',6,'N'),('CAMPAIGN_RESPONSE_ANALYSIS001','CAMPAIGN_RESPONSE_ANALYSIS','zh','campignId','营销活动ID','',1,'N'),('CAMPAIGN_RESPONSE_ANALYSIS002','CAMPAIGN_RESPONSE_ANALYSIS','zh','campignName','营销活动','',2,'N'),('CAMPAIGN_RESPONSE_ANALYSIS003','CAMPAIGN_RESPONSE_ANALYSIS','zh','channelType','渠道','',3,'N'),('CAMPAIGN_RESPONSE_ANALYSIS004','CAMPAIGN_RESPONSE_ANALYSIS','zh','sendNum','发送数量','',4,'N'),('CAMPAIGN_RESPONSE_ANALYSIS005','CAMPAIGN_RESPONSE_ANALYSIS','zh','respNum','响应数量','',5,'N'),('CAMPAIGN_RESPONSE_ANALYSIS006','CAMPAIGN_RESPONSE_ANALYSIS','zh','respRate','响应率','',6,'N'),('CAMPAIGN_TARGET_ANALYSIS001','CAMPAIGN_TARGET_ANALYSIS','zh','campaignName','营销活动','',1,'N'),('CAMPAIGN_TARGET_ANALYSIS002','CAMPAIGN_TARGET_ANALYSIS','zh','planNum','计划人数','',2,'N'),('CAMPAIGN_TARGET_ANALYSIS003','CAMPAIGN_TARGET_ANALYSIS','zh','respCustNum','响应人数','',3,'N'),('CAMPAIGN_TARGET_ANALYSIS004','CAMPAIGN_TARGET_ANALYSIS','zh','planCost','计划成本','',5,'N'),('CAMPAIGN_TARGET_ANALYSIS005','CAMPAIGN_TARGET_ANALYSIS','zh','campaignCost','实际成本','',6,'N'),('CAMPAIGN_TARGET_ANALYSIS006','CAMPAIGN_TARGET_ANALYSIS','zh','planMaori','计划响应率','',8,'N'),('CAMPAIGN_TARGET_ANALYSIS007','CAMPAIGN_TARGET_ANALYSIS','zh','orderMaori','实际响应率','',9,'N'),('CAMPAIGN_TARGET_ANALYSIS008','CAMPAIGN_TARGET_ANALYSIS','zh','custRate','达成率','',4,'N'),('CAMPAIGN_TARGET_ANALYSIS009','CAMPAIGN_TARGET_ANALYSIS','zh','orderRate','达成率','',10,'N'),('CAMPAIGN_TARGET_ANALYSIS010','CAMPAIGN_TARGET_ANALYSIS','zh','costRate','达成率','',7,'N'),('CB423699-D293-40DC-9795-88AB2F5B1AF3','LOV_CITY','zh','铜川市','T-铜川市','陕西省',289,'Y'),('CBD01B31-A9EB-4344-BADA-BFA2AE4E1FD7','RESPOSE_FIELD','zh','description','响应描述','DESCRIPTION',0,'N'),('cc0aac67-c7c5-4665-bd4a-2d04204d5b1b','POINTS_DETAIL_TYPE','zh','M_BONUS','积分奖励','',2,'N'),('cca04f11-67bf-4a9c-9559-de34c8b64b73','EMPLOYEE_TYPE','zh','EMPLOYEE_TYPE_XINGZHEN','行政人员','',4,'N'),('CD25B9A2-3A42-4035-B9FA-97E27ADC6DDB','LOV_CITY','zh','汉中市','H-汉中市','陕西省',101,'Y'),('CDD834BE-CD1F-426C-8FAC-8FD1130404F5','LOV_CITY','zh','六盘水市','L-六盘水市','贵州省',185,'Y'),('CDEA9598-CF02-41EA-9AF8-6CC10259C85A','LOV_CITY','zh','文山壮族苗族自治州','W-文山壮族苗族自治州','云南省',301,'Y'),('ce336875-9b07-4bd3-9787-1589beb0c910','TASK_REPEATUNIT','zh','TASK_REPEATUNIT_MONTH','月','',4,'N'),('CE3B759C-A4CB-4FAC-9BCA-864F996BE87B','CUSTOMER_FIELD','zh','occupation','职业','OCCUPATION',0,'N'),('CE4C780F-AFBB-4F66-AF61-E1EEA94ECB15','LOV_CITY','zh','阳泉市','Y-阳泉市','山西省',347,'Y'),('ce873ef9-8b9c-4002-b017-2549598ae790','TASKPARAM_TYPE','zh','TASKPARAM_TYPE_STRING','字串','',3,'N'),('cea50f2f-e1ce-4458-88c3-f7f90c67a89d','TRANS_TYPE','zh','M_GIFT','赠分','',4,'N'),('CED6C4F6-DE72-4E0E-8CA6-2767E84F7A8F','LOV_CITY','zh','保山市','B-保山市','云南省',25,'Y'),('CEF873CF-18DB-4F5A-9364-378EABF3F625','ELEMENT_FIELD','zh','registerTime','注册时间','REGISTER_TIME',0,'N'),('cf0d0aa9-dd80-4bcd-ac55-3ea5fe4a44f4','KEYDATATRACE_MODULE','zh','M_MEMBER','会员','',2,'N'),('cf3ec358-7296-4b8c-b66b-8c5b2f7695d3','CUSTOMER_SEX','zh','M_SEX_WOMAN',' 女','',2,'N'),('cfaa7b50-1a7a-4cef-aaad-09bf7ffda534','INCOME_INTERVAL_EXT','zh','(INCOME >=5000 and INCOME<=10000)','5001~10000','',4,NULL),('CFD4116B-7B6D-49E8-8063-30E4AB77ECB8','LOV_CITY','zh','抚州市','F-抚州市','江西省',78,'Y'),('cfdff46b-c4a6-4ec1-88fe-32509a9357dd','REDEEM_PERIOD','zh','M_LAST','上期','',2,'N'),('cff0cb0c-624d-4f82-b97a-2a6866f6dac1','CUSTOMER_POSTITION','zh','CUSTOMER_POSTITION_MANAGER','经理','',2,'N'),('D07C9085-1549-4AFA-955C-C45E4742E06B','LOV_CITY','zh','香港岛','X-香港岛','香港特别行政区',322,'Y'),('D152C9EE-BA59-4C15-8D95-51ACB5A3A502','LOV_CITY','zh','海北藏族自治州','H-海北藏族自治州','青海省',95,'Y'),('D16A8155-A78C-420A-91EF-E0F6C4239707','TRATE_STATUS','zh','ORDER_STATUS_2','交易失败',NULL,2,'N'),('D238E658-34A3-4DA0-9732-A572DD3F84E2','ANALYTICS_CUST_DIM','zh','ACTIVITY_NOTIFY','客户状态分布','',2,'N'),('D25D0A2C-9FB0-4367-A9F0-1407C6735F06','LOV_CITY','zh','南充市','N-南充市','四川省',203,'Y'),('d26847bf-35d8-488c-9bd1-653dcfc82b75','LOV_CITY','','','','',0,'Y'),('d2e5d956-eff2-45cc-a168-5276c190d055','CUSTOMER_MODE','zh','CUSTOMER_MODE_INACTIVITY','无效','',2,'N'),('D43E4095-7961-4F2B-A594-F36DD6D85D11','LOV_CITY','zh','郑州市','Z-郑州市','河南省',377,'Y'),('D5807459-4504-4FD0-A1B1-4E7D69722362','LOV_CITY','zh','潮州市','C-潮州市','广东省',44,'Y'),('D60C269F-9216-48E8-BB6A-E3590A3EB5F9','LOV_CITY','zh','北京市','B-北京市','北京',28,'Y'),('D6817616-B489-4388-867E-66040FD897F8','LOV_CITY','zh','六安市','L-六安市','安徽省',184,'Y'),('D72340B2-C007-4623-B1CB-30A0A0D35F6D','LOV_CITY','zh','开封市','K-开封市','河南省',157,'Y'),('D7421907-1D29-4653-AE89-105858A77FFB','LOV_CITY','zh','陵水黎族自治县','L-陵水黎族自治县','海南省',182,'Y'),('D78AC6E6-2701-4E88-9C58-9F5DFA15ABF5','LOV_CITY','zh','广安市','G-广安市','四川省',86,'Y'),('D7BE56CB-0911-4121-8141-2B4680B19B13','LOV_CITY','zh','阿里地区','A-阿里地区','西藏自治区',6,'Y'),('d7f2b9ba-1b3e-4f99-82fd-2f0a48af581d','POINTS_DETAIL_TYPE','zh','M_REDEEM','兑换','',3,'N'),('D8668E43-1B26-4C6C-8D11-9407F3F766AB','LOV_CITY','zh','黔东南苗族侗族自治州','Q-黔东南苗族侗族自治州','贵州省',227,'Y'),('d87cf59f-0b16-48c8-9a39-bfcd28e8a5cc','POINTS_DETAIL_TYPE','zh','M_TRANSFER','积分转移','',8,'N'),('d89602bb-1852-4982-84a5-68c8e6ba6fcd','CREDENTIALS_TYPE','zh','M_OFFICERSIDENTITYCARD','军官证','',3,'Y'),('D8FA7E68-36DB-408A-92CE-FE7F5F94A6D8','LOV_CITY','zh','昆明市','K-昆明市','云南省',160,'Y'),('d9097a58-0432-4657-84e1-51bf3696fc19','AGE_EXT','zh','(AGE<=25)','25岁以下','',1,'N'),('D9611A24-3A50-4CC3-B039-396DF188C640','ORDER_FIELD','zh','city','城市','CITY',0,'N'),('DA5BB3F8-B158-4193-A021-E676B2CE5A86','SURVEY_STATUS','zh','3','已结束','',3,'N'),('DAF1704A-443E-4F9E-B7DA-31CA08E64A6C','LOV_CITY','zh','营口市','Y-营口市','辽宁省',357,'Y'),('DAFCA2CF-A521-4948-BC05-5E36ECF2EA04','LOV_CITY','zh','南通市','N-南通市','江苏省',208,'Y'),('db2c0783-50b8-46a4-a49e-4e15fa9a2399','MM_RE_RESPONSE_TYPE','zh','REGISTER_OK','已注册','',5,'N'),('DB535B4B-E461-4B1A-903A-2BF60D93F979','ORDER_FIELD','zh','order.transDate','交易日期','TRANS_DATE',0,'N'),('DB93937B-1A88-4E59-8B41-D426DA2F2C84','LOV_CITY','zh','濮阳市','P-濮阳市','河南省',222,'Y'),('dbcd2b58-f12e-11e3-9485-448a5b5b8496','AGE_EXT','zh','(AGE >=36 and AGE <= 45)','36-45岁','',3,'N'),('DBF6DB11-11DF-4EA9-962F-01D2C580686C','LOV_CITY','zh','果洛藏族自治州','G-果洛藏族自治州','青海省',92,'Y'),('dc17a34b-c892-4271-86ff-7b2061f7a150','MODIFY_ATTRIBUTE','zh','M_MULTIPLE','乘','',3,'N'),('DC588212-6DF2-42D6-BD9D-0C20E506A21F','LOV_CITY','zh','仙桃市','X-仙桃市','湖北省',319,'Y'),('DCB31141-8362-4AA3-8F69-48842B697948','LOV_CITY','zh','黔南布依族苗族自治州','Q-黔南布依族苗族自治州','贵州省',228,'Y'),('DCF9FEBA-FE29-4B50-9B2F-A1A830D0A413','ORDER_STATUS','zh','ORDER_STATUS_REJ','拒绝','',2,'N'),('DCFB3A2E-AF8A-4128-8BC0-2C370315A095','LOV_CITY','zh','定安县','D-定安县','海南省',66,'Y'),('DD3168E1-C36C-43A6-BE9E-C20AFDC47F3C','LOV_CITY','zh','烟台市','Y-烟台市','山东省',341,'Y'),('DD5FB06D-9480-4DAC-BC97-5FDAD370517A','LOV_CITY','zh','孝感市','X-孝感市','湖北省',326,'Y'),('DD8ABB6B-F038-4272-8C0E-CCEA01E99240','REPEAT_UNIT','zh','onetime','执行一次','',5,'N'),('DD9B8AC3-2042-48A3-8E10-F673A4693121','PRODUCT_STATUS','zh','Y','可用','',1,'N'),('DE2A8ADA-57D1-441D-8B92-AD0B4B95B158','LOV_CITY','zh','乌兰察布市','W-乌兰察布市','内蒙古自治区',303,'Y'),('de4a56c9-81af-4f17-9af8-354c2e623df6','TASKPARAM_TYPE','zh','TASKPARAM_TYPE_METHOD','方法名','',2,'N'),('DE89E2B8-CE59-4733-8B5F-B635EFAFDFBB','LOV_CITY','zh','贵阳市','G-贵阳市','贵州省',90,'Y'),('DF3B3001-E1C6-48A4-BB14-85EB638F0AD4','LOV_CITY','zh','枣庄市','Z-枣庄市','山东省',367,'Y'),('DF88D457-BE4C-49E9-93D0-ED3CF2AECEB9','LOV_CITY','zh','娄底市','L-娄底市','湖南省',188,'Y'),('DF935747-F238-4BDE-853C-645D2BF706F6','LOV_CITY','zh','哈尔滨市','H-哈尔滨市','黑龙江省',93,'Y'),('DF98CBBE-1E1A-4D81-A82E-40DC352AEFE6','LOV_CITY','zh','衢州市','Q-衢州市','浙江省',238,'Y'),('DFDC41F2-7D40-4A2D-91D2-C589E8093398','LOV_CITY','zh','鹤壁市','H-鹤壁市','河南省',109,'Y'),('e04411fc-b517-422b-ab8a-5349c808a8a5','KEYDATATRACE_MODULE','zh','M_CUSTOMER','客户','',2,'N'),('E0817CE7-3092-430A-BDA3-311DFE84A6A5','LOV_CITY','zh','楚雄彝族自治州','C-楚雄彝族自治州','云南省',53,'Y'),('e094ce34-9e13-4594-9c36-85102e2d5bd8','MAX_ORDER_AMOUNT_EXT','zh','(MAX_ORDER_AMOUNT >5000)','5000以上','',5,NULL),('e09ea1e2-c913-44d2-9b2e-b8d023b1bf8f','CUSTOMER_POSITION','zh','CUSTOMER_POSITION_ENGINEER','工程师','',4,'Y'),('e0cfb7e4-1367-4547-a3c2-41179a052263','POSTCODE_STATUS','zh','POSTCODE_ACTIVITY','有效','',1,'N'),('E110522A-D990-4167-90D4-13F6ED5998B0','LOV_CITY','zh','泰安市','T-泰安市','山东省',279,'Y'),('E1436F00-C3CC-4C45-8125-841AF9C2D64C','TRATE_TYPE','zh','fix','一口价',NULL,1,'N'),('E1574F23-1634-46EF-B851-57DE49D3F897','LOV_CITY','zh','陇南市','L-陇南市','甘肃省',187,'Y'),('E24CDFED-AAFC-4E43-AB97-EAF979F8F72C','PRIMARY_PRODUCT_CATEGORY','zh','PT_2','牛仔裤',NULL,1,'N'),('e26dec02-b7e1-439d-abe2-bfae5b44fc3a','FREQUENCY_EXT','zh','(PRIVERY = 3)','3次','',4,NULL),('e2e0236b-b038-431c-b3db-bbce47406d97','PER_CUSTOMER_TRANSACT_EXT','zh','(PER_CUSTOMER_TRANSACT >2000 AND PER_CUSTOMER_TRANSACT<=3000)','2000~3000','',2,NULL),('E3A27695-0C0E-4896-BFDA-BE4FA22D6E5E','ANALYTICS_CUST_DIM','zh','GENDER','客户性别分布','',1,'N'),('E59EE8B4-EFD8-4B46-9582-67AB3CDBCAEE','LOV_CITY','zh','台南市','T-台南市','台湾省',275,'Y'),('e63a10a6-8a02-4092-afb4-053f24639be2','TASK_STATUS','zh','TASK_STATUS_EXCEPTIONSTOP','异常终止','',4,'N'),('e6b22743-2c67-494c-abab-fcb8959dc359','TRANS_STATUS','zh','M_PENDING','待处理','',1,'N'),('E6D0E5C1-BB0A-438A-B37F-908DB31FD9FD','LOV_CITY','zh','巴音郭楞蒙古自治州','B-巴音郭楞蒙古自治州','新疆维吾尔自治区',14,'Y'),('E7147907-633F-4A8F-B183-D7FA10A236D6','CAMPAIGN_ROI_ANALYSIS','zh','orderNum','订单数量','',5,'N'),('E777583F-B793-4F0A-8F90-4F274B3D3825','LOV_CITY','zh','肇庆市','Z-肇庆市','广东省',375,'Y'),('E7BEB228-5429-4D5F-A996-482BF82F456A','LOV_CITY','zh','张家口市','Z-张家口市','河北省',370,'Y'),('e82eea33-b291-4444-9473-91da8008d5ff','POSTADDR_STATUS','zh','POSTADDR_INACTIVITY','无效','',2,'N'),('E8646942-4E2F-46BE-8B1D-F6016456BBC6','LOV_CITY','zh','图木舒克市','T-图木舒克市','新疆维吾尔自治区',292,'Y'),('E8D5DA36-CF0B-4DBF-A260-5C4AB77E77E4','LOV_CITY','zh','广州市','G-广州市','广东省',88,'Y'),('E98AF209-4959-453C-9E70-451BAAE33D61','LOV_CITY','zh','周口市','Z-周口市','河南省',383,'Y'),('EAD054D6-0300-4403-A2C1-B0A4328CEEBB','LOV_CITY','zh','临汾市','L-临汾市','山西省',178,'Y'),('EAF047D5-6ACA-4969-9C65-4BD4CE9B1120','LOV_CITY','zh','潜江市','Q-潜江市','湖北省',226,'Y'),('EB09ED0F-7ADA-4F2A-B74F-75626FA9E11C','ELEMENT_FIELD','zh','postAddress','详细地址','ADDRESS',0,'N'),('EB294302-208A-4CCC-BF6C-9A117D77CEC7','SURVEY_STATUS','zh','2','未开始','',2,'N'),('EBEC66D4-AC07-4818-A3CC-F35980832E3A','LOV_CITY','zh','济宁市','J-济宁市','山东省',134,'Y'),('EC742F1F-F548-4D72-9598-7FD800C288F8','LOV_CITY','zh','咸阳市','X-咸阳市','陕西省',321,'Y'),('EC99B84A-2E0D-4880-83C1-AD5F0D987656','LOV_CITY','zh','琼中黎族苗族自治县','Q-琼中黎族苗族自治县','海南省',236,'Y'),('ED35AA18-1C19-44F7-AD8B-AC13BB4062D0','LOV_CITY','zh','赤峰市','C-赤峰市','内蒙古自治区',50,'Y'),('ed75748b-5186-4a18-976a-0e9f95c26dfd','POSTCODE_STATUS','zh','POSTCODE_INACTIVITY','无效','',2,'N'),('ed7b4396-3d5d-4ef0-8193-5921a66045bb','FREQUENCY_EXT','zh','(PRIVERY = 1)','1次','',2,NULL),('EDC3F1D1-779D-4B5C-BB55-F928EAADF87F','LOV_CITY','zh','葫芦岛市','H-葫芦岛市','辽宁省',118,'Y'),('EE4EEEC7-CF60-4366-BFB8-06361140CDB7','LOV_CITY','zh','迪庆藏族自治州','D-迪庆藏族自治州','云南省',65,'Y'),('EE5D76E6-7ACB-4FDB-960B-649B2EF0BBBD','ORDER_FIELD','zh','customer.originalId','客户ID','CUSTOMER_ID',0,'N'),('EED47681-0545-43C7-8BC4-83A21A9A0574','LOV_CITY','zh','东莞市','D-东莞市','广东省',69,'Y'),('EF076AB0-3398-42D8-9F10-B2A96983BBA0','LOV_CITY','zh','吕梁市','L-吕梁市','山西省',190,'Y'),('EF71E408-B090-4CAA-8080-F15557B2C765','ELEMENT_FIELD','zh','originalId','原系统ID','O_ID',0,'N'),('EFA3C690-C662-43FB-89A2-2EAE5FE54D63','LOV_CITY','zh','四平市','S-四平市','吉林省',264,'Y'),('EFBAE583-8C62-4FE3-AFAE-A6A440B63FCE','LOV_CITY','zh','台州市','T-台州市','浙江省',277,'Y'),('EFEA50AE-A1CC-4BF3-8A7A-1379B79D65D0','LOV_CITY','zh','威海市','W-威海市','山东省',296,'Y'),('F05EAF3E-4428-4B74-BB1D-56C82B8CC3AC','LOV_CITY','zh','三门峡市','S-三门峡市','河南省',242,'Y'),('F07F0331-E770-48BC-8BC3-BFC37B70FCEB','SOURCE_WEBSITE','zh','一号店','一号店',NULL,4,'y'),('F0C50E4A-3751-4E4B-937D-241BC40B2DF0','LOV_CITY','zh','咸宁市','X-咸宁市','湖北省',320,'Y'),('f0d14677-537f-484a-9f0d-a57bf400a2d4','CONTACTWAY_STATUS','zh','M_VALID','有效','',1,'Y'),('F0E736A5-F6A9-4505-81DA-7511E305D0F3','LOV_CITY','zh','温州市','W-温州市','浙江省',299,'Y'),('f1449377-2d48-47ea-a8cc-456875601392','CUSTOMER_SEX','zh','M_SEX_MAN','男','',1,'N'),('f1807db5-37c9-4e81-9015-176e235af81b','PRODUCT_TYPE','zh','M_OTHERPRODUCTS','其它','',4,'Y'),('F19D6617-0CA2-4A8B-877B-185C2020BD86','PRODUCT_FIELD','zh','productNum','商品编号','PRODUCT_NUM',0,'N'),('F1E2737F-5077-4182-B6B4-70DF95DFBDA5','LOV_CITY','zh','泸州市','L-泸州市','四川省',189,'Y'),('F26EF074-872B-490D-A90F-ECBAFC96002C','LOV_CITY','zh','林芝地区','L-林芝地区','西藏自治区',176,'Y'),('F2AAFE7E-7853-4BD8-98EF-E6DADA4B02BF','LOV_CITY','zh','安康市','A-安康市','陕西省',7,'Y'),('F3455A89-F0EC-458F-AAC1-E70AE5E1C425','LOV_CITY','zh','海口市','H-海口市','海南省',97,'Y'),('F34CBFFC-E545-42ED-ABDF-E1C493CBA867','SURVEY_QUES_GROUP','zh','SURVEY_MARKET','市场调研','',1,'N'),('F48FCAF2-F213-42A5-AD19-9D63C69FA260','LOV_CITY','zh','商洛市','S-商洛市','陕西省',248,'Y'),('F51986FF-FFFD-4592-BF1D-3BF0F5F6208B','DATA_TYPE','zh','product','商品','',0,'N'),('F520E087-39AB-4F2C-A022-117FAB41AF61','LOV_CITY','zh','新乡市','X-新乡市','河南省',330,'Y'),('F53D36BB-4747-4A19-A4D1-03298F4F45CC','LOV_CITY','zh','佛山市','F-佛山市','广东省',75,'Y'),('F7074417-603F-4D92-9CEE-5D95B3EF8295','LOV_CITY','zh','本溪市','B-本溪市','辽宁省',29,'Y'),('f710243c-53ea-426f-a6cd-998bf1312402','SKIP_TYPE','en','2','neutral','',2,'N'),('f72bb322-d937-44e0-830e-e8ede1ae62ae','TRANS_TYPE','zh','M_CAMPAIGN','参加活动','',5,'N'),('F7564397-200A-4038-8603-6F649188104E','TRATE_STATUS','zh','Z','订单完成',NULL,1,'N'),('F779DFF2-993A-423F-A980-7CD40BD21443','LOV_CITY','zh','克孜勒苏柯尔克孜自治州','K-克孜勒苏柯尔克孜自治州','新疆维吾尔自治区',159,'Y'),('F82BEF2B-7E31-4432-B120-EDFC45DC9CEF','LOV_CITY','zh','毕节市','B-毕节市','贵州省',30,'Y'),('F8895DFA-ADFA-43DD-84A7-95E5D5591134','LOV_CITY','zh','梅州市','M-梅州市','广东省',196,'Y'),('f8fced79-78ec-4866-bf0d-68378c20bc1f','MM_SEG_IF','en','1','Yes','',1,'N'),('F9198691-4EF3-499D-A587-96B6AE405A63','LOV_CITY','zh','桃园县','T-桃园县','台湾省',282,'Y'),('F91DC9D1-09A7-4AB9-96D8-7BE42BD0D453','CUSTOMER_FIELD','zh','homeTel','家庭电话','HOME_TEL',0,'N'),('F962FBC2-158B-4D0A-9654-92A989C30F87','RESPOSE_FIELD','zh','channel','渠道类型','RESPONSE_CHANNEL',0,'N'),('FA0212BC-9A9F-4244-B4AC-A5289BC6FE88','ORDER_STATUS','zh','ORDER_STATUS_ACCEPTED','接受订单','',1,'N'),('FA05B517-03F6-43D3-875F-C1C1B26AC7BE','PRIMARY_PRODUCT_CATEGORY','zh','PT_7','T恤',NULL,1,'N'),('FA748E2F-8A06-4EA3-9A89-3F0AC389E63C','LOV_CITY','zh','基隆市','J-基隆市','台湾省',130,'Y'),('FA776A3B-4724-4696-BFD1-67B8E00DBBCB','LOV_CITY','zh','高雄市','G-高雄市','台湾省',84,'Y'),('FB24239A-EC38-4E69-BBA8-A569FBDB6F00','LOV_CITY','zh','朝阳市','C-朝阳市','辽宁省',43,'Y'),('FB79DFFF-EEC1-4B6E-9781-BAE65919ED8D','LOV_CITY','zh','喀什地区','K-喀什地区','新疆维吾尔自治区',156,'Y'),('fb87ea07-b31e-492d-9e93-7c09d0608787','DQM_DATA_ACTION','zh','M_DELETE','删除','',0,'N'),('fb933319-c71a-43af-b690-ad2360ea1b8c','MM_QUERY_OPTION','zh','SIGN_IN','确认到货','',3,'N'),('FCAD2D01-9DC9-4FA9-A8CB-2AF575958220','IMPORT_RULE','zh','mobileTel=MOBILE_TEL','移动电话','',2,'N'),('FCBCF220-FF4F-4489-B340-411023B3671B','LOV_CITY','zh','鹤岗市','H-鹤岗市','黑龙江省',110,'Y'),('fcbdb33b-b2a9-440e-aa47-fcff27e41f0e','TOTAL_ORDER_AMOUNT_EXT','zh','(MONEY IS NULL OR MONEY<=2000)','2千以下','',1,NULL),('FDDB958D-511D-4203-9A64-4DAFFE8CDBB3','LOV_CITY','zh','新余市','X-新余市','江西省',331,'Y'),('fe7b10a4-4293-4f6d-9e83-87cb722c77ef','SKIP_TYPE','en','3','unstuousness','',3,'N'),('FEAAEB2C-807E-4EF1-B8DA-FDD1BBD04A13','LOV_CITY','zh','昌江黎族自治县','C-昌江黎族自治县','海南省',37,'Y'),('ff038e39-b2cb-45b9-abb4-dd87fedd1bbd','GIFT_ORDER_STATUS','zh','GIFT_ORDER_STATUS_CANCEL','取消','',6,'N'),('FF03B56C-CF3F-4560-A36B-3EF4C43D0135','LOV_CITY','zh','郴州市','C-郴州市','湖南省',45,'Y'),('ff378405-e66e-41ce-a9f5-b50c213964f5','DQM_DATA_ACTION','zh','M_UPDATE','修改','',0,'N'),('ff5bed28-f72c-41bb-8157-bbba3ecbd5e5','MM_TREATMENT_VARIABLE3','zh','$$data.account_name$$','$$data.account_name$$','account_name',1,'N'),('ff5bed28-f72c-41bb-8157-bbba3ecbd5e7','MM_TREATMENT_VARIABLE2','zh','account_name','客户名称','account',1,'N'),('ff5bed28-f72c-41bb-8157-bbba3ecbd5e9','MM_TREATMENT_VARIABLE','zh','account','客户',NULL,2,'N'),('ff5bed28-f72c-41bb-8157-bbba3ecbd5ec','VOCATION_TYPE','zh','M_BANK','银行','',1,'Y'),('FROM_1','SEARCH_SCOPE','zh','PRIMARY_PRODUCT','主商品','',1,'N'),('FROM_2','SEARCH_SCOPE','zh','SECONDARY_PRODUCT','非主商品','',2,'N'),('Init0000000001','SEX_TYPE','en','M_MALE','Male','',2,'N'),('Init0000000002','SEX_TYPE','en','M_FEMALE','Female','',1,'N'),('Init0000000042','POSITION_TYPE','en','M_CSR','CSR','',1,'N'),('Init0000000043','POSITION_TYPE','en','M_TEAMLEADER','Team Leader(TL)','',2,'N'),('Init0000000044','POSITION_TYPE','en','M_SUPERVISOR','Supervisor','',3,'N'),('Init0000000045','POSITION_TYPE','en','M_QA','QA','',4,'N'),('Init0000000046','POSITION_TYPE','en','M_OPERATIONMANAGER','Operation Manager','',5,'N'),('Init0000000047','POSITION_TYPE','en','M_PROJECTMANAGER','Project Manager','',6,'N'),('Init0000000048','POSITION_TYPE','en','M_BUSINESSDIRECTOR','Business Director','',7,'N'),('Init0000000049','POSITION_TYPE','en','M_VP','VP','',8,'N'),('Init0000000050','POSITION_TYPE','en','M_OTHERS','Other','',9,'N'),('Init0000000058','CUSTOMER_SOURCE','en','M_FRIENDINTRODUCTION','Friend Introduction','',1,'N'),('Init0000000059','CUSTOMER_SOURCE','en','M_MEDIA','Media','',2,'N'),('Init0000000060','CUSTOMER_SOURCE','en','M_OUTSIDEADV','Outside Advertisement','',3,'N'),('Init0000000061','CUSTOMER_SOURCE','en','M_ELEVATORADV','Elevator Advertisement','',4,'N'),('Init0000000062','CUSTOMER_SOURCE','en','M_TVADV','TV Advertisement','',5,'N'),('Init0000000063','CUSTOMER_SOURCE','en','M_NETWORK','Network','',6,'N'),('Init0000000064','CUSTOMER_SOURCE','en','M_OTHERS','Other','',7,'N'),('Init0000000077','LOV_REGION','en','LOV_REGION_DB','Northeast','',6,'N'),('Init0000000078','LOV_REGION','en','LOV_REGION_HB','North','',3,'N'),('Init0000000079','LOV_REGION','en','LOV_REGION_HD','East','',1,'N'),('Init0000000080','LOV_REGION','en','LOV_REGION_XN','Southwest','',7,'N'),('Init0000000081','LOV_REGION','en','LOV_REGION_HN','South','',2,'N'),('Init0000000082','LOV_REGION','en','LOV_REGION_HX','West','',4,'N'),('Init0000000083','LOV_REGION','en','LOV_REGION_HZ','Middle','',5,'N'),('Init0000000084','LOV_REGION','en','LOV_REGION_XB','Northwest','',8,'N'),('Init0000000085','STORE_TYPE','en','STORE_TYPE_Online','Online','',2,'N'),('Init0000000086','STORE_TYPE','en','STORE_TYPE_Offline','Offline','',1,'N'),('Init0000000087','STORE_STATUS','en','STORE_STATUS_Active','Active','',1,'N'),('Init0000000088','STORE_STATUS','en','STORE_STATUS_InActive','InActive','',2,'N'),('Init0000000089','EMPLOYEE_TYPE','en','EMPLOYEE_TYPE_BA','Sales BA','',1,'N'),('Init0000000090','EMPLOYEE_TYPE','en','EMPLOYEE_TYPE_NQ','Other','',2,'N'),('Init0000000091','EMPLOYEE_STATUS','en','EMPLOYEE_STATUS_Active','Active','',1,'N'),('Init0000000092','EMPLOYEE_STATUS','en','EMPLOYEE_STATUS_InActive','InActive','',2,'N'),('Init0000000093','TASK_STATUS','en','TASK_STATUS_NEW','New','',1,'N'),('Init0000000094','TASK_STATUS','en','TASK_STATUS_RUNNING','Launching','',2,'N'),('Init0000000095','TASK_STATUS','en','TASK_STATUS_NOTRUN','Planning','',3,'N'),('Init0000000096','TASK_STATUS','en','TASK_STATUS_EXCEPTIONSTOP','Stop','',4,'N'),('Init0000000097','TASK_REPEATUNIT','en','TASK_REPEATUNIT_HOUR','Hour','',1,'N'),('Init0000000098','TASK_REPEATUNIT','en','TASK_REPEATUNIT_DAY','Day','',2,'N'),('Init0000000099','TASK_REPEATUNIT','en','TASK_REPEATUNIT_WEEK','Week','',3,'N'),('Init0000000100','TASK_REPEATUNIT','en','TASK_REPEATUNIT_MONTH','Month','',4,'N'),('Init0000000101','TASKPARAM_TYPE','en','TASKPARAM_TYPE_CLASS','Class Name','',1,'N'),('Init0000000102','TASKPARAM_TYPE','en','TASKPARAM_TYPE_METHOD','Function Name','',2,'N'),('Init0000000103','TASKPARAM_TYPE','en','TASKPARAM_TYPE_STRING','String','',3,'N'),('Init0000000104','TASKPARAM_TYPE','en','TASKPARAM_TYPE_NUMBER','Number','',4,'N'),('Init0000000105','TASKPARAM_TYPE','en','TASKPARAM_TYPE_DATETIME','Date','',5,'N'),('Init0000000106','KEYDATATRACE_MODULE','en','M_CUSTOMER','Customer','',1,'N'),('Init0000000107','KEYDATATRACE_MODULE','en','M_ORDER','Order','',2,'N'),('Init1000000001','POINTTYPE_EXPIRE','en','M_MEMBERPERIOD','Same AS Member Period','',1,'N'),('Init1000000002','POINTTYPE_EXPIRE','en','M_FIXDATE','Fix Date','',2,'N'),('Init1000000003','POINTTYPE_EXPIRE','en','M_PERIOD','Period','',3,'N'),('Init1000000004','POINTTYPE_UOM','en','M_YEAR','Year','',1,'N'),('Init1000000005','POINTTYPE_UOM','en','M_MONTH','Month','',2,'N'),('Init1000000006','TIER_UOM','en','M_YEAR','Year','',1,'N'),('Init1000000007','TIER_UOM','en','M_MONTH','Month','',2,'N'),('Init1000000008','TOTAL_ATTRIBUTE_UOM','en','M_YEAR','Year','',1,'N'),('Init1000000009','TOTAL_ATTRIBUTE_UOM','en','M_MONTH','Month','',2,'N'),('Init1000000010','TOTAL_ATTRIBUTE_UOM','en','M_DAY','Day','',3,'N'),('Init1000000011','TOTAL_ATTRIBUTE_UOM','en','M_MEMBER_PERIOD','Member Period','',4,'N'),('Init1000000012','TIER_PERIODCALCULATE','en','M_DAY','By Day','',1,'N'),('Init1000000013','TIER_PERIODCALCULATE','en','M_MONTH','By Month','',2,'N'),('Init1000000014','TIER_PERIODCALCULATE','en','M_NEXTMONTH','By Next Month','',3,'N'),('Init1000000015','TIER_PERIODCALCULATE','en','M_YEAR','By Year of This Month','',4,'N'),('Init1000000016','TIER_PERIODCALCULATE','en','M_YEARNEXTMONTH','By Year of Next Month','',5,'N'),('Init1000000017','TIER_PERIODCALCULATE','en','M_YEARLASTDAY','By End of Year','',6,'N'),('Init1000000018','ATTR_DATATYPE','en','M_INTEGER','Integer','',1,'N'),('Init1000000019','ATTR_DATATYPE','en','M_STRING','String','',2,'N'),('Init1000000020','ATTR_DATATYPE','en','M_FLOAT','Float','',3,'N'),('Init1000000021','ATTR_DATATYPE','en','M_DATE','Date','',4,'N'),('Init1000000022','ATTR_ATTRTYPE','en','M_TOTAL','TOTAL','',1,'N'),('Init1000000023','ATTR_ATTRTYPE','en','M_MEMBER','MEMBER','',2,'N'),('Init1000000024','ATTR_ATTRTYPE','en','M_TRANSACTION','TRANSACTION','',3,'N'),('Init1000000025','ATTR_ATTRTYPE','en','M_PROGRAM','PROGRAM','',4,'N'),('Init1000000026','ATTR_ATTRTYPE','en','M_PROMOTION','PROMOTION','',5,'N'),('Init1000000027','ATTR_ATTRTYPE','en','M_MEMBERPOINTS','Point','',6,'N'),('Init1000000028','ATTR_ATTRTYPE','en','M_MEMBERTIER','Tier','',7,'N'),('Init1000000029','ATTR_ATTRTYPE','en','M_SYSTEM','SYSTEM','',8,'N'),('Init1000000030','ATTR_ATTRTYPE','en','M_CUSTOMIZE','Customization','',9,'N'),('Init1000000031','TOTALATTR_TOTALTYPE','en','M_COUNT','By Count','',1,'N'),('Init1000000032','TOTALATTR_TOTALTYPE','en','M_AMOUNT','By Amount','',2,'N'),('Init1000000033','PROMOTION_TYPE','en','M_BASE','Base Accumulate','',1,'N'),('Init1000000034','PROMOTION_TYPE','en','M_BONUS','Additional Bonus','',2,'N'),('Init1000000035','PROMOTION_TYPE','en','M_TIER','Tier Change','',3,'N'),('Init1000000036','PROMOTION_TYPE','en','M_QUALIFY','Membership Judgement','',4,'N'),('Init1000000037','PROMOTION_TYPE','en','M_REDEEM','Redemption','',5,'N'),('Init1000000038','PROMOTION_TYPE','en','M_CANCEL','Refund','',7,'N'),('Init1000000039','PROMOTION_TYPE','en','M_RENEWAL','Renewal','',6,'N'),('Init1000000040','PROMOTION_TYPE','en','M_CAMPAIGN','Campaign Response','',8,'N'),('Init1000000041','PROMOTION_TYPE','en','M_GIFT','Point Present','',9,'N'),('Init1000000042','PROMOTION_TYPE','en','M_DISQUALIFY','Disqualify','',10,'N'),('Init1000000043','PROMOTION_INCLUDEPRODUCT','en','M_ALLPRODUCT','All Product','',1,'N'),('Init1000000044','PROMOTION_INCLUDEPRODUCT','en','M_INCLUDEPRODUCT','Special Product','',2,'N'),('Init1000000045','PROMOTION_INCLUDEPRODUCT','en','M_EXCLUDEPRODUCT','Exclude Product','',3,'N'),('Init1000000046','PROMOTION_SOURCE','en','M_ORDER','By Order','',1,'N'),('Init1000000047','PROMOTION_SOURCE','en','M_MEMBER','By Member','',3,'N'),('Init1000000048','PROMOTION_SOURCE','en','M_ORDER_ITEM','By Order Item','',2,'N'),('Init1000000049','PROMOTION_GRADE','en','M_ALLTIER','All Tier','',1,'N'),('Init1000000050','PROMOTION_GRADE','en','M_INCLUDETIER','Include Tier','',2,'N'),('Init1000000051','PROMOTION_GRADE','en','M_EXCLUDETIER','Exclude Tier','',3,'N'),('Init1000000052','PROMOTION_RUNMODE','en','M_REALTIME','Real Time','',1,'N'),('Init1000000053','PROMOTION_RUNMODE','en','M_TIMING','By Define Time','',2,'N'),('Init1000000054','CRITERIA_COMPARECRITERIA','en','M_EQUALS','Equal','',1,'N'),('Init1000000055','CRITERIA_COMPARECRITERIA','en','M_NOTEQUAL','Unequal to','',2,'N'),('Init1000000056','CRITERIA_COMPARECRITERIA','en','M_GREATER','Greater','',3,'N'),('Init1000000057','CRITERIA_COMPARECRITERIA','en','M_GREATERANDEQUAL','Greater and Equal','',4,'N'),('Init1000000058','CRITERIA_COMPARECRITERIA','en','M_LESS','Less','',5,'N'),('Init1000000059','CRITERIA_COMPARECRITERIA','en','M_LESSANDEQUAL','Less and Equal','',6,'N'),('Init1000000060','CRITERIA_COMPARECRITERIA','en','M_BIRTHMONTH','Birth Month','',7,'N'),('Init1000000061','CRITERIA_COMPARECRITERIA','en','M_BIRTHWEEK','Birth Week','',8,'N'),('Init1000000062','CRITERIA_COMPARECRITERIA','en','M_BIRTHDAY','Birthday','',9,'N'),('Init1000000063','CRITERIA_COMPARECRITERIA','en','M_INCLUDECOUPON','Include Coupon','',10,'N'),('Init1000000064','CRITERIA_OPERATE','en','M_PLUS','Plus','',1,'N'),('Init1000000065','CRITERIA_OPERATE','en','M_SUBTRACT','Minus','',2,'N'),('Init1000000066','CRITERIA_OPERATE','en','M_MULTIPLE','Multiple','',3,'N'),('Init1000000067','CRITERIA_OPERATE','en','M_DIVIDE','Divide','',4,'N'),('Init1000000068','ACTION_ACTIONTYPE','en','M_ASSIGNPOINTS','Point Present','',1,'N'),('Init1000000069','ACTION_ACTIONTYPE','en','M_REDEEMPOINTS','Point Deduct','',2,'N'),('Init1000000070','ACTION_ACTIONTYPE','en','M_UPGRADE','Upgrade','',3,'N'),('Init1000000071','ACTION_ACTIONTYPE','en','M_DEGRADE','Downgrade','',4,'N'),('Init1000000072','ACTION_ACTIONTYPE','en','M_UPDATEATTR','Update Property','',5,'N'),('Init1000000073','ACTION_ACTIONTYPE','en','M_QUALIFYMEMBER','Membership Judgement','',6,'N'),('Init1000000074','ACTION_ACTIONTYPE','en','M_RENEWAL','Renewal','',7,'N'),('Init1000000075','ACTION_ACTIONTYPE','en','M_DISQUALIFY','Disqualify','',8,'N'),('Init1000000076','MEMBER_MEMBERTYPE','en','M_INDIVIDUAL','Individual','',1,'N'),('Init1000000077','MEMBER_MEMBERTYPE','en','M_HOUSEHOLD','Family','',2,'N'),('Init1000000078','MEMBER_MEMBERTYPE','en','M_GROUP','Corporation','',3,'N'),('Init1000000079','ADJUST_ADJUSTTYPE','en','M_PLUS','Plus','',1,'N'),('Init1000000080','ADJUST_ADJUSTTYPE','en','M_SUBTRACT','Minus','',2,'N'),('Init1000000081','ADJUST_ADJUSTTYPE','en','M_PURGE','Clean','',3,'N'),('Init1000000082','ADJUST_STATUS','en','M_PENDING','Pending','',1,'N'),('Init1000000083','ADJUST_STATUS','en','M_PROCESSED','Finish','',2,'N'),('Init1000000084','TRANS_TYPE','en','M_ACCRUAL','Purchase','',1,'N'),('Init1000000085','TRANS_TYPE','en','M_REDEEM','Redeem','',2,'N'),('Init1000000086','TRANS_TYPE','en','M_REFUND','Refund','',2,'N'),('Init1000000087','TRANS_TYPE','en','M_GIFT','Point Present','',4,'N'),('Init1000000088','TRANS_TYPE','en','M_CAMPAIGN','Campaign Response','',3,'N'),('Init1000000089','TRANS_STATUS','en','M_PENDING','Pending','',1,'N'),('Init1000000090','TRANS_STATUS','en','M_PROCESSED','Finish','',3,'N'),('Init1000000091','MEMBER_CARD_TIER','en','MEMBER_CARD_TIER_LS','Interim','',1,'N'),('Init1000000092','MEMBER_CARD_TIER','en','MEMBER_CARD_TIER_TK','Cupreous','',2,'N'),('Init1000000093','MEMBER_CARD_TIER','en','MEMBER_CARD_TIER_YK','Silvern','',3,'N'),('Init1000000094','MEMBER_CARD_TIER','en','MEMBER_CARD_TIER_JK','Golden','',4,'N'),('Init1000000095','MEMBER_CARD_TIER','en','MEMBER_CARD_TIER_BJK','Platinic','',5,'N'),('Init1000000096','MEMBER_CARD_TIER','en','MEMBER_CARD_TIER_ZSK','Dimond','',6,'N'),('Init1000000097','MEMBER_CARD_STATUS','en','MEMBER_CARD_STATUS_HD','Active','',1,'N'),('Init1000000098','MEMBER_CARD_STATUS','en','MEMBER_CARD_STATUS_GQ','Overdue','',2,'N'),('Init1000000099','MEMBER_CARD_STATUS','en','MEMBER_CARD_STATUS_DS','Loss','',3,'N'),('Init1000000100','MEMBER_CARD_STATUS','en','MEMBER_CARD_STATUS_ZX','Unregister','',4,'N'),('Init1000000101','POINTS_DETAIL_TYPE','en','M_BASE','Base Accumulate','',1,'N'),('Init1000000102','POINTS_DETAIL_TYPE','en','M_BONUS','Additional Bonus','',2,'N'),('Init1000000103','POINTS_DETAIL_TYPE','en','M_REDEEM','Redemption','',3,'N'),('Init1000000104','POINTS_DETAIL_TYPE','en','M_CANCEL','Refund','',4,'N'),('Init1000000105','POINTS_DETAIL_TYPE','en','M_CAMPAIGN','Campaign Response','',5,'N'),('Init1000000106','POINTS_DETAIL_TYPE','en','M_GIFT','Point Present','',6,'N'),('Init1000000107','POINTS_DETAIL_TYPE','en','M_ADJUST','Point Adjust','',7,'N'),('Init1000000108','POINTS_DETAIL_TYPE','en','M_TRANSFER','Point Transfer','',8,'N'),('Init1000000109','REDEEM_PERIOD','en','M_CURRENT','Current Period','',1,'N'),('Init1000000110','REDEEM_PERIOD','en','M_LAST','Last Period','',2,'N'),('Init1000000111','REDEEM_STATUS','en','M_WAITING','Waiting','',1,'N'),('Init1000000112','REDEEM_STATUS','en','M_FINISH','Finish','',2,'N'),('Init1000000113','REDEEM_STATUS','en','M_CANCEL','Cancel','',3,'N'),('Init1000000114','MODIFY_ATTRIBUTE','en','M_PLUS','Plus','',1,'N'),('Init1000000115','MODIFY_ATTRIBUTE','en','M_SUBTRACT','Minus','',2,'N'),('Init1000000116','MODIFY_ATTRIBUTE','en','M_MULTIPLE','Multiple','',3,'N'),('Init1000000117','MODIFY_ATTRIBUTE','en','M_DIVIDE','Divide','',4,'N'),('Init1000000118','MODIFY_ATTRIBUTE','en','M_ASSIGN','Assign Point','',5,'N'),('m000001','HAS_EMAIL','zh','1','有','',1,'N'),('m000002','HAS_EMAIL','zh','0','无','',2,'N'),('M_PROVINCE_1','LOV_PROVINCE','zh','安徽省','A-安徽','',1,'Y'),('M_PROVINCE_10','LOV_PROVINCE','zh','河北省','H-河北','',10,'Y'),('M_PROVINCE_11','LOV_PROVINCE','zh','河南省','H-河南','',11,'Y'),('M_PROVINCE_12','LOV_PROVINCE','zh','黑龙江省','H-黑龙江','',12,'Y'),('M_PROVINCE_13','LOV_PROVINCE','zh','湖北省','H-湖北','',13,'Y'),('M_PROVINCE_14','LOV_PROVINCE','zh','湖南省','H-湖南','',14,'Y'),('M_PROVINCE_15','LOV_PROVINCE','zh','吉林省','J-吉林','',15,'Y'),('M_PROVINCE_16','LOV_PROVINCE','zh','江苏省','J-江苏','',16,'Y'),('M_PROVINCE_17','LOV_PROVINCE','zh','江西省','J-江西','',17,'Y'),('M_PROVINCE_18','LOV_PROVINCE','zh','辽宁省','L-辽宁','',18,'Y'),('M_PROVINCE_19','LOV_PROVINCE','zh','内蒙古自治区','N-内蒙古','',19,'Y'),('M_PROVINCE_2','LOV_PROVINCE','zh','北京','B-北京','',2,'Y'),('M_PROVINCE_20','LOV_PROVINCE','zh','宁夏回族自治区','N-宁夏','',20,'Y'),('M_PROVINCE_21','LOV_PROVINCE','zh','青海省','Q-青海','',21,'Y'),('M_PROVINCE_22','LOV_PROVINCE','zh','山东省','S-山东','',22,'Y'),('M_PROVINCE_23','LOV_PROVINCE','zh','山西省','S-山西','',23,'Y'),('M_PROVINCE_24','LOV_PROVINCE','zh','陕西省','S-陕西','',24,'Y'),('M_PROVINCE_25','LOV_PROVINCE','zh','上海','S-上海','',25,'Y'),('M_PROVINCE_26','LOV_PROVINCE','zh','四川省','S-四川','',26,'Y'),('M_PROVINCE_27','LOV_PROVINCE','zh','天津','T-天津','',27,'Y'),('M_PROVINCE_28','LOV_PROVINCE','zh','西藏自治区','X-西藏','',28,'Y'),('M_PROVINCE_29','LOV_PROVINCE','zh','新疆维吾尔自治区','X-新疆','',29,'Y'),('M_PROVINCE_3','LOV_PROVINCE','zh','重庆','C-重庆','',3,'Y'),('M_PROVINCE_30','LOV_PROVINCE','zh','云南省','Y-云南','',30,'Y'),('M_PROVINCE_31','LOV_PROVINCE','zh','浙江省','Z-浙江','',31,'Y'),('M_PROVINCE_4','LOV_PROVINCE','zh','福建省','F-福建','',4,'Y'),('M_PROVINCE_5','LOV_PROVINCE','zh','甘肃省','G-甘肃','',5,'Y'),('M_PROVINCE_6','LOV_PROVINCE','zh','广东省','G-广东','',6,'Y'),('M_PROVINCE_7','LOV_PROVINCE','zh','广西壮族自治区','G-广西','',7,'Y'),('M_PROVINCE_8','LOV_PROVINCE','zh','贵州省','G-贵州','',8,'Y'),('M_PROVINCE_9','LOV_PROVINCE','zh','海南省','H-海南','',9,'Y'),('s000001','SIGNON_TYPE','zh','1','1个月以内','',6,'N'),('s000002','SIGNON_TYPE','zh','2','1个月以上','',5,'N'),('s000003','SIGNON_TYPE','zh','3','2个月以内','',4,'N'),('s000004','SIGNON_TYPE','zh','4','2个月以上','',3,'N'),('s000005','SIGNON_TYPE','zh','5','3个月以内','',2,'N'),('s000006','SIGNON_TYPE','zh','6','3个月以上','',1,'N'),('SOURCE_1','SOURCE_TYPE','zh','CB','中粮B2B商城','',1,'Y'),('SOURCE_2','SOURCE_TYPE','zh','YH','一号店',NULL,5,'Y'),('SOURCE_3','SOURCE_TYPE','zh','TB','淘宝',NULL,4,'Y'),('SOURCE_4','SOURCE_TYPE','zh','CC','中粮B2C商城',NULL,2,'Y'),('SOURCE_5','SOURCE_TYPE','zh','JD','京东',NULL,5,'Y'),('SOURCE_6','SOURCE_TYPE','zh','WX','微信',NULL,3,'Y');

/*Table structure for table `m_loy_order` */

DROP TABLE IF EXISTS `m_loy_order`;

CREATE TABLE `m_loy_order` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `STORE_NUM` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `BRAND_ID` varchar(40) DEFAULT NULL,
  `PURCHASE_COUNTER` varchar(40) DEFAULT NULL,
  `ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `VALID_PAYMENT` decimal(20,2) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `CURRENCY` varchar(40) DEFAULT NULL,
  `STORE_NAME` varchar(100) DEFAULT NULL,
  `STORE_CITY` varchar(40) DEFAULT NULL,
  `MEMBER_NUM` varchar(40) DEFAULT NULL,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `REDEEM_PERIOD` varchar(40) DEFAULT NULL,
  `REDEEM_TOTAL_POINTS` int(11) DEFAULT NULL,
  `REDEEM_STATUS` varchar(40) DEFAULT NULL,
  `ADD_POINTS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_LOY_ORDER_1` (`CUSTOMER_ID`) USING BTREE,
  KEY `IX_LOY_ORDER_2` (`MEMBER_ID`) USING BTREE,
  KEY `IX_LOY_ORDER_3` (`STORE_ID`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_order` */

insert  into `m_loy_order` values ('cc7cc1fe-2590-11e4-8bff-00163e021993','11',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-13 16:29:21','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cc41a-2590-11e4-8bff-00163e021993','10',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-13 08:33:22','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cc532-2590-11e4-8bff-00163e021993','3',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'464.00','464.00','eac805a4-2588-11e4-8bff-00163e021993','20140815141810730',NULL,'2014-08-12 11:48:21','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cc62c-2590-11e4-8bff-00163e021993','5',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-12 16:32:50','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cc71c-2590-11e4-8bff-00163e021993','2',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'168.00','168.00','eac805a4-2588-11e4-8bff-00163e021993','20140815141810730',NULL,'2014-08-12 11:20:23','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cc816-2590-11e4-8bff-00163e021993','12',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-13 16:39:52','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cc8fc-2590-11e4-8bff-00163e021993','6',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-12 16:35:49','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7ccc8a-2590-11e4-8bff-00163e021993','7',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-12 16:51:45','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7ccd7a-2590-11e4-8bff-00163e021993','17',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac805a4-2588-11e4-8bff-00163e021993','20140815141810730',NULL,'2014-08-14 08:41:22','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cce60-2590-11e4-8bff-00163e021993','13',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-13 16:50:20','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7ccf3c-2590-11e4-8bff-00163e021993','1',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac805a4-2588-11e4-8bff-00163e021993','20140815141810730',NULL,'2014-08-11 14:40:04','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cd02c-2590-11e4-8bff-00163e021993','4',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'196.00','196.00','eac80680-2588-11e4-8bff-00163e021993','20140815141810739',NULL,'2014-08-12 15:05:05','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cd112-2590-11e4-8bff-00163e021993','9',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-13 08:33:12','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cd1ee-2590-11e4-8bff-00163e021993','15',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'294.00','294.00','eac805a4-2588-11e4-8bff-00163e021993','20140815141810730',NULL,'2014-08-13 21:05:24','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cd2ca-2590-11e4-8bff-00163e021993','16',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac805a4-2588-11e4-8bff-00163e021993','20140815141810730',NULL,'2014-08-13 23:24:56','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cd39c-2590-11e4-8bff-00163e021993','8',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-12 17:28:46','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cd478-2590-11e4-8bff-00163e021993','14',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'266.00','266.00','eac803ec-2588-11e4-8bff-00163e021993','20140815141810465',NULL,'2014-08-13 16:50:47','M_ACCRUAL','M_PENDING',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7ce918-2590-11e4-8bff-00163e021993','3',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'464.00','464.00','eac805a4-2588-11e4-8bff-00163e021993','1',NULL,'2014-08-12 11:48:21','M_EMPLOYEE','M_PROCESSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cea4e-2590-11e4-8bff-00163e021993','2',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'168.00','168.00','eac805a4-2588-11e4-8bff-00163e021993','1',NULL,'2014-08-12 11:20:23','M_EMPLOYEE','M_PROCESSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7ceb3e-2590-11e4-8bff-00163e021993','17',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac805a4-2588-11e4-8bff-00163e021993','1',NULL,'2014-08-14 08:41:22','M_EMPLOYEE','M_PROCESSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cec06-2590-11e4-8bff-00163e021993','1',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac805a4-2588-11e4-8bff-00163e021993','1',NULL,'2014-08-11 14:40:04','M_EMPLOYEE','M_PROCESSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7cecd8-2590-11e4-8bff-00163e021993','15',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'294.00','294.00','eac805a4-2588-11e4-8bff-00163e021993','1',NULL,'2014-08-13 21:05:24','M_EMPLOYEE','M_PROCESSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('cc7ceda0-2590-11e4-8bff-00163e021993','16',NULL,'b72a0045-2bea-4ea7-95f7-14755a94d597',NULL,NULL,'98.00','98.00','eac805a4-2588-11e4-8bff-00163e021993','1',NULL,'2014-08-13 23:24:56','M_EMPLOYEE','M_PROCESSED',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `m_loy_order_bk` */

DROP TABLE IF EXISTS `m_loy_order_bk`;

CREATE TABLE `m_loy_order_bk` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `STORE_NUM` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `BRAND_ID` varchar(40) DEFAULT NULL,
  `PURCHASE_COUNTER` varchar(40) DEFAULT NULL,
  `ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `VALID_PAYMENT` decimal(20,2) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `CURRENCY` varchar(40) DEFAULT NULL,
  `STORE_NAME` varchar(100) DEFAULT NULL,
  `STORE_CITY` varchar(40) DEFAULT NULL,
  `MEMBER_NUM` varchar(40) DEFAULT NULL,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `REDEEM_PERIOD` varchar(40) DEFAULT NULL,
  `REDEEM_TOTAL_POINTS` int(11) DEFAULT NULL,
  `REDEEM_STATUS` varchar(40) DEFAULT NULL,
  `ADD_POINTS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_order_bk` */

/*Table structure for table `m_loy_order_item` */

DROP TABLE IF EXISTS `m_loy_order_item`;

CREATE TABLE `m_loy_order_item` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PRODUCT_SKU` varchar(40) DEFAULT NULL,
  `PRODUCT_LINE` varchar(40) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(40) DEFAULT NULL,
  `AMOUNT` decimal(20,2) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `USE_POINTS` int(11) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `CAMPAIGN` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `OLD_ORDER` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_order_item` */

/*Table structure for table `m_loy_order_item_bk` */

DROP TABLE IF EXISTS `m_loy_order_item_bk`;

CREATE TABLE `m_loy_order_item_bk` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PRODUCT_SKU` varchar(40) DEFAULT NULL,
  `PRODUCT_LINE` varchar(40) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(40) DEFAULT NULL,
  `AMOUNT` decimal(20,2) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `USE_POINTS` int(11) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `CAMPAIGN` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `OLD_ORDER` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_order_item_bk` */

/*Table structure for table `m_loy_order_org` */

DROP TABLE IF EXISTS `m_loy_order_org`;

CREATE TABLE `m_loy_order_org` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_order_org` */

insert  into `m_loy_order_org` values ('cc7d05f6-2590-11e4-8bff-00163e021993','cc7ce918-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d06f0-2590-11e4-8bff-00163e021993','cc7cea4e-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d072c-2590-11e4-8bff-00163e021993','cc7ceb3e-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0772-2590-11e4-8bff-00163e021993','cc7cec06-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d07a4-2590-11e4-8bff-00163e021993','cc7cecd8-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d07e0-2590-11e4-8bff-00163e021993','cc7ceda0-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d081c-2590-11e4-8bff-00163e021993','cc7cc1fe-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d08c6-2590-11e4-8bff-00163e021993','cc7cc41a-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d08f8-2590-11e4-8bff-00163e021993','cc7cc62c-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d092a-2590-11e4-8bff-00163e021993','cc7cc816-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d095c-2590-11e4-8bff-00163e021993','cc7cc8fc-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0984-2590-11e4-8bff-00163e021993','cc7ccc8a-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d09b6-2590-11e4-8bff-00163e021993','cc7cce60-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d09e8-2590-11e4-8bff-00163e021993','cc7cd112-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0a1a-2590-11e4-8bff-00163e021993','cc7cd39c-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0a4c-2590-11e4-8bff-00163e021993','cc7cd478-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0a74-2590-11e4-8bff-00163e021993','cc7cc532-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0aa6-2590-11e4-8bff-00163e021993','cc7cc71c-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0ad8-2590-11e4-8bff-00163e021993','cc7ccd7a-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0b00-2590-11e4-8bff-00163e021993','cc7ccf3c-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0b32-2590-11e4-8bff-00163e021993','cc7cd1ee-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0b64-2590-11e4-8bff-00163e021993','cc7cd2ca-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7d0b96-2590-11e4-8bff-00163e021993','cc7cd02c-2590-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870');

/*Table structure for table `m_loy_program` */

DROP TABLE IF EXISTS `m_loy_program`;

CREATE TABLE `m_loy_program` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `BRAND` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `BEGIN_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT '0',
  `ORG_ID` varchar(40) DEFAULT NULL,
  `PROGRAM_XML` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_program` */

insert  into `m_loy_program` values ('b72a0045-2bea-4ea7-95f7-14755a94d597','1111','金欧利会员',NULL,NULL,'2014-08-13 00:00:00','2014-12-31 00:00:00','ladmin','2014-08-13 00:00:00',NULL,NULL,1,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870','{\"data\":[{\"view\":\"Root\",\"xml\":\"<mxGraphModel>\\n  <root>\\n    <mxCell id=\\\"0\\\"/>\\n    <mxCell id=\\\"1\\\" parent=\\\"0\\\"/>\\n    <mxCell id=\\\"fdbc2c36-8fc4-91b7-7321-9066b983af55\\\" value=\\\"开始\\\" style=\\\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a08.png\\\" parent=\\\"1\\\" vertex=\\\"1\\\" type=\\\"Start\\\">\\n      <mxGeometry x=\\\"110\\\" y=\\\"60\\\" width=\\\"35\\\" height=\\\"35\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"3c88e804-00a6-bf0f-0e01-cea2ecb19717\\\" value=\\\"返利积分会员升降级\\\" style=\\\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a48.png\\\" parent=\\\"1\\\" vertex=\\\"1\\\" type=\\\"Promotion\\\" info=\\\"52209d50-f89d-4ce3-9e7c-1e6d9be72675\\\">\\n      <mxGeometry x=\\\"230\\\" y=\\\"60\\\" width=\\\"35\\\" height=\\\"35\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"2\\\" parent=\\\"1\\\" source=\\\"fdbc2c36-8fc4-91b7-7321-9066b983af55\\\" target=\\\"3c88e804-00a6-bf0f-0e01-cea2ecb19717\\\" edge=\\\"1\\\">\\n      <mxGeometry relative=\\\"1\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"df1ba119-1a0d-b445-b0b7-d34280ab7f6b\\\" value=\\\"结束\\\" style=\\\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a07.png\\\" parent=\\\"1\\\" vertex=\\\"1\\\" type=\\\"End\\\">\\n      <mxGeometry x=\\\"410\\\" y=\\\"70\\\" width=\\\"35\\\" height=\\\"35\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"3\\\" parent=\\\"1\\\" source=\\\"3c88e804-00a6-bf0f-0e01-cea2ecb19717\\\" target=\\\"df1ba119-1a0d-b445-b0b7-d34280ab7f6b\\\" edge=\\\"1\\\">\\n      <mxGeometry relative=\\\"1\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"3df54f95-27ea-1235-2ad7-71a555406e6e\\\" value=\\\"开始\\\" style=\\\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a08.png\\\" parent=\\\"1\\\" vertex=\\\"1\\\" type=\\\"Start\\\">\\n      <mxGeometry x=\\\"110\\\" y=\\\"180\\\" width=\\\"35\\\" height=\\\"35\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"22e97af4-8fb6-cdfe-e5d3-945a64b0bd15\\\" value=\\\"积分返利\\\" style=\\\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a48.png\\\" parent=\\\"1\\\" vertex=\\\"1\\\" type=\\\"Promotion\\\" info=\\\"5b4aee86-0517-4749-8b07-e94ed67df198\\\">\\n      <mxGeometry x=\\\"220\\\" y=\\\"180\\\" width=\\\"35\\\" height=\\\"35\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"4\\\" parent=\\\"1\\\" source=\\\"3df54f95-27ea-1235-2ad7-71a555406e6e\\\" target=\\\"22e97af4-8fb6-cdfe-e5d3-945a64b0bd15\\\" edge=\\\"1\\\">\\n      <mxGeometry relative=\\\"1\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"b7baf10f-084c-092c-299a-e955756161c5\\\" value=\\\"结束\\\" style=\\\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a07.png\\\" parent=\\\"1\\\" vertex=\\\"1\\\" type=\\\"End\\\">\\n      <mxGeometry x=\\\"392.5\\\" y=\\\"190\\\" width=\\\"35\\\" height=\\\"35\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n    <mxCell id=\\\"5\\\" parent=\\\"1\\\" source=\\\"22e97af4-8fb6-cdfe-e5d3-945a64b0bd15\\\" target=\\\"b7baf10f-084c-092c-299a-e955756161c5\\\" edge=\\\"1\\\">\\n      <mxGeometry relative=\\\"1\\\" as=\\\"geometry\\\"/>\\n    </mxCell>\\n  </root>\\n</mxGraphModel>\\n\",\"parent\":\"\",\"nodeId\":\"Root\"}]}');

/*Table structure for table `m_loy_program_org` */

DROP TABLE IF EXISTS `m_loy_program_org`;

CREATE TABLE `m_loy_program_org` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_loy_program_org` */

insert  into `m_loy_program_org` values ('f70782fd-1fab-4cc9-bd91-e923e1e154bc','b72a0045-2bea-4ea7-95f7-14755a94d597','7F57AE5B-EC02-4032-BDF6-3AE13E23B870');

/*Table structure for table `m_m_campaign_summary` */

DROP TABLE IF EXISTS `m_m_campaign_summary`;

CREATE TABLE `m_m_campaign_summary` (
  `ID` varchar(40) NOT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_BUDGET` decimal(20,2) DEFAULT NULL,
  `CAMPAIGN_COST` decimal(20,2) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_m_campaign_summary` */

/*Table structure for table `m_m_period` */

DROP TABLE IF EXISTS `m_m_period`;

CREATE TABLE `m_m_period` (
  `ID` varchar(40) NOT NULL,
  `APPLY_NUM` int(11) DEFAULT NULL,
  `PLAN_NUM` int(11) DEFAULT NULL,
  `PERIOD_NUM` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `EXPECTED_START_TIME` datetime DEFAULT NULL,
  `EXPECTED_END_TIME` datetime DEFAULT NULL,
  `TREATMENT_ID` varchar(40) DEFAULT NULL,
  `DELIVERY_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_m_period` */

/*Table structure for table `m_m_program` */

DROP TABLE IF EXISTS `m_m_program`;

CREATE TABLE `m_m_program` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(120) DEFAULT NULL,
  `CODE` varchar(20) DEFAULT NULL,
  `STATUS` varchar(20) DEFAULT NULL,
  `PROGRAM_TYPE` varchar(20) DEFAULT NULL,
  `CURRENCY` varchar(20) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `PLAN_START` date DEFAULT NULL,
  `PLAN_END` date DEFAULT NULL,
  `GOAL` text,
  `DESCRIPTION` text,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD` varchar(40) DEFAULT NULL,
  `LAST_UPD_BY` datetime DEFAULT NULL,
  `PLAN_BUDGET` double DEFAULT NULL,
  `BUDGET` double DEFAULT NULL,
  `TOTAL_ORDER_RATE` double DEFAULT NULL,
  `TOTAL_RESP_RATE` double DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_m_program` */

/*Table structure for table `m_m_program_summary` */

DROP TABLE IF EXISTS `m_m_program_summary`;

CREATE TABLE `m_m_program_summary` (
  `ID` varchar(40) NOT NULL,
  `BUDGET` decimal(20,2) DEFAULT NULL,
  `COST` decimal(20,2) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_m_program_summary` */

/*Table structure for table `m_m_summary_info` */

DROP TABLE IF EXISTS `m_m_summary_info`;

CREATE TABLE `m_m_summary_info` (
  `ID` varchar(40) NOT NULL,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `MEMBER_NUM` varchar(40) DEFAULT NULL,
  `LAST_PUR_DATE` datetime DEFAULT NULL,
  `ACC_PUR_AMOUNT` decimal(20,2) DEFAULT NULL,
  `LAST_MPUR_AMOUNT` decimal(20,2) DEFAULT NULL,
  `ACC_PUR_TIME` int(11) DEFAULT NULL,
  `LAST_MPUR_TIME` int(11) DEFAULT NULL,
  `FIRST_PUR_DATE` datetime DEFAULT NULL,
  `FIRST_PUR_AMOUNT` decimal(20,2) DEFAULT NULL,
  `CUSTOMER_AMOUNT_LEVEL` varchar(40) DEFAULT NULL,
  `COMMENTS` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_m_summary_info` */

/*Table structure for table `m_m_template` */

DROP TABLE IF EXISTS `m_m_template`;

CREATE TABLE `m_m_template` (
  `ID` varchar(40) NOT NULL,
  `TEMPLATE_NAME` varchar(100) DEFAULT NULL,
  `TEMPLATE_NOTES` text,
  `CREATER` varchar(50) DEFAULT NULL,
  `CREATEDATE` datetime DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `XML` longtext,
  `TYPE` varchar(12) DEFAULT NULL,
  `gxml` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_m_template` */

/*Table structure for table `m_marketing_order_item` */

DROP TABLE IF EXISTS `m_marketing_order_item`;

CREATE TABLE `m_marketing_order_item` (
  `ID` varchar(40) NOT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `RESPONSEGROUP_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_SKU` varchar(40) DEFAULT NULL,
  `AMOUNT` decimal(20,2) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `ORI_AMOUNT` decimal(20,2) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `RECORD_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_marketing_order_item` */

/*Table structure for table `m_maxvalue_rela` */

DROP TABLE IF EXISTS `m_maxvalue_rela`;

CREATE TABLE `m_maxvalue_rela` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `MAX_VALUE_ID` varchar(40) DEFAULT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_maxvalue_rela` */

/*Table structure for table `m_member` */

DROP TABLE IF EXISTS `m_member`;

CREATE TABLE `m_member` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_NUM` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_TYPE` varchar(40) DEFAULT NULL,
  `ACOUNT_ID` varchar(40) DEFAULT NULL,
  `HOUSEHOLD_ID` varchar(40) DEFAULT NULL,
  `ADMIN_COUNTER` varchar(40) DEFAULT NULL,
  `REGISTER_COUNTER` varchar(40) DEFAULT NULL,
  `JOIN_DATE` datetime DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `IS_EMPLOYEE` int(11) DEFAULT NULL,
  `IS_SPECIAL` int(11) DEFAULT NULL,
  `IS_JOINTLY` int(11) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `PRIMARY_CARD_ID` varchar(40) DEFAULT NULL,
  `MEMBER_TIRE` varchar(40) DEFAULT NULL,
  `MEMBER_POINTS` int(11) DEFAULT NULL,
  `GRANDFATHER_GUID` varchar(40) DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  `BIND_FLAG` tinyint(1) DEFAULT '0',
  `IS_ATTENTION` int(11) DEFAULT NULL,
  `IS_MOBILE_REGISTER` int(11) DEFAULT NULL,
  `EMP_RECOMMEND` varchar(50) DEFAULT NULL,
  `HEY_CONPONS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_MEMBER_1` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_member` */

insert  into `m_member` values ('72ad96ee-2d42-11e4-8bff-00163e021993','16',NULL,'20140826094003641','M_INDIVIDUAL',NULL,NULL,NULL,NULL,'2014-08-27 01:00:14','b72a0045-2bea-4ea7-95f7-14755a94d597',0,NULL,NULL,'ladmin','2014-08-27 01:00:14','ladmin','2014-08-27 01:00:14',1,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870','2014-08-27 01:00:14','2015-08-27 01:00:14',NULL,NULL,NULL,NULL,NULL,'0',0,1,0,'0',NULL),('eac803ec-2588-11e4-8bff-00163e021993','6','杨洪鹏','20140815141810465','M_INDIVIDUAL',NULL,NULL,NULL,NULL,'2014-08-17 05:04:31','b72a0045-2bea-4ea7-95f7-14755a94d597',1,NULL,NULL,'ladmin','2014-08-17 05:04:31','ladmin','2014-08-17 05:04:31',1,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870','2014-08-17 05:04:31','2015-08-17 05:04:31',NULL,NULL,NULL,NULL,NULL,'0',0,1,0,'0',NULL),('eac805a4-2588-11e4-8bff-00163e021993','1','绍瑞','20140815141810730','M_INDIVIDUAL',NULL,NULL,NULL,NULL,'2014-08-17 05:04:31','b72a0045-2bea-4ea7-95f7-14755a94d597',1,NULL,NULL,'ladmin','2014-08-17 05:04:31','ladmin','2014-08-17 05:04:31',1,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870','2014-08-17 05:04:31','2015-08-17 05:04:31',NULL,NULL,NULL,NULL,NULL,'0',0,1,0,'1',NULL),('eac80680-2588-11e4-8bff-00163e021993','4','王斌','20140815141810739','M_INDIVIDUAL',NULL,NULL,NULL,NULL,'2014-08-17 05:04:31','b72a0045-2bea-4ea7-95f7-14755a94d597',1,NULL,NULL,'ladmin','2014-08-17 05:04:31','ladmin','2014-08-17 05:04:31',1,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870','2014-08-17 05:04:31','2015-08-17 05:04:31',NULL,NULL,NULL,NULL,NULL,'0',0,1,0,'0',NULL);

/*Table structure for table `m_member_active_his` */

DROP TABLE IF EXISTS `m_member_active_his`;

CREATE TABLE `m_member_active_his` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CHANGE_TYPE` int(11) DEFAULT NULL,
  `CHANGE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_member_active_his` */

/*Table structure for table `m_member_attr_data` */

DROP TABLE IF EXISTS `m_member_attr_data`;

CREATE TABLE `m_member_attr_data` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `VARCHAR1` varchar(40) DEFAULT NULL,
  `VARCHAR2` varchar(40) DEFAULT NULL,
  `VARCHAR3` varchar(40) DEFAULT NULL,
  `VARCHAR4` varchar(40) DEFAULT NULL,
  `VARCHAR5` varchar(40) DEFAULT NULL,
  `INT1` int(11) DEFAULT NULL,
  `INT2` int(11) DEFAULT NULL,
  `INT3` int(11) DEFAULT NULL,
  `INT4` int(11) DEFAULT NULL,
  `INT5` int(11) DEFAULT NULL,
  `FLOAT1` double DEFAULT NULL,
  `FLOAT2` double DEFAULT NULL,
  `FLOAT3` double DEFAULT NULL,
  `FLOAT4` double DEFAULT NULL,
  `FLOAT5` double DEFAULT NULL,
  `DATE1` datetime DEFAULT NULL,
  `DATE2` datetime DEFAULT NULL,
  `DATE3` datetime DEFAULT NULL,
  `DATE4` datetime DEFAULT NULL,
  `DATE5` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_member_attr_data` */

/*Table structure for table `m_member_card` */

DROP TABLE IF EXISTS `m_member_card`;

CREATE TABLE `m_member_card` (
  `ID` varchar(40) NOT NULL,
  `CARD_NUMBER` varchar(40) DEFAULT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `CARD_TIER` varchar(40) DEFAULT NULL,
  `REQUEST_DATE` datetime DEFAULT NULL,
  `ISSUED_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_member_card` */

/*Table structure for table `m_member_org` */

DROP TABLE IF EXISTS `m_member_org`;

CREATE TABLE `m_member_org` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_member_org` */

insert  into `m_member_org` values ('72ad9de2-2d42-11e4-8bff-00163e021993','72ad96ee-2d42-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('e8241862-6750-4618-92d3-8cd9344ba4f4','1bd4f6d0-814c-4f01-b712-878010b0c7da',NULL),('eac80d2e-2588-11e4-8bff-00163e021993','eac803ec-2588-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('eac80dc4-2588-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('eac80e0a-2588-11e4-8bff-00163e021993','eac80680-2588-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870');

/*Table structure for table `m_member_tier` */

DROP TABLE IF EXISTS `m_member_tier`;

CREATE TABLE `m_member_tier` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `TIER_CLASS` varchar(40) DEFAULT NULL,
  `TIER` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_member_tier` */

insert  into `m_member_tier` values ('72ada508-2d42-11e4-8bff-00163e021993','72ad96ee-2d42-11e4-8bff-00163e021993','1842b1ae-f301-49e7-a13e-96086fee03e0','b77555b8-fcb8-41aa-9bf5-b7c273e94f25','2014-08-27 01:00:14','2015-08-27 01:00:14',1),('eac815bc-2588-11e4-8bff-00163e021993','eac803ec-2588-11e4-8bff-00163e021993','1842b1ae-f301-49e7-a13e-96086fee03e0','b77555b8-fcb8-41aa-9bf5-b7c273e94f25','2014-08-17 05:04:31','2015-08-17 05:04:31',1),('eac81670-2588-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','1842b1ae-f301-49e7-a13e-96086fee03e0','b77555b8-fcb8-41aa-9bf5-b7c273e94f25','2014-08-17 05:04:31','2015-08-17 05:04:31',1),('eac816ca-2588-11e4-8bff-00163e021993','eac80680-2588-11e4-8bff-00163e021993','1842b1ae-f301-49e7-a13e-96086fee03e0','b77555b8-fcb8-41aa-9bf5-b7c273e94f25','2014-08-17 05:04:31','2015-08-17 05:04:31',1);

/*Table structure for table `m_merge_detail` */

DROP TABLE IF EXISTS `m_merge_detail`;

CREATE TABLE `m_merge_detail` (
  `ID` varchar(40) NOT NULL,
  `M_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `RECORD_ID` varchar(40) DEFAULT NULL,
  `RECORD_TYPE` varchar(40) DEFAULT NULL,
  `RECORD_FIELD` varchar(40) DEFAULT NULL,
  `ORI_VALUE` varchar(40) DEFAULT NULL,
  `MERGE_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_merge_detail` */

/*Table structure for table `m_merge_relation` */

DROP TABLE IF EXISTS `m_merge_relation`;

CREATE TABLE `m_merge_relation` (
  `ID` varchar(40) NOT NULL,
  `M_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `S_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `MERGE_DATE` datetime DEFAULT NULL,
  `CANCEL_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_merge_relation` */

/*Table structure for table `m_message` */

DROP TABLE IF EXISTS `m_message`;

CREATE TABLE `m_message` (
  `ID` varchar(40) NOT NULL,
  `NUMBER` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `TITLE` varchar(40) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `DELIVERY` int(11) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `CONTENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_message` */

/*Table structure for table `m_message_pos` */

DROP TABLE IF EXISTS `m_message_pos`;

CREATE TABLE `m_message_pos` (
  `ID` varchar(40) NOT NULL,
  `MESSAGE_ID` varchar(40) DEFAULT NULL,
  `POS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_message_pos` */

/*Table structure for table `m_mpt_info` */

DROP TABLE IF EXISTS `m_mpt_info`;

CREATE TABLE `m_mpt_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL COMMENT '用户ID',
  `pub_id` int(11) NOT NULL COMMENT 'weixin_pub.id',
  `keyword` varchar(255) DEFAULT NULL COMMENT '关键字，用单个空格分隔',
  `match_type` tinyint(1) DEFAULT NULL COMMENT '匹配类型：1-完全匹配，0-包含匹配',
  `title` varchar(500) DEFAULT NULL COMMENT '图文消息标题',
  `content` text COMMENT '图文消息描述',
  `txt_content` text COMMENT '文本回复的内容',
  `picurl` varchar(500) DEFAULT NULL COMMENT '图片链接',
  `info_type` varchar(255) DEFAULT NULL COMMENT '行业分类的子类名称',
  `info_type_id` varchar(255) DEFAULT NULL COMMENT '信息所属类型',
  `detail_content` longtext COMMENT '图文详细页内容',
  `url` varchar(500) DEFAULT NULL COMMENT '点击图文消息时的链接，该字段非空时，detail_content字段无效，与detail_content字段必须有一个非空',
  `next_ids` varchar(100) DEFAULT NULL COMMENT '非空即表示是多条图文消息，用逗号分隔的图文消息ID串',
  `type` tinyint(1) DEFAULT NULL COMMENT '1-为文本 2-为图文 3-为多图文（即next_ids为0时是图文，不为0时是多图文）',
  `status` tinyint(1) DEFAULT '1' COMMENT '1-有效，0-无效',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `op_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后操作时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `pub_id` (`pub_id`) USING BTREE,
  KEY `match_type` (`match_type`) USING BTREE,
  KEY `info_type_id` (`info_type_id`) USING BTREE,
  KEY `next_ids` (`next_ids`) USING BTREE,
  KEY `keyword` (`keyword`)
) ENGINE=MyISAM AUTO_INCREMENT=122 DEFAULT CHARSET=utf8 COMMENT=' 图文设置表';

/*Data for the table `m_mpt_info` */

/*Table structure for table `m_mpt_info_bk` */

DROP TABLE IF EXISTS `m_mpt_info_bk`;

CREATE TABLE `m_mpt_info_bk` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `path` varchar(100) NOT NULL,
  `text` varchar(255) DEFAULT NULL,
  `active` varchar(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created` varchar(40) NOT NULL,
  `create_date` date DEFAULT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_mpt_info_bk` */

/*Table structure for table `m_offer` */

DROP TABLE IF EXISTS `m_offer`;

CREATE TABLE `m_offer` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `CODE` varchar(30) DEFAULT NULL,
  `STARTDATE` datetime DEFAULT NULL,
  `ENDDATE` datetime DEFAULT NULL,
  `OFFER_TYPE` varchar(20) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_offer` */

/*Table structure for table `m_offer_content` */

DROP TABLE IF EXISTS `m_offer_content`;

CREATE TABLE `m_offer_content` (
  `ID` varchar(40) NOT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `OFFER_ID` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_offer_content` */

/*Table structure for table `m_offer_treatment` */

DROP TABLE IF EXISTS `m_offer_treatment`;

CREATE TABLE `m_offer_treatment` (
  `OFFER_ID` varchar(40) DEFAULT NULL,
  `TREATMENT_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_offer_treatment` */

/*Table structure for table `m_order` */

DROP TABLE IF EXISTS `m_order`;

CREATE TABLE `m_order` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `ORI_ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  `STATUS` varchar(64) DEFAULT NULL,
  `COMMENT` text,
  `CURRENCY` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(50) DEFAULT NULL,
  `POSID` varchar(40) DEFAULT NULL,
  `INVOICE` varchar(40) DEFAULT NULL,
  `BA` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `QUANTITY_SUM` int(11) DEFAULT NULL,
  `COD_STATUS` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(80) DEFAULT NULL,
  `GENDER` varchar(80) DEFAULT NULL,
  `PROVINCE` varchar(80) DEFAULT NULL,
  `CITY` varchar(80) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL,
  `buyer_nick` varchar(50) DEFAULT NULL,
  `receiver_address` text,
  `receiver_mobile` varchar(32) DEFAULT NULL,
  `receiver_phone` varchar(32) DEFAULT NULL,
  `buyer_email` varchar(128) DEFAULT NULL,
  `CUSTOMER_O_ID` varchar(40) DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  `Hey_Conpons` varchar(20) DEFAULT NULL,
  `MASTER_IMPORT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_CUSTOMER_O_ID` (`CUSTOMER_O_ID`),
  KEY `INDEX_ORDER_NUM` (`ORDER_NUM`),
  KEY `IX_M_ORDER_1` (`CUSTOMER_ID`),
  KEY `IX_M_ORDER_2` (`TRANS_DATE`),
  KEY `IX_M_ORDER_3` (`CREATE_DATE`,`STATUS`,`ORG_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order` */

insert  into `m_order` values ('20140815141810120','11',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-13 16:29:21','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810151','10',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-13 08:33:22','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810216','3',NULL,'281.20','296.00',NULL,'20140815141810465',NULL,'2014-08-23 09:37:20','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-23 09:40:03'),('20140815141810465','5',NULL,'98.00','98.00',NULL,'20140826094003641',NULL,'2014-08-26 09:08:39','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'0','','2014-08-26 09:40:03'),('20140815141810540','2',NULL,'93.10','98.00',NULL,'20140815141810739',NULL,'2014-08-22 15:18:44','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'丰台区88号','丰台区88号',NULL,NULL,NULL,NULL,'丰台区88号','18954834868','18954834868',NULL,NULL,NULL,'0','','2014-08-22 15:40:03'),('20140815141810550','12',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-13 16:39:52','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810560','6',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-12 16:35:49','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810626','7',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-12 16:51:45','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810633','17',NULL,'98.00','98.00',NULL,'20140815141810730',NULL,'2014-08-14 08:41:22','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'漳州二路','漳州二路',NULL,NULL,NULL,NULL,'漳州二路','1531882','1531882',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810680','13',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-13 16:50:20','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810730','1',NULL,'159.60','168.00',NULL,'20140815141810465',NULL,'2014-08-22 10:10:03','1','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山东省 青岛市 崂山区 松岭路169号崂山软件园B503','山东省 青岛市 崂山区 松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'山东省 青岛市 崂山区 松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-22 10:40:05'),('20140815141810739','4',NULL,'93.10','98.00',NULL,'20140815141810730',NULL,'2014-08-23 22:56:52','1','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','山东省 青岛市 市南区 漳州二路',NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','1531882','1531882',NULL,NULL,NULL,'0','','2014-08-23 23:40:04'),('20140815141810774','9',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-13 08:33:12','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810789','15',NULL,'294.00','294.00',NULL,'20140815141810730',NULL,'2014-08-13 21:05:24','1','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','山东省 青岛市 市南区 漳州二路',NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','1531882','1531882',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810840','16',NULL,'98.00','98.00',NULL,'20140815141810730',NULL,'2014-08-13 23:24:56','0','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'漳州二路','漳州二路',NULL,NULL,NULL,NULL,'漳州二路','1531882','1531882',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810919','8',NULL,'98.00','98.00',NULL,'20140815141810465',NULL,'2014-08-12 17:28:46','1','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10'),('20140815141810986','14',NULL,'266.00','266.00',NULL,'20140815141810465',NULL,'2014-08-13 16:50:47','1','Z','',NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,NULL,'0','','2014-08-15 14:18:10');

/*Table structure for table `m_order_bak` */

DROP TABLE IF EXISTS `m_order_bak`;

CREATE TABLE `m_order_bak` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `ORI_ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `CURRENCY` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `POSID` varchar(40) DEFAULT NULL,
  `INVOICE` varchar(40) DEFAULT NULL,
  `BA` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `QUANTITY_SUM` int(11) DEFAULT NULL,
  `COD_STATUS` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(80) DEFAULT NULL,
  `GENDER` varchar(80) DEFAULT NULL,
  `PROVINCE` varchar(80) DEFAULT NULL,
  `CITY` varchar(80) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` varchar(36) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_bak` */

/*Table structure for table `m_order_bk` */

DROP TABLE IF EXISTS `m_order_bk`;

CREATE TABLE `m_order_bk` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `ORI_ORDER_AMOUNT` decimal(20,2) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  `STATUS` varchar(64) DEFAULT NULL,
  `COMMENT` text,
  `CURRENCY` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(50) DEFAULT NULL,
  `POSID` varchar(40) DEFAULT NULL,
  `INVOICE` varchar(40) DEFAULT NULL,
  `BA` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `QUANTITY_SUM` int(11) DEFAULT NULL,
  `COD_STATUS` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(80) DEFAULT NULL,
  `GENDER` varchar(80) DEFAULT NULL,
  `PROVINCE` varchar(80) DEFAULT NULL,
  `CITY` varchar(80) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL,
  `buyer_nick` varchar(50) DEFAULT NULL,
  `receiver_address` text,
  `receiver_mobile` varchar(32) DEFAULT NULL,
  `receiver_phone` varchar(32) DEFAULT NULL,
  `buyer_email` varchar(128) DEFAULT NULL,
  `CUSTOMER_O_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_CUSTOMER_O_ID` (`CUSTOMER_O_ID`),
  KEY `INDEX_ORDER_NUM` (`ORDER_NUM`),
  KEY `IX_M_ORDER_1` (`CUSTOMER_ID`),
  KEY `IX_M_ORDER_2` (`TRANS_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_bk` */

/*Table structure for table `m_order_detail` */

DROP TABLE IF EXISTS `m_order_detail`;

CREATE TABLE `m_order_detail` (
  `ID` varchar(40) NOT NULL,
  `COUPON_CODE` varchar(40) DEFAULT NULL,
  `PROMOTION_ID` varchar(40) NOT NULL,
  `POINTS` int(11) DEFAULT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `POINTS_TYPE_ID` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_detail` */

/*Table structure for table `m_order_item` */

DROP TABLE IF EXISTS `m_order_item`;

CREATE TABLE `m_order_item` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PRODUCT_SKU` varchar(100) DEFAULT NULL,
  `AMOUNT` decimal(20,2) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `ORI_AMOUNT` decimal(20,2) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `PRIMARY_PRODUCT_ID` varchar(60) DEFAULT NULL,
  `PRIMARY_PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `PRIMARY_PRODUCT_CATEGORY` varchar(60) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL,
  `ORIGINAL_ID` varchar(40) DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `INDEX_ORIGINAL_ID` (`ORIGINAL_ID`),
  KEY `INX_M_ORDER_ITEM_1` (`ORDER_ID`),
  KEY `INX_M_ORDER_ITEM_2` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_item` */

/*Table structure for table `m_order_item_bak` */

DROP TABLE IF EXISTS `m_order_item_bak`;

CREATE TABLE `m_order_item_bak` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PRODUCT_SKU` varchar(40) DEFAULT NULL,
  `AMOUNT` decimal(20,2) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `ORI_AMOUNT` decimal(20,2) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `PRIMARY_PRODUCT_ID` varchar(60) DEFAULT NULL,
  `PRIMARY_PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `PRIMARY_PRODUCT_CATEGORY` varchar(60) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_item_bak` */

/*Table structure for table `m_order_item_bk` */

DROP TABLE IF EXISTS `m_order_item_bk`;

CREATE TABLE `m_order_item_bk` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PRODUCT_SKU` varchar(100) DEFAULT NULL,
  `AMOUNT` decimal(20,2) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `ORI_AMOUNT` decimal(20,2) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `TRANS_DATE` datetime DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `PRIMARY_PRODUCT_ID` varchar(60) DEFAULT NULL,
  `PRIMARY_PRODUCT_NAME` varchar(100) DEFAULT NULL,
  `PRIMARY_PRODUCT_CATEGORY` varchar(60) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL,
  `ORIGINAL_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_ORIGINAL_ID` (`ORIGINAL_ID`),
  KEY `INX_M_ORDER_ITEM_1` (`ORDER_ID`),
  KEY `INX_M_ORDER_ITEM_2` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_item_bk` */

/*Table structure for table `m_order_org` */

DROP TABLE IF EXISTS `m_order_org`;

CREATE TABLE `m_order_org` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_org` */

insert  into `m_order_org` values ('cc7cd8a6-2590-11e4-8bff-00163e021993','20140815141810120','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cd978-2590-11e4-8bff-00163e021993','20140815141810151','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cd9fa-2590-11e4-8bff-00163e021993','20140815141810216','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cda40-2590-11e4-8bff-00163e021993','20140815141810465','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdaa4-2590-11e4-8bff-00163e021993','20140815141810540','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdb12-2590-11e4-8bff-00163e021993','20140815141810550','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdb58-2590-11e4-8bff-00163e021993','20140815141810560','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdc20-2590-11e4-8bff-00163e021993','20140815141810626','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdc98-2590-11e4-8bff-00163e021993','20140815141810633','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdcde-2590-11e4-8bff-00163e021993','20140815141810680','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdd2e-2590-11e4-8bff-00163e021993','20140815141810730','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdda6-2590-11e4-8bff-00163e021993','20140815141810739','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cde0a-2590-11e4-8bff-00163e021993','20140815141810774','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cde50-2590-11e4-8bff-00163e021993','20140815141810789','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cde8c-2590-11e4-8bff-00163e021993','20140815141810840','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdec8-2590-11e4-8bff-00163e021993','20140815141810919','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('cc7cdf04-2590-11e4-8bff-00163e021993','20140815141810986','7F57AE5B-EC02-4032-BDF6-3AE13E23B870');

/*Table structure for table `m_order_org_bk` */

DROP TABLE IF EXISTS `m_order_org_bk`;

CREATE TABLE `m_order_org_bk` (
  `ID` varchar(40) NOT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_org_bk` */

/*Table structure for table `m_order_payment` */

DROP TABLE IF EXISTS `m_order_payment`;

CREATE TABLE `m_order_payment` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PAYMENT` varchar(10) DEFAULT NULL,
  `AMOUNT` decimal(20,0) DEFAULT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_payment` */

/*Table structure for table `m_org` */

DROP TABLE IF EXISTS `m_org`;

CREATE TABLE `m_org` (
  `ID` varchar(40) NOT NULL,
  `CHINESE_NAME` varchar(40) DEFAULT NULL,
  `ENGLISH_NAME` varchar(30) DEFAULT NULL,
  `ORG_NUM` varchar(40) NOT NULL,
  `PARENT_ORG` varchar(40) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` date DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org` */

insert  into `m_org` values ('7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利','','001','','ladmin','2014-08-13',NULL,NULL);

/*Table structure for table `m_org_campaign` */

DROP TABLE IF EXISTS `m_org_campaign`;

CREATE TABLE `m_org_campaign` (
  `ID` varchar(40) NOT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_campaign` */

insert  into `m_org_campaign` values ('001','001','7F57AE5B-EC02-4032-BDF6-3AE13E23B870');

/*Table structure for table `m_org_category` */

DROP TABLE IF EXISTS `m_org_category`;

CREATE TABLE `m_org_category` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `CATEGORY_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_category` */

/*Table structure for table `m_org_contact` */

DROP TABLE IF EXISTS `m_org_contact`;

CREATE TABLE `m_org_contact` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `CONTACT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_contact` */

/*Table structure for table `m_org_customer` */

DROP TABLE IF EXISTS `m_org_customer`;

CREATE TABLE `m_org_customer` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_ORG_CUSTOMER_1` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_customer` */

insert  into `m_org_customer` values ('062e6da0-2436-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140814111041422'),('062e6e72-2436-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140814111041653'),('062e6ed6-2436-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140814111041747'),('72ad8e6a-2d42-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140826094003641'),('741f7a5a-2460-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140815141810465'),('741f7b9a-2460-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140815141810730'),('741f7c44-2460-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','20140815141810739');

/*Table structure for table `m_org_customer_bk` */

DROP TABLE IF EXISTS `m_org_customer_bk`;

CREATE TABLE `m_org_customer_bk` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_ORG_CUSTOMER_1` (`CUSTOMER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_customer_bk` */

/*Table structure for table `m_org_dataenter` */

DROP TABLE IF EXISTS `m_org_dataenter`;

CREATE TABLE `m_org_dataenter` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `DATA_ENTER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_dataenter` */

/*Table structure for table `m_org_employee` */

DROP TABLE IF EXISTS `m_org_employee`;

CREATE TABLE `m_org_employee` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_employee` */

/*Table structure for table `m_org_event` */

DROP TABLE IF EXISTS `m_org_event`;

CREATE TABLE `m_org_event` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_event` */

/*Table structure for table `m_org_mtemplate` */

DROP TABLE IF EXISTS `m_org_mtemplate`;

CREATE TABLE `m_org_mtemplate` (
  `ORG_ID` varchar(40) DEFAULT NULL,
  `TEMPLATE_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_mtemplate` */

/*Table structure for table `m_org_offer` */

DROP TABLE IF EXISTS `m_org_offer`;

CREATE TABLE `m_org_offer` (
  `ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `OFFER_ID` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_offer` */

/*Table structure for table `m_org_position` */

DROP TABLE IF EXISTS `m_org_position`;

CREATE TABLE `m_org_position` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `POS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_position` */

/*Table structure for table `m_org_product` */

DROP TABLE IF EXISTS `m_org_product`;

CREATE TABLE `m_org_product` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_product` */

/*Table structure for table `m_org_product_bk` */

DROP TABLE IF EXISTS `m_org_product_bk`;

CREATE TABLE `m_org_product_bk` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_product_bk` */

/*Table structure for table `m_org_program` */

DROP TABLE IF EXISTS `m_org_program`;

CREATE TABLE `m_org_program` (
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `ID` varchar(40) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_program` */

/*Table structure for table `m_org_role` */

DROP TABLE IF EXISTS `m_org_role`;

CREATE TABLE `m_org_role` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `ROLE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_role` */

/*Table structure for table `m_org_smartscript` */

DROP TABLE IF EXISTS `m_org_smartscript`;

CREATE TABLE `m_org_smartscript` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `SMART_SCRIPTS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_smartscript` */

/*Table structure for table `m_org_store` */

DROP TABLE IF EXISTS `m_org_store`;

CREATE TABLE `m_org_store` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `STORE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_store` */

/*Table structure for table `m_org_targetlist` */

DROP TABLE IF EXISTS `m_org_targetlist`;

CREATE TABLE `m_org_targetlist` (
  `ID` varchar(40) NOT NULL,
  `TARGETLIST_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_targetlist` */

/*Table structure for table `m_org_trace` */

DROP TABLE IF EXISTS `m_org_trace`;

CREATE TABLE `m_org_trace` (
  `ID` varchar(40) NOT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `TRACE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_org_trace` */

/*Table structure for table `m_payment` */

DROP TABLE IF EXISTS `m_payment`;

CREATE TABLE `m_payment` (
  `ID` varchar(40) NOT NULL,
  `ORDER_NUM` varchar(40) DEFAULT NULL,
  `PAYMENT` varchar(10) DEFAULT NULL,
  `AMOUNT` decimal(20,0) DEFAULT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_payment` */

/*Table structure for table `m_period` */

DROP TABLE IF EXISTS `m_period`;

CREATE TABLE `m_period` (
  `ID` varchar(40) NOT NULL,
  `APPLY_NUM` int(11) DEFAULT NULL,
  `PLAN_NUM` int(11) DEFAULT NULL,
  `PERIOD_NUM` varchar(40) DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `STATE` varchar(40) DEFAULT NULL,
  `EXPECTED_START_TIME` datetime DEFAULT NULL,
  `EXPECTED_END_TIME` datetime DEFAULT NULL,
  `INVITATION_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_period` */

/*Table structure for table `m_point_list` */

DROP TABLE IF EXISTS `m_point_list`;

CREATE TABLE `m_point_list` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `POINTS` double DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `POINT_TYPE_ID` varchar(40) DEFAULT NULL,
  `USED_VALUE` int(11) DEFAULT NULL,
  `PROMOTION_NAME` varchar(40) DEFAULT NULL,
  `PROMOTION_TYPE` varchar(40) DEFAULT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL,
  `MEMBER_PERIOD` varchar(10) DEFAULT NULL,
  `PROCESS_FLAG` int(11) DEFAULT NULL,
  `BORN_DATE` datetime DEFAULT NULL,
  `VALID_FLAG` int(11) DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  `ACT_TYPE` varchar(40) DEFAULT NULL,
  `ACT_SUB_TYPE` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_POINT_LIST_1` (`MEMBER_ID`),
  KEY `IX_M_POINT_LIST_2` (`ORDER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_point_list` */

insert  into `m_point_list` values ('fcb2391e-262e-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','cc7ce918-2590-11e4-8bff-00163e021993',5,'','','2014-08-18 00:53:17','2015-08-18 00:53:17','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',0,'推荐返利','M_BASE','','',0,'0000-00-00 00:00:00',1,'2014-08-18 00:53:17','','',''),('fcb23c70-262e-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','cc7cea4e-2590-11e4-8bff-00163e021993',2,'','','2014-08-18 00:53:17','2015-08-18 00:53:17','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',0,'推荐返利','M_BASE','','',0,'0000-00-00 00:00:00',1,'2014-08-18 00:53:17','','',''),('fcb23d92-262e-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','cc7ceb3e-2590-11e4-8bff-00163e021993',1,'','','2014-08-18 00:53:17','2015-08-18 00:53:17','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',0,'推荐返利','M_BASE','','',0,'0000-00-00 00:00:00',1,'2014-08-18 00:53:17','','',''),('fcb23e96-262e-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','cc7cec06-2590-11e4-8bff-00163e021993',1,'','','2014-08-18 00:53:17','2015-08-18 00:53:17','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',0,'推荐返利','M_BASE','','',0,'0000-00-00 00:00:00',1,'2014-08-18 00:53:17','','',''),('fcb23f90-262e-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','cc7cecd8-2590-11e4-8bff-00163e021993',3,'','','2014-08-18 00:53:17','2015-08-18 00:53:17','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',0,'推荐返利','M_BASE','','',0,'0000-00-00 00:00:00',1,'2014-08-18 00:53:17','','',''),('fcb24094-262e-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','cc7ceda0-2590-11e4-8bff-00163e021993',1,'','','2014-08-18 00:53:17','2015-08-18 00:53:17','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',0,'推荐返利','M_BASE','','',0,'0000-00-00 00:00:00',1,'2014-08-18 00:53:17','','','');

/*Table structure for table `m_point_list_his` */

DROP TABLE IF EXISTS `m_point_list_his`;

CREATE TABLE `m_point_list_his` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `ORDER_ID` varchar(40) DEFAULT NULL,
  `POINTS` int(11) DEFAULT NULL,
  `MEMBER_CARD` varchar(40) DEFAULT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `POINT_TYPE_ID` varchar(40) DEFAULT NULL,
  `USED_VALUE` int(11) DEFAULT NULL,
  `PROMOTION_NAME` varchar(40) DEFAULT NULL,
  `PROMOTION_TYPE` varchar(40) DEFAULT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL,
  `MEMBER_PERIOD` varchar(10) DEFAULT NULL,
  `PROCESS_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_point_list_his` */

/*Table structure for table `m_point_type` */

DROP TABLE IF EXISTS `m_point_type`;

CREATE TABLE `m_point_type` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(40) NOT NULL,
  `BASIS` varchar(40) DEFAULT NULL,
  `PERIOD` int(11) DEFAULT NULL,
  `UOM` varchar(40) DEFAULT NULL,
  `EXPIRE_MONTH` int(11) DEFAULT NULL,
  `EXPIRE_DAY` int(11) DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT NULL,
  `FREEZE_DAY` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_point_type` */

insert  into `m_point_type` values ('60c8ed70-754b-4d4d-b13a-f3d44a009d3a','b72a0045-2bea-4ea7-95f7-14755a94d597','返利积分','M_PERIOD',1,'M_YEAR',0,0,1,0);

/*Table structure for table `m_points` */

DROP TABLE IF EXISTS `m_points`;

CREATE TABLE `m_points` (
  `ID` varchar(40) NOT NULL,
  `POINT_TYPE_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `TOTAL_POINTS` double DEFAULT NULL,
  `VALID_POINTS` double DEFAULT NULL,
  `FOZEN_POINTS` double DEFAULT NULL,
  `LAST_BALANCE` double DEFAULT NULL,
  `LIFETIME_POINTS` double DEFAULT NULL,
  `MEMBER_PERIOD` varchar(10) DEFAULT NULL,
  `LIFETIME_VALID_POINTS` double DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL,
  `FATHER_GUID` varchar(40) DEFAULT NULL,
  `COMB_STATUS` char(1) DEFAULT '0',
  `GIFT_POINTS` int(11) DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IX_M_POINTS_1` (`MEMBER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_points` */

insert  into `m_points` values ('6c8779f2-25e9-11e4-8bff-00163e021993','60c8ed70-754b-4d4d-b13a-f3d44a009d3a','eac803ec-2588-11e4-8bff-00163e021993',113,213,300,400,513,'',613,'2014-08-17 16:35:20','','',700),('a3e5c61e-27ca-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',13,13,0,0,13,'',13,'2014-08-20 02:00:01','','',0),('fe50a456-2636-11e4-8bff-00163e021993','eac805a4-2588-11e4-8bff-00163e021993','60c8ed70-754b-4d4d-b13a-f3d44a009d3a',13,13,0,0,13,'',13,'2014-08-18 01:50:36','','',0);

/*Table structure for table `m_points_adjust` */

DROP TABLE IF EXISTS `m_points_adjust`;

CREATE TABLE `m_points_adjust` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `POINT_TYPE_ID` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `POINTS` int(11) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `DELETE_FLAG` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_points_adjust` */

/*Table structure for table `m_points_his` */

DROP TABLE IF EXISTS `m_points_his`;

CREATE TABLE `m_points_his` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `POINTS_TYPE_ID` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `TOTAL_POINTS` int(11) DEFAULT NULL,
  `POINTS` int(11) DEFAULT NULL,
  `LAST_BALANCE` int(11) DEFAULT NULL,
  `MEMBER_PERIOD` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_points_his` */

/*Table structure for table `m_points_rate` */

DROP TABLE IF EXISTS `m_points_rate`;

CREATE TABLE `m_points_rate` (
  `ID` varchar(40) NOT NULL,
  `CURRENCY_CODE` varchar(40) DEFAULT NULL,
  `AMOUNT` decimal(20,0) DEFAULT NULL,
  `POINTS` decimal(20,0) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_points_rate` */

/*Table structure for table `m_points_transfer` */

DROP TABLE IF EXISTS `m_points_transfer`;

CREATE TABLE `m_points_transfer` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `POINT_TYPE_ID` varchar(50) DEFAULT NULL,
  `MEMBER_TRANSFER_ID` varchar(40) DEFAULT NULL,
  `ALL_TRANSFER` int(11) DEFAULT NULL,
  `POINTS` int(11) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_points_transfer` */

/*Table structure for table `m_position` */

DROP TABLE IF EXISTS `m_position`;

CREATE TABLE `m_position` (
  `ID` varchar(40) NOT NULL,
  `POS_NUM` varchar(40) DEFAULT NULL,
  `POS_NAME` varchar(40) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `NOTES` varchar(100) DEFAULT NULL,
  `POS_TYPE` varchar(40) DEFAULT NULL,
  `PRIMARY_USER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_position` */

/*Table structure for table `m_prg_budget` */

DROP TABLE IF EXISTS `m_prg_budget`;

CREATE TABLE `m_prg_budget` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `MONEY_TYPE` varchar(20) DEFAULT NULL,
  `QUANTITY` int(11) DEFAULT NULL,
  `MONEY` int(11) DEFAULT NULL,
  `DESCRIPTION` text,
  `PROGRAM` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_prg_budget` */

/*Table structure for table `m_procedure_log` */

DROP TABLE IF EXISTS `m_procedure_log`;

CREATE TABLE `m_procedure_log` (
  `log_id` int(11) NOT NULL AUTO_INCREMENT,
  `procedure_name` varchar(32) NOT NULL,
  `insert_amount` int(11) NOT NULL DEFAULT '0',
  `update_amount` int(11) NOT NULL DEFAULT '0',
  `error_amount` int(11) NOT NULL DEFAULT '0',
  `total_amount` int(11) NOT NULL DEFAULT '0',
  `execute_start` datetime NOT NULL,
  `execute_end` datetime NOT NULL,
  `source` varchar(40) NOT NULL,
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

/*Data for the table `m_procedure_log` */

insert  into `m_procedure_log` values (1,'SyncCustomer.MD.Batch',0,0,0,0,'2001-01-01 00:00:00','2014-08-11 00:00:00','金欧利'),(3,'SyncCustomer.MD.Batch',3,0,3,6,'2014-08-11 00:00:00','2014-08-11 00:00:00','金欧利'),(7,'SyncCustomer.MD.Batch',0,3,0,3,'2014-08-11 00:00:00','2014-08-15 14:18:10','金欧利'),(10,'SyncOrder.MD.Batch',17,0,0,17,'2001-01-01 00:00:00','2014-08-15 14:18:10','金欧利'),(11,'SyncCustomer.MD.Batch',0,2,0,2,'2014-08-15 14:18:10','2014-08-22 15:40:03','金欧利'),(12,'SyncOrder.MD.Batch',0,2,0,2,'2014-08-15 14:18:10','2014-08-22 15:40:03','金欧利'),(13,'SyncCustomer.MD.Batch',0,2,0,2,'2014-08-22 15:40:03','2014-08-23 23:40:04','金欧利'),(14,'SyncOrder.MD.Batch',0,2,0,2,'2014-08-22 15:40:03','2014-08-23 23:40:04','金欧利'),(15,'SyncCustomer.MD.Batch',1,0,0,1,'2014-08-23 23:40:04','2014-08-26 09:40:03','金欧利'),(16,'SyncOrder.MD.Batch',0,1,0,1,'2014-08-23 23:40:04','2014-08-26 09:40:03','金欧利');

/*Table structure for table `m_procedure_log_detail` */

DROP TABLE IF EXISTS `m_procedure_log_detail`;

CREATE TABLE `m_procedure_log_detail` (
  `log_detail_id` int(11) NOT NULL AUTO_INCREMENT,
  `log_id` int(11) NOT NULL,
  `error_number` varchar(32) NOT NULL,
  `error_message` varchar(128) NOT NULL,
  `error_state` varchar(32) NOT NULL,
  `error_severity` varchar(32) NOT NULL,
  `error_line` varchar(32) NOT NULL,
  PRIMARY KEY (`log_detail_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

/*Data for the table `m_procedure_log_detail` */

insert  into `m_procedure_log_detail` values (1,1,'2014-08-11 00:00:00','','EXCEPTION','',''),(2,1,'2014-08-11 00:00:00','','EXCEPTION','',''),(4,2,'2014-08-11 00:00:00','','EXCEPTION','',''),(5,2,'2014-08-11 00:00:00','','EXCEPTION','',''),(7,3,'2014-08-11 00:00:00','','EXCEPTION','',''),(8,4,'2014-08-11 00:00:00','','EXCEPTION','',''),(9,4,'2014-08-11 00:00:00','','EXCEPTION','',''),(10,4,'2014-08-11 00:00:00','','EXCEPTION','',''),(11,4,'2014-08-11 00:00:00','','EXCEPTION','','');

/*Table structure for table `m_product` */

DROP TABLE IF EXISTS `m_product`;

CREATE TABLE `m_product` (
  `ID` varchar(40) NOT NULL,
  `PRODUCT_NUM` varchar(60) DEFAULT NULL,
  `NAME` text,
  `NAME_EN` varchar(50) DEFAULT NULL,
  `PRODUCT_LINE` varchar(50) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(30) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `PRODUCT_PRICE` double DEFAULT NULL,
  `SPECIFICATION` varchar(40) DEFAULT NULL,
  `ASSO_PRODUCT_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_STATUS` varchar(32) DEFAULT NULL,
  `PRODUCT_OUT_ID` varchar(100) DEFAULT NULL,
  `PRODUCT_VIOLATION` varchar(1) DEFAULT NULL,
  `PRODUCT_NUMBER` int(11) DEFAULT NULL,
  `PRODUCT_ATTRS` text,
  `DETAIL_URL` varchar(64) DEFAULT NULL,
  `HAS_SHOWCASE` varchar(10) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `O_ID` varchar(100) DEFAULT NULL,
  `SOURCE` varchar(36) DEFAULT NULL,
  `PRODUCT_CATEGORY` varchar(60) DEFAULT NULL,
  `PRIMARY_PRODUCT_ID` varchar(60) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL,
  `PRIMARY_PRODUCT_NAME` text,
  `PRIMARY_MARK` varchar(40) DEFAULT NULL,
  `PRODUCT_CATEGORY_ID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_product` */

/*Table structure for table `m_product_bk` */

DROP TABLE IF EXISTS `m_product_bk`;

CREATE TABLE `m_product_bk` (
  `ID` varchar(40) NOT NULL,
  `PRODUCT_NUM` varchar(60) DEFAULT NULL,
  `NAME` text,
  `NAME_EN` varchar(50) DEFAULT NULL,
  `PRODUCT_LINE` varchar(50) DEFAULT NULL,
  `PRODUCT_TYPE` varchar(30) DEFAULT NULL,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `PRODUCT_PRICE` double DEFAULT NULL,
  `SPECIFICATION` varchar(40) DEFAULT NULL,
  `ASSO_PRODUCT_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_STATUS` varchar(32) DEFAULT NULL,
  `PRODUCT_OUT_ID` varchar(100) DEFAULT NULL,
  `PRODUCT_VIOLATION` varchar(1) DEFAULT NULL,
  `PRODUCT_NUMBER` int(11) DEFAULT NULL,
  `PRODUCT_ATTRS` text,
  `DETAIL_URL` varchar(64) DEFAULT NULL,
  `HAS_SHOWCASE` varchar(10) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `O_ID` varchar(100) DEFAULT NULL,
  `SOURCE` varchar(36) DEFAULT NULL,
  `PRODUCT_CATEGORY` varchar(60) DEFAULT NULL,
  `PRIMARY_PRODUCT_ID` varchar(60) DEFAULT NULL,
  `WEBSITE` varchar(200) DEFAULT NULL,
  `PRIMARY_PRODUCT_NAME` text,
  `PRIMARY_MARK` varchar(40) DEFAULT NULL,
  `PRODUCT_CATEGORY_ID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_product_bk` */

/*Table structure for table `m_product_category` */

DROP TABLE IF EXISTS `m_product_category`;

CREATE TABLE `m_product_category` (
  `ID` varchar(40) NOT NULL,
  `CATEGORY_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_product_category` */

/*Table structure for table `m_product_category_bk` */

DROP TABLE IF EXISTS `m_product_category_bk`;

CREATE TABLE `m_product_category_bk` (
  `ID` varchar(40) NOT NULL,
  `CATEGORY_ID` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_product_category_bk` */

/*Table structure for table `m_promotion` */

DROP TABLE IF EXISTS `m_promotion`;

CREATE TABLE `m_promotion` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(100) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `RUN_MODE` varchar(40) DEFAULT NULL,
  `INCLUDE_PRODUCT` varchar(40) DEFAULT NULL,
  `INCLUDE_TIER` varchar(40) DEFAULT NULL,
  `MAX_LIMIT` int(11) DEFAULT NULL,
  `ALWAYS_APPLY` int(11) DEFAULT NULL,
  `ACTIVE_STATUS` int(11) DEFAULT NULL,
  `CALCULATE_DATE` datetime DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  `PROMOTION_XML` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_promotion` */

insert  into `m_promotion` values ('52209d50-f89d-4ce3-9e7c-1e6d9be72675','返利积分会员升降级','M_QUALIFY','b72a0045-2bea-4ea7-95f7-14755a94d597','M_MEMBER','','M_ALLPRODUCT','M_ALLTIER',0,0,1,NULL,'2014-08-13 00:00:00','2014-12-31 00:00:00',NULL,NULL,'ladmin','2014-08-13 17:06:34','','<mxGraphModel>\n  <root>\n    <mxCell id=\"0\"/>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"674d88be-f728-bf16-5e12-69bd09492ab6\" value=\"升级为注册会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" parent=\"1\" vertex=\"1\" type=\"Start\" info=\"38577303-c2ae-4ea0-bc46-96a2d29679b3\">\n      <mxGeometry x=\"60\" y=\"160\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"78039cfa-5110-6d29-765f-b39393c25067\" value=\"普通升级认证会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" parent=\"1\" vertex=\"1\" type=\"Configure\" info=\"78039cfa-5110-6d29-765f-b39393c25067\">\n      <mxGeometry x=\"220\" y=\"150\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"4\" parent=\"1\" source=\"674d88be-f728-bf16-5e12-69bd09492ab6\" target=\"78039cfa-5110-6d29-765f-b39393c25067\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"acc27b99-14f7-3ea3-8e34-64064db8ac05\" value=\"升级认证会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a58.png\" parent=\"1\" vertex=\"1\" type=\"Up\" info=\"078081b4-098f-49c7-8d03-687ff74673bf\">\n      <mxGeometry x=\"390\" y=\"160\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"5\" parent=\"1\" source=\"78039cfa-5110-6d29-765f-b39393c25067\" target=\"acc27b99-14f7-3ea3-8e34-64064db8ac05\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"9059fe5b-40e3-39e8-2dc4-0e7988fc79a1\" value=\"升级为Vip会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" parent=\"1\" vertex=\"1\" type=\"Start\" info=\"b7b8b5a6-6e00-40a7-8b93-1325ed3ea2d3\">\n      <mxGeometry x=\"50\" y=\"270\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"44a61f53-2780-df04-73e5-2e25c158af12\" value=\"认证会员升级为Vip会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" parent=\"1\" vertex=\"1\" type=\"Configure\" info=\"44a61f53-2780-df04-73e5-2e25c158af12\">\n      <mxGeometry x=\"200\" y=\"260\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"6\" parent=\"1\" source=\"9059fe5b-40e3-39e8-2dc4-0e7988fc79a1\" target=\"44a61f53-2780-df04-73e5-2e25c158af12\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"14c024fc-f2f2-5f43-e9b5-bea6cf5317e0\" value=\"升级VIP会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a58.png\" parent=\"1\" vertex=\"1\" type=\"Up\" info=\"020c84e3-49df-4eff-8a74-fe23832da3dd\">\n      <mxGeometry x=\"370\" y=\"260\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"7\" parent=\"1\" source=\"44a61f53-2780-df04-73e5-2e25c158af12\" target=\"14c024fc-f2f2-5f43-e9b5-bea6cf5317e0\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"2a47aec0-75e1-e460-11d9-2c11a0a953ea\" value=\"降级到认证会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" parent=\"1\" vertex=\"1\" type=\"Start\" info=\"7cf1447d-618b-41d0-b2ad-1f72f9cfa8cf\">\n      <mxGeometry x=\"40\" y=\"380\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"334b5b7a-0910-1b80-d101-07cd4853cc22\" value=\"vip降级认证会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" parent=\"1\" vertex=\"1\" type=\"Configure\" info=\"334b5b7a-0910-1b80-d101-07cd4853cc22\">\n      <mxGeometry x=\"180\" y=\"380\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"8\" parent=\"1\" source=\"2a47aec0-75e1-e460-11d9-2c11a0a953ea\" target=\"334b5b7a-0910-1b80-d101-07cd4853cc22\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"b2103457-2a5c-8081-2a39-3940940eb127\" value=\"降级认证会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a59.png\" parent=\"1\" vertex=\"1\" type=\"Down\" info=\"4c0b8ca1-50c4-4cbe-b3e8-2dc707624ce1\">\n      <mxGeometry x=\"360\" y=\"380\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"9\" parent=\"1\" source=\"334b5b7a-0910-1b80-d101-07cd4853cc22\" target=\"b2103457-2a5c-8081-2a39-3940940eb127\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"fe5d6b75-85af-2372-15a7-ce60791d7653\" value=\"降级普通会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" parent=\"1\" vertex=\"1\" type=\"Start\" info=\"af533dc3-2154-4e5f-b83b-e5e66717274b\">\n      <mxGeometry x=\"30\" y=\"470\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"b08df6b3-ba88-379f-c70f-0cfbec797c49\" value=\"认证降级普通会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" parent=\"1\" vertex=\"1\" type=\"Configure\" info=\"b08df6b3-ba88-379f-c70f-0cfbec797c49\">\n      <mxGeometry x=\"180\" y=\"480\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"10\" parent=\"1\" source=\"fe5d6b75-85af-2372-15a7-ce60791d7653\" target=\"b08df6b3-ba88-379f-c70f-0cfbec797c49\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"167a7052-81ae-9f6e-e410-1d621d689a9f\" value=\"降级普通会员\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a59.png\" parent=\"1\" vertex=\"1\" type=\"Down\" info=\"f709b550-f81c-4ae5-8467-2c9a5a0c3c4a\">\n      <mxGeometry x=\"360\" y=\"480\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"11\" parent=\"1\" source=\"b08df6b3-ba88-379f-c70f-0cfbec797c49\" target=\"167a7052-81ae-9f6e-e410-1d621d689a9f\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n  </root>\n</mxGraphModel>\n'),('5b4aee86-0517-4749-8b07-e94ed67df198','积分返利','M_BONUS','b72a0045-2bea-4ea7-95f7-14755a94d597','M_ORDER','','M_ALLPRODUCT','M_ALLTIER',0,0,1,NULL,'2014-08-13 00:00:00','2014-12-31 00:00:00',NULL,NULL,'ladmin','2014-08-13 17:53:52','','<mxGraphModel>\n  <root>\n    <mxCell id=\"0\"/>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"f4338402-f02e-1ea0-f08f-579c33943d30\" value=\"推荐人积分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" parent=\"1\" vertex=\"1\" type=\"Start\" info=\"79e9c691-6620-4f71-8761-40a81d1f3173\">\n      <mxGeometry x=\"110\" y=\"80\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"962d3e11-6cb5-96dc-888f-f6d82e3514fb\" value=\"推荐返利交易\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" parent=\"1\" vertex=\"1\" type=\"Configure\" info=\"962d3e11-6cb5-96dc-888f-f6d82e3514fb\">\n      <mxGeometry x=\"260\" y=\"80\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"2\" parent=\"1\" source=\"f4338402-f02e-1ea0-f08f-579c33943d30\" target=\"962d3e11-6cb5-96dc-888f-f6d82e3514fb\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"9f9551b1-fe31-5473-1133-ca2882bcff6a\" value=\"推荐返利送分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a56.png\" vertex=\"1\" type=\"Mark\" info=\"1f3c07a3-1783-43b6-b78e-2ae5ea838f48\" parent=\"1\">\n      <mxGeometry x=\"440\" y=\"90\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"3\" edge=\"1\" parent=\"1\" source=\"962d3e11-6cb5-96dc-888f-f6d82e3514fb\" target=\"9f9551b1-fe31-5473-1133-ca2882bcff6a\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"6d013d32-0859-7477-f2a5-79a6dcb9aca6\" value=\"优惠码返利\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" vertex=\"1\" type=\"Start\" info=\"f919b4cc-8b4e-49f9-a716-7c1740f4d390\" parent=\"1\">\n      <mxGeometry x=\"100\" y=\"180\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"72e96c97-d88c-743c-2792-4b7e7e5e943c\" value=\"优惠码返利交易\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" vertex=\"1\" type=\"Configure\" info=\"72e96c97-d88c-743c-2792-4b7e7e5e943c\" parent=\"1\">\n      <mxGeometry x=\"250\" y=\"180\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"4\" edge=\"1\" parent=\"1\" source=\"6d013d32-0859-7477-f2a5-79a6dcb9aca6\" target=\"72e96c97-d88c-743c-2792-4b7e7e5e943c\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"7536d340-f0f3-2214-23ba-47df3a3b847c\" value=\"优惠码返利积分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a56.png\" vertex=\"1\" type=\"Mark\" info=\"7b871daa-6516-4505-897c-4220f019b13e\" parent=\"1\">\n      <mxGeometry x=\"410\" y=\"180\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"5\" edge=\"1\" parent=\"1\" source=\"72e96c97-d88c-743c-2792-4b7e7e5e943c\" target=\"7536d340-f0f3-2214-23ba-47df3a3b847c\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"f810d2fa-ede4-3d34-31a5-f91c9b78c6da\" value=\"返利扣除\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a57.png\" vertex=\"1\" type=\"Start\" info=\"ca49d2d1-b2c6-4b17-9c2e-5c4df74e4984\" parent=\"1\">\n      <mxGeometry x=\"110\" y=\"270\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"32996045-0fdf-1ea4-09ce-bd32f5514cd7\" value=\"扣除积分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a52.png\" vertex=\"1\" type=\"Configure\" info=\"32996045-0fdf-1ea4-09ce-bd32f5514cd7\" parent=\"1\">\n      <mxGeometry x=\"260\" y=\"280\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"6\" edge=\"1\" parent=\"1\" source=\"f810d2fa-ede4-3d34-31a5-f91c9b78c6da\" target=\"32996045-0fdf-1ea4-09ce-bd32f5514cd7\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"174b1e58-e85c-a7c7-0b5c-2044c7465245\" value=\"扣除返利积分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/a60.png\" vertex=\"1\" type=\"Score\" info=\"67cf2a62-1757-4a6b-93f3-ff04c8464021\" parent=\"1\">\n      <mxGeometry x=\"410\" y=\"270\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"7\" edge=\"1\" parent=\"1\" source=\"32996045-0fdf-1ea4-09ce-bd32f5514cd7\" target=\"174b1e58-e85c-a7c7-0b5c-2044c7465245\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n  </root>\n</mxGraphModel>\n');

/*Table structure for table `m_promotion_attr_data` */

DROP TABLE IF EXISTS `m_promotion_attr_data`;

CREATE TABLE `m_promotion_attr_data` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `VARCHAR1` varchar(40) DEFAULT NULL,
  `VARCHAR2` varchar(40) DEFAULT NULL,
  `VARCHAR3` varchar(40) DEFAULT NULL,
  `VARCHAR4` varchar(40) DEFAULT NULL,
  `VARCHAR5` varchar(40) DEFAULT NULL,
  `INT1` int(11) DEFAULT NULL,
  `INT2` int(11) DEFAULT NULL,
  `INT3` int(11) DEFAULT NULL,
  `INT4` int(11) DEFAULT NULL,
  `INT5` int(11) DEFAULT NULL,
  `FLOAT1` double DEFAULT NULL,
  `FLOAT2` double DEFAULT NULL,
  `FLOAT3` double DEFAULT NULL,
  `FLOAT4` double DEFAULT NULL,
  `FLOAT5` double DEFAULT NULL,
  `DATE1` datetime DEFAULT NULL,
  `DATE2` datetime DEFAULT NULL,
  `DATE3` datetime DEFAULT NULL,
  `DATE4` datetime DEFAULT NULL,
  `DATE5` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_promotion_attr_data` */

/*Table structure for table `m_provider` */

DROP TABLE IF EXISTS `m_provider`;

CREATE TABLE `m_provider` (
  `ID` varchar(40) NOT NULL,
  `PROVIDER_NUM` varchar(40) DEFAULT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `WEBURL` varchar(40) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `FAX` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(40) DEFAULT NULL,
  `ADDRESS` varchar(100) DEFAULT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_provider` */

/*Table structure for table `m_provider_channal_price` */

DROP TABLE IF EXISTS `m_provider_channal_price`;

CREATE TABLE `m_provider_channal_price` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `CHANNAL` varchar(40) DEFAULT NULL,
  `PRICE` decimal(20,0) DEFAULT NULL,
  `MIN_NUM` int(11) DEFAULT NULL,
  `MAX_NUM` int(11) DEFAULT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL,
  `PROVIDER_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_provider_channal_price` */

/*Table structure for table `m_query_transaction` */

DROP TABLE IF EXISTS `m_query_transaction`;

CREATE TABLE `m_query_transaction` (
  `ID` varchar(40) NOT NULL,
  `LOGIC` varchar(6) DEFAULT NULL,
  `TRANSCATION_FLAG` varchar(20) DEFAULT NULL,
  `BEGIN_DATE` varchar(40) DEFAULT NULL,
  `END_DATE` varchar(40) DEFAULT NULL,
  `STORE_ID` text,
  `PRODUCTS_ID` text,
  `QUERY_ID` varchar(40) DEFAULT NULL,
  `RESPONSE_ID` varchar(40) DEFAULT NULL,
  `IS_BUY` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_query_transaction` */

/*Table structure for table `m_question` */

DROP TABLE IF EXISTS `m_question`;

CREATE TABLE `m_question` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `ANSWER_SHOW_OPTION` varchar(40) DEFAULT NULL,
  `COMMENT` varchar(200) DEFAULT NULL,
  `SMART_SCRIPTS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_question` */

/*Table structure for table `m_question_answer` */

DROP TABLE IF EXISTS `m_question_answer`;

CREATE TABLE `m_question_answer` (
  `ID` varchar(40) NOT NULL,
  `SMART_SCRIPTS_SESSION_ID` varchar(40) DEFAULT NULL,
  `QUESTION_ID` varchar(40) DEFAULT NULL,
  `ANSWER` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_question_answer` */

/*Table structure for table `m_r_temp_ques` */

DROP TABLE IF EXISTS `m_r_temp_ques`;

CREATE TABLE `m_r_temp_ques` (
  `ID` varchar(40) NOT NULL,
  `ORDER` int(11) DEFAULT NULL,
  `SURVEY_TEMPLATE_ID` varchar(40) DEFAULT NULL,
  `SURVEY_QUESTION_ID` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_r_temp_ques` */

/*Table structure for table `m_rate_org` */

DROP TABLE IF EXISTS `m_rate_org`;

CREATE TABLE `m_rate_org` (
  `ID` varchar(40) NOT NULL,
  `RATE_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_rate_org` */

/*Table structure for table `m_rela_customer` */

DROP TABLE IF EXISTS `m_rela_customer`;

CREATE TABLE `m_rela_customer` (
  `ID` varchar(40) NOT NULL,
  `M_CUSTOMER_ID` varchar(40) NOT NULL,
  `S_CUSTOMER_ID` varchar(40) NOT NULL,
  `S_CUSTOMER_O_ID` varchar(40) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `RELA_TYPE` varchar(40) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_M_CUSTOMER_ID` (`M_CUSTOMER_ID`),
  KEY `INDEX_S_CUSTOMER_O_ID` (`S_CUSTOMER_O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_rela_customer` */

insert  into `m_rela_customer` values ('062e5770-2436-11e4-8bff-00163e021993','20140814111041422','062e5784-2436-11e4-8bff-00163e021993','062e578e-2436-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL),('062e589c-2436-11e4-8bff-00163e021993','20140814111041653','062e58a6-2436-11e4-8bff-00163e021993','062e58b0-2436-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL),('062e5932-2436-11e4-8bff-00163e021993','20140814111041747','062e593c-2436-11e4-8bff-00163e021993','062e5946-2436-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL),('72ad7dbc-2d42-11e4-8bff-00163e021993','20140826094003641','72ad7dd0-2d42-11e4-8bff-00163e021993','72ad7dda-2d42-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL),('741f5d90-2460-11e4-8bff-00163e021993','20140815141810465','741f5da4-2460-11e4-8bff-00163e021993','741f5dae-2460-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL),('741f5f16-2460-11e4-8bff-00163e021993','20140815141810730','741f5f20-2460-11e4-8bff-00163e021993','741f5f21-2460-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL),('741f5fac-2460-11e4-8bff-00163e021993','20140815141810739','741f5fb6-2460-11e4-8bff-00163e021993','741f5fc0-2460-11e4-8bff-00163e021993','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','金欧利',NULL,NULL);

/*Table structure for table `m_rela_customer_bk` */

DROP TABLE IF EXISTS `m_rela_customer_bk`;

CREATE TABLE `m_rela_customer_bk` (
  `ID` varchar(40) NOT NULL,
  `M_CUSTOMER_ID` varchar(40) NOT NULL,
  `S_CUSTOMER_ID` varchar(40) NOT NULL,
  `S_CUSTOMER_O_ID` varchar(40) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `RELA_TYPE` varchar(40) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_M_CUSTOMER_ID` (`M_CUSTOMER_ID`),
  KEY `INDEX_S_CUSTOMER_O_ID` (`S_CUSTOMER_O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_rela_customer_bk` */

/*Table structure for table `m_report_export_history` */

DROP TABLE IF EXISTS `m_report_export_history`;

CREATE TABLE `m_report_export_history` (
  `id` varchar(36) NOT NULL,
  `BATCH_NO` text,
  `data_file` text,
  `created_date` datetime DEFAULT NULL,
  `created_by` varchar(36) DEFAULT NULL,
  `GROUPID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_report_export_history` */

/*Table structure for table `m_response` */

DROP TABLE IF EXISTS `m_response`;

CREATE TABLE `m_response` (
  `ID` varchar(50) NOT NULL,
  `RESPONSE_NAME` varchar(100) DEFAULT NULL,
  `RESPONSE_CODE` varchar(100) DEFAULT NULL,
  `RESPONSE_TYPE` varchar(100) DEFAULT NULL,
  `DESCRIPTION` text,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `CUSTOMER_NAME` varchar(100) DEFAULT NULL,
  `CAMPAIGN_NAME` varchar(120) DEFAULT NULL,
  `CAMPAIGN_CODE` varchar(40) DEFAULT NULL,
  `DELIVERY_NAME` varchar(120) DEFAULT NULL,
  `DELIVERY_CODE` varchar(40) DEFAULT NULL,
  `RESPONSE_DATE` datetime DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `RESPONSE_CHANNEL` varchar(30) DEFAULT NULL,
  `BATCH` varchar(30) DEFAULT NULL,
  `URL` text,
  `CODE` varchar(40) DEFAULT NULL,
  `PHONE` varchar(20) DEFAULT NULL,
  `EMAIL` varchar(100) DEFAULT NULL,
  `WECHAT` varchar(20) DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `RESPONSE_STATUS` varchar(20) DEFAULT NULL,
  `ACTION_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_response` */

/*Table structure for table `m_response_group` */

DROP TABLE IF EXISTS `m_response_group`;

CREATE TABLE `m_response_group` (
  `ID` varchar(40) NOT NULL,
  `GROUP_NAME` varchar(120) DEFAULT NULL,
  `GROUP_CODE` varchar(30) DEFAULT NULL,
  `RESPONSE_TYPE` varchar(10) DEFAULT NULL,
  `SENDINGGROUP_SUM` int(11) DEFAULT NULL,
  `SENDINGGROUP_EXPENSE` decimal(20,2) DEFAULT NULL,
  `SENDINGGROUP_PLANSUM` int(11) DEFAULT NULL,
  `SENDINGGROUP_PLANEXPENSE` decimal(20,2) DEFAULT NULL,
  `SPLITTYPE` varchar(50) DEFAULT NULL,
  `SPLITSUM` int(11) DEFAULT NULL,
  `SPLITPERCENT` int(11) DEFAULT NULL,
  `CAMPAGIN_ID` varchar(40) DEFAULT NULL,
  `SENDINGGROUP_SCRIPT` longtext,
  `CONTROLGROUP_SCRIPT` longtext,
  `BI_MARK` varchar(20) DEFAULT NULL,
  `SEED_ID` varchar(40) DEFAULT NULL,
  `SEED_ID_GROUP` text,
  `SEED_NAME` varchar(50) DEFAULT NULL,
  `CREATEBY` varchar(40) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  `MODIFYBY` varchar(40) DEFAULT NULL,
  `MODIFYTIME` datetime DEFAULT NULL,
  `DELIVERY_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_response_group` */

/*Table structure for table `m_response_summary` */

DROP TABLE IF EXISTS `m_response_summary`;

CREATE TABLE `m_response_summary` (
  `ID` varchar(40) NOT NULL,
  `DELIVERY_CODE` varchar(40) DEFAULT NULL,
  `DELIVERY_NAME` varchar(100) DEFAULT NULL,
  `CAMPAIGN_CODE` varchar(40) DEFAULT NULL,
  `CAMPAIGN_NAME` varchar(100) DEFAULT NULL,
  `CHANNEL_TYPE` varchar(30) DEFAULT NULL,
  `RESPONSE_TYPE` varchar(50) DEFAULT NULL,
  `RESPONSE_NUM` int(11) DEFAULT '0',
  `CLICK_NUM` int(11) DEFAULT '0',
  `SEND_SUCC_NUM` int(11) DEFAULT '0',
  `UNSUBSCRIBE_NUM` int(11) DEFAULT '0',
  `HARDBOUNCE_NUM` int(11) DEFAULT '0',
  `SOFTBOUNCE_NUM` int(11) DEFAULT '0',
  `REGISTER_NUM` int(11) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_response_summary` */

/*Table structure for table `m_responsegroup_history` */

DROP TABLE IF EXISTS `m_responsegroup_history`;

CREATE TABLE `m_responsegroup_history` (
  `ID` int(11) NOT NULL,
  `GROUP_ID` varchar(40) DEFAULT NULL,
  `GROUP_TYPE` varchar(10) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `RESPONSEGROUP_TYPE` varchar(10) DEFAULT NULL,
  `RESPONSEGROUP_NAME` varchar(200) DEFAULT NULL,
  `CREATETIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_responsegroup_history` */

/*Table structure for table `m_role` */

DROP TABLE IF EXISTS `m_role`;

CREATE TABLE `m_role` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `NOTES` varchar(100) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_role` */

insert  into `m_role` values ('08b9074e-1197-4dd3-b346-5dd8ee5db246','管理员','','1'),('0d54a4e6-9713-413d-9a53-0c4ad2a07cb5','AE','管理-员工','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('100a17da-6ea9-4c35-9f2b-159efb994713','MC','营销日历','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('13ca2aa5-138d-4abd-9d7a-1f2287e8f021','LP','忠诚度项目','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('20461de0-64b2-4ebd-8ca3-71c08d058fc7','MA','营销活动','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('2bbda62d-ab20-4c70-ac13-9626e65ab006','AC','管理-产品Category','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('3ac1b691-1154-460f-9c17-33ba2e46ef23','Demo','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('3b00194b-ea54-43a5-a2ef-08e8602c75b0','市场营销角色','undefined','1'),('3d6d5269-70c5-4c8d-9a05-542c7768922d','Areca试用帐户角色1','Areca试用帐户角色1','f5781f0c-7df7-4be4-a944-b304e0cb987c'),('44daa961-ff04-4f9f-be57-4395508d1fdb','DM','数据管理','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('4903c5e9-a8f0-424a-ac23-1958301684a2','客服主管','客服','1'),('61f956bf-b504-4ce8-bc55-6db242c2efcc','AA','管理-应用','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('73f0a903-116f-4de9-9383-9971826ced54','sadmin','sadmin','1'),('778c38d0-e5de-4737-bad4-7a3d89078266','七乐康','七乐康测试账号','1'),('822fed41-7169-4376-a254-b312f0c521fe','AS','管理-门店','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('8abea882-80be-4650-a5ec-5f307f39ed15','test','12131','3'),('94049b4e-4f4a-46dc-9ac7-9444ca1826a5','AG','管理-礼品','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('9998e975-7961-4dee-8f85-e9f57eee4e03','DQ','数据质量管理','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('a582be2f-b0d1-4bd9-83f8-042834108443','sales','sales','1'),('b7a69208-8267-44f7-b843-ff51b2482d07','MM','会员','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('c33d65a1-a0f6-40eb-a697-f39d7ac90b2c','LT','忠诚度交易','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('caf93aa4-de65-453e-be16-c0cef90ee421','CA','分析报表','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('cde96503-76da-440c-9d35-e9be21c70616','AP','管理-产品','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('d49533b8-1d5a-402b-a65a-241eb714d1ce','管理员角色','不要删除或修改','8f120c05-644d-4120-96c2-7eda49afdc7b'),('d4a5dce2-6df8-47c5-8004-e70cba815af1','AU','管理-权限','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('de2abe36-83d9-4a2c-b9a8-bcd86cf6e414','CM','客户','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('e8f75eb5-cbd1-467a-aebf-6f4df670093d','OD','订单','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('ebdb7820-c67f-4298-a7c5-3b9bc65a4ef7','管理员角色','管理员','1'),('fc3727ea-112c-4341-9589-f88b9321c227','MR','响应管理','631fc5a3-719d-47b0-8158-b63e9cf78c79'),('fddc1752-97df-4c53-92f4-c505546b85f6','dasdsadasdasd','',NULL);

/*Table structure for table `m_role_view` */

DROP TABLE IF EXISTS `m_role_view`;

CREATE TABLE `m_role_view` (
  `ID` varchar(40) NOT NULL,
  `ROLE_ID` varchar(40) DEFAULT NULL,
  `VIEW_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_role_view` */

insert  into `m_role_view` values ('001438fb-5b34-4b7d-bc31-de35c72cfba1','08b9074e-1197-4dd3-b346-5dd8ee5db246','725200CA-3568-46E1-AEC3-F1FAEAC12078'),('003542bb-21a6-4793-a78c-05fdadecf461','08b9074e-1197-4dd3-b346-5dd8ee5db246','af7be7d8-5080-45ce-af2d-7a1096e2b5da'),('0058d84e-e1cb-4b0d-9768-afd8623464eb','08b9074e-1197-4dd3-b346-5dd8ee5db246','70648537-6320-4f68-aca4-17eb272cd475'),('00767451-c716-4f0b-80dd-a012b92718ad','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingProgramV'),('014f3c5d-9936-426a-8089-b667c7811749','08b9074e-1197-4dd3-b346-5dd8ee5db246','8acfff0d-b2ca-4950-8930-6c09de81c359'),('02e7e34a-0c92-4b47-844b-70cb2a779798','3ac1b691-1154-460f-9c17-33ba2e46ef23','21512b72-a2b2-4a6c-a5b8-1010d37cf03c'),('0387d176-7b45-42b6-a059-0c0a0cf8b9f2','3d6d5269-70c5-4c8d-9a05-542c7768922d','8198ce54-9e8e-4c51-99d7-06bd359503bd'),('04692261-2fbf-4a87-bf40-8962405e17f4','08b9074e-1197-4dd3-b346-5dd8ee5db246','bf97b843-317f-4b28-b88e-ce5cbb708cf3'),('04e7419c-129d-495c-84fa-5bdc844d4ba4','3ac1b691-1154-460f-9c17-33ba2e46ef23','f3682bfc-d973-490c-972b-f2f879c2b7a4'),('052301ef-d5bb-4af4-b4ba-6009bbfe52b9','08b9074e-1197-4dd3-b346-5dd8ee5db246','b6381764-7b3f-4e98-9540-8710a31d812d'),('06461804-d978-4938-9ac8-d762e5b5a6c0','3d6d5269-70c5-4c8d-9a05-542c7768922d','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('06754ee5-3f4d-4aea-b5c7-4c0731ff31aa','73f0a903-116f-4de9-9383-9971826ced54','c6999850-5102-4565-a3d0-e0edf2be6d11'),('06754ee5-3f4d-4aea-b5c7-4c0731ff31c7','20461de0-64b2-4ebd-8ca3-71c08d058fc7','c6999850-5102-4565-a3d0-e0edf2be6d11'),('07756bd3-c577-42f9-b2cb-72865641df54','08b9074e-1197-4dd3-b346-5dd8ee5db246','21512b72-a2b2-4a6c-a5b8-1010d37cf03c'),('081c417c-9521-48f9-abe0-61c2883a7907','d49533b8-1d5a-402b-a65a-241eb714d1ce','e6067692-8a3b-47e1-84a0-002a19ca5155'),('085cf0f3-e759-4df9-90d6-e1726316f68f','3d6d5269-70c5-4c8d-9a05-542c7768922d','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('092175b7-30d2-4fd8-9329-9fe2e660e1cb','08b9074e-1197-4dd3-b346-5dd8ee5db246','ea09cbb1-a2f2-41cf-91dd-6b4b7f7e0c97'),('09267c6f-e865-47c0-97c6-0f98c61ed4d1','778c38d0-e5de-4737-bad4-7a3d89078266','0757ca6f-8ae7-48df-9974-f5b82c8e48b8'),('09478af7-4fdd-4840-8abd-2e94c975ef06','08b9074e-1197-4dd3-b346-5dd8ee5db246','e6067692-8a3b-47e1-84a0-002a19ca5155'),('0950113d-a902-45dd-9c2f-c5905c672594','778c38d0-e5de-4737-bad4-7a3d89078266','d401fb03-a85f-4bba-aa77-4203c25d9443'),('0a35acc8-83c7-4015-a284-646260da1d82','d49533b8-1d5a-402b-a65a-241eb714d1ce','6b885df8-6dce-454a-9715-7e964baf8aca'),('0a6246ed-1f3c-46f4-8fd1-f9f92520b06a','08b9074e-1197-4dd3-b346-5dd8ee5db246','996527e5-d6ba-4396-a5fe-2f7dc8ee1a56'),('0b49369b-282f-4492-87b0-9c95d863c88a','d49533b8-1d5a-402b-a65a-241eb714d1ce','9eb7df35-51ba-454e-b1a2-253ff053a439'),('0b831847-8e64-49bc-ba85-8c883d2a52a6','d49533b8-1d5a-402b-a65a-241eb714d1ce','5ed27c0d-5a84-4e87-9b2f-f30535b484f0'),('0bbcbe28-2761-42f4-a4d0-249ce8841b4d','3ac1b691-1154-460f-9c17-33ba2e46ef23','MarketingCampaignV'),('0bec90b2-8b8b-4185-bb4e-070b778d3353','08b9074e-1197-4dd3-b346-5dd8ee5db246','13f35ae2-ff33-4236-b4a1-e441a791428a'),('0c3eaa2b-01b9-400b-8073-8a56fe215391','08b9074e-1197-4dd3-b346-5dd8ee5db246','882C9D5A-EBDD-4A44-BC3F-BF84E3A8F683'),('0ca8fdff-f6db-494e-8b77-b822a2cf53b4','08b9074e-1197-4dd3-b346-5dd8ee5db246','d61d5aa3-46b5-4abf-850f-a7a4778afe46'),('0d8c7d5b-be06-4382-bb2e-70eabe344def','3d6d5269-70c5-4c8d-9a05-542c7768922d','ef4ace39-fcf4-4ccc-a096-f4f384ea5ccf'),('0d9c5749-6b2b-49b8-a8df-6bfa750050e3','3d6d5269-70c5-4c8d-9a05-542c7768922d','d562cf20-0a33-4441-89b2-b459ab052c1b'),('0dcce174-fd6f-440b-8c68-57bf2fb07210','08b9074e-1197-4dd3-b346-5dd8ee5db246','3ada0c49-09fd-4b6f-a8d3-c5024dfd0182'),('0e05cae5-9aff-4a61-97ee-ace309885418','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingProgramV'),('0ef6a316-732e-433b-b1d9-bdd0e73b9975','08b9074e-1197-4dd3-b346-5dd8ee5db246','de7d2918-883b-471f-9b45-c373cfe86e61'),('0f44ae9e-0049-4a61-81f8-4127a5f37cd2','d49533b8-1d5a-402b-a65a-241eb714d1ce','b6381764-7b3f-4e98-9540-8710a31d812d'),('0f475d61-d270-4556-b9e4-d0684b08842d','08b9074e-1197-4dd3-b346-5dd8ee5db246','d74cbe57-55ef-4bad-8dc7-ed717af303f8'),('1','d49533b8-1d5a-402b-a65a-241eb714d1ce','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('100dd6ab-6365-4bcd-a2a0-ef682ae625dd','d49533b8-1d5a-402b-a65a-241eb714d1ce','996527e5-d6ba-4396-a5fe-2f7dc8ee1a56'),('1015d373-ccf1-4c1d-a502-9b96d633ce3a','d49533b8-1d5a-402b-a65a-241eb714d1ce','DB3D26CC-94B8-4EF0-8200-A0A8BB2F510F'),('1055dac9-c456-4c54-8d46-e38bf41c808f','08b9074e-1197-4dd3-b346-5dd8ee5db246','c9eef404-909c-466b-acb7-df1337365684'),('1074f847-4bc8-44a8-b359-632b85dfc943','73f0a903-116f-4de9-9383-9971826ced54','MarketingProgramV'),('107d7e48-2569-40e9-9499-3f713e764b0c','08b9074e-1197-4dd3-b346-5dd8ee5db246','d86b8b0b-d725-4a74-9a56-93705f492cbc'),('11e925db-d76c-4c3f-838f-887ee6d868f6','08b9074e-1197-4dd3-b346-5dd8ee5db246','fabfeffc-c411-4e23-a17b-14c62e26ecd2'),('1275ce95-97a2-4884-ba37-9f45c5515240','778c38d0-e5de-4737-bad4-7a3d89078266','62406e88-f768-4c73-9317-cdd66ca0314f'),('12f17ecc-532f-4be1-8b4b-724f0976919f','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingProCampExpenseV'),('134a6de2-cde5-4f6b-b83d-29db1bf0ed70','d49533b8-1d5a-402b-a65a-241eb714d1ce','6b5bdebe-66f1-452b-a74f-1fbd014286b9'),('1379dd4b-f1c5-45e0-9d39-945c7c3c4cc1','d49533b8-1d5a-402b-a65a-241eb714d1ce','09a40291-4b1f-4285-affd-975e41d87ecf'),('13bdcb5b-1125-4248-b5ec-de5276d12bc8','08b9074e-1197-4dd3-b346-5dd8ee5db246','43be26fc-36ac-49cb-8ef9-2a92762ffe82'),('142608da-d41d-409f-adfc-56e9db37bcd7','3ac1b691-1154-460f-9c17-33ba2e46ef23','70648537-6320-4f68-aca4-17eb272cd475'),('142ab98c-de59-41d5-9d2b-7c34dd01593a','3d6d5269-70c5-4c8d-9a05-542c7768922d','518395c8-a0c0-4338-9042-066141bfc558'),('15888344-9c40-4f23-aa15-bca603ae3a8e','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingProCampExpenseV'),('1711d88c-86ba-4900-a699-e99130d9c94e','3d6d5269-70c5-4c8d-9a05-542c7768922d','c9eef404-909c-466b-acb7-df1337365684'),('172e93d9-ee6f-4b4b-b4ed-00bdb705d5be','08b9074e-1197-4dd3-b346-5dd8ee5db246','595049d9-cda1-4e2f-bb18-873088326a21'),('1791c146-86a1-4786-a491-a16db553c012','08b9074e-1197-4dd3-b346-5dd8ee5db246','2e5080ff-36b1-4bb9-9ef1-abb7a5c3c634'),('17f203f1-d839-46cf-a9c1-7e87a1d9d6ec','778c38d0-e5de-4737-bad4-7a3d89078266','09DF3A65-7667-41C9-93ED-22B771040C01'),('181d58e5-bd52-4358-9b34-37817f1983c1','3d6d5269-70c5-4c8d-9a05-542c7768922d','f3682bfc-d973-490c-972b-f2f879c2b7a4'),('191a05de-fce7-4796-9141-63c8f6826e80','08b9074e-1197-4dd3-b346-5dd8ee5db246','0757ca6f-8ae7-48df-9974-f5b82c8e48b8'),('199de2b0-c768-4534-946b-42fd2a326ea1','3ac1b691-1154-460f-9c17-33ba2e46ef23','725200CA-3568-46E1-AEC3-F1FAEAC12078'),('19aa2df9-ac28-49c7-a10a-3b114afe10b6','08b9074e-1197-4dd3-b346-5dd8ee5db246','1d42565c-86e1-4d58-ac2b-3c78ca8f8387'),('19b8f52c-fc7e-499a-9519-535e183526d9','3d6d5269-70c5-4c8d-9a05-542c7768922d','bf97b843-317f-4b28-b88e-ce5cbb708cf3'),('1ac236c9-dc8d-439c-99d3-467cc3c2b6ce','d49533b8-1d5a-402b-a65a-241eb714d1ce','ae1872dd-f367-45da-8325-d3a18a0dd469'),('1afb3b39-3f5b-478b-a41d-fb1f239c4909','3d6d5269-70c5-4c8d-9a05-542c7768922d','5522470D-F399-4F99-A9CF-5594C4709109'),('1b3712c8-22d4-4395-9180-d12f062db3db','d49533b8-1d5a-402b-a65a-241eb714d1ce','bf97b843-317f-4b28-b88e-ce5cbb708cf3'),('1b7ee6ea-f124-461d-bfbb-4dcc2639fafa','3d6d5269-70c5-4c8d-9a05-542c7768922d','925a4b7d-835e-4a9b-9d5c-7b73ab41d79b'),('1bda4dec-952c-4607-b49b-cb6f83e9ca8f','08b9074e-1197-4dd3-b346-5dd8ee5db246','09DF3A65-7667-41C9-93ED-22B771040C01'),('1bdd8e0c-ae71-4020-a444-adea6704e7e3','08b9074e-1197-4dd3-b346-5dd8ee5db246','40840e39-679e-4b7e-9019-c99ab58c04e4'),('1c4371d9-dd53-4a1a-aff2-393c434f4e8e','3d6d5269-70c5-4c8d-9a05-542c7768922d','725200CA-3568-46E1-AEC3-F1FAEAC12078'),('1cc66ea5-563f-42e3-91c7-52467a1c2be6','3d6d5269-70c5-4c8d-9a05-542c7768922d','c68bf138-be40-4adf-ab3b-d15f7d271963'),('1dbaf92c-64f3-418e-8268-56e6ac918305','3d6d5269-70c5-4c8d-9a05-542c7768922d','MarketingCampaignV'),('1e210151-f4e1-4234-b67a-705f2815c793','d49533b8-1d5a-402b-a65a-241eb714d1ce','f2be4395-bf17-49e7-9903-23e95697ba44'),('1e5d66d8-8b38-4723-8211-6de510c0cefa','d49533b8-1d5a-402b-a65a-241eb714d1ce','57ed3ef8-ea6e-48f5-89fe-b4eedade2be5'),('1f5783f9-c07f-424b-9b32-c0cefd50f89b','08b9074e-1197-4dd3-b346-5dd8ee5db246','8f03de80-fbf2-4b62-a271-b1790c013863'),('1f8c67a5-b58b-4ca0-8a78-91a9a243d294','08b9074e-1197-4dd3-b346-5dd8ee5db246','484012fd-69df-4c9a-b7f5-57a7bb7d0997'),('1faf306f-3ff8-4a39-9294-45c99e419e73','778c38d0-e5de-4737-bad4-7a3d89078266','a4ed2c8c-e4ea-428e-8228-c02268afc0e0'),('1fb0425f-2c27-496c-acdd-c8a68e271f83','08b9074e-1197-4dd3-b346-5dd8ee5db246','4ba38593-ab87-4f07-ab84-088978ec0287'),('2','d49533b8-1d5a-402b-a65a-241eb714d1ce','47af3b22-a407-4b11-9a74-1b8cbb235882'),('2071430d-138c-4ceb-9e14-edab6bb15b04','08b9074e-1197-4dd3-b346-5dd8ee5db246','678d29fb-1f28-490c-ae11-948ca4c54c92'),('20c962f7-e67a-4f57-b236-46f832587690','73f0a903-116f-4de9-9383-9971826ced54','0a78d008-87ae-4a5c-985c-4ddc72026fbc'),('20ff8fbd-e670-49e6-a997-2a7848379d5f','3ac1b691-1154-460f-9c17-33ba2e46ef23','dc4c353c-2a92-4849-b424-23e3aaae0f91'),('2153cf82-07e6-446e-830b-0b448380f64e','08b9074e-1197-4dd3-b346-5dd8ee5db246','2be30692-6c39-4946-87b2-2656695b669e'),('231cecda-e661-418b-ace0-5aa75e8b7d02','d49533b8-1d5a-402b-a65a-241eb714d1ce','2be30692-6c39-4946-87b2-2656695b669e'),('240e5618-b1fc-41e4-91a0-fea4175de4bf','778c38d0-e5de-4737-bad4-7a3d89078266','b6766b2f-a30e-45ab-b46e-bd14bb07c1d1'),('24409b9c-7388-4c12-a564-fc21d39de144','d49533b8-1d5a-402b-a65a-241eb714d1ce','c68bf138-be40-4adf-ab3b-d15f7d271963'),('24c41708-9998-4a38-b051-2f79a755c065','d49533b8-1d5a-402b-a65a-241eb714d1ce','58eee1b8-30e6-453c-8c23-5aeb95c03d65'),('253e3dad-d7da-4382-91b5-7570686c551b','08b9074e-1197-4dd3-b346-5dd8ee5db246','347c3e86-18dc-4c1e-ab14-3977ce6adc82'),('25e88b4e-5319-4bab-abe9-b9a349e22b95','3d6d5269-70c5-4c8d-9a05-542c7768922d','0a30d204-2672-4ce2-bf0e-0c8d694a6ff7'),('263b531a-314b-4093-9e0b-32e0437c231e','d49533b8-1d5a-402b-a65a-241eb714d1ce','4ba38593-ab87-4f07-ab84-088978ec0287'),('27329975-5fca-4f68-b6dd-c4e73385382f','d49533b8-1d5a-402b-a65a-241eb714d1ce','d863902d-117a-40fa-8aee-52ffad515fe2'),('27471a0b-04cd-485e-9e70-c06d706f1877','d49533b8-1d5a-402b-a65a-241eb714d1ce','03c3a588-9ab7-4293-9cff-223f7f6613b3'),('276baa11-8b5c-4cf4-b187-eb61328bbbaa','d49533b8-1d5a-402b-a65a-241eb714d1ce','c9eef404-909c-466b-acb7-df1337365684'),('27b1eb44-7327-4efb-9d06-36e2caabcd9e','08b9074e-1197-4dd3-b346-5dd8ee5db246','372e2ac0-a337-4fb0-998f-adc0571d2866'),('285edd77-97e2-4aec-a6b8-f1d4f3888504','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingProCampV'),('28712df3-9bbc-4932-9c2f-e4a7e7c05c15','d49533b8-1d5a-402b-a65a-241eb714d1ce','ef4ace39-fcf4-4ccc-a096-f4f384ea5ccf'),('29a67dc5-52d2-43d8-8ed0-676eddf8197e','d49533b8-1d5a-402b-a65a-241eb714d1ce','111c5844-b5ca-48ae-9ad7-57e531639007'),('29e2cd45-72d9-40ec-9585-d1216442f630','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingCampaignV'),('2b7e88ce-7178-4c57-b66e-423a3a52085f','778c38d0-e5de-4737-bad4-7a3d89078266','21512b72-a2b2-4a6c-a5b8-1010d37cf03c'),('2bceb614-2611-43a4-baf6-c31919c2885f','d49533b8-1d5a-402b-a65a-241eb714d1ce','d61d5aa3-46b5-4abf-850f-a7a4778afe46'),('2c7237fc-c128-4ddb-8bfa-b26433d8738c','d49533b8-1d5a-402b-a65a-241eb714d1ce','dc4c353c-2a92-4849-b424-23e3aaae0f91'),('2ded4ba1-4691-4875-9556-ee6b9109dfb9','08b9074e-1197-4dd3-b346-5dd8ee5db246','9afae00a-a833-4aa7-b0a2-23d0019eee80'),('2e4aa7e0-989b-4305-9089-00115e2f223a','08b9074e-1197-4dd3-b346-5dd8ee5db246','1b7203a1-66f9-449c-8329-a8f751255320'),('2e76dd8a-dbf7-4c5f-8b6f-8e2dade648b8','08b9074e-1197-4dd3-b346-5dd8ee5db246','4a19ecbe-51a3-4e44-9ad6-acc627ca532a'),('2f0ed22b-509a-4e7a-8e8d-6029cad124a9','3d6d5269-70c5-4c8d-9a05-542c7768922d','43be26fc-36ac-49cb-8ef9-2a92762ffe82'),('2fd645ce-3f65-4f93-9706-67f4a9f0de77','08b9074e-1197-4dd3-b346-5dd8ee5db246','a7214d55-5624-4228-944f-608b18660082'),('3','d49533b8-1d5a-402b-a65a-241eb714d1ce','4a19ecbe-51a3-4e44-9ad6-acc627ca532a'),('3004737b-dd44-4eae-ba32-902e3133ee8c','d49533b8-1d5a-402b-a65a-241eb714d1ce','250a34a6-b26f-4c47-82c6-52432003366a'),('325a6ec4-5fcf-438b-a233-43a49225a2a4','778c38d0-e5de-4737-bad4-7a3d89078266','98a569e6-b559-427f-87d2-2f1b9fa786e5'),('3282ad90-142e-4a6b-aec4-067b3771c4ae','d49533b8-1d5a-402b-a65a-241eb714d1ce','8f3b741c-5adc-452b-bd59-655163ed8bb5'),('329644bc-0a70-49b9-93a1-836bf3c71814','08b9074e-1197-4dd3-b346-5dd8ee5db246','69e90d20-709e-490a-b9f5-6989d05929c6'),('3405bfd8-05be-48d2-9bf9-ab12b8236762','3ac1b691-1154-460f-9c17-33ba2e46ef23','659bdc4a-dba7-4c81-9af5-9665f7bc185c'),('340b8a6a-9615-43bb-81f0-5a25e9d6131e','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingCampaignExpenseV'),('34ed0388-acfc-456b-aa88-74103949cc6b','3d6d5269-70c5-4c8d-9a05-542c7768922d','605b8714-1134-485c-96f2-f21ccfb35462'),('34ed7d34-8f38-4e8f-83ad-e226668a3898','778c38d0-e5de-4737-bad4-7a3d89078266','70648537-6320-4f68-aca4-17eb272cd475'),('350285fc-dccc-42c3-b367-64b2148315dc','08b9074e-1197-4dd3-b346-5dd8ee5db246','f3682bfc-d973-490c-972b-f2f879c2b7a4'),('36218f83-5e37-4200-8c31-ecf104cc0453','08b9074e-1197-4dd3-b346-5dd8ee5db246','59bac8c4-4866-473f-87e9-8ee6820d93dd'),('364ac792-a8d5-4e36-b986-f8ad19342b98','08b9074e-1197-4dd3-b346-5dd8ee5db246','5a01b632-9a00-44f2-bb73-cd07e5a407ea'),('3707aba4-98d9-40b6-9168-1a8631cb861a','d49533b8-1d5a-402b-a65a-241eb714d1ce','606f11eb-7ac1-49f4-a54e-ca94b8e60735'),('3769885a-f7ef-4a74-ace6-902e380f18f8','08b9074e-1197-4dd3-b346-5dd8ee5db246','51b33b8d-4af4-420a-9b7b-ffa44c8962b9'),('380e8a73-0d28-4b6a-afcf-79728a23b863','08b9074e-1197-4dd3-b346-5dd8ee5db246','f9cd01fc-1a58-4f58-8aa8-d6ae75950707'),('3825d846-f2bf-4278-9e34-e6e23d81e445','08b9074e-1197-4dd3-b346-5dd8ee5db246','62406e88-f768-4c73-9317-cdd66ca0314f'),('38ef8482-8094-43da-9030-ca5894270a7d','08b9074e-1197-4dd3-b346-5dd8ee5db246','8381d387-5308-4a7a-a16a-6b8f9bb92f4f'),('3900b3a1-0616-4b30-9a66-f7778b38b6e7','08b9074e-1197-4dd3-b346-5dd8ee5db246','4a7f39a2-4493-4a66-a357-8ab229ccc2e5'),('3a1abcdb-db85-4128-9742-5f83d623e4ef','3ac1b691-1154-460f-9c17-33ba2e46ef23','09DF3A65-7667-41C9-93ED-22B771040C01'),('3a7c3403-f2cb-48a6-b446-cdfbc7f52880','d49533b8-1d5a-402b-a65a-241eb714d1ce','8f03de80-fbf2-4b62-a271-b1790c013863'),('3c367fb6-7bba-4594-a10e-6b328114b256','08b9074e-1197-4dd3-b346-5dd8ee5db246','27182071-91a2-4f66-8ca3-c4d27d6e51ce'),('3c403ae5-61b2-4eab-9130-5b0bfe519999','3ac1b691-1154-460f-9c17-33ba2e46ef23','5a01b632-9a00-44f2-bb73-cd07e5a407ea'),('3de6337a-f1af-458f-8c3e-c77523814d5a','08b9074e-1197-4dd3-b346-5dd8ee5db246','f2be4395-bf17-49e7-9903-23e95697ba44'),('3e69ab45-3a93-40b5-934e-b53df41efdc1','d49533b8-1d5a-402b-a65a-241eb714d1ce','06e590ca-7050-4043-a2f5-ba4537a6cb7b'),('3f0edcc8-9205-44c0-ba9a-912db79e2684','778c38d0-e5de-4737-bad4-7a3d89078266','MarketingCampaignExpenseV'),('3f2bc021-c649-4a05-982b-ebcfbea2ce8c','d49533b8-1d5a-402b-a65a-241eb714d1ce','b924bd15-8d4a-4ef1-abce-d1837e505738'),('3f6297da-6be7-4fd0-b686-636060655475','08b9074e-1197-4dd3-b346-5dd8ee5db246','6f817794-dd38-4c77-bf18-78777a53a4ad'),('4065adfa-ee48-4f72-a419-d84b3947e4b5','d49533b8-1d5a-402b-a65a-241eb714d1ce','1f1bd791-a643-47ee-b780-62c85fa3ce5d'),('40b9241c-7e21-4cb0-b9ae-032b0abcf5b3','08b9074e-1197-4dd3-b346-5dd8ee5db246','5522470D-F399-4F99-A9CF-5594C4709109'),('41ea0ee2-c9e3-478a-a346-fb5df15a242b','3ac1b691-1154-460f-9c17-33ba2e46ef23','0a78d008-87ae-4a5c-985c-4ddc72026fbc'),('431f80b2-1d04-4150-936b-87714748702e','d49533b8-1d5a-402b-a65a-241eb714d1ce','200ab5fa-b77b-4d1a-bf8e-a4519994b011'),('43ab5d59-3d63-459f-8564-3f9c4b0b8398','778c38d0-e5de-4737-bad4-7a3d89078266','7891d295-90fe-4cd0-a9e9-d787812fe0b0'),('43b461f5-b7a7-4470-b07e-8a4e007daccc','3d6d5269-70c5-4c8d-9a05-542c7768922d','b6766b2f-a30e-45ab-b46e-bd14bb07c1d1'),('4441fb9f-a0eb-431b-b400-bea9745afa51','d49533b8-1d5a-402b-a65a-241eb714d1ce','09DF3A65-7667-41C9-93ED-22B771040C01'),('4467b1c9-a457-40da-8ce8-0e94613438ee','08b9074e-1197-4dd3-b346-5dd8ee5db246','bd7a182f-1cb0-4369-bd58-c427081adb3f'),('453630e8-17c7-45ad-911c-398b24d346d7','d49533b8-1d5a-402b-a65a-241eb714d1ce','fabfeffc-c411-4e23-a17b-14c62e26ecd2'),('4570c9b5-ce5e-4810-a323-f10840117ab0','08b9074e-1197-4dd3-b346-5dd8ee5db246','6da5d270-9adc-49ee-a999-6ab4c350c977'),('45ecbb38-6476-4665-9ecd-5502b9877d5a','d49533b8-1d5a-402b-a65a-241eb714d1ce','595049d9-cda1-4e2f-bb18-873088326a21'),('45f92af0-fce0-46a5-901a-ea165f04c101','08b9074e-1197-4dd3-b346-5dd8ee5db246','8f2453e8-c0fd-4693-86c5-341784f1c747'),('467f5aac-0d6d-4aae-b640-45f08328860b','d49533b8-1d5a-402b-a65a-241eb714d1ce','8381d387-5308-4a7a-a16a-6b8f9bb92f4f'),('46a0b398-6454-4775-9c75-79f95cdf0747','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','51b33b8d-4af4-420a-9b7b-ffa44c8962b9'),('46ac72f8-bfb1-4f5a-98bd-cd7972f9f8d6','d49533b8-1d5a-402b-a65a-241eb714d1ce','bd4e103e-deb5-4e17-b9e9-e4973e192ee0'),('4773f7c9-065f-4abe-8bb4-90337a970309','08b9074e-1197-4dd3-b346-5dd8ee5db246','98a569e6-b559-427f-87d2-2f1b9fa786e5'),('4795911d-482d-413a-9676-1eaf5e269770','08b9074e-1197-4dd3-b346-5dd8ee5db246','6b5bdebe-66f1-452b-a74f-1fbd014286b9'),('4858826a-4054-420f-adeb-3ff4889ee913','d49533b8-1d5a-402b-a65a-241eb714d1ce','244162c1-741f-4b49-9716-6e56da0ecf42'),('4943a81b-1790-4205-b800-6d041a9490a2','d49533b8-1d5a-402b-a65a-241eb714d1ce','7b3e5659-0c02-4beb-9331-3dc56d72a993'),('4949875f-7eaf-4e6d-8897-04db1d04f3f4','08b9074e-1197-4dd3-b346-5dd8ee5db246','58eee1b8-30e6-453c-8c23-5aeb95c03d65'),('496e7908-fc30-46f5-9b51-5fc60cc81bd5','d49533b8-1d5a-402b-a65a-241eb714d1ce','605b8714-1134-485c-96f2-f21ccfb35462'),('4979083a-d812-40c0-a66c-5ffb89d7e81e','d49533b8-1d5a-402b-a65a-241eb714d1ce','5a01b632-9a00-44f2-bb73-cd07e5a407ea'),('498678bd-b52e-4a5e-83c2-510568e92400','d49533b8-1d5a-402b-a65a-241eb714d1ce','f9cd01fc-1a58-4f58-8aa8-d6ae75950707'),('49e6d93c-11c1-4b11-9e69-6bd577bd6ec1','d49533b8-1d5a-402b-a65a-241eb714d1ce','1539edc9-1efa-4e3f-b270-dd8c430fb52e'),('4a3b8519-f0b4-4ada-a1b9-d28b16baa4dd','08b9074e-1197-4dd3-b346-5dd8ee5db246','60c68257-8539-4e60-bd79-efead5c7efc5'),('4c27c1e0-c020-4157-8eaf-918c4adaa7cf','08b9074e-1197-4dd3-b346-5dd8ee5db246','5892f3c1-094a-4d1f-8887-0358e16cfa5a'),('4c3e7867-7909-42a2-80de-d68db5c941b1','d49533b8-1d5a-402b-a65a-241eb714d1ce','51b33b8d-4af4-420a-9b7b-ffa44c8962b9'),('4c5c3125-d341-4108-bda3-11f03767f22b','08b9074e-1197-4dd3-b346-5dd8ee5db246','1b446d62-4b96-4432-bb6c-ca8a6289fb2d'),('4cae75a0-7967-463f-86ed-292db91d735b','3ac1b691-1154-460f-9c17-33ba2e46ef23','518395c8-a0c0-4338-9042-066141bfc558'),('4cbc69a9-690c-4d77-8326-830b1705df12','08b9074e-1197-4dd3-b346-5dd8ee5db246','e7757e42-7305-4509-91dd-40d50799c764'),('4ce7cfd8-0180-46f3-8cd5-5a03b7f3542f','08b9074e-1197-4dd3-b346-5dd8ee5db246','d84dd02a-5528-4ba9-a464-2e59d321bc6a'),('4ceca4bb-93f5-4d9c-af25-d150f0e97631','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingProgramBudgetV'),('4d7bb4f8-5df1-4283-9bc0-a10c7ddd1b39','08b9074e-1197-4dd3-b346-5dd8ee5db246','5ed27c0d-5a84-4e87-9b2f-f30535b484f0'),('4d899849-39c3-423a-9e3f-dd15a0a62671','d49533b8-1d5a-402b-a65a-241eb714d1ce','c59dd8c5-7ae9-455d-adb9-2fe1d67e9fd0'),('4e1b669a-5852-4630-abf7-af65220930f2','3ac1b691-1154-460f-9c17-33ba2e46ef23','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('4efbfedc-3070-4193-a054-a284eddcf609','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','f2be4395-bf17-49e7-9903-23e95697ba44'),('4f357213-f78e-4ad5-86dd-ab8cbc1a234f','3ac1b691-1154-460f-9c17-33ba2e46ef23','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('4f788368-a0fd-43a1-8c9c-e4fe7cc93dee','08b9074e-1197-4dd3-b346-5dd8ee5db246','7c57116e-ef11-421f-8bc6-9feb45773939'),('531d9cc7-0753-4d13-8196-0b57a38441ac','d49533b8-1d5a-402b-a65a-241eb714d1ce','d3856f0d-ef58-4f2c-ab85-ca0b15fe1505'),('5445ea83-97da-4041-a5dc-f5a7dcb38bb0','d49533b8-1d5a-402b-a65a-241eb714d1ce','73e293c4-7385-4c47-9b4d-9bde44b400ee'),('54865cf6-c87c-40b7-acf9-8533521b2e28','3ac1b691-1154-460f-9c17-33ba2e46ef23','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('55ddca74-194c-48be-bdc8-c637fa5f050a','d49533b8-1d5a-402b-a65a-241eb714d1ce','a7214d55-5624-4228-944f-608b18660082'),('56373b74-2741-4e7d-8146-2eb88078ab49','08b9074e-1197-4dd3-b346-5dd8ee5db246','a9988637-e407-47fc-82e4-fd2ef80de32c'),('5699358f-757d-47d5-a973-dca1408018f3','08b9074e-1197-4dd3-b346-5dd8ee5db246','8852fb1d-8c4b-4973-8f9b-cdd203f0fd88'),('56c7559b-90c3-448e-8260-66d2136512b0','08b9074e-1197-4dd3-b346-5dd8ee5db246','73e293c4-7385-4c47-9b4d-9bde44b400ee'),('5915ea25-5444-408b-8486-ae6f2d63fdb8','778c38d0-e5de-4737-bad4-7a3d89078266','a7214d55-5624-4228-944f-608b18660082'),('59c5f0ae-0783-4794-b251-ad664c673ac2','d49533b8-1d5a-402b-a65a-241eb714d1ce','b6766b2f-a30e-45ab-b46e-bd14bb07c1d1'),('5aa29e7b-586b-4d92-b116-1df010a856f3','d49533b8-1d5a-402b-a65a-241eb714d1ce','381b8daf-542b-4c53-bd83-6deda9a2ef09'),('5be3dfde-a5c1-47e5-9c05-149228544fe9','08b9074e-1197-4dd3-b346-5dd8ee5db246','518395c8-a0c0-4338-9042-066141bfc558'),('5bf4ba9b-4d52-4383-b187-1e2f41ab6cd1','d49533b8-1d5a-402b-a65a-241eb714d1ce','b21946a4-7863-4908-94e3-414a353fdae9'),('5d16e358-0075-453f-a0c0-5b1e0b34eeea','3ac1b691-1154-460f-9c17-33ba2e46ef23','a7214d55-5624-4228-944f-608b18660082'),('5da3980d-fafc-440f-b9bb-426a946bc68b','08b9074e-1197-4dd3-b346-5dd8ee5db246','03d385f6-83db-43ee-bafb-eb444a1c27ea'),('5df5bde6-ebf8-4a61-9c3b-b3700f2711cc','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','59bac8c4-4866-473f-87e9-8ee6820d93dd'),('5e625d2b-788b-4396-8748-3d51c84fa11b','08b9074e-1197-4dd3-b346-5dd8ee5db246','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('5f1a8533-0c9d-4f24-8d08-c7746deb98d4','d49533b8-1d5a-402b-a65a-241eb714d1ce','4b0eb421-baac-4cc7-8bf0-215632572786'),('5f6d9d0e-ef8d-4751-8165-a9d0a67e8cdc','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingProCampV'),('63b9d0b7-e198-4836-b10f-374eca7ef8f3','08b9074e-1197-4dd3-b346-5dd8ee5db246','cfed9b00-940e-4876-8aa6-bdeaf688e048'),('644282e1-f675-406c-bea7-e79ad8cea00c','d49533b8-1d5a-402b-a65a-241eb714d1ce','99dc6f36-30d3-4d92-912c-6963513a3f6e'),('647409c4-c1ad-45d0-bb4f-e5dccc6e4f40','3d6d5269-70c5-4c8d-9a05-542c7768922d','5DF10A76-F9B8-4D83-82BF-9F990CDDF97A'),('64a3e0e3-14cd-46d5-b95e-7efdbf3e93c8','08b9074e-1197-4dd3-b346-5dd8ee5db246','9097d299-cb10-43b3-8b44-fd20605f15ac'),('64d52bdd-a915-4466-a4ab-7daea78e6a22','d49533b8-1d5a-402b-a65a-241eb714d1ce','4a7f39a2-4493-4a66-a357-8ab229ccc2e5'),('66289510-0445-4656-bd61-87816e166044','08b9074e-1197-4dd3-b346-5dd8ee5db246','250a34a6-b26f-4c47-82c6-52432003366a'),('665a85ef-d322-4bac-affa-ffe036761e15','d49533b8-1d5a-402b-a65a-241eb714d1ce','40840e39-679e-4b7e-9019-c99ab58c04e4'),('666954a7-51d0-4471-a6b6-7191ec735dd0','d49533b8-1d5a-402b-a65a-241eb714d1ce','60c68257-8539-4e60-bd79-efead5c7efc5'),('672ebe9e-97e7-44a1-a97a-2865a85d480d','d49533b8-1d5a-402b-a65a-241eb714d1ce','fd1baffd-dd6a-41ec-9b75-57794e7ef1d0'),('675ee659-e868-42e6-8ecd-7abe2575318e','08b9074e-1197-4dd3-b346-5dd8ee5db246','0a30d204-2672-4ce2-bf0e-0c8d694a6ff7'),('6776eba7-4c13-4ee3-ae69-c272fbefd9cb','d49533b8-1d5a-402b-a65a-241eb714d1ce','3ac9c356-33d5-4496-86b5-ddc791c888ff'),('679fa37f-b690-4510-9a91-10eed3bada03','3d6d5269-70c5-4c8d-9a05-542c7768922d','6b5bdebe-66f1-452b-a74f-1fbd014286b9'),('67d9d8c8-6a04-4467-b037-1b081aac7607','08b9074e-1197-4dd3-b346-5dd8ee5db246','7ee78346-1286-4c87-a48c-120c9e5fe087'),('68d94cdd-b2f2-4c7c-b366-756dfc2f23bf','778c38d0-e5de-4737-bad4-7a3d89078266','8198ce54-9e8e-4c51-99d7-06bd359503bd'),('6929dfe3-7074-4fec-aeb3-840d2d5b0ce9','778c38d0-e5de-4737-bad4-7a3d89078266','MarketingCampaignV'),('696ffea1-fb90-4f13-9bc8-c7e5ae6d26cc','d49533b8-1d5a-402b-a65a-241eb714d1ce','27182071-91a2-4f66-8ca3-c4d27d6e51ce'),('69a42433-964a-4973-b64f-a723b9d602da','08b9074e-1197-4dd3-b346-5dd8ee5db246','f64c8ba6-f4ac-4987-98b8-cd8adaf624f7'),('6a2eff02-6824-4423-994a-f241d0673e81','08b9074e-1197-4dd3-b346-5dd8ee5db246','925a4b7d-835e-4a9b-9d5c-7b73ab41d79b'),('6afa59f8-6339-49e9-b717-f2ecc4b1f602','3d6d5269-70c5-4c8d-9a05-542c7768922d','70648537-6320-4f68-aca4-17eb272cd475'),('6b1303ff-14ef-4a83-a7bc-485471c1d058','3d6d5269-70c5-4c8d-9a05-542c7768922d','0a78d008-87ae-4a5c-985c-4ddc72026fbc'),('6ca2019e-c602-4ef4-a100-12f741d693e7','08b9074e-1197-4dd3-b346-5dd8ee5db246','09a40291-4b1f-4285-affd-975e41d87ecf'),('6ca36d80-55c1-4790-bd13-fb423c6472f1','d49533b8-1d5a-402b-a65a-241eb714d1ce','295be7ad-b55b-4e7e-9547-96c5bc2772dc'),('6d1e2400-717a-4f1f-81bd-1b7e4908241d','08b9074e-1197-4dd3-b346-5dd8ee5db246','e5c11162-96b0-4b42-ab47-598d9fdd89ba'),('6d340113-91d3-4774-bad7-7b1835f11cb4','08b9074e-1197-4dd3-b346-5dd8ee5db246','cf012aff-385c-4930-82e4-12633156d633'),('6d539cc7-9fea-4c00-b437-15a2a0576529','08b9074e-1197-4dd3-b346-5dd8ee5db246','c59dd8c5-7ae9-455d-adb9-2fe1d67e9fd0'),('6dcb43ec-b02e-4433-907d-e0ca5887c685','3ac1b691-1154-460f-9c17-33ba2e46ef23','5522470D-F399-4F99-A9CF-5594C4709109'),('6dea3c39-c16f-4ef2-b39d-5d290fcd29ac','778c38d0-e5de-4737-bad4-7a3d89078266','dc4c353c-2a92-4849-b424-23e3aaae0f91'),('6f2fa1a4-d98d-45c5-99ac-22a2fa03675e','08b9074e-1197-4dd3-b346-5dd8ee5db246','83a62ed2-b19a-4b7f-877a-bb1e52f40534'),('71993d99-45a1-42d2-8aa1-cedc04de8c82','778c38d0-e5de-4737-bad4-7a3d89078266','605b8714-1134-485c-96f2-f21ccfb35462'),('72530310-ad1b-45c6-a982-13a5682ce8cd','d49533b8-1d5a-402b-a65a-241eb714d1ce','e5c11162-96b0-4b42-ab47-598d9fdd89ba'),('72704b91-67c2-4601-a093-ca1e6f1ad9f2','778c38d0-e5de-4737-bad4-7a3d89078266','6b5bdebe-66f1-452b-a74f-1fbd014286b9'),('7334323c-6f75-44d1-bad2-cc99e42e2518','3d6d5269-70c5-4c8d-9a05-542c7768922d','a4ed2c8c-e4ea-428e-8228-c02268afc0e0'),('73ddd0f5-86a8-4188-8195-2531b23d6dfe','d49533b8-1d5a-402b-a65a-241eb714d1ce','b9dc8e12-14c5-479d-a2dd-44238a45d484'),('74a419da-5946-494f-83b7-1900925d843c','d49533b8-1d5a-402b-a65a-241eb714d1ce','f64c8ba6-f4ac-4987-98b8-cd8adaf624f7'),('74be4682-6b1d-4664-b5b4-eb67de132f3b','08b9074e-1197-4dd3-b346-5dd8ee5db246','605b8714-1134-485c-96f2-f21ccfb35462'),('758dfb42-0153-4435-9131-94188a423fd7','d49533b8-1d5a-402b-a65a-241eb714d1ce','c3d59bfc-de94-456f-b9ec-904da46c09fc'),('75d7a2d9-2851-487d-b59d-bcfd39096fd2','08b9074e-1197-4dd3-b346-5dd8ee5db246','7b3e5659-0c02-4beb-9331-3dc56d72a993'),('75e33fdf-b445-411c-9dc8-c16052a3652b','08b9074e-1197-4dd3-b346-5dd8ee5db246','7c1b73c1-e0eb-4191-9f2d-8d8a336c8c89'),('76729b9f-3ce7-4764-a92b-e96d07704829','d49533b8-1d5a-402b-a65a-241eb714d1ce','cfed9b00-940e-4876-8aa6-bdeaf688e048'),('76c5194b-706c-442c-93f6-c9f7cfd9558b','778c38d0-e5de-4737-bad4-7a3d89078266','f3682bfc-d973-490c-972b-f2f879c2b7a4'),('77653abc-94de-4729-98dd-15026d65024f','08b9074e-1197-4dd3-b346-5dd8ee5db246','381a1f9c-5b7c-4086-be85-79983a5dcb50'),('782e4bb7-df62-4b67-af7e-fe20cf3aeab1','778c38d0-e5de-4737-bad4-7a3d89078266','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('785a964e-d41c-485d-8cef-43c223dbd559','08b9074e-1197-4dd3-b346-5dd8ee5db246','60f2281e-fd68-4eea-b0a5-825a97fad12c'),('794393aa-fb08-48d7-8ec0-afcc28e1752d','3d6d5269-70c5-4c8d-9a05-542c7768922d','7b3e5659-0c02-4beb-9331-3dc56d72a993'),('79bc54f5-6339-4cde-9f78-99033dc51aa4','d49533b8-1d5a-402b-a65a-241eb714d1ce','f3682bfc-d973-490c-972b-f2f879c2b7a4'),('7b8c5b90-e318-4cab-a10c-17b5c8a92da4','3ac1b691-1154-460f-9c17-33ba2e46ef23','9afae00a-a833-4aa7-b0a2-23d0019eee80'),('7c5b8b28-766d-4a5a-b43f-b34d2daa7d8d','08b9074e-1197-4dd3-b346-5dd8ee5db246','3ff53029-8310-4aa0-9048-06d33d62735c'),('7df63f95-2611-4603-b45f-7d14c8ec2011','08b9074e-1197-4dd3-b346-5dd8ee5db246','8198ce54-9e8e-4c51-99d7-06bd359503bd'),('7e191d8f-a233-4be6-86b5-afb3d009ad7f','08b9074e-1197-4dd3-b346-5dd8ee5db246','031d4f71-c1fc-4cfc-9b0f-472d8e998a68'),('7e2091a6-bf22-4266-9767-12b89a26daca','d49533b8-1d5a-402b-a65a-241eb714d1ce','13f35ae2-ff33-4236-b4a1-e441a791428a'),('7efe157b-f580-49dc-abd6-ad20528071a9','d49533b8-1d5a-402b-a65a-241eb714d1ce','895eaefe-49a6-4e88-9efd-7a574e441dd6'),('7f07db2a-e52a-4610-a621-e4ee733a95f1','d49533b8-1d5a-402b-a65a-241eb714d1ce','7e0dc766-338c-43e5-80ff-eefcd8b6d4cb'),('7fb49995-1ead-46e4-9f24-56a18417a1a0','08b9074e-1197-4dd3-b346-5dd8ee5db246','385d71a3-9c45-4661-a533-209e76b19eeb'),('816c826b-1efb-4bf5-81ae-97492f8133c0','08b9074e-1197-4dd3-b346-5dd8ee5db246','0c60e3e2-dc69-4a80-9751-96ca56531fd1'),('81711856-0fe4-4b67-abbb-bb16307ee0a9','3d6d5269-70c5-4c8d-9a05-542c7768922d','d3856f0d-ef58-4f2c-ab85-ca0b15fe1505'),('8212dadd-16d6-4c8e-80c1-54b32f3b4f96','d49533b8-1d5a-402b-a65a-241eb714d1ce','1b7203a1-66f9-449c-8329-a8f751255320'),('82374b8e-fa2c-484a-942a-bb1ceedbeefa','778c38d0-e5de-4737-bad4-7a3d89078266','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('82efc2c0-dc9d-4505-9dd5-a37853aee494','d49533b8-1d5a-402b-a65a-241eb714d1ce','acde5d75-f9a2-449f-95f2-c03117fe3a9a'),('843faff4-4531-4067-8cd4-55f9b10988f3','d49533b8-1d5a-402b-a65a-241eb714d1ce','11e986d9-1bb3-40c4-9454-c525ed342edf'),('84fb750f-e128-4aa3-9580-7ac12ea33fb9','08b9074e-1197-4dd3-b346-5dd8ee5db246','c3d59bfc-de94-456f-b9ec-904da46c09fc'),('8525c617-2f05-4fda-864a-607c38b2cbb1','d49533b8-1d5a-402b-a65a-241eb714d1ce','925a4b7d-835e-4a9b-9d5c-7b73ab41d79b'),('86b74d25-6e4e-4a18-9841-42e01c25c715','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','e407c13d-05fd-4b08-a738-cf542b7f51e0'),('8730a814-481c-4237-82b5-49ea9a86c459','d49533b8-1d5a-402b-a65a-241eb714d1ce','7b23d169-3830-482d-ae19-7352cd33381b'),('873d94af-cd8e-4ab9-8a22-eb97ba0e0ee3','61f956bf-b504-4ce8-bc55-6db242c2efcc','67fe64d7-ac40-463f-a92b-c4923b24bc45'),('8756ef02-0c8b-49ab-a43a-9a5a691e0155','d49533b8-1d5a-402b-a65a-241eb714d1ce','59bac8c4-4866-473f-87e9-8ee6820d93dd'),('8855a975-454f-4838-a215-ded7dd5099dc','08b9074e-1197-4dd3-b346-5dd8ee5db246','6ef80e42-65ae-4e5d-a2b4-72d479d78e57'),('889ecf8e-53a3-46e5-994e-0203cea0dde2','3ac1b691-1154-460f-9c17-33ba2e46ef23','882C9D5A-EBDD-4A44-BC3F-BF84E3A8F683'),('890b6731-3c37-4607-ae02-7486eff2e445','d49533b8-1d5a-402b-a65a-241eb714d1ce','d401fb03-a85f-4bba-aa77-4203c25d9443'),('891cd531-2c2c-4a45-93c6-4f3d472f3101','d49533b8-1d5a-402b-a65a-241eb714d1ce','7c57116e-ef11-421f-8bc6-9feb45773939'),('896a6a11-f2eb-45c2-be64-a6d5b9526ba7','08b9074e-1197-4dd3-b346-5dd8ee5db246','a52c9d6c-583e-48bb-bba4-ce0615d86c99'),('89c5b302-ff00-4e53-8f13-47cad40bca24','778c38d0-e5de-4737-bad4-7a3d89078266','d3856f0d-ef58-4f2c-ab85-ca0b15fe1505'),('8a4b574c-659b-494c-a3fe-8689d4cc9a60','d49533b8-1d5a-402b-a65a-241eb714d1ce','76d58e9e-38fe-455f-9aad-0e87648bb55a'),('8a6c8ae0-0992-43b4-9d9f-c48f16ae8c1b','3ac1b691-1154-460f-9c17-33ba2e46ef23','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('8ab1bceb-53d8-4aac-af32-6fa63aef5ff9','d49533b8-1d5a-402b-a65a-241eb714d1ce','df71e391-c65e-4389-b04b-f84020317253'),('8b596a72-3f52-46a1-b794-47d30959d562','08b9074e-1197-4dd3-b346-5dd8ee5db246','648b11df-0c26-473f-b129-6b23907b17f2'),('8bee29ba-8170-4e9d-8186-5d8d4a2bdb74','d49533b8-1d5a-402b-a65a-241eb714d1ce','21512b72-a2b2-4a6c-a5b8-1010d37cf03c'),('8c74ead0-2fd1-47db-81b5-2e9ba3d23d5e','08b9074e-1197-4dd3-b346-5dd8ee5db246','d3856f0d-ef58-4f2c-ab85-ca0b15fe1505'),('8c8c2243-4ce8-4ccf-984e-c45f790f3292','d49533b8-1d5a-402b-a65a-241eb714d1ce','2e5080ff-36b1-4bb9-9ef1-abb7a5c3c634'),('8cdd3615-9fe4-46a3-8d0c-38710f4a89e1','d49533b8-1d5a-402b-a65a-241eb714d1ce','98a569e6-b559-427f-87d2-2f1b9fa786e5'),('8d304e9a-edaa-416a-815c-ba4c4f870afe','d49533b8-1d5a-402b-a65a-241eb714d1ce','b34dedaf-ce96-4330-af5c-61cb04be7e40'),('8dfa5ebc-7c1d-4fbb-821a-4fc97c960764','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','8f2453e8-c0fd-4693-86c5-341784f1c747'),('8e48d286-3eaf-4a4a-be9b-b1ef749161dc','d49533b8-1d5a-402b-a65a-241eb714d1ce','16e24c0d-0e2f-4dfe-ae9c-6f30e4492e7b'),('8fbf6e2f-6a5d-4b3d-b5c1-63bcc7bccc9b','08b9074e-1197-4dd3-b346-5dd8ee5db246','8dafed22-c9c1-4c2d-8d52-42642510cdc8'),('9013bcd0-3ede-40ad-ad64-acbb6a5144cc','d49533b8-1d5a-402b-a65a-241eb714d1ce','667d8927-35b5-4f8b-90a3-7411e9d6d7c3'),('914ba22d-606a-442e-81f0-6e33f9b2ed29','08b9074e-1197-4dd3-b346-5dd8ee5db246','d401fb03-a85f-4bba-aa77-4203c25d9443'),('91b61bca-a2b4-4636-aab8-d70193993583','08b9074e-1197-4dd3-b346-5dd8ee5db246','fd1baffd-dd6a-41ec-9b75-57794e7ef1d0'),('91c9608b-a63f-4049-813f-867fdbab9fc4','3ac1b691-1154-460f-9c17-33ba2e46ef23','MarketingProCampV'),('91cd43ba-ec73-453b-bfa5-3139f3b47500','3d6d5269-70c5-4c8d-9a05-542c7768922d','5a01b632-9a00-44f2-bb73-cd07e5a407ea'),('92070675-dac8-4369-8fa8-2ad738734cbc','d49533b8-1d5a-402b-a65a-241eb714d1ce','d86b8b0b-d725-4a74-9a56-93705f492cbc'),('9331c0de-b8c7-43c2-aa6b-776814686351','3d6d5269-70c5-4c8d-9a05-542c7768922d','62406e88-f768-4c73-9317-cdd66ca0314f'),('941591bb-57bd-4cf7-90b1-aa0aa4a6ca68','08b9074e-1197-4dd3-b346-5dd8ee5db246','b9dc8e12-14c5-479d-a2dd-44238a45d484'),('9416b750-30ee-4095-9154-9773067311e9','d49533b8-1d5a-402b-a65a-241eb714d1ce','92cfd846-18c2-4b79-a793-8c0fe0fdf245'),('94578e90-a210-49eb-8cf6-bc6a6d3b1c64','d49533b8-1d5a-402b-a65a-241eb714d1ce','bd7a182f-1cb0-4369-bd58-c427081adb3f'),('948fcc27-2ca0-454e-a210-f31401e8b0a8','d49533b8-1d5a-402b-a65a-241eb714d1ce','e7757e42-7305-4509-91dd-40d50799c764'),('949e8f4a-d8ce-484b-96bf-4f5ecff38246','3d6d5269-70c5-4c8d-9a05-542c7768922d','4ba38593-ab87-4f07-ab84-088978ec0287'),('94f77b9f-ee36-4d73-a99d-2cd585c6e73f','08b9074e-1197-4dd3-b346-5dd8ee5db246','16758145-4ef9-42e2-bf6c-77af7b32da5f'),('961d71de-a3b5-4639-9af7-b3ec2cb8ceb0','08b9074e-1197-4dd3-b346-5dd8ee5db246','7606d652-3281-4bb8-8465-1f2d62690c28'),('9655d2b4-ac50-40bf-94a3-42ef3d0a1a87','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingCampaignV'),('967e9a4f-df2a-417a-8a97-7a8e7b18c48f','08b9074e-1197-4dd3-b346-5dd8ee5db246','DB3D26CC-94B8-4EF0-8200-A0A8BB2F510F'),('97af1329-2490-47f8-82a6-f0dfa1d1d20e','08b9074e-1197-4dd3-b346-5dd8ee5db246','55c478eb-8579-4cbe-bd37-01969733a188'),('992851ac-811b-44a6-8e30-2389257ae201','08b9074e-1197-4dd3-b346-5dd8ee5db246','e47c2511-caf0-4675-a23b-0edcb4df8b7c'),('9a7bf81b-efe3-42b4-9383-9d14951cf33d','d49533b8-1d5a-402b-a65a-241eb714d1ce','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('9ae24253-8f90-46ed-b18f-3bf4e71c0634','d49533b8-1d5a-402b-a65a-241eb714d1ce','af7be7d8-5080-45ce-af2d-7a1096e2b5da'),('9b63d01a-dd91-4173-8c55-8c1f31beaefa','d49533b8-1d5a-402b-a65a-241eb714d1ce','659bdc4a-dba7-4c81-9af5-9665f7bc185c'),('9b83b32b-2178-4dd9-9da1-261944cd07e1','08b9074e-1197-4dd3-b346-5dd8ee5db246','b924bd15-8d4a-4ef1-abce-d1837e505738'),('9c330c14-0127-495d-939a-580ab418a824','d49533b8-1d5a-402b-a65a-241eb714d1ce','648b11df-0c26-473f-b129-6b23907b17f2'),('9c7d72f3-0287-494e-9e6e-ae7e79fb02c0','08b9074e-1197-4dd3-b346-5dd8ee5db246','92a914b3-e8ad-4385-ab2b-2a142e9720b7'),('9dc55b9d-7564-4fbf-818f-387742a56f6e','08b9074e-1197-4dd3-b346-5dd8ee5db246','df71e391-c65e-4389-b04b-f84020317253'),('9e21d35a-0630-4934-ab69-b6f2d7fb3776','d49533b8-1d5a-402b-a65a-241eb714d1ce','d447426e-623a-4082-b82b-52de2543b9b2'),('9e6e8737-56d4-43c7-9efb-c479b024d6d6','d49533b8-1d5a-402b-a65a-241eb714d1ce','e47c2511-caf0-4675-a23b-0edcb4df8b7c'),('9e8066e8-e512-4857-b3d4-f5b6098b921b','08b9074e-1197-4dd3-b346-5dd8ee5db246','bd4e103e-deb5-4e17-b9e9-e4973e192ee0'),('9ff1a6c3-37cf-45d3-a633-08fc1f5d4b38','778c38d0-e5de-4737-bad4-7a3d89078266','0c60e3e2-dc69-4a80-9751-96ca56531fd1'),('a1a8f93d-3fe2-4be4-8981-b4cfc4bc1979','d49533b8-1d5a-402b-a65a-241eb714d1ce','c9c2c598-5e56-480f-a74f-09850eda67ad'),('a1e75f41-e144-4205-95a6-2be28c617a81','d49533b8-1d5a-402b-a65a-241eb714d1ce','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('a556850e-934b-4290-b50a-71893ec7f53a','08b9074e-1197-4dd3-b346-5dd8ee5db246','03c3a588-9ab7-4293-9cff-223f7f6613b3'),('a5b674b0-0f50-4484-ad98-f0b2c739936c','778c38d0-e5de-4737-bad4-7a3d89078266','43be26fc-36ac-49cb-8ef9-2a92762ffe82'),('a5d8075a-a95f-4932-aac6-b92a223a1372','d49533b8-1d5a-402b-a65a-241eb714d1ce','372e2ac0-a337-4fb0-998f-adc0571d2866'),('a601ef2f-2584-4369-9901-bbefb8e99032','d49533b8-1d5a-402b-a65a-241eb714d1ce','d562cf20-0a33-4441-89b2-b459ab052c1b'),('a614ab28-f05d-4aa3-ab23-67b6cc930555','3d6d5269-70c5-4c8d-9a05-542c7768922d','a7214d55-5624-4228-944f-608b18660082'),('a6baaf84-7642-4b50-9a5d-1a1d083720db','08b9074e-1197-4dd3-b346-5dd8ee5db246','61020fe5-21a3-4e5d-aed5-d8d7ce094bdb'),('a82590ab-a683-4e0f-aacc-360cd9b193c2','08b9074e-1197-4dd3-b346-5dd8ee5db246','606f11eb-7ac1-49f4-a54e-ca94b8e60735'),('a83337a8-e332-4f77-9197-a1ab704d8b83','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','c9c2c598-5e56-480f-a74f-09850eda67ad'),('a844bc56-8d2e-4b59-bb59-1cf3ae22cac9','d49533b8-1d5a-402b-a65a-241eb714d1ce','36118531-1895-4c4a-82ee-6a69e525a0b6'),('a8a39e6f-0e91-484f-9b13-0fd9442fdee9','778c38d0-e5de-4737-bad4-7a3d89078266','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('a9074550-82b2-43d3-803d-527b964eb453','d49533b8-1d5a-402b-a65a-241eb714d1ce','bee19bb8-cfe1-40bd-b4db-3b41964ee77e'),('a944c0f0-b914-4524-8318-05e392658f1a','d49533b8-1d5a-402b-a65a-241eb714d1ce','a9988637-e407-47fc-82e4-fd2ef80de32c'),('aac02f78-8ace-4b5d-a174-5d76a2407948','d49533b8-1d5a-402b-a65a-241eb714d1ce','a554c5aa-15b8-44f2-a4d1-41869ed8297f'),('acef8547-0509-4178-857b-95f0537f8981','3ac1b691-1154-460f-9c17-33ba2e46ef23','6b5bdebe-66f1-452b-a74f-1fbd014286b9'),('ad2aa99d-15b1-4425-b883-19aa9c7c4a85','d49533b8-1d5a-402b-a65a-241eb714d1ce','6da5d270-9adc-49ee-a999-6ab4c350c977'),('ad92d518-0702-4eab-9685-a4c919ba1fba','08b9074e-1197-4dd3-b346-5dd8ee5db246','0a78d008-87ae-4a5c-985c-4ddc72026fbc'),('ae6ea91c-ba13-474d-a787-f7158e3b8d12','3d6d5269-70c5-4c8d-9a05-542c7768922d','06e590ca-7050-4043-a2f5-ba4537a6cb7b'),('ae78d773-9d5d-4139-8b1a-bd4d9e8f2c07','08b9074e-1197-4dd3-b346-5dd8ee5db246','ad9e25bd-6098-4f72-a22f-ca941c7f31b1'),('aebe1498-66b3-4a8c-a55f-1bce8f1daaa9','08b9074e-1197-4dd3-b346-5dd8ee5db246','136bfa04-7b65-45ee-8dcd-e7bb31325653'),('aedb575b-395c-4892-b93d-c07bd096d066','d49533b8-1d5a-402b-a65a-241eb714d1ce','0ff00b27-698c-4d60-bc91-bc0bd9531301'),('af2ae7a9-b1f0-4824-956f-d44ffb9c525e','d49533b8-1d5a-402b-a65a-241eb714d1ce','3ff53029-8310-4aa0-9048-06d33d62735c'),('af54dd1a-184e-4d2c-b46a-fc5c12e2aad1','d49533b8-1d5a-402b-a65a-241eb714d1ce','7515b817-ea7b-4637-89f2-58517a51880b'),('af6fe27f-cfd2-439e-8fbd-acbb289f7e55','08b9074e-1197-4dd3-b346-5dd8ee5db246','06e590ca-7050-4043-a2f5-ba4537a6cb7b'),('b0621170-65de-45ef-b5c7-c1155f1293e5','d49533b8-1d5a-402b-a65a-241eb714d1ce','9097d299-cb10-43b3-8b44-fd20605f15ac'),('b07d90d3-579d-44d9-80d2-9149180cc23f','08b9074e-1197-4dd3-b346-5dd8ee5db246','16e24c0d-0e2f-4dfe-ae9c-6f30e4492e7b'),('b0bd4aae-d805-4709-b7e8-d7f8dd1cc4f7','d49533b8-1d5a-402b-a65a-241eb714d1ce','0c60e3e2-dc69-4a80-9751-96ca56531fd1'),('b137b5f6-b72c-49c6-90d5-0bbedc30bda6','3d6d5269-70c5-4c8d-9a05-542c7768922d','98a569e6-b559-427f-87d2-2f1b9fa786e5'),('b18e64e0-2c98-45da-985e-1e67dccbe7be','778c38d0-e5de-4737-bad4-7a3d89078266','5a01b632-9a00-44f2-bb73-cd07e5a407ea'),('b1f1c415-bf69-4c93-852e-5f0c87964f51','d49533b8-1d5a-402b-a65a-241eb714d1ce','031d4f71-c1fc-4cfc-9b0f-472d8e998a68'),('b345b60a-ddfc-47f9-9cd4-817e63b0192b','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingCampaignExpenseV'),('b3492746-b835-4b62-afa5-fc58960278b5','08b9074e-1197-4dd3-b346-5dd8ee5db246','d562cf20-0a33-4441-89b2-b459ab052c1b'),('b359c7c3-92c4-4e20-b585-c290662fe5da','08b9074e-1197-4dd3-b346-5dd8ee5db246','acde5d75-f9a2-449f-95f2-c03117fe3a9a'),('b406b682-8111-4380-93b4-bd0125707941','d49533b8-1d5a-402b-a65a-241eb714d1ce','34a91780-0109-46a5-b9b7-e58700097cfe'),('b4de78c8-0975-4612-b975-4394f4a6bace','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingProgramBudgetV'),('b56fd683-1864-4fb5-9976-4d6550cd38bb','08b9074e-1197-4dd3-b346-5dd8ee5db246','245b9ebd-8377-453d-9c2d-309b3f42e811'),('b5a0b183-392f-4f24-81a8-09d778ad8d94','d49533b8-1d5a-402b-a65a-241eb714d1ce','381a1f9c-5b7c-4086-be85-79983a5dcb50'),('b72c52f4-016f-4eee-ae3b-c4a9f59ae219','d49533b8-1d5a-402b-a65a-241eb714d1ce','6ef80e42-65ae-4e5d-a2b4-72d479d78e57'),('b754e585-637c-4b09-808a-f138595679d0','d49533b8-1d5a-402b-a65a-241eb714d1ce','de7d2918-883b-471f-9b45-c373cfe86e61'),('b7b28be0-afd2-4e1c-b5bf-92e203ff1a71','3d6d5269-70c5-4c8d-9a05-542c7768922d','6b885df8-6dce-454a-9715-7e964baf8aca'),('b8d46ce0-7bb1-42ba-9290-d9efe2accf97','d49533b8-1d5a-402b-a65a-241eb714d1ce','882C9D5A-EBDD-4A44-BC3F-BF84E3A8F683'),('b8e5fbe8-5aa6-4fcb-a220-4a4915870876','d49533b8-1d5a-402b-a65a-241eb714d1ce','a4ed2c8c-e4ea-428e-8228-c02268afc0e0'),('ba38e223-4da0-4350-9bd0-4cace5b7e3d1','778c38d0-e5de-4737-bad4-7a3d89078266','518395c8-a0c0-4338-9042-066141bfc558'),('ba3febc5-86a5-484f-b00d-6e78bf6c7c72','3ac1b691-1154-460f-9c17-33ba2e46ef23','9eb7df35-51ba-454e-b1a2-253ff053a439'),('ba93439f-8351-4f78-94a6-66a7f0fe348a','08b9074e-1197-4dd3-b346-5dd8ee5db246','0ff00b27-698c-4d60-bc91-bc0bd9531301'),('ba94b5f7-dc2f-45fb-8e76-04f487b9c531','d49533b8-1d5a-402b-a65a-241eb714d1ce','cf012aff-385c-4930-82e4-12633156d633'),('bb327f0d-0213-4ae0-9094-b0fc95dc91c3','d49533b8-1d5a-402b-a65a-241eb714d1ce','7ee78346-1286-4c87-a48c-120c9e5fe087'),('bbccbc1c-469a-4fc5-a866-17d5fa386e3b','d49533b8-1d5a-402b-a65a-241eb714d1ce','518395c8-a0c0-4338-9042-066141bfc558'),('bc5762a2-2fd5-4d1b-a37a-191298e13992','d49533b8-1d5a-402b-a65a-241eb714d1ce','83a62ed2-b19a-4b7f-877a-bb1e52f40534'),('bc9e9f41-c255-4d4e-ac42-c00ca42658ed','d49533b8-1d5a-402b-a65a-241eb714d1ce','28f9b560-0842-47da-bec9-e83abb0d4931'),('bcb56950-0900-475f-bea4-d333855c551d','08b9074e-1197-4dd3-b346-5dd8ee5db246','1539edc9-1efa-4e3f-b270-dd8c430fb52e'),('bcba2a26-3f42-4a6f-b7ac-8830585827cd','3ac1b691-1154-460f-9c17-33ba2e46ef23','d86b8b0b-d725-4a74-9a56-93705f492cbc'),('bcf28178-0303-4bbd-a54c-03645298127f','d49533b8-1d5a-402b-a65a-241eb714d1ce','3ada0c49-09fd-4b6f-a8d3-c5024dfd0182'),('bcfe490a-c874-4a8d-8ec6-e08edc5c9438','08b9074e-1197-4dd3-b346-5dd8ee5db246','d447426e-623a-4082-b82b-52de2543b9b2'),('bd0bd77a-3a17-4262-8f22-9cc34e0125b0','3d6d5269-70c5-4c8d-9a05-542c7768922d','09a40291-4b1f-4285-affd-975e41d87ecf'),('bd1d0e78-c00b-4171-8bc8-8c94cfb4ca62','d49533b8-1d5a-402b-a65a-241eb714d1ce','7891d295-90fe-4cd0-a9e9-d787812fe0b0'),('bd1df6a2-a30b-40fb-a6f8-eceecf81b7a7','d49533b8-1d5a-402b-a65a-241eb714d1ce','62406e88-f768-4c73-9317-cdd66ca0314f'),('bd6202c8-02be-4d67-934e-cd6eca5bcb5d','08b9074e-1197-4dd3-b346-5dd8ee5db246','11e986d9-1bb3-40c4-9454-c525ed342edf'),('bd737f18-bebd-4121-afd5-a52eceab8bd4','08b9074e-1197-4dd3-b346-5dd8ee5db246','MarketingCampaignBudgetV'),('be27659b-ce74-4446-bcce-aa343e881fcb','08b9074e-1197-4dd3-b346-5dd8ee5db246','4b0eb421-baac-4cc7-8bf0-215632572786'),('be38e938-ee8b-48eb-b411-cdc8a4a39d51','08b9074e-1197-4dd3-b346-5dd8ee5db246','c9c2c598-5e56-480f-a74f-09850eda67ad'),('be44e514-9667-4917-9936-50062d26ee47','08b9074e-1197-4dd3-b346-5dd8ee5db246','295be7ad-b55b-4e7e-9547-96c5bc2772dc'),('bf62604c-f912-4b1b-b2e1-c00b611560b9','778c38d0-e5de-4737-bad4-7a3d89078266','2be30692-6c39-4946-87b2-2656695b669e'),('c07c704a-ed40-4dc9-b4d6-8415b3f32d58','08b9074e-1197-4dd3-b346-5dd8ee5db246','1eb6382a-b87a-4f63-9581-5c03871702a6'),('c0b67c72-4039-45f8-97df-50f0f20715bb','d49533b8-1d5a-402b-a65a-241eb714d1ce','d74cbe57-55ef-4bad-8dc7-ed717af303f8'),('c0c40ff2-75f6-47d2-8a94-0902958dd3e9','d49533b8-1d5a-402b-a65a-241eb714d1ce','0a30d204-2672-4ce2-bf0e-0c8d694a6ff7'),('c0cfdfdf-4337-432a-bdba-78319fcb5ab8','08b9074e-1197-4dd3-b346-5dd8ee5db246','b34dedaf-ce96-4330-af5c-61cb04be7e40'),('c10e55a6-bb1d-4a1e-a0cb-8d09e85208a7','3d6d5269-70c5-4c8d-9a05-542c7768922d','MarketingCampaignBudgetV'),('c1ed09c6-c51b-4d56-9bd8-32ae00d70ed2','d49533b8-1d5a-402b-a65a-241eb714d1ce','1d42565c-86e1-4d58-ac2b-3c78ca8f8387'),('c214d664-0be7-4bee-b41b-50e58be6a133','08b9074e-1197-4dd3-b346-5dd8ee5db246','895eaefe-49a6-4e88-9efd-7a574e441dd6'),('c25fc13c-991a-45be-84e8-15775b51b07d','3ac1b691-1154-460f-9c17-33ba2e46ef23','5DF10A76-F9B8-4D83-82BF-9F990CDDF97A'),('c27d4f1b-fadd-4bde-bf04-32be4756ffc2','08b9074e-1197-4dd3-b346-5dd8ee5db246','244162c1-741f-4b49-9716-6e56da0ecf42'),('c280efef-421b-4eb2-ae60-6075b74e5837','d49533b8-1d5a-402b-a65a-241eb714d1ce','385d71a3-9c45-4661-a533-209e76b19eeb'),('c2af4cd8-1292-48d7-9b88-346472ba8f4d','3ac1b691-1154-460f-9c17-33ba2e46ef23','7b3e5659-0c02-4beb-9331-3dc56d72a993'),('c2bac2b9-a95a-4ea6-a155-e69526f15aa7','d49533b8-1d5a-402b-a65a-241eb714d1ce','69e90d20-709e-490a-b9f5-6989d05929c6'),('c2f1dd80-e7ef-4f59-8a2d-e32b72e8e9c7','d49533b8-1d5a-402b-a65a-241eb714d1ce','70648537-6320-4f68-aca4-17eb272cd475'),('c3401c3f-1a3b-4a4f-9748-fbaac987616d','d49533b8-1d5a-402b-a65a-241eb714d1ce','7c1b73c1-e0eb-4191-9f2d-8d8a336c8c89'),('c4aa4eb7-7c54-46f2-ad2f-07214c6098e5','d49533b8-1d5a-402b-a65a-241eb714d1ce','5DF10A76-F9B8-4D83-82BF-9F990CDDF97A'),('c4b26c49-932e-4ecd-9263-8793dfdc492e','08b9074e-1197-4dd3-b346-5dd8ee5db246','08b96ea2-268c-4317-b253-1c6721d71a65'),('c4d3318e-f551-420f-8e64-f0f1b4b68089','d49533b8-1d5a-402b-a65a-241eb714d1ce','158aa72f-f984-4733-9bee-1cabfd000459'),('c5621e8f-32af-4a71-b83f-21efcae122b0','08b9074e-1197-4dd3-b346-5dd8ee5db246','200ab5fa-b77b-4d1a-bf8e-a4519994b011'),('c7634ae1-21e1-4e70-8583-1acb634ef865','08b9074e-1197-4dd3-b346-5dd8ee5db246','b21946a4-7863-4908-94e3-414a353fdae9'),('c79cbee9-c1eb-4709-8ac5-8f0548202d1f','08b9074e-1197-4dd3-b346-5dd8ee5db246','3ac9c356-33d5-4496-86b5-ddc791c888ff'),('c7e4dd5f-f196-4911-a266-507dd2fc4357','08b9074e-1197-4dd3-b346-5dd8ee5db246','74cb8f86-2c9c-4443-8fdd-a85829d41628'),('c8888512-d192-4a55-81e4-e0a2bcdec2d8','08b9074e-1197-4dd3-b346-5dd8ee5db246','65df3b4a-1c0b-43c5-bf77-6a684ae07c5d'),('c8c74b90-7f26-473f-b39a-c35ad57b7ead','d49533b8-1d5a-402b-a65a-241eb714d1ce','65df3b4a-1c0b-43c5-bf77-6a684ae07c5d'),('c9614c4f-01ac-4364-abab-e4c608922087','d49533b8-1d5a-402b-a65a-241eb714d1ce','ad9e25bd-6098-4f72-a22f-ca941c7f31b1'),('c977260c-d1e8-4a72-a081-d59f658346a4','d49533b8-1d5a-402b-a65a-241eb714d1ce','8720ae8a-f6a4-48cf-b1a8-ef553f3d8e8f'),('c996d009-9028-476f-85b6-54cf131bb9cd','d49533b8-1d5a-402b-a65a-241eb714d1ce','9afae00a-a833-4aa7-b0a2-23d0019eee80'),('ca7c30e3-30c0-4e76-ae19-895a8d7e716d','3d6d5269-70c5-4c8d-9a05-542c7768922d','MarketingProCampExpenseV'),('ca9e98a9-943b-4030-8786-a9fcb4b0c5f7','778c38d0-e5de-4737-bad4-7a3d89078266','6b885df8-6dce-454a-9715-7e964baf8aca'),('cb7f50b5-b448-4870-a58d-ba8594e37fdb','d49533b8-1d5a-402b-a65a-241eb714d1ce','94a908e8-8cd4-4da1-a583-699565382adf'),('cbe1a62a-3ba0-4345-8cbe-f8a318a840bf','08b9074e-1197-4dd3-b346-5dd8ee5db246','4c83df9a-3c8a-4732-8124-5dca1d83347f'),('cc347bb4-1197-4556-826d-53084fa6e264','778c38d0-e5de-4737-bad4-7a3d89078266','0a30d204-2672-4ce2-bf0e-0c8d694a6ff7'),('cc4a5660-ada7-46b0-9103-f381cbb43f6b','08b9074e-1197-4dd3-b346-5dd8ee5db246','dc82b805-4f00-4828-a7ad-ec1ee002008d'),('cc559260-555d-4fee-8f61-aef63ac944fc','d49533b8-1d5a-402b-a65a-241eb714d1ce','725200CA-3568-46E1-AEC3-F1FAEAC12078'),('cc55f841-22f3-4698-a1e1-4f212efc4003','08b9074e-1197-4dd3-b346-5dd8ee5db246','99dc6f36-30d3-4d92-912c-6963513a3f6e'),('cc72a673-86e1-44c6-8471-ef3def65aa70','3d6d5269-70c5-4c8d-9a05-542c7768922d','7891d295-90fe-4cd0-a9e9-d787812fe0b0'),('cc963d4b-8f50-4f15-b051-05049e827283','08b9074e-1197-4dd3-b346-5dd8ee5db246','28f9b560-0842-47da-bec9-e83abb0d4931'),('ce4cb549-c123-4fa9-aa93-027f4ba60b18','08b9074e-1197-4dd3-b346-5dd8ee5db246','649a67bb-3c11-472b-9230-af199942aae6'),('ce84de49-17c5-4971-9be5-67a9ad309f9e','08b9074e-1197-4dd3-b346-5dd8ee5db246','ae1872dd-f367-45da-8325-d3a18a0dd469'),('cf0691ad-4ece-45b4-9cd9-e0ea80ffae94','d49533b8-1d5a-402b-a65a-241eb714d1ce','8198ce54-9e8e-4c51-99d7-06bd359503bd'),('cf2e7d4b-82d7-4481-a06d-2d3639da6ffb','08b9074e-1197-4dd3-b346-5dd8ee5db246','bee19bb8-cfe1-40bd-b4db-3b41964ee77e'),('cf52c8a0-187a-4b4f-a0d6-30c2d44e3f88','d49533b8-1d5a-402b-a65a-241eb714d1ce','8dafed22-c9c1-4c2d-8d52-42642510cdc8'),('cf8fbe1d-6469-4351-98dd-06b2de5007ac','778c38d0-e5de-4737-bad4-7a3d89078266','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('d0b4b2f9-3209-4662-99cf-6cf73764c751','08b9074e-1197-4dd3-b346-5dd8ee5db246','c4020c06-deca-46a7-ab17-b75140301992'),('d0ea8df1-8086-4cfa-894c-2c2bba801a24','3d6d5269-70c5-4c8d-9a05-542c7768922d','250a34a6-b26f-4c47-82c6-52432003366a'),('d11c8bc9-60ec-4d1c-9eff-c427c2587449','08b9074e-1197-4dd3-b346-5dd8ee5db246','158aa72f-f984-4733-9bee-1cabfd000459'),('d196bb17-307f-435d-9ce3-306165c2d8ad','94049b4e-4f4a-46dc-9ac7-9444ca1826a5','1f1bd791-a643-47ee-b780-62c85fa3ce5d'),('d1f6d253-5e7e-49e3-94ab-1ace004979d3','3d6d5269-70c5-4c8d-9a05-542c7768922d','21512b72-a2b2-4a6c-a5b8-1010d37cf03c'),('d25f55e2-6c87-4e43-b5cf-0f06d5fdac2e','778c38d0-e5de-4737-bad4-7a3d89078266','659bdc4a-dba7-4c81-9af5-9665f7bc185c'),('d2c5ea15-5854-49e1-a4c7-0646bed9ca0b','d49533b8-1d5a-402b-a65a-241eb714d1ce','60f2281e-fd68-4eea-b0a5-825a97fad12c'),('d30f49b6-2db1-4cd5-b715-4d924c20ec6a','d49533b8-1d5a-402b-a65a-241eb714d1ce','03d385f6-83db-43ee-bafb-eb444a1c27ea'),('d354621b-e7b0-4af2-aabe-ab57f277131a','08b9074e-1197-4dd3-b346-5dd8ee5db246','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('d5281b9e-5ae7-4bc7-bbd8-792ae469b8e9','d49533b8-1d5a-402b-a65a-241eb714d1ce','5522470D-F399-4F99-A9CF-5594C4709109'),('d55b2af9-6991-465a-9e6a-59a2f57d2e88','08b9074e-1197-4dd3-b346-5dd8ee5db246','8720ae8a-f6a4-48cf-b1a8-ef553f3d8e8f'),('d577d755-8420-4c2a-8e9f-dbe59dacc18f','d49533b8-1d5a-402b-a65a-241eb714d1ce','6f817794-dd38-4c77-bf18-78777a53a4ad'),('d646696d-c57a-481d-8b10-9f43e2491527','d49533b8-1d5a-402b-a65a-241eb714d1ce','43be26fc-36ac-49cb-8ef9-2a92762ffe82'),('d781750b-92e2-457c-8cea-5753abae0829','3ac1b691-1154-460f-9c17-33ba2e46ef23','DB3D26CC-94B8-4EF0-8200-A0A8BB2F510F'),('d86be040-7420-4960-bf6d-d5d9f77f323e','08b9074e-1197-4dd3-b346-5dd8ee5db246','6b885df8-6dce-454a-9715-7e964baf8aca'),('d88f995d-6b41-4f20-b793-012b962c3550','08b9074e-1197-4dd3-b346-5dd8ee5db246','a554c5aa-15b8-44f2-a4d1-41869ed8297f'),('d95fa686-8b5c-465e-9e5b-a856cfa434a0','3d6d5269-70c5-4c8d-9a05-542c7768922d','659bdc4a-dba7-4c81-9af5-9665f7bc185c'),('d9ffbec1-4070-4bfe-933e-600ec617d506','d49533b8-1d5a-402b-a65a-241eb714d1ce','a52c9d6c-583e-48bb-bba4-ce0615d86c99'),('dad419fb-7b68-439e-9f15-77f97b797a99','778c38d0-e5de-4737-bad4-7a3d89078266','16758145-4ef9-42e2-bf6c-77af7b32da5f'),('db7bcefc-d521-468a-af60-48d8508c49ed','3d6d5269-70c5-4c8d-9a05-542c7768922d','d401fb03-a85f-4bba-aa77-4203c25d9443'),('dbf3d3ac-cdc4-41df-a848-851763a7af62','08b9074e-1197-4dd3-b346-5dd8ee5db246','8f3b741c-5adc-452b-bd59-655163ed8bb5'),('dc36318b-c2af-43fc-aaa6-9c365291360b','d49533b8-1d5a-402b-a65a-241eb714d1ce','d84dd02a-5528-4ba9-a464-2e59d321bc6a'),('de01ad7b-7545-4074-9184-5d615e339a61','3d6d5269-70c5-4c8d-9a05-542c7768922d','09DF3A65-7667-41C9-93ED-22B771040C01'),('de5a3f64-14d4-4bf4-831a-721fea314016','d49533b8-1d5a-402b-a65a-241eb714d1ce','245b9ebd-8377-453d-9c2d-309b3f42e811'),('de65bb87-be7c-49ef-afb7-68fda1650749','08b9074e-1197-4dd3-b346-5dd8ee5db246','7891d295-90fe-4cd0-a9e9-d787812fe0b0'),('de71ba25-a3f9-44d6-9231-a45b066fd0d8','d49533b8-1d5a-402b-a65a-241eb714d1ce','55c478eb-8579-4cbe-bd37-01969733a188'),('dede33df-c51c-45fe-b4ff-33a99a4f05e3','778c38d0-e5de-4737-bad4-7a3d89078266','c9eef404-909c-466b-acb7-df1337365684'),('df3b3929-4211-413e-b4bf-1c5a8771e08b','3d6d5269-70c5-4c8d-9a05-542c7768922d','MarketingProCampV'),('dfc740ea-11e4-43bb-a312-d5b4db85197c','d49533b8-1d5a-402b-a65a-241eb714d1ce','08b96ea2-268c-4317-b253-1c6721d71a65'),('e03e9368-8192-4c81-8f44-02239fb53741','08b9074e-1197-4dd3-b346-5dd8ee5db246','7515b817-ea7b-4637-89f2-58517a51880b'),('e0610ba5-21c4-4f2b-95f1-62569116beca','d49533b8-1d5a-402b-a65a-241eb714d1ce','dc82b805-4f00-4828-a7ad-ec1ee002008d'),('e1300a5b-3891-4e5c-a6d8-db0043528ebc','3d6d5269-70c5-4c8d-9a05-542c7768922d','MarketingCampaignExpenseV'),('e29f5d34-8ac5-49ac-9d38-7cad447473ab','08b9074e-1197-4dd3-b346-5dd8ee5db246','064d4ea6-cdad-409a-8ae4-f28369e372c1'),('e32cda86-9403-446f-b593-216302404cdc','d49533b8-1d5a-402b-a65a-241eb714d1ce','16758145-4ef9-42e2-bf6c-77af7b32da5f'),('e449f171-1fed-47d1-aee8-d81854b484a8','d49533b8-1d5a-402b-a65a-241eb714d1ce','064d4ea6-cdad-409a-8ae4-f28369e372c1'),('e4d542bd-be93-48e5-878d-779e0e9df9a4','778c38d0-e5de-4737-bad4-7a3d89078266','MarketingCampaignBudgetV'),('e5265e8e-16ae-430e-8dfb-fcf5184302f4','08b9074e-1197-4dd3-b346-5dd8ee5db246','659bdc4a-dba7-4c81-9af5-9665f7bc185c'),('e52b388d-775b-490a-935d-b107d4f5fa38','08b9074e-1197-4dd3-b346-5dd8ee5db246','7b23d169-3830-482d-ae19-7352cd33381b'),('e5642cd9-f14f-4e25-bb4f-114caadb1106','08b9074e-1197-4dd3-b346-5dd8ee5db246','76d58e9e-38fe-455f-9aad-0e87648bb55a'),('e5d297e8-d82c-47a2-8aeb-599da096e2e6','3d6d5269-70c5-4c8d-9a05-542c7768922d','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('e64b70b5-9483-4f82-bb2b-73198186755f','3ac1b691-1154-460f-9c17-33ba2e46ef23','605b8714-1134-485c-96f2-f21ccfb35462'),('e780c738-b804-422a-9f23-725148b14e1b','d49533b8-1d5a-402b-a65a-241eb714d1ce','0757ca6f-8ae7-48df-9974-f5b82c8e48b8'),('e7ec3295-0f48-4d18-9b2e-bcd0814f8eea','d49533b8-1d5a-402b-a65a-241eb714d1ce','678d29fb-1f28-490c-ae11-948ca4c54c92'),('e8943488-94c5-4fd0-ba6c-cb509c51d88d','08b9074e-1197-4dd3-b346-5dd8ee5db246','667d8927-35b5-4f8b-90a3-7411e9d6d7c3'),('e90d7bb0-880f-4590-b150-0d76b22a2905','778c38d0-e5de-4737-bad4-7a3d89078266','725200CA-3568-46E1-AEC3-F1FAEAC12078'),('eb0be3f6-1a1c-400b-baee-ca39257585a2','08b9074e-1197-4dd3-b346-5dd8ee5db246','94a908e8-8cd4-4da1-a583-699565382adf'),('eb631ca7-8a35-408d-a0ba-658de6498b00','ebdb7820-c67f-4298-a7c5-3b9bc65a4ef7','d84dd02a-5528-4ba9-a464-2e59d321bc6a'),('eb684593-2665-4526-9484-14b2c79b973d','08b9074e-1197-4dd3-b346-5dd8ee5db246','36118531-1895-4c4a-82ee-6a69e525a0b6'),('ec2751d4-3ca0-4daf-acb6-a9339cd1c5c6','08b9074e-1197-4dd3-b346-5dd8ee5db246','34a91780-0109-46a5-b9b7-e58700097cfe'),('ecf3215e-3516-4676-afa9-4325400ec186','778c38d0-e5de-4737-bad4-7a3d89078266','e7757e42-7305-4509-91dd-40d50799c764'),('ef95ecb0-c8b3-4d31-9f31-978650fdbd7a','08b9074e-1197-4dd3-b346-5dd8ee5db246','d863902d-117a-40fa-8aee-52ffad515fe2'),('ef9cb552-2778-4329-82e0-d5425e4fec6c','778c38d0-e5de-4737-bad4-7a3d89078266','92cfd846-18c2-4b79-a793-8c0fe0fdf245'),('f06aa307-aa86-494a-af48-3b52ed5c5549','3ac1b691-1154-460f-9c17-33ba2e46ef23','0a30d204-2672-4ce2-bf0e-0c8d694a6ff7'),('f08d18a3-fdc7-4040-8b32-2c45dcad6eca','08b9074e-1197-4dd3-b346-5dd8ee5db246','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('f0a297bc-5145-441e-8a67-7a05a635640c','08b9074e-1197-4dd3-b346-5dd8ee5db246','57ed3ef8-ea6e-48f5-89fe-b4eedade2be5'),('f0de3ca2-2929-4686-9dd3-814e7b7d6877','08b9074e-1197-4dd3-b346-5dd8ee5db246','381b8daf-542b-4c53-bd83-6deda9a2ef09'),('f187254f-14ca-47c2-ac68-b4340a2392e8','d49533b8-1d5a-402b-a65a-241eb714d1ce','5892f3c1-094a-4d1f-8887-0358e16cfa5a'),('f1f59974-03bc-402d-a446-100866ba0ea8','3d6d5269-70c5-4c8d-9a05-542c7768922d','MarketingProgramV'),('f214abe4-161b-4935-875b-373afe399baf','d49533b8-1d5a-402b-a65a-241eb714d1ce','136bfa04-7b65-45ee-8dcd-e7bb31325653'),('f21a0efc-ba58-4680-bf16-4146e0f6eb13','d49533b8-1d5a-402b-a65a-241eb714d1ce','4c83df9a-3c8a-4732-8124-5dca1d83347f'),('f26aa369-314b-406a-a57d-ade438393879','d49533b8-1d5a-402b-a65a-241eb714d1ce','1b446d62-4b96-4432-bb6c-ca8a6289fb2d'),('f360e260-0999-4c8a-aec1-a95fd3d951ac','08b9074e-1197-4dd3-b346-5dd8ee5db246','7e0dc766-338c-43e5-80ff-eefcd8b6d4cb'),('f3a4103a-45c8-4adf-aeb9-460c48610441','d49533b8-1d5a-402b-a65a-241eb714d1ce','8852fb1d-8c4b-4973-8f9b-cdd203f0fd88'),('f4523c6d-7124-4503-bf50-4a5d1774a6cb','08b9074e-1197-4dd3-b346-5dd8ee5db246','111c5844-b5ca-48ae-9ad7-57e531639007'),('f4b51dbc-0d83-4919-89c0-586753d80ba4','08b9074e-1197-4dd3-b346-5dd8ee5db246','ef4ace39-fcf4-4ccc-a096-f4f384ea5ccf'),('f5396a6b-c3db-4a47-b40d-a1b07daee481','08b9074e-1197-4dd3-b346-5dd8ee5db246','1f1bd791-a643-47ee-b780-62c85fa3ce5d'),('f5969e66-7154-471f-853d-d5fdde66e076','3d6d5269-70c5-4c8d-9a05-542c7768922d','882C9D5A-EBDD-4A44-BC3F-BF84E3A8F683'),('f6088d42-4260-415d-8f49-f3346234e7c8','d49533b8-1d5a-402b-a65a-241eb714d1ce','74cb8f86-2c9c-4443-8fdd-a85829d41628'),('f68b1a6b-a870-43ad-a72b-d7d75a9ec614','d49533b8-1d5a-402b-a65a-241eb714d1ce','61020fe5-21a3-4e5d-aed5-d8d7ce094bdb'),('f743e316-7a88-4c79-9529-f4784a832469','d49533b8-1d5a-402b-a65a-241eb714d1ce','MarketingCampaignBudgetV'),('f76e7b0f-94ab-47f3-9d8e-2ac15ef913de','d49533b8-1d5a-402b-a65a-241eb714d1ce','8acfff0d-b2ca-4950-8930-6c09de81c359'),('f8710b90-ec07-44d8-be7f-47f12138b450','08b9074e-1197-4dd3-b346-5dd8ee5db246','c68bf138-be40-4adf-ab3b-d15f7d271963'),('f88be75d-8316-4a17-bca6-8fbd67e35e88','61f956bf-b504-4ce8-bc55-6db242c2efcc','16758145-4ef9-42e2-bf6c-77af7b32da5f'),('f8a7ac62-b7af-4a10-8eb9-02c80e75ebcc','08b9074e-1197-4dd3-b346-5dd8ee5db246','dc4c353c-2a92-4849-b424-23e3aaae0f91'),('f8c84184-7a00-407e-8326-9ad0e886fa5a','d49533b8-1d5a-402b-a65a-241eb714d1ce','c4020c06-deca-46a7-ab17-b75140301992'),('f91b3491-62cb-4b3b-a11a-4ac75fffc8f4','d49533b8-1d5a-402b-a65a-241eb714d1ce','92a914b3-e8ad-4385-ab2b-2a142e9720b7'),('f9237726-840f-483f-ad77-e27fb00bf1b4','08b9074e-1197-4dd3-b346-5dd8ee5db246','a4ed2c8c-e4ea-428e-8228-c02268afc0e0'),('f93f05c4-186e-491e-982d-f0a5b3c5a96e','d49533b8-1d5a-402b-a65a-241eb714d1ce','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('f97e33a0-02ab-450f-b264-69a7eac9e930','d49533b8-1d5a-402b-a65a-241eb714d1ce','7606d652-3281-4bb8-8465-1f2d62690c28'),('f99364c5-9db4-4d5e-ad66-3b2ae189f967','778c38d0-e5de-4737-bad4-7a3d89078266','5522470D-F399-4F99-A9CF-5594C4709109'),('f9c7d66c-2a25-4e1c-b95c-05855e8bae74','3d6d5269-70c5-4c8d-9a05-542c7768922d','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('fa016a5d-4c7f-4198-ba26-b2d0017a4f71','08b9074e-1197-4dd3-b346-5dd8ee5db246','47af3b22-a407-4b11-9a74-1b8cbb235882'),('fa2bc14e-b4cc-4e1c-9e31-74eb72c3418e','08b9074e-1197-4dd3-b346-5dd8ee5db246','b6766b2f-a30e-45ab-b46e-bd14bb07c1d1'),('fac8fdcc-2cb6-44b5-a416-3f64bb021dac','08b9074e-1197-4dd3-b346-5dd8ee5db246','92cfd846-18c2-4b79-a793-8c0fe0fdf245'),('fb134852-83a5-4d9b-a130-e78bdc639957','d49533b8-1d5a-402b-a65a-241eb714d1ce','347c3e86-18dc-4c1e-ab14-3977ce6adc82'),('fc3a92d2-2254-4517-b139-a02f1b190793','d49533b8-1d5a-402b-a65a-241eb714d1ce','eeb67d9c-df1d-4d00-9d7e-5239aecad36d'),('fc9e2ab4-1b8d-4da1-b240-8b4a15391474','3ac1b691-1154-460f-9c17-33ba2e46ef23','ef4ace39-fcf4-4ccc-a096-f4f384ea5ccf'),('fd1380ea-6d9b-49af-b63c-4f75a24b3bf4','d49533b8-1d5a-402b-a65a-241eb714d1ce','ea09cbb1-a2f2-41cf-91dd-6b4b7f7e0c97'),('fd31cb51-90c8-451b-991a-e94c7ad74ba3','08b9074e-1197-4dd3-b346-5dd8ee5db246','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('fd3473ea-1705-44bf-8a08-d0dd7637d237','3d6d5269-70c5-4c8d-9a05-542c7768922d','9afae00a-a833-4aa7-b0a2-23d0019eee80'),('fdf519ec-11c8-44a4-99d7-63ff241b1dea','3d6d5269-70c5-4c8d-9a05-542c7768922d','0757ca6f-8ae7-48df-9974-f5b82c8e48b8'),('fe18fb48-5de2-4632-a2d4-94273374dce3','3ac1b691-1154-460f-9c17-33ba2e46ef23','06e590ca-7050-4043-a2f5-ba4537a6cb7b'),('fe55aabd-cc30-4735-ab4d-9ae4fd734ec5','08b9074e-1197-4dd3-b346-5dd8ee5db246','5DF10A76-F9B8-4D83-82BF-9F990CDDF97A'),('fe73184e-a242-4db4-ba0b-4be2ab348fdd','d49533b8-1d5a-402b-a65a-241eb714d1ce','484012fd-69df-4c9a-b7f5-57a7bb7d0997'),('fe999597-0986-482f-aa95-b1d88e2a0a62','d49533b8-1d5a-402b-a65a-241eb714d1ce','8f2453e8-c0fd-4693-86c5-341784f1c747'),('ffaceaaf-6c23-4552-bc34-a9516288970f','08b9074e-1197-4dd3-b346-5dd8ee5db246','eeb67d9c-df1d-4d00-9d7e-5239aecad36d'),('wsAdministration-Application3','61f956bf-b504-4ce8-bc55-6db242c2efcc','678d29fb-1f28-490c-ae11-948ca4c54c92'),('wsAdministration-Application4','61f956bf-b504-4ce8-bc55-6db242c2efcc','a7214d55-5624-4228-944f-608b18660082'),('wsAdministration-Auth1','d4a5dce2-6df8-47c5-8004-e70cba815af1','13f35ae2-ff33-4236-b4a1-e441a791428a'),('wsAdministration-Auth10','d4a5dce2-6df8-47c5-8004-e70cba815af1','b34dedaf-ce96-4330-af5c-61cb04be7e40'),('wsAdministration-Auth11','d4a5dce2-6df8-47c5-8004-e70cba815af1','bd7a182f-1cb0-4369-bd58-c427081adb3f'),('wsAdministration-Auth12','d4a5dce2-6df8-47c5-8004-e70cba815af1','dc82b805-4f00-4828-a7ad-ec1ee002008d'),('wsAdministration-Auth13','d4a5dce2-6df8-47c5-8004-e70cba815af1','e6067692-8a3b-47e1-84a0-002a19ca5155'),('wsAdministration-Auth14','d4a5dce2-6df8-47c5-8004-e70cba815af1','f64c8ba6-f4ac-4987-98b8-cd8adaf624f7'),('wsAdministration-Auth2','d4a5dce2-6df8-47c5-8004-e70cba815af1','2be30692-6c39-4946-87b2-2656695b669e'),('wsAdministration-Auth3','d4a5dce2-6df8-47c5-8004-e70cba815af1','385d71a3-9c45-4661-a533-209e76b19eeb'),('wsAdministration-Auth4','d4a5dce2-6df8-47c5-8004-e70cba815af1','3ac9c356-33d5-4496-86b5-ddc791c888ff'),('wsAdministration-Auth5','d4a5dce2-6df8-47c5-8004-e70cba815af1','47af3b22-a407-4b11-9a74-1b8cbb235882'),('wsAdministration-Auth6','d4a5dce2-6df8-47c5-8004-e70cba815af1','4a19ecbe-51a3-4e44-9ad6-acc627ca532a'),('wsAdministration-Auth7','d4a5dce2-6df8-47c5-8004-e70cba815af1','58eee1b8-30e6-453c-8c23-5aeb95c03d65'),('wsAdministration-Auth8','d4a5dce2-6df8-47c5-8004-e70cba815af1','8acfff0d-b2ca-4950-8930-6c09de81c359'),('wsAdministration-Auth9','d4a5dce2-6df8-47c5-8004-e70cba815af1','8dafed22-c9c1-4c2d-8d52-42642510cdc8'),('wsCampaignAnalytics1','caf93aa4-de65-453e-be16-c0cef90ee421','0a78d008-87ae-4a5c-985c-4ddc72026fbc'),('wsCampaignAnalytics2','caf93aa4-de65-453e-be16-c0cef90ee421','21512b72-a2b2-4a6c-a5b8-1010d37cf03c'),('wsCampaignAnalytics3','caf93aa4-de65-453e-be16-c0cef90ee421','605b8714-1134-485c-96f2-f21ccfb35462'),('wsCampaignAnalytics4','caf93aa4-de65-453e-be16-c0cef90ee421','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('wsCampaignAnalytics5','caf93aa4-de65-453e-be16-c0cef90ee421','9eb7df35-51ba-454e-b1a2-253ff053a439'),('wsCustomer1','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414','5a01b632-9a00-44f2-bb73-cd07e5a407ea'),('wsCustomer2','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414','62406e88-f768-4c73-9317-cdd66ca0314f'),('wsCustomer3','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414','6b5bdebe-66f1-452b-a74f-1fbd014286b9'),('wsCustomer4','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414','b6766b2f-a30e-45ab-b46e-bd14bb07c1d1'),('wsCustomer5','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414','c9eef404-909c-466b-acb7-df1337365684'),('wsDataManagement1','44daa961-ff04-4f9f-be57-4395508d1fdb','09DF3A65-7667-41C9-93ED-22B771040C01'),('wsDataManagement2','44daa961-ff04-4f9f-be57-4395508d1fdb','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('wsDataManagement3','44daa961-ff04-4f9f-be57-4395508d1fdb','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('wsDataManagement4','44daa961-ff04-4f9f-be57-4395508d1fdb','5DF10A76-F9B8-4D83-82BF-9F990CDDF97A'),('wsDataManagement5','44daa961-ff04-4f9f-be57-4395508d1fdb','70648537-6320-4f68-aca4-17eb272cd475'),('wsDataManagement6','44daa961-ff04-4f9f-be57-4395508d1fdb','92cfd846-18c2-4b79-a793-8c0fe0fdf245'),('wsDQM1','9998e975-7961-4dee-8f85-e9f57eee4e03','595049d9-cda1-4e2f-bb18-873088326a21'),('wsDQM2','9998e975-7961-4dee-8f85-e9f57eee4e03','6da5d270-9adc-49ee-a999-6ab4c350c977'),('wsDQM3','9998e975-7961-4dee-8f85-e9f57eee4e03','8381d387-5308-4a7a-a16a-6b8f9bb92f4f'),('wsDQM4','9998e975-7961-4dee-8f85-e9f57eee4e03','8f3b741c-5adc-452b-bd59-655163ed8bb5'),('wsDQM5','9998e975-7961-4dee-8f85-e9f57eee4e03','fd1baffd-dd6a-41ec-9b75-57794e7ef1d0'),('wsEmployee1','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5','d84dd02a-5528-4ba9-a464-2e59d321bc6a'),('wsLoyaltyProgram1','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','03d385f6-83db-43ee-bafb-eb444a1c27ea'),('wsLoyaltyProgram10','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','92a914b3-e8ad-4385-ab2b-2a142e9720b7'),('wsLoyaltyProgram11','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','99dc6f36-30d3-4d92-912c-6963513a3f6e'),('wsLoyaltyProgram12','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','b21946a4-7863-4908-94e3-414a353fdae9'),('wsLoyaltyProgram13','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','eeb67d9c-df1d-4d00-9d7e-5239aecad36d'),('wsLoyaltyProgram2','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','064d4ea6-cdad-409a-8ae4-f28369e372c1'),('wsLoyaltyProgram3','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','1b446d62-4b96-4432-bb6c-ca8a6289fb2d'),('wsLoyaltyProgram4','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','1d42565c-86e1-4d58-ac2b-3c78ca8f8387'),('wsLoyaltyProgram5','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','3ada0c49-09fd-4b6f-a8d3-c5024dfd0182'),('wsLoyaltyProgram6','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','40840e39-679e-4b7e-9019-c99ab58c04e4'),('wsLoyaltyProgram7','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','60f2281e-fd68-4eea-b0a5-825a97fad12c'),('wsLoyaltyProgram8','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','7c57116e-ef11-421f-8bc6-9feb45773939'),('wsLoyaltyProgram9','13ca2aa5-138d-4abd-9d7a-1f2287e8f021','9097d299-cb10-43b3-8b44-fd20605f15ac'),('wsLoyTransaction1','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c','55c478eb-8579-4cbe-bd37-01969733a188'),('wsLoyTransaction2','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c','74cb8f86-2c9c-4443-8fdd-a85829d41628'),('wsLoyTransaction3','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c','e5c11162-96b0-4b42-ab47-598d9fdd89ba'),('wsMarkeingCalendar1','100a17da-6ea9-4c35-9f2b-159efb994713','0757ca6f-8ae7-48df-9974-f5b82c8e48b8'),('wsMarketingCampaign1','20461de0-64b2-4ebd-8ca3-71c08d058fc7','6b885df8-6dce-454a-9715-7e964baf8aca'),('wsMarketingCampaign2','20461de0-64b2-4ebd-8ca3-71c08d058fc7','7891d295-90fe-4cd0-a9e9-d787812fe0b0'),('wsMarketingCampaign3','20461de0-64b2-4ebd-8ca3-71c08d058fc7','8198ce54-9e8e-4c51-99d7-06bd359503bd'),('wsMarketingCampaign4','20461de0-64b2-4ebd-8ca3-71c08d058fc7','MarketingCampaignBudgetV'),('wsMarketingCampaign5','20461de0-64b2-4ebd-8ca3-71c08d058fc7','MarketingCampaignExpenseV'),('wsMarketingCampaign6','20461de0-64b2-4ebd-8ca3-71c08d058fc7','MarketingCampaignV'),('wsMarketingResponse1','fc3727ea-112c-4341-9589-f88b9321c227','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('wsMember1','b7a69208-8267-44f7-b843-ff51b2482d07','06e590ca-7050-4043-a2f5-ba4537a6cb7b'),('wsMember10','b7a69208-8267-44f7-b843-ff51b2482d07','94a908e8-8cd4-4da1-a583-699565382adf'),('wsMember11','b7a69208-8267-44f7-b843-ff51b2482d07','a9988637-e407-47fc-82e4-fd2ef80de32c'),('wsMember12','b7a69208-8267-44f7-b843-ff51b2482d07','ad9e25bd-6098-4f72-a22f-ca941c7f31b1'),('wsMember13','b7a69208-8267-44f7-b843-ff51b2482d07','b9dc8e12-14c5-479d-a2dd-44238a45d484'),('wsMember14','b7a69208-8267-44f7-b843-ff51b2482d07','c4020c06-deca-46a7-ab17-b75140301992'),('wsMember2','b7a69208-8267-44f7-b843-ff51b2482d07','0c60e3e2-dc69-4a80-9751-96ca56531fd1'),('wsMember3','b7a69208-8267-44f7-b843-ff51b2482d07','295be7ad-b55b-4e7e-9547-96c5bc2772dc'),('wsMember4','b7a69208-8267-44f7-b843-ff51b2482d07','36118531-1895-4c4a-82ee-6a69e525a0b6'),('wsMember5','b7a69208-8267-44f7-b843-ff51b2482d07','667d8927-35b5-4f8b-90a3-7411e9d6d7c3'),('wsMember6','b7a69208-8267-44f7-b843-ff51b2482d07','69e90d20-709e-490a-b9f5-6989d05929c6'),('wsMember7','b7a69208-8267-44f7-b843-ff51b2482d07','83a62ed2-b19a-4b7f-877a-bb1e52f40534'),('wsMember8','b7a69208-8267-44f7-b843-ff51b2482d07','895eaefe-49a6-4e88-9efd-7a574e441dd6'),('wsMember9','b7a69208-8267-44f7-b843-ff51b2482d07','8f03de80-fbf2-4b62-a271-b1790c013863'),('wsOrder1','e8f75eb5-cbd1-467a-aebf-6f4df670093d','518395c8-a0c0-4338-9042-066141bfc558'),('wsOrder2','e8f75eb5-cbd1-467a-aebf-6f4df670093d','7b3e5659-0c02-4beb-9331-3dc56d72a993'),('wsOrder3','e8f75eb5-cbd1-467a-aebf-6f4df670093d','9afae00a-a833-4aa7-b0a2-23d0019eee80'),('wsOrder4','e8f75eb5-cbd1-467a-aebf-6f4df670093d','c68bf138-be40-4adf-ab3b-d15f7d271963'),('wsOrder5','e8f75eb5-cbd1-467a-aebf-6f4df670093d','ef4ace39-fcf4-4ccc-a096-f4f384ea5ccf'),('wsProductCategory1','2bbda62d-ab20-4c70-ac13-9626e65ab006','43be26fc-36ac-49cb-8ef9-2a92762ffe82'),('wsProductCategory2','2bbda62d-ab20-4c70-ac13-9626e65ab006','a4ed2c8c-e4ea-428e-8228-c02268afc0e0'),('wsProducts1','cde96503-76da-440c-9d35-e9be21c70616','98a569e6-b559-427f-87d2-2f1b9fa786e5'),('wsProducts2','cde96503-76da-440c-9d35-e9be21c70616','c59dd8c5-7ae9-455d-adb9-2fe1d67e9fd0'),('wsStore1','822fed41-7169-4376-a254-b312f0c521fe','4a7f39a2-4493-4a66-a357-8ab229ccc2e5');

/*Table structure for table `m_rule` */

DROP TABLE IF EXISTS `m_rule`;

CREATE TABLE `m_rule` (
  `ID` varchar(40) NOT NULL,
  `PROMOTION_ID` varchar(40) DEFAULT NULL,
  `NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_rule` */

insert  into `m_rule` values ('38577303-c2ae-4ea0-bc46-96a2d29679b3','52209d50-f89d-4ce3-9e7c-1e6d9be72675','升级为注册会员'),('79e9c691-6620-4f71-8761-40a81d1f3173','5b4aee86-0517-4749-8b07-e94ed67df198','推荐人积分'),('7cf1447d-618b-41d0-b2ad-1f72f9cfa8cf','52209d50-f89d-4ce3-9e7c-1e6d9be72675','降级到认证会员'),('af533dc3-2154-4e5f-b83b-e5e66717274b','52209d50-f89d-4ce3-9e7c-1e6d9be72675','降级普通会员'),('b7b8b5a6-6e00-40a7-8b93-1325ed3ea2d3','52209d50-f89d-4ce3-9e7c-1e6d9be72675','升级为Vip会员'),('ca49d2d1-b2c6-4b17-9c2e-5c4df74e4984','5b4aee86-0517-4749-8b07-e94ed67df198','返利扣除'),('f919b4cc-8b4e-49f9-a716-7c1740f4d390','5b4aee86-0517-4749-8b07-e94ed67df198','优惠码返利');

/*Table structure for table `m_scheduler` */

DROP TABLE IF EXISTS `m_scheduler`;

CREATE TABLE `m_scheduler` (
  `ID` varchar(40) NOT NULL,
  `BEGIN_TIME` varchar(20) DEFAULT NULL,
  `END_TIME` varchar(20) DEFAULT NULL,
  `CAMPAGIN_ID` varchar(40) NOT NULL,
  `SENDGROUP_ID` varchar(40) DEFAULT NULL,
  `RESPONSEGROUP_ID` varchar(40) DEFAULT NULL,
  `FREQUENCY` varchar(20) DEFAULT NULL,
  `FRE_CONTENT` varchar(30) DEFAULT NULL,
  `DELIVERY_ID` varchar(40) DEFAULT NULL,
  `SCHEDULE_SQL` longtext,
  `CTRLGROUP_SQL` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_scheduler` */

/*Table structure for table `m_screen` */

DROP TABLE IF EXISTS `m_screen`;

CREATE TABLE `m_screen` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `ORDERS` int(11) DEFAULT NULL,
  `DISPLAY` varchar(1) DEFAULT NULL,
  `DEFAULT_VIEW` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_screen` */

insert  into `m_screen` values ('00141a02-b56d-4ddd-88c4-d28dbcf8c008','Screen.MessageManagement','消息管理',110,'0','0ff00b27-698c-4d60-bc91-bc0bd9531301'),('0db95450-ec8d-46aa-9270-a338ee15d6ab','Screen.Invitation','邀约管理',111,'0','c3d59bfc-de94-456f-b9ec-904da46c09fc'),('0f76be02-78e0-475e-9004-bc9c648dc957','Screen.MarketingList','列表管理',450,'1','2fd1d34f-774e-4b1d-a239-a28504c5f071'),('10e008f6-0899-4afd-b532-b900c72a9ba7','Screen.Email','Email',104,'0','6ef80e42-65ae-4e5d-a2b4-72d479d78e57'),('1723839e-026a-446e-acfa-26cfe0969f43','Screen.DataEntry','数据录入',116,'0','7e0dc766-338c-43e5-80ff-eefcd8b6d4cb'),('21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a','Screen.LoyaltyProgram','忠诚度项目',9,'1','99dc6f36-30d3-4d92-912c-6963513a3f6e'),('28b633d3-7e6e-48a7-a92b-0ffe9dfd967c','Screen.Products','管理-产品',6,'1','98a569e6-b559-427f-87d2-2f1b9fa786e5'),('28c06f8d-bb8e-4523-98b6-accf16ea753a','Screen.Corp','团体',12,'1','031d4f71-c1fc-4cfc-9b0f-472d8e998a68'),('31b323c8-71d0-4725-a336-4f2058b4e2eb','Screen.CustomerSegAnalytics','客户细分分析',109,'1','d86b8b0b-d725-4a74-9a56-93705f492cbc'),('3869d5e2-7d61-48b0-9551-4e19ced386a7','Screen.Administration-Auth','管理-权限',801,'1','47af3b22-a407-4b11-9a74-1b8cbb235882'),('398fc0ad-2eef-4452-a032-08cdca5abcfb','Screen.CampaignDesignAnalytics','营销设计分析',111,'1','f3682bfc-d973-490c-972b-f2f879c2b7a4'),('39bc1087-1886-40ea-b491-b112eced99b1','Screen.Administration-Application','管理-应用',802,'1','a7214d55-5624-4228-944f-608b18660082'),('3d72c52f-8118-4dc4-8ed2-92e8bc3deeb0','Screen.MarkeingCalendar','营销日历',1,'1','0757ca6f-8ae7-48df-9974-f5b82c8e48b8'),('3e0ef726-b056-4cd0-be33-a98454b940eb','Screen.SmartScript','管理-智能脚本',114,'0','27182071-91a2-4f66-8ca3-c4d27d6e51ce'),('4c0edf78-e93a-4183-b2fc-a51dcc80c74c','Screen.LoyTransaction','忠诚度交易',16,'1','55c478eb-8579-4cbe-bd37-01969733a188'),('560a9aa1-145c-4e86-9890-7469505130a0','Screen.Inbound','Inbound',102,'0','d74cbe57-55ef-4bad-8dc7-ed717af303f8'),('6e1f3843-82a9-4a99-82f7-e209dddc3ee6','Screen.LoyTierClass','等级分类',1000,'0','51b33b8d-4af4-420a-9b7b-ffa44c8962b9'),('80106D48-E59F-4B2F-B222-07E5B464D379','Screen.DataManagement','数据管理',7,'1','09DF3A65-7667-41C9-93ED-22B771040C01'),('82802786-7479-427d-828b-f73cb2e99979','Screen.Order','订单',5,'1','518395c8-a0c0-4338-9042-066141bfc558'),('8976951b-473c-4fd7-836e-dbdac45dd62f','Screen.MarketingOffer','OFFER',500,'1','250a34a6-b26f-4c47-82c6-52432003366a'),('8cd9f67c-0353-47a8-8cd7-c5f21b49460d','Screen.MarketingResponse','响应管理',8,'1','9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04'),('944bea39-552e-43a3-a7fe-5edc0329e1a3','Screen.MarketingTreatment','短信Treatment',55,'1',''),('9daf1861-3114-4362-b7b6-bfb36e2b1e0a','Screen.FAQManage','FAQ管理',118,'0','cf012aff-385c-4930-82e4-12633156d633'),('9dd61293-b013-48fe-b9ea-fab43b5ab379','Screen.ProductCategory','管理-产品Category',502,'1','a4ed2c8c-e4ea-428e-8228-c02268afc0e0'),('9e00ec4e-290c-424a-a388-71b1753d7a75','Screen.Customer','客户',4,'1','62406e88-f768-4c73-9317-cdd66ca0314f'),('a2d86b1f-c498-407e-80a4-f25adf0a836b','Screen.ReportManagement','报表管理',506,'0','ea09cbb1-a2f2-41cf-91dd-6b4b7f7e0c97'),('a335dabd-b19e-4a89-b8ba-2decac883ab3','Screen.Store','管理-门店',505,'1','4a7f39a2-4493-4a66-a357-8ab229ccc2e5'),('b10bfa81-f03a-4b99-b6e1-2211e4ff8b56','Screen.CallCenter首页','首页',1,'0','57ed3ef8-ea6e-48f5-89fe-b4eedade2be5'),('b298e098-de72-48a5-be83-814e4013c647','Screen.Employee','管理-员工',506,'1','d84dd02a-5528-4ba9-a464-2e59d321bc6a'),('b9cdd5de-2c52-4192-bdbd-0ed8a2ae8e81','Screen.DQM','数据质量管理',800,'1','595049d9-cda1-4e2f-bb18-873088326a21'),('bb9ea6b4-9082-409b-9471-2e34fef415b5','Screen.ServiceRequest','服务请求',105,'0','de7d2918-883b-471f-9b45-c373cfe86e61'),('bd5ae528-f0eb-4eae-bd73-508df0279ea8','Screen.GiftManagement','管理-礼品',113,'1','1f1bd791-a643-47ee-b780-62c85fa3ce5d'),('bee20ab0-bfc4-442e-8bf1-56f02706520f','Screen.LoyPromotion','Promotion',10,'0','59bac8c4-4866-473f-87e9-8ee6820d93dd'),('cd83f798-5684-451e-9adb-2415ddfc3ea9','Screen.Outbound','Outbound',103,'0','111c5844-b5ca-48ae-9ad7-57e531639007'),('d220e218-6686-4e52-aff8-9c27dce1bcba','Screen.InboundList','Inbound列表',115,'0','3ff53029-8310-4aa0-9048-06d33d62735c'),('d8577a02-3a49-4ac3-91c1-1ed706917ae9','Screen.CallCenter-Task','任务',112,'0','8720ae8a-f6a4-48cf-b1a8-ef553f3d8e8f'),('da71c5b1-da77-4da0-93c6-7beb6191eabe','Screen.CampaignAnalytics','分析报表',7,'1','96a94439-d9f5-4698-81c8-abeab3cb94cb'),('e04ee50e-f189-43f6-af39-f87297c0ad47','Screen.Message','消息',120,'0','08b96ea2-268c-4317-b253-1c6721d71a65'),('f8981591-a41f-4705-88f3-7295a023221e','Screen.HouseHold','家庭',11,'1','648b11df-0c26-473f-b129-6b23907b17f2'),('fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a','Screen.Member','会员',13,'1','ad9e25bd-6098-4f72-a22f-ca941c7f31b1'),('MarketingCampaign','Screen.MarketingCampaign','营销活动',3,'1','MarketingCampaignV'),('MarketingProgram','Screen.MarketingProgram','营销项目',2,'0','MarketingProgramV');

/*Table structure for table `m_screen_bak` */

DROP TABLE IF EXISTS `m_screen_bak`;

CREATE TABLE `m_screen_bak` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `TITLE` varchar(100) DEFAULT NULL,
  `ORDERS` int(11) DEFAULT NULL,
  `DISPLAY` varchar(1) DEFAULT NULL,
  `DEFAULT_VIEW` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_screen_bak` */

/*Table structure for table `m_script` */

DROP TABLE IF EXISTS `m_script`;

CREATE TABLE `m_script` (
  `ID` varchar(40) NOT NULL,
  `CAMPID` varchar(40) DEFAULT NULL,
  `COMMONID` varchar(40) DEFAULT NULL,
  `SPLITID` varchar(40) DEFAULT NULL,
  `FRONTID` varchar(40) DEFAULT NULL,
  `SQLSTR` longtext,
  `DESCRIPTION` varchar(50) DEFAULT NULL,
  `TEMPTNAME` varchar(50) DEFAULT NULL,
  `TEMPTSQL` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_script` */

/*Table structure for table `m_segmentation` */

DROP TABLE IF EXISTS `m_segmentation`;

CREATE TABLE `m_segmentation` (
  `ID` varchar(40) NOT NULL,
  `P_ID` varchar(40) DEFAULT NULL,
  `NODENAME` varchar(40) DEFAULT NULL,
  `VIEWNAME` varchar(40) DEFAULT NULL,
  `VIEWCOLUMN` varchar(40) DEFAULT NULL,
  `NODETYPE` varchar(40) DEFAULT NULL,
  `PARM` varchar(100) DEFAULT NULL,
  `ADVANCESQL` longtext,
  `LOVID` varchar(40) DEFAULT NULL,
  `LANGUAGE` varchar(10) DEFAULT NULL,
  `HL_FLAG` int(11) DEFAULT NULL,
  `SOURCE_FLAG` varchar(10) DEFAULT NULL,
  `FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_segmentation` */

insert  into `m_segmentation` values ('0028AFF6-6F47-48E0-BF3C-AC9D1FAD01CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','性别','M_CUSTOMER','GENDER','mvg','  ',NULL,'MM_SPLIT_SEX','zh',2,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD02CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','生日','M_CUSTOMER','BIRTHDAY','date','BIRTHDAY',NULL,NULL,'zh',3,'date',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD04CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','职业','M_CUSTOMER','OCCUPATION','mvg','VOCATION_TYPE',NULL,NULL,'zh',4,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD05CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','移动电话状态','M_CUSTOMER','MOBILETEL_STATUS','mvg','CONTACTWAY_STATUS',NULL,NULL,'zh',5,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD13CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','电子邮件状态','M_CUSTOMER','EMAIL_STATUS','mvg','CONTACTWAY_STATUS',NULL,NULL,'zh',6,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD20CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','省/（直辖）市','M_CUSTOMER','PROVINCE','mvg','LOV_PROVINCE',NULL,NULL,'zh',8,'region',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD21CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','城市','M_CUSTOMER','CITY','mvg','LOV_CITY',NULL,'MM_SPLIT_CITY','zh',9,'region',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD31CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','最近登录','M_SUB_CUSTOMER','LAST_VISIT','mvg',NULL,NULL,'MM_SPLIT_SIGNON','zh',13,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD41CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','有无邮箱','M_SUB_CUSTOMER','EMAIL','mvg',NULL,NULL,'MM_SPLIT_MAIL','zh',14,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD46CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','年龄','M_CUSTOMER','AGE','text',NULL,NULL,NULL,'zh',10,'text',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD47CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','月收入','M_CUSTOMER','INCOME','text',NULL,NULL,NULL,'zh',11,'text',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','注册时间','M_CUSTOMER','REGISTER_TIME','date',NULL,NULL,NULL,'zh',12,'date',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CH','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','商家','M_CUSTOMER','SOURCE','mvg','SOURCE_TYPE',NULL,NULL,'zh',0,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CW','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','产品分类','M_ORDER_ITEM','PRIMARY_PRODUCT_CATEGORY','mvg','PRIMARY_PRODUCT_CATEGORY',NULL,NULL,'zh',21,'lov',1),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD88CH','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','网点','M_ORDER','SOURCE','mvg','SOURCE_WEBSITE',NULL,'SOURCE_WEBSITE','zh',1,'lov',1),('18544C3F-353E-4CB1-A508-806C68EA006D','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','活动组','M_CAMPAIGN','GROUP_ID','mvg',NULL,'select distinct M12.ID id ,M13.GROUP_ID GROUP_ID from M_RESPONSE M11,M_CUSTOMER M12,M_DELIVERY M13 WHERE M11.CUSTOMER_NUM = M12.CUSTOMER_NUM AND M11.DELIVERY_CODE = M13.ID',NULL,'zh',31,'group',1),('45651532-80D4-45A1-A324-B1A30456C374','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','交易省份','M_ORDER','PROVINCE','mvg','LOV_PROVINCE',NULL,NULL,'zh',16,'region',1),('4E5C8CAB-76BB-4FA2-A50C-593C5868BA26','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','渠道','M_CAMPAIGN','DELIVERY_ID','mvg',NULL,'select distinct M22.ID id ,M21.DELIVERY_CODE DELIVERY_ID  from M_RESPONSE M21,M_CUSTOMER M22 WHERE M21.CUSTOMER_NUM = M22.CUSTOMER_NUM',NULL,'zh',32,'delivery',1),('543D2B57-2B97-4A3E-88D8-3E642B793725','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','首次购买时间','M_CUSTOMER','FIRST_BUY_DATE','date',NULL,NULL,NULL,'zh',24,'date',1),('631B2152-E198-4526-AAA4-84CEA1564BC7','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','最大订单金额','M_CUSTOMER','MAX_ORDER_AMOUNT','text',NULL,NULL,NULL,'zh',25,'text',1),('873470A8-0C95-42CD-9044-F0CE48120A6E','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','活动','M_CAMPAIGN','CAMPAIGN_ID','mvg',NULL,'select distinct M2.ID id ,M3.CAMPAIGN_ID CAMPAIGN_ID  from M_RESPONSE M1,M_CUSTOMER M2,M_DELIVERY M3 WHERE M1.CUSTOMER_NUM = M2.CUSTOMER_NUM AND M1.DELIVERY_CODE = M3.ID',NULL,'zh',30,'campaign',1),('87D041C1-6668-485F-A926-31F81A055428','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','累计消费金额','M_ORDER_ITEM','MONEY','text',NULL,'select distinct o.CUSTOMER_ID as id ,case when \'M_ORDER\'=\'9\' then (SUM(o.ORDER_AMOUNT)) when \'M_ORDER_ITEM\'=\'9\' then (SUM(oi.AMOUNT)) end MONEY from M_ORDER o inner join M_ORDER_ITEM oi on o.ID=oi.ORDER_ID where 1=1 group by o.CUSTOMER_ID',NULL,'zh',18,'text',1),('9162335F-11B0-4A4D-B398-AF0D21F6A57C','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','消费频次','M_ORDER_ITEM','PRIVERY','text',NULL,'SELECT DISTINCT o.ID , COUNT(o.ORDER_ID) PRIVERY FROM (SELECT DISTINCT dbo.M_ORDER_ITEM.CUSTOMER_ID AS ID , M_ORDER_ITEM.ORDER_ID,M_ORDER_ITEM.PRIMARY_PRODUCT_ID,M_ORDER_ITEM.PRIMARY_PRODUCT_CATEGORY FROM  dbo.M_ORDER_ITEM )o WHERE 1=1 GROUP BY o.ID ',NULL,'zh',19,'text',1),('B4D4D904-2E48-452E-B898-5D94A9136D2C','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','消费数量','M_ORDER_ITEM','AMOUNT','text',NULL,'SELECT DISTINCT M_ORDER_ITEM.CUSTOMER_ID AS ID , SUM(M_ORDER_ITEM.QUANTITY) AMOUNT FROM  dbo.M_ORDER_ITEM WHERE 1=1 GROUP BY M_ORDER_ITEM.CUSTOMER_ID ',NULL,'zh',20,'text',1),('C007EE20-7435-4939-AB03-970112840679','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','最近购买时间','M_CUSTOMER','LAST_BUY_DATE','date',NULL,NULL,NULL,'zh',23,'date',1),('CCCF0F9D-8B14-44B9-9A2A-F255AA0DD9DA','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','交易城市','M_ORDER','CITY','mvg','LOV_CITY',NULL,'MM_SPLIT_CITY','zh',17,'region',1),('D244F4F4-C5C0-47C7-85A3-6222AA04C8E9','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','交易日期','M_ORDER','TRANS_DATE','date',NULL,NULL,NULL,'zh',17,'date',1),('E9D041C9-4CDD-4B19-A93E-E2CE08F2E43A','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','活动响应','M_RESPONSE','RESPONSE_TYPE','mvg',NULL,'select distinct M32.ID id ,RESPONSE_TYPE from M_RESPONSE M31,M_CUSTOMER M32 WHERE M31.CUSTOMER_NUM = M32.CUSTOMER_NUM','MM_SPLIT_RESPONSE','zh',33,'response',1),('EB4EABC1-B139-4477-90F7-1F76D0B33BC2','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','交易商品','M_ORDER_ITEM','PRIMARY_PRODUCT_ID','mvg',NULL,NULL,NULL,'zh',21,'product',1),('EFADF6CF-DD06-45E5-B452-63A77715F0EE','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','退款次数','M_CUSTOMER','REFUND_TIMES','text',NULL,NULL,NULL,'zh',27,'text',1),('EFADF6CF-DD06-45E5-B452-63A77715F0EH','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','客单价','M_CUSTOMER','PER_CUSTOMER_TRANSACT','text',NULL,NULL,NULL,'zh',26,'text',1),('EFADF6CF-DD06-45E5-B452-63A77715F0EW','0028AFF6-6F47-48E0-BF3C-AC9D1FAD00CF','退款金额','M_CUSTOMER','REFUND_AMOUNT','text',NULL,NULL,NULL,'zh',28,'text',1);

/*Table structure for table `m_segmentation_expant` */

DROP TABLE IF EXISTS `m_segmentation_expant`;

CREATE TABLE `m_segmentation_expant` (
  `ID` varchar(50) NOT NULL,
  `SEGMENTATION_ID` varchar(50) DEFAULT NULL,
  `CONTENTS` longtext,
  `OTHER_FLAG` varchar(10) DEFAULT NULL,
  `CONTENTS_X` longtext,
  `contents_type` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_segmentation_expant` */

insert  into `m_segmentation_expant` values ('0028AFF6-6F47-48E0-BF3C-AC9D1FAD01CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD01CF','男=M_MALE=1|女=M_FEMALE=2','0','MM_CUS_GENDER','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD04CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD04CF','电子=M_EDUCATION=1|能源=M_ELECTRON=2|工程设计=M_ENERGY=3|银行=M_BANK=4','1','VOCATION_TYPE','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD05CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD05CF','有效=M_VALID=1|无效=M_INVALID=2|未知=M_UNKNOWN=3','0','CONTACTWAY_STATUS','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD13CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD13CF','有效=M_VALID=1|无效=M_INVALID=2|未知=M_UNKNOWN=3','0','CONTACTWAY_STATUS','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD20CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD20CF',' B-北京=北京=1|S-上海=上海=2|G-广东=广东省=3|C-重庆=重庆=4|F-福建=福建省=5','1','LOV_PROVINCE','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD21CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD21CF',' B-北京市=北京市=1|S-上海市=上海市=2|G-广州市=广州市=3|S-深圳市=深圳市=4|C-成都市=成都市=5','1','LOV_CITY','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD46CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD46CF','25岁以下=(AGE >=1 and AGE<=25)=1|26-30=(AGE >=26 and AGE<=30)=2|31-35=(AGE >=31 and AGE<=35)=3|36-40=(AGE >=36 and AGE <=40)=4|56-60=(AGE >=56 and AGE<=60)=5|1万以上=(AGE >=60 and AGE<=150)=6','1','AGE_EXT','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD47CF','0028AFF6-6F47-48E0-BF3C-AC9D1FAD47CF','2千以下=(INCOME >=1 and INCOME<=2000)=1|2001-3000=(INCOME >=2001 and INCOME<=3000)=2|3001-4000=(INCOME >=3001 and INCOME<=4000)=3|5001-10000=(INCOME >=5000 and INCOME<=10000)=4|1万以上=(INCOME >=10001 and INCOME<=100000)=5','1','INCOME_INTERVAL_EXT','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CH','0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CH','市场活动=MYSELF=1|淘宝商城=TMALL=2|京东商城=JINGDONG=3|外部购买=OSP=4|微博=WEIBO=5','1','SOURCE_TYPE','LOV'),('0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CW','0028AFF6-6F47-48E0-BF3C-AC9D1FAD53CW','减肥产品=CATEGORY_Glasses=1|珍珠产品=CATEGORY_HealthProd=2','1','PRIMARY_PRODUCT_CATEGORY','LOV'),('0083B1B6-09F2-4C9E-9A1B-AD9206D76934','45651532-80D4-45A1-A324-B1A30456C374',' B-北京=北京=1|S-上海=上海=2|G-广东=广东省=3|C-重庆=重庆=4|F-福建=福建省=5','1','LOV_PROVINCE','LOV'),('631B2152-E198-4526-AAA4-84CEA1564BC7','631B2152-E198-4526-AAA4-84CEA1564BC7','2千以下=(MAX_ORDER_AMOUNT >=1 and MAX_ORDER_AMOUNT<=2000)=1|2001-3000=(MAX_ORDER_AMOUNT >=2001 and MAX_ORDER_AMOUNT<=3000)=2|3001-4000=(MAX_ORDER_AMOUNT >=3001 and MAX_ORDER_AMOUNT<=4000)=3|5001-10000=(MAX_ORDER_AMOUNT >=5000 and MAX_ORDER_AMOUNT<=10000)=4|1万以上=(MAX_ORDER_AMOUNT >=10001 and MAX_ORDER_AMOUNT<=100000)=5','1','MAX_ORDER_AMOUNT_EXT','LOV'),('87D041C1-6668-485F-A926-31F81A055428','87D041C1-6668-485F-A926-31F81A055428','2千以下=(MONEY >=1 and MONEY<=2000)=1|2001-3000=(MONEY >=2001 and MONEY<=3000)=2|3001-4000=(MONEY >=3001 and MONEY<=4000)=3|5001-10000=(MONEY >=5000 and MONEY<=10000)=4|1万以上=(MONEY >=10001 and MONEY<=100000)=5','1','TOTAL_ORDER_AMOUNT_EXT','LOV'),('9162335F-11B0-4A4D-B398-AF0D21F6A57C','9162335F-11B0-4A4D-B398-AF0D21F6A57C','1次=(PRIVERY =1)=1|2次=(PRIVERY =2)=2|3次=(PRIVERY =3)=3|4次=(PRIVERY =4)=4|5次-10次=(PRIVERY >=5 and PRIVERY<=10)=5','1','FREQUENCY_EXT','LOV'),('B4D4D904-2E48-452E-B898-5D94A9136D2C','B4D4D904-2E48-452E-B898-5D94A9136D2C','1-2=(AMOUNT >=1 and AMOUNT <=2)=1|3-4=(AMOUNT >=3 and AMOUNT <=4)=2|5-6=(AMOUNT >=5 and AMOUNT <=6)=3|7-8=(AMOUNT >=7 and AMOUNT <=8)=4|9-15=(AMOUNT >=9 and AMOUNT<=15)=5','1',NULL,NULL),('EFADF6CF-DD06-45E5-B452-63A77715F0EE','EFADF6CF-DD06-45E5-B452-63A77715F0EE','1次=(REFUND_TIMES =1)=1|2次=(REFUND_TIMES =2)=2|3次=(REFUND_TIMES =3)=3|4次=(REFUND_TIMES =4)=4|5次-10次=(REFUND_TIMES >=5 and REFUND_TIMES<=10)=5','1',NULL,NULL),('EFADF6CF-DD06-45E5-B452-63A77715F0EH','EFADF6CF-DD06-45E5-B452-63A77715F0EH','2千以下=(PER_CUSTOMER_TRANSACT >=1 and PER_CUSTOMER_TRANSACT<=2000)=1|2001-3000=(PER_CUSTOMER_TRANSACT >=2001 and PER_CUSTOMER_TRANSACT<=3000)=2|3001-4000=(PER_CUSTOMER_TRANSACT >=3001 and PER_CUSTOMER_TRANSACT<=4000)=3|5001-10000=(PER_CUSTOMER_TRANSACT >=5000 and PER_CUSTOMER_TRANSACT<=10000)=4|1万以上=(PER_CUSTOMER_TRANSACT >=10001 and PER_CUSTOMER_TRANSACT<=100000)=5','1','PER_CUSTOMER_TRANSACT_EXT','LOV'),('EFADF6CF-DD06-45E5-B452-63A77715F0EW','EFADF6CF-DD06-45E5-B452-63A77715F0EW','2千以下=(REFUND_AMOUNT >=1 and REFUND_AMOUNT<=2000)=1|2001-3000=(REFUND_AMOUNT >=2001 and REFUND_AMOUNT<=3000)=2|3001-4000=(REFUND_AMOUNT >=3001 and REFUND_AMOUNT<=4000)=3|5001-10000=(REFUND_AMOUNT >=5000 and REFUND_AMOUNT<=10000)=4|1万以上=(REFUND_AMOUNT >=10001 and REFUND_AMOUNT<=100000)=5','1',NULL,NULL),('FFCAB042-1D36-4C3A-AD6B-0DAF4674B3EE','CCCF0F9D-8B14-44B9-9A2A-F255AA0DD9DA','B-北京市=北京市=1|S-上海市=上海市=2|G-广州市=广州市=3|S-深圳市=深圳市=4|C-成都市=成都市=5','1','LOV_CITY','LOV'),('FFCAB042-1D36-4C3A-AD6B-0DAF4688B3EE','0028AFF6-6F47-48E0-BF3C-AC9D1FAD88CH','淘宝=淘宝=1|独立商城 =独立商城 =2','1','SOURCE_WEBSITE','LOV');

/*Table structure for table `m_service_request` */

DROP TABLE IF EXISTS `m_service_request`;

CREATE TABLE `m_service_request` (
  `ID` varchar(40) NOT NULL,
  `SR_ID` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `END_TIME` datetime DEFAULT NULL,
  `IMG_START_TIME` datetime DEFAULT NULL,
  `IMG_END_TIME` datetime DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CHILD_TYPE` varchar(40) DEFAULT NULL,
  `CONTACT` varchar(40) DEFAULT NULL,
  `PRODUCT_ID` varchar(40) DEFAULT NULL,
  `CONTACT_NUMBER` varchar(40) DEFAULT NULL,
  `OWNER_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(200) DEFAULT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `ENDURE_TIME` varchar(40) DEFAULT NULL,
  `EMPLOYEE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_service_request` */

/*Table structure for table `m_service_request_campaign` */

DROP TABLE IF EXISTS `m_service_request_campaign`;

CREATE TABLE `m_service_request_campaign` (
  `ID` varchar(40) NOT NULL,
  `SERVICE_REQUEST_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_service_request_campaign` */

/*Table structure for table `m_service_request_org` */

DROP TABLE IF EXISTS `m_service_request_org`;

CREATE TABLE `m_service_request_org` (
  `ID` varchar(40) NOT NULL,
  `SERVICE_REQUEST_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_service_request_org` */

/*Table structure for table `m_smart_scripts` */

DROP TABLE IF EXISTS `m_smart_scripts`;

CREATE TABLE `m_smart_scripts` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `PRI_ORGANIZATION_ID` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `QUESTION_XML` longtext,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_smart_scripts` */

/*Table structure for table `m_smart_scripts_session` */

DROP TABLE IF EXISTS `m_smart_scripts_session`;

CREATE TABLE `m_smart_scripts_session` (
  `ID` varchar(40) NOT NULL,
  `EVENT_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CAMPAGIN_ID` varchar(40) DEFAULT NULL,
  `SMART_SCRIPTS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_smart_scripts_session` */

/*Table structure for table `m_sms_sender` */

DROP TABLE IF EXISTS `m_sms_sender`;

CREATE TABLE `m_sms_sender` (
  `ID` varchar(40) NOT NULL,
  `SMS_TASK_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_NUM` varchar(40) DEFAULT NULL,
  `MEMBER_NUM` varchar(40) DEFAULT NULL,
  `MOBLIE` varchar(20) DEFAULT NULL,
  `CUSTOMER_NAME` varchar(40) DEFAULT NULL,
  `AVABLEPOINTS` decimal(20,2) DEFAULT NULL,
  `TERMINTEDATE` datetime DEFAULT NULL,
  `MEMBERTIER` varchar(20) DEFAULT NULL,
  `TIERTERDATE` datetime DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `JOINDATE` datetime DEFAULT NULL,
  `MEMBERTERDATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_sms_sender` */

/*Table structure for table `m_sms_task` */

DROP TABLE IF EXISTS `m_sms_task`;

CREATE TABLE `m_sms_task` (
  `ID` varchar(40) NOT NULL,
  `DELIVERY_NAME` varchar(120) DEFAULT NULL,
  `DELIVERY_CODE` varchar(40) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `SMS_SENDTIME` datetime DEFAULT NULL,
  `BRAND_ID` varchar(40) DEFAULT NULL,
  `SMS_PRIORITY` varchar(4) DEFAULT NULL,
  `SMS_TYPE` varchar(4) DEFAULT NULL,
  `SEND_NUMBER` int(11) DEFAULT NULL,
  `SEND_CHANNEL` varchar(4) DEFAULT NULL,
  `SMSGCONTENT` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_sms_task` */

/*Table structure for table `m_stages` */

DROP TABLE IF EXISTS `m_stages`;

CREATE TABLE `m_stages` (
  `ID` varchar(40) NOT NULL,
  `BEGIN_TIME` varchar(20) DEFAULT NULL,
  `END_TIME` varchar(20) DEFAULT NULL,
  `CAMPAGIN_ID` varchar(40) NOT NULL,
  `FREQUENCY` varchar(20) DEFAULT NULL,
  `FRE_CONTENT` varchar(30) DEFAULT NULL,
  `SEQ` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_stages` */

/*Table structure for table `m_store` */

DROP TABLE IF EXISTS `m_store`;

CREATE TABLE `m_store` (
  `ID` varchar(40) NOT NULL,
  `STORE_NUM` varchar(40) DEFAULT NULL,
  `STORE_NAME` varchar(100) DEFAULT NULL,
  `STORE_ABBR` varchar(20) DEFAULT NULL,
  `STORE_REGION` varchar(40) DEFAULT NULL,
  `STORE_PROVINCE` varchar(20) DEFAULT NULL,
  `STORE_CITY` varchar(20) DEFAULT NULL,
  `STORE_ADDR` varchar(128) DEFAULT NULL,
  `STORE_PHONE` varchar(20) DEFAULT NULL,
  `STORE_FAX` varchar(20) DEFAULT NULL,
  `STORE_POSTCODE` varchar(20) DEFAULT NULL,
  `STORE_MARKET` varchar(40) DEFAULT NULL,
  `STORE_OPENTIME` datetime DEFAULT NULL,
  `STORE_ENDTIME` datetime DEFAULT NULL,
  `STORE_ORG` varchar(40) DEFAULT NULL,
  `STORE_TYPE` varchar(40) DEFAULT NULL,
  `STORE_STATUS` varchar(40) DEFAULT NULL,
  `STORE_ADMIN` varchar(40) DEFAULT NULL,
  `COMMENTS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_store` */

/*Table structure for table `m_sub_customer` */

DROP TABLE IF EXISTS `m_sub_customer`;

CREATE TABLE `m_sub_customer` (
  `ID` varchar(40) NOT NULL,
  `O_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_NUM` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(40) DEFAULT NULL,
  `LAST_NAME` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `PINYIN` varchar(20) DEFAULT NULL,
  `GENDER` varchar(40) DEFAULT NULL,
  `COUNTRY` varchar(40) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `ID_TYPE` varchar(40) DEFAULT NULL,
  `ID_CARD` varchar(30) DEFAULT NULL,
  `REGISTER_COUNTER` varchar(40) DEFAULT NULL,
  `ADMIN_COUNTER` varchar(40) DEFAULT NULL,
  `REGISTER_TIME` datetime DEFAULT NULL,
  `SALESMAN_ID` varchar(40) DEFAULT NULL,
  `MODE` varchar(40) DEFAULT NULL,
  `IF_MEMBER` int(11) DEFAULT NULL,
  `INDUSTRY` varchar(40) DEFAULT NULL,
  `DUTY` varchar(40) DEFAULT NULL,
  `HOPPY` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(40) DEFAULT NULL,
  `INCOME` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `MOBILE_TEL` varchar(50) DEFAULT NULL,
  `MOBILETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_MOBILETEL` int(11) DEFAULT NULL,
  `HOME_TEL_REGION` varchar(20) DEFAULT NULL,
  `HOME_TEL` varchar(50) DEFAULT NULL,
  `HOME_TEL_EXT` varchar(20) DEFAULT NULL,
  `HOMETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_HOMETEL` int(11) DEFAULT NULL,
  `COMPANY_TEL_REGION` varchar(20) DEFAULT NULL,
  `COMPANY_TEL` varchar(20) DEFAULT NULL,
  `COMPANY_TEL_EXT` varchar(20) DEFAULT NULL,
  `COMPANYTEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_POST` int(11) DEFAULT NULL,
  `IF_COMPANYTEL` int(11) DEFAULT NULL,
  `SPARE_TEL` varchar(20) DEFAULT NULL,
  `SPARETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_SPARETEL` int(11) DEFAULT NULL,
  `EMAIL` text,
  `EMAIL_STATUS` varchar(40) DEFAULT NULL,
  `IF_EMAIL` int(11) DEFAULT NULL,
  `POSTADDR_STATUS` varchar(40) DEFAULT NULL,
  `POSTCODE_STATUS` varchar(40) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `SOURCE_OTHER` varchar(40) DEFAULT NULL,
  `MAIN_ADDRESS_ID` varchar(40) DEFAULT NULL,
  `DATA_ENTER_ID` varchar(40) DEFAULT NULL,
  `WARNING_INFO` varchar(200) DEFAULT NULL,
  `OCCUPATION` varchar(40) DEFAULT NULL,
  `INCOME_LIST` varchar(40) DEFAULT NULL,
  `SKIN_TYPE` varchar(40) DEFAULT NULL,
  `USED_BRAND` varchar(40) DEFAULT NULL,
  `KNOW_PRODUCT_MODE` varchar(40) DEFAULT NULL,
  `MOST_CARE_INFO` varchar(40) DEFAULT NULL,
  `SKIN_CARE_INFO` varchar(40) DEFAULT NULL,
  `ACTIVITY_NOTIFY` varchar(40) DEFAULT NULL,
  `CARE_PRODUCT` varchar(40) DEFAULT NULL,
  `SALE_TYPE` varchar(40) DEFAULT NULL,
  `REMARK` text,
  `Summary` int(11) DEFAULT NULL,
  `REGION` varchar(64) DEFAULT NULL,
  `PROVINCE` varchar(64) DEFAULT NULL,
  `CITY` varchar(64) DEFAULT NULL,
  `ADDRESS` text,
  `POSTALCODE` varchar(50) DEFAULT NULL,
  `FIRST_PUR_DATE` datetime DEFAULT NULL,
  `FIRST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_PRODUCT` varchar(100) DEFAULT NULL,
  `LAST_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `MAX_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `BUY_NUMBER` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `BUYER_CREDIT` varchar(64) DEFAULT NULL,
  `NICK` varchar(50) DEFAULT NULL,
  `PROMOTED_TYPE` int(11) DEFAULT NULL,
  `CONSUMER_PROTECTION` varchar(32) DEFAULT NULL,
  `VIP_INFO` varchar(10) DEFAULT NULL,
  `SOURCEID` varchar(36) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `CUS_LEVEL` varchar(40) DEFAULT NULL,
  `PER_CUSTOMER_TRANSACT` decimal(11,2) DEFAULT '0.00',
  `REFUND_TIMES` int(11) DEFAULT '0',
  `REFUND_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `WEBSITE` varchar(200) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `COMPANY_NAME` varchar(100) DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `WECHAT` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_O_ID` (`O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_sub_customer` */

insert  into `m_sub_customer` values ('062e5784-2436-11e4-8bff-00163e021993','062e578e-2436-11e4-8bff-00163e021993','1',NULL,NULL,'绍瑞',NULL,NULL,NULL,'1987-03-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 11:52:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370202','370000','370200','漳州二路','266520',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL),('062e58a6-2436-11e4-8bff-00163e021993','062e58b0-2436-11e4-8bff-00163e021993','4',NULL,NULL,'王斌',NULL,NULL,NULL,'1982-06-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 21:33:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18954834868',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','110000','110100','丰台区88号','100000',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL),('062e593c-2436-11e4-8bff-00163e021993','062e5946-2436-11e4-8bff-00163e021993','6',NULL,NULL,'杨洪鹏',NULL,'1',NULL,'1989-04-20 00:00:00',NULL,NULL,NULL,NULL,'2014-08-12 08:27:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18563923532',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370212','370000','370200','松岭路169号崂山软件园B503','266000',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL),('72ad7dd0-2d42-11e4-8bff-00163e021993','72ad7dda-2d42-11e4-8bff-00163e021993','16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-20 16:58:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL),('741f5da4-2460-11e4-8bff-00163e021993','741f5dae-2460-11e4-8bff-00163e021993','6',NULL,NULL,'杨洪鹏',NULL,'1',NULL,'1989-04-20 00:00:00',NULL,NULL,NULL,NULL,'2014-08-12 08:27:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18563923532',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370212','370000','370200','松岭路169号崂山软件园B503','266000',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL),('741f5f20-2460-11e4-8bff-00163e021993','741f5f21-2460-11e4-8bff-00163e021993','1',NULL,NULL,'绍瑞',NULL,NULL,NULL,'1987-03-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 11:52:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370202','370000','370200','漳州二路','266520',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL),('741f5fb6-2460-11e4-8bff-00163e021993','741f5fc0-2460-11e4-8bff-00163e021993','4',NULL,NULL,'王斌',NULL,'1',NULL,'2014-01-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 21:33:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18954834868',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','110000','110100','丰台区88号','100000',NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,NULL,NULL,NULL,NULL);

/*Table structure for table `m_sub_customer_bk2` */

DROP TABLE IF EXISTS `m_sub_customer_bk2`;

CREATE TABLE `m_sub_customer_bk2` (
  `ID` varchar(40) NOT NULL,
  `O_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_NUM` varchar(50) DEFAULT NULL,
  `FIRST_NAME` varchar(40) DEFAULT NULL,
  `LAST_NAME` varchar(40) DEFAULT NULL,
  `FULL_NAME` varchar(50) DEFAULT NULL,
  `PINYIN` varchar(20) DEFAULT NULL,
  `GENDER` varchar(40) DEFAULT NULL,
  `COUNTRY` varchar(40) DEFAULT NULL,
  `BIRTHDAY` datetime DEFAULT NULL,
  `ID_TYPE` varchar(40) DEFAULT NULL,
  `ID_CARD` varchar(30) DEFAULT NULL,
  `REGISTER_COUNTER` varchar(40) DEFAULT NULL,
  `ADMIN_COUNTER` varchar(40) DEFAULT NULL,
  `REGISTER_TIME` datetime DEFAULT NULL,
  `SALESMAN_ID` varchar(40) DEFAULT NULL,
  `MODE` varchar(40) DEFAULT NULL,
  `IF_MEMBER` int(11) DEFAULT NULL,
  `INDUSTRY` varchar(40) DEFAULT NULL,
  `DUTY` varchar(40) DEFAULT NULL,
  `HOPPY` varchar(100) DEFAULT NULL,
  `EDUCATION` varchar(40) DEFAULT NULL,
  `INCOME` varchar(40) DEFAULT NULL,
  `SOURCE` varchar(40) DEFAULT NULL,
  `MOBILE_TEL` varchar(50) DEFAULT NULL,
  `MOBILETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_MOBILETEL` int(11) DEFAULT NULL,
  `HOME_TEL_REGION` varchar(20) DEFAULT NULL,
  `HOME_TEL` varchar(50) DEFAULT NULL,
  `HOME_TEL_EXT` varchar(20) DEFAULT NULL,
  `HOMETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_HOMETEL` int(11) DEFAULT NULL,
  `COMPANY_TEL_REGION` varchar(20) DEFAULT NULL,
  `COMPANY_TEL` varchar(20) DEFAULT NULL,
  `COMPANY_TEL_EXT` varchar(20) DEFAULT NULL,
  `COMPANYTEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_POST` int(11) DEFAULT NULL,
  `IF_COMPANYTEL` int(11) DEFAULT NULL,
  `SPARE_TEL` varchar(20) DEFAULT NULL,
  `SPARETEL_STATUS` varchar(40) DEFAULT NULL,
  `IF_SPARETEL` int(11) DEFAULT NULL,
  `EMAIL` text,
  `EMAIL_STATUS` varchar(40) DEFAULT NULL,
  `IF_EMAIL` int(11) DEFAULT NULL,
  `POSTADDR_STATUS` varchar(40) DEFAULT NULL,
  `POSTCODE_STATUS` varchar(40) DEFAULT NULL,
  `CREATE_BY` varchar(40) DEFAULT NULL,
  `CREATE_DATE` datetime DEFAULT NULL,
  `MODIFY_BY` varchar(40) DEFAULT NULL,
  `MODIFY_DATE` datetime DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `SOURCE_OTHER` varchar(40) DEFAULT NULL,
  `MAIN_ADDRESS_ID` varchar(40) DEFAULT NULL,
  `DATA_ENTER_ID` varchar(40) DEFAULT NULL,
  `WARNING_INFO` varchar(200) DEFAULT NULL,
  `OCCUPATION` varchar(40) DEFAULT NULL,
  `INCOME_LIST` varchar(40) DEFAULT NULL,
  `SKIN_TYPE` varchar(40) DEFAULT NULL,
  `USED_BRAND` varchar(40) DEFAULT NULL,
  `KNOW_PRODUCT_MODE` varchar(40) DEFAULT NULL,
  `MOST_CARE_INFO` varchar(40) DEFAULT NULL,
  `SKIN_CARE_INFO` varchar(40) DEFAULT NULL,
  `ACTIVITY_NOTIFY` varchar(40) DEFAULT NULL,
  `CARE_PRODUCT` varchar(40) DEFAULT NULL,
  `SALE_TYPE` varchar(40) DEFAULT NULL,
  `REMARK` text,
  `Summary` int(11) DEFAULT NULL,
  `REGION` varchar(64) DEFAULT NULL,
  `PROVINCE` varchar(64) DEFAULT NULL,
  `CITY` varchar(64) DEFAULT NULL,
  `ADDRESS` text,
  `POSTALCODE` varchar(50) DEFAULT NULL,
  `FIRST_PUR_DATE` datetime DEFAULT NULL,
  `FIRST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_DATE` datetime DEFAULT NULL,
  `LAST_BUY_PRODUCT` varchar(100) DEFAULT NULL,
  `LAST_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `MAX_ORDER_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `BUY_NUMBER` int(11) DEFAULT NULL,
  `LAST_VISIT` datetime DEFAULT NULL,
  `BUYER_CREDIT` varchar(64) DEFAULT NULL,
  `NICK` varchar(50) DEFAULT NULL,
  `PROMOTED_TYPE` int(11) DEFAULT NULL,
  `CONSUMER_PROTECTION` varchar(32) DEFAULT NULL,
  `VIP_INFO` varchar(10) DEFAULT NULL,
  `SOURCEID` varchar(36) DEFAULT NULL,
  `IMP_HISTORY_ID` varchar(36) DEFAULT NULL,
  `CUS_LEVEL` varchar(40) DEFAULT NULL,
  `PER_CUSTOMER_TRANSACT` decimal(11,2) DEFAULT '0.00',
  `REFUND_TIMES` int(11) DEFAULT '0',
  `REFUND_AMOUNT` decimal(11,2) DEFAULT '0.00',
  `WEBSITE` varchar(200) DEFAULT NULL,
  `AGE` int(11) DEFAULT NULL,
  `COMPANY_NAME` varchar(100) DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `WECHAT` varchar(20) CHARACTER SET utf8 COLLATE utf8_estonian_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_O_ID` (`O_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_sub_customer_bk2` */

/*Table structure for table `m_suggestion` */

DROP TABLE IF EXISTS `m_suggestion`;

CREATE TABLE `m_suggestion` (
  `ID` varchar(40) NOT NULL,
  `SR_ID` varchar(40) DEFAULT NULL,
  `SUGGESTION` text,
  `DO_BY` varchar(40) DEFAULT NULL,
  `DO_TIME` datetime DEFAULT NULL,
  `DESCRIPTION` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_suggestion` */

/*Table structure for table `m_survey_question` */

DROP TABLE IF EXISTS `m_survey_question`;

CREATE TABLE `m_survey_question` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `QUS_NUM` varchar(36) DEFAULT NULL,
  `QUS_GROUP` varchar(64) DEFAULT NULL,
  `QUS_TYPE` varchar(36) DEFAULT NULL,
  `QUS_ANSWER` text,
  `ASSIGNED_USER` varchar(40) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_survey_question` */

/*Table structure for table `m_survey_result` */

DROP TABLE IF EXISTS `m_survey_result`;

CREATE TABLE `m_survey_result` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `SURVEY_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `QUESTION_ID` varchar(40) DEFAULT NULL,
  `ANSWER` text,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_survey_result` */

/*Table structure for table `m_survey_template` */

DROP TABLE IF EXISTS `m_survey_template`;

CREATE TABLE `m_survey_template` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(128) DEFAULT NULL,
  `TMP_NUM` varchar(32) DEFAULT NULL,
  `TMP_VER` varchar(32) DEFAULT NULL,
  `ASSIGNED_USER` varchar(40) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED_DATE` datetime DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `DESCRIPTION` text,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_survey_template` */

/*Table structure for table `m_system_paramepter` */

DROP TABLE IF EXISTS `m_system_paramepter`;

CREATE TABLE `m_system_paramepter` (
  `ID` varchar(40) NOT NULL,
  `WARNING_TIME` int(11) DEFAULT NULL,
  `EMAIL_ADDRESS` varchar(200) DEFAULT NULL,
  `POSITION_ID` varchar(40) DEFAULT NULL,
  `EMAIL_SERVICE_AGREEMENT` varchar(40) DEFAULT NULL,
  `EMAIL_SYSTEM_IP` varchar(40) DEFAULT NULL,
  `EMAIL_USER` varchar(40) DEFAULT NULL,
  `EMAIL_PASSWORD` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  `REQUEST_WARNING_TIME` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_system_paramepter` */

/*Table structure for table `m_targetlist` */

DROP TABLE IF EXISTS `m_targetlist`;

CREATE TABLE `m_targetlist` (
  `ID` varchar(40) NOT NULL,
  `LIST_NAME` text,
  `DESCRIPTION` varchar(100) DEFAULT NULL,
  `LIST_TYPE` varchar(20) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_targetlist` */

/*Table structure for table `m_task` */

DROP TABLE IF EXISTS `m_task`;

CREATE TABLE `m_task` (
  `ID` varchar(40) NOT NULL,
  `JOB_NUM` varchar(40) DEFAULT NULL,
  `TYPE` varchar(40) DEFAULT NULL,
  `STATUS` varchar(40) DEFAULT NULL,
  `START_TIME` datetime DEFAULT NULL,
  `EXPECTED_TIME` datetime DEFAULT NULL,
  `CAMPAIGN_ID` varchar(40) DEFAULT NULL,
  `JOB_TOTAL` int(11) DEFAULT NULL,
  `ASSIGNED_TOTAL` int(11) DEFAULT NULL,
  `COMPLETED_NUM` int(11) DEFAULT NULL,
  `OWNER_ID` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `DESCIPTION` varchar(200) DEFAULT NULL,
  `DIAL_TIME` int(11) DEFAULT NULL,
  `DELIVERY_ID` varchar(40) DEFAULT NULL,
  `INVITATION_ID` varchar(40) DEFAULT NULL,
  `SMART_SCRIPT_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_task` */

/*Table structure for table `m_task_exception_list` */

DROP TABLE IF EXISTS `m_task_exception_list`;

CREATE TABLE `m_task_exception_list` (
  `ID` varchar(40) NOT NULL,
  `DATE` datetime DEFAULT NULL,
  `RECORD_ID` varchar(40) DEFAULT NULL,
  `EXP_DESC` longtext,
  `TYPE` int(11) DEFAULT NULL,
  `TASK_LOG_STATUS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_task_exception_list` */

/*Table structure for table `m_task_log_status` */

DROP TABLE IF EXISTS `m_task_log_status`;

CREATE TABLE `m_task_log_status` (
  `ID` varchar(40) NOT NULL,
  `GROUP_ID` varchar(40) DEFAULT NULL,
  `TASK_ID` varchar(40) DEFAULT NULL,
  `TASKS_SUM` int(11) DEFAULT NULL,
  `TASKS_SUCCESS_NUM` int(11) DEFAULT NULL,
  `TASKS_FAILURE_NUM` int(11) DEFAULT NULL,
  `START_DATE` datetime DEFAULT NULL,
  `END_DATE` datetime DEFAULT NULL,
  `STATUS` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_task_log_status` */

/*Table structure for table `m_tier` */

DROP TABLE IF EXISTS `m_tier`;

CREATE TABLE `m_tier` (
  `ID` varchar(40) NOT NULL,
  `TIER_CLASS_ID` varchar(40) DEFAULT NULL,
  `SEQUENCE` varchar(40) NOT NULL,
  `TIER_NAME` varchar(40) DEFAULT NULL,
  `PERIOD` int(11) DEFAULT NULL,
  `UOM` varchar(40) DEFAULT NULL,
  `NEXT_PERIOD` int(11) DEFAULT NULL,
  `NEXT_UOM` varchar(40) DEFAULT NULL,
  `CALCULATE` varchar(40) DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_tier` */

insert  into `m_tier` values ('9a4f076e-0b13-44ff-b2d7-727913c0d3d6','1842b1ae-f301-49e7-a13e-96086fee03e0','2','认证会员',1,'M_YEAR',1,'M_YEAR','M_DAY',1),('b77555b8-fcb8-41aa-9bf5-b7c273e94f25','1842b1ae-f301-49e7-a13e-96086fee03e0','1','普通会员',1,'M_YEAR',1,'M_YEAR','M_DAY',1),('d0c3cab8-f65f-4784-b4a3-7c05c6bdc71b','1842b1ae-f301-49e7-a13e-96086fee03e0','3','VIP会员',1,'M_YEAR',1,'M_YEAR','M_DAY',1);

/*Table structure for table `m_tier_class` */

DROP TABLE IF EXISTS `m_tier_class`;

CREATE TABLE `m_tier_class` (
  `ID` varchar(40) NOT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `SEQUENCE` varchar(40) NOT NULL,
  `CLASS_NAME` varchar(40) DEFAULT NULL,
  `BASE_TIER` varchar(40) DEFAULT NULL,
  `ACTIVE_FLAG` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_tier_class` */

insert  into `m_tier_class` values ('1842b1ae-f301-49e7-a13e-96086fee03e0','b72a0045-2bea-4ea7-95f7-14755a94d597','1','金欧力会员','b77555b8-fcb8-41aa-9bf5-b7c273e94f25',1);

/*Table structure for table `m_tier_detail` */

DROP TABLE IF EXISTS `m_tier_detail`;

CREATE TABLE `m_tier_detail` (
  `ID` varchar(40) NOT NULL,
  `MEMBER_ID` varchar(40) DEFAULT NULL,
  `TIER_CLASS` varchar(40) DEFAULT NULL,
  `PROGRAM_ID` varchar(40) DEFAULT NULL,
  `CUSTOMER_ID` varchar(40) DEFAULT NULL,
  `BEFORE_TIER` varchar(40) DEFAULT NULL,
  `AFTER_TIER` varchar(40) DEFAULT NULL,
  `UPDATE_BY` varchar(40) DEFAULT NULL,
  `UPDATE_DATE` datetime DEFAULT NULL,
  `COMMENT` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_tier_detail` */

/*Table structure for table `m_treatment` */

DROP TABLE IF EXISTS `m_treatment`;

CREATE TABLE `m_treatment` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(80) DEFAULT NULL,
  `TEMPLATE_ID` varchar(40) DEFAULT NULL,
  `TEMPLATE_NAME` varchar(50) DEFAULT NULL,
  `THEME` varchar(200) DEFAULT NULL,
  `SENDER_NAME` varchar(50) DEFAULT NULL,
  `SENDER_EMAIL` varchar(50) DEFAULT NULL,
  `SEND_CONTENT` longtext,
  `CREATED_BY` varchar(40) DEFAULT NULL,
  `CREATED` datetime DEFAULT NULL,
  `LAST_UPD_BY` varchar(40) DEFAULT NULL,
  `LAST_UPD` datetime DEFAULT NULL,
  `DELIVERY_ID` varchar(40) NOT NULL,
  `CUSTOMER_INFO` text,
  `SCRIPT_NAME` varchar(200) DEFAULT NULL,
  `SCRIPT_ID` varchar(40) DEFAULT NULL,
  `QR_CODE_ID` varchar(40) DEFAULT NULL,
  `MPT_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_treatment` */

/*Table structure for table `m_two_info` */

DROP TABLE IF EXISTS `m_two_info`;

CREATE TABLE `m_two_info` (
  `id` varchar(40) NOT NULL,
  `name` varchar(40) NOT NULL,
  `path` varchar(100) NOT NULL,
  `type` varchar(40) DEFAULT NULL,
  `text` varchar(255) DEFAULT NULL,
  `active` varchar(1) NOT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `created` varchar(40) NOT NULL,
  `create_date` date DEFAULT NULL,
  `updated` varchar(40) NOT NULL,
  `update_date` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_two_info` */

/*Table structure for table `m_user` */

DROP TABLE IF EXISTS `m_user`;

CREATE TABLE `m_user` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) NOT NULL,
  `USER_NM` varchar(40) DEFAULT NULL,
  `PASSWORD` varchar(200) DEFAULT NULL,
  `AGENT_ID` varchar(20) DEFAULT NULL,
  `DEVICE_NUM` varchar(20) DEFAULT NULL,
  `BELONG_ORG` varchar(40) DEFAULT NULL,
  `PRIMARY_POS_ID` varchar(40) DEFAULT NULL,
  `APPKEY` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_user` */

insert  into `m_user` values ('007e2dab-1034-4577-a8b5-3efb0f793ae4','56353B716156C4F35F0D09B5A38C8527','赵四海','RTx2UVlsbA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('01f3a6df-277d-4f38-ac49-7cd3dda319c0','3775A44EECAC61FD9B8553EAEBE159D8','test12348','ZW1Cem4sbnZ4b1k5RnA=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('030303a4-eab5-4863-a257-317b6530a668','2715ECE07534829CF4C196935FB5903E','碧生源演示帐号','WkhycDZmSj02U2U+',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('05da0b12-e07a-40d2-8c82-1e834c2cc4e9','84761D0CE68432E914E3394F82669CEA','wnn20','VUQkNSxR',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('061bf81a-073b-4f55-bc94-194425788715','D10973DEB80FC5A9A39724E0FD5AE283','wnn13','O3FRUzQkTkhQU3dJZw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('09e39da6-671e-4e13-8706-8025f14d128f','8CC84FB4AD208591F8D972FA5FEBEACE','赵四海','NHJUImxuaTpYT2M+',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('0a44ffa8-3870-472e-98fa-e33dbc7fc322','A0CE8E709E9843C49677CB1FE72CA632','周颖','PH5rWl5n',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('0cd308e4-ef0e-44cc-9547-a9999499e83a','79CE533D8282851909ACC723197D7AC1','刘岩','MkFARW5qInsiQg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('0ec2a9c8-4be9-4056-838c-86ea88178858','FB85C1AF9BFE8BCA651C80C0F335641E','碧生源测试用','XGYwXEh1Wg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('0f487bc0-1123-416e-999a-fa97bc9e1946','90869083EEC0ED9AE8CDED86F3661FEB','小民3','fiY2VkVWUWQtdCsxeVU=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('0fd38122-485d-4f0c-84be-65cbcfe1ffec','212523614F2B73751A2E49C22E4CCB73','刘岩','VyxVbzcmTkk7LWk8',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('10689571-a849-4a3d-8eb7-6fc74cd4477b','FC43AD75E86EF59C32594C805FF9A306','dcjkx','In4/YkUh',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('10efabbd-054a-4161-bd9d-d9e193217d00','areca','areca','Njc3NzI5MTUyNDQyRjNEN0Y2NjNEMjdDNDA4MENERDg=','','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','',NULL),('13d68caa-915e-4ba9-99d0-be7977d19d21','5C251DC68EB2D64D788CFF306E88DC22','wnn1','eVA+T3IzcQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('1458ee77-9304-40e1-ab80-aa9780c5630a','2FEA2BD0EB7E2866B7EAF8B2A577ADBB','赵欣','aUlwMEI6bi0=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('15b8b234-338b-43e9-81e4-32c201ab330e','69C568C143769E5397BD1005BD8C75D3','李徐海','OkoiM31FQ2ddZ3Bzdlw=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('175e335b-b789-476e-b9ac-eaa671e49729','9B7170481DE28C98445A6A86F700F25A','杜凤英','fiRMK3Q7b11I',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('186e4f38-9fdc-456f-9a6e-f60601c2962d','69A469B9574408ADA4275F9F1087B31F','jiekoub','anh1MFM8ZjNAW3ZSKWM=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('1b950e62-fd8c-4cb9-a585-828a2d9e85af','5F67D91DAFC26835E0D36392BB64F75C','wnn8','YlpDb1tA',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('1f4eddea-3979-4578-ae99-572261ba22a4','42D7A8314CB9D2203DA11B69B6C2F797','李璐','Iz9+NzQpJFNEMXxKNkk=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('215bf328-4196-448b-929f-b997597a7033','AF37701154E3CFC5CFA34959C76E4F33','小郑测试','anZkbT8pSyxmOm1tblc=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('22c85427-3585-4cd5-ae67-6784e159354c','D801D6660C9DB10CC81F7DAA470F76B2','test12348','b3p+ISh5KTFwRVU=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('230df099-e11a-4e1c-a151-8ba754e1d2a5','682BDFDAFC5F84FBFBFAB14C663DA222','wnn15','cWwpKi4ocmlRVVhRXSRX',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('260f71fa-1d2e-48f6-a672-e2ce857097e5','1656E2A7BDC8F52857F159A180FA2AA2','wnn21','fHVQYHZKUTFhcQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('2acb3df6-f623-4c6b-8a88-ad97b2b64722','7321FB7FAC5F0FF75D7E6E77F78DA177','刘伟','RHVtPixX',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('2cf5ec87-84b3-4c83-87f3-50a51d73b19c','5348ADA4FAE8DC793EE03D529C6BAA32','test1234','Nypnd0tiT2NVVk9ocGo2',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('2ecda9e6-d15a-4b98-8edb-233ed006cfec','D01A66BA298DD5ECF54F64D6E97324CB','删除测试002','LnFDSFMh',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('2fa8ea0e-aef5-4f52-8d22-5b05ca848adc','375A8520322411B1804F030EFF344CA6','中粮集团','dSgtQXp7J0grRQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('308cd926-0230-4ffb-9232-e4b804c3ff1d','6ACEA8F08EE4E39B66AA3C6CE4FA0511','wnn8','eTYsUyUzbitd',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('30c54bd0-5b3a-437e-a669-abb480c34af8','D5221F231971002F9F89E4C0EE60B090','wnn','cW41QGVGQlk6aCs=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('3215e0aa-ba11-4777-9fdf-a9b89ebf1988','176884ECA69660A361CB819730F77238','jizhongkai','NTYsOH5LfHAyL0U=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('33dc5b0f-b201-4515-91d3-b45f4ed5ac0a','A2FEB4707FEC6AD3A4C7A3AFD87C8CC7','dcjkd','am5waCxDfiE3JWVpew==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('354ad423-d455-481f-94e2-1b840d779842','BE169B42D2643473E0ED1CE919D3DE6B','孔晚冬','ajVdcFV5',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('358374f1-3eab-4efd-99b9-28cceb3a354f','07D4B939041EB4FF3DB21C76E0BC0A34','杜凤英','M0pobjMmTj9GYk9ZTUg=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('382f15a0-847b-4a98-a34c-c7224dc7235b','AC293D95E56583B6F43A7E79B17C74A5','孙宵','M20+LTBxI1Y=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('39d3063a-b260-425a-8f42-387cf111e8da','22C2DA290E2A91CFEAA9485C4BCDEA92','wnn5','N2BWfW1hdWs+QA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('3b3b95f8-e7ff-4ac3-8652-a823b121eaf9','B957D35F43BC3EC898E543E19A5811A3','季忠凯','bXtpJWxWfTI=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('3bbc1de1-cdef-45c1-be32-fb65825e7cab','2D25CC8FE72B82B46FBBA7197B4993AF','wnn3','cjczIVkzLw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('3d431a4e-75c6-4790-bd0d-f9333b9969fb','0B0AB3E325C142AED53BBF8EABD96A16','金瓯利公司','NXE/I31MW1c8YlI=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'1AC7E99D38A69A01F75933CDA1253634'),('3f7fc00d-307b-459d-a911-e7047ad250b0','1ED5BA7F2BEDD69D9F1D626B9CAB8FB4','wnn6','NiZOIW1AblZsYGVkdA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('423abd6b-c588-4e8d-9fbf-60e55c2b2a48','92CBACF3911119D19AA1B34904C6FFFD','wnn14','PWRxMDdSXA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('438c6504-318a-41a8-9f2d-f53c797d43b0','1283C3CCA79972A2943D37CE412C6700','wnn6','ZURmb0ReZWt+VmxLNGw=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('46d313a3-d0bd-4655-b3ad-71e1f6f11b04','468E96713B6C461012553D0CAAAB7BB7','郑新','JUtTXnk0',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('47929513-27e2-4b7f-9273-8e16b626df34','95C18AF12BAA67C904A3D3FD6400273A','王戎','T3QqblFmfXdLcyc=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('48272e4d-602d-4d63-aed7-af930402ff71','491B4C54ECB535A4C3DCEC4271A9FF5E','teststm','bF0sansqQU9ZaiM=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('49a45a15-addb-4296-902b-035635450bcd','3D1A99A395D03A98263AB9E60AAF47E3','洪斌','c1dzU1h4UXNDLHNGdw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('4b6dee58-d15c-4dc9-a800-4a99f654f5f2','082AA4ECA8DFB8EBA89BBD9339B56009','马延','Lk5TWiRVMS52fil6',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('4c0911b3-22a5-4559-8dad-71de868a4cd6','25FCCA5E338211A9B60C904B5612C910','administrator','KXBScGRz',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('4e01f760-b4b6-4fbc-af4a-050559406a20','84481A10B525A42CB674BD388DBC8417','刘德强','NSpAJTR1N084QDxD',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('4f3403d1-f562-4b44-82a0-a2787cc8fb2b','CCEA2919104D77C0FF3EF3C125FDC6A1','杜凤英','TG1iYn1mLD4kM3ouS04p',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('539e1886-2308-407e-b664-09bb43e0ff2f','9A8354DAC6F0F0D70D4C1F7D02497FB4','中粮单点登录大连','NngqXUxtU206RSk=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('588c3b3f-39ad-4331-ae8d-3f2a264d38fb','CD7D156B8E05B0DD69D26022D3CDD144','郑新','UnFUdS0mdicu',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('5893a799-cfd2-46c8-8ba4-56e7580ec143','F15F69B24E1A5BF77F393503930E5427','黄德永','cGc/SFFJJlM=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('58a4e3cb-87df-4887-9df4-9bfd5a66203b','4260693755BA0E0654BCFFB609DC6E9A','test12345','fDc+TFtBTTxl',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('5d48af70-e855-4ec8-bf7f-e70dacbd4023','CA2B3B0B856197A6D108E73E4A83C462','dandian2','XHhIfm0wQUI=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('5d6b198e-7555-40a1-8105-aec7f144d719','93DD62C39600C72C2E685BC1D1B209C9','wnn28','JX48JzJ2PGs1KlI=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('5da09e50-1448-4275-bba9-2d135d086a53','AB836FAE80878E146D1D1DE728868379','倪贵云','XEhIOSUtbUdATQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','54525FE77CFC57FF854A4BF5C83C818A','吴斌','aWc4dShiM21cVA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('60f4f93c-4d55-4987-b489-aecbc8b3d8ae','7AF40DEAC198B161E18EFEB9CD5DCAA7','刘德强','fWdbYy5zLFRTUSFCKw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('62181cbe-506f-4ada-90c3-f32828c9776e','65D6937B61264ED433D5CE2A11C5584D','万能','S2JmcT9eajJMc1NUZWVt',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('64174de7-e444-4b4d-81c7-ea8f3cc49240','testuser1','小王111','ZXludVhiPHli',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'test_appkey'),('64ee63fe-0a0f-482d-9c16-b3c71c75761c','B56212E6C2BEF250741FF71C776AE5C3','张泽梁','ZFFkNDdQT1d1ZXxk',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('66288812-1184-4651-8ed0-a83f247d50cb','C32FE86179483F3251CD332869C1C12C','测试刘1','bVQlMUtlLUA+NkdkVnYi',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('66d3f87c-9d62-43e7-94fb-59302d4c2ed8','FDDD73439FF561769562E38E41218E72','stm042502','S1YhNj4yZWc2NUhJXS0=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('6b73b416-a32d-40fb-a343-b570d2e8d2cc','108E0929301D61B3C381345F37F746C4','功能演示账号','PkB7WWREI1EkOQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('6c0c6af7-7dc1-4d68-acdf-77bd0e13960e','testuser4','韩大炮','YC4memFs',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'test_appkey'),('6dd19f9a-9827-42a9-a44f-3ff426ea08e6','E2C3EE4FD2B669BA7BE8C1AFC4CC0A49','jiekou5','TmZzXSNiNUJDQ3I=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('6e767cf7-52e4-4010-91d3-f247654fb567','122DBA6E510DD14C5C6047B96769D1A5','小民001','Snx3PTc/K2swJ3t2',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('7024dee8-59ff-4132-b472-07fc6dc62457','demo_D29A8238','demo_D29A8238','Zjc3YTFhYTE5N2ZhMDVjYTUxNjQ5MmYxMGQwMGE2ZjE=','','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','',NULL),('702beeab-2870-4341-b2da-d46346259ba1','24161AE116F62E2DA0B3E2534663098F','dcjkb','bnZTRk1Bd3leM3FP',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('711adab8-ae9d-45f4-99b0-171225557347','42D7A8314CB9D2203DA11B69B6C2F797','李璐','LXkpRUxGT2M=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('7496836a-a18c-4db7-8df7-724c8df5b381','lladmin','lladmin','bGxhZG1pbg==','','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','',NULL),('7528587d-0d4f-4270-92ac-ef27b1b6263f','0C66DBDC44698957295CF27B6D0EE36B','金瓯利管理员','KHFmdmBqbGE=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'1AC7E99D38A69A01F75933CDA1253634'),('79cb6076-338d-4c32-859a-9ac932b22ccf','madmin','madmin','bWFkbWlu','','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','',NULL),('7b00cb02-9e3e-4f81-a4d2-ed1afde59ca6','demo_mt_9CE8FA2D','demo_mt_9CE8FA2D','ZmE1N2YzMjFmNjExOTM4MDAyZjhjM2ZjZTRjY2YzZmQ=',NULL,NULL,'7f57ae5b-ec02-4032-bdf6-3ae13e23b870',NULL,NULL),('7c76a2e6-fe7f-49c4-a128-236de5a2159e','FB184194CF3186DA2A1113EB67351D39','wnn030','YX1qIV59',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('7e09cced-b2ad-4596-a6e5-eda5a0dd0efb','F274296B5794BBB6A5059503BC53B07D','王9','ST8uNSE8QzBWZXYza2Q=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('81c9f7a7-48bd-4d07-b4e9-66e8198681b8','BA5627E120B96ACB09509B7908C28741','李楠','YSR7VnhGSiM=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('83d99455-bde5-4dbf-aae1-09652d9e0e3d','632EFD98CBADE1D3375BDD73751D83BF','test12347','PzFfLjAvLVpoT2VCN19o',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('8a68e715-a755-4d12-97a8-2e0ac7b09ceb','testuser7','测试刘','YDEtXSZoOVM0dg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'test_appkey'),('8bd8e510-e536-49e8-b307-0e35ec268b4c','A19C47AECAEBC8DB156C6139C1B1CAB5','test12347','W1J8IlxteTE=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('9128ece7-28e2-4467-a346-3d53646be8e2','BD61291D980A4D584DD3EBA0B4F304BC','stm042501','Yy4qWlEkXzUzJzNvbw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('93af4745-e92e-4241-b0fb-0b2e43f5cf6a','85A98DD39A906512F240E67C851C754A','wnn16','Km98Pik+ST8xaw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('956a45a8-29cb-410a-942e-3ff7fe108ae0','BBDE753585893AF88383FCAA0EDFB236','姚媛媛','bjxMLllZLQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('957391ad-b746-4313-9654-066c180afec7','3503E45DB55730EA56DA883D44CBEDE0','wnn','PiM9dHB8M3QxeHptSnJ2',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('9606fe3b-c08f-4224-9d8b-8f21888a2798','4896542AF80C52973606A20C64ADFBF9','jiekou6','IkgiM1NdLmgofEhda0c=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('972754b2-d54d-4429-8e74-5153ccacd170','C2F44F773FD06328824E8B9E57C7A23D','abcd','NE5mJDBQSCtHWz4w',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'1AC7E99D38A69A01F75933CDA1253634'),('a1b865c2-10e0-4ffd-8d71-b53cdc6bfe5b','30DBB85E75922FCCB380AD50901B3AB3','stm2','V11WJmpsbQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('a3502307-fe20-41ef-86d7-c0b3102e7371','3398B2B65E9FFF4D66198F7064250EFB','陈立威','bSQqLFoyVg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('a7b6a22b-1622-4a4a-b934-1f2046eb8724','8CA3B5E4D0FCDB319941184DBA185E40','wnn1','MmA8W3p4Og==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('a85d3047-41a8-48e8-af0f-c1033c9122f5','CD77ABE336D9ACFDFA8A9EDF0541BD85','wnn10','I1t2LTpnbA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('b100bbb2-8f60-4344-9fd1-faebfb3a57d0','B3CFB0CA3A030E990C108A53575AD34F','中粮集团','eC81MFBcPXwvaw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('b2e0785f-0e91-4643-aaeb-1d48363ef971','5F058072D859757010D9EC76C056B1D4','陈立威','QHk/cHI7',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','BEFF92DF3F28993A0E920F2A3602F5B8','刘岩','QlluNXkv',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('b575f34a-7a4c-4382-a8e0-df173f96c7b0','597510A7433D5FDE4CAF44EF562A4D46','test1234','dmc4di15QHkx',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('b5fb6b99-f329-408e-98d3-877fc898ab93','DD9438472F2DC2AB129FB0B302442E9A','刘岩2','diE0KGZpd3Ek',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('b64fa886-89ff-4c40-9645-f13f072c51fe','971F18BCB9B9D7E0BF41C4D347F65AF1','wnn7','eTh5ZkwiYFsyTnhu',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('b7dd1ca5-a5af-4ac7-946e-4cd93c6ba240','D638162FBEE61CF8802830EB3D164994','wnn16','N3Y2XilC',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('b922d041-1305-4a3a-be43-6ebff9114896','89BBCAFAF2CA1C1F4E2DF190E6C74A27','wnn2','RFF1MGVBeGA/QTI=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('bbd2b239-1ef2-4f49-8d86-f3778126d282','ladmin','ladmin','bGFkbWlu','','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','',NULL),('bc78dda8-1a72-423e-85b1-fb5fe51bae76','B90E1FD71CF8E7B410661EC624A626C6','黄德永','UztmRFxlOEZTUU8s',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('bd164a0e-be77-4bfb-9283-ea711d9f7938','06E99DDC93F88CF179E4C8569C09C9E8','徐宁','IlF1enphMnc=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('c0979193-f268-404d-9d3c-da2211c24e02','4B3E7B74B02425649CD267DF634FE605','wnn29','UCsrQmZDZG0kTW0=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('c20c3f03-7313-4d79-ac7b-88f210a5df01','6969D1C78BC83ABB1D77CA39F1277877','周硕蒙','Q3B2ZlIoJ3FH',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('c5a69b9c-441d-4456-9535-b0a72927ba6a','6D8B4D413373E4A894D306369252D6A1','夏曦','RkQqVGBAJi8iQilDSw==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('c7b0a411-9631-4028-84cb-0d35e861be43','2400B3E35E6DFB31D8F1BA193BBB1A69','wnn4','Ny9fdmkvMTRrK1s=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('c83e09a9-3394-4693-aee3-e896a6d31b0a','44CE3AA50633C7A21246C58EEEA8A464','管伟','SkJVeFJvQG1dZ0w=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('cc40a0d1-2664-4982-8ef1-20594df5fc09','00A30823282813654A1D2000E834EEB5','删除测试003','M1dNODJsRg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','438F48AE97E908941C7DBDEF843C906A','abc','NExdeG9qSEM=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'1AC7E99D38A69A01F75933CDA1253634'),('ce9b45f7-4de5-43c8-903b-127e5a49be21','61971B6D7F29BB2C4622B8AD06480145','wnn3','W3pCLlwq',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','7555497E888B9A8EC87025F003DDD0E1','赵四海','L0xDQSpveS9rNQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('d7bdf0e9-2bc3-46fd-a719-470e7525ee3a','AC293D95E56583B6F43A7E79B17C74A5','孙宵','Mmc8K14rQVh8XHdvVz0=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('d8827eed-a8fe-4fc5-9a35-82a620e6c791','9CA493D2C6A12172AA9380C58A6C6EC9','中粮集团','QDwrVlo/fiNTYCc=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('dd105af5-6a2c-4316-978c-b7d091c13ad2','C564710093970D69A88C29F45689578B','stm1234','IzhENl1jJjoo',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('dd4e96ac-5ecc-46f1-ab7c-524528ca396a','56773AC9477E9446FFC3D0DD43F9165A','洪斌','JDBPOHs1aXtg',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('e3015a4f-b35c-4085-bd8d-3dc3d472c7b3','89A1D8EBB50F4B5A29C9CB17AC22EA62','wnn31','Ik1DNGpDLUdCZmZqQSlY',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','E6D8E8EF016B18152BE17839C5CC2582','wnn00026','MklBejlOMGp3P3xNV0A=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('e7211217-333a-4001-aac0-c2eac6288637','F36EC386F90AADA4A4C8AF1C12FD4AE3','stm042503','TUxxK1x9',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('e9a93e86-d156-483d-b84b-90e9654fb0ea','619AB915B463FCC0DD0D4854B6C37673','中粮集团','dG8nRDghYEJBTlxtfmQ=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('e9b5f956-bc2a-4f34-9ff6-190863e264c4','B957D35F43BC3EC898E543E19A5811A3','季忠凯','XlA6XHNXIlcjQixadntd',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','810073883EFA2E65014B8F29EC25638F','wnn25','eSVgRCtmfHMsK1hjYQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('eddac9b7-391b-4ec6-8a29-7ef9046ba796','92808DBAE9F591E974487B4723808008','yddtest','Z0hSUE5QIkM6fnFAcC8=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','D6A8BE1DD9EC7619A5E5D0E0E674B082','王戎','UmFbZFxJSCw+TVFadA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'E99C1770DB8C5A8488E4328922A0D7B1'),('ef95930b-50a1-41a1-9b5a-365a5dc5649d','A331B2C2A8E90265A276D5D1411E67E6','test12346','PigjLWw+SExEZnklKGg=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('f0a81838-5646-4858-baac-df1d497e954e','testuser6','testuser7','eClKMz58XjVVcg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'test_appkey'),('f4615226-2034-4369-b6cb-0d5c579183cf','E0E39F242BE9FA7A9CC404585D747E9E','刘岩','TmN9TG9Wc3MmQU90Wg==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('f5bed440-ef95-48a5-9aa0-aaca9edd3e5e','AC96D76CC693DA71C4F8730E81D3E33B','wnn11','Q2srO0kjZGBXVCdL',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('f780967f-f851-4ea8-8eda-23430e122a43','E8516FEC3BCC4E17B21C269785E76458','wnn12','TzUqRXhWR1MjKChiSHpF',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('f825cc5f-464b-4344-a10a-13c591a89b9c','43E6EF9DCB9D278EA9373A1FB7093D4B','张红梅','NE5jeDtFOVpWZFAu',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('f9a1bc16-714f-498f-a35a-405a77cc1366','BC5309DBDD855B688B1AAB667BCB9DFC','中粮集团','b1AhZGx8ZE8zXkY=',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('faade522-325e-4d6a-9a0d-8df9e191682e','C8053462E968612D772949B1E964AB8B','内测3','YCNpRnFnLFdOY00nLTt2',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','D3703BA7B0EA51021CE5A7DEEAF3587F','吴斌','XGlYeUR5QkEwSC4jSA==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('fb2604e3-9ddc-4c06-b506-5819fbaf4b37','E6A320AF8381A407D5E04C1E7B69808C','曲海军','a2tLSzpdOQ==',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'BF5EB1F39F253B61D205DF18BAF7F8D8'),('fef6de75-44f7-4f87-908e-c873421358e8','43E6EF9DCB9D278EA9373A1FB7093D4B','张红梅','YUJhI25BLXRFakdMNXBf',NULL,NULL,'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',NULL,'83DDB1B5842E6596153E777BCA52FB9D'),('sadmin','sadmin','sadmin','c2FkbWlu','','','7F57AE5B-EC02-4032-BDF6-3AE13E23B870','',NULL);

/*Table structure for table `m_user_org` */

DROP TABLE IF EXISTS `m_user_org`;

CREATE TABLE `m_user_org` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `ORG_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_user_org` */

insert  into `m_user_org` values ('6c71fc3d-5760-4986-b6a5-61cca00ba11d','10efabbd-054a-4161-bd9d-d9e193217d00','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('8204e21c-a557-44f1-87f5-292fc312f691','sadmin','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('a229974d-9d52-479f-ae8e-9a5d8306e765','bbd2b239-1ef2-4f49-8d86-f3778126d282','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('a2f33492-6599-45fb-a482-30b262f32a02','7024dee8-59ff-4132-b472-07fc6dc62457','7f57ae5b-ec02-4032-bdf6-3ae13e23b870'),('cf7ba1df-4265-4cf9-8333-51fec2b13514','7b00cb02-9e3e-4f81-a4d2-ed1afde59ca6','7f57ae5b-ec02-4032-bdf6-3ae13e23b870'),('d1e78cd7-373c-4e0f-af5f-9deb0c80ece6','79cb6076-338d-4c32-859a-9ac932b22ccf','7F57AE5B-EC02-4032-BDF6-3AE13E23B870'),('ffbe7b91-b4ea-4985-b015-c1dee2018904','7496836a-a18c-4db7-8df7-724c8df5b381','7F57AE5B-EC02-4032-BDF6-3AE13E23B870');

/*Table structure for table `m_user_pos` */

DROP TABLE IF EXISTS `m_user_pos`;

CREATE TABLE `m_user_pos` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `POS_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_user_pos` */

insert  into `m_user_pos` values ('7a100376-c5c7-4baa-a38e-330dc352dadc','0d5406f4-b6da-4860-b04e-8766fa1d6477','53ec0067-f927-4ef0-b0ee-ceb7e38288c9');

/*Table structure for table `m_user_role` */

DROP TABLE IF EXISTS `m_user_role`;

CREATE TABLE `m_user_role` (
  `ID` varchar(40) NOT NULL,
  `USER_ID` varchar(40) DEFAULT NULL,
  `ROLE_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_user_role` */

insert  into `m_user_role` values ('00029709-44a5-4681-851a-10ea564820f5','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('0041c388-d0a5-4c2e-beba-16653233e519','0ac16798-0637-449e-87ca-ce047ce3b567','100a17da-6ea9-4c35-9f2b-159efb994713'),('009d31d6-2766-4719-b0f9-3e9816c75782','4ada79ea-e654-47fd-92a6-e8d32913a6a2','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('00a2a7e7-e11b-410b-b627-168c4aa51961','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('00cde0dc-6d60-4a75-ad5f-6d4d80cbbd78','47929513-27e2-4b7f-9273-8e16b626df34','caf93aa4-de65-453e-be16-c0cef90ee421'),('00cfdca6-e9b7-4295-9007-a8b9e051aa65','354ad423-d455-481f-94e2-1b840d779842','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('00e173a9-7898-4f7f-bfea-6b605b8679ab','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','822fed41-7169-4376-a254-b312f0c521fe'),('01b0ad27-a767-45cb-bbe6-471d6915d877','62181cbe-506f-4ada-90c3-f32828c9776e','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('01bf0003-4354-42b8-9e2f-3dcd8743b97c','539e1886-2308-407e-b664-09bb43e0ff2f','fc3727ea-112c-4341-9589-f88b9321c227'),('0206e70a-d6b9-4321-9364-ead7c17d83c2','9aada076-b566-4d5d-9941-3004d5d07f92','b7a69208-8267-44f7-b843-ff51b2482d07'),('0229e91c-168d-4ccd-8c98-69d0933d85ac','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('0298adaf-ff70-4921-a0ba-2180c941f58a','b2e0785f-0e91-4643-aaeb-1d48363ef971','100a17da-6ea9-4c35-9f2b-159efb994713'),('02aa6a41-cc5c-4260-8bde-77d9481d00b8','bc78dda8-1a72-423e-85b1-fb5fe51bae76','cde96503-76da-440c-9d35-e9be21c70616'),('02bfca00-584c-4d27-890b-34dba3640f06','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('02dc260d-8411-4939-a89a-b85b71f6530f','7528587d-0d4f-4270-92ac-ef27b1b6263f','fc3727ea-112c-4341-9589-f88b9321c227'),('02e43904-666f-41a5-bc56-88e9d8cf0bb1','0cd308e4-ef0e-44cc-9547-a9999499e83a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('02e8ad21-6a08-4bd8-98d4-55fa2ac4de12','4ada79ea-e654-47fd-92a6-e8d32913a6a2','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('0317331b-d939-4898-8dd3-02b529379b5f','c5a69b9c-441d-4456-9535-b0a72927ba6a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('03ae0898-ba06-4f87-a439-9915806413cf','daae65fc-3982-4f8b-aeff-75e0f238e559','b7a69208-8267-44f7-b843-ff51b2482d07'),('03c0e3f5-3556-4430-89b0-d0bdaa1dc96e','c0d6aeba-5e16-4965-afc2-7c38427e56a3','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('03cf3166-a025-43c4-bff0-82c371bd1485','6b73b416-a32d-40fb-a343-b570d2e8d2cc','fc3727ea-112c-4341-9589-f88b9321c227'),('042401d8-cba4-460a-9946-2ff23e29957b','bd164a0e-be77-4bfb-9283-ea711d9f7938','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('046521cd-9cdb-460f-8b93-794969512483','0fd38122-485d-4f0c-84be-65cbcfe1ffec','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('046f87c9-93bd-40dc-a180-a3e99869ffac','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('04739825-84e1-4a86-aa06-e72e7a0ed510','bd164a0e-be77-4bfb-9283-ea711d9f7938','822fed41-7169-4376-a254-b312f0c521fe'),('0487355d-6a6f-40fd-97f6-37e2e83b2679','0a44ffa8-3870-472e-98fa-e33dbc7fc322','fc3727ea-112c-4341-9589-f88b9321c227'),('04c37390-9b4f-418e-a610-310ff3b8b157','a3502307-fe20-41ef-86d7-c0b3102e7371','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('053d4f50-4939-494d-935d-f317360fa040','290e9538-0904-4e8d-8b56-c31ca4031d8b','b7a69208-8267-44f7-b843-ff51b2482d07'),('057d7256-c668-442e-b0d5-429bf87d54f8','c0979193-f268-404d-9d3c-da2211c24e02','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('05864b99-49b9-4528-bad5-90dc2c4d10f6','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('05addb6d-1a1f-4331-89a1-5aff742a84ae','956a45a8-29cb-410a-942e-3ff7fe108ae0','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('05e64b97-5318-4cb7-9966-3a1f0ec32425','c0d6aeba-5e16-4965-afc2-7c38427e56a3','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('060cd8d1-e160-4109-86bb-2c8e3c809794','15b8b234-338b-43e9-81e4-32c201ab330e','caf93aa4-de65-453e-be16-c0cef90ee421'),('06225ad5-54e9-44dd-a3dd-b6b1fa66c98c','007e2dab-1034-4577-a8b5-3efb0f793ae4','caf93aa4-de65-453e-be16-c0cef90ee421'),('0640e278-00f1-4408-bb73-94b6519b2960','5d6b198e-7555-40a1-8105-aec7f144d719','822fed41-7169-4376-a254-b312f0c521fe'),('066f619d-098a-46f4-a41b-207d845e4d92','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('06bda2be-8adc-4179-8476-2204a22bfb53','49a45a15-addb-4296-902b-035635450bcd','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('06c725b8-a8c1-4047-b12d-d0676297c545','c83e09a9-3394-4693-aee3-e896a6d31b0a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('06eea0cf-d35c-47dd-95dd-01342d40db1b','3216803b-9720-4af1-a034-7b64ac02f85a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('070dfa33-6fae-4a17-8c32-4a50b46af1d4','3a45d13b-18aa-4879-8460-e7d5315926f9','caf93aa4-de65-453e-be16-c0cef90ee421'),('074ae619-2445-4251-a759-385dd45d4338','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('076e8532-9fae-4646-8c4b-b18dffdfe7b2','62181cbe-506f-4ada-90c3-f32828c9776e','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('078cbd57-64ac-45d2-83af-f36a60d7261f','3216803b-9720-4af1-a034-7b64ac02f85a','b7a69208-8267-44f7-b843-ff51b2482d07'),('079bd9b6-7874-4e78-b4d3-579bff1efda4','c5a69b9c-441d-4456-9535-b0a72927ba6a','822fed41-7169-4376-a254-b312f0c521fe'),('07afb933-a036-4d3f-9ef3-06f2790440f1','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','100a17da-6ea9-4c35-9f2b-159efb994713'),('07ca553f-5c21-457a-b6c7-8f047cd033ae','972754b2-d54d-4429-8e74-5153ccacd170','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('07e016dc-29b1-4c5c-a9f2-618261057c0e','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','caf93aa4-de65-453e-be16-c0cef90ee421'),('07f036b3-dca8-4ebf-b592-3a44b6c4ba06','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('080aad98-a3e2-445b-8443-60bb41631a50','0ec2a9c8-4be9-4056-838c-86ea88178858','822fed41-7169-4376-a254-b312f0c521fe'),('08553894-cb78-4161-a427-ef4b0f202971','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','822fed41-7169-4376-a254-b312f0c521fe'),('08701870-083b-4c3e-ad62-7de0e8132066','1458ee77-9304-40e1-ab80-aa9780c5630a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('08a2c217-3ea6-4a80-a7d1-f490cb9b4cd2','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','b7a69208-8267-44f7-b843-ff51b2482d07'),('0915349c-dd9d-41b4-b60c-8cb43cffd9c5','226539b9-6717-4de2-869f-a6bb046b9a18','caf93aa4-de65-453e-be16-c0cef90ee421'),('09734861-ee3f-4ffe-aba4-df711a1b08ce','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','cde96503-76da-440c-9d35-e9be21c70616'),('099728c8-4084-4f1e-80fa-41a57a635411','cc40a0d1-2664-4982-8ef1-20594df5fc09','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('09b50d88-4b1e-4bf0-b646-51156c483ef9','5da09e50-1448-4275-bba9-2d135d086a53','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('0a03ae7b-dd5a-4418-813a-17f86ca633e6','7c76a2e6-fe7f-49c4-a128-236de5a2159e','822fed41-7169-4376-a254-b312f0c521fe'),('0a53047d-6a6e-4e50-ac3c-1e8f10f2dc66','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','cde96503-76da-440c-9d35-e9be21c70616'),('0a72a0eb-411e-464d-bb5a-5dc9fc4f48c4','64174de7-e444-4b4d-81c7-ea8f3cc49240','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('0ae389a4-04a6-4068-aebc-dfa4fb0bbf30','7496836a-a18c-4db7-8df7-724c8df5b381','fc3727ea-112c-4341-9589-f88b9321c227'),('0afc5021-fa49-477a-874f-287a5da57c3c','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('0aff9d1d-dab3-4719-a5b0-3c1e7417c862','bc78dda8-1a72-423e-85b1-fb5fe51bae76','44daa961-ff04-4f9f-be57-4395508d1fdb'),('0b678057-243d-4c2e-9ed4-1982b8e612a2','eddac9b7-391b-4ec6-8a29-7ef9046ba796','fc3727ea-112c-4341-9589-f88b9321c227'),('0ba1cd30-6f09-4f2d-8b57-9153153dab8e','0ec2a9c8-4be9-4056-838c-86ea88178858','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('0bb5b937-19e7-4ffc-8a53-b8a04cf0d632','6c0c6af7-7dc1-4d68-acdf-77bd0e13960e','b7a69208-8267-44f7-b843-ff51b2482d07'),('0bbfa609-48f2-4f5d-b2ed-5749d29590f4','eddac9b7-391b-4ec6-8a29-7ef9046ba796','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('0c33b787-d649-4f24-9720-aaf288c6d1bb','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','b7a69208-8267-44f7-b843-ff51b2482d07'),('0c423e93-46a0-465c-b678-35b3544df1fd','290e9538-0904-4e8d-8b56-c31ca4031d8b','caf93aa4-de65-453e-be16-c0cef90ee421'),('0c9d2913-ee9b-4c49-ab19-22618d888bc0','061bf81a-073b-4f55-bc94-194425788715','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('0cc2df33-270c-4d11-975e-478a44ff7cda','9aada076-b566-4d5d-9941-3004d5d07f92','822fed41-7169-4376-a254-b312f0c521fe'),('0cc98dd3-c0dd-4798-b4e7-2e1e29f43b02','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('0cedcf95-fd67-4874-b9f9-c9e1e12bd459','309836d7-7922-4500-b65a-a8973f8c5426','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('0cf5257c-189e-4424-a191-c1f4756f82fd','d8827eed-a8fe-4fc5-9a35-82a620e6c791','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('0d0c95f3-497f-406b-a787-777ee270b4c7','007e2dab-1034-4577-a8b5-3efb0f793ae4','cde96503-76da-440c-9d35-e9be21c70616'),('0d1de04d-8846-4a66-8a41-d1a1db241b8b','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('0d4d9b1f-5f9c-4d34-b4f7-acab870325d0','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('0dc52aef-9cab-454d-b1f2-de0c5f7534d4','4c0911b3-22a5-4559-8dad-71de868a4cd6','100a17da-6ea9-4c35-9f2b-159efb994713'),('0dda4425-6022-4776-911c-50f7c5f422cf','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','100a17da-6ea9-4c35-9f2b-159efb994713'),('0e155b69-9fa9-4c38-b9ba-fecc8d14d810','3a45d13b-18aa-4879-8460-e7d5315926f9','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('0e245907-3c0e-4c2c-83c2-a58bee57a4b4','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','caf93aa4-de65-453e-be16-c0cef90ee421'),('0e44b895-01ac-4f90-b7ca-f34cf3247a65','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','822fed41-7169-4376-a254-b312f0c521fe'),('0e727864-0193-4e27-a671-ba0ac828c0c7','f1d97f93-c60b-4b8a-ac15-49d2112fb814','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('0ec9a8a8-7a17-47ac-8541-4c108b969007','7c76a2e6-fe7f-49c4-a128-236de5a2159e','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('0ecdc23c-5f84-4699-8faa-d4a8967f3f58','5d6b198e-7555-40a1-8105-aec7f144d719','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('0ed36e3a-9ba1-4b2d-adfc-3f3939af876c','358374f1-3eab-4efd-99b9-28cceb3a354f','cde96503-76da-440c-9d35-e9be21c70616'),('0f134a19-5c16-4de7-96e3-ddd57947a8aa','64174de7-e444-4b4d-81c7-ea8f3cc49240','cde96503-76da-440c-9d35-e9be21c70616'),('0f14caaa-3b4b-4566-ace7-01b23d72b77c','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','cde96503-76da-440c-9d35-e9be21c70616'),('0f26b0fc-25f6-4cb8-b13b-332872464bcf','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','fc3727ea-112c-4341-9589-f88b9321c227'),('0f3acf89-5ae8-46e1-82c8-0a9591ddc5e8','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','100a17da-6ea9-4c35-9f2b-159efb994713'),('0f62698b-559d-420d-8733-fc69e872cbfd','4ada79ea-e654-47fd-92a6-e8d32913a6a2','44daa961-ff04-4f9f-be57-4395508d1fdb'),('10270eaf-8279-499c-94d8-a12fa74a6293','9aada076-b566-4d5d-9941-3004d5d07f92','cde96503-76da-440c-9d35-e9be21c70616'),('10d5c920-dbf7-4ef1-94fe-de68b4e9379b','eddac9b7-391b-4ec6-8a29-7ef9046ba796','caf93aa4-de65-453e-be16-c0cef90ee421'),('10ffb524-4d35-44ba-b89f-113f215edf4c','f9a1bc16-714f-498f-a35a-405a77cc1366','100a17da-6ea9-4c35-9f2b-159efb994713'),('114010fd-c67f-4a61-af60-933fe8c8f882','f9a1bc16-714f-498f-a35a-405a77cc1366','fc3727ea-112c-4341-9589-f88b9321c227'),('116ce303-82f3-4592-9bd9-f4fb3a645682','f9a1bc16-714f-498f-a35a-405a77cc1366','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('119b78b3-30b2-4303-99ed-97b5a159d66c','007e2dab-1034-4577-a8b5-3efb0f793ae4','fc3727ea-112c-4341-9589-f88b9321c227'),('11cbc946-efaf-4603-aa13-c0c4e1e6305d','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('11d22f75-d713-4af2-8dec-31b0c15bbcfd','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('11f4e0a6-7177-44b2-a6d3-158dc61dc978','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','44daa961-ff04-4f9f-be57-4395508d1fdb'),('12023be8-042b-4e0d-bd95-2603fa4d08f6','0ec2a9c8-4be9-4056-838c-86ea88178858','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('122ace4e-246a-4418-a319-078b0414bc39','7c76a2e6-fe7f-49c4-a128-236de5a2159e','caf93aa4-de65-453e-be16-c0cef90ee421'),('1241dd66-f1a7-4c84-b0e2-9ee5ef2f1434','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','44daa961-ff04-4f9f-be57-4395508d1fdb'),('12615568-3800-48d4-80ce-33f29c2cfb77','cc40a0d1-2664-4982-8ef1-20594df5fc09','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('12652d94-5d34-4347-b2bc-d250d5df7f24','3a45d13b-18aa-4879-8460-e7d5315926f9','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('12802955-5758-4c38-819d-df9dd24c82a2','260f71fa-1d2e-48f6-a672-e2ce857097e5','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('12ab58fc-12d3-4da0-aec3-b6cb31909efe','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('12c185b8-a74f-405b-9155-76c4a1903e49','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','cde96503-76da-440c-9d35-e9be21c70616'),('12cb1955-c5a9-444a-ab39-382185d28aee','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','b7a69208-8267-44f7-b843-ff51b2482d07'),('1319d0d3-1337-4226-babe-9828f22dec56','972754b2-d54d-4429-8e74-5153ccacd170','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('1364268d-d722-4fee-9dd7-081e0ceee147','e79ed356-8035-4687-9fe9-b3ddd2230deb','caf93aa4-de65-453e-be16-c0cef90ee421'),('137917d1-312b-45a5-be4b-adbcb1ca0271','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','822fed41-7169-4376-a254-b312f0c521fe'),('138133d0-5e65-4b2d-b756-4034c902445b','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','cde96503-76da-440c-9d35-e9be21c70616'),('1382de52-378e-43a5-b4a7-73486bfc620c','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','fc3727ea-112c-4341-9589-f88b9321c227'),('139c9fd6-d7e4-4601-9978-ad9aa43fbdaf','2acb3df6-f623-4c6b-8a88-ad97b2b64722','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('13aad4ce-8a5b-4152-b4b7-658026fdc7ca','956a45a8-29cb-410a-942e-3ff7fe108ae0','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('13ad7db0-41d9-468f-a431-b1b1260c7b99','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('13b3142c-8ae8-4644-821a-e19c02448d96','bc78dda8-1a72-423e-85b1-fb5fe51bae76','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('144ef312-43b7-4b10-a483-0d2930f1d82a','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','caf93aa4-de65-453e-be16-c0cef90ee421'),('1452cb08-89f1-46ee-ad56-e196e5dfb896','2ecda9e6-d15a-4b98-8edb-233ed006cfec','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('14726cd9-d57e-4ea2-9b27-3706b8cf1e3f','bd164a0e-be77-4bfb-9283-ea711d9f7938','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('149cc15f-48c2-41ee-9c44-0ba53bf3b51c','09e39da6-671e-4e13-8706-8025f14d128f','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('14a7a5a3-5047-4e9a-ade8-003b39338bc9','e7211217-333a-4001-aac0-c2eac6288637','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('14ab1996-f593-4630-bd07-a3ec70cbd8b5','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','822fed41-7169-4376-a254-b312f0c521fe'),('14b3cd2a-f410-4d99-85f9-d37bf186f1d2','972754b2-d54d-4429-8e74-5153ccacd170','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('14f51566-bdb1-4870-ae33-aad985f354cc','0ec2a9c8-4be9-4056-838c-86ea88178858','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('150bbfdc-0f40-436b-aaf7-ce4c9c0bb3da','6be10468-c5cc-446e-951d-11ad5048f01f','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('1517e949-70bf-48fb-8dfb-38ff8ac1275a','c5a69b9c-441d-4456-9535-b0a72927ba6a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('153ef42c-9e9d-4e4a-8ad5-452070afbe99','09e39da6-671e-4e13-8706-8025f14d128f','caf93aa4-de65-453e-be16-c0cef90ee421'),('15590e40-9acd-4435-8f0b-01bb9b62c890','6b73b416-a32d-40fb-a343-b570d2e8d2cc','100a17da-6ea9-4c35-9f2b-159efb994713'),('156d5f56-ad7f-4bc3-ac7b-a32cd8360d8d','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','caf93aa4-de65-453e-be16-c0cef90ee421'),('15831930-30b9-4c0d-af3c-e6a333faa4fc','e9a93e86-d156-483d-b84b-90e9654fb0ea','44daa961-ff04-4f9f-be57-4395508d1fdb'),('158a0c00-2cf4-4c28-9525-c40f2138ca93','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('159b0f89-573f-4fee-9f9c-bb438c1eeeb0','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('15ab0b0c-2ba0-4563-88ca-f82a69e5c5b8','5893a799-cfd2-46c8-8ba4-56e7580ec143','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('160acd75-7f27-4e81-96b4-9bc57d7e5b1e','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','44daa961-ff04-4f9f-be57-4395508d1fdb'),('16791836-d5a3-4571-9177-da0fc0afed5f','030303a4-eab5-4863-a257-317b6530a668','cde96503-76da-440c-9d35-e9be21c70616'),('169527a0-a913-4ba6-908a-1b2debd1a93a','4c0911b3-22a5-4559-8dad-71de868a4cd6','44daa961-ff04-4f9f-be57-4395508d1fdb'),('1697e711-4d10-42db-9b70-0fbe16301d9b','3a45d13b-18aa-4879-8460-e7d5315926f9','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('16d61b58-8340-4eee-873b-8eec199e099b','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('16fe9f76-f15b-47fa-b651-6e386812c025','30c54bd0-5b3a-437e-a669-abb480c34af8','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('179859c2-a8ad-451a-8810-ea515c916708','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('17e69545-7abf-4c06-92cd-8677d6701663','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','b7a69208-8267-44f7-b843-ff51b2482d07'),('18153a2e-3194-4c8d-84d9-2af286b3b421','3216803b-9720-4af1-a034-7b64ac02f85a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('1831e8b8-f74c-429d-bba9-951ced5d49c8','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','caf93aa4-de65-453e-be16-c0cef90ee421'),('184b9e1a-7969-4e68-a18e-1179022fef10','15b8b234-338b-43e9-81e4-32c201ab330e','cde96503-76da-440c-9d35-e9be21c70616'),('18aff61e-d654-44aa-965e-d1c1bc759751','6be10468-c5cc-446e-951d-11ad5048f01f','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('18dfed98-a159-407c-9666-0a27ddbae653','5d6b198e-7555-40a1-8105-aec7f144d719','fc3727ea-112c-4341-9589-f88b9321c227'),('1940c881-9794-4a2e-814b-464619efa0ce','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','822fed41-7169-4376-a254-b312f0c521fe'),('194f3c78-5ceb-49b0-b9c8-783b023ffe6e','0cd308e4-ef0e-44cc-9547-a9999499e83a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('19cec487-5a82-44f6-bc1c-9418f5bb831c','3a45d13b-18aa-4879-8460-e7d5315926f9','fc3727ea-112c-4341-9589-f88b9321c227'),('1a30dbe2-1db2-44d1-bace-298bd8a55b40','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','b7a69208-8267-44f7-b843-ff51b2482d07'),('1a6dbc1c-69eb-4e42-86d2-ba2fee28727b','1458ee77-9304-40e1-ab80-aa9780c5630a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('1a6e7313-5c58-494e-99dc-42c13a98b72b','64174de7-e444-4b4d-81c7-ea8f3cc49240','caf93aa4-de65-453e-be16-c0cef90ee421'),('1ac64955-806f-4ded-a0fb-01620155d901','cc40a0d1-2664-4982-8ef1-20594df5fc09','caf93aa4-de65-453e-be16-c0cef90ee421'),('1ae39119-9102-4fd1-81c6-c2a48d4883d0','e7211217-333a-4001-aac0-c2eac6288637','caf93aa4-de65-453e-be16-c0cef90ee421'),('1b0653db-ecb5-48c7-94c4-be87c9e93032','226539b9-6717-4de2-869f-a6bb046b9a18','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('1b4f7044-cd97-46b2-bf9f-ecbab75fc94e','c0979193-f268-404d-9d3c-da2211c24e02','cde96503-76da-440c-9d35-e9be21c70616'),('1b69db37-8cd4-4ea2-9462-cb029249086c','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','44daa961-ff04-4f9f-be57-4395508d1fdb'),('1b6f8fee-d190-499a-9545-f16e6acda29a','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('1c203a95-2acf-4ce2-89b7-aeac8eff8ffe','4e01f760-b4b6-4fbc-af4a-050559406a20','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('1c255673-cde6-4d21-81b3-38af9832897e','226539b9-6717-4de2-869f-a6bb046b9a18','fc3727ea-112c-4341-9589-f88b9321c227'),('1c32c430-8a16-4dde-ae7b-439f10a28b08','e7211217-333a-4001-aac0-c2eac6288637','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('1c5dbab0-d9a6-471a-b807-9fa9a14e615d','09e39da6-671e-4e13-8706-8025f14d128f','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('1ca8039c-cbe4-423e-a950-b6b7df003355','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('1ce91bb4-d42a-467b-b4fb-50a7b8a42639','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','cde96503-76da-440c-9d35-e9be21c70616'),('1d0a798c-926f-4e21-82af-4a91ad46ce90','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('1d241e0e-06c0-48ff-8068-7a40e027b44c','030303a4-eab5-4863-a257-317b6530a668','100a17da-6ea9-4c35-9f2b-159efb994713'),('1d671abe-372a-4344-bbba-b0e4383a3acf','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','b7a69208-8267-44f7-b843-ff51b2482d07'),('1d6b453c-fd75-46b8-8c70-64657ad4a7a0','230df099-e11a-4e1c-a151-8ba754e1d2a5','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('1db41e70-9d57-4bf8-9217-be899e2b597c','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','100a17da-6ea9-4c35-9f2b-159efb994713'),('1e024a8f-a9b5-4975-8800-fb186624927c','b5fb6b99-f329-408e-98d3-877fc898ab93','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('1e0dd9c9-4505-4a3b-a27e-596883c7dca3','030303a4-eab5-4863-a257-317b6530a668','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('1e395faa-a9a7-43ee-90e3-cd2af05aa2d0','423abd6b-c588-4e8d-9fbf-60e55c2b2a48','b7a69208-8267-44f7-b843-ff51b2482d07'),('1e3bafe8-319a-4ca3-a69d-c4c44a34437e','3a45d13b-18aa-4879-8460-e7d5315926f9','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('1e9b3d31-665f-4498-9b9b-8bbd1ee44941','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('1ead9aab-5209-40f3-b1cd-b4ffdf2c1507','15b8b234-338b-43e9-81e4-32c201ab330e','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('1ebb9f73-4a32-4e5d-bc49-d61a92169906','5893a799-cfd2-46c8-8ba4-56e7580ec143','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('1f05ed9e-6d06-4fd6-9230-17403b3d0417','6b73b416-a32d-40fb-a343-b570d2e8d2cc','44daa961-ff04-4f9f-be57-4395508d1fdb'),('1f751166-666c-4eb6-8945-0d0b953aafa9','a3502307-fe20-41ef-86d7-c0b3102e7371','44daa961-ff04-4f9f-be57-4395508d1fdb'),('1f864510-14ff-4c8a-b333-6d08c206ff3e','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','100a17da-6ea9-4c35-9f2b-159efb994713'),('1fb902aa-dc92-438c-b059-0b6156891cbc','4e01f760-b4b6-4fbc-af4a-050559406a20','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('1fc802e9-4234-4469-b0d7-f3d9847e5718','4c0911b3-22a5-4559-8dad-71de868a4cd6','fc3727ea-112c-4341-9589-f88b9321c227'),('1fc8419f-8955-4067-aaba-aafb5c96f16c','c0d6aeba-5e16-4965-afc2-7c38427e56a3','100a17da-6ea9-4c35-9f2b-159efb994713'),('1fdb848e-80c2-467b-bfc1-01ebb07ed9e4','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','fc3727ea-112c-4341-9589-f88b9321c227'),('1fea58f5-550b-4d5e-bf30-5cd561ab4649','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','100a17da-6ea9-4c35-9f2b-159efb994713'),('1ff7954a-e84d-444b-b57c-4fad3703195b','957391ad-b746-4313-9654-066c180afec7','b7a69208-8267-44f7-b843-ff51b2482d07'),('2011528b-66b3-4c76-9c6c-8bc5d3e2cfe3','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('201e6b9a-ee33-4959-8319-b8b669664fa8','e79ed356-8035-4687-9fe9-b3ddd2230deb','cde96503-76da-440c-9d35-e9be21c70616'),('205eefce-bea2-4688-a5c8-70e9c393c1d0','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('20cad481-fb6d-48ca-b4ae-1cd624ea071d','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('20ff0109-83c7-4a93-bd68-e7fa451f4d83','sadmin','08b9074e-1197-4dd3-b346-5dd8ee5db246'),('2118b206-154d-409b-83a1-9e2e0323516a','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('21326310-c015-45f9-84e7-da4a3897aeb7','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('214f551a-91c1-49d5-a03e-5518997c5c42','0a44ffa8-3870-472e-98fa-e33dbc7fc322','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('21f935f0-10a3-447d-8735-ff6679388286','c5a69b9c-441d-4456-9535-b0a72927ba6a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('22217dce-2bc2-41f9-bc53-63a95448cdce','b2e0785f-0e91-4643-aaeb-1d48363ef971','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('22229896-ae63-423b-b40a-8f98f51aaaee','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','44daa961-ff04-4f9f-be57-4395508d1fdb'),('2277a896-fde0-4222-b15a-03134ad2262c','49a45a15-addb-4296-902b-035635450bcd','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('229a5167-dabb-47b3-8229-ba1f33791fbd','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('22a833da-37bb-45ba-a3db-b81b32521291','2ecda9e6-d15a-4b98-8edb-233ed006cfec','100a17da-6ea9-4c35-9f2b-159efb994713'),('22b34d84-9ff9-4072-9055-6d0ffc7537ef','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('22d1da42-bc1c-4f80-939b-a4aa6e4a2309','c0d6aeba-5e16-4965-afc2-7c38427e56a3','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('22d39de8-85c6-4a61-894c-6c07a3b65a03','a2962b6a-e23b-49ae-b41a-991e7c769535','73f0a903-116f-4de9-9383-9971826ced54'),('22e8d227-fa19-4afd-9c5a-8a4370f59e5c','d8827eed-a8fe-4fc5-9a35-82a620e6c791','cde96503-76da-440c-9d35-e9be21c70616'),('23357b62-4f70-4894-8989-30ddd8a3bcf8','4ada79ea-e654-47fd-92a6-e8d32913a6a2','fc3727ea-112c-4341-9589-f88b9321c227'),('2337e524-3b1e-4af0-aa40-e4bc76301639','290e9538-0904-4e8d-8b56-c31ca4031d8b','822fed41-7169-4376-a254-b312f0c521fe'),('23dbc281-66a6-4e96-a913-ac0276cdd475','bbd2b239-1ef2-4f49-8d86-f3778126d282','cde96503-76da-440c-9d35-e9be21c70616'),('23dc5aff-7117-4958-a2fb-14cd3f53076f','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','caf93aa4-de65-453e-be16-c0cef90ee421'),('23f34330-ef70-4782-8e1f-2b6706e7a6a9','b5fb6b99-f329-408e-98d3-877fc898ab93','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('2402e783-b179-416d-9099-6ec5633169c1','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('2408586e-a2e2-4cdf-a22e-0b1af7c1bf79','354ad423-d455-481f-94e2-1b840d779842','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('2431b0d2-72fb-41b9-933c-ba179b3fb44e','5da09e50-1448-4275-bba9-2d135d086a53','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('2456095e-9c1a-40a9-a20e-acd5027a2de9','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('2489e4a0-e0f1-40cb-8970-50fedaadab39','539e1886-2308-407e-b664-09bb43e0ff2f','b7a69208-8267-44f7-b843-ff51b2482d07'),('2491adbd-8b1a-480d-8db7-da2871176183','f4615226-2034-4369-b6cb-0d5c579183cf','b7a69208-8267-44f7-b843-ff51b2482d07'),('249944a2-ab0b-422a-a3ab-e7ca6ace5436','7528587d-0d4f-4270-92ac-ef27b1b6263f','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('24c18563-9801-463c-ae1d-38f167729230','290e9538-0904-4e8d-8b56-c31ca4031d8b','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('24c89e43-720b-4765-9016-c808657449dc','cc40a0d1-2664-4982-8ef1-20594df5fc09','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('253781c4-1286-4780-93d9-60d63cd6b817','956a45a8-29cb-410a-942e-3ff7fe108ae0','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('253ae39d-b667-498d-8d0d-cc19993ce51f','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('259417ac-dabd-41e3-bdb3-c51232ce22c1','c20c3f03-7313-4d79-ac7b-88f210a5df01','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('25a5dc6c-90fc-4003-924a-85ae00c8e891','0ec2a9c8-4be9-4056-838c-86ea88178858','44daa961-ff04-4f9f-be57-4395508d1fdb'),('25be7c54-2d91-4995-a3a6-f3bbf6536b4c','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('25f1428a-3bd1-477e-9e81-edfc29a53e98','5893a799-cfd2-46c8-8ba4-56e7580ec143','44daa961-ff04-4f9f-be57-4395508d1fdb'),('2609cdf1-2ac9-4fc1-8627-a1b6e0a30ec4','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','cde96503-76da-440c-9d35-e9be21c70616'),('265d4cd9-accd-4477-bd96-1f46593351c4','cc40a0d1-2664-4982-8ef1-20594df5fc09','cde96503-76da-440c-9d35-e9be21c70616'),('26c5433a-9566-4bd6-ab64-04cb3971865a','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','caf93aa4-de65-453e-be16-c0cef90ee421'),('26cc31ed-9fc3-4923-a86a-797d08312b80','47929513-27e2-4b7f-9273-8e16b626df34','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('26cded5d-452a-4b46-a452-5e4cf02cbece','e79ed356-8035-4687-9fe9-b3ddd2230deb','100a17da-6ea9-4c35-9f2b-159efb994713'),('2701e937-d9fd-4ee4-95b4-717977d418db','bd164a0e-be77-4bfb-9283-ea711d9f7938','cde96503-76da-440c-9d35-e9be21c70616'),('27401826-97bc-4164-9554-e4b9eeb5327f','f1d97f93-c60b-4b8a-ac15-49d2112fb814','822fed41-7169-4376-a254-b312f0c521fe'),('278c1ebd-298f-4434-9da0-8bbca5ab4ab8','0fd38122-485d-4f0c-84be-65cbcfe1ffec','fc3727ea-112c-4341-9589-f88b9321c227'),('278f95a7-9604-4bb9-aa46-7ceeec2a122c','64ee63fe-0a0f-482d-9c16-b3c71c75761c','fc3727ea-112c-4341-9589-f88b9321c227'),('2819b954-ac6b-4dee-9205-34a494bd1cf8','007e2dab-1034-4577-a8b5-3efb0f793ae4','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('2853baf0-9563-455d-a70b-2d5e539faad8','7496836a-a18c-4db7-8df7-724c8df5b381','44daa961-ff04-4f9f-be57-4395508d1fdb'),('286126a7-5d25-428e-9077-90c0a456a66f','2ecda9e6-d15a-4b98-8edb-233ed006cfec','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('28668740-7b95-4cd5-bb0c-c059801d2646','f4615226-2034-4369-b6cb-0d5c579183cf','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('2873c56b-4cf8-4bb1-a181-f37f06e3d24a','b7dd1ca5-a5af-4ac7-946e-4cd93c6ba240','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('2876588f-38c9-4e46-83cb-a8da26b815f1','c0979193-f268-404d-9d3c-da2211c24e02','fc3727ea-112c-4341-9589-f88b9321c227'),('2898212d-a029-4619-bb21-fb1c0641f126','5d6b198e-7555-40a1-8105-aec7f144d719','b7a69208-8267-44f7-b843-ff51b2482d07'),('28983e22-4c84-4c35-8a48-73ea66eb1d84','e18c9a94-7064-4b5f-9a10-40041b7dd5de','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('28b05e98-99d4-4036-bf1b-500cfe01d920','7c76a2e6-fe7f-49c4-a128-236de5a2159e','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('2912d5a6-933a-41f0-8354-8c2d0688fe60','0cd308e4-ef0e-44cc-9547-a9999499e83a','caf93aa4-de65-453e-be16-c0cef90ee421'),('29316311-1e50-4595-a4b8-195071e904d5','f9a1bc16-714f-498f-a35a-405a77cc1366','44daa961-ff04-4f9f-be57-4395508d1fdb'),('299973c2-f3b0-4853-b34f-80f565e1108d','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('29a1ae01-6e07-480d-9273-20f2898e51c3','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','822fed41-7169-4376-a254-b312f0c521fe'),('2a42b451-3b4d-483d-85c8-d7dbf9ec7959','30c54bd0-5b3a-437e-a669-abb480c34af8','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('2add80b2-a09f-4c82-8b25-7d55e3fc36ca','daae65fc-3982-4f8b-aeff-75e0f238e559','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('2b119f9b-631b-49fd-8c66-284233170e0f','0a44ffa8-3870-472e-98fa-e33dbc7fc322','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('2bbe32dc-d93c-4ba3-9f6c-6065661aec8b','7c76a2e6-fe7f-49c4-a128-236de5a2159e','b7a69208-8267-44f7-b843-ff51b2482d07'),('2bd7efed-649b-4d94-b01d-0df09ea960e0','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('2bf21bc4-f099-4187-a2ed-039ccdfb8c82','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','fc3727ea-112c-4341-9589-f88b9321c227'),('2bff5a53-fd67-4c98-ae09-cb73fbc37c75','230df099-e11a-4e1c-a151-8ba754e1d2a5','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('2c503798-e880-4368-a194-d24a12785a22','0f487bc0-1123-416e-999a-fa97bc9e1946','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('2c68ffaa-3e6b-4aa4-bdf7-3c2461ff1281','bc78dda8-1a72-423e-85b1-fb5fe51bae76','fc3727ea-112c-4341-9589-f88b9321c227'),('2c7b49ac-c3ac-4adb-b8df-f3e34cc9b2eb','3216803b-9720-4af1-a034-7b64ac02f85a','cde96503-76da-440c-9d35-e9be21c70616'),('2cbb41d1-d5e6-459a-a5cc-d45113a35ddd','354ad423-d455-481f-94e2-1b840d779842','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('2cd71c4f-774b-45ea-b573-c0ba020fab5f','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','fc3727ea-112c-4341-9589-f88b9321c227'),('2d378212-741e-46f5-857d-4accb1ea8075','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','fc3727ea-112c-4341-9589-f88b9321c227'),('2e869203-2998-4340-ae45-fe176a12512c','0cd308e4-ef0e-44cc-9547-a9999499e83a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('2ea0a6e8-5297-4ab7-9c9c-11ef2acd8145','0ac16798-0637-449e-87ca-ce047ce3b567','44daa961-ff04-4f9f-be57-4395508d1fdb'),('2eaabd5f-fab8-4d56-9751-8294219122c4','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('2ebbc1bb-43c1-40c9-ad6f-f0c37dabb870','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('2ec470b2-ed0d-45f8-9993-1001c4b5d531','7528587d-0d4f-4270-92ac-ef27b1b6263f','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('2ec905e5-a67c-4064-9813-d898e669c36e','15b8b234-338b-43e9-81e4-32c201ab330e','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('2ed492ee-2432-492b-bacb-e11e62ee785a','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','44daa961-ff04-4f9f-be57-4395508d1fdb'),('2ee98ee8-6569-40e6-98a3-d70270901af6','e79ed356-8035-4687-9fe9-b3ddd2230deb','caf93aa4-de65-453e-be16-c0cef90ee421'),('2f311e1e-c588-4c7a-ad68-d4f4d80174f6','358374f1-3eab-4efd-99b9-28cceb3a354f','44daa961-ff04-4f9f-be57-4395508d1fdb'),('2f48d981-5906-437a-bee4-03a132e57e23','f1d97f93-c60b-4b8a-ac15-49d2112fb814','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('2f6cd883-5d8e-47cb-84a2-c82bd8409013','539e1886-2308-407e-b664-09bb43e0ff2f','100a17da-6ea9-4c35-9f2b-159efb994713'),('2f9db9e6-0cf8-40a8-b7eb-18fc14f15c47','5da09e50-1448-4275-bba9-2d135d086a53','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('2ff58155-a739-43fa-9f11-d6d2885977e2','c83e09a9-3394-4693-aee3-e896a6d31b0a','caf93aa4-de65-453e-be16-c0cef90ee421'),('30306acf-2ac4-425a-abbb-17718e707bb8','testuser1','M2'),('3062fb1e-726d-4b41-9c4a-40a43d876557','e7211217-333a-4001-aac0-c2eac6288637','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('306e6862-979b-4271-accd-6d51da509e43','faade522-325e-4d6a-9a0d-8df9e191682e','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('308e12f4-82c2-4ef8-bf90-19768ccf65cc','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('30cbc1ae-e306-475c-b7a6-5e732d10b49b','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','b7a69208-8267-44f7-b843-ff51b2482d07'),('30f4ddf2-d11e-4007-89aa-0c7343717adc','7c76a2e6-fe7f-49c4-a128-236de5a2159e','cde96503-76da-440c-9d35-e9be21c70616'),('31018d58-3f07-4fad-b314-ecdc4107ca7c','1458ee77-9304-40e1-ab80-aa9780c5630a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('310d87f0-6c4b-4131-8f72-e9ded3f98f12','64174de7-e444-4b4d-81c7-ea8f3cc49240','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('3186319b-7ae8-4325-8f19-4eb2bc72dc85','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('31a014ee-1b15-4cbd-b475-2cefaf9a4b5b','c5a69b9c-441d-4456-9535-b0a72927ba6a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('31b21432-3a39-40e3-b57f-cada15533ec7','f9a1bc16-714f-498f-a35a-405a77cc1366','fc3727ea-112c-4341-9589-f88b9321c227'),('31d6c3d2-c074-4e35-98b7-cd16f6e5a911','daae65fc-3982-4f8b-aeff-75e0f238e559','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('31ddeb79-c20c-49fa-8da0-bcc98ac915df','354ad423-d455-481f-94e2-1b840d779842','caf93aa4-de65-453e-be16-c0cef90ee421'),('31f35b78-b139-4c98-8c20-c36fae59114b','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('32024a6d-bbe9-42b1-b103-3e1b23822bd6','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','fc3727ea-112c-4341-9589-f88b9321c227'),('32027c0e-1db1-423c-9db4-2e20173755b1','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','caf93aa4-de65-453e-be16-c0cef90ee421'),('325b9754-2f8e-42d3-8e1a-161be6bab0d7','5da09e50-1448-4275-bba9-2d135d086a53','100a17da-6ea9-4c35-9f2b-159efb994713'),('325fe5cf-76d0-4944-928c-ed2c00de1dda','a3502307-fe20-41ef-86d7-c0b3102e7371','b7a69208-8267-44f7-b843-ff51b2482d07'),('3285f915-9211-4668-9158-d1d94f14c66e','c0d6aeba-5e16-4965-afc2-7c38427e56a3','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('32b51f28-33d0-455b-9b46-76cc28c27eb2','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','822fed41-7169-4376-a254-b312f0c521fe'),('32cbe5e5-c234-4627-b587-aeddce4225ee','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','caf93aa4-de65-453e-be16-c0cef90ee421'),('32ccc543-e059-4c38-9e02-27cb73c7b013','972754b2-d54d-4429-8e74-5153ccacd170','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('331e3b06-ee09-4fcc-8ce0-8338eb6c9bce','7528587d-0d4f-4270-92ac-ef27b1b6263f','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('332931fc-af46-42ef-9810-2444d38d202d','4c0911b3-22a5-4559-8dad-71de868a4cd6','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('3332a2fa-ad53-4321-bb34-6733ac890842','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('33770d69-da97-4ebe-82c8-72eadc22d10b','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('33a8cd84-7f86-4f99-91eb-02f011418b83','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','b7a69208-8267-44f7-b843-ff51b2482d07'),('3427fbac-6de8-4a49-9ed5-3e47f3784322','290e9538-0904-4e8d-8b56-c31ca4031d8b','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('34472e6d-6c40-4fb9-8dc5-81373b0ccd05','64ee63fe-0a0f-482d-9c16-b3c71c75761c','b7a69208-8267-44f7-b843-ff51b2482d07'),('3453abf1-ccd5-44bc-ada0-9345dfd9a1e3','b2e0785f-0e91-4643-aaeb-1d48363ef971','caf93aa4-de65-453e-be16-c0cef90ee421'),('3483a96d-9d28-4fb3-9729-09df11136252','c5a69b9c-441d-4456-9535-b0a72927ba6a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('348a58c8-5ced-44b6-9aeb-08055bffc28c','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','44daa961-ff04-4f9f-be57-4395508d1fdb'),('34ea00b3-6dc1-4ca0-bdbf-76269e2aa44d','26fff4b7-6aef-4da5-94f6-a1a06df329e4','100a17da-6ea9-4c35-9f2b-159efb994713'),('352f3f7a-36d0-40a6-bc12-b341a8bb2bb3','bbd2b239-1ef2-4f49-8d86-f3778126d282','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('355c7a7e-710f-4e6b-a0ac-055f62bf1f6e','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('357b780a-99db-44bd-925f-c182849d39d5','e9a93e86-d156-483d-b84b-90e9654fb0ea','b7a69208-8267-44f7-b843-ff51b2482d07'),('359a7598-773c-4ff7-9500-5571eed4d39c','15b8b234-338b-43e9-81e4-32c201ab330e','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('35a9871b-0b25-4937-833c-c94f788db117','c5a69b9c-441d-4456-9535-b0a72927ba6a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('35ec6e27-9959-4ab2-b887-1bd1563a3e43','6be10468-c5cc-446e-951d-11ad5048f01f','44daa961-ff04-4f9f-be57-4395508d1fdb'),('36724fae-cd2a-4d54-aaf6-521a0e92346f','0cd308e4-ef0e-44cc-9547-a9999499e83a','cde96503-76da-440c-9d35-e9be21c70616'),('367a6541-506f-4ce7-93d2-b912c987b67c','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('36c163ab-a336-4de1-b0cd-224b82b9ab82','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('36ddcdac-ba16-4f7b-ab04-14647f8ff414','64ee63fe-0a0f-482d-9c16-b3c71c75761c','100a17da-6ea9-4c35-9f2b-159efb994713'),('36ffed77-4fdd-40f4-be2b-c7d71fb6ab00','2e860c1d-fad7-4d34-92de-b31b0735c573','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('37096509-6fc7-4fd6-935b-7e6cee57edb6','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','cde96503-76da-440c-9d35-e9be21c70616'),('371c2597-75c6-45fa-a140-56fcff5473c3','1458ee77-9304-40e1-ab80-aa9780c5630a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('37329c7c-c0d4-40e0-b4cd-257771d81a4b','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('375d7071-11af-48a5-8575-d3dfa3d358ae','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','fc3727ea-112c-4341-9589-f88b9321c227'),('377410b7-2ecf-4a79-aa52-45a3eda500b5','1458ee77-9304-40e1-ab80-aa9780c5630a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('37979112-7612-428d-a86e-c6200a80de36','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('37c53a38-351d-4b69-bb48-8b24203cea82','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('380a705b-d6e0-4530-b759-226b8aa435e6','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('380a97cc-011d-432f-87eb-00619c4291ee','f1d97f93-c60b-4b8a-ac15-49d2112fb814','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('381004ec-39bc-4653-9378-f2271613949e','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('382237e4-2900-4b16-888b-f4a9caa688cf','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('38656cf5-8add-4379-b64a-a61ca5fea3d3','62181cbe-506f-4ada-90c3-f32828c9776e','822fed41-7169-4376-a254-b312f0c521fe'),('386e516b-e4b6-4230-8059-9d8b60334883','2ecda9e6-d15a-4b98-8edb-233ed006cfec','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('388b67f0-00f7-413c-94cc-24bf79b4a2d0','226539b9-6717-4de2-869f-a6bb046b9a18','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('38c8ee1d-5048-4f12-8dbb-b6bf7db3b824','6be10468-c5cc-446e-951d-11ad5048f01f','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('38d3ff1f-5a69-46ad-82be-33a3dc751dcb','c5a69b9c-441d-4456-9535-b0a72927ba6a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('38dadb36-5762-4fda-a6cd-c807331594ba','f780967f-f851-4ea8-8eda-23430e122a43','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('38dfc480-6979-4b64-85d2-08d7c72bdeb5','c20c3f03-7313-4d79-ac7b-88f210a5df01','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('38f1f679-1c28-4897-868a-4fe5a9ecce1b','cc40a0d1-2664-4982-8ef1-20594df5fc09','100a17da-6ea9-4c35-9f2b-159efb994713'),('39031a0f-ac66-49eb-8c84-5d91fefbfa65','9aada076-b566-4d5d-9941-3004d5d07f92','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('39094c45-cea9-40d4-9392-bf3f477846c2','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('391c5966-1304-475c-b105-5d93374e3f23','eddac9b7-391b-4ec6-8a29-7ef9046ba796','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('39307e78-90b1-4654-90cf-647f22487472','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','fc3727ea-112c-4341-9589-f88b9321c227'),('398eb8a4-2bea-4cbf-9ec0-11c9dc233b34','e9a93e86-d156-483d-b84b-90e9654fb0ea','100a17da-6ea9-4c35-9f2b-159efb994713'),('39ae87fd-0cfc-42af-9d46-e57600a7077e','0a44ffa8-3870-472e-98fa-e33dbc7fc322','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('39ba1b2b-1fa9-43ce-86fd-9dc221b81526','64ee63fe-0a0f-482d-9c16-b3c71c75761c','822fed41-7169-4376-a254-b312f0c521fe'),('39e3e5ad-6d9f-4f78-ad47-a05a69a036ff','10689571-a849-4a3d-8eb7-6fc74cd4477b','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('3a0d319c-1b48-49c4-9b00-b941f3b086bc','7496836a-a18c-4db7-8df7-724c8df5b381','822fed41-7169-4376-a254-b312f0c521fe'),('3a5da43f-00cf-446b-bcd5-f1aa50323140','7496836a-a18c-4db7-8df7-724c8df5b381','9998e975-7961-4dee-8f85-e9f57eee4e03'),('3a9637a0-6240-4be1-b761-a1bd1a66cb3a','2e860c1d-fad7-4d34-92de-b31b0735c573','fc3727ea-112c-4341-9589-f88b9321c227'),('3b1daed1-06d5-42dd-9551-b33b3f4f1fe9','62181cbe-506f-4ada-90c3-f32828c9776e','fc3727ea-112c-4341-9589-f88b9321c227'),('3b6a0f0d-8a73-4e90-a431-73e891dc1ff4','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('3b6f0724-ba05-49cc-a262-eb9ffbe573e2','e9a93e86-d156-483d-b84b-90e9654fb0ea','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('3c093c3e-0f57-4c08-8fe6-24399a299196','sadmin','ebdb7820-c67f-4298-a7c5-3b9bc65a4ef7'),('3c0c9834-6f69-4fd6-a72f-1039f87de598','290e9538-0904-4e8d-8b56-c31ca4031d8b','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('3c53a900-4ad9-42dc-81b2-d04cf214135f','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('3c669b19-a5b9-4118-9031-c2dc11ada708','c83e09a9-3394-4693-aee3-e896a6d31b0a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('3c749a0e-e193-470f-a851-61c03d851623','5da09e50-1448-4275-bba9-2d135d086a53','cde96503-76da-440c-9d35-e9be21c70616'),('3ca6d310-00d1-4cad-b71c-1e468bc89dd5','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','caf93aa4-de65-453e-be16-c0cef90ee421'),('3cc80034-7805-4118-9ff7-b9bcc5e37e2e','bd164a0e-be77-4bfb-9283-ea711d9f7938','b7a69208-8267-44f7-b843-ff51b2482d07'),('3cd5286b-7a35-4360-8bfe-a5581579565d','4c0911b3-22a5-4559-8dad-71de868a4cd6','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('3ceba737-d453-4c84-ad5d-31ce280289b9','09e39da6-671e-4e13-8706-8025f14d128f','100a17da-6ea9-4c35-9f2b-159efb994713'),('3cfd92e1-6e26-4355-a2f5-170a191dd261','972754b2-d54d-4429-8e74-5153ccacd170','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('3d079715-d240-4c38-aad9-38efc2a88012','f780967f-f851-4ea8-8eda-23430e122a43','b7a69208-8267-44f7-b843-ff51b2482d07'),('3d0d7889-d932-45f2-bc49-1072168119ac','bbd2b239-1ef2-4f49-8d86-f3778126d282','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('3d12fef9-c368-4cc6-8b8a-88e16d9dd858','2e860c1d-fad7-4d34-92de-b31b0735c573','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('3d225b7c-49ee-47c9-b061-0ed639b87154','f9a1bc16-714f-498f-a35a-405a77cc1366','b7a69208-8267-44f7-b843-ff51b2482d07'),('3d26230d-28bd-4e99-b8de-183831017e92','956a45a8-29cb-410a-942e-3ff7fe108ae0','cde96503-76da-440c-9d35-e9be21c70616'),('3d39172d-3d83-479f-8dc8-c2ec74158197','cc40a0d1-2664-4982-8ef1-20594df5fc09','b7a69208-8267-44f7-b843-ff51b2482d07'),('3d45b3bc-4cc4-421d-9e06-496a2689e6af','260f71fa-1d2e-48f6-a672-e2ce857097e5','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('3d8b8bd7-b802-4c73-8b58-6a26dddc65fe','2acb3df6-f623-4c6b-8a88-ad97b2b64722','caf93aa4-de65-453e-be16-c0cef90ee421'),('3dd8dcac-8c08-4b88-9503-5dfd8c6c516e','bc78dda8-1a72-423e-85b1-fb5fe51bae76','100a17da-6ea9-4c35-9f2b-159efb994713'),('3df30b41-622f-40d8-b2cd-be857820c50a','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('3e148879-9563-4584-ba79-96beffb19453','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('3e1fdbe4-a8f7-427f-b541-ed9440cd7359','64174de7-e444-4b4d-81c7-ea8f3cc49240','822fed41-7169-4376-a254-b312f0c521fe'),('3e484b90-1692-4ab3-9550-5ada17522169','c0d6aeba-5e16-4965-afc2-7c38427e56a3','822fed41-7169-4376-a254-b312f0c521fe'),('3e78b72f-eae6-4bb9-a1e2-8e695f133763','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('3e906247-c14b-4559-a567-b22f5367ae37','6b73b416-a32d-40fb-a343-b570d2e8d2cc','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('3ec673c5-6548-42f7-938d-6a62afa3739c','9aada076-b566-4d5d-9941-3004d5d07f92','44daa961-ff04-4f9f-be57-4395508d1fdb'),('3ef9a55c-4316-489b-854a-c3727bc0f719','bc78dda8-1a72-423e-85b1-fb5fe51bae76','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('3f20dad7-366e-4600-ab28-4e1ca813aa55','0a44ffa8-3870-472e-98fa-e33dbc7fc322','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('3f3c460b-38a4-4344-9a74-01bfd2d057ae','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('3f4897e5-2516-47ed-b72f-4a03cfb87627','956a45a8-29cb-410a-942e-3ff7fe108ae0','b7a69208-8267-44f7-b843-ff51b2482d07'),('3f4a5250-61eb-451f-a790-5131c092c87d','4e01f760-b4b6-4fbc-af4a-050559406a20','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('3f998451-ed58-407c-aa88-972219b88364','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','cde96503-76da-440c-9d35-e9be21c70616'),('3fdfb758-b652-4620-bc7e-47113072452a','09e39da6-671e-4e13-8706-8025f14d128f','cde96503-76da-440c-9d35-e9be21c70616'),('403744c4-1aa0-4238-8a4f-28592d947f02','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','cde96503-76da-440c-9d35-e9be21c70616'),('404b1b7c-503c-4ca6-9d93-996c3c14807b','faade522-325e-4d6a-9a0d-8df9e191682e','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('404e30a1-2566-4aca-ba3b-b88d975952e8','49a45a15-addb-4296-902b-035635450bcd','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('408ec200-850c-40a5-90d8-b87accb2503c','2acb3df6-f623-4c6b-8a88-ad97b2b64722','b7a69208-8267-44f7-b843-ff51b2482d07'),('40a3fb06-be05-4873-b3af-a4e2c5086149','007e2dab-1034-4577-a8b5-3efb0f793ae4','44daa961-ff04-4f9f-be57-4395508d1fdb'),('40b99086-8929-4c36-986b-78f46450c3ea','49a45a15-addb-4296-902b-035635450bcd','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('40da6f4c-ed63-4c35-8241-5469b7792d9f','f9a1bc16-714f-498f-a35a-405a77cc1366','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('40edd7aa-b97b-4bb3-b611-7e3cf6d8914c','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','cde96503-76da-440c-9d35-e9be21c70616'),('412fda3a-d3d0-42c2-bc4f-5121494f14ce','d8827eed-a8fe-4fc5-9a35-82a620e6c791','44daa961-ff04-4f9f-be57-4395508d1fdb'),('415a436e-8733-4df3-8ad0-28ae9d1f03e9','62181cbe-506f-4ada-90c3-f32828c9776e','44daa961-ff04-4f9f-be57-4395508d1fdb'),('41a4a3b4-b572-43eb-a43d-58309abbbb51','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('41cf9b16-538b-484e-b6ab-03075006fcf7','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('42071def-80ec-4c63-a9e9-41d4cd88f1e0','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('42305e63-69de-47b2-a9e9-d1ca02a81dff','c83e09a9-3394-4693-aee3-e896a6d31b0a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('424c68f5-5db7-4ebf-9099-ddb33790fb81','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('4263d6ef-e843-4700-89d2-71471bbac870','354ad423-d455-481f-94e2-1b840d779842','100a17da-6ea9-4c35-9f2b-159efb994713'),('42870f92-8a70-44f1-ba08-a520baaf2fc5','5da09e50-1448-4275-bba9-2d135d086a53','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('42871829-d029-4bda-b3c7-21e74006c119','230df099-e11a-4e1c-a151-8ba754e1d2a5','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('42aa78b4-36d8-4e7a-9b31-f6bb1f35f1e1','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('42b5bddd-d409-488d-9b1d-ab837bd3bd7e','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','100a17da-6ea9-4c35-9f2b-159efb994713'),('42e6d5bf-3860-4d00-9693-a6e04c777641','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('436cf707-350a-4c49-959e-73181f802e31','49a45a15-addb-4296-902b-035635450bcd','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('438ca72d-9e47-4846-9e34-92a827365bab','6b73b416-a32d-40fb-a343-b570d2e8d2cc','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('43aa5ab3-a9df-49c6-9543-9f509823adc8','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('43b362f5-4bc4-4f23-b455-8e32ab394e1c','972754b2-d54d-4429-8e74-5153ccacd170','cde96503-76da-440c-9d35-e9be21c70616'),('43c87a51-3956-4fe8-b872-3358dff5bce7','b2e0785f-0e91-4643-aaeb-1d48363ef971','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('43f9802f-cce9-440b-b47a-fb4a574500ad','c5a69b9c-441d-4456-9535-b0a72927ba6a','100a17da-6ea9-4c35-9f2b-159efb994713'),('4402db32-f08d-47dc-a2a8-41b2aadc73f8','a2962b6a-e23b-49ae-b41a-991e7c769535','3b00194b-ea54-43a5-a2ef-08e8602c75b0'),('44170cc7-a87f-48ab-b270-9f61f0302270','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('441eeb66-03ed-429c-bffa-00b6a6c80af9','358374f1-3eab-4efd-99b9-28cceb3a354f','100a17da-6ea9-4c35-9f2b-159efb994713'),('441f1625-acff-4cf1-b26f-d08b5439438f','007e2dab-1034-4577-a8b5-3efb0f793ae4','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('447c5dca-77ed-4765-96d2-39dafcd735c2','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','caf93aa4-de65-453e-be16-c0cef90ee421'),('44c15327-da3f-4e97-9163-87434dd7296e','64ee63fe-0a0f-482d-9c16-b3c71c75761c','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('44cb1f26-9f1f-4959-8b3c-e95654c3071a','7c76a2e6-fe7f-49c4-a128-236de5a2159e','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('45004191-0dfc-4936-9597-e7b922881dd4','0f487bc0-1123-416e-999a-fa97bc9e1946','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('451797e6-be3e-450c-98ee-a3e2bae8bcd2','d8827eed-a8fe-4fc5-9a35-82a620e6c791','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('451c2d72-3ced-4484-9f1b-33f03deb5db7','c0979193-f268-404d-9d3c-da2211c24e02','822fed41-7169-4376-a254-b312f0c521fe'),('45486c72-564e-4b3a-90de-f6b5146ef10c','09e39da6-671e-4e13-8706-8025f14d128f','822fed41-7169-4376-a254-b312f0c521fe'),('455f3ad3-93fa-434a-b735-760b241457e7','bc78dda8-1a72-423e-85b1-fb5fe51bae76','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('459e241c-d2f0-4028-9b14-6b76957f77e5','4e01f760-b4b6-4fbc-af4a-050559406a20','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('45bada6a-2244-4ec5-b5bb-905e8f6712db','2ecda9e6-d15a-4b98-8edb-233ed006cfec','fc3727ea-112c-4341-9589-f88b9321c227'),('45d1ce00-054d-4918-9862-5eccb4a77cbf','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('45f5b117-d857-4fbf-be0e-9ccb1770ad44','290e9538-0904-4e8d-8b56-c31ca4031d8b','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('46013fb3-c381-4c54-8fb5-619b545acb91','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','44daa961-ff04-4f9f-be57-4395508d1fdb'),('4619f9b7-ce92-4b34-87d4-10b41f25e07d','c83e09a9-3394-4693-aee3-e896a6d31b0a','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('46211f19-3b53-481b-9de3-a13819fb0e16','f1d97f93-c60b-4b8a-ac15-49d2112fb814','100a17da-6ea9-4c35-9f2b-159efb994713'),('462e9b23-9538-4a30-98ec-98a6f5ceac8d','290e9538-0904-4e8d-8b56-c31ca4031d8b','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('4635e595-8b5b-4cf3-87ae-aa94bec975bd','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('46631740-226a-43f8-8eaa-d82223dc5045','1458ee77-9304-40e1-ab80-aa9780c5630a','100a17da-6ea9-4c35-9f2b-159efb994713'),('467b343c-4394-4c26-bc38-ff3223aaea91','5d6b198e-7555-40a1-8105-aec7f144d719','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('4685909a-5a91-44da-9c21-ccabf0eff154','b5fb6b99-f329-408e-98d3-877fc898ab93','caf93aa4-de65-453e-be16-c0cef90ee421'),('46ced510-3294-4047-a74b-a5b4eb5f2e5f','957391ad-b746-4313-9654-066c180afec7','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('46dff2e8-25c7-43e9-9c60-22107a0996b2','7496836a-a18c-4db7-8df7-724c8df5b381','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('470b1335-7cdb-4a84-a018-6b93b3754f5b','1458ee77-9304-40e1-ab80-aa9780c5630a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('476d20c9-ff56-45e8-8e6a-175e490eff52','4ada79ea-e654-47fd-92a6-e8d32913a6a2','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('47822319-184a-4c88-8bca-e806cea99f5c','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','b7a69208-8267-44f7-b843-ff51b2482d07'),('47880f22-a472-4e59-9eda-b772b97afacf','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('47a05f2f-e094-441d-9a75-945f34af83cb','b2e0785f-0e91-4643-aaeb-1d48363ef971','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('47ec177e-d197-4811-9309-9feeb740d395','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('47eeeb43-8e52-4cca-b4f8-079489f2b2cf','6e767cf7-52e4-4010-91d3-f247654fb567','fc3727ea-112c-4341-9589-f88b9321c227'),('47f21a9d-449b-42fc-a931-e01904c639a2','49a45a15-addb-4296-902b-035635450bcd','44daa961-ff04-4f9f-be57-4395508d1fdb'),('48a8d631-bb62-4659-8e58-74fef74b4dde','2ecda9e6-d15a-4b98-8edb-233ed006cfec','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('48d0ec81-9382-405d-b9c6-2841f4e53baf','64ee63fe-0a0f-482d-9c16-b3c71c75761c','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('48d9439b-ecaa-418c-a19e-5f5692463640','354ad423-d455-481f-94e2-1b840d779842','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('48e69a9c-1926-413b-ba18-886b06c80318','f9a1bc16-714f-498f-a35a-405a77cc1366','44daa961-ff04-4f9f-be57-4395508d1fdb'),('48f8a16f-dd8e-4ecf-87b9-ee056bb5ccc5','a3502307-fe20-41ef-86d7-c0b3102e7371','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('48faa33d-0281-4813-ab40-00c8fec4c1a0','0cd308e4-ef0e-44cc-9547-a9999499e83a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('491dabf2-4d7a-4960-bb26-0c8e4cad2976','testuser1','M2'),('49abee46-fd6d-4acc-bcb6-52b3137afb01','f9a1bc16-714f-498f-a35a-405a77cc1366','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('49c5e9c4-d006-4300-889b-1bdccdde824d','972754b2-d54d-4429-8e74-5153ccacd170','44daa961-ff04-4f9f-be57-4395508d1fdb'),('49fbcbe0-2604-45bb-9cf7-9fe645f537d3','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','cde96503-76da-440c-9d35-e9be21c70616'),('4a0243c3-1f06-43c9-ad3f-3af02850c9da','79cb6076-338d-4c32-859a-9ac932b22ccf','cde96503-76da-440c-9d35-e9be21c70616'),('4a3c8b58-fcf7-4a5b-b1fa-78b24cca9ad0','956a45a8-29cb-410a-942e-3ff7fe108ae0','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('4a5bfe2b-26a1-42f1-935e-238d89735ade','c5a69b9c-441d-4456-9535-b0a72927ba6a','cde96503-76da-440c-9d35-e9be21c70616'),('4a606a41-8daf-4c9d-8777-cb37890e02d5','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','fc3727ea-112c-4341-9589-f88b9321c227'),('4ad78e5a-376f-4cfc-bbae-581c29ebd71b','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('4ad8a1fa-e7e4-48be-bf9a-83e1c9de3d7c','15b8b234-338b-43e9-81e4-32c201ab330e','44daa961-ff04-4f9f-be57-4395508d1fdb'),('4aeeff00-10af-43a6-a229-5970db3e6fc2','18503716-be18-465d-becc-7aca1ad01081','b7a69208-8267-44f7-b843-ff51b2482d07'),('4b3f3ee7-dabe-4c2b-aaeb-7d24644ba8a8','15b8b234-338b-43e9-81e4-32c201ab330e','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('4b5546ae-ba21-4e5e-b7ba-3286fc4d570e','3a45d13b-18aa-4879-8460-e7d5315926f9','9998e975-7961-4dee-8f85-e9f57eee4e03'),('4b7253d9-acb4-4d2d-81b8-501cb9f1f5c1','4c0911b3-22a5-4559-8dad-71de868a4cd6','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('4b81bfb6-f8b2-4c9b-8894-c9470f0dfb31','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','100a17da-6ea9-4c35-9f2b-159efb994713'),('4bd7d0e4-c701-42cc-a2e0-65e80c04e7ea','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('4c218c87-5c3e-4ec7-9ba8-0abbf40f2cde','6be10468-c5cc-446e-951d-11ad5048f01f','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('4c24c4d6-97f2-4dfd-b47b-e5e41425bf4f','358374f1-3eab-4efd-99b9-28cceb3a354f','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('4c26bae5-0a73-4c13-9a32-624c05a532b4','e79ed356-8035-4687-9fe9-b3ddd2230deb','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('4c3bc858-9313-423f-ad1a-7c38f3800987','0a44ffa8-3870-472e-98fa-e33dbc7fc322','822fed41-7169-4376-a254-b312f0c521fe'),('4c446b2d-0ab1-4611-8b7c-6bea48d92bb4','0fd38122-485d-4f0c-84be-65cbcfe1ffec','caf93aa4-de65-453e-be16-c0cef90ee421'),('4c70a643-c85c-43ad-8223-a4bec986133a','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','fc3727ea-112c-4341-9589-f88b9321c227'),('4cb9ff54-fc96-4639-b5f7-9d4a090ed0f1','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('4ccea6f6-98aa-48d0-90fc-2377fc585820','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('4d1d1df5-1993-4028-9a73-1c3b95798b09','e7211217-333a-4001-aac0-c2eac6288637','cde96503-76da-440c-9d35-e9be21c70616'),('4d2ea1bd-38a1-4fe5-9a6c-8220cb46cb1b','f9a1bc16-714f-498f-a35a-405a77cc1366','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('4d7fcd1d-5711-47f7-985d-638afba96923','cc40a0d1-2664-4982-8ef1-20594df5fc09','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('4d82d00d-131e-4971-a5e5-08997862c434','6e767cf7-52e4-4010-91d3-f247654fb567','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('4d89d2e0-b5ac-4ee0-94a3-bf6a0f7ccfcf','0a44ffa8-3870-472e-98fa-e33dbc7fc322','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('4d98bf87-3777-4ac4-9a48-b69c604afa8a','5d6b198e-7555-40a1-8105-aec7f144d719','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('4da97054-8ba9-480f-8729-13218ee7f9c5','260f71fa-1d2e-48f6-a672-e2ce857097e5','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('4dab519b-3e92-4f93-a505-cf5030a6aff5','9aada076-b566-4d5d-9941-3004d5d07f92','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('4dba643d-7c05-4139-b3c4-ffbccc635a90','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('4de4658a-425a-4a09-b9ce-131d6384ed86','5da09e50-1448-4275-bba9-2d135d086a53','44daa961-ff04-4f9f-be57-4395508d1fdb'),('4e046425-8298-40f5-a5b2-808507faeac9','bbd2b239-1ef2-4f49-8d86-f3778126d282','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('4e307a03-00c0-4789-a428-d40763957b94','b5fb6b99-f329-408e-98d3-877fc898ab93','44daa961-ff04-4f9f-be57-4395508d1fdb'),('4e405a1f-cc3c-4c63-9104-feea3b30f86f','15b8b234-338b-43e9-81e4-32c201ab330e','fc3727ea-112c-4341-9589-f88b9321c227'),('4ec87569-7362-4ef0-90f9-64a50f7a066d','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','100a17da-6ea9-4c35-9f2b-159efb994713'),('4ef31e05-050a-4807-a856-b6c9cc9a9b24','4e01f760-b4b6-4fbc-af4a-050559406a20','100a17da-6ea9-4c35-9f2b-159efb994713'),('4f2f93ca-6bea-4518-9352-f748c1a3784b','0ec2a9c8-4be9-4056-838c-86ea88178858','fc3727ea-112c-4341-9589-f88b9321c227'),('4fb175fe-73d0-40ae-a346-bd9c589f5cc5','64174de7-e444-4b4d-81c7-ea8f3cc49240','9998e975-7961-4dee-8f85-e9f57eee4e03'),('50003f67-fd74-4fd8-bc61-681f713bb39b','2e860c1d-fad7-4d34-92de-b31b0735c573','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('50248838-9b23-4e65-b5a1-c8d98097099f','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('5044d7a6-5d04-48c1-9e7e-cd3bf9802dc5','290e9538-0904-4e8d-8b56-c31ca4031d8b','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('50844e00-bed7-43e1-b3f3-6c80f9897352','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('513d9622-4daa-4bb8-a52b-e3082dff47a1','5893a799-cfd2-46c8-8ba4-56e7580ec143','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('5183e861-123c-4770-8b04-e72143e8a82a','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('51af961f-64d4-455d-91ba-6607d4e97f36','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('52036f7b-a1c9-4318-ac36-88d79d9e24dc','eddac9b7-391b-4ec6-8a29-7ef9046ba796','100a17da-6ea9-4c35-9f2b-159efb994713'),('524ddd35-01aa-487c-9c42-b87f34fab59e','49a45a15-addb-4296-902b-035635450bcd','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('526d1ad7-22e0-4aba-9d74-bd6fbc3b5687','7496836a-a18c-4db7-8df7-724c8df5b381','100a17da-6ea9-4c35-9f2b-159efb994713'),('526def8b-d899-4bd3-85bc-a3ac3218b07c','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','b7a69208-8267-44f7-b843-ff51b2482d07'),('527dc13c-7418-4b9b-bb9d-48310b67cd00','0ec2a9c8-4be9-4056-838c-86ea88178858','cde96503-76da-440c-9d35-e9be21c70616'),('52ec040b-77d2-41b4-bd2a-1df3d4794091','f83d2f8e-a8ea-421f-b32f-bc517c9e69d1','3d6d5269-70c5-4c8d-9a05-542c7768922d'),('53013890-315f-49c7-a8f2-ffe5ac5ff969','4a217f22-0e91-41f4-8f73-30419ee6f396','b7a69208-8267-44f7-b843-ff51b2482d07'),('530d9b1c-c6a6-4840-a708-127fd2d845a7','f4615226-2034-4369-b6cb-0d5c579183cf','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('535bf16b-bcdf-4011-a5ab-9db81708e5a8','df32d0dd-aa61-44d8-92ef-d63c009626b5','822fed41-7169-4376-a254-b312f0c521fe'),('53b41b81-4034-4832-bd66-8758521047ec','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','cde96503-76da-440c-9d35-e9be21c70616'),('53b41bb7-1df0-4add-b17f-74a759b3a5fc','e9a93e86-d156-483d-b84b-90e9654fb0ea','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('53eec202-de5c-445f-ae2d-1eda6d4635c4','423abd6b-c588-4e8d-9fbf-60e55c2b2a48','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('54097339-3acb-442d-bc24-0e8e7d3e9911','3a45d13b-18aa-4879-8460-e7d5315926f9','44daa961-ff04-4f9f-be57-4395508d1fdb'),('545873c3-6fc2-4a3c-91ac-ebd6ed758569','0ac16798-0637-449e-87ca-ce047ce3b567','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('54aad88f-e46a-4201-b7b7-2fa093e31fb2','a3502307-fe20-41ef-86d7-c0b3102e7371','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('54c5ed54-651b-44d7-bb0a-238c3bbe9ec1','30c54bd0-5b3a-437e-a669-abb480c34af8','cde96503-76da-440c-9d35-e9be21c70616'),('54d10b2f-1395-4a67-a217-a0ab6704021f','5893a799-cfd2-46c8-8ba4-56e7580ec143','fc3727ea-112c-4341-9589-f88b9321c227'),('54e7a809-1464-4cba-bfb5-204568f1a493','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('54fe8364-322b-4c5f-9d02-02d46d835410','7496836a-a18c-4db7-8df7-724c8df5b381','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('558c427e-ab29-4691-8854-97531277bf1b','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','caf93aa4-de65-453e-be16-c0cef90ee421'),('559b8a1f-5516-4e05-b8f0-30a7982e381d','9128ece7-28e2-4467-a346-3d53646be8e2','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('55a5e5c6-c0b5-4b02-89bd-60e83c9d4e30','df32d0dd-aa61-44d8-92ef-d63c009626b5','100a17da-6ea9-4c35-9f2b-159efb994713'),('55d675d5-edf7-4ba0-96ac-3ce0eb1f397d','956a45a8-29cb-410a-942e-3ff7fe108ae0','fc3727ea-112c-4341-9589-f88b9321c227'),('5604db47-847c-4073-b803-199d1a8dd8b7','5d6b198e-7555-40a1-8105-aec7f144d719','cde96503-76da-440c-9d35-e9be21c70616'),('56058460-5d88-49f0-8ef9-2213f0290886','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','100a17da-6ea9-4c35-9f2b-159efb994713'),('562c71d4-999e-41f1-834f-9184e0326359','f4615226-2034-4369-b6cb-0d5c579183cf','100a17da-6ea9-4c35-9f2b-159efb994713'),('5654b5de-f9f2-40e8-b6af-9e36cc583d46','c0979193-f268-404d-9d3c-da2211c24e02','100a17da-6ea9-4c35-9f2b-159efb994713'),('5671d5a4-6692-45ab-8624-8e2820230a0b','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('56a8e440-7785-4f96-9d70-336c20df76d4','f9a1bc16-714f-498f-a35a-405a77cc1366','822fed41-7169-4376-a254-b312f0c521fe'),('571853cb-833d-4171-bb8c-c228e5ea249b','c83e09a9-3394-4693-aee3-e896a6d31b0a','100a17da-6ea9-4c35-9f2b-159efb994713'),('573e439d-6015-4226-b17c-4d72ddc97a0e','0ec2a9c8-4be9-4056-838c-86ea88178858','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('57586ffe-0593-45a5-82a3-2f24bbc3b5c2','972754b2-d54d-4429-8e74-5153ccacd170','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('57643e3e-bf53-40a4-a8f0-c8094e07d727','7496836a-a18c-4db7-8df7-724c8df5b381','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('5790b4dc-b26a-4289-b67d-1b063b2ee55c','0a44ffa8-3870-472e-98fa-e33dbc7fc322','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('57c2d9d9-5c7a-441e-88fe-5b00258e90fb','7024dee8-59ff-4132-b472-07fc6dc62457','100a17da-6ea9-4c35-9f2b-159efb994713'),('57f96f65-97e1-4278-af15-6f926282a098','bd164a0e-be77-4bfb-9283-ea711d9f7938','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('5839b94e-267d-43c4-b112-12a083c40f3d','0ec2a9c8-4be9-4056-838c-86ea88178858','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('585f7324-f6f7-4e8f-9c10-0eb064d3f1fb','1458ee77-9304-40e1-ab80-aa9780c5630a','caf93aa4-de65-453e-be16-c0cef90ee421'),('5898687c-bd2c-44c0-8f87-9ad7a110c7eb','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','caf93aa4-de65-453e-be16-c0cef90ee421'),('58c63202-bb2c-4aa8-accb-8943ae8dbef1','26eb3ddd-6117-4ba7-9df4-9dc823d5c218','b7a69208-8267-44f7-b843-ff51b2482d07'),('59475bee-1e96-4188-bc99-67d962e3349f','5d6b198e-7555-40a1-8105-aec7f144d719','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('596a83c9-3a6d-480f-90cb-6afd2881e66c','5d6b198e-7555-40a1-8105-aec7f144d719','100a17da-6ea9-4c35-9f2b-159efb994713'),('59722fc5-e28c-45c4-8ada-4ef8c8943bdd','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('59740195-c3f7-48d1-82cb-206866bb9ffe','030303a4-eab5-4863-a257-317b6530a668','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('5a0188f3-0273-4ee9-998e-f2cc4eebb1ae','972754b2-d54d-4429-8e74-5153ccacd170','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('5a19569e-c425-4adc-a4f0-052e7f8e9ce1','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('5a2cf665-8ed1-48a1-9108-1708d9f59c73','bc78dda8-1a72-423e-85b1-fb5fe51bae76','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('5a43c920-af43-4de4-accd-f45ef802145b','3a45d13b-18aa-4879-8460-e7d5315926f9','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('5a74d769-cac8-47e3-999e-5d97122118b9','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('5a930b5c-2ea5-4c6c-bbb0-9e95e478a392','7c76a2e6-fe7f-49c4-a128-236de5a2159e','100a17da-6ea9-4c35-9f2b-159efb994713'),('5ada72ad-90f1-488a-9086-a1b376d35962','64174de7-e444-4b4d-81c7-ea8f3cc49240','100a17da-6ea9-4c35-9f2b-159efb994713'),('5b09cdcd-7c5d-477e-a3c6-77d3a4a28a7c','10689571-a849-4a3d-8eb7-6fc74cd4477b','cde96503-76da-440c-9d35-e9be21c70616'),('5b0ea36b-d0e4-489f-bd5c-d24d8dc85980','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','caf93aa4-de65-453e-be16-c0cef90ee421'),('5b13d73c-16a7-4529-a48a-917fc218b0aa','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('5b300648-d697-459e-8df3-26c5f11c21d9','df32d0dd-aa61-44d8-92ef-d63c009626b5','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('5b460f05-cdbf-4e1c-bf33-eb2487c2d082','d8827eed-a8fe-4fc5-9a35-82a620e6c791','fc3727ea-112c-4341-9589-f88b9321c227'),('5b723998-0534-4a3a-b71b-1da8fde8cb30','a3502307-fe20-41ef-86d7-c0b3102e7371','822fed41-7169-4376-a254-b312f0c521fe'),('5ba729db-7d3f-4657-8793-0c75a0e584dc','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','b7a69208-8267-44f7-b843-ff51b2482d07'),('5bacb091-1e1f-4d9f-a5f1-f1ad75228c7b','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('5bf5aa64-7e2f-4007-b27a-ed6d5d6b253d','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('5c234402-aeac-4803-8dea-b026f9d7d9bf','972754b2-d54d-4429-8e74-5153ccacd170','822fed41-7169-4376-a254-b312f0c521fe'),('5c35dd5e-e923-408f-9e67-c8899131020c','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','822fed41-7169-4376-a254-b312f0c521fe'),('5c4d9631-47e0-4115-9aa1-f6843a135e2b','eddac9b7-391b-4ec6-8a29-7ef9046ba796','b7a69208-8267-44f7-b843-ff51b2482d07'),('5c9d14b1-15d7-47d6-b2aa-81863dfaa2c5','79cb6076-338d-4c32-859a-9ac932b22ccf','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('5cd58b86-eb00-4a1e-9da3-8c04db07e697','7528587d-0d4f-4270-92ac-ef27b1b6263f','caf93aa4-de65-453e-be16-c0cef90ee421'),('5ce72cec-63b9-4918-88b8-4cf4b694a310','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('5d513587-bc2a-4762-ac08-793463410505','e9a93e86-d156-483d-b84b-90e9654fb0ea','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('5d7b88ef-16d2-4c46-8326-659ab378113d','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('5dbfb513-b934-43b2-9f77-719ae108488f','2ecda9e6-d15a-4b98-8edb-233ed006cfec','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('5dc0c61e-fb66-4725-8d54-2de0837ec658','64174de7-e444-4b4d-81c7-ea8f3cc49240','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('5e1e4170-ca80-465d-8fe4-6aabfdce771c','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','caf93aa4-de65-453e-be16-c0cef90ee421'),('5e3ed912-5ef8-4a73-b24c-3f41e4214da5','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('5ea8b2e4-7858-48c0-aca0-45977f374145','e79ed356-8035-4687-9fe9-b3ddd2230deb','44daa961-ff04-4f9f-be57-4395508d1fdb'),('5ea92386-516b-4190-b028-b964c64d5697','e9a93e86-d156-483d-b84b-90e9654fb0ea','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('5eb4134a-a8b9-44c2-93b0-2dcec7c1144e','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','cde96503-76da-440c-9d35-e9be21c70616'),('5f306879-19f6-428c-86cd-0d385e7cfd97','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('5f762d16-35b1-4736-ada7-c4fd672f0c30','bc78dda8-1a72-423e-85b1-fb5fe51bae76','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('5f91f0fb-e9c7-4323-818b-5a5ff62c51e6','4e01f760-b4b6-4fbc-af4a-050559406a20','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('5fa7bc88-2e3b-4514-a04e-b3b911502bd2','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('5fc40bee-9682-4cb4-83bb-2e89f94b9562','2ecda9e6-d15a-4b98-8edb-233ed006cfec','822fed41-7169-4376-a254-b312f0c521fe'),('5ff6dacf-a217-4702-a6a2-8b52b91932e3','26eb3ddd-6117-4ba7-9df4-9dc823d5c218','100a17da-6ea9-4c35-9f2b-159efb994713'),('6008c4b7-f8a8-4e8d-bc67-425fc92568d0','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','b7a69208-8267-44f7-b843-ff51b2482d07'),('603c92d8-0899-4016-97c6-21e637748337','df32d0dd-aa61-44d8-92ef-d63c009626b5','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('604559d2-b497-45dc-92ad-bfe3a26354ac','f9a1bc16-714f-498f-a35a-405a77cc1366','100a17da-6ea9-4c35-9f2b-159efb994713'),('60a84588-cc5a-47c7-a0e5-84a961cbf5bd','bd164a0e-be77-4bfb-9283-ea711d9f7938','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('60acc99c-a32a-40b7-85af-43a8723bca24','0cd308e4-ef0e-44cc-9547-a9999499e83a','822fed41-7169-4376-a254-b312f0c521fe'),('60d49c9c-96ec-4b2d-9f37-ae471b172ba3','0f487bc0-1123-416e-999a-fa97bc9e1946','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('60e03a18-b2df-4692-bb5f-a9440b4c4aab','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('613ce842-ef56-4da6-9c07-19ed0c38a8e3','2ecda9e6-d15a-4b98-8edb-233ed006cfec','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('6150087d-2bb1-4611-ad8d-1442354f00de','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('6152e278-55f8-4646-842e-0c9042e35bce','3216803b-9720-4af1-a034-7b64ac02f85a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('61a6ae12-09bb-4b97-b98c-c5cdecda6798','64174de7-e444-4b4d-81c7-ea8f3cc49240','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('61c19bfe-e380-480d-a96f-4a0c77f2e426','4ada79ea-e654-47fd-92a6-e8d32913a6a2','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('62c8fe5f-c44b-4c0f-a332-3d2650bbb463','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','fc3727ea-112c-4341-9589-f88b9321c227'),('634d478d-6046-4f28-abf9-22f7cb9efc17','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('635ddbda-5ccd-42df-8023-3d24f0101906','f9a1bc16-714f-498f-a35a-405a77cc1366','caf93aa4-de65-453e-be16-c0cef90ee421'),('6363b945-66cf-409d-973c-dd5f406286fe','226539b9-6717-4de2-869f-a6bb046b9a18','100a17da-6ea9-4c35-9f2b-159efb994713'),('6385f57a-01b0-401f-a56b-8ef640c0c935','2acb3df6-f623-4c6b-8a88-ad97b2b64722','cde96503-76da-440c-9d35-e9be21c70616'),('63acf65f-2e7f-466e-8cd6-41a7ce5660a0','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','44daa961-ff04-4f9f-be57-4395508d1fdb'),('63d79600-f7a7-4752-a66f-f0c36f943e9a','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('63d93299-6ae4-4d42-a5aa-b5439530110c','309836d7-7922-4500-b65a-a8973f8c5426','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('6429cbc4-5f75-4280-86f3-2e8c9ee6ba57','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','fc3727ea-112c-4341-9589-f88b9321c227'),('644f98bc-1726-48e2-8720-a188fb1aabdd','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('64bdd411-c3e4-4613-97ab-f01df757f993','4c0911b3-22a5-4559-8dad-71de868a4cd6','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('6513cbdc-9e3b-4c91-8a80-c8197c2ee233','62181cbe-506f-4ada-90c3-f32828c9776e','100a17da-6ea9-4c35-9f2b-159efb994713'),('6568143b-6115-4368-9b96-b3d9f07844a6','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','caf93aa4-de65-453e-be16-c0cef90ee421'),('65e33b26-85cd-4f86-85cb-dfcf3cf962a9','15b8b234-338b-43e9-81e4-32c201ab330e','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('6651e39a-2ec1-4ec6-abce-3ea2ae1247f5','4e01f760-b4b6-4fbc-af4a-050559406a20','822fed41-7169-4376-a254-b312f0c521fe'),('6671d2a0-4a26-4d1e-ba71-51d3a5f8ae1c','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('66ac78f8-848e-415e-9435-0b287b191483','0ec2a9c8-4be9-4056-838c-86ea88178858','b7a69208-8267-44f7-b843-ff51b2482d07'),('66bfc540-710e-44d2-893a-91745f0d95f9','c0979193-f268-404d-9d3c-da2211c24e02','44daa961-ff04-4f9f-be57-4395508d1fdb'),('66c5fa4f-ae8c-4e7b-b797-291407bb8277','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('66fe5d49-1210-49ef-8a71-c9e449fa68c3','0ac16798-0637-449e-87ca-ce047ce3b567','cde96503-76da-440c-9d35-e9be21c70616'),('670160d8-52e3-4382-bcd2-6b6e97b927f9','0f487bc0-1123-416e-999a-fa97bc9e1946','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('67ae1f85-ccb2-4042-8e61-3173216cac03','f9a1bc16-714f-498f-a35a-405a77cc1366','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('67ca4695-f2de-4382-8ca3-cd882f3747d2','06d06526-8cc2-46d4-a703-596e607dfc05','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('67df1598-7f34-4f79-8a45-1636c472b25f','5d48af70-e855-4ec8-bf7f-e70dacbd4023','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('67e14fb7-9746-45f0-a924-977d39203a99','4c0911b3-22a5-4559-8dad-71de868a4cd6','b7a69208-8267-44f7-b843-ff51b2482d07'),('67e3f041-3dab-4887-955b-dac4ec479815','e7211217-333a-4001-aac0-c2eac6288637','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('67f7cfa2-13f7-4657-9b3e-c302cb295a24','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('6833ce2c-09d0-40d2-bd40-7dcb4fea7ab3','bbd2b239-1ef2-4f49-8d86-f3778126d282','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('685acc6f-4b4b-4214-a86b-637129ee7f0b','7528587d-0d4f-4270-92ac-ef27b1b6263f','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('6878bff3-5e55-4773-9f37-dbd3b0b46fb8','f4615226-2034-4369-b6cb-0d5c579183cf','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('6882212f-8646-4fb3-8f9d-7d7abcb2ec41','2acb3df6-f623-4c6b-8a88-ad97b2b64722','100a17da-6ea9-4c35-9f2b-159efb994713'),('68956894-b28f-4393-ae20-a019c6eb00a0','cc40a0d1-2664-4982-8ef1-20594df5fc09','44daa961-ff04-4f9f-be57-4395508d1fdb'),('68a5606b-8c75-469b-af4c-f625929fe1b0','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('68aa76c3-a801-4d9e-9baf-6285f4d88cc4','f1d97f93-c60b-4b8a-ac15-49d2112fb814','44daa961-ff04-4f9f-be57-4395508d1fdb'),('68b57780-1ed5-4fb0-8755-d4833f489ef7','4e01f760-b4b6-4fbc-af4a-050559406a20','b7a69208-8267-44f7-b843-ff51b2482d07'),('68c6ab2c-4641-4d2a-a1e0-f115a150c9be','b5fb6b99-f329-408e-98d3-877fc898ab93','fc3727ea-112c-4341-9589-f88b9321c227'),('691f46cf-e8aa-4198-bea3-003ab672c926','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('69a6370b-0260-4d04-b855-a5bf9478b0af','c5a69b9c-441d-4456-9535-b0a72927ba6a','b7a69208-8267-44f7-b843-ff51b2482d07'),('69b69020-7d81-48ff-a24c-619fca0305fc','2acb3df6-f623-4c6b-8a88-ad97b2b64722','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('69ef40ad-8cfb-4eda-bbd9-827ad8eb0c8b','c0d6aeba-5e16-4965-afc2-7c38427e56a3','cde96503-76da-440c-9d35-e9be21c70616'),('69f4d71e-5bf1-4aae-aa49-8769ba5886f0','c0979193-f268-404d-9d3c-da2211c24e02','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('69f8cdef-4b3f-4b03-a456-23de48a39ab3','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','fc3727ea-112c-4341-9589-f88b9321c227'),('6a6b7f92-672d-420a-96cd-d5a0d95c6b69','f4615226-2034-4369-b6cb-0d5c579183cf','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('6a7ee8cf-fef0-4984-90bd-9558043a549b','e79ed356-8035-4687-9fe9-b3ddd2230deb','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('6b088e7d-335c-420d-8ed4-4b9d4eecf42f','bbd2b239-1ef2-4f49-8d86-f3778126d282','822fed41-7169-4376-a254-b312f0c521fe'),('6b4fe984-cf55-4752-9069-12e4d4cef808','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('6b5afe3d-34b6-493e-9a79-04a435b41233','539e1886-2308-407e-b664-09bb43e0ff2f','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('6bbceacc-10fe-493f-84ed-6275ffb42e63','b2e0785f-0e91-4643-aaeb-1d48363ef971','cde96503-76da-440c-9d35-e9be21c70616'),('6bbed6e7-4241-446e-a1e5-aa5e2dcba31d','7c76a2e6-fe7f-49c4-a128-236de5a2159e','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('6c1129ae-d26b-4cb3-a831-2533d72975ed','e7211217-333a-4001-aac0-c2eac6288637','44daa961-ff04-4f9f-be57-4395508d1fdb'),('6c4a7ca7-ea82-471a-b39a-ae21a84513fa','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('6c9be2e1-3ccf-40ee-a5e7-45f3da3a02f1','956a45a8-29cb-410a-942e-3ff7fe108ae0','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('6c9dfe54-29ee-49b8-9642-43f4a34bf2b8','4ada79ea-e654-47fd-92a6-e8d32913a6a2','caf93aa4-de65-453e-be16-c0cef90ee421'),('6cbc93b9-a0d8-417e-8fc7-0387fa7a2457','0ec2a9c8-4be9-4056-838c-86ea88178858','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('6cdd01fb-0796-4cc0-a281-9796e40610f5','e9a93e86-d156-483d-b84b-90e9654fb0ea','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('6d03153a-f755-4bb8-9f82-805c1054e5ab','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('6d2cd731-1c2b-4292-bce7-23c46ec8f25c','79cb6076-338d-4c32-859a-9ac932b22ccf','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('6d8e421f-e3da-456e-95b9-535dbf06dbc1','7496836a-a18c-4db7-8df7-724c8df5b381','cde96503-76da-440c-9d35-e9be21c70616'),('6da1b075-9b91-4be9-bf67-4c930597e8d1','49a45a15-addb-4296-902b-035635450bcd','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('6dbcc127-4b75-41db-a33f-55c15bed991e','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('6dc891f1-1c11-4704-9cad-f7e6e356f118','09e39da6-671e-4e13-8706-8025f14d128f','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('6e458781-4490-4c67-8f7a-aa67fa6a5036','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','caf93aa4-de65-453e-be16-c0cef90ee421'),('6e768393-f5ce-4542-8cc3-dcc689072a52','7528587d-0d4f-4270-92ac-ef27b1b6263f','cde96503-76da-440c-9d35-e9be21c70616'),('6e9d6c3f-64ff-4384-bee9-c5ce2b11d97f','2e860c1d-fad7-4d34-92de-b31b0735c573','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('6efa9fc6-88f0-4093-9d8e-ab9fb8093290','5d6b198e-7555-40a1-8105-aec7f144d719','44daa961-ff04-4f9f-be57-4395508d1fdb'),('6f15d348-f731-44c0-93fa-270ac5b7ac20','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('6f505cc7-a639-4cd4-af13-b72fb7c40f06','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('6f64657f-33ea-443e-8c2d-90da4dacd379','3216803b-9720-4af1-a034-7b64ac02f85a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('6f80687e-4f22-49c4-8c25-fbe1f92f736d','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('6fe1edfb-9c96-4740-93b9-b081bcad9e3f','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('6ff87d86-d5be-4484-af3e-205d0aee241e','df32d0dd-aa61-44d8-92ef-d63c009626b5','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('704d3356-4a5b-4cbc-bc9e-bfe5e29279d4','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('705a71c4-cf83-4ee9-b985-b96dfd702181','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','caf93aa4-de65-453e-be16-c0cef90ee421'),('706e2e32-920a-4b88-aaa8-2346b6af3b61','c0979193-f268-404d-9d3c-da2211c24e02','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('710093b3-73bb-4f61-b30b-dd0209606b36','007e2dab-1034-4577-a8b5-3efb0f793ae4','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('71069f31-7727-4b06-9f09-c980a9129c0a','c20c3f03-7313-4d79-ac7b-88f210a5df01','b7a69208-8267-44f7-b843-ff51b2482d07'),('7132ea34-9818-4d0e-878a-3689aac56ece','09e39da6-671e-4e13-8706-8025f14d128f','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('718f1490-185f-433e-993d-94c571897fd2','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('720bdbde-43c9-400a-9ffd-246469ac3e39','358374f1-3eab-4efd-99b9-28cceb3a354f','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7217aded-9d9b-4bf7-88ec-c0ed22a5b443','c0979193-f268-404d-9d3c-da2211c24e02','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('721a008f-617f-4bb4-ad20-214cd5d0c147','f780967f-f851-4ea8-8eda-23430e122a43','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('728b492d-d65e-45c0-9bd6-5be05a2494e4','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('728d331b-d048-4810-98e1-69a1cc8fbf4b','6be10468-c5cc-446e-951d-11ad5048f01f','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('7296de18-87a0-437b-8232-e7a42d4c4c42','15b8b234-338b-43e9-81e4-32c201ab330e','b7a69208-8267-44f7-b843-ff51b2482d07'),('72ba8322-bec3-4210-bfcf-e06bf7f66586','358374f1-3eab-4efd-99b9-28cceb3a354f','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('72bfe9fd-a8b3-41cf-b8e2-a0174f577ab3','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('72f8ffd5-301e-4016-8bed-873c7197aa2c','47929513-27e2-4b7f-9273-8e16b626df34','100a17da-6ea9-4c35-9f2b-159efb994713'),('730b57af-565f-465f-a667-1c9b57417cc1','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','b7a69208-8267-44f7-b843-ff51b2482d07'),('732da8df-060b-42d2-838c-cc885f77fa3a','061bf81a-073b-4f55-bc94-194425788715','b7a69208-8267-44f7-b843-ff51b2482d07'),('734d4401-e582-474c-adc7-d2414350b706','10689571-a849-4a3d-8eb7-6fc74cd4477b','44daa961-ff04-4f9f-be57-4395508d1fdb'),('736ad314-930d-47cc-b63a-d8f31a5ce754','c0979193-f268-404d-9d3c-da2211c24e02','caf93aa4-de65-453e-be16-c0cef90ee421'),('7379aac0-0a61-4a3a-92c2-14d21442257a','5d6b198e-7555-40a1-8105-aec7f144d719','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('73e8fb8f-b3b6-474e-914a-127f171287df','bc78dda8-1a72-423e-85b1-fb5fe51bae76','caf93aa4-de65-453e-be16-c0cef90ee421'),('743f8640-cc5e-40ad-ad41-0d3f4992c4e9','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','822fed41-7169-4376-a254-b312f0c521fe'),('7442f18a-85c6-420b-9f3d-268d1c8c8949','62181cbe-506f-4ada-90c3-f32828c9776e','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('74786304-a0d7-4590-8d4e-1b3ab8a0b4a5','3216803b-9720-4af1-a034-7b64ac02f85a','100a17da-6ea9-4c35-9f2b-159efb994713'),('7491850a-5d2c-4476-9b65-2a94aa33d474','bbd2b239-1ef2-4f49-8d86-f3778126d282','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('74a166e6-6f97-436b-9dc4-cdefb503c623','47929513-27e2-4b7f-9273-8e16b626df34','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('74abdf8a-ae02-4dc8-bc6a-206c71349170','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('74be6c9b-9d27-4ceb-bc74-76cd3ac69b3b','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','b7a69208-8267-44f7-b843-ff51b2482d07'),('74e33390-f744-4270-8124-e7af94966827','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','fc3727ea-112c-4341-9589-f88b9321c227'),('75063c7c-d401-4d66-800a-e37e9c334ead','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','100a17da-6ea9-4c35-9f2b-159efb994713'),('750d8a7f-ef1a-493d-bd0f-7079baaa4798','4c0911b3-22a5-4559-8dad-71de868a4cd6','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('751a5ef8-9fe9-4d1e-af62-339d6f7303f6','0ac16798-0637-449e-87ca-ce047ce3b567','822fed41-7169-4376-a254-b312f0c521fe'),('759da364-23dd-4df3-8f69-ee829b88e0e6','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('75c0952d-9351-44c0-b03c-b5f741a5581f','7496836a-a18c-4db7-8df7-724c8df5b381','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('75c0cfa2-7e61-45cc-819b-2f28314fa8ca','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','44daa961-ff04-4f9f-be57-4395508d1fdb'),('7612ecfa-eef6-44ed-8455-953494f4a784','0cd308e4-ef0e-44cc-9547-a9999499e83a','100a17da-6ea9-4c35-9f2b-159efb994713'),('768b0477-cff8-4a60-ad10-724098d80ea7','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','fc3727ea-112c-4341-9589-f88b9321c227'),('7697eacd-1038-4db7-bcdf-818c5aa1f0c6','cc40a0d1-2664-4982-8ef1-20594df5fc09','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('76d34c65-143f-4a99-ab62-40bdeeec805d','007e2dab-1034-4577-a8b5-3efb0f793ae4','b7a69208-8267-44f7-b843-ff51b2482d07'),('76ea3868-25f8-4c54-9c55-f387eb972d5d','956a45a8-29cb-410a-942e-3ff7fe108ae0','caf93aa4-de65-453e-be16-c0cef90ee421'),('77263fb6-e792-48c2-9dc2-52d939d8af0b','b2e0785f-0e91-4643-aaeb-1d48363ef971','fc3727ea-112c-4341-9589-f88b9321c227'),('772fecdd-6a9f-4dc5-8497-30d343561f32','f9a1bc16-714f-498f-a35a-405a77cc1366','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('7731886d-18de-4742-8c71-df16ed2692eb','b2e0785f-0e91-4643-aaeb-1d48363ef971','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7765ddc7-0cda-4a13-81dc-158a463dcab5','10689571-a849-4a3d-8eb7-6fc74cd4477b','caf93aa4-de65-453e-be16-c0cef90ee421'),('7811db1c-29e9-41c6-9692-f45d9bdb8c60','6b73b416-a32d-40fb-a343-b570d2e8d2cc','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('78418895-3dd8-4596-904c-9530b531e963','0cd308e4-ef0e-44cc-9547-a9999499e83a','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('78559109-7f01-4bd1-ac6d-2fc3574c7c64','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('78657f7a-23b4-407f-a90f-00cecaad2878','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('78a500b6-bcd9-4d03-9687-f7f6253ce824','e18c9a94-7064-4b5f-9a10-40041b7dd5de','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('78c410a4-3d45-48b7-8026-0e91b846cfaa','4e01f760-b4b6-4fbc-af4a-050559406a20','44daa961-ff04-4f9f-be57-4395508d1fdb'),('793f3dc1-f704-4c99-852f-f3741d57af15','f9a1bc16-714f-498f-a35a-405a77cc1366','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('79e74686-3262-495c-8152-7c851451020c','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','44daa961-ff04-4f9f-be57-4395508d1fdb'),('79ee22f4-08b5-4db9-aa79-2c3299f042c5','30c54bd0-5b3a-437e-a669-abb480c34af8','822fed41-7169-4376-a254-b312f0c521fe'),('79fafbba-9022-4d37-a7af-5ac360d0c408','0a44ffa8-3870-472e-98fa-e33dbc7fc322','b7a69208-8267-44f7-b843-ff51b2482d07'),('7a0e06f8-dd29-4851-adb4-44278d5f2348','2ecda9e6-d15a-4b98-8edb-233ed006cfec','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('7a13ebce-7ee5-4426-83b3-ee736d959d9c','e79ed356-8035-4687-9fe9-b3ddd2230deb','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('7aebf556-7d56-48de-bcd7-370671194535','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('7b18c4da-bd20-4909-b5cf-5da6fcdd6414','f780967f-f851-4ea8-8eda-23430e122a43','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('7b3daed3-fc8e-4e41-9912-0f1d1e739d79','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','caf93aa4-de65-453e-be16-c0cef90ee421'),('7b7d7b54-0c7f-4cd3-bdc5-44dfd6e7b70f','7496836a-a18c-4db7-8df7-724c8df5b381','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7b8bcf50-9be6-45a1-af90-8b38c83924af','bbd2b239-1ef2-4f49-8d86-f3778126d282','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('7ba6d271-6ee6-4d60-add3-6017333370cb','f9a1bc16-714f-498f-a35a-405a77cc1366','822fed41-7169-4376-a254-b312f0c521fe'),('7bcf4fc2-1a3d-4ed1-a822-ba098cedb953','0a44ffa8-3870-472e-98fa-e33dbc7fc322','100a17da-6ea9-4c35-9f2b-159efb994713'),('7bea7641-da0b-4bd4-8ec3-5d20cb0598dc','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','44daa961-ff04-4f9f-be57-4395508d1fdb'),('7bfa70db-540a-44cc-b3db-c8b8d21280d7','df32d0dd-aa61-44d8-92ef-d63c009626b5','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('7c0f306a-03a1-438a-ab01-38203387a702','972754b2-d54d-4429-8e74-5153ccacd170','b7a69208-8267-44f7-b843-ff51b2482d07'),('7c270098-5db8-42a5-9dc2-272ded389db7','5d6b198e-7555-40a1-8105-aec7f144d719','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('7c46d18d-0f66-4c7b-930f-4633c487eae3','0fd38122-485d-4f0c-84be-65cbcfe1ffec','822fed41-7169-4376-a254-b312f0c521fe'),('7c6fed6c-6010-45c2-9746-5b19781f104e','3216803b-9720-4af1-a034-7b64ac02f85a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('7cd6298c-fb9a-4b93-99a7-4265e84f30dd','c0d6aeba-5e16-4965-afc2-7c38427e56a3','fc3727ea-112c-4341-9589-f88b9321c227'),('7d0f5a5e-78c9-4e59-a377-4c52f3b1a20e','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7d279542-5176-49e2-b994-315d9d9bc9e8','d8827eed-a8fe-4fc5-9a35-82a620e6c791','822fed41-7169-4376-a254-b312f0c521fe'),('7d2cb450-904b-4e89-b3d4-9a6a906958c6','10efabbd-054a-4161-bd9d-d9e193217d00','d49533b8-1d5a-402b-a65a-241eb714d1ce'),('7d3a13cc-b231-4a39-9107-77ec8942fa6e','7528587d-0d4f-4270-92ac-ef27b1b6263f','44daa961-ff04-4f9f-be57-4395508d1fdb'),('7d4486b3-21b4-498d-a330-71f11a4a93a0','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','44daa961-ff04-4f9f-be57-4395508d1fdb'),('7d47ab37-7ffe-45b9-bce0-89f91d557d2c','49a45a15-addb-4296-902b-035635450bcd','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('7d5d3ef3-0d5d-45d1-a9b7-b7ab2900868f','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('7d6e2094-61e9-4899-b4af-707694f2b804','2ecda9e6-d15a-4b98-8edb-233ed006cfec','cde96503-76da-440c-9d35-e9be21c70616'),('7db4878c-330c-4895-bbf5-93b06ff93cc3','e7211217-333a-4001-aac0-c2eac6288637','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('7dcad634-8623-4d1e-b0de-c4be5fcd66a9','972754b2-d54d-4429-8e74-5153ccacd170','fc3727ea-112c-4341-9589-f88b9321c227'),('7dcc8434-9569-411d-92db-540850fd81e1','c83e09a9-3394-4693-aee3-e896a6d31b0a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7dcdd993-d73f-42b9-8f0f-696596f08717','09e39da6-671e-4e13-8706-8025f14d128f','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('7e29ff23-5c81-41cf-850a-11db3bc622c2','f9a1bc16-714f-498f-a35a-405a77cc1366','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('7e575fc4-9f5b-4517-b897-78022677081f','a3502307-fe20-41ef-86d7-c0b3102e7371','caf93aa4-de65-453e-be16-c0cef90ee421'),('7e5e5bef-6f0c-4d8d-af35-eb4454d7a20f','bbd2b239-1ef2-4f49-8d86-f3778126d282','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('7e7bcbbe-16de-463c-a9a4-e7156eb473ab','4c0911b3-22a5-4559-8dad-71de868a4cd6','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('7e7ecab8-e3a7-47f1-b1fc-4d7a692512c1','007e2dab-1034-4577-a8b5-3efb0f793ae4','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('7eaf57e3-8c0e-4da3-870d-e0e881f435c5','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7ec8b0dc-6cf4-4930-90f8-cde912a28465','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','822fed41-7169-4376-a254-b312f0c521fe'),('7ed6c30f-b3a6-46bb-9b30-cf9ce26d363c','b5fb6b99-f329-408e-98d3-877fc898ab93','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('7eee843a-16e8-4fc4-82fa-ec1b324e089f','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','cde96503-76da-440c-9d35-e9be21c70616'),('7f361f6a-6b25-4585-84a4-60256ef5fdff','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','822fed41-7169-4376-a254-b312f0c521fe'),('7f86f347-5acf-4748-95b1-8ba5f3dd927b','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('7f885548-a330-49a8-b94a-f93a824c21b5','d8827eed-a8fe-4fc5-9a35-82a620e6c791','100a17da-6ea9-4c35-9f2b-159efb994713'),('7fa7be0c-9be4-4610-8b04-c419f7e6098a','79cb6076-338d-4c32-859a-9ac932b22ccf','fc3727ea-112c-4341-9589-f88b9321c227'),('8001aeb4-e19a-48ff-a845-0b16c83bd0e1','f780967f-f851-4ea8-8eda-23430e122a43','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('801dc2e7-ae16-4e90-99e9-0beb84f69f2f','e18c9a94-7064-4b5f-9a10-40041b7dd5de','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('80353634-2ed2-40c1-88a4-b2423b5feed6','30c54bd0-5b3a-437e-a669-abb480c34af8','caf93aa4-de65-453e-be16-c0cef90ee421'),('80a30404-e5eb-4bdc-87d6-a6a09d9a2651','030303a4-eab5-4863-a257-317b6530a668','caf93aa4-de65-453e-be16-c0cef90ee421'),('81005f5c-7f03-4080-a403-03dbfbb3c156','230df099-e11a-4e1c-a151-8ba754e1d2a5','b7a69208-8267-44f7-b843-ff51b2482d07'),('810d874d-b5fd-455d-a090-6e8ed41f8c7b','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','fc3727ea-112c-4341-9589-f88b9321c227'),('811f900a-22b0-4c1b-b3ca-2cf92b5173c2','c20c3f03-7313-4d79-ac7b-88f210a5df01','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('812db99e-b8af-4f9d-b62e-a19b348a9eed','79cb6076-338d-4c32-859a-9ac932b22ccf','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('814ca826-eca3-4b62-b445-8a60bfbf45b7','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','caf93aa4-de65-453e-be16-c0cef90ee421'),('818a7438-bbdf-45c1-9425-393c3d232c0e','6b73b416-a32d-40fb-a343-b570d2e8d2cc','cde96503-76da-440c-9d35-e9be21c70616'),('819d5585-691c-4fef-bfa0-ce64b22d6292','4c0911b3-22a5-4559-8dad-71de868a4cd6','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('81ce3b66-7306-4ef7-b0d2-85637554fbc3','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('81f85cea-f820-4986-b63d-e5f78955d981','79cb6076-338d-4c32-859a-9ac932b22ccf','caf93aa4-de65-453e-be16-c0cef90ee421'),('8219022e-543d-4a9d-aa27-d27e2ebedd73','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('825f0104-6730-455c-91e7-ec5c1efd3ab6','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('827fc925-c1ea-499f-a624-af6329eb1f68','4e01f760-b4b6-4fbc-af4a-050559406a20','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('828a94c1-b6f3-4b5c-9811-51960c9a939e','2e860c1d-fad7-4d34-92de-b31b0735c573','b7a69208-8267-44f7-b843-ff51b2482d07'),('82ce5b55-c1f8-471e-b3be-95177457c3db','bd164a0e-be77-4bfb-9283-ea711d9f7938','caf93aa4-de65-453e-be16-c0cef90ee421'),('82f576c0-4b8d-4c5e-9f0f-cb534faa18f2','62181cbe-506f-4ada-90c3-f32828c9776e','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('82fd5535-c703-4a99-b888-38ea0271c9b8','b2e0785f-0e91-4643-aaeb-1d48363ef971','44daa961-ff04-4f9f-be57-4395508d1fdb'),('83787dd0-22fa-4e03-8399-2c201b3f8c55','0a44ffa8-3870-472e-98fa-e33dbc7fc322','cde96503-76da-440c-9d35-e9be21c70616'),('83a9a9d1-2f19-408c-bff3-614b4a4bb6b3','3216803b-9720-4af1-a034-7b64ac02f85a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('83b9d166-bf93-4915-8f77-c236ed92bdbd','354ad423-d455-481f-94e2-1b840d779842','cde96503-76da-440c-9d35-e9be21c70616'),('83cf2983-97f3-47ea-b7eb-ec6dc0757adb','3a45d13b-18aa-4879-8460-e7d5315926f9','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('84ce761f-33eb-4d94-b60a-ac4348cef897','4ada79ea-e654-47fd-92a6-e8d32913a6a2','b7a69208-8267-44f7-b843-ff51b2482d07'),('84e0d00c-3ac8-4e12-8420-dc82999eb2ef','9aada076-b566-4d5d-9941-3004d5d07f92','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('84f97fd9-7c20-466d-9433-0f0085cec6ba','956a45a8-29cb-410a-942e-3ff7fe108ae0','822fed41-7169-4376-a254-b312f0c521fe'),('8513e9bd-c807-4134-a3e1-7999f04652e6','e7211217-333a-4001-aac0-c2eac6288637','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('851c300a-d73a-45c8-8f21-edd3a5c30d6f','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','fc3727ea-112c-4341-9589-f88b9321c227'),('852a4888-e7bb-4369-884f-686e6e04d888','9128ece7-28e2-4467-a346-3d53646be8e2','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('85369762-c23d-4415-85da-aa7e4c60fdac','2e860c1d-fad7-4d34-92de-b31b0735c573','cde96503-76da-440c-9d35-e9be21c70616'),('8591d9ed-0a4e-4688-ad9e-1c43e108123c','260f71fa-1d2e-48f6-a672-e2ce857097e5','b7a69208-8267-44f7-b843-ff51b2482d07'),('85aea1b0-630e-43ad-af2b-c4ffcf0700bb','a3502307-fe20-41ef-86d7-c0b3102e7371','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('86262724-3072-432e-93c8-c696c42234b3','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','100a17da-6ea9-4c35-9f2b-159efb994713'),('867dc19a-e031-4c10-bb29-b8f3edbcd4b7','309836d7-7922-4500-b65a-a8973f8c5426','100a17da-6ea9-4c35-9f2b-159efb994713'),('86d5efb6-5d34-49ac-b946-ce9f5cb2ab85','e18c9a94-7064-4b5f-9a10-40041b7dd5de','100a17da-6ea9-4c35-9f2b-159efb994713'),('86da4c2d-a466-4b86-8c5b-73e227b736ca','7528587d-0d4f-4270-92ac-ef27b1b6263f','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('86e48a45-a34b-45a9-9997-f814fcb238ea','4ada79ea-e654-47fd-92a6-e8d32913a6a2','cde96503-76da-440c-9d35-e9be21c70616'),('872d9936-9466-4d15-9b19-5c256135da3e','1458ee77-9304-40e1-ab80-aa9780c5630a','44daa961-ff04-4f9f-be57-4395508d1fdb'),('875c976c-24a6-4445-9c30-16c0c6b37ffb','c83e09a9-3394-4693-aee3-e896a6d31b0a','b7a69208-8267-44f7-b843-ff51b2482d07'),('87b10e91-c9e8-445c-976f-4826424a479f','c5a69b9c-441d-4456-9535-b0a72927ba6a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('87d663e8-4673-44b2-b64f-d016b3bd9243','c20c3f03-7313-4d79-ac7b-88f210a5df01','822fed41-7169-4376-a254-b312f0c521fe'),('87ea207b-0eaf-4bcf-83df-a106abbd0d98','c83e09a9-3394-4693-aee3-e896a6d31b0a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('87f0346e-bc3a-4132-98e9-ec7eda042ba2','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('881ed2fd-414b-42e7-9d0c-74fb8c14eab7','c20c3f03-7313-4d79-ac7b-88f210a5df01','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('882574ad-655e-447f-9afd-f7d698c743f4','f9a1bc16-714f-498f-a35a-405a77cc1366','b7a69208-8267-44f7-b843-ff51b2482d07'),('8831bbb6-4150-4238-a1ae-9bbfb2fbe65c','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('8837586e-8117-4947-8597-1d67f588f5aa','f9a1bc16-714f-498f-a35a-405a77cc1366','cde96503-76da-440c-9d35-e9be21c70616'),('883ab04c-f86a-42b6-a948-7d5b2d0d4746','1458ee77-9304-40e1-ab80-aa9780c5630a','fc3727ea-112c-4341-9589-f88b9321c227'),('885210c1-98c2-40ea-bbec-1c7a974da16c','0a44ffa8-3870-472e-98fa-e33dbc7fc322','44daa961-ff04-4f9f-be57-4395508d1fdb'),('8865e5e8-2fc7-4473-b6cb-ad2c63c02120','0ac16798-0637-449e-87ca-ce047ce3b567','caf93aa4-de65-453e-be16-c0cef90ee421'),('886e77bd-86d1-440f-877b-9bb542a66f3d','354ad423-d455-481f-94e2-1b840d779842','b7a69208-8267-44f7-b843-ff51b2482d07'),('886fdaee-f1f7-422c-beaf-36bc0b7c2075','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('88a36035-2a58-456c-bce1-d16390d3c40e','5da09e50-1448-4275-bba9-2d135d086a53','caf93aa4-de65-453e-be16-c0cef90ee421'),('88a877f7-3047-4674-81b5-6a5f7c15b8c1','eddac9b7-391b-4ec6-8a29-7ef9046ba796','cde96503-76da-440c-9d35-e9be21c70616'),('88bc689d-c4a7-42b2-b1b4-aa10c6a1b6d5','e7211217-333a-4001-aac0-c2eac6288637','822fed41-7169-4376-a254-b312f0c521fe'),('88bdcfba-46c8-4d3d-baf5-d632b4dc1da1','f9a1bc16-714f-498f-a35a-405a77cc1366','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('88ca8302-d452-4c66-9664-17d1124f9627','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('88d68cf1-1678-4f36-b924-cccd7134473a','18503716-be18-465d-becc-7aca1ad01081','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('89110a0e-4ad9-4318-954c-ae780b40df66','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('89350adb-58af-41b4-a9cd-54825f3dc4f7','15b8b234-338b-43e9-81e4-32c201ab330e','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('894788d1-8de0-4ce7-9d66-a5a0413cbc57','a3502307-fe20-41ef-86d7-c0b3102e7371','cde96503-76da-440c-9d35-e9be21c70616'),('89d0e1b9-2796-48e3-b2bc-3f9cc02d93b5','4a217f22-0e91-41f4-8f73-30419ee6f396','100a17da-6ea9-4c35-9f2b-159efb994713'),('8a11b77b-30d0-4dbc-856c-650103655a1a','7b00cb02-9e3e-4f81-a4d2-ed1afde59ca6','3ac1b691-1154-460f-9c17-33ba2e46ef23'),('8a1bd5c2-7fd6-4b72-a05b-eb59f25561f5','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','44daa961-ff04-4f9f-be57-4395508d1fdb'),('8a1f6e5c-f073-48f6-b1be-9ecaa504946e','2acb3df6-f623-4c6b-8a88-ad97b2b64722','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('8a2901e7-3576-4a79-b807-13f1cc8a07bb','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','fc3727ea-112c-4341-9589-f88b9321c227'),('8a96f7a7-8cc8-4324-ba2f-061101904027','bbd2b239-1ef2-4f49-8d86-f3778126d282','b7a69208-8267-44f7-b843-ff51b2482d07'),('8a98cc8e-4443-4a21-ad4d-0b2ae5f7ad58','6be10468-c5cc-446e-951d-11ad5048f01f','cde96503-76da-440c-9d35-e9be21c70616'),('8ab04006-6e85-45ff-aea1-e38b33271b12','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('8ab4d8d9-dd36-47c6-bbfb-c65e716e0125','c0979193-f268-404d-9d3c-da2211c24e02','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('8ac8c4a7-707f-4091-91c4-e5778d1a886f','0fd38122-485d-4f0c-84be-65cbcfe1ffec','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('8ad3f826-33c0-429e-a39a-d0e2e7f76816','4e01f760-b4b6-4fbc-af4a-050559406a20','fc3727ea-112c-4341-9589-f88b9321c227'),('8b096a7b-bcdc-4eb3-9140-eb23329d8ada','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('8b0c896b-b85a-4ffe-8282-7310b2691378','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','822fed41-7169-4376-a254-b312f0c521fe'),('8b1d3d83-0b90-4cf6-a378-1dac3db8eeea','354ad423-d455-481f-94e2-1b840d779842','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('8b57cb29-71bd-4ac8-86f7-1e6b413e8036','5893a799-cfd2-46c8-8ba4-56e7580ec143','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('8bae5ed7-c3cd-4fbe-8e25-10c178a820f5','2ecda9e6-d15a-4b98-8edb-233ed006cfec','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('8bc4ebb0-3b8d-4b53-9a74-612a62af22f3','e18c9a94-7064-4b5f-9a10-40041b7dd5de','caf93aa4-de65-453e-be16-c0cef90ee421'),('8bf8184b-0252-4a4a-bfda-a05e3409ee8c','df32d0dd-aa61-44d8-92ef-d63c009626b5','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('8c112a89-b010-4a4c-901e-d05b9a4bf647','cda33bff-9526-41c1-9a55-8aed371650ab','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('8c1d5986-2c21-44d6-b1b8-f22bab254bb0','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('8c34ef84-4994-445d-ba4a-1be9edbf8e3e','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('8c515e16-aef5-408d-ae85-4ee744407070','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('8c724f6a-6549-4e9f-8e6d-e18e332ef2cd','290e9538-0904-4e8d-8b56-c31ca4031d8b','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('8c845cd4-4de5-47c0-844d-1bfcbf3ec31b','6b73b416-a32d-40fb-a343-b570d2e8d2cc','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('8ca93bc4-2c29-459f-a29c-00d01e75d4cf','49a45a15-addb-4296-902b-035635450bcd','b7a69208-8267-44f7-b843-ff51b2482d07'),('8cc24e99-9307-4233-9f21-8d0573740967','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','caf93aa4-de65-453e-be16-c0cef90ee421'),('8cc508e5-99ec-44f6-9617-0583697b2e26','5893a799-cfd2-46c8-8ba4-56e7580ec143','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('8ccb30cf-0d4d-46f1-8562-ee1956c62b96','e18c9a94-7064-4b5f-9a10-40041b7dd5de','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('8d2b3653-c7f5-4491-9e0c-2cd3ec07291d','64ee63fe-0a0f-482d-9c16-b3c71c75761c','cde96503-76da-440c-9d35-e9be21c70616'),('8d5e1dd6-44b8-430e-bf7a-4c3933328950','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','822fed41-7169-4376-a254-b312f0c521fe'),('8dce2761-2b9b-472e-b709-2cd90bd4163f','sadmin','73f0a903-116f-4de9-9383-9971826ced54'),('8df9c30e-9185-4800-928e-b20cf3ff1097','62181cbe-506f-4ada-90c3-f32828c9776e','cde96503-76da-440c-9d35-e9be21c70616'),('8dfb63bc-752a-44ad-95eb-d6edd0124144','4a217f22-0e91-41f4-8f73-30419ee6f396','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('8e585d73-c924-40b5-bebc-a41525da8b70','5893a799-cfd2-46c8-8ba4-56e7580ec143','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('8e60329e-71e7-46ff-a5cc-56a7e0ec6af2','c0d6aeba-5e16-4965-afc2-7c38427e56a3','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('8e8d9096-5458-4373-862b-ade55ab0d75e','6b73b416-a32d-40fb-a343-b570d2e8d2cc','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('8ea1d8c9-57f9-477a-a04d-7777a891b273','15b8b234-338b-43e9-81e4-32c201ab330e','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('8ead6ee1-f7c8-4a97-be25-98a480df06d9','a3502307-fe20-41ef-86d7-c0b3102e7371','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('8edf5629-61a7-4a5b-8da1-65224635fb0b','2acb3df6-f623-4c6b-8a88-ad97b2b64722','fc3727ea-112c-4341-9589-f88b9321c227'),('8ee3593e-1c1c-4867-bf5c-c60a44b03f61','64174de7-e444-4b4d-81c7-ea8f3cc49240','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('8ef8f657-73df-45b6-994d-a2101199fb67','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('8f1bffaf-9112-4d43-9a13-2d1b13eac5cb','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('8f5797bd-f781-4584-b829-ae2063e3eaa6','b7dd1ca5-a5af-4ac7-946e-4cd93c6ba240','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('8fbf3370-bab5-4c03-b738-37b0f5ca400b','df32d0dd-aa61-44d8-92ef-d63c009626b5','caf93aa4-de65-453e-be16-c0cef90ee421'),('8fcf6116-4080-4280-80bc-142dc9e5e395','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','44daa961-ff04-4f9f-be57-4395508d1fdb'),('8ff2d87a-a6e1-44d6-ae8f-d6614d4cea5f','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('90827f2a-c3f1-463d-901f-d81c5a863f24','c0979193-f268-404d-9d3c-da2211c24e02','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('909ba44f-af15-463e-a272-db8926a462b1','1458ee77-9304-40e1-ab80-aa9780c5630a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('90ad50c4-43dc-40ff-b43c-3b03173afdde','e79ed356-8035-4687-9fe9-b3ddd2230deb','822fed41-7169-4376-a254-b312f0c521fe'),('90c48ef6-67d8-4622-be81-10865bfe7abb','bd164a0e-be77-4bfb-9283-ea711d9f7938','fc3727ea-112c-4341-9589-f88b9321c227'),('90d079c9-c646-4cf6-85a4-c7cef3f4fb1a','eddac9b7-391b-4ec6-8a29-7ef9046ba796','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('90f1e6fb-92c3-48ea-88c4-ec96cea872d2','c20c3f03-7313-4d79-ac7b-88f210a5df01','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('90f4b605-2b4d-4164-b12a-255c64d4eeac','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','100a17da-6ea9-4c35-9f2b-159efb994713'),('91813dd4-29b9-432f-8902-588c22cd50f8','cc40a0d1-2664-4982-8ef1-20594df5fc09','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('918fccfc-b545-491b-8490-ef118134d777','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','fc3727ea-112c-4341-9589-f88b9321c227'),('91de30e5-8689-4fa2-a36c-4cb55ada3078','c20c3f03-7313-4d79-ac7b-88f210a5df01','cde96503-76da-440c-9d35-e9be21c70616'),('91dee150-4342-427e-ba5a-561d84114743','3216803b-9720-4af1-a034-7b64ac02f85a','822fed41-7169-4376-a254-b312f0c521fe'),('91fa9b32-3c1e-4891-b78f-a4bfd8473532','d8827eed-a8fe-4fc5-9a35-82a620e6c791','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('9241aab0-754c-4dcb-8541-58f690bf2b16','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','100a17da-6ea9-4c35-9f2b-159efb994713'),('926e055a-f0e9-464f-849d-25da8687eb87','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','cde96503-76da-440c-9d35-e9be21c70616'),('928bfa59-0b57-46cc-a226-08de2c9425a0','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','cde96503-76da-440c-9d35-e9be21c70616'),('930eacef-a868-4d6f-a74c-5a1d7d3943de','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','822fed41-7169-4376-a254-b312f0c521fe'),('931339f9-e31b-4f76-9649-e866f62cf48d','b2e0785f-0e91-4643-aaeb-1d48363ef971','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('93416e8b-698c-480e-9442-c857ae5f7010','5708ce69-090b-407a-bf8f-9795914e98cf','100a17da-6ea9-4c35-9f2b-159efb994713'),('9354b4ff-6993-4353-b767-884048d73c92','df32d0dd-aa61-44d8-92ef-d63c009626b5','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('935768f6-3b0d-434e-8d8c-dd878e64b51e','2e860c1d-fad7-4d34-92de-b31b0735c573','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('93a075c3-87da-406d-a853-b3bbb8f501f2','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('93b02215-bf4f-4e09-8144-f2a0eeb5f47e','62181cbe-506f-4ada-90c3-f32828c9776e','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('9418d331-12b9-40ff-84f5-7f723fc4f75c','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('945c5d1e-de4e-47dc-9899-bf6fd180dbc3','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('946e7b56-001b-441f-bd84-b70a4c3c6756','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('94e7e18e-c4ee-4822-93bb-bf0dacf704dc','64ee63fe-0a0f-482d-9c16-b3c71c75761c','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('950195c8-ad87-475a-bc24-71c3ab17e7f4','f4615226-2034-4369-b6cb-0d5c579183cf','caf93aa4-de65-453e-be16-c0cef90ee421'),('950ad71a-716e-4e6f-9707-b8dfabc5f19e','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','44daa961-ff04-4f9f-be57-4395508d1fdb'),('95281558-8669-4e42-a349-f2c0e2b09c38','061bf81a-073b-4f55-bc94-194425788715','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('953bbd05-0248-485f-b475-e4446d5adc28','eddac9b7-391b-4ec6-8a29-7ef9046ba796','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('954bfffd-af84-497b-b590-be4809ee3a0e','47929513-27e2-4b7f-9273-8e16b626df34','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('9564bedc-5612-42a2-b886-bd70cbab0ba2','2ecda9e6-d15a-4b98-8edb-233ed006cfec','44daa961-ff04-4f9f-be57-4395508d1fdb'),('95d56d03-bebd-4e62-9a14-9c807ae1f276','f4615226-2034-4369-b6cb-0d5c579183cf','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('95d68538-7095-4f6e-8a7c-f81d3b21ef8d','f1d97f93-c60b-4b8a-ac15-49d2112fb814','caf93aa4-de65-453e-be16-c0cef90ee421'),('95de6dcf-41c4-463f-849a-cc718c3e5886','bd164a0e-be77-4bfb-9283-ea711d9f7938','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('96437139-fc93-4214-a898-3b1cf4241c86','0ec2a9c8-4be9-4056-838c-86ea88178858','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('96875910-c854-49d3-ba9c-8eee8e40507b','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('96af5f2a-75bc-4fa7-8cf6-f5b8e2a8a3af','6be10468-c5cc-446e-951d-11ad5048f01f','b7a69208-8267-44f7-b843-ff51b2482d07'),('96fa0cd1-6b34-4494-a56c-db8e6c4d2216','6e767cf7-52e4-4010-91d3-f247654fb567','100a17da-6ea9-4c35-9f2b-159efb994713'),('972e6d2b-2a07-487c-9a8d-a5f2060a2a19','972754b2-d54d-4429-8e74-5153ccacd170','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('974f82a9-0d56-45d4-a61a-debff563b0dd','a3502307-fe20-41ef-86d7-c0b3102e7371','fc3727ea-112c-4341-9589-f88b9321c227'),('97b388b9-248f-4551-8cba-945d39714d02','2e860c1d-fad7-4d34-92de-b31b0735c573','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('97ccfef4-c858-484a-bc19-bd79c3bfec65','b7dd1ca5-a5af-4ac7-946e-4cd93c6ba240','b7a69208-8267-44f7-b843-ff51b2482d07'),('97e002c3-0481-4a90-9abd-2bbe24deea54','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('97ee187f-5b9d-4d2b-91f8-23efa5895c2a','5893a799-cfd2-46c8-8ba4-56e7580ec143','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('987bc12d-d344-4044-b847-53e850e289b9','15b8b234-338b-43e9-81e4-32c201ab330e','822fed41-7169-4376-a254-b312f0c521fe'),('9892164a-91c4-467b-9396-113caac03776','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','b7a69208-8267-44f7-b843-ff51b2482d07'),('9905e4ca-4e47-48e5-985f-0b05b66b7148','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('992c0373-3abc-4529-bb61-a0c905ca38c0','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','44daa961-ff04-4f9f-be57-4395508d1fdb'),('9939ee17-eee3-42f0-a44e-865f346b1143','5d6b198e-7555-40a1-8105-aec7f144d719','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('994e2972-67be-49d3-8abc-47f1a70355a8','eddac9b7-391b-4ec6-8a29-7ef9046ba796','44daa961-ff04-4f9f-be57-4395508d1fdb'),('99639d30-f99c-4857-a9bb-d30db3b0f7fd','e79ed356-8035-4687-9fe9-b3ddd2230deb','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9978008d-4d1a-49fd-82b8-1254fad8fb5a','e18c9a94-7064-4b5f-9a10-40041b7dd5de','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('999df53f-b6db-48d6-bf8f-1f3d40c786f0','c0979193-f268-404d-9d3c-da2211c24e02','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('99c9da97-faa1-4299-b9b1-ffab83e40103','09e39da6-671e-4e13-8706-8025f14d128f','fc3727ea-112c-4341-9589-f88b9321c227'),('99d2e5a0-3dce-47dd-a16a-6248bcaf647e','79cb6076-338d-4c32-859a-9ac932b22ccf','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('99ec6629-f1ee-492a-8d4d-6f86efcee189','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('99fb7db5-dacf-4028-ab16-9a8d7bc32f7d','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('9a0d94ae-efbb-496f-a7cf-78946dc8ae85','0ac16798-0637-449e-87ca-ce047ce3b567','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9a0e37d4-37ed-4284-b7ac-9f481a56fbd9','e18c9a94-7064-4b5f-9a10-40041b7dd5de','cde96503-76da-440c-9d35-e9be21c70616'),('9a25f5ea-1302-41e5-bf76-1f45ba7c5119','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','caf93aa4-de65-453e-be16-c0cef90ee421'),('9a43527f-5fb9-47c2-950d-1764f2bf4a60','cc40a0d1-2664-4982-8ef1-20594df5fc09','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('9a8a097e-8c11-4567-b6f8-61994735b2e4','79cb6076-338d-4c32-859a-9ac932b22ccf','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('9aa46c7f-1852-4be3-992a-06656ef00767','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('9ad3edbe-8153-4772-abcb-bfe9929c1522','c20c3f03-7313-4d79-ac7b-88f210a5df01','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9baad514-921e-423d-8deb-57923ce4e736','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','fc3727ea-112c-4341-9589-f88b9321c227'),('9bd806bf-2df8-411b-90c6-57f956f5a543','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','44daa961-ff04-4f9f-be57-4395508d1fdb'),('9c0c7d33-1add-4bc2-b15a-341ab3fc8cc2','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('9c1fa6b6-bc91-4968-bdef-157da64327aa','e79ed356-8035-4687-9fe9-b3ddd2230deb','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9c56fc5b-2a48-4d83-94bd-e8faab97f6de','f9a1bc16-714f-498f-a35a-405a77cc1366','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('9c6f4bb9-7e1b-414d-a069-bd57d6bc5e50','f9a1bc16-714f-498f-a35a-405a77cc1366','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('9c7136a4-76e6-4209-abcc-f3182d033b0d','226539b9-6717-4de2-869f-a6bb046b9a18','822fed41-7169-4376-a254-b312f0c521fe'),('9ca74876-dbb7-48c8-83bb-3bd035755cdb','64174de7-e444-4b4d-81c7-ea8f3cc49240','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('9cb5731c-f702-4ee7-a0b9-7e36be2e8a50','7024dee8-59ff-4132-b472-07fc6dc62457','3ac1b691-1154-460f-9c17-33ba2e46ef23'),('9ce64ddb-be18-4717-9126-b1123a8343b7','5da09e50-1448-4275-bba9-2d135d086a53','fc3727ea-112c-4341-9589-f88b9321c227'),('9cea823c-b4ee-4d13-a149-b8dc0ec076da','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','100a17da-6ea9-4c35-9f2b-159efb994713'),('9cef8a37-cead-4f89-a652-8553cfe6f274','0ac16798-0637-449e-87ca-ce047ce3b567','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('9d0c107d-ad03-4048-80cc-32e8da4b07df','3216803b-9720-4af1-a034-7b64ac02f85a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9d0d4cf4-0491-4fc4-b43d-5090bd762bad','957391ad-b746-4313-9654-066c180afec7','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('9d2598b6-a873-4750-8052-cbc5e4ab0745','eddac9b7-391b-4ec6-8a29-7ef9046ba796','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9d3fd891-cda1-4594-9fd9-03178d452cc7','030303a4-eab5-4863-a257-317b6530a668','fc3727ea-112c-4341-9589-f88b9321c227'),('9deec508-16aa-4b66-a526-f62d3f0cf5e3','10689571-a849-4a3d-8eb7-6fc74cd4477b','fc3727ea-112c-4341-9589-f88b9321c227'),('9df9437d-8f5c-4929-a9e2-fdefde85e8bc','0cd308e4-ef0e-44cc-9547-a9999499e83a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('9e1a1d90-1289-4c29-aca9-00d540c868ae','c0979193-f268-404d-9d3c-da2211c24e02','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('9e1d1f6e-f897-422b-80bd-a52d7edfedee','49a45a15-addb-4296-902b-035635450bcd','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('9e324d47-17f7-42b4-9de0-6e11f844cc5c','226539b9-6717-4de2-869f-a6bb046b9a18','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('9ee4c891-997e-444c-80d7-1bc3f23568aa','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9f5fa1ee-59ed-4c4c-be6a-761366ed3ca1','5da09e50-1448-4275-bba9-2d135d086a53','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('9f8d2755-676c-4e85-bcdb-f918a27e2c7b','0cd308e4-ef0e-44cc-9547-a9999499e83a','b7a69208-8267-44f7-b843-ff51b2482d07'),('9f93e05c-7260-4a19-813b-6fc269778047','030303a4-eab5-4863-a257-317b6530a668','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('9f99a9ed-41bb-42b7-bcd2-ff6f63f2a9d2','3216803b-9720-4af1-a034-7b64ac02f85a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('9fe220ec-d26b-4a38-9cfa-f3d0122eed7e','290e9538-0904-4e8d-8b56-c31ca4031d8b','cde96503-76da-440c-9d35-e9be21c70616'),('9fe7779b-e36a-4b0f-8d6b-6c85220e05fc','b2e0785f-0e91-4643-aaeb-1d48363ef971','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('9ffa49ba-9738-49bf-8da0-985012a22626','7c76a2e6-fe7f-49c4-a128-236de5a2159e','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('a00b807e-5dec-4039-b224-53e841bf7ab6','f9a1bc16-714f-498f-a35a-405a77cc1366','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('a0847404-a25c-4b51-ad49-248e385e96cb','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('a0a3e02e-8958-42a9-8e3d-48f225b10661','6be10468-c5cc-446e-951d-11ad5048f01f','fc3727ea-112c-4341-9589-f88b9321c227'),('a0cf6064-7167-4e8f-a1a6-da7b57f470d1','3216803b-9720-4af1-a034-7b64ac02f85a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('a0e5a6d5-d286-4fa2-a570-ef72caf2bbf3','cc40a0d1-2664-4982-8ef1-20594df5fc09','822fed41-7169-4376-a254-b312f0c521fe'),('a0eaa34a-73ea-4016-84a6-8ad4fa85e08e','b2e0785f-0e91-4643-aaeb-1d48363ef971','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('a0f34b0d-711b-4622-a6fd-83f94eed167c','64174de7-e444-4b4d-81c7-ea8f3cc49240','b7a69208-8267-44f7-b843-ff51b2482d07'),('a12e279f-e1e5-4cb8-8040-15a256b9ac5d','226539b9-6717-4de2-869f-a6bb046b9a18','cde96503-76da-440c-9d35-e9be21c70616'),('a17dd75a-30f0-4aac-b0df-6ed20e1b3aea','354ad423-d455-481f-94e2-1b840d779842','fc3727ea-112c-4341-9589-f88b9321c227'),('a202af89-4e8f-463d-8a34-267fa26f80ba','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','822fed41-7169-4376-a254-b312f0c521fe'),('a222288b-2d00-4091-a1bd-e34e71cf8b9f','354ad423-d455-481f-94e2-1b840d779842','822fed41-7169-4376-a254-b312f0c521fe'),('a224a190-4621-4f4e-acd9-91a72b1db7a2','2acb3df6-f623-4c6b-8a88-ad97b2b64722','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('a2445a3d-8681-452d-b16f-7d3e04d4ae8d','007e2dab-1034-4577-a8b5-3efb0f793ae4','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('a25553a4-c3fb-4771-97d7-ac5dec5a4939','007e2dab-1034-4577-a8b5-3efb0f793ae4','822fed41-7169-4376-a254-b312f0c521fe'),('a2a29d82-3f92-4242-9563-30cadba58aa1','c83e09a9-3394-4693-aee3-e896a6d31b0a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('a2da7416-3f6f-44dc-b9d1-12f72396afe3','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('a2f3308e-8dc7-4dc5-a4a4-510aaee7af74','6b73b416-a32d-40fb-a343-b570d2e8d2cc','b7a69208-8267-44f7-b843-ff51b2482d07'),('a354819f-aaff-4313-9751-b567dcdc6d92','0cd308e4-ef0e-44cc-9547-a9999499e83a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('a3a5792a-2d6d-4791-b27e-7927f7c1f424','49a45a15-addb-4296-902b-035635450bcd','cde96503-76da-440c-9d35-e9be21c70616'),('a3c106d7-a171-4742-907e-c4357840593a','62181cbe-506f-4ada-90c3-f32828c9776e','caf93aa4-de65-453e-be16-c0cef90ee421'),('a407408a-f1ea-471a-a0f0-db983b602453','4ada79ea-e654-47fd-92a6-e8d32913a6a2','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('a4212fcb-3b8b-4e8a-bb15-973cdf8afb6f','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('a46fd319-af11-4b55-a6c2-7867818db254','9aada076-b566-4d5d-9941-3004d5d07f92','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('a47fe5f4-87d6-4e22-8d45-ba5c9b6abf9d','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('a4ae1335-5503-4c6f-a33f-fc61b1f77619','358374f1-3eab-4efd-99b9-28cceb3a354f','822fed41-7169-4376-a254-b312f0c521fe'),('a4b70757-eaf9-495c-a5e9-da46f511c526','5da09e50-1448-4275-bba9-2d135d086a53','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('a4bd769e-442d-4576-b7e0-40d0e8598f63','c83e09a9-3394-4693-aee3-e896a6d31b0a','822fed41-7169-4376-a254-b312f0c521fe'),('a4ee807d-e3af-46b5-b2e1-ac5fc32761f1','47929513-27e2-4b7f-9273-8e16b626df34','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('a63d6672-588e-4909-9869-7c3131480b2a','df32d0dd-aa61-44d8-92ef-d63c009626b5','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('a6d9b393-8c3e-44c9-8abd-04cfef48c2d9','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','100a17da-6ea9-4c35-9f2b-159efb994713'),('a6db0f12-5c19-4f45-82cd-43d58af8f796','bd164a0e-be77-4bfb-9283-ea711d9f7938','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('a6e0652f-ffed-466d-a966-3d786540c762','423abd6b-c588-4e8d-9fbf-60e55c2b2a48','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('a7009311-418f-492d-93b7-ee6e89e629da','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','fc3727ea-112c-4341-9589-f88b9321c227'),('a718651f-140c-4cc1-8d9e-93e38cdbbea4','cda33bff-9526-41c1-9a55-8aed371650ab','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('a805f573-ab8b-46ee-8faa-8cb4b732112f','0cd308e4-ef0e-44cc-9547-a9999499e83a','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('a8107345-0959-4800-bc2b-b14f6123b678','eddac9b7-391b-4ec6-8a29-7ef9046ba796','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('a836f08e-48d1-4966-9059-883cd03d667b','7c76a2e6-fe7f-49c4-a128-236de5a2159e','fc3727ea-112c-4341-9589-f88b9321c227'),('a87f46f7-8f17-413e-82a4-b0e4cc1f88f4','d8827eed-a8fe-4fc5-9a35-82a620e6c791','caf93aa4-de65-453e-be16-c0cef90ee421'),('a895c950-0226-4b9c-bda6-baf6b77d263c','5893a799-cfd2-46c8-8ba4-56e7580ec143','caf93aa4-de65-453e-be16-c0cef90ee421'),('a8bd3019-9ebe-4182-8ea6-e01e49010cc3','e79ed356-8035-4687-9fe9-b3ddd2230deb','44daa961-ff04-4f9f-be57-4395508d1fdb'),('a8d08200-71ab-4f72-b4c2-27aed04d9539','64174de7-e444-4b4d-81c7-ea8f3cc49240','44daa961-ff04-4f9f-be57-4395508d1fdb'),('a903a769-4e30-4b87-be92-0a1c835c6961','061bf81a-073b-4f55-bc94-194425788715','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('a911635d-2bf8-4f83-86e7-45ca653345b0','7496836a-a18c-4db7-8df7-724c8df5b381','caf93aa4-de65-453e-be16-c0cef90ee421'),('a91c84e4-8c70-4092-8655-e1ae6459d539','47929513-27e2-4b7f-9273-8e16b626df34','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('a91f1664-90bd-4896-af66-b6ff5ab396e7','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('a968e5d7-b004-4364-91cd-d9acb502ce47','4c0911b3-22a5-4559-8dad-71de868a4cd6','caf93aa4-de65-453e-be16-c0cef90ee421'),('a9cc4738-6b5f-47aa-a68d-ddc0bb7d560d','30c54bd0-5b3a-437e-a669-abb480c34af8','44daa961-ff04-4f9f-be57-4395508d1fdb'),('a9d83b0a-1677-40dc-b398-c794e442d2bc','3a45d13b-18aa-4879-8460-e7d5315926f9','b7a69208-8267-44f7-b843-ff51b2482d07'),('aa56d49d-0fb7-4ae8-bfb4-9aacde9389b5','9128ece7-28e2-4467-a346-3d53646be8e2','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('aa58cc06-4fa0-445c-82e7-cd23197642e6','30c54bd0-5b3a-437e-a669-abb480c34af8','fc3727ea-112c-4341-9589-f88b9321c227'),('aa7e5f66-6298-4a16-80af-0fa5b6f72813','e79ed356-8035-4687-9fe9-b3ddd2230deb','fc3727ea-112c-4341-9589-f88b9321c227'),('aa895c98-0949-4d59-85c0-ca6275f8702a','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','100a17da-6ea9-4c35-9f2b-159efb994713'),('aa8f4042-fcc8-479c-90ae-c981ff45f1ca','972754b2-d54d-4429-8e74-5153ccacd170','caf93aa4-de65-453e-be16-c0cef90ee421'),('aaa07302-6805-4287-8be3-6ba54546ff4e','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('aaa60396-5d19-45a2-bff0-b21d31bbb875','bbd2b239-1ef2-4f49-8d86-f3778126d282','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('aad502df-981b-4a89-94ca-395ed082694d','5d6b198e-7555-40a1-8105-aec7f144d719','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('aaffe8a7-5664-427d-bc5f-6023725a94ff','4ada79ea-e654-47fd-92a6-e8d32913a6a2','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('ab5055db-80f3-43ef-ba7c-dbb936f3807c','957391ad-b746-4313-9654-066c180afec7','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('ab6cd030-d065-486b-ade2-9349970b2ea8','e79ed356-8035-4687-9fe9-b3ddd2230deb','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('ab726cd6-9c2f-4cd7-84b4-d76b21874d0f','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('abbccf47-fef4-46be-8dff-7b86535b82e9','a3502307-fe20-41ef-86d7-c0b3102e7371','100a17da-6ea9-4c35-9f2b-159efb994713'),('abde1f39-7f2a-4857-882d-b315be18aad9','f4615226-2034-4369-b6cb-0d5c579183cf','fc3727ea-112c-4341-9589-f88b9321c227'),('abfa4ce1-ce6d-49ef-aa36-c20f724e6860','5da09e50-1448-4275-bba9-2d135d086a53','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('abfd4d44-8f26-44f3-a877-58f8d0c7dd1b','354ad423-d455-481f-94e2-1b840d779842','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('ac660c97-f060-47d5-8775-d7106332f883','4e01f760-b4b6-4fbc-af4a-050559406a20','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('acd86b79-e9f8-4106-b1c0-1ee8d10a7a2f','47929513-27e2-4b7f-9273-8e16b626df34','b7a69208-8267-44f7-b843-ff51b2482d07'),('acde5ed0-dc86-4ebb-a255-adb1ba9b0d29','9aada076-b566-4d5d-9941-3004d5d07f92','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('ad1a2712-b2f0-4f23-bcb6-4bba65289f00','7496836a-a18c-4db7-8df7-724c8df5b381','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('ad8832f3-4718-4f6e-bcb6-448d9692489b','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','822fed41-7169-4376-a254-b312f0c521fe'),('ad8f5d48-9c59-4128-bdf2-ea471c59090d','6be10468-c5cc-446e-951d-11ad5048f01f','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('ae34c1a7-3cf7-4452-a459-3516ccb8185e','10689571-a849-4a3d-8eb7-6fc74cd4477b','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('ae359703-72eb-43b4-aed1-890f0ab72cc1','d8827eed-a8fe-4fc5-9a35-82a620e6c791','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('ae39e913-90a2-4da6-b365-f31a9250f6ce','7528587d-0d4f-4270-92ac-ef27b1b6263f','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('ae4b2b22-ac93-4e26-a2d8-dd89936d1697','5893a799-cfd2-46c8-8ba4-56e7580ec143','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('ae4d86d3-9e62-4903-90b8-849b5513505b','3a45d13b-18aa-4879-8460-e7d5315926f9','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('ae4fdb94-acfb-437a-a5c1-2d4a9e461f88','c83e09a9-3394-4693-aee3-e896a6d31b0a','cde96503-76da-440c-9d35-e9be21c70616'),('ae70307a-17b6-4cf8-9d6e-216fb89d6b61','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('aecea31c-fec5-4f70-8677-89f7cde32371','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','44daa961-ff04-4f9f-be57-4395508d1fdb'),('aeda1365-7a31-4b28-9ed9-fa5aa01addd5','0fd38122-485d-4f0c-84be-65cbcfe1ffec','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('aeecc735-8fa1-4e97-aafa-fe040b5e176b','47929513-27e2-4b7f-9273-8e16b626df34','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('aeed5160-6323-45c3-8f35-371236f909e8','47929513-27e2-4b7f-9273-8e16b626df34','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('aefbebb9-302c-46e8-bb5c-6f639f2818e8','f4615226-2034-4369-b6cb-0d5c579183cf','cde96503-76da-440c-9d35-e9be21c70616'),('aefee952-c17d-47b2-b719-3af76344ac75','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','b7a69208-8267-44f7-b843-ff51b2482d07'),('af8c2ab6-c2aa-4d9a-8701-271d631e0843','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('afe533c6-95ad-40dd-bdf3-3e6a16a10e19','7528587d-0d4f-4270-92ac-ef27b1b6263f','100a17da-6ea9-4c35-9f2b-159efb994713'),('b06d0aeb-3d36-48fc-a791-f410a1c3f4aa','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','822fed41-7169-4376-a254-b312f0c521fe'),('b0ca719f-6d98-460f-9e15-e21784a30c4b','64174de7-e444-4b4d-81c7-ea8f3cc49240','fc3727ea-112c-4341-9589-f88b9321c227'),('b0d16b7a-6d1d-4b0f-882a-12d8f16b9836','f9a1bc16-714f-498f-a35a-405a77cc1366','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('b0d88fcb-2fa6-4e12-a6c1-7a53f930d1bc','eddac9b7-391b-4ec6-8a29-7ef9046ba796','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('b0ef388b-6041-4503-904f-133f1e774467','f9a1bc16-714f-498f-a35a-405a77cc1366','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('b16d4c15-a120-4313-941d-47fd0b9c21e9','4c0911b3-22a5-4559-8dad-71de868a4cd6','cde96503-76da-440c-9d35-e9be21c70616'),('b19d1a2a-768a-4fc0-9ba8-132e03c763d7','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('b1ac80fb-be10-4730-b02e-029c8f77f2dd','7528587d-0d4f-4270-92ac-ef27b1b6263f','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('b1b7b193-0648-43c5-98cc-1c42cc774204','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','822fed41-7169-4376-a254-b312f0c521fe'),('b1c26e22-3c9a-4356-91e3-a21dbd980410','7496836a-a18c-4db7-8df7-724c8df5b381','b7a69208-8267-44f7-b843-ff51b2482d07'),('b1ca9362-3e55-46c5-a593-ea7c3e9014ec','4ada79ea-e654-47fd-92a6-e8d32913a6a2','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('b1dbfeb1-8465-4714-9000-a49c10b548bd','c0d6aeba-5e16-4965-afc2-7c38427e56a3','caf93aa4-de65-453e-be16-c0cef90ee421'),('b1e66aa6-0ff0-4d7e-8f60-d947bf54a8c1','e79ed356-8035-4687-9fe9-b3ddd2230deb','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('b1f33ebb-cdb7-4699-b029-1e76dec915dd','290e9538-0904-4e8d-8b56-c31ca4031d8b','fc3727ea-112c-4341-9589-f88b9321c227'),('b21d11d4-242f-4339-bf5a-3148c9483559','3a45d13b-18aa-4879-8460-e7d5315926f9','822fed41-7169-4376-a254-b312f0c521fe'),('b23d8c66-333c-47c8-9dbc-0ea6706f998a','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','822fed41-7169-4376-a254-b312f0c521fe'),('b2823191-4f47-4424-acb5-ec9e173d3f96','e9a93e86-d156-483d-b84b-90e9654fb0ea','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('b284eccd-8fbc-46a3-8582-f2cbf911cf60','f9a1bc16-714f-498f-a35a-405a77cc1366','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('b294be3a-bf8b-4a45-b4a9-2026b460e493','49a45a15-addb-4296-902b-035635450bcd','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('b2b61fe6-7dfc-41eb-8937-3946920deb3d','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('b2d6cb73-6366-448a-89c0-319c723f4fc8','e79ed356-8035-4687-9fe9-b3ddd2230deb','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('b30d0d0e-4298-4641-971b-e061de2b92e6','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('b324e6a0-6fe9-492d-8eea-7f5306340748','0fd38122-485d-4f0c-84be-65cbcfe1ffec','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('b336f516-4b0a-4e7b-bf2c-bcabb4ce154d','2ecda9e6-d15a-4b98-8edb-233ed006cfec','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('b37e3fd8-d82b-4b53-b06f-a7b5dbb0cb7b','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','cde96503-76da-440c-9d35-e9be21c70616'),('b3d84695-5cf1-4340-a553-747c52988050','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('b441c80e-9b9d-4b36-ada9-ced12763d9f6','b7dd1ca5-a5af-4ac7-946e-4cd93c6ba240','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('b44fe12f-6405-44c8-8161-e18feeed884b','64ee63fe-0a0f-482d-9c16-b3c71c75761c','44daa961-ff04-4f9f-be57-4395508d1fdb'),('b475db42-2bb5-443c-8445-27d388f5da57','5708ce69-090b-407a-bf8f-9795914e98cf','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('b5079936-4b3d-4db2-bf6c-1bbc2bdd72c1','3216803b-9720-4af1-a034-7b64ac02f85a','caf93aa4-de65-453e-be16-c0cef90ee421'),('b5302d95-c878-4b9d-91a4-60d656107874','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('b55644dc-029f-4550-b338-7c6183ed6af0','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('b56b9754-9eac-462a-b6eb-837ef11dbbb6','eddac9b7-391b-4ec6-8a29-7ef9046ba796','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('b591a2ed-2d62-408f-bb2c-7d6b8dabe1ba','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','44daa961-ff04-4f9f-be57-4395508d1fdb'),('b6035d28-f565-4f7d-ac95-7a632d80bb01','e18c9a94-7064-4b5f-9a10-40041b7dd5de','44daa961-ff04-4f9f-be57-4395508d1fdb'),('b60b54d7-3abd-4d49-aae5-809b07a7a23f','260f71fa-1d2e-48f6-a672-e2ce857097e5','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('b648c9f4-0289-4e36-b5dc-5c141505756a','3a45d13b-18aa-4879-8460-e7d5315926f9','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('b688eb06-2730-40c6-a31f-983d6d9611ab','6be10468-c5cc-446e-951d-11ad5048f01f','822fed41-7169-4376-a254-b312f0c521fe'),('b7f353f2-f215-4bf0-a53c-2b70ef5d86fb','0ac16798-0637-449e-87ca-ce047ce3b567','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('b7f609a5-e98c-467e-959b-b00a9ca4ab67','5da09e50-1448-4275-bba9-2d135d086a53','822fed41-7169-4376-a254-b312f0c521fe'),('b81fa092-ef90-46fc-b37c-373ca930af07','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','cde96503-76da-440c-9d35-e9be21c70616'),('b857f875-99eb-4dfd-8f22-c721f32c7600','0a44ffa8-3870-472e-98fa-e33dbc7fc322','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('b893fbcb-3ee0-4005-8d39-1ec9de1dcac8','0cd308e4-ef0e-44cc-9547-a9999499e83a','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('b8e24ff4-f572-457f-a3b4-f0a5d2dd6a1e','f1d97f93-c60b-4b8a-ac15-49d2112fb814','fc3727ea-112c-4341-9589-f88b9321c227'),('b8ece61f-d311-4f6d-88c3-2e8584facc72','79cb6076-338d-4c32-859a-9ac932b22ccf','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('b8f2eff6-00de-49f9-a2d7-5476a4c92516','f1d97f93-c60b-4b8a-ac15-49d2112fb814','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('b8fe6c67-2d38-4a6c-90ff-ab225ffeaf7c','358374f1-3eab-4efd-99b9-28cceb3a354f','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('b93515cd-c0ac-47d4-9040-be989ca60abd','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('b94797dc-4913-45b9-8758-6e8690dbfbbe','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','100a17da-6ea9-4c35-9f2b-159efb994713'),('b96d3171-5b19-44da-abee-7687be46b6b9','30c54bd0-5b3a-437e-a669-abb480c34af8','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('b9a9e056-0bcd-470e-a06e-8d14b1cab67e','c20c3f03-7313-4d79-ac7b-88f210a5df01','100a17da-6ea9-4c35-9f2b-159efb994713'),('b9badeb8-9757-4526-9cda-7c514b8e36ab','64ee63fe-0a0f-482d-9c16-b3c71c75761c','caf93aa4-de65-453e-be16-c0cef90ee421'),('b9d61587-8011-41aa-8cf8-9235a4ed9a9d','e9a93e86-d156-483d-b84b-90e9654fb0ea','cde96503-76da-440c-9d35-e9be21c70616'),('b9dbbd23-9d4c-48c1-bc74-24b2b78ff11b','7c76a2e6-fe7f-49c4-a128-236de5a2159e','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('b9e7d90c-adc5-4e61-8f56-2e37e83c4279','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','822fed41-7169-4376-a254-b312f0c521fe'),('ba151bdf-18be-4a6b-be11-3947c7fcdecd','f4615226-2034-4369-b6cb-0d5c579183cf','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('ba17b137-1b74-4bf9-a867-1ca1c6245a5c','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('ba686c95-8255-4a21-ac78-33d0214e2afa','4ada79ea-e654-47fd-92a6-e8d32913a6a2','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('ba8f730c-5e34-4a29-b5da-e4f816726597','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','822fed41-7169-4376-a254-b312f0c521fe'),('bac77cc5-f373-48ba-97d8-94cf3037ab83','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','b7a69208-8267-44f7-b843-ff51b2482d07'),('bad7ba8b-0b5d-4322-bdcb-4ecb38b0d92a','0a44ffa8-3870-472e-98fa-e33dbc7fc322','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('baf0cdbd-f17c-46ca-987e-85ac43a7847b','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('baf11110-9c69-419d-a78c-6a467fff5797','bc78dda8-1a72-423e-85b1-fb5fe51bae76','822fed41-7169-4376-a254-b312f0c521fe'),('bb08b1e5-7b4f-41fa-977e-0f4b9251b8db','2ecda9e6-d15a-4b98-8edb-233ed006cfec','b7a69208-8267-44f7-b843-ff51b2482d07'),('bb2975ab-d32a-46cd-84a6-f39c49b8eac1','c0d6aeba-5e16-4965-afc2-7c38427e56a3','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('bb35d4fb-24a6-40ff-a070-f4b5a8ff7423','f9a1bc16-714f-498f-a35a-405a77cc1366','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('bb4462de-2d41-4a7b-b34b-0d4160a75ec6','eddac9b7-391b-4ec6-8a29-7ef9046ba796','822fed41-7169-4376-a254-b312f0c521fe'),('bb7373b6-9806-4454-9d25-8aed6b2801d9','4c0911b3-22a5-4559-8dad-71de868a4cd6','822fed41-7169-4376-a254-b312f0c521fe'),('bb780e4e-1d91-498a-8925-7c7b603341d0','c5a69b9c-441d-4456-9535-b0a72927ba6a','caf93aa4-de65-453e-be16-c0cef90ee421'),('bb844f81-4124-4805-8d4b-7db1e405a125','2e860c1d-fad7-4d34-92de-b31b0735c573','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('bbe1a100-0ed2-4ba3-8a2e-f25523ce367a','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','100a17da-6ea9-4c35-9f2b-159efb994713'),('bca30e16-69af-45ae-ac31-36c1ff064bb7','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('bcc3fdaa-da67-4702-9084-110a879d147e','a3502307-fe20-41ef-86d7-c0b3102e7371','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('bd013b9b-94b0-4fa0-be7c-8580e4c86955','7c76a2e6-fe7f-49c4-a128-236de5a2159e','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('bd0e4c19-454d-4f6d-b665-773b1a886d11','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','fc3727ea-112c-4341-9589-f88b9321c227'),('bd8c0adb-89e3-4279-b3a1-401c02c48209','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('bd8f45ad-67f6-48ed-9f9d-9363919eddd3','354ad423-d455-481f-94e2-1b840d779842','44daa961-ff04-4f9f-be57-4395508d1fdb'),('bd98e73e-2d53-455a-a16a-77a8d62963af','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','fc3727ea-112c-4341-9589-f88b9321c227'),('bd9a0168-8653-46df-8fa8-c53924ad872d','b5fb6b99-f329-408e-98d3-877fc898ab93','b7a69208-8267-44f7-b843-ff51b2482d07'),('bda3191b-d7bc-4da0-ae3e-da8a39679450','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','822fed41-7169-4376-a254-b312f0c521fe'),('bdd7b641-e2f1-4954-92a6-f481e5d2a470','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','caf93aa4-de65-453e-be16-c0cef90ee421'),('bddaeb17-c71d-435a-8302-fff000aeddcc','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','822fed41-7169-4376-a254-b312f0c521fe'),('bdf2dabe-3094-4526-bb4f-d65007467fc9','e18c9a94-7064-4b5f-9a10-40041b7dd5de','b7a69208-8267-44f7-b843-ff51b2482d07'),('be1840bf-bd47-4ff7-91a0-767e96ef819a','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('be2d0a91-7e79-4bb6-aad3-fdf9a93cc457','e9a93e86-d156-483d-b84b-90e9654fb0ea','fc3727ea-112c-4341-9589-f88b9321c227'),('be69d716-8f43-40c3-b02b-67ce907f14cb','62181cbe-506f-4ada-90c3-f32828c9776e','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('beb60e25-ffa4-42ea-94ae-30452c4284fd','030303a4-eab5-4863-a257-317b6530a668','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('bed344e9-1f54-4f26-bc94-776f612293ef','423abd6b-c588-4e8d-9fbf-60e55c2b2a48','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('bed3cecd-6ea1-47e1-ba6e-217d41a5b107','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','100a17da-6ea9-4c35-9f2b-159efb994713'),('bf188682-08e8-4e6a-a685-970d3c53639d','64174de7-e444-4b4d-81c7-ea8f3cc49240','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('bf31d485-0414-42e4-9917-b5dfef0b6eff','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','100a17da-6ea9-4c35-9f2b-159efb994713'),('bf5ad0a3-99c7-4055-8bb8-4fc039144de1','972754b2-d54d-4429-8e74-5153ccacd170','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('bf760b00-c69c-4c2b-a04a-2806646e9c2e','c0d6aeba-5e16-4965-afc2-7c38427e56a3','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('bfc4c8d4-3683-47d3-aa0a-a1c281d2f415','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','fc3727ea-112c-4341-9589-f88b9321c227'),('bfca8120-b446-45f6-b041-5343c3693589','007e2dab-1034-4577-a8b5-3efb0f793ae4','100a17da-6ea9-4c35-9f2b-159efb994713'),('bfeb0bf9-e9d6-4154-b5c9-58ab565c4f91','030303a4-eab5-4863-a257-317b6530a668','822fed41-7169-4376-a254-b312f0c521fe'),('c00b517b-ba1e-4db2-869f-9e95372580a1','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('c00e97a4-87d1-4101-8087-8822b8a0258b','0a44ffa8-3870-472e-98fa-e33dbc7fc322','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('c0195755-285f-475a-ad59-703a72070926','2e860c1d-fad7-4d34-92de-b31b0735c573','100a17da-6ea9-4c35-9f2b-159efb994713'),('c028a2aa-3140-4384-aece-d97911d9bc0d','c20c3f03-7313-4d79-ac7b-88f210a5df01','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('c0345069-bfc9-4762-a65b-bf5bb2e55112','2acb3df6-f623-4c6b-8a88-ad97b2b64722','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('c06df64f-165d-41ea-81c3-efb399e614a1','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('c1379d1a-d498-47d0-85e5-2d2547b69f42','358374f1-3eab-4efd-99b9-28cceb3a354f','caf93aa4-de65-453e-be16-c0cef90ee421'),('c1af83eb-898c-4015-81d3-c2cdf14389b7','9aada076-b566-4d5d-9941-3004d5d07f92','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('c1d494f9-8bb3-4e08-99fc-8cb358ae406b','cc40a0d1-2664-4982-8ef1-20594df5fc09','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('c230a955-9449-426d-88f0-3a157ef0d524','5d6b198e-7555-40a1-8105-aec7f144d719','caf93aa4-de65-453e-be16-c0cef90ee421'),('c237b57e-4094-47df-b7a8-ee06b2ffd682','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('c23bd5c5-c98c-4a83-b33b-194ffe259963','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('c26eebf6-93bb-4a7a-9d0e-8cb5ba43c919','1458ee77-9304-40e1-ab80-aa9780c5630a','cde96503-76da-440c-9d35-e9be21c70616'),('c29b1584-6982-4365-807c-898255d991ab','eddac9b7-391b-4ec6-8a29-7ef9046ba796','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('c2a4f5bb-401a-4da8-9571-4f622e9713b0','f1d97f93-c60b-4b8a-ac15-49d2112fb814','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('c3851749-fd90-4224-a578-9505482b8f4f','30c54bd0-5b3a-437e-a669-abb480c34af8','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('c398f022-9b4c-4bce-aa6d-91431acf6aab','79cb6076-338d-4c32-859a-9ac932b22ccf','44daa961-ff04-4f9f-be57-4395508d1fdb'),('c3a2ae56-1f53-4804-8745-81ba262956e2','09e39da6-671e-4e13-8706-8025f14d128f','44daa961-ff04-4f9f-be57-4395508d1fdb'),('c3e084ae-b2ba-43b4-abd6-1c0dd846cf7c','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('c3f58246-3bb7-495e-b15d-7d0f50f3da4e','5893a799-cfd2-46c8-8ba4-56e7580ec143','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('c407c613-e7c5-45df-b400-01e172d1afdb','7528587d-0d4f-4270-92ac-ef27b1b6263f','b7a69208-8267-44f7-b843-ff51b2482d07'),('c417bb6e-bb42-4b48-8c26-4d35ce8ec902','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('c435c41a-1309-4ea7-bbb6-dc731504cb46','sadmin','d49533b8-1d5a-402b-a65a-241eb714d1ce'),('c464f49a-ad21-4716-91f1-6b17e69eaf72','0ec2a9c8-4be9-4056-838c-86ea88178858','100a17da-6ea9-4c35-9f2b-159efb994713'),('c4b991cf-8555-48b0-8a5d-3c44087b2683','5da09e50-1448-4275-bba9-2d135d086a53','b7a69208-8267-44f7-b843-ff51b2482d07'),('c4ecb80c-f5be-4a65-a7ef-5378ba91b3e8','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','100a17da-6ea9-4c35-9f2b-159efb994713'),('c4f9411a-cc9f-4ccc-b399-669b497d4308','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('c50d0f23-f68e-406a-9424-b8f28e630451','30c54bd0-5b3a-437e-a669-abb480c34af8','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('c50f7992-84a6-46ce-8478-3bcffc9bd77e','6b73b416-a32d-40fb-a343-b570d2e8d2cc','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('c52fdfb2-1be1-4ae5-a5f2-d52eef2d03e2','47929513-27e2-4b7f-9273-8e16b626df34','fc3727ea-112c-4341-9589-f88b9321c227'),('c5926f74-2083-4304-9820-ed770b0d4677','c20c3f03-7313-4d79-ac7b-88f210a5df01','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('c5a51e3b-1732-4f35-b9e7-5e6b2bf3460c','f9a1bc16-714f-498f-a35a-405a77cc1366','cde96503-76da-440c-9d35-e9be21c70616'),('c6110c9f-ca3c-43a0-af65-16e0da72fbff','9aada076-b566-4d5d-9941-3004d5d07f92','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('c6375bd1-60a1-42d1-95a3-c03a860f8b3e','e79ed356-8035-4687-9fe9-b3ddd2230deb','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('c63b3e0b-6160-40f4-a0a1-3f3f7b34dd1c','956a45a8-29cb-410a-942e-3ff7fe108ae0','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('c6644d42-4ea4-4c67-9040-595905b1237f','2e860c1d-fad7-4d34-92de-b31b0735c573','822fed41-7169-4376-a254-b312f0c521fe'),('c6d89b47-4a2f-4f79-aea7-28d0756fe4d6','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','44daa961-ff04-4f9f-be57-4395508d1fdb'),('c6eb847a-887c-490d-ac77-1dcb184b3c77','358374f1-3eab-4efd-99b9-28cceb3a354f','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('c6f07b56-b607-4049-aa08-ebd9de8a9ab8','e9a93e86-d156-483d-b84b-90e9654fb0ea','822fed41-7169-4376-a254-b312f0c521fe'),('c70b2e8a-9ee3-4222-8d1e-1a3b57c090e3','e18c9a94-7064-4b5f-9a10-40041b7dd5de','fc3727ea-112c-4341-9589-f88b9321c227'),('c7112575-6bba-41cf-aa95-de5f0ec2929d','f9a1bc16-714f-498f-a35a-405a77cc1366','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('c799e7c7-3442-4f3b-b82e-8d57ce913e3e','226539b9-6717-4de2-869f-a6bb046b9a18','44daa961-ff04-4f9f-be57-4395508d1fdb'),('c7a83e3a-3ae6-435b-a928-2e5424cfa446','b7dd1ca5-a5af-4ac7-946e-4cd93c6ba240','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('c81782ef-8132-4111-9b09-7f0319c28f0a','18503716-be18-465d-becc-7aca1ad01081','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('c8342e59-bc79-4473-ac19-27cb8576e598','0ec2a9c8-4be9-4056-838c-86ea88178858','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('c85ead06-0c30-4ac3-b853-c3eee7e60a18','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('c8801959-e6a6-42b4-9126-87c76948ebc4','0ac16798-0637-449e-87ca-ce047ce3b567','fc3727ea-112c-4341-9589-f88b9321c227'),('c88b11a4-e2b1-4fe6-8f14-1d8f12d9beae','30c54bd0-5b3a-437e-a669-abb480c34af8','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('c8f5858c-e55e-41e6-9b44-7a9b2231480e','e9a93e86-d156-483d-b84b-90e9654fb0ea','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('c8f70d35-28bc-4879-9cf3-c382f902f73f','539e1886-2308-407e-b664-09bb43e0ff2f','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('c92523ea-448a-4169-8d41-8d44ea377f71','9aada076-b566-4d5d-9941-3004d5d07f92','fc3727ea-112c-4341-9589-f88b9321c227'),('c9e7d68a-6ef1-4e12-a04e-32b84063828c','f9a1bc16-714f-498f-a35a-405a77cc1366','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('c9f7e705-ceb4-4314-a4b5-a70dcd5c07e1','62181cbe-506f-4ada-90c3-f32828c9776e','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('ca5a393f-dbac-453c-a003-e622595ab610','c0d6aeba-5e16-4965-afc2-7c38427e56a3','b7a69208-8267-44f7-b843-ff51b2482d07'),('cacb1b41-ca9d-444e-927c-3fa3d6e98657','5893a799-cfd2-46c8-8ba4-56e7580ec143','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('caf1ab95-45cf-4c6e-b68c-763f2d6f01b3','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('cb022c7a-bc0d-4e80-98a2-73bcb82bd129','47929513-27e2-4b7f-9273-8e16b626df34','44daa961-ff04-4f9f-be57-4395508d1fdb'),('cb43effc-5a47-4481-913b-1fa0904b5702','7496836a-a18c-4db7-8df7-724c8df5b381','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('cb7462eb-b8c1-4901-bb0b-ecb473b190a0','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','cde96503-76da-440c-9d35-e9be21c70616'),('cb85d36d-bada-44aa-8188-18a083abf554','e9a93e86-d156-483d-b84b-90e9654fb0ea','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('cba1c8ef-1e4f-4a65-8e7f-b8383579be92','f4615226-2034-4369-b6cb-0d5c579183cf','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('cbc7fdfa-d12c-4348-b584-fdb46607b650','18503716-be18-465d-becc-7aca1ad01081','100a17da-6ea9-4c35-9f2b-159efb994713'),('cbfc5ba1-baac-4acb-8165-ade404651e79','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('cc0df34a-e25d-4515-ad5a-81915b7dbe64','3a45d13b-18aa-4879-8460-e7d5315926f9','cde96503-76da-440c-9d35-e9be21c70616'),('cc47853d-e883-4091-bfd7-835f4dfd0487','3216803b-9720-4af1-a034-7b64ac02f85a','fc3727ea-112c-4341-9589-f88b9321c227'),('cc54ed16-71cd-4b3c-83c2-1bfe28b563a9','4ada79ea-e654-47fd-92a6-e8d32913a6a2','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('cc68edb6-7565-4449-a6d2-45ae53fbd826','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','100a17da-6ea9-4c35-9f2b-159efb994713'),('cc8bd453-e63e-461f-96ed-4b46e00ed24a','1458ee77-9304-40e1-ab80-aa9780c5630a','b7a69208-8267-44f7-b843-ff51b2482d07'),('cc90e5fb-75b4-498d-8060-17f082d6ae28','06d06526-8cc2-46d4-a703-596e607dfc05','100a17da-6ea9-4c35-9f2b-159efb994713'),('cccacb52-15ad-4df4-80e3-87087a3457a2','061bf81a-073b-4f55-bc94-194425788715','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('ccd6bfea-3ff5-447e-9275-7f9506553032','0fd38122-485d-4f0c-84be-65cbcfe1ffec','100a17da-6ea9-4c35-9f2b-159efb994713'),('cd3b5137-057e-4b20-967d-1ab109c8080a','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('cdc3abfd-f47a-4582-8c39-55216891cb87','c20c3f03-7313-4d79-ac7b-88f210a5df01','44daa961-ff04-4f9f-be57-4395508d1fdb'),('cdd96c90-b97b-4818-b9b1-6c3ede1734b7','bc78dda8-1a72-423e-85b1-fb5fe51bae76','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('cdf0f529-c627-4ba8-b16c-ae119954310d','290e9538-0904-4e8d-8b56-c31ca4031d8b','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('ce2801f6-0c9e-4b6f-b718-de5d7bc7f3af','4e01f760-b4b6-4fbc-af4a-050559406a20','caf93aa4-de65-453e-be16-c0cef90ee421'),('ce54bdd2-c4a7-4896-8a62-ba25816cc748','b4a9c828-4324-4fc0-8e49-f00dc5a5e1f6','caf93aa4-de65-453e-be16-c0cef90ee421'),('ce55e8b9-3459-474b-bde3-43ecbb2e3958','79cb6076-338d-4c32-859a-9ac932b22ccf','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('ce771a03-1916-45b8-af0e-f537947162c3','64ee63fe-0a0f-482d-9c16-b3c71c75761c','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('ced0cf88-dacb-4d8b-ba6f-ee8ec2510a13','4ada79ea-e654-47fd-92a6-e8d32913a6a2','100a17da-6ea9-4c35-9f2b-159efb994713'),('cf1e7862-6fd0-4287-9c58-8fabdaf8cf72','fb2604e3-9ddc-4c06-b506-5819fbaf4b37','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('cf2956d3-d282-49f4-a788-121ecb08dc98','62181cbe-506f-4ada-90c3-f32828c9776e','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('cf66f566-83bc-42bd-9ec4-4fcb2d5592d7','47929513-27e2-4b7f-9273-8e16b626df34','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('cf8c13e4-bed1-472b-b6c4-553115afbc29','6e767cf7-52e4-4010-91d3-f247654fb567','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('cf8df0d7-2197-4f85-a80b-9d8cf0b913e0','0fd38122-485d-4f0c-84be-65cbcfe1ffec','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('cf94da0b-d47b-4a78-b24f-4a217f460d48','4ada79ea-e654-47fd-92a6-e8d32913a6a2','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d01eab0b-1f36-4e8b-9be2-8050c457f564','bd164a0e-be77-4bfb-9283-ea711d9f7938','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d044440d-e3b3-48d2-a6b5-85d52f4ed47e','10689571-a849-4a3d-8eb7-6fc74cd4477b','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('d05c7c71-e18a-4b23-a359-fcf2f2f01254','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('d07d003f-6b62-47b0-bfde-0b3037d85485','e79ed356-8035-4687-9fe9-b3ddd2230deb','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d09e9aea-2c20-4f43-8f85-c962e89ffdc9','6be10468-c5cc-446e-951d-11ad5048f01f','caf93aa4-de65-453e-be16-c0cef90ee421'),('d0e3b245-a1dc-4f1e-8994-59e9a9eba3f0','957391ad-b746-4313-9654-066c180afec7','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('d0eebb8f-b6e5-4f6d-98a6-cbee404134db','64ee63fe-0a0f-482d-9c16-b3c71c75761c','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('d1054fd0-9067-46c4-8bb6-4549adbed6ff','6b73b416-a32d-40fb-a343-b570d2e8d2cc','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('d14d7acd-39f9-4917-a246-d052196f1ff1','df32d0dd-aa61-44d8-92ef-d63c009626b5','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d17b8e35-42ab-45bd-99ce-7d4137a23612','b2e0785f-0e91-4643-aaeb-1d48363ef971','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('d18ad24e-16cc-46dc-90dc-c65f74dd711f','64174de7-e444-4b4d-81c7-ea8f3cc49240','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('d1a3d769-da4e-448e-a15b-fe03bd442083','4ada79ea-e654-47fd-92a6-e8d32913a6a2','822fed41-7169-4376-a254-b312f0c521fe'),('d1c67165-d287-41f0-ad5d-d35c60d877db','6be10468-c5cc-446e-951d-11ad5048f01f','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('d1f5d249-0dfa-4455-b068-af6aee6d7ddf','10689571-a849-4a3d-8eb7-6fc74cd4477b','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('d20cee6f-65e1-4266-bf98-bd85fad9378a','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','cde96503-76da-440c-9d35-e9be21c70616'),('d2483831-fa43-4dcd-8fe2-5ca97db0e5ac','cc40a0d1-2664-4982-8ef1-20594df5fc09','fc3727ea-112c-4341-9589-f88b9321c227'),('d265cce6-36b6-45f3-ae36-b4138636d53d','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','b7a69208-8267-44f7-b843-ff51b2482d07'),('d269be1b-9a98-445f-a375-0f618b606292','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d276bc3a-5be2-41f7-a36e-07665285620a','49a45a15-addb-4296-902b-035635450bcd','100a17da-6ea9-4c35-9f2b-159efb994713'),('d28db98a-2940-437f-b5d9-02b2a16dddca','15b8b234-338b-43e9-81e4-32c201ab330e','100a17da-6ea9-4c35-9f2b-159efb994713'),('d297ae60-eab2-40c9-ae46-c83f8c35f41f','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('d2e3595d-ab61-4018-b4bb-eedf9fd053f8','956a45a8-29cb-410a-942e-3ff7fe108ae0','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d33b1929-7dbb-4511-a253-993fc2a3273e','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','cde96503-76da-440c-9d35-e9be21c70616'),('d383030a-27cc-408c-8891-cf65384ea869','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d3a00d2e-5b6f-44af-8a2c-ce2455c27d6e','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('d3ac0c4b-f476-454d-9087-4e3880c64c1f','0cd308e4-ef0e-44cc-9547-a9999499e83a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d3fb47a8-76bb-4dbf-9525-765f0006b1a6','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d3fef17f-90b0-4357-8bdb-c1abfe8f881d','7c76a2e6-fe7f-49c4-a128-236de5a2159e','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d43c0b49-cb1b-49f5-81f9-29dfbfb4c2e4','f4615226-2034-4369-b6cb-0d5c579183cf','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d44770d5-9147-4996-9b3d-b137c4c78862','eddac9b7-391b-4ec6-8a29-7ef9046ba796','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d456e213-3677-4a42-9204-1319ff9c8f33','9128ece7-28e2-4467-a346-3d53646be8e2','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d47120be-1362-41a9-a81c-c783646f9c45','10689571-a849-4a3d-8eb7-6fc74cd4477b','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('d4969c8c-5e51-407b-8a95-2c3fa3b5e15f','47929513-27e2-4b7f-9273-8e16b626df34','822fed41-7169-4376-a254-b312f0c521fe'),('d4db4b82-c20d-497a-a045-ef8595f8ad54','7496836a-a18c-4db7-8df7-724c8df5b381','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('d4dd2980-3728-4e89-ab3a-f5327d256a83','007e2dab-1034-4577-a8b5-3efb0f793ae4','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d4def856-2e9d-4bcf-8a5e-746c4ecc278e','f1d97f93-c60b-4b8a-ac15-49d2112fb814','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d4e8c677-7c7f-401a-ba96-b58ff35cded5','9aada076-b566-4d5d-9941-3004d5d07f92','caf93aa4-de65-453e-be16-c0cef90ee421'),('d50bf363-0211-4b49-b39a-77d1bbb3cd49','226539b9-6717-4de2-869f-a6bb046b9a18','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('d51f0aac-c857-42d5-beb5-ea40d120e8b8','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','b7a69208-8267-44f7-b843-ff51b2482d07'),('d5253c18-99f5-433d-a4a2-dae503ce57c9','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','caf93aa4-de65-453e-be16-c0cef90ee421'),('d5497d04-0e40-45b8-8355-a58345237e62','290e9538-0904-4e8d-8b56-c31ca4031d8b','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d552dd40-b6ff-4342-a8e5-704ae3aa6718','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','822fed41-7169-4376-a254-b312f0c521fe'),('d610b2ae-414a-465d-aea4-4beb35b96ffc','bd164a0e-be77-4bfb-9283-ea711d9f7938','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('d66e8bbf-d529-4b6e-85ef-7b1106343077','64ee63fe-0a0f-482d-9c16-b3c71c75761c','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('d7042366-9af3-4015-a309-07e323f9c8ad','e18c9a94-7064-4b5f-9a10-40041b7dd5de','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d716e0ab-ad39-4258-9d24-7841aa79aae2','c83e09a9-3394-4693-aee3-e896a6d31b0a','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('d743d0de-aef0-4843-8632-5e8041549b1b','4c0911b3-22a5-4559-8dad-71de868a4cd6','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d7fd4d21-eeaf-4562-9a45-72f48532710f','18503716-be18-465d-becc-7aca1ad01081','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('d8020130-b2d5-41ae-8362-4132e5650421','b2e0785f-0e91-4643-aaeb-1d48363ef971','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('d80aa4f1-63a4-42b9-ac2f-fb5f26281be6','d8827eed-a8fe-4fc5-9a35-82a620e6c791','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('d81e95e1-6ea7-4aa9-87b8-25e3ceeb6d5d','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('d82c8001-2766-4dcc-93e9-21fbdb7e345f','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('d906e9e7-8252-4fcd-b927-15b2e5f178b8','007e2dab-1034-4577-a8b5-3efb0f793ae4','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('d9283ebc-72bf-4d2b-812c-4c2bb65ff39e','030303a4-eab5-4863-a257-317b6530a668','44daa961-ff04-4f9f-be57-4395508d1fdb'),('d94eb69e-7cdd-4e0f-89a2-c3e50f3c39d2','7528587d-0d4f-4270-92ac-ef27b1b6263f','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('d99a8b4d-c750-4b4b-82c8-fa0f687289a7','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('d9db4813-d9c5-4e40-966c-d0beb2fbfa23','1458ee77-9304-40e1-ab80-aa9780c5630a','822fed41-7169-4376-a254-b312f0c521fe'),('d9e86412-e357-405e-b071-7b5983b4c2f4','0cd308e4-ef0e-44cc-9547-a9999499e83a','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('da5b97e5-17f6-4848-90cb-0930e5b5fa69','e79ed356-8035-4687-9fe9-b3ddd2230deb','100a17da-6ea9-4c35-9f2b-159efb994713'),('daeda2dd-3934-4bb4-85e5-e48578ce4469','c0979193-f268-404d-9d3c-da2211c24e02','b7a69208-8267-44f7-b843-ff51b2482d07'),('db2831fd-1cb5-4247-85a7-bcc9af79280d','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('db5b8eaa-3cad-4cf1-af94-ba26497fba55','230df099-e11a-4e1c-a151-8ba754e1d2a5','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('db5e9c91-402e-4142-9037-4caf4cd95c49','358374f1-3eab-4efd-99b9-28cceb3a354f','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('dba514b9-8abb-4139-b6f4-a4160d9ab26e','423abd6b-c588-4e8d-9fbf-60e55c2b2a48','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('dbb182d7-a559-4901-8fad-29a070cbd114','0f487bc0-1123-416e-999a-fa97bc9e1946','b7a69208-8267-44f7-b843-ff51b2482d07'),('dc205e89-903e-4d47-8429-e7a6d72bbeb9','6be10468-c5cc-446e-951d-11ad5048f01f','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('dc3db975-31c4-492f-834c-570441de8ff3','5893a799-cfd2-46c8-8ba4-56e7580ec143','822fed41-7169-4376-a254-b312f0c521fe'),('dc61b968-1d9b-4549-896f-5848a3e69bd3','c0979193-f268-404d-9d3c-da2211c24e02','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('dcc0db6c-6aa4-4922-b062-fca2d463c69e','0a44ffa8-3870-472e-98fa-e33dbc7fc322','caf93aa4-de65-453e-be16-c0cef90ee421'),('dd0fd408-0ca7-4e8c-b9e6-a87ed186e432','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('dd2397d8-d86b-4f1c-a9c9-d076ee085ce3','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','caf93aa4-de65-453e-be16-c0cef90ee421'),('ddb0f2fa-877a-47b2-937d-8203ca28f6c9','62181cbe-506f-4ada-90c3-f32828c9776e','b7a69208-8267-44f7-b843-ff51b2482d07'),('ddcf1ac8-18c3-496c-8a7d-9464e114aa0c','354ad423-d455-481f-94e2-1b840d779842','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('de005356-e129-4b56-befb-d90bfd5d876a','c20c3f03-7313-4d79-ac7b-88f210a5df01','caf93aa4-de65-453e-be16-c0cef90ee421'),('de2e7807-cd06-47b8-82cb-fa62dc8d6371','cc40a0d1-2664-4982-8ef1-20594df5fc09','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('de36fc20-594a-495d-982d-5c335f1f224a','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('de3b4e34-f332-4237-9a7d-315b4976fb6c','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('de4c0142-93a7-416b-bfa7-086efbd55a9e','a3502307-fe20-41ef-86d7-c0b3102e7371','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('de7a9cc2-2252-4894-b43f-a75bd2472f5d','5d48af70-e855-4ec8-bf7f-e70dacbd4023','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('de8407ac-e2b2-4a1e-a72f-e69dfb8682cc','354ad423-d455-481f-94e2-1b840d779842','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('de857413-ff45-4911-b9db-6e206fbfeb2b','9aada076-b566-4d5d-9941-3004d5d07f92','100a17da-6ea9-4c35-9f2b-159efb994713'),('de90cf66-d292-4cce-9812-a8325d471644','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('ded50603-965d-4949-b90c-9badb05b6b1c','e18c9a94-7064-4b5f-9a10-40041b7dd5de','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('df026ae4-18ec-41ad-8ee0-dc0f2e3bac1b','030303a4-eab5-4863-a257-317b6530a668','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('df794f12-bbe0-4c9d-b339-cd41f7752982','47929513-27e2-4b7f-9273-8e16b626df34','cde96503-76da-440c-9d35-e9be21c70616'),('df81da4b-70ef-4f5d-b9a8-b7a343b54598','e9a93e86-d156-483d-b84b-90e9654fb0ea','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('df8c20c9-279c-4a5e-a8a4-8036ffd8cfbc','b2e0785f-0e91-4643-aaeb-1d48363ef971','822fed41-7169-4376-a254-b312f0c521fe'),('dfa2e6c4-dfab-47d4-ba0e-078e64f69205','0ec2a9c8-4be9-4056-838c-86ea88178858','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('e0039cb5-ae74-4dbb-8eb8-aa631dbea73f','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('e0287f0d-8f54-4e18-b1d5-a8cbe6ea0357','64ee63fe-0a0f-482d-9c16-b3c71c75761c','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e039f3fe-e107-4238-aa54-3e276ba56c9f','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('e04838f0-edca-42de-9e34-693b2cc71420','cc40a0d1-2664-4982-8ef1-20594df5fc09','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('e0791ab1-3dba-4b40-851a-686e0aafd020','e9a93e86-d156-483d-b84b-90e9654fb0ea','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('e09675c4-da9c-4f83-a12a-700feab43d84','e7211217-333a-4001-aac0-c2eac6288637','100a17da-6ea9-4c35-9f2b-159efb994713'),('e0a2e888-7c2b-40b1-a714-1e6aa9cb9712','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','cde96503-76da-440c-9d35-e9be21c70616'),('e0b32885-8223-4a09-ae60-28ba8b87b88f','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e0f41796-ae63-4d27-9d30-b381eca070db','e9a93e86-d156-483d-b84b-90e9654fb0ea','caf93aa4-de65-453e-be16-c0cef90ee421'),('e0fc2e70-fc8f-44f1-8070-9cf357147087','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','caf93aa4-de65-453e-be16-c0cef90ee421'),('e1047a26-e94b-4cab-8e25-8cfbb1330d91','6be10468-c5cc-446e-951d-11ad5048f01f','100a17da-6ea9-4c35-9f2b-159efb994713'),('e1440659-9d30-4a1c-a3ef-b083b2cd56fc','f4615226-2034-4369-b6cb-0d5c579183cf','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('e154e794-14d9-4e29-997a-823bb64087b8','a3502307-fe20-41ef-86d7-c0b3102e7371','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('e1562a65-fdff-4b92-92fd-46f1feab06a4','09e39da6-671e-4e13-8706-8025f14d128f','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('e16af46a-555c-4cee-bc2b-0f1dfab914f0','2acb3df6-f623-4c6b-8a88-ad97b2b64722','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('e176b424-077e-4cea-9ffe-a82e42119339','226539b9-6717-4de2-869f-a6bb046b9a18','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('e1bcb968-246a-41f4-8796-b568062daf54','5d6b198e-7555-40a1-8105-aec7f144d719','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e1fd3556-119f-447c-b8a5-73051c1174da','e18c9a94-7064-4b5f-9a10-40041b7dd5de','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('e22145ed-4035-4642-b1fb-cd53d14261bb','c5a69b9c-441d-4456-9535-b0a72927ba6a','fc3727ea-112c-4341-9589-f88b9321c227'),('e2733232-17fe-4993-ac58-b5832c7936e8','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','cde96503-76da-440c-9d35-e9be21c70616'),('e273ab32-c3ec-478d-b5dd-3e4664fcba37','c83e09a9-3394-4693-aee3-e896a6d31b0a','fc3727ea-112c-4341-9589-f88b9321c227'),('e28fc00b-f60a-4027-8ab6-2bf309779eea','2ecda9e6-d15a-4b98-8edb-233ed006cfec','caf93aa4-de65-453e-be16-c0cef90ee421'),('e2b83e6d-4c8a-4efc-ad1c-dbfc630660c7','c0d6aeba-5e16-4965-afc2-7c38427e56a3','44daa961-ff04-4f9f-be57-4395508d1fdb'),('e36e7e08-d58e-4908-a2db-b309b41e4f92','1de3bcb1-cf86-4cae-bf43-48e6aa68fee1','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('e37999c1-7ae5-4e67-be5c-844655864af2','49a45a15-addb-4296-902b-035635450bcd','fc3727ea-112c-4341-9589-f88b9321c227'),('e389f7d3-052c-40e1-ade5-a66404760400','3a45d13b-18aa-4879-8460-e7d5315926f9','100a17da-6ea9-4c35-9f2b-159efb994713'),('e39771e4-0e2f-4b03-afc2-744fad37f016','5da09e50-1448-4275-bba9-2d135d086a53','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e3c08bed-e736-4e55-bd96-38b34a856e60','2acb3df6-f623-4c6b-8a88-ad97b2b64722','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('e40389fd-2f70-4f39-8dd6-15eaf963b61d','64ee63fe-0a0f-482d-9c16-b3c71c75761c','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('e467da8b-ea37-4bb0-b816-380cfe310258','7528587d-0d4f-4270-92ac-ef27b1b6263f','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('e4b1d9bc-c0eb-4384-8a0a-af20557a7b6d','0fd38122-485d-4f0c-84be-65cbcfe1ffec','cde96503-76da-440c-9d35-e9be21c70616'),('e4b8ace3-dbee-44dc-9edf-894e5af6d574','2acb3df6-f623-4c6b-8a88-ad97b2b64722','44daa961-ff04-4f9f-be57-4395508d1fdb'),('e4c36450-a47d-428f-8d55-819086c66953','358374f1-3eab-4efd-99b9-28cceb3a354f','fc3727ea-112c-4341-9589-f88b9321c227'),('e4dec325-9aa4-4055-85e9-4cfa3098de84','7c76a2e6-fe7f-49c4-a128-236de5a2159e','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('e4faaa8b-c8ce-48d3-aa76-2f902a351027','e79ed356-8035-4687-9fe9-b3ddd2230deb','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('e53906f2-54d1-4f69-9d0b-c319a0f12d5e','5893a799-cfd2-46c8-8ba4-56e7580ec143','100a17da-6ea9-4c35-9f2b-159efb994713'),('e551a27b-5aaa-45f6-ad32-d784d68c7b67','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','100a17da-6ea9-4c35-9f2b-159efb994713'),('e595ed15-f7fc-402a-b6da-3008238e0594','2acb3df6-f623-4c6b-8a88-ad97b2b64722','822fed41-7169-4376-a254-b312f0c521fe'),('e669c4e9-c85d-4936-b4bc-fbda93438066','972754b2-d54d-4429-8e74-5153ccacd170','100a17da-6ea9-4c35-9f2b-159efb994713'),('e673b817-1dcf-421c-869e-c0514a49e20a','0a44ffa8-3870-472e-98fa-e33dbc7fc322','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('e6d20604-5c7a-4268-8c57-36756cae03e3','0ac16798-0637-449e-87ca-ce047ce3b567','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('e6d35a03-703c-4507-9d30-5755c81d43b6','faf8ae6a-540d-4954-aa8f-5c0ccfbe9e73','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e6ec4631-5eb0-4d08-bc3b-0445d5cd42e9','d8827eed-a8fe-4fc5-9a35-82a620e6c791','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('e6f6c08e-7b30-4f8b-bf97-97dbd6b8027a','0fd38122-485d-4f0c-84be-65cbcfe1ffec','44daa961-ff04-4f9f-be57-4395508d1fdb'),('e713f036-061e-46e0-82df-7e182e7e541e','e18c9a94-7064-4b5f-9a10-40041b7dd5de','822fed41-7169-4376-a254-b312f0c521fe'),('e723b3c2-72d1-44b1-8ba2-e425add81cba','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('e752c7ae-7469-49a6-b219-7c0b2ff70c0d','10689571-a849-4a3d-8eb7-6fc74cd4477b','822fed41-7169-4376-a254-b312f0c521fe'),('e79728f0-a015-409d-80cc-cf065d90390f','e79ed356-8035-4687-9fe9-b3ddd2230deb','cde96503-76da-440c-9d35-e9be21c70616'),('e7a4d658-ae34-444b-a517-82e57d4512d9','4e01f760-b4b6-4fbc-af4a-050559406a20','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e843c123-293e-405b-a484-d42413c7f9c0','290e9538-0904-4e8d-8b56-c31ca4031d8b','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('e8d3f939-d90e-44d3-9891-923c6c007abc','c83e09a9-3394-4693-aee3-e896a6d31b0a','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('e97161c1-364b-4b2c-9e51-fb137c30e503','df32d0dd-aa61-44d8-92ef-d63c009626b5','b7a69208-8267-44f7-b843-ff51b2482d07'),('e9a90d4a-e9b0-4803-82ab-78994c582b5d','582e648a-ef45-4cd6-8e8a-08bc2d88c7b4','822fed41-7169-4376-a254-b312f0c521fe'),('e9b43382-cb7a-4713-9195-e0b502735572','bd164a0e-be77-4bfb-9283-ea711d9f7938','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('e9c9ac34-c6ce-44d4-95ed-02e6eaf37dae','bc78dda8-1a72-423e-85b1-fb5fe51bae76','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('e9f0fb81-8d71-4280-884c-c3d7ad8f0a2a','10689571-a849-4a3d-8eb7-6fc74cd4477b','100a17da-6ea9-4c35-9f2b-159efb994713'),('ea2b1b93-ae00-4fa5-84cf-1f78d4ad57cd','7528587d-0d4f-4270-92ac-ef27b1b6263f','822fed41-7169-4376-a254-b312f0c521fe'),('ea56b884-e182-4e63-b80f-e7097ec6ef46','0cd308e4-ef0e-44cc-9547-a9999499e83a','fc3727ea-112c-4341-9589-f88b9321c227'),('ea690cc9-c0a1-42b6-af2e-d708bbaf7aea','9aada076-b566-4d5d-9941-3004d5d07f92','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('ea7c59ab-292c-4ff1-9eca-7e3ab095c865','6f45f56b-bc38-493a-b738-3d4b2f0f45ad','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('ea80d108-9382-48b9-a4a1-3d768707017e','bd164a0e-be77-4bfb-9283-ea711d9f7938','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('eaa60342-91d1-49f3-b710-fa1105ac7fa4','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('eae30304-bffa-4ccf-96b7-6773fd3bd987','7496836a-a18c-4db7-8df7-724c8df5b381','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('eaf7293e-0552-4b3d-a778-372c7951b332','c83e09a9-3394-4693-aee3-e896a6d31b0a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('eba2491a-a40c-41a7-bdac-2c05a3aab931','7ec04915-6ccb-49b4-936e-b4adbc8b1cf6','fc3727ea-112c-4341-9589-f88b9321c227'),('ebcb9aea-bb11-4539-86fa-807f8646a1af','46d313a3-d0bd-4655-b3ad-71e1f6f11b04','100a17da-6ea9-4c35-9f2b-159efb994713'),('ebf0de42-b7ae-4c05-a512-d1553396b98d','6b73b416-a32d-40fb-a343-b570d2e8d2cc','caf93aa4-de65-453e-be16-c0cef90ee421'),('ebfa7991-02ad-4ae7-9ea2-f9a3ebaf16e1','bbd2b239-1ef2-4f49-8d86-f3778126d282','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('ec023e09-98a2-45a2-bd6d-5c723424aea0','f1d97f93-c60b-4b8a-ac15-49d2112fb814','cde96503-76da-440c-9d35-e9be21c70616'),('ec31be19-2db8-4872-9e7f-86b6244189d9','6b73b416-a32d-40fb-a343-b570d2e8d2cc','822fed41-7169-4376-a254-b312f0c521fe'),('ec786929-7a41-4921-9e9e-ee989371904c','0ec2a9c8-4be9-4056-838c-86ea88178858','caf93aa4-de65-453e-be16-c0cef90ee421'),('ec886d67-6478-46a8-b3b0-494a8246fc52','79cb6076-338d-4c32-859a-9ac932b22ccf','100a17da-6ea9-4c35-9f2b-159efb994713'),('eca61a61-6dbe-474e-b100-308498af5589','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('ecab05a8-306e-47b2-af31-84330affa339','e79ed356-8035-4687-9fe9-b3ddd2230deb','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('ecc033c3-e44e-47c5-8b30-0657b7522dea','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('ecc6019c-3ccd-4a46-a8fa-428a6598e709','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('ed08400b-1610-4fe1-be8f-1a5e4105cffe','b2e0785f-0e91-4643-aaeb-1d48363ef971','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('ed20bfe5-2bc4-4ae2-b19c-a9bb211f2982','226539b9-6717-4de2-869f-a6bb046b9a18','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('ed289914-429a-47b5-853a-eddd9248b34d','81c9f7a7-48bd-4d07-b4e9-66e8198681b8','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('ed79e35d-3b5e-452d-926e-8af22d14272e','e7211217-333a-4001-aac0-c2eac6288637','fc3727ea-112c-4341-9589-f88b9321c227'),('ed9c4497-01f8-470d-a0e9-1dcbe4c2b10f','df32d0dd-aa61-44d8-92ef-d63c009626b5','fc3727ea-112c-4341-9589-f88b9321c227'),('ed9ca888-3f18-4363-bc65-217fc486421e','d8827eed-a8fe-4fc5-9a35-82a620e6c791','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('ee01e285-7c5b-4c5b-8135-5d7e766d89a2','b2e0785f-0e91-4643-aaeb-1d48363ef971','b7a69208-8267-44f7-b843-ff51b2482d07'),('eeb08868-10b7-4144-8a67-1e351c12ef7e','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','100a17da-6ea9-4c35-9f2b-159efb994713'),('eeb22c69-ddac-4f85-ac49-9a7576484d1b','1458ee77-9304-40e1-ab80-aa9780c5630a','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('eec84320-3232-4992-94f3-4148d91bece4','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('eef405de-6c8c-4ea8-b4cd-a4fdf9e44096','5f1bc95d-d3f8-4dba-9a53-f91a0f388cd4','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('ef1357df-ad1b-4328-bd59-b6ca9cb58f9e','030303a4-eab5-4863-a257-317b6530a668','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('ef633926-0cf4-482b-b158-396e4f02133f','d8827eed-a8fe-4fc5-9a35-82a620e6c791','b7a69208-8267-44f7-b843-ff51b2482d07'),('ef64a4db-346e-40cf-8735-a2b2c4945970','30c54bd0-5b3a-437e-a669-abb480c34af8','100a17da-6ea9-4c35-9f2b-159efb994713'),('ef727a1a-cb87-49fa-9631-1e888f703dd3','62181cbe-506f-4ada-90c3-f32828c9776e','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('ef746650-57d5-4c5a-b240-0c1d5357f42f','5893a799-cfd2-46c8-8ba4-56e7580ec143','cde96503-76da-440c-9d35-e9be21c70616'),('ef959670-42d0-44fe-97bd-82b4a00669e4','df32d0dd-aa61-44d8-92ef-d63c009626b5','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('eff60daf-cec8-4a16-950d-1d938484a76c','f9a1bc16-714f-498f-a35a-405a77cc1366','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('f0027056-2c12-4f27-a75b-44b26229c62d','0ac16798-0637-449e-87ca-ce047ce3b567','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('f09ad8ce-7c5d-4d24-b118-636de9234be5','3a45d13b-18aa-4879-8460-e7d5315926f9','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('f09eeef0-2502-4a8c-abfb-8469fc25cd04','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','44daa961-ff04-4f9f-be57-4395508d1fdb'),('f0adeb63-5c2c-4dca-86c6-fe13ed5697c3','0ac16798-0637-449e-87ca-ce047ce3b567','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('f1022ab1-4ca2-4f80-8e67-8ef5a84463d8','956a45a8-29cb-410a-942e-3ff7fe108ae0','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('f1056faf-d030-4e5a-bcbd-b1b42df15320','c20c3f03-7313-4d79-ac7b-88f210a5df01','fc3727ea-112c-4341-9589-f88b9321c227'),('f1288003-28ea-4eed-b5b6-b6bd5d788ab5','6b73b416-a32d-40fb-a343-b570d2e8d2cc','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('f18472ac-259c-4a6c-9791-d74ff86b92c0','d3ca7cf4-bc0f-4458-9b38-ab9f4a0dbd63','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('f18dbeae-48ed-4e78-b8ff-f92126111f53','7c76a2e6-fe7f-49c4-a128-236de5a2159e','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('f195c3f7-6e76-4c47-9a8a-d74bd8bcc247','bd164a0e-be77-4bfb-9283-ea711d9f7938','100a17da-6ea9-4c35-9f2b-159efb994713'),('f1d9c617-092e-4ac0-9bdc-90d89dbcb1c7','e79ed356-8035-4687-9fe9-b3ddd2230deb','fc3727ea-112c-4341-9589-f88b9321c227'),('f22d41b1-bc0b-41b8-bad1-df2ef8afe913','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('f2939a56-014a-40e5-9273-74dfa6e9f575','7496836a-a18c-4db7-8df7-724c8df5b381','3ac1b691-1154-460f-9c17-33ba2e46ef23'),('f2c3c9c8-663c-4073-9fb0-0bddd2a685ba','24f9ef0e-1131-4cb1-96b1-2cac8eb03b1b','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('f2ecdde3-5865-4a75-8c68-30e25ff700ee','3a45d13b-18aa-4879-8460-e7d5315926f9','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('f35215ba-229b-42f5-9c8d-ced69c444e80','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','100a17da-6ea9-4c35-9f2b-159efb994713'),('f35c381c-4619-49eb-a4c3-9ed638133974','c83e09a9-3394-4693-aee3-e896a6d31b0a','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('f367e859-2915-40e9-b7dd-730ea591b0bf','3215e0aa-ba11-4777-9fdf-a9b89ebf1988','44daa961-ff04-4f9f-be57-4395508d1fdb'),('f38f5472-67b4-4a75-87b5-8e1bcf11aab3','b5fb6b99-f329-408e-98d3-877fc898ab93','100a17da-6ea9-4c35-9f2b-159efb994713'),('f3b62789-f15f-4611-b020-ede09afcf370','bc78dda8-1a72-423e-85b1-fb5fe51bae76','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('f4081c3c-f4b6-47fb-9114-9f92d9c4c511','972754b2-d54d-4429-8e74-5153ccacd170','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('f42d421f-cb13-44fe-9541-7668fd5f98e4','7c76a2e6-fe7f-49c4-a128-236de5a2159e','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('f4352ab9-3dd1-4754-b806-4f65f64cf900','007e2dab-1034-4577-a8b5-3efb0f793ae4','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('f441724e-1706-46ef-a5a2-07669d757b83','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('f478922b-0287-4195-9f21-2fb92880c974','ce9b2c97-f6a6-4559-8d6b-d23dcc06088c','caf93aa4-de65-453e-be16-c0cef90ee421'),('f4b88866-a5ad-4f0d-ab23-c5fab705a395','290e9538-0904-4e8d-8b56-c31ca4031d8b','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('f4f12621-195d-49eb-b88c-974d9e8c43c8','87b8c1ed-542f-4cbb-80b7-889332a6f7a9','cde96503-76da-440c-9d35-e9be21c70616'),('f522ff65-84e6-4fa1-9348-17c0fae4301d','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','100a17da-6ea9-4c35-9f2b-159efb994713'),('f5546ab4-fd76-487c-94d1-59399bbe48e5','6841d9c1-6535-42f5-88aa-4a7ed4d0dc43','fc3727ea-112c-4341-9589-f88b9321c227'),('f56a079a-8df0-400a-9769-045c389eb853','f15ccc4d-7a2c-4f62-ae11-0755589bbf89','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('f57a0725-4957-4d5d-80ee-328646bf340c','588c3b3f-39ad-4331-ae8d-3f2a264d38fb','cde96503-76da-440c-9d35-e9be21c70616'),('f585748e-d34c-4638-b6fa-1514afbd7dc0','290e9538-0904-4e8d-8b56-c31ca4031d8b','100a17da-6ea9-4c35-9f2b-159efb994713'),('f63513ca-61f7-4ba0-bdb8-cd7aca49c80d','5d6b198e-7555-40a1-8105-aec7f144d719','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('f64eaf94-e93e-424b-881b-3473106ea5bb','ea1c564b-5fa5-433f-9334-ac220ce2d3c6','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('f65b86cd-c00a-49ad-92e9-840c1966f180','7528587d-0d4f-4270-92ac-ef27b1b6263f','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('f6be7a88-84a0-4632-89e6-357550ad0270','89f66bf2-6e3c-40d7-8bce-af92d34cc33b','b7a69208-8267-44f7-b843-ff51b2482d07'),('f6c43731-755b-47d8-a771-f92ea0262164','eefbac3e-a6e6-4610-a05c-4e8c2193cb0c','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('f72f45f7-feec-4a96-9776-feb4d0c36aff','dd4e96ac-5ecc-46f1-ab7c-524528ca396a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('f783f6e9-53a7-4600-8c37-6c8a2cd2a3ee','f4615226-2034-4369-b6cb-0d5c579183cf','822fed41-7169-4376-a254-b312f0c521fe'),('f7d6a066-768b-45af-8f2d-557451b44bf6','2e860c1d-fad7-4d34-92de-b31b0735c573','caf93aa4-de65-453e-be16-c0cef90ee421'),('f7f0401e-5bcc-4225-a8a9-41488e62353b','c0979193-f268-404d-9d3c-da2211c24e02','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('f81ba647-981c-43ed-80ca-e776076ea20f','007e2dab-1034-4577-a8b5-3efb0f793ae4','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('f8323314-f399-4f3f-94dd-cf1af76e15fb','956a45a8-29cb-410a-942e-3ff7fe108ae0','de2abe36-83d9-4a2c-b9a8-bcd86cf6e414'),('f89ed8cf-7f91-4681-834c-c664519771e2','956a45a8-29cb-410a-942e-3ff7fe108ae0','100a17da-6ea9-4c35-9f2b-159efb994713'),('f8af7986-c2cd-4e67-a0ca-5c9bac26677b','15b8b234-338b-43e9-81e4-32c201ab330e','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('f8b80ea3-1feb-425b-87ca-f55fb38a10c4','b100bbb2-8f60-4344-9fd1-faebfb3a57d0','44daa961-ff04-4f9f-be57-4395508d1fdb'),('f8c1a6eb-85a6-47e9-b15b-7ced9967e6fb','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('f8c2ca4c-e418-4190-93dc-3def52c00a6a','2ecda9e6-d15a-4b98-8edb-233ed006cfec','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('f8f54d25-367c-464f-ab61-3d49b7f7d56b','0ac16798-0637-449e-87ca-ce047ce3b567','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('f9206bec-31af-4120-a8ed-60789b29390e','0fd38122-485d-4f0c-84be-65cbcfe1ffec','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('f9caa775-07ff-4684-b905-52244076094c','d8827eed-a8fe-4fc5-9a35-82a620e6c791','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('fa018073-1ce7-455c-b0d2-5ec25152ef0c','7496836a-a18c-4db7-8df7-724c8df5b381','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('fa07bc3e-552e-4099-9d83-9f72b89d7be0','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','cde96503-76da-440c-9d35-e9be21c70616'),('fa126b36-1e1f-4523-93d7-983efad56974','62181cbe-506f-4ada-90c3-f32828c9776e','2bbda62d-ab20-4c70-ac13-9626e65ab006'),('fa17886a-9607-4e22-8669-4630b42a4a81','bc78dda8-1a72-423e-85b1-fb5fe51bae76','b7a69208-8267-44f7-b843-ff51b2482d07'),('fb300421-6c95-418f-944a-5ae9aa24adc8','93af4745-e92e-4241-b0fb-0b2e43f5cf6a','822fed41-7169-4376-a254-b312f0c521fe'),('fb64154c-3f4a-408c-aea3-4b8ad3219078','0ec2a9c8-4be9-4056-838c-86ea88178858','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('fb90434a-18f1-4728-9a79-2f7d9fccea1d','10689571-a849-4a3d-8eb7-6fc74cd4477b','94049b4e-4f4a-46dc-9ac7-9444ca1826a5'),('fba40a56-89ba-4b7d-8e7a-23ebe3aecf74','309836d7-7922-4500-b65a-a8973f8c5426','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('fbbc66ec-ab38-4387-aed7-b03942a45433','e79ed356-8035-4687-9fe9-b3ddd2230deb','822fed41-7169-4376-a254-b312f0c521fe'),('fbee49d4-1108-4a3f-a18f-2f196070d7d2','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','0d54a4e6-9713-413d-9a53-0c4ad2a07cb5'),('fc4def67-8051-46c1-b022-f53fe1eb6dc2','c5a69b9c-441d-4456-9535-b0a72927ba6a','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('fc668a41-7e3f-4546-9e2d-8390195d6ebd','5893a799-cfd2-46c8-8ba4-56e7580ec143','b7a69208-8267-44f7-b843-ff51b2482d07'),('fc9ae544-09dd-410d-85df-3c18c9587595','f9a1bc16-714f-498f-a35a-405a77cc1366','caf93aa4-de65-453e-be16-c0cef90ee421'),('fd4f0732-0767-4a21-8a56-b592bc783712','4b6dee58-d15c-4dc9-a800-4a99f654f5f2','b7a69208-8267-44f7-b843-ff51b2482d07'),('fd57167a-68c2-4a2b-b1b9-8ed74b05d6e7','2e860c1d-fad7-4d34-92de-b31b0735c573','44daa961-ff04-4f9f-be57-4395508d1fdb'),('fd8614e0-ab51-43a6-b943-78a81629a464','bd164a0e-be77-4bfb-9283-ea711d9f7938','44daa961-ff04-4f9f-be57-4395508d1fdb'),('fda07d1b-7bf2-4c27-a9d4-9e16ea2bf857','60f4f93c-4d55-4987-b489-aecbc8b3d8ae','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('fe062215-51db-4a1d-8f9d-be140659859d','49a45a15-addb-4296-902b-035635450bcd','caf93aa4-de65-453e-be16-c0cef90ee421'),('fe2aae61-d841-4bf3-b93f-deebb41d0483','2e860c1d-fad7-4d34-92de-b31b0735c573','c33d65a1-a0f6-40eb-a697-f39d7ac90b2c'),('fe36a094-c71d-4397-89b3-c532f757ebfc','df32d0dd-aa61-44d8-92ef-d63c009626b5','cde96503-76da-440c-9d35-e9be21c70616'),('fe73f11f-a160-44c4-b127-1a0fda003956','4e01f760-b4b6-4fbc-af4a-050559406a20','cde96503-76da-440c-9d35-e9be21c70616'),('fe75ee5f-fb4a-4458-b8be-1c6a79f0610b','f9a1bc16-714f-498f-a35a-405a77cc1366','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('fe89d0d6-46ec-403c-8bde-1fbb5b80862e','64174de7-e444-4b4d-81c7-ea8f3cc49240','20461de0-64b2-4ebd-8ca3-71c08d058fc7'),('fe8f16c0-5a56-43ad-9f97-341dc0c5831e','c0d6aeba-5e16-4965-afc2-7c38427e56a3','e8f75eb5-cbd1-467a-aebf-6f4df670093d'),('febf80cd-d271-473a-a332-b6869dc949cf','ec08217d-fa52-4c61-bcc4-9be9fe2b92a6','d4a5dce2-6df8-47c5-8004-e70cba815af1'),('fec8cdb3-9473-4a48-952f-308348de5ef0','49a45a15-addb-4296-902b-035635450bcd','822fed41-7169-4376-a254-b312f0c521fe'),('feddf2f6-1762-4900-b7e8-9c38850f370b','2acb3df6-f623-4c6b-8a88-ad97b2b64722','61f956bf-b504-4ce8-bc55-6db242c2efcc'),('ff1d8ee2-e5b3-4527-811c-44aa45feae75','9128ece7-28e2-4467-a346-3d53646be8e2','b7a69208-8267-44f7-b843-ff51b2482d07'),('ffba5943-5a0d-4986-853c-229649974fa6','64174de7-e444-4b4d-81c7-ea8f3cc49240','13ca2aa5-138d-4abd-9d7a-1f2287e8f021'),('ffce6eb1-fbcf-409c-bd6f-dcb1a28a9193','e3f7bac4-de7f-4f96-9b52-8f1b20176a9a','fc3727ea-112c-4341-9589-f88b9321c227'),('fffe6c49-7703-43e0-b62a-e5ea0607c209','007e2dab-1034-4577-a8b5-3efb0f793ae4','2bbda62d-ab20-4c70-ac13-9626e65ab006');

/*Table structure for table `m_value_list` */

DROP TABLE IF EXISTS `m_value_list`;

CREATE TABLE `m_value_list` (
  `ID` varchar(40) NOT NULL,
  `CRITERIA_ID` varchar(40) DEFAULT NULL,
  `CRITERIA_VALUE` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_value_list` */

insert  into `m_value_list` values ('2540f725-33af-7054-908f-8d1743df955f','da7edf8b-02ca-4578-e386-4f22a27643da','认证会员'),('355b73f3-4575-3f89-ea84-06b6d4c86a6a','fc5b7300-daf2-6e58-e5c3-cf67f24f3c31','M_CONPONS'),('375bfdd5-0b1f-9faf-732d-e34db7103796','dadfd72a-7ed4-507f-2eb2-e6b4069b128e','1'),('3ff29aaf-e766-a8e8-714e-a03a1fa4d893','ee1bca40-867f-af28-0ba7-f13dd5f92eb3','1'),('4f345813-af82-4be7-8b56-f07b1d31c256','8eb89cbf-60a2-c427-b22d-2c13dd6a3be4','VIP会员'),('74df6caf-b42a-aecb-e607-3a5617789086','f3ae80ac-6381-3bdd-9447-0af92b42a7e8','1'),('a6636cd5-17dc-63b6-5f7b-60f976848d54','a8b28822-5ce0-3f14-bea5-c501ed816f0c','0'),('b4ae2a6d-8ecf-399d-152b-c92f331e317a','06105681-4e58-0813-d558-31361758dfcc','普通会员'),('c58f7a7a-ef7f-a742-fdea-26a31d8716be','3cfe5547-fd06-2bb4-810a-082f5c76a025','M_DEDUCTION'),('df7805c1-ce7b-da48-2bf7-aed3f4c02f65','ddfef65d-4368-99e9-616d-33addfadaeb9','0'),('ec31b269-4f26-9da5-1b0a-7ec4a2acbba9','4361f550-218b-d078-9beb-6cf45fedd690','认证会员'),('f8fe9141-befb-3cd4-537c-5cb286487e98','da79952c-112e-e259-1b67-4a4216c5f459','M_EMPLOYEE');

/*Table structure for table `m_view` */

DROP TABLE IF EXISTS `m_view`;

CREATE TABLE `m_view` (
  `ID` varchar(40) NOT NULL,
  `NAME` varchar(40) DEFAULT NULL,
  `URL` varchar(100) DEFAULT NULL,
  `TYPE` varchar(20) DEFAULT NULL,
  `TITLE` varchar(40) DEFAULT NULL,
  `ORDERS` int(11) DEFAULT NULL,
  `SCREEN_ID` varchar(40) DEFAULT NULL,
  `LINK_VIEW_ID` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_view` */

insert  into `m_view` values ('031d4f71-c1fc-4cfc-9b0f-472d8e998a68','View.CorpV','/loyalty/CorpView.jsp','list','团体',1,'',''),('03c3a588-9ab7-4293-9cff-223f7f6613b3','View.DQMMonitorLinkBar','/foundation/DQMMonitor.jsp','link','数据监控',3,'undefined',''),('03d385f6-83db-43ee-bafb-eb444a1c27ea','View.LoyProgramPointTypeV','/loyalty/LoyProgramPointType.jsp','detail','积分类型',2,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',NULL),('064d4ea6-cdad-409a-8ae4-f28369e372c1','View.LoyProgramAttributesProgramV','/loyalty/LoyProgramAttributesProgram.jsp','detail','Program属性',7,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('06e590ca-7050-4043-a2f5-ba4537a6cb7b','View.MemberOrderV','/loyalty/MemberOrder.jsp','detail','订单',7,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('0757ca6f-8ae7-48df-9974-f5b82c8e48b8','View.MarketingCalendar','/marketing/marketingCalendar.jsp','list','营销日历',11,'3d72c52f-8118-4dc4-8ed2-92e8bc3deeb0',''),('08b96ea2-268c-4317-b253-1c6721d71a65','View.MyMessageV','/CallCenter/MyMessage.jsp','list','消息',1,'e04ee50e-f189-43f6-af39-f87297c0ad47',''),('09a40291-4b1f-4285-affd-975e41d87ecf','View.DataEntryCustomerV','/CallCenter/DataEnterCustomer.jsp','list','数据录入',1,'1723839e-026a-446e-acfa-26cfe0969f43',''),('09DF3A65-7667-41C9-93ED-22B771040C01','View.DataManagementImpCustomerV','/foundation/DataManagement.jsp','list','导入客户',1,'80106D48-E59F-4B2F-B222-07E5B464D379','5DF10A76-F9B8-4D83-82BF-9F990CDDF97A'),('0a30d204-2672-4ce2-bf0e-0c8d694a6ff7','View.CampaignQueryCustAnalytics','/analytics/CampaignCustomerAnalytics1.jsp','detail','商品分析',3,'31b323c8-71d0-4725-a336-4f2058b4e2eb',''),('0a78d008-87ae-4a5c-985c-4ddc72026fbc','View.AnalysisExportHistoryV','/analytics/AnalysisExportHistory.jsp','detail','报表导出历史',5,'da71c5b1-da77-4da0-93c6-7beb6191eabe',''),('0c60e3e2-dc69-4a80-9751-96ca56531fd1','View.LoyProgramGiftOrder','/CallCenter/LoyProgramGiftOrder.jsp','detail','积分兑礼',1,'',''),('0ff00b27-698c-4d60-bc91-bc0bd9531301','View.Message','/CallCenter/Message.jsp','list','消息管理',1,'00141a02-b56d-4ddd-88c4-d28dbcf8c008',''),('111c5844-b5ca-48ae-9ad7-57e531639007','View.EventUnsolvedCallOutboundV','/CallCenter/UnsolvedCallOutbound.jsp','list','UnsolvedCallOutbound',9,'cd83f798-5684-451e-9adb-2415ddfc3ea9',''),('11e986d9-1bb3-40c4-9454-c525ed342edf','View.EventEmailConTentV','/CallCenter/EventEmailConTent.jsp','detail','邮件内容',6,'10e008f6-0899-4afd-b532-b900c72a9ba7','9c72e67f-d3a5-4343-b516-c545ad1a7a01'),('136bfa04-7b65-45ee-8dcd-e7bb31325653','View.DQMRuleLinkBar','/foundation/DQMRule.jsp','link','数据规则',5,'',''),('13f35ae2-ff33-4236-b4a1-e441a791428a','View.RoleUserV','/foundation/roleuser.jsp','detail','用户',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7','dc82b805-4f00-4828-a7ad-ec1ee002008d'),('1539edc9-1efa-4e3f-b270-dd8c430fb52e','View.ServiceRequestEventV','/CallCenter/ServiceRequestEvent.jsp','detail','事件',1,'bb9ea6b4-9082-409b-9471-2e34fef415b5',''),('158aa72f-f984-4733-9bee-1cabfd000459','View.GiftDeliveryReport','/CallCenter/ExportDelivery.jsp','list','兑礼报表-快递',2,'a2d86b1f-c498-407e-80a4-f25adf0a836b','7ee78346-1286-4c87-a48c-120c9e5fe087'),('16758145-4ef9-42e2-bf6c-77af7b32da5f','View.TaskLinkBar','/foundation/taskJob.jsp','link','任务调度管理',3,'',''),('16e24c0d-0e2f-4dfe-ae9c-6f30e4492e7b','View.SmartDesignV','/CallCenter/SmartDesign.jsp','detail','智能脚本设计',1,'3e0ef726-b056-4cd0-be33-a98454b940eb',''),('1b446d62-4b96-4432-bb6c-ca8a6289fb2d','View.LoyProgramPromotionList','/loyalty/LoyProgramPromotion.jsp','detail','Promotion列表',1,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('1b7203a1-66f9-449c-8329-a8f751255320','View.DataEntryCustomerFormV','/CallCenter/DataEnterCustomerForm.jsp','detail','数据录入-客户信息',1,'1723839e-026a-446e-acfa-26cfe0969f43',''),('1baa8549-5783-47ad-a8a2-ed4dadf68f4f','View.MarketingListBar','/marketing/TargetList.jsp','link','客户列表',2,'80106D48-E59F-4B2F-B222-07E5B464D379',''),('1d42565c-86e1-4d58-ac2b-3c78ca8f8387','View.LoyProgramAttributesCustomV','/loyalty/LoyProgramAttributesProcedure.jsp','detail','自定义属性',10,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('1eb6382a-b87a-4f63-9581-5c03871702a6','View.MLOVLinkBar','/foundation/mlistOfValue.jsp','link','值列表管理(内部)',2,'',''),('1f1bd791-a643-47ee-b780-62c85fa3ce5d','View.Gift','/CallCenter/Gift.jsp','list','礼品',1,'bd5ae528-f0eb-4eae-bd73-508df0279ea8',''),('200ab5fa-b77b-4d1a-bf8e-a4519994b011','View.SmartScriptQuestionV','/CallCenter/SmartScriptQuestion.jsp','detail','智能脚本-问题',2,'3e0ef726-b056-4cd0-be33-a98454b940eb',''),('21512b72-a2b2-4a6c-a5b8-1010d37cf03c','View.CampaignResponseAnalytics','/analytics/CampaignResponseAnalytics.jsp','detail','营销响应分析',2,'da71c5b1-da77-4da0-93c6-7beb6191eabe',''),('244162c1-741f-4b49-9716-6e56da0ecf42','View.MessagePos','/CallCenter/MessagePos.jsp','detail','发布对象',2,'00141a02-b56d-4ddd-88c4-d28dbcf8c008',''),('245b9ebd-8377-453d-9c2d-309b3f42e811','View.EventOutboundCallHistoryV','/CallCenter/OutboundCallHistory.jsp','detail','通话历史',2,'cd83f798-5684-451e-9adb-2415ddfc3ea9','b4701f05-27bd-45fa-905e-c13c133aa89e'),('250a34a6-b26f-4c47-82c6-52432003366a','View.MarketingOfferV','/marketing/Offer.jsp','list','OFFER',3,'8976951b-473c-4fd7-836e-dbdac45dd62f',NULL),('27182071-91a2-4f66-8ca3-c4d27d6e51ce','View.SmartScriptV','/CallCenter/SmartScript.jsp','list','智能脚本',1,'3e0ef726-b056-4cd0-be33-a98454b940eb',''),('28f9b560-0842-47da-bec9-e83abb0d4931','View.EventCallOutboundV','/CallCenter/CallOutbound.jsp','list','CallOutbound',2,'cd83f798-5684-451e-9adb-2415ddfc3ea9','b4701f05-27bd-45fa-905e-c13c133aa89e'),('295be7ad-b55b-4e7e-9547-96c5bc2772dc','View.MemberPointListV','/loyalty/MemberPointList.jsp','detail','积分明细',3,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('2be30692-6c39-4946-87b2-2656695b669e','View.UserLinkBar','/foundation/userrole.jsp','link','用户管理',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7',NULL),('2e5080ff-36b1-4bb9-9ef1-abb7a5c3c634','View.ServiceRequestV','/CallCenter/ServiceRequest.jsp','list','服务请求',1,'bb9ea6b4-9082-409b-9471-2e34fef415b5',''),('2fd1d34f-774e-4b1d-a239-a28504c5f071','View.MarketingListV','/marketing/TargetList.jsp','list','列表管理',2,'80106D48-E59F-4B2F-B222-07E5B464D379','1baa8549-5783-47ad-a8a2-ed4dadf68f4f'),('347c3e86-18dc-4c1e-ab14-3977ce6adc82','View.InboundCustomerRemarkV','/CallCenter/InboundCustomerRemark.jsp','detail','备注',11,'560a9aa1-145c-4e86-9890-7469505130a0',''),('34a91780-0109-46a5-b9b7-e58700097cfe','View.SMSTreatmentV','/marketing/Treatment.jsp','list','SMS Treatment',1,'944bea39-552e-43a3-a7fe-5edc0329e1a3',NULL),('36118531-1895-4c4a-82ee-6a69e525a0b6','View.LoyGiftDetail','/CallCenter/LoyGiftDetail.jsp','list','兑礼明细',5,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('372e2ac0-a337-4fb0-998f-adc0571d2866','View.InvitationPeriodV','/CallCenter/InvitationPeriod.jsp','detail','场次',2,'0db95450-ec8d-46aa-9270-a338ee15d6ab',''),('381a1f9c-5b7c-4086-be85-79983a5dcb50','View.EventV','/CallCenter/Event.jsp ','list','事件',1,'',''),('381b8daf-542b-4c53-bd83-6deda9a2ef09','View.SystemParameterV','/CallCenter/SystemParameter.jsp','list','系统参数',1,'','6f817794-dd38-4c77-bf18-78777a53a4ad'),('385d71a3-9c45-4661-a533-209e76b19eeb','View.ViewManagement','/foundation/view.jsp','list','视图',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7','bd7a182f-1cb0-4369-bd58-c427081adb3f'),('3ac9c356-33d5-4496-86b5-ddc791c888ff','View.PositionLinkBar','/foundation/positionuser.jsp','link','职位管理',3,'3869d5e2-7d61-48b0-9551-4e19ced386a7',NULL),('3ada0c49-09fd-4b6f-a8d3-c5024dfd0182','View.LoyProgramAttributesSystemV','/loyalty/LoyProgramAttributesSystem.jsp','detail','系统属性',9,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('3ff53029-8310-4aa0-9048-06d33d62735c','View.EventCallInboundV','/CallCenter/CallInbound.jsp','list','CallInbound',2,'d220e218-6686-4e52-aff8-9c27dce1bcba','47bc29ea-d57c-4f9d-8b7e-c9d2a438e88c'),('40840e39-679e-4b7e-9019-c99ab58c04e4','View.LoyProgramAttributesDealV','/loyalty/LoyProgramAttributesDeal.jsp','detail','交易字段属性',6,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('43be26fc-36ac-49cb-8ef9-2a92762ffe82','View.ProductCategoryManagerV','/foundation/ProductCategoryManager.jsp','detail','产品目录管理',3,'9dd61293-b013-48fe-b9ea-fab43b5ab379',''),('47af3b22-a407-4b11-9a74-1b8cbb235882','View.UserRoleV','/foundation/userrole.jsp','detail','角色',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7','2be30692-6c39-4946-87b2-2656695b669e'),('484012fd-69df-4c9a-b7f5-57a7bb7d0997','View.ServiceRequestSuggestV','/CallCenter/Suggestion.jsp','detail','处理意见',2,'bb9ea6b4-9082-409b-9471-2e34fef415b5',''),('4a19ecbe-51a3-4e44-9ad6-acc627ca532a','View.RoleViewV','/foundation/responsview.jsp','detail','视图',2,'3869d5e2-7d61-48b0-9551-4e19ced386a7','dc82b805-4f00-4828-a7ad-ec1ee002008d'),('4a7f39a2-4493-4a66-a357-8ab229ccc2e5','View.StoreV','/foundation/Store.jsp','list','门店',1,'a335dabd-b19e-4a89-b8ba-2decac883ab3',''),('4b0eb421-baac-4cc7-8bf0-215632572786','View.EventReportLinkBar','/CallCenter/ExportBound.jsp','link','事件报表Link',1,'a2d86b1f-c498-407e-80a4-f25adf0a836b',''),('4ba38593-ab87-4f07-ab84-088978ec0287','View.PeriodCustomerV','/CallCenter/PeriodCustomer.jsp','list','客户列表',3,'0db95450-ec8d-46aa-9270-a338ee15d6ab',''),('4c83df9a-3c8a-4732-8124-5dca1d83347f','View.InboundMemberPointsAdjustV','/CallCenter/InboundCustomerPointsAdjust.jsp','detail','积分调整',9,'560a9aa1-145c-4e86-9890-7469505130a0',''),('518395c8-a0c0-4338-9042-066141bfc558','View.OrderV','/loyalty/Order.jsp','list','订单',1,'82802786-7479-427d-828b-f73cb2e99979','9afae00a-a833-4aa7-b0a2-23d0019eee80'),('51b33b8d-4af4-420a-9b7b-ffa44c8962b9','View.LoyTierClassTierV','/loyalty/TierClassTier.jsp','detail','等级',8,'6e1f3843-82a9-4a99-82f7-e209dddc3ee6',''),('5522470D-F399-4F99-A9CF-5594C4709109','View.DataManagementImpCustomerV','/foundation/DataManagement.jsp','list','导入客户',1,'','DB3D26CC-94B8-4EF0-8200-A0A8BB2F510F'),('55c478eb-8579-4cbe-bd37-01969733a188','View.LoyOrderV','/loyalty/LoyOrder.jsp','list','忠诚度交易',1,'4c0edf78-e93a-4183-b2fc-a51dcc80c74c',''),('57ed3ef8-ea6e-48f5-89fe-b4eedade2be5','View.CallCenterMainV','/CallCenter/Main.jsp','list','首页',1,'b10bfa81-f03a-4b99-b6e1-2211e4ff8b56',''),('5892f3c1-094a-4d1f-8887-0358e16cfa5a','View.DQMEnrichmentLinkBar','/foundation/DQMEnrichment.jsp','link','数据增益',2,'undefined',''),('58eee1b8-30e6-453c-8c23-5aeb95c03d65','View.ScreenLinkBar','/foundation/screenview.jsp','link','屏幕管理',6,'3869d5e2-7d61-48b0-9551-4e19ced386a7',''),('595049d9-cda1-4e2f-bb18-873088326a21','View.DQMRuleV','/foundation/DQMRule.jsp','list','数据规则',5,'b9cdd5de-2c52-4192-bdbd-0ed8a2ae8e81','136bfa04-7b65-45ee-8dcd-e7bb31325653'),('59bac8c4-4866-473f-87e9-8ee6820d93dd','View.LoyPromotionRuleDesignV','/loyalty/promotion_design.jsp','detail','规则设计',2,'bee20ab0-bfc4-442e-8bf1-56f02706520f',''),('5a01b632-9a00-44f2-bb73-cd07e5a407ea','View.CustomerOrderV','/foundation/CustomerOrder.jsp','detail','订单',6,'9e00ec4e-290c-424a-a388-71b1753d7a75',''),('5DF10A76-F9B8-4D83-82BF-9F990CDDF97A','View.DataManagementImpCustomerBar','/foundation/DataManagement.jsp','link','导入客户Link',1,'80106D48-E59F-4B2F-B222-07E5B464D379',''),('5ed27c0d-5a84-4e87-9b2f-f30535b484f0','View.EventAttachmentV','/CallCenter/EventAttachment.jsp','detail','附件',2,'',''),('605b8714-1134-485c-96f2-f21ccfb35462','View.CampaignCustomerAnalytics','/analytics/CampaignCustomerAnalytics.jsp','detail','客户特征分析',3,'da71c5b1-da77-4da0-93c6-7beb6191eabe',''),('606f11eb-7ac1-49f4-a54e-ca94b8e60735','View.EventOutboundSRV','/CallCenter/OutboundSR.jsp','detail','服务请求',1,'','b4701f05-27bd-45fa-905e-c13c133aa89e'),('60c68257-8539-4e60-bd79-efead5c7efc5','View.TaskDataEntryV','/CallCenter/TaskDataEnter.jsp','detail','数据录入',1,'d8577a02-3a49-4ac3-91c1-1ed706917ae9',''),('60f2281e-fd68-4eea-b0a5-825a97fad12c','View.LoyProgramAttributesGrandTotalV','/loyalty/LoyProgramAttributesGrandTotal.jsp','detail','累计属性',8,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('61020fe5-21a3-4e5d-aed5-d8d7ce094bdb','View.LogLinkBar','/foundation/keyDataTrace.jsp','link','日志管理',2,'',''),('62406e88-f768-4c73-9317-cdd66ca0314f','View.CustomerV','/foundation/Customer.jsp','list','客户',1,'9e00ec4e-290c-424a-a388-71b1753d7a75',''),('648b11df-0c26-473f-b129-6b23907b17f2','View.HouseHoldV','/loyalty/HouseholdView.jsp','list','家庭',1,'f8981591-a41f-4705-88f3-7295a023221e',''),('649a67bb-3c11-472b-9230-af199942aae6','View.MLOVManagementV','/foundation/mlistOfValue.jsp','list','值列表',2,'','1eb6382a-b87a-4f63-9581-5c03871702a6'),('659bdc4a-dba7-4c81-9af5-9665f7bc185c','View.CampaignQueryRespAnalyticsV','/analytics/CampaignQueryRespAnalytics.jsp','detail','客户细分渠道响应分析',4,'31b323c8-71d0-4725-a336-4f2058b4e2eb',''),('65df3b4a-1c0b-43c5-bf77-6a684ae07c5d','View.EventCategoryLinkBar','/CallCenter/EventCategory.jsp','link','事件类别',13,'',''),('667d8927-35b5-4f8b-90a3-7411e9d6d7c3','View.LoyProgramPointsV','/loyalty/LoyProgramPoints.jsp','detail','积分',8,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('678d29fb-1f28-490c-ae11-948ca4c54c92','View.LOVLinkBar','/foundation/listOfValue.jsp','link','值列表管理',1,'',''),('67fe64d7-ac40-463f-a92b-c4923b24bc45','View.taskJobV','/foundation/taskJob.jsp','detail','任务调度',3,'39bc1087-1886-40ea-b491-b112eced99b1','16758145-4ef9-42e2-bf6c-77af7b32da5f'),('69e90d20-709e-490a-b9f5-6989d05929c6','View.LoyProgramEvent','/CallCenter/LoyProgramEvent.jsp','detail','事件',2,'',''),('6b5bdebe-66f1-452b-a74f-1fbd014286b9','View.SubCustomerV','/foundation/CustomerSubCustomer.jsp','detail','关联客户',25,'9e00ec4e-290c-424a-a388-71b1753d7a75',''),('6b885df8-6dce-454a-9715-7e964baf8aca','View.MarketingCampaignResponseV','/marketing/campaginResponseSummary.jsp','detail','响应汇总',4,'MarketingCampaign',''),('6da5d270-9adc-49ee-a999-6ab4c350c977','View.DQMEnrichmentV','/foundation/DQMEnrichment.jsp','detail','数据增益',2,'b9cdd5de-2c52-4192-bdbd-0ed8a2ae8e81','5892f3c1-094a-4d1f-8887-0358e16cfa5a'),('6ef80e42-65ae-4e5d-a2b4-72d479d78e57','View.EventUnsolvedEmailV','/CallCenter/UnsolvedEmail.jsp','list','UnsolvedEmail',10,'10e008f6-0899-4afd-b532-b900c72a9ba7',''),('6f817794-dd38-4c77-bf18-78777a53a4ad','View.SystemParameterLinkBar','/CallCenter/SystemParameter.jsp','link','系统参数',11,'',''),('70648537-6320-4f68-aca4-17eb272cd475','View.BackstageControlBar','/marketing/BackstageControl.jsp','link','后台调度',3,'80106D48-E59F-4B2F-B222-07E5B464D379',''),('725200CA-3568-46E1-AEC3-F1FAEAC12078','View.DataManagementImpOrderV','/foundation/DataManagement.jsp','list','导入订单',1,'','882C9D5A-EBDD-4A44-BC3F-BF84E3A8F683'),('73e293c4-7385-4c47-9b4d-9bde44b400ee','View.GiftStockReport','/CallCenter/ExportStore.jsp','list','兑礼报表-仓库',3,'a2d86b1f-c498-407e-80a4-f25adf0a836b','7ee78346-1286-4c87-a48c-120c9e5fe087'),('74cb8f86-2c9c-4443-8fdd-a85829d41628','View.LoyPaymentV','/loyalty/LoyPayment.jsp','detail','支付方式',3,'4c0edf78-e93a-4183-b2fc-a51dcc80c74c',''),('7515b817-ea7b-4637-89f2-58517a51880b','View.InboundCustomerGiftOrderV','/CallCenter/InboundCustomerGiftOrder.jsp','detail','积分兑礼',7,'560a9aa1-145c-4e86-9890-7469505130a0',''),('7606d652-3281-4bb8-8465-1f2d62690c28','View.InboundCustomerServiceRequestV','/CallCenter/InboundCustomerServiceRequest.jsp','detail','服务请求',3,'560a9aa1-145c-4e86-9890-7469505130a0',''),('76d58e9e-38fe-455f-9aad-0e87648bb55a','View.DQMQualityLinkBar','/foundation/DQMQuality.jsp','link','数据质量',4,'undefined',''),('7891d295-90fe-4cd0-a9e9-d787812fe0b0','View.CampaignSummaryV','/marketing/campaignSummary.jsp','detail','总揽',1,'MarketingCampaign',''),('7b23d169-3830-482d-ae19-7352cd33381b','View.EventCallHistoryV','/CallCenter/EventCallHistory.jsp','detail','历史纪录',3,'',''),('7b3e5659-0c02-4beb-9331-3dc56d72a993','View.OrderItemLinkBar','/loyalty/OrderItemList.jsp','link','订单明细',2,'82802786-7479-427d-828b-f73cb2e99979',''),('7c1b73c1-e0eb-4191-9f2d-8d8a336c8c89','View.TaskOutboundV','/CallCenter/TaskEvent.jsp','detail','任务Outbound',2,'d8577a02-3a49-4ac3-91c1-1ed706917ae9',''),('7c57116e-ef11-421f-8bc6-9feb45773939','View.LoyProgramAttributesMemberV','/loyalty/LoyProgramAttributesMember.jsp','detail','会员字段属性',3,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',NULL),('7e0dc766-338c-43e5-80ff-eefcd8b6d4cb','View.UnDataEntryCustomerV','/CallCenter/UnDataEnterCustomer.jsp','list','未处理的数据录入',2,'1723839e-026a-446e-acfa-26cfe0969f43',''),('7ee78346-1286-4c87-a48c-120c9e5fe087','View.GiftStoreReportLinkBar','/CallCenter/ExportCounter.jsp','link','兑礼报表',2,'a2d86b1f-c498-407e-80a4-f25adf0a836b',''),('8198ce54-9e8e-4c51-99d7-06bd359503bd','View.CampaignDesignV','/marketing/CampaignDesign.jsp','detail','设计',3,'MarketingCampaign',NULL),('8381d387-5308-4a7a-a16a-6b8f9bb92f4f','View.DQMQualityV','/foundation/DQMQuality.jsp','detail','数据质量',4,'b9cdd5de-2c52-4192-bdbd-0ed8a2ae8e81','76d58e9e-38fe-455f-9aad-0e87648bb55a'),('83a62ed2-b19a-4b7f-877a-bb1e52f40534','View.LoyProgramServiceRequest','/CallCenter/LoyProgramServiceRequest.jsp','detail','服务请求',4,'',''),('8720ae8a-f6a4-48cf-b1a8-ef553f3d8e8f','View.CallCenterTaskV','/CallCenter/Task.jsp','list','任务',1,'d8577a02-3a49-4ac3-91c1-1ed706917ae9',''),('882C9D5A-EBDD-4A44-BC3F-BF84E3A8F683','View.DataManagementImpOrderBar','/foundation/DataManagement.jsp','link','导入订单Link',1,'',''),('8852fb1d-8c4b-4973-8f9b-cdd203f0fd88','View.CallCenterMainCenterV','/CallCenter/MainCenter.jsp','list','首页',2,'b10bfa81-f03a-4b99-b6e1-2211e4ff8b56',''),('895eaefe-49a6-4e88-9efd-7a574e441dd6','View.PointGiftDetail','/CallCenter/PointGiftDetail.jsp','list','礼品选择',6,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('8acfff0d-b2ca-4950-8930-6c09de81c359','View.ScreenManagement','/foundation/screenview.jsp','list','屏幕管理',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7','58eee1b8-30e6-453c-8c23-5aeb95c03d65'),('8dafed22-c9c1-4c2d-8d52-42642510cdc8','View.OrganizationV','/foundation/Organization.jsp','list','组织',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7','b34dedaf-ce96-4330-af5c-61cb04be7e40'),('8f03de80-fbf2-4b62-a271-b1790c013863','View.MemberCardV','/loyalty/MemberCard.jsp','detail','会员卡',4,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('8f2453e8-c0fd-4693-86c5-341784f1c747','View.PromotionAttributeV','/loyalty/promotion_attribute.jsp','detail','Promotion属性',4,'bee20ab0-bfc4-442e-8bf1-56f02706520f',''),('8f3b741c-5adc-452b-bd59-655163ed8bb5','View.DQMMonitorV','/foundation/DQMMonitor.jsp','list','数据监控',3,'b9cdd5de-2c52-4192-bdbd-0ed8a2ae8e81','03c3a588-9ab7-4293-9cff-223f7f6613b3'),('9097d299-cb10-43b3-8b44-fd20605f15ac','View.LoyProgramAttributesPointTypeV','/loyalty/LoyProgramAttributesPointType.jsp','detail','会员积分属性',4,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('925a4b7d-835e-4a9b-9d5c-7b73ab41d79b','View.InboundCustomerCampaignV','/CallCenter/InboundCustomerCampaign.jsp','detail','营销活动',5,'560a9aa1-145c-4e86-9890-7469505130a0',''),('92a914b3-e8ad-4385-ab2b-2a142e9720b7','View.LoyProgramTierClassV','/loyalty/LoyProgramTierClass.jsp','detail','等级分类',1,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',NULL),('92cfd846-18c2-4b79-a793-8c0fe0fdf245','View.BackstageControlV','/marketing/BackstageControl.jsp','list','调度管理',3,'80106D48-E59F-4B2F-B222-07E5B464D379','70648537-6320-4f68-aca4-17eb272cd475'),('94a908e8-8cd4-4da1-a583-699565382adf','View.MemberTireV','/loyalty/MemberTire.jsp','detail','会员等级',2,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('96a94439-d9f5-4698-81c8-abeab3cb94cb','View.CampaignROIAnalytics','/analytics/CampaignROIAnalytics.jsp','detail','ROI分析',1,'da71c5b1-da77-4da0-93c6-7beb6191eabe',''),('98a569e6-b559-427f-87d2-2f1b9fa786e5','View.ProductsV','/foundation/Products.jsp','list','产品',1,'28b633d3-7e6e-48a7-a92b-0ffe9dfd967c',''),('996527e5-d6ba-4396-a5fe-2f7dc8ee1a56','View.DQMDataProfilingLinkBar','/foundation/DQMDataProfiling.jsp','link','数据分析',1,'',''),('99dc6f36-30d3-4d92-912c-6963513a3f6e','View.LoyaltyLoyProgramV','/loyalty/LoyProgram.jsp','list','忠诚度项目',1,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',NULL),('9afae00a-a833-4aa7-b0a2-23d0019eee80','View.OrderLinkBar','/loyalty/Order.jsp','link','订单',1,'82802786-7479-427d-828b-f73cb2e99979',''),('9eb7df35-51ba-454e-b1a2-253ff053a439','View.RFMAnalytics','/analytics/CampaignRFMAnalytics.jsp','detail','订单分析',4,'da71c5b1-da77-4da0-93c6-7beb6191eabe',''),('9ecb04a7-42b9-4c6a-af3a-51dcf2fa4c04','View.MarketingResponseV','/marketing/Respose.jsp','list','响应管理',1,'8cd9f67c-0353-47a8-8cd7-c5f21b49460d',NULL),('a4ed2c8c-e4ea-428e-8228-c02268afc0e0','View.ProductCategoryV','/foundation/ProductCategory.jsp','list','产品category',1,'9dd61293-b013-48fe-b9ea-fab43b5ab379',''),('a52c9d6c-583e-48bb-bba4-ce0615d86c99','View.EventEmailV','/CallCenter/Email.jsp','list','Email',3,'10e008f6-0899-4afd-b532-b900c72a9ba7','9c72e67f-d3a5-4343-b516-c545ad1a7a01'),('a554c5aa-15b8-44f2-a4d1-41869ed8297f','View.EventSrV','/CallCenter/EventSR.jsp','detail','服务',4,'',''),('a7214d55-5624-4228-944f-608b18660082','View.LOVManagementV','/foundation/listOfValue.jsp','list','值列表',1,'39bc1087-1886-40ea-b491-b112eced99b1','678d29fb-1f28-490c-ae11-948ca4c54c92'),('a9988637-e407-47fc-82e4-fd2ef80de32c','View.LoyProgramCampaign','/CallCenter/LoyProgramCampaign.jsp','detail','营销活动',3,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('acde5d75-f9a2-449f-95f2-c03117fe3a9a','View.MarketingOfferContentV','/marketing/OfferContent.jsp','detail','内容',1,'8976951b-473c-4fd7-836e-dbdac45dd62f',NULL),('ad9e25bd-6098-4f72-a22f-ca941c7f31b1','View.MemberV','/loyalty/Member.jsp','list','会员信息',1,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('ae1872dd-f367-45da-8325-d3a18a0dd469','View.MyMessage','/CallCenter/MyMessage.jsp','list','我的消息',3,'00141a02-b56d-4ddd-88c4-d28dbcf8c008',''),('af7be7d8-5080-45ce-af2d-7a1096e2b5da','View.EventInboundAttachmentV','/CallCenter/InboundAttachment.jsp','detail','附件',3,'d220e218-6686-4e52-aff8-9c27dce1bcba','47bc29ea-d57c-4f9d-8b7e-c9d2a438e88c'),('b21946a4-7863-4908-94e3-414a353fdae9','View.PromotionDesignV','/loyalty/program_design.jsp','detail','Promotion设计',1,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('b34dedaf-ce96-4330-af5c-61cb04be7e40','View.OrgLinkBar','/foundation/Organization.jsp','link','组织管理',4,'3869d5e2-7d61-48b0-9551-4e19ced386a7',''),('b6381764-7b3f-4e98-9540-8710a31d812d','View.InboundCustomerEventV','/CallCenter/InboundCustomerEvent.jsp','detail','历史事件',2,'560a9aa1-145c-4e86-9890-7469505130a0',''),('b6766b2f-a30e-45ab-b46e-bd14bb07c1d1','View.CustomerCampaignV','/foundation/CustomerCampaign.jsp','detail','营销活动',4,'00141a02-b56d-4ddd-88c4-d28dbcf8c008',''),('b924bd15-8d4a-4ef1-abce-d1837e505738','View.InboundMemberPointsTransferV','/CallCenter/InboundCustomerPointsTransfer.jsp','detail','积分转移',10,'560a9aa1-145c-4e86-9890-7469505130a0',''),('b9dc8e12-14c5-479d-a2dd-44238a45d484','View.MemberPointsTransferV','/loyalty/MemberPointsTransfer.jsp','detail','积分转移',6,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('bd4e103e-deb5-4e17-b9e9-e4973e192ee0','View.GiftStoreReport','/CallCenter/ExportCounter.jsp','list','兑礼报表-柜台',1,'a2d86b1f-c498-407e-80a4-f25adf0a836b','7ee78346-1286-4c87-a48c-120c9e5fe087'),('bd7a182f-1cb0-4369-bd58-c427081adb3f','View.ViewLinkBar','/foundation/view.jsp','link','视图管理',5,'3869d5e2-7d61-48b0-9551-4e19ced386a7',''),('bee19bb8-cfe1-40bd-b4db-3b41964ee77e','View.EventRuleLinkBar','/CallCenter/EventRule.jsp','link','事件规则',12,'',''),('bf97b843-317f-4b28-b88e-ce5cbb708cf3','View.InboundCustomerOrderV','/CallCenter/InboundCustomerOrder.jsp','detail','订单',4,'560a9aa1-145c-4e86-9890-7469505130a0',''),('c3d59bfc-de94-456f-b9ec-904da46c09fc','View.InvitationV','/CallCenter/Invitation.jsp','list','邀约',1,'0db95450-ec8d-46aa-9270-a338ee15d6ab',''),('c4020c06-deca-46a7-ab17-b75140301992','View.MemberPointsAdjustV','/loyalty/MemberPointsAdjust.jsp','detail','积分调整',5,'fade8017-9cdd-45b1-bb5d-c8fd2fd0cd3a',''),('c59dd8c5-7ae9-455d-adb9-2fe1d67e9fd0','View.ProductManagerV','/foundation/ProductManager.jsp','detail','产品管理',2,'28b633d3-7e6e-48a7-a92b-0ffe9dfd967c',''),('c68bf138-be40-4adf-ab3b-d15f7d271963','View.OrderItemV','/loyalty/OrderItem.jsp','detail','订单明细',2,'82802786-7479-427d-828b-f73cb2e99979',''),('c6999850-5102-4565-a3d0-e0edf2be6d11','View.MarketingActionSendV','/marketing/actionSendSummary.jsp','detail','渠道汇总',5,'MarketingCampaign',''),('c9c2c598-5e56-480f-a74f-09850eda67ad','View.IncludeTierV','/loyalty/promotion_grade.jsp','detail','包含等级',3,'bee20ab0-bfc4-442e-8bf1-56f02706520f',''),('c9eef404-909c-466b-acb7-df1337365684','View.CustomerMoreInfoV','/foundation/CustomerMoreinfo.jsp','detail','更多信息',1,'9e00ec4e-290c-424a-a388-71b1753d7a75',''),('cf012aff-385c-4930-82e4-12633156d633','View.FAQManage','/CallCenter/FaqManage.jsp','list','FAQ管理',1,'9daf1861-3114-4362-b7b6-bfb36e2b1e0a',''),('cfed9b00-940e-4876-8aa6-bdeaf688e048','View.InboundMemberPointListV','/CallCenter/InboundCustomerPointList.jsp','detail','积分明细',8,'560a9aa1-145c-4e86-9890-7469505130a0',''),('d3856f0d-ef58-4f2c-ab85-ca0b15fe1505','View.CampDesignCustAnalyticsV','/analytics/CampaignDesignCustAnalytics.jsp','detail','营销设计客户分析',1,'398fc0ad-2eef-4452-a032-08cdca5abcfb',''),('d401fb03-a85f-4bba-aa77-4203c25d9443','View.CampDesignChannelAnalyticsV','/analytics/CampaignDesignChannelAnalytics.jsp','detail','渠道分析',3,'398fc0ad-2eef-4452-a032-08cdca5abcfb',''),('d447426e-623a-4082-b82b-52de2543b9b2','View.PointsRateLinkBar','/loyalty/PointPate.jsp','link','积分比率管理',4,'',''),('d562cf20-0a33-4441-89b2-b459ab052c1b','View.InboundCustomerMoreInfoV','/CallCenter/InboundCustomerMoreinfo.jsp','detail','更多信息',1,'560a9aa1-145c-4e86-9890-7469505130a0',''),('d61d5aa3-46b5-4abf-850f-a7a4778afe46','View.InboundCustomerMerge','/CallCenter/InboundCustomerMerge.jsp','detail','客户合并',12,'560a9aa1-145c-4e86-9890-7469505130a0',''),('d74cbe57-55ef-4bad-8dc7-ed717af303f8','View.InboundFrameV','/CallCenter/InboundFrame.jsp','list','Inbound-Call',1,'560a9aa1-145c-4e86-9890-7469505130a0',''),('d84dd02a-5528-4ba9-a464-2e59d321bc6a','View.EmployeeV','/foundation/Employee.jsp','list','员工',1,'b298e098-de72-48a5-be83-814e4013c647',''),('d863902d-117a-40fa-8aee-52ffad515fe2','View.TaskLog','/foundation/TaskLogStatus.jsp','link','任务日志',1,'',''),('d86b8b0b-d725-4a74-9a56-93705f492cbc','View.CampaignQueryOrderAnalyticsV','/analytics/CampaignQueryAnalytics.jsp','detail','客户细分订单分析',1,'31b323c8-71d0-4725-a336-4f2058b4e2eb',''),('DB3D26CC-94B8-4EF0-8200-A0A8BB2F510F','View.DataManagementImpCustomerBar','/foundation/DataManagement.jsp','link','导入客户Link',1,'',''),('dc4c353c-2a92-4849-b424-23e3aaae0f91','View.ProductReleationAnalytics','/analytics/ProductReleationAnalytics.jsp','detail','商品关联分析',4,'',''),('dc82b805-4f00-4828-a7ad-ec1ee002008d','View.RoleLinkBar','/foundation/roleuser.jsp','link','角色管理',2,'3869d5e2-7d61-48b0-9551-4e19ced386a7',NULL),('de7d2918-883b-471f-9b45-c373cfe86e61','View.UnsolvedServiceRequestV','/CallCenter/UnsolvedServiceRequest.jsp','list','未解决服务请求',4,'bb9ea6b4-9082-409b-9471-2e34fef415b5',''),('df71e391-c65e-4389-b04b-f84020317253','View.EventUnsolvedCallInboundV','/CallCenter/UnsolvedCallInbound.jsp','list','UnsolvedCallInbound',5,'d220e218-6686-4e52-aff8-9c27dce1bcba',''),('e407c13d-05fd-4b08-a738-cf542b7f51e0','View.LoyProgramAttributesRealTime','/loyalty/LoyProgramAttributesRealTime.jsp','detail','实时属性',11,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('e47c2511-caf0-4675-a23b-0edcb4df8b7c','View.InboundCustomerInvitationHistoryV','/CallCenter/InboundCustomerInvitationHistory.jsp','detail','邀约历史',6,'560a9aa1-145c-4e86-9890-7469505130a0',''),('e5c11162-96b0-4b42-ab47-598d9fdd89ba','View.LoyOrderItemV','/loyalty/LoyOrderItem.jsp','detail','交易明细',2,'4c0edf78-e93a-4183-b2fc-a51dcc80c74c',''),('e6067692-8a3b-47e1-84a0-002a19ca5155','View.PoistionUserV','/foundation/positionuser.jsp','detail','用户',1,'3869d5e2-7d61-48b0-9551-4e19ced386a7','3ac9c356-33d5-4496-86b5-ddc791c888ff'),('e7757e42-7305-4509-91dd-40d50799c764','View.MarketingListElementV','/marketing/TargetListElement.jsp','detail','详细信息',2,'0f76be02-78e0-475e-9004-bc9c648dc957',''),('ea09cbb1-a2f2-41cf-91dd-6b4b7f7e0c97','View.EventReport','/CallCenter/ExportBound.jsp','list','事件报表',1,'a2d86b1f-c498-407e-80a4-f25adf0a836b','4b0eb421-baac-4cc7-8bf0-215632572786'),('eeb67d9c-df1d-4d00-9d7e-5239aecad36d','View.LoyProgramAttributesTireClassV','/loyalty/LoyProgramAttributesTireClass.jsp','detail','会员等级属性',5,'21d22ee6-2d76-4a64-b637-f4ec9e3f8f9a',''),('ef4ace39-fcf4-4ccc-a096-f4f384ea5ccf','View.OrderItemV2','/loyalty/OrderItemList.jsp','list','订单明细',3,'82802786-7479-427d-828b-f73cb2e99979','7b3e5659-0c02-4beb-9331-3dc56d72a993'),('f2be4395-bf17-49e7-9903-23e95697ba44','View.LoyPromotionGeneralV','/loyalty/promotion_general.jsp','detail','包含产品',1,'bee20ab0-bfc4-442e-8bf1-56f02706520f',''),('f3682bfc-d973-490c-972b-f2f879c2b7a4','View.CampDesignOrderAnalyticsV','/analytics/CampaignDesignOrderAnalytics.jsp','detail','营销设计订单分析',2,'398fc0ad-2eef-4452-a032-08cdca5abcfb',''),('f64c8ba6-f4ac-4987-98b8-cd8adaf624f7','View.UserPositionV','/foundation/userposition.jsp','detail','职位',2,'3869d5e2-7d61-48b0-9551-4e19ced386a7','2be30692-6c39-4946-87b2-2656695b669e'),('f9cd01fc-1a58-4f58-8aa8-d6ae75950707','View.EventInboundSRV','/CallCenter/InboundSR.jsp','detail','服务请求',2,'d220e218-6686-4e52-aff8-9c27dce1bcba',''),('fabfeffc-c411-4e23-a17b-14c62e26ecd2','View.QuestionAnswerV','/CallCenter/QuestionAnswer.jsp','list','问题-答案',3,'3e0ef726-b056-4cd0-be33-a98454b940eb',''),('fd1baffd-dd6a-41ec-9b75-57794e7ef1d0','View.DQMDataProfilingV','/foundation/DQMDataProfiling.jsp','detail','数据分析',1,'b9cdd5de-2c52-4192-bdbd-0ed8a2ae8e81','996527e5-d6ba-4396-a5fe-2f7dc8ee1a56'),('MarketingCampaignBudgetV','View.MarketingCampaignBudgetV','/marketing/CampaignBudget.jsp','detail','活动预算',1,'MarketingCampaign',NULL),('MarketingCampaignExpenseV','View.MarketingCampaignExpenseV','/marketing/CampaignCampExpense.jsp','detail','活动成本',2,'MarketingCampaign',NULL),('MarketingCampaignV','View.MarketingCampaignV','/marketing/Campaign.jsp','list','营销活动',2,'',NULL),('MarketingProCampExpenseV','View.MarketingProCampExpenseV','/marketing/ProgramCampExpense.jsp','detail','项目成本',2,'MarketingProgram',''),('MarketingProCampV','View.MarketingProCampV','/marketing/ProgramCampaign.jsp','detail','营销活动',3,'MarketingProgram',NULL),('MarketingProgramBudgetV','View.MarketingProgramBudgetV','/marketing/ProgramBudget.jsp','detail','项目预算',1,'',''),('MarketingProgramV','View.MarketingProgramV','/marketing/Program.jsp','list','营销项目',1,'MarketingProgram','');

/*Table structure for table `m_xml` */

DROP TABLE IF EXISTS `m_xml`;

CREATE TABLE `m_xml` (
  `id` varchar(40) NOT NULL,
  `xml` longtext,
  `graph_xml` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_xml` */

insert  into `m_xml` values ('001','<?xml version=\"1.0\" encoding=\"utf-8\"?><root><Lines><Line id=\"2\" parent=\"9a95c536-d53d-0d70-5323-9e68c5906a97\" child=\"48d4e5df-56d8-5232-d738-6eaeccd05467\" X1=\"null\" Y1=\"null\" X2=\"null\" Y2=\"null\" number=\"null\" title=\"null\" condation=\"null\" count=\"null\"/><Line id=\"3\" parent=\"48d4e5df-56d8-5232-d738-6eaeccd05467\" child=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" X1=\"null\" Y1=\"null\" X2=\"null\" Y2=\"null\" number=\"null\" title=\"null\" condation=\"null\" count=\"null\"/><Line id=\"4\" parent=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" child=\"c82ad052-eb56-d1a8-2440-74fb4b31bc58\" X1=\"null\" Y1=\"null\" X2=\"null\" Y2=\"null\" number=\"null\" title=\"null\" condation=\"null\" count=\"null\"/><Line id=\"5\" parent=\"c82ad052-eb56-d1a8-2440-74fb4b31bc58\" child=\"d3b1e4a3-f8ab-3fd9-5cd8-5b7b1328f9ad\" X1=\"null\" Y1=\"null\" X2=\"null\" Y2=\"null\" number=\"null\" title=\"null\" condation=\"null\" count=\"null\"/><Line id=\"6\" parent=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" child=\"a1f9f523-1b1e-582a-bc19-045f7e997c72\" X1=\"null\" Y1=\"null\" X2=\"null\" Y2=\"null\" number=\"null\" title=\"null\" condation=\"null\" count=\"null\"/></Lines><Nodes><Node id=\"9a95c536-d53d-0d70-5323-9e68c5906a97\" type=\"Schedule\" X=\"70\" Y=\"30\" title=\"开始\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"48d4e5df-56d8-5232-d738-6eaeccd05467\" type=\"GT_AllGroup\" X=\"180\" Y=\"40\" title=\"细分\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" type=\"Sending Group\" X=\"330\" Y=\"50\" title=\"目标组\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"c82ad052-eb56-d1a8-2440-74fb4b31bc58\" type=\"SMS\" X=\"460\" Y=\"70\" title=\"短信\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"d3b1e4a3-f8ab-3fd9-5cd8-5b7b1328f9ad\" type=\"Wait\" X=\"570\" Y=\"100\" title=\"等待\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"e4dfb213-01df-d138-5786-729fbe796122\" type=\"GT_AllGroup\" X=\"660\" Y=\"200\" title=\"细分\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"a1f9f523-1b1e-582a-bc19-045f7e997c72\" type=\"Split\" X=\"390\" Y=\"170\" title=\"拆分\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"6d6f3406-5ea2-bb7e-ea78-0f578400e0de\" type=\"GT_AllGroup\" X=\"250\" Y=\"190\" title=\"细分\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node><Node id=\"f8752b72-4287-540a-6c3b-f04a452e485d\" type=\"Union\" X=\"380\" Y=\"280\" title=\"并集\" status=\"null\" rowId=\"null\" order=\"0\" count=\"null\" isnew=\"null\" source=\"null\"></Node></Nodes></root>','<mxGraphModel>\n  <root>\n    <mxCell id=\"0\"/>\n    <mxCell id=\"1\" parent=\"0\"/>\n    <mxCell id=\"9a95c536-d53d-0d70-5323-9e68c5906a97\" value=\"开始\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/start.png\" parent=\"1\" vertex=\"1\" type=\"Schedule\">\n      <mxGeometry x=\"70\" y=\"30\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"48d4e5df-56d8-5232-d738-6eaeccd05467\" value=\"细分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/search.png\" parent=\"1\" vertex=\"1\" type=\"GT_AllGroup\">\n      <mxGeometry x=\"180\" y=\"40\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"2\" parent=\"1\" source=\"9a95c536-d53d-0d70-5323-9e68c5906a97\" target=\"48d4e5df-56d8-5232-d738-6eaeccd05467\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" value=\"目标组\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/target.png\" parent=\"1\" vertex=\"1\" type=\"Sending Group\">\n      <mxGeometry x=\"330\" y=\"50\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"3\" parent=\"1\" source=\"48d4e5df-56d8-5232-d738-6eaeccd05467\" target=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"c82ad052-eb56-d1a8-2440-74fb4b31bc58\" value=\"短信\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/note.png\" parent=\"1\" vertex=\"1\" type=\"SMS\">\n      <mxGeometry x=\"460\" y=\"70\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"4\" parent=\"1\" source=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" target=\"c82ad052-eb56-d1a8-2440-74fb4b31bc58\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"d3b1e4a3-f8ab-3fd9-5cd8-5b7b1328f9ad\" value=\"等待\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/wait.png\" parent=\"1\" vertex=\"1\" type=\"Wait\">\n      <mxGeometry x=\"570\" y=\"100\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"5\" parent=\"1\" source=\"c82ad052-eb56-d1a8-2440-74fb4b31bc58\" target=\"d3b1e4a3-f8ab-3fd9-5cd8-5b7b1328f9ad\" edge=\"1\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"e4dfb213-01df-d138-5786-729fbe796122\" value=\"细分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/search.png\" parent=\"1\" vertex=\"1\" type=\"GT_AllGroup\">\n      <mxGeometry x=\"660\" y=\"200\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"a1f9f523-1b1e-582a-bc19-045f7e997c72\" value=\"拆分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/chai.png\" vertex=\"1\" type=\"Split\" parent=\"1\">\n      <mxGeometry x=\"390\" y=\"170\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"6\" edge=\"1\" parent=\"1\" source=\"9f884a20-355b-b890-89ac-2c81bc0c0fff\" target=\"a1f9f523-1b1e-582a-bc19-045f7e997c72\">\n      <mxGeometry relative=\"1\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"6d6f3406-5ea2-bb7e-ea78-0f578400e0de\" value=\"细分\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/search.png\" vertex=\"1\" type=\"GT_AllGroup\" parent=\"1\">\n      <mxGeometry x=\"250\" y=\"190\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n    <mxCell id=\"f8752b72-4287-540a-6c3b-f04a452e485d\" value=\"并集\" style=\"shape=image;verticalLabelPosition=bottom;image=../mxClient/images/new/he.png\" vertex=\"1\" type=\"Union\" parent=\"1\">\n      <mxGeometry x=\"380\" y=\"280\" width=\"35\" height=\"35\" as=\"geometry\"/>\n    </mxCell>\n  </root>\n</mxGraphModel>\n');

/*Table structure for table `order_details` */

DROP TABLE IF EXISTS `order_details`;

CREATE TABLE `order_details` (
  `order_num` varchar(15) NOT NULL,
  `prod_name` varchar(60) NOT NULL,
  `prod_atts` varchar(19) NOT NULL,
  `qty` varchar(1) NOT NULL,
  `payment` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `order_details` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `sell_id` varchar(18) NOT NULL,
  `order_num` varchar(15) NOT NULL,
  `trans_date` varchar(19) NOT NULL,
  `buyer_nick` varchar(14) NOT NULL,
  `pay_time` varchar(19) NOT NULL,
  `payment` varchar(6) NOT NULL,
  `receiver_name` varchar(6) NOT NULL,
  `Province` varchar(12) NOT NULL,
  `City` varchar(10) NOT NULL,
  `Region` varchar(12) NOT NULL,
  `receiver_address` varchar(92) NOT NULL,
  `receiver_zip` varchar(6) NOT NULL,
  `receiver_phone` varchar(13) NOT NULL,
  `receiver_mobile` varchar(11) NOT NULL,
  `buyer_email` varchar(10) NOT NULL,
  `trans_type` varchar(6) NOT NULL,
  `order_status` varchar(14) NOT NULL,
  `shipping_type` varchar(12) NOT NULL,
  `commission_fee` varchar(4) NOT NULL,
  `is_refund` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `sysdiagrams` */

DROP TABLE IF EXISTS `sysdiagrams`;

CREATE TABLE `sysdiagrams` (
  `name` varchar(128) NOT NULL,
  `principal_id` int(11) NOT NULL,
  `diagram_id` int(11) NOT NULL AUTO_INCREMENT,
  `version` int(11) DEFAULT NULL,
  `definition` longblob,
  PRIMARY KEY (`diagram_id`),
  UNIQUE KEY `UK_principal_name` (`principal_id`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `sysdiagrams` */

/*Table structure for table `t_send_msg` */

DROP TABLE IF EXISTS `t_send_msg`;

CREATE TABLE `t_send_msg` (
  `id` varchar(40) NOT NULL,
  `code` varchar(40) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `msgGuid` varchar(40) NOT NULL,
  `action_group_name` varchar(100) DEFAULT NULL,
  `action_id` varchar(40) NOT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `client_id` varchar(40) NOT NULL,
  `client_name` varchar(40) DEFAULT NULL,
  `msgPlat` varchar(20) NOT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `micro_channel` varchar(20) DEFAULT NULL,
  `microblogging` varchar(100) DEFAULT NULL,
  `two_id` varchar(40) DEFAULT NULL,
  `two_name` varchar(40) DEFAULT NULL,
  `two_path` varchar(100) DEFAULT NULL,
  `micropic_id` varchar(40) DEFAULT NULL,
  `micropic_name` varchar(40) DEFAULT NULL,
  `micropic_path` varchar(100) DEFAULT NULL,
  `action_start_date` date DEFAULT NULL,
  `planSendTime` datetime NOT NULL,
  `status` varchar(20) NOT NULL,
  `created` varchar(40) NOT NULL,
  `createTime` datetime NOT NULL,
  `updated` varchar(40) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `sender` varchar(40) DEFAULT NULL,
  `sendTarget` varchar(100) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `msgType` varchar(20) DEFAULT NULL,
  `actualSendTime` datetime DEFAULT NULL,
  `content` text,
  `msgExpandGuid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `t_send_msg` */

/*Table structure for table `t_send_msg_expand` */

DROP TABLE IF EXISTS `t_send_msg_expand`;

CREATE TABLE `t_send_msg_expand` (
  `msgExpandGuid` varchar(40) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `picurl` varchar(255) DEFAULT NULL,
  `sortId` int(11) DEFAULT NULL,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `t_send_msg_expand` */

/*Table structure for table `tmp_err_time` */

DROP TABLE IF EXISTS `tmp_err_time`;

CREATE TABLE `tmp_err_time` (
  `dt` datetime DEFAULT NULL,
  `error` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tmp_err_time` */

/*Table structure for table `ws_appkey` */

DROP TABLE IF EXISTS `ws_appkey`;

CREATE TABLE `ws_appkey` (
  `id` varchar(40) NOT NULL,
  `appkey` varchar(40) NOT NULL,
  `appsecret` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `ws_appkey` */

insert  into `ws_appkey` values ('loyalty','1AC7E99D38A69A01F75933CDA1253634','ff039320-ca10-49d9-88d9-5eb0b42d4ffb'),('MKT','02E9842388B25955DBCAD745B1DCEE05','263d8067-82a1-44ed-af47-4065a59a9f3e'),('test','test_appkey','appsecret20140408');

/* Function  structure for function  `campLog` */

/*!50003 DROP FUNCTION IF EXISTS `campLog` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `campLog`(
	clType  VARCHAR(200),
	clNodeName  VARCHAR(200),
	clExecNum  INT,
	clStatus  INT,
	clDescription  VARCHAR(100)
    ) RETURNS varchar(500) CHARSET utf8
BEGIN
	DECLARE headStr  VARCHAR(100) CHARACTER SET utf8;
	DECLARE tailStr  VARCHAR(100) CHARACTER SET utf8;
	DECLARE temp  VARCHAR(500) CHARACTER SET utf8;
	DECLARE const1  VARCHAR(500) CHARACTER SET utf8;
	DECLARE const2  VARCHAR(500) CHARACTER SET utf8;
	
	SET const1 = '<span style="color:red">失败</span>&nbsp;<img src="../images/icon-info.gif" style="cursor:pointer" width="12px" title="失败原因:';
	SET const2 = '">';
	
	IF  clType = 'START' THEN
		SET  headStr = '启动营销活动';
	ELSEIF clType = 'STOP' THEN
		SET  headStr = '停止营销活动';
	ELSEIF clType = 'CLEAR' THEN
		SET  headStr = '初始化节点【'+cl.node_name+'】，清空节点数据';
	ELSEIF clType = 'ADD' THEN
		SET  headStr = CONCAT('实例化节点【',clNodeName,'】，添加' ,clExecNum,' 条数据');
	ELSEIF clType = 'SEND_SMS' THEN
		SET  headStr = (CONCAT('发送 ',TRIM(CAST(clExecNum AS CHAR(11))) ,' 条短信'));
	ELSEIF clType = 'SEND_MMS' THEN
		SET  headStr = (CONCAT('发送 ',TRIM(CAST(clExecNum AS CHAR(11))) ,' 条彩信'));
	ELSEIF clType = 'SEND_EDM' THEN
		SET  headStr = (CONCAT('发送 ',TRIM(CAST(clExecNum AS CHAR(11))) ,' 封邮件'));
	ELSEIF clType = 'SEND_PHONE' THEN
		SET  headStr = (CONCAT('生成 ',TRIM(CAST(clExecNum AS CHAR(11))) ,' 条工单'));
	ELSE
		SET  headStr = '';
	END IF;
	
	
	IF clStatus = 0 THEN
		SET tailStr = CONCAT(const1,clDescription,const2);
	ELSE
		SET tailStr = '';
	END IF;
	
	SET temp = CONCAT(headStr, ' ', tailStr);
	RETURN temp;
    END */$$
DELIMITER ;

/* Function  structure for function  `giftValue` */

/*!50003 DROP FUNCTION IF EXISTS `giftValue` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `giftValue`(str varchar(100) CHARSET utf8) RETURNS longtext CHARSET utf8
BEGIN
	DECLARE  return_val LONGTEXT CHARACTER SET utf8;
	SET return_val='';
	
	if str is null then
		return null;
	end if;
	
	if POSITION('gift:' IN str) = 0 then
		return null;
	else
		 set return_val = substring(str, POSITION('gift:' IN str) + 5,CHAR_LENGTH(str) - POSITION('gift:' IN str) - 4);
		 return return_val;
	end if;
    END */$$
DELIMITER ;

/* Function  structure for function  `segmentation_condition` */

/*!50003 DROP FUNCTION IF EXISTS `segmentation_condition` */;
DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` FUNCTION `segmentation_condition`(in_lov VARCHAR(50),in_language VARCHAR(10),in_type VARCHAR(20)) RETURNS longtext CHARSET utf8
BEGIN
  DECLARE  return_val LONGTEXT CHARACTER SET utf8;
  SET return_val='';
  IF in_type = 'LOV'  THEN
	SET @rowNo = 0;
	SELECT GROUP_CONCAT(t.contents SEPARATOR '|') FROM (SELECT CONCAT(DISPLAY_VALUE,'=',CODE,'=',(@rowNo := @rowNo + 1)) AS contents FROM M_LOV WHERE TYPE = in_lov AND LANGUAGE=in_language ORDER BY display_order LIMIT 0,4) t
	INTO return_val;
	SET @rowNo = 0;
  END IF;
  RETURN return_val;
END */$$
DELIMITER ;

/* Procedure structure for procedure `dataPushById` */

/*!50003 DROP PROCEDURE IF EXISTS  `dataPushById` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`areca-cofco`@`%` PROCEDURE `dataPushById`(id varchar(40))
BEGIN
set autocommit=0; 
start transaction;
	INSERT INTO M_CUSTOMER 
	(ID, 
	CUSTOMER_NUM, 
	FIRST_NAME, 
	LAST_NAME, 
	FULL_NAME, 
	PINYIN, 
	GENDER, 
	COUNTRY, 
	BIRTHDAY, 
	ID_TYPE, 
	ID_CARD, 
	REGISTER_COUNTER, 
	ADMIN_COUNTER, 
	REGISTER_TIME, 
	SALESMAN_ID, 
	MODE, 
	IF_MEMBER, 
	INDUSTRY, 
	DUTY, 
	HOPPY, 
	EDUCATION, 
	INCOME, 
	SOURCE, 
	MOBILE_TEL, 
	MOBILETEL_STATUS, 
	IF_MOBILETEL, 
	HOME_TEL_REGION, 
	HOME_TEL, 
	HOME_TEL_EXT, 
	HOMETEL_STATUS, 
	IF_HOMETEL, 
	COMPANY_TEL_REGION, 
	COMPANY_TEL, 
	COMPANY_TEL_EXT, 
	COMPANYTEL_STATUS, 
	IF_POST, 
	IF_COMPANYTEL, 
	SPARE_TEL, 
	SPARETEL_STATUS, 
	IF_SPARETEL, 
	EMAIL, 
	EMAIL_STATUS, 
	IF_EMAIL, 
	POSTADDR_STATUS, 
	POSTCODE_STATUS, 
	CREATE_BY, 
	CREATE_DATE, 
	MODIFY_BY, 
	MODIFY_DATE, 
	BELONG_ORG, 
	SOURCE_OTHER, 
	MAIN_ADDRESS_ID, 
	DATA_ENTER_ID, 
	WARNING_INFO, 
	OCCUPATION, 
	INCOME_LIST, 
	SKIN_TYPE, 
	USED_BRAND, 
	KNOW_PRODUCT_MODE, 
	MOST_CARE_INFO, 
	SKIN_CARE_INFO, 
	ACTIVITY_NOTIFY, 
	CARE_PRODUCT, 
	SALE_TYPE, 
	REMARK, 
	Summary, 
	REGION, 
	PROVINCE, 
	CITY, 
	ADDRESS, 
	POSTALCODE, 
	FIRST_PUR_DATE, 
	FIRST_BUY_DATE, 
	LAST_BUY_DATE, 
	LAST_BUY_PRODUCT, 
	BUY_NUMBER, 
	LAST_ORDER_AMOUNT, 
	MAX_ORDER_AMOUNT, 
	AGE, 
	IMP_HISTORY_ID, 
	LAST_VISIT, 
	BUYER_CREDIT, 
	NICK, 
	PROMOTED_TYPE, 
	CONSUMER_PROTECTION, 
	VIP_INFO, 
	SOURCEID, 
	CUS_LEVEL, 
	PER_CUSTOMER_TRANSACT, 
	REFUND_TIMES, 
	REFUND_AMOUNT, 
	COMPANY_NAME, 
	MICROBLOG, 
	WECHAT
	)
	select 
		b.ID, 
	b.CUSTOMER_NUM, 
	b.FIRST_NAME, 
	b.LAST_NAME, 
	b.FULL_NAME, 
	b.PINYIN, 
	b.GENDER, 
	b.COUNTRY, 
	b.BIRTHDAY, 
	b.ID_TYPE, 
	b.ID_CARD, 
	b.REGISTER_COUNTER, 
	b.ADMIN_COUNTER, 
	b.REGISTER_TIME, 
	b.SALESMAN_ID, 
	b.MODE, 
	b.IF_MEMBER, 
	b.INDUSTRY, 
	b.DUTY, 
	b.HOPPY, 
	b.EDUCATION, 
	b.INCOME, 
	b.SOURCE, 
	b.MOBILE_TEL, 
	b.MOBILETEL_STATUS, 
	b.IF_MOBILETEL, 
	b.HOME_TEL_REGION, 
	b.HOME_TEL, 
	b.HOME_TEL_EXT, 
	b.HOMETEL_STATUS, 
	b.IF_HOMETEL, 
	b.COMPANY_TEL_REGION, 
	b.COMPANY_TEL, 
	b.COMPANY_TEL_EXT, 
	b.COMPANYTEL_STATUS, 
	b.IF_POST, 
	b.IF_COMPANYTEL, 
	b.SPARE_TEL, 
	b.SPARETEL_STATUS, 
	b.IF_SPARETEL, 
	b.EMAIL, 
	b.EMAIL_STATUS, 
	b.IF_EMAIL, 
	b.POSTADDR_STATUS, 
	b.POSTCODE_STATUS, 
	b.CREATE_BY, 
	b.CREATE_DATE, 
	b.MODIFY_BY, 
	b.MODIFY_DATE, 
	'7F57AE5B-EC02-4032-BDF6-3AE13E23B870', 
	b.SOURCE_OTHER, 
	b.MAIN_ADDRESS_ID, 
	b.DATA_ENTER_ID, 
	b.WARNING_INFO, 
	b.OCCUPATION, 
	b.INCOME_LIST, 
	b.SKIN_TYPE, 
	b.USED_BRAND, 
	b.KNOW_PRODUCT_MODE, 
	b.MOST_CARE_INFO, 
	b.SKIN_CARE_INFO, 
	b.ACTIVITY_NOTIFY, 
	b.CARE_PRODUCT, 
	b.SALE_TYPE, 
	b.REMARK, 
	b.Summary, 
	b.REGION, 
	b.PROVINCE, 
	b.CITY, 
	b.ADDRESS, 
	b.POSTALCODE, 
	b.FIRST_PUR_DATE, 
	b.FIRST_BUY_DATE, 
	b.LAST_BUY_DATE, 
	b.LAST_BUY_PRODUCT, 
	b.BUY_NUMBER, 
	b.LAST_ORDER_AMOUNT, 
	b.MAX_ORDER_AMOUNT, 
	b.AGE, 
	b.IMP_HISTORY_ID, 
	b.LAST_VISIT, 
	b.BUYER_CREDIT, 
	b.NICK, 
	b.PROMOTED_TYPE, 
	b.CONSUMER_PROTECTION, 
	b.VIP_INFO, 
	b.SOURCEID, 
	b.CUS_LEVEL, 
	b.PER_CUSTOMER_TRANSACT, 
	b.REFUND_TIMES, 
	b.REFUND_AMOUNT, 
	b.COMPANY_NAME, 
	b.MICROBLOG, 
	b.WECHAT
	from ArecaRkylin_etl.M_CUSTOMER b
	where b.ID = id;
	INSERT INTO M_RELA_CUSTOMER 
	(ID, 
	M_CUSTOMER_ID, 
	S_CUSTOMER_ID, 
	S_CUSTOMER_O_ID, 
	BELONG_ORG, 
	SOURCE
	)
	select UUID(),
			b.ID,
			UUID(),
			UUID(),
			'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',
			'中粮'
			FROM ArecaRkylin_etl.M_CUSTOMER b
			WHERE b.ID = id;
INSERT INTO M_SUB_CUSTOMER 
	(ID, 
	O_ID, 
	CUSTOMER_NUM, 
	FIRST_NAME, 
	LAST_NAME, 
	FULL_NAME, 
	PINYIN, 
	GENDER, 
	COUNTRY, 
	BIRTHDAY, 
	ID_TYPE, 
	ID_CARD, 
	REGISTER_COUNTER, 
	ADMIN_COUNTER, 
	REGISTER_TIME, 
	SALESMAN_ID, 
	MODE, 
	IF_MEMBER, 
	INDUSTRY, 
	DUTY, 
	HOPPY, 
	EDUCATION, 
	INCOME, 
	SOURCE, 
	MOBILE_TEL, 
	MOBILETEL_STATUS, 
	IF_MOBILETEL, 
	HOME_TEL_REGION, 
	HOME_TEL, 
	HOME_TEL_EXT, 
	HOMETEL_STATUS, 
	IF_HOMETEL, 
	COMPANY_TEL_REGION, 
	COMPANY_TEL, 
	COMPANY_TEL_EXT, 
	COMPANYTEL_STATUS, 
	IF_POST, 
	IF_COMPANYTEL, 
	SPARE_TEL, 
	SPARETEL_STATUS, 
	IF_SPARETEL, 
	EMAIL, 
	EMAIL_STATUS, 
	IF_EMAIL, 
	POSTADDR_STATUS, 
	POSTCODE_STATUS, 
	CREATE_BY, 
	CREATE_DATE, 
	MODIFY_BY, 
	MODIFY_DATE, 
	BELONG_ORG, 
	SOURCE_OTHER, 
	MAIN_ADDRESS_ID, 
	DATA_ENTER_ID, 
	WARNING_INFO, 
	OCCUPATION, 
	INCOME_LIST, 
	SKIN_TYPE, 
	USED_BRAND, 
	KNOW_PRODUCT_MODE, 
	MOST_CARE_INFO, 
	SKIN_CARE_INFO, 
	ACTIVITY_NOTIFY, 
	CARE_PRODUCT, 
	SALE_TYPE, 
	REMARK, 
	Summary, 
	REGION, 
	PROVINCE, 
	CITY, 
	ADDRESS, 
	POSTALCODE, 
	FIRST_PUR_DATE, 
	FIRST_BUY_DATE, 
	LAST_BUY_DATE, 
	LAST_BUY_PRODUCT, 
	LAST_ORDER_AMOUNT, 
	MAX_ORDER_AMOUNT, 
	BUY_NUMBER, 
	LAST_VISIT, 
	BUYER_CREDIT, 
	NICK, 
	PROMOTED_TYPE, 
	CONSUMER_PROTECTION, 
	VIP_INFO, 
	SOURCEID, 
	IMP_HISTORY_ID, 
	CUS_LEVEL, 
	PER_CUSTOMER_TRANSACT, 
	REFUND_TIMES, 
	REFUND_AMOUNT, 
	AGE, 
	COMPANY_NAME
	)
	SELECT  rela.S_CUSTOMER_ID, 
		rela.S_CUSTOMER_O_ID, 
		b.CUSTOMER_NUM, 
		b.FIRST_NAME, 
		b.LAST_NAME, 
		b.FULL_NAME, 
		b.PINYIN, 
		b.GENDER, 
		b.COUNTRY, 
		b.BIRTHDAY, 
		b.ID_TYPE, 
		b.ID_CARD, 
		b.REGISTER_COUNTER, 
		b.ADMIN_COUNTER, 
		b.REGISTER_TIME, 
		b.SALESMAN_ID, 
		b.MODE, 
		b.IF_MEMBER, 
		b.INDUSTRY, 
		b.DUTY, 
		b.HOPPY, 
		b.EDUCATION, 
		b.INCOME, 
		b.SOURCE, 
		b.MOBILE_TEL, 
		b.MOBILETEL_STATUS, 
		b.IF_MOBILETEL, 
		b.HOME_TEL_REGION, 
		b.HOME_TEL, 
		b.HOME_TEL_EXT, 
		b.HOMETEL_STATUS, 
		b.IF_HOMETEL, 
		b.COMPANY_TEL_REGION, 
		b.COMPANY_TEL, 
		b.COMPANY_TEL_EXT, 
		b.COMPANYTEL_STATUS, 
		b.IF_POST, 
		b.IF_COMPANYTEL, 
		b.SPARE_TEL, 
		b.SPARETEL_STATUS, 
		b.IF_SPARETEL, 
		b.EMAIL, 
		b.EMAIL_STATUS, 
		b.IF_EMAIL, 
		b.POSTADDR_STATUS, 
		b.POSTCODE_STATUS, 
		b.CREATE_BY, 
		b.CREATE_DATE, 
		b.MODIFY_BY, 
		b.MODIFY_DATE, 
		'7F57AE5B-EC02-4032-BDF6-3AE13E23B870', 
		b.SOURCE_OTHER, 
		b.MAIN_ADDRESS_ID, 
		b.DATA_ENTER_ID, 
		b.WARNING_INFO, 
		b.OCCUPATION, 
		b.INCOME_LIST, 
		b.SKIN_TYPE, 
		b.USED_BRAND, 
		b.KNOW_PRODUCT_MODE, 
		b.MOST_CARE_INFO, 
		b.SKIN_CARE_INFO, 
		b.ACTIVITY_NOTIFY, 
		b.CARE_PRODUCT, 
		b.SALE_TYPE, 
		b.REMARK, 
		b.Summary, 
		b.REGION, 
		b.PROVINCE, 
		b.CITY, 
		b.ADDRESS, 
		b.POSTALCODE, 
		b.FIRST_PUR_DATE, 
		b.FIRST_BUY_DATE, 
		b.LAST_BUY_DATE, 
		b.LAST_BUY_PRODUCT, 
		b.LAST_ORDER_AMOUNT, 
		b.MAX_ORDER_AMOUNT, 
		b.BUY_NUMBER, 
		b.LAST_VISIT, 
		b.BUYER_CREDIT, 
		b.NICK, 
		b.PROMOTED_TYPE, 
		b.CONSUMER_PROTECTION, 
		b.VIP_INFO, 
		b.SOURCEID, 
		b.IMP_HISTORY_ID, 
		b.CUS_LEVEL, 
		b.PER_CUSTOMER_TRANSACT, 
		b.REFUND_TIMES, 
		b.REFUND_AMOUNT, 
		b.AGE, 
		b.COMPANY_NAME
		FROM ArecaRkylin_etl.M_CUSTOMER b, M_RELA_CUSTOMER rela
		where b.ID = id AND rela.M_CUSTOMER_ID = id;
insert into M_ORG_CUSTOMER
	(ID,
	ORG_ID,
	CUSTOMER_ID
	)
	SELECT
		UUID(),
		
		'7F57AE5B-EC02-4032-BDF6-3AE13E23B870',
		
		b.id
		FROM ArecaRkylin_etl.M_CUSTOMER b
		where b.ID = id;
INSERT INTO M_PROCEDURE_LOG(procedure_name,execute_start,source)
VALUES('users_to_CUSTOMER',NOW(),'中粮');
commit;	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `fetchPointDetail` */

/*!50003 DROP PROCEDURE IF EXISTS  `fetchPointDetail` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `fetchPointDetail`(customerId VARCHAR(40), pointType VARCHAR(1))
BEGIN
  IF pointType = 'A' THEN
    SELECT
  P.ID AS id,
  P.POINTS AS `point`,
  IFNULL(giftValue(P.COMMENTS), CONCAT(P.ACT_TYPE, CONCAT('-', P.ACT_SUB_TYPE))) AS reason,
  P.BORN_DATE AS updateTime
FROM M_POINT_LIST P JOIN M_MEMBER M ON P.MEMBER_ID = M.ID
 JOIN M_CUSTOMER C ON M.CUSTOMER_ID = C.ID
WHERE (C.ID = customerId OR C.GRANDFATHER_GUID = customerId) AND P.VALID_FLAG = 1 AND P.POINTS > 0
ORDER BY P.BORN_DATE;
	
  END IF ;
    IF pointType = 'S' THEN
    SELECT
  P.ID AS id,
  ABS(P.POINTS) AS `point`,
  IFNULL(giftValue(P.COMMENTS), CONCAT(P.ACT_TYPE, CONCAT('-', P.ACT_SUB_TYPE))) AS reason,
  P.BORN_DATE AS updateTime
FROM M_POINT_LIST P JOIN M_MEMBER M ON P.MEMBER_ID = M.ID
 JOIN M_CUSTOMER C ON M.CUSTOMER_ID = C.ID
WHERE (C.ID = customerId OR C.GRANDFATHER_GUID = customerId) AND P.VALID_FLAG = 1 AND P.POINTS < 0
ORDER BY P.BORN_DATE;
	
  END IF ;
END */$$
DELIMITER ;

/* Procedure structure for procedure `JolMemberDowith` */

/*!50003 DROP PROCEDURE IF EXISTS  `JolMemberDowith` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `JolMemberDowith`()
BEGIN
UPDATE M_MEMBER_TIER t1,M_MEMBER t2 ,M_TIER  t3, M_TIER t4
 SET
 t1.TIER = t4.ID
 
WHERE t1.MEMBER_ID = t2.ID 
AND t1.TIER = t3.ID
AND t3.TIER_NAME = '普通会员' 
AND t4.TIER_NAME = '认证会员' 
AND t2.IS_MOBILE_REGISTER = 1;
UPDATE M_MEMBER_TIER t1,M_MEMBER t2 ,M_TIER  t3, M_TIER t4
 SET
  t1.TIER = t4.ID
WHERE t1.MEMBER_ID = t2.ID 
AND t1.TIER = t3.ID
AND t3.TIER_NAME = '认证会员' 
AND t4.TIER_NAME = 'VIP会员' 
AND t2.IS_MOBILE_REGISTER = 1
AND t2.IS_EMPLOYEE = 1;
UPDATE M_MEMBER_TIER t1,M_MEMBER t2 ,M_TIER  t3, M_TIER t4
 SET
  t1.TIER = t4.ID
WHERE t1.MEMBER_ID = t2.ID 
AND t1.TIER = t3.ID
AND t3.TIER_NAME = 'VIP会员'
AND t4.TIER_NAME = '认证会员' 
AND t2.IS_EMPLOYEE <> 1;
UPDATE M_MEMBER_TIER t1,M_MEMBER t2 ,M_TIER  t3, M_TIER t4
 SET
 t1.TIER = t4.ID
 
WHERE t1.MEMBER_ID = t2.ID 
AND t1.TIER = t3.ID
AND t3.TIER_NAME = '认证会员'  
AND t4.TIER_NAME = '普通会员'
AND t2.IS_MOBILE_REGISTER <> 1;
COMMIT;
    END */$$
DELIMITER ;

/* Procedure structure for procedure `JolPointsDowith` */

/*!50003 DROP PROCEDURE IF EXISTS  `JolPointsDowith` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `JolPointsDowith`(
   -- emp_par double,
   -- con_par double
    )
BEGIN
DECLARE emp_par double DEFAULT 1;
DECLARE con_par DOUBLE DEFAULT 1;
select rat into emp_par from M_JOL_REBATE_RATE where name = '推荐人利率';
SELECT rat INTO con_par FROM M_JOL_REBATE_RATE WHERE NAME = '优惠券利率';
INSERT INTO m_point_list 
	(ID, 
	MEMBER_ID, 
	ORDER_ID, 
	POINTS, 
	MEMBER_CARD, 
	PROMOTION_ID, 
	START_DATE, 
	END_DATE, 
	POINT_TYPE_ID, 
	USED_VALUE, 
	PROMOTION_NAME, 
	PROMOTION_TYPE, 
	COMMENTS, 
	MEMBER_PERIOD, 
	PROCESS_FLAG, 
	BORN_DATE, 
	VALID_FLAG, 
	FATHER_GUID, 
	COMB_STATUS, 
	ACT_TYPE, 
	ACT_SUB_TYPE
	)
	
SELECT UUID(), 
	t1.MEMBER_ID, 
	t1.ID, 
	t1.ORDER_AMOUNT*emp_par, 
	'', 
	'', 
	NOW(), 
	INTERVAL 12 MONTH + NOW(),
	t2.ID, 
	'', 
	'推荐返利', 
	'M_BASE', 
	'', 
	'', 
	0, 
	'', 
	2, 
	NOW(), 
	'', 
	'', 
	''
	
	FROM M_LOY_ORDER t1 LEFT JOIN M_POINT_TYPE t2 ON 1=1
	WHERE t1.STATUS = 'M_PENDING'
	AND t1.TYPE = 'M_EMPLOYEE'
	AND t2.NAME = '返利积分'
	;
	
UPDATE  M_LOY_ORDER t1 
SET t1.STATUS = 'M_PROCESSED'
WHERE  t1.STATUS = 'M_PENDING'
	AND t1.TYPE = 'M_EMPLOYEE';
	
COMMIT;	
	
INSERT INTO m_point_list 
	(ID, 
	MEMBER_ID, 
	ORDER_ID, 
	POINTS, 
	MEMBER_CARD, 
	PROMOTION_ID, 
	START_DATE, 
	END_DATE, 
	POINT_TYPE_ID, 
	USED_VALUE, 
	PROMOTION_NAME, 
	PROMOTION_TYPE, 
	COMMENTS, 
	MEMBER_PERIOD, 
	PROCESS_FLAG, 
	BORN_DATE, 
	VALID_FLAG, 
	FATHER_GUID, 
	COMB_STATUS, 
	ACT_TYPE, 
	ACT_SUB_TYPE
	)
	
SELECT UUID(), 
	t1.MEMBER_ID, 
	t1.ID, 
	t1.ORDER_AMOUNT*con_par, 
	'', 
	'', 
	NOW(), 
	INTERVAL 12 MONTH + NOW(),
	t2.ID, 
	'', 
	'优惠券返利', 
	'M_BASE', 
	'', 
	'', 
	0, 
	'', 
	2, 
	NOW(), 
	'', 
	'', 
	''
	
	FROM M_LOY_ORDER t1 LEFT JOIN M_POINT_TYPE t2 ON 1=1
	WHERE t1.STATUS = 'M_PENDING'
	AND t1.TYPE = 'M_CONPONS'
	AND t2.NAME = '返利积分'
	;
	
UPDATE  M_LOY_ORDER t1 
SET t1.STATUS = 'M_PROCESSED'
WHERE  t1.STATUS = 'M_PENDING'
	AND t1.TYPE = 'M_CONPONS';
	
COMMIT;
	
INSERT INTO m_point_list 
	(ID, 
	MEMBER_ID, 
	ORDER_ID, 
	POINTS, 
	MEMBER_CARD, 
	PROMOTION_ID, 
	START_DATE, 
	END_DATE, 
	POINT_TYPE_ID, 
	USED_VALUE, 
	PROMOTION_NAME, 
	PROMOTION_TYPE, 
	COMMENTS, 
	MEMBER_PERIOD, 
	PROCESS_FLAG, 
	BORN_DATE, 
	VALID_FLAG, 
	FATHER_GUID, 
	COMB_STATUS, 
	ACT_TYPE, 
	ACT_SUB_TYPE
	)
	
SELECT UUID(), 
	t1.MEMBER_ID, 
	t1.ID, 
	-ABS(t1.ORDER_AMOUNT), 
	'', 
	'', 
	NOW(), 
	INTERVAL 12 MONTH + NOW(),
	t2.ID, 
	'', 
	'返利扣分', 
	'M_BASE', 
	'', 
	'', 
	0, 
	'', 
	2, 
	NOW(), 
	'', 
	'', 
	''
	
	FROM M_LOY_ORDER t1 LEFT JOIN M_POINT_TYPE t2 ON 1=1
	WHERE t1.STATUS = 'M_PENDING'
	AND t1.TYPE = 'M_DEDUCTION'
	AND t2.NAME = '返利积分'
	;
	
UPDATE  M_LOY_ORDER t1 
SET t1.STATUS = 'M_PROCESSED'
WHERE  t1.STATUS = 'M_PENDING'
	AND t1.TYPE = 'M_DEDUCTION';
COMMIT;
	
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_update_points`
(`MEMBER_ID` VARCHAR(40)DEFAULT NULL,
`POINT_TYPE_ID` VARCHAR(40)DEFAULT NULL,
`ADD_POINTS` DOUBLE,
`SUB_POINTS` DOUBLE);
INSERT  INTO tmp_update_points(MEMBER_ID,POINT_TYPE_ID,ADD_POINTS,SUB_POINTS)
SELECT t1.MEMBER_ID,t1.POINT_TYPE_ID,SUM(CASE WHEN t1.POINTS >0 THEN t1.POINTS ELSE 0 END) AS ADD_POINTS,
	SUM(CASE WHEN t1.POINTS <0 THEN t1.POINTS ELSE 0 END) AS SUB_POINTS 
	FROM m_point_list t1 LEFT OUTER JOIN m_points t2 ON (t1.MEMBER_ID = t2.MEMBER_ID AND t1.POINT_TYPE_ID = t2.POINT_TYPE_ID)
	WHERE t1.VALID_FLAG =2
	AND t2.ID IS NOT  NULL
	GROUP BY t1.MEMBER_ID,t1.POINT_TYPE_ID;
UPDATE m_points t3,tmp_update_points t4 
	
  SET
      t3.TOTAL_POINTS = t3.TOTAL_POINTS	+ t4.ADD_POINTS,
      t3.VALID_POINTS = t3.TOTAL_POINTS	+ t4.ADD_POINTS+t4.SUB_POINTS,
      t3.LIFETIME_POINTS = t3.LIFETIME_POINTS	+ t4.ADD_POINTS,
      t3.LIFETIME_VALID_POINTS = t3.LIFETIME_VALID_POINTS + t4.ADD_POINTS+t4.SUB_POINTS
      
	WHERE t3.MEMBER_ID = t4.MEMBER_ID AND t3.POINT_TYPE_ID = t4.POINT_TYPE_ID;
COMMIT;
	
INSERT INTO m_points 
	(ID, 
	POINT_TYPE_ID, 
	MEMBER_ID, 
	TOTAL_POINTS, 
	VALID_POINTS, 
	FOZEN_POINTS, 
	LAST_BALANCE, 
	LIFETIME_POINTS, 
	MEMBER_PERIOD, 
	LIFETIME_VALID_POINTS, 
	UPDATE_TIME, 
	FATHER_GUID, 
	COMB_STATUS, 
	GIFT_POINTS
	)
 SELECT
	UUID(), 
	t1.MEMBER_ID, 
	t1.POINT_TYPE_ID, 
	SUM(CASE WHEN t1.POINTS >0 THEN t1.POINTS ELSE 0 END), 
	SUM(t1.POINTS), 
	0, 
	0, 
	SUM(CASE WHEN t1.POINTS >0 THEN t1.POINTS ELSE 0 END), 
	'', 
	SUM(t1.POINTS),  
	NOW(), 
	'', 
	'', 
	0	
	
	FROM m_point_list t1 LEFT OUTER JOIN m_points t2 ON (t1.MEMBER_ID = t2.MEMBER_ID AND t1.POINT_TYPE_ID = t2.POINT_TYPE_ID)
	WHERE t1.VALID_FLAG =2
	AND t2.ID IS   NULL
	GROUP BY t1.MEMBER_ID,t1.POINT_TYPE_ID;
  
 
 UPDATE m_point_list t1 
  SET t1.VALID_FLAG =1
 WHERE t1.VALID_FLAG =2;
 
COMMIT;
DROP TABLE IF EXISTS tmp_update_points; 
-- DROP TABLE IF EXISTS tmp_update_points;
	
    END */$$
DELIMITER ;

/* Procedure structure for procedure `SyncCustomer.MD.Batch` */

/*!50003 DROP PROCEDURE IF EXISTS  `SyncCustomer.MD.Batch` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `SyncCustomer.MD.Batch`(
  orgId VARCHAR(40),
  programId VARCHAR(40),
  member_tier VARCHAR(40),
  startTm DATETIME
)
BEGIN
DECLARE idx INT DEFAULT 1;
DECLARE lastSeq INT DEFAULT 0;
DECLARE procTmstmp DATETIME;
DECLARE lastProcTmstmp DATETIME;
DECLARE orgName VARCHAR(40);
DECLARE insCnt INT(10) DEFAULT 0;
DECLARE updCnt INT(10) DEFAULT 0;
DECLARE errCnt INT(10) DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLWARNING
BEGIN
  INSERT INTO tmp_err_time(`dt`, `error`) VALUE (procTmStmp, 'WARNING');
END;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
  INSERT INTO tmp_err_time(`dt`, `error`) VALUE (procTmStmp, 'EXCEPTION');
  
  SELECT COUNT(*) + errCnt INTO errCnt FROM tmp_insert_customer;
  SELECT COUNT(*) + errCnt INTO errCnt FROM tmp_update_customer;
END;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_insert_time (seq INT PRIMARY KEY AUTO_INCREMENT, dt DATETIME);
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_err_time (id INT PRIMARY KEY AUTO_INCREMENT, dt DATETIME, error VARCHAR(10));
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_insert_customer` (
  `ID` VARCHAR(40) NOT NULL,
  `CUSTOMER_NUM` VARCHAR(50) DEFAULT NULL,
  `FIRST_NAME` VARCHAR(40) DEFAULT NULL,
  `LAST_NAME` VARCHAR(40) DEFAULT NULL,
  `FULL_NAME` VARCHAR(50) DEFAULT NULL,
  `PINYIN` VARCHAR(20) DEFAULT NULL,
  `GENDER` VARCHAR(40) DEFAULT NULL,
  `COUNTRY` VARCHAR(40) DEFAULT NULL,
  `BIRTHDAY` DATETIME DEFAULT NULL,
  `ID_TYPE` VARCHAR(40) DEFAULT NULL,
  `ID_CARD` VARCHAR(30) DEFAULT NULL,
  `REGISTER_COUNTER` VARCHAR(40) DEFAULT NULL,
  `ADMIN_COUNTER` VARCHAR(40) DEFAULT NULL,
  `REGISTER_TIME` DATETIME DEFAULT NULL,
  `SALESMAN_ID` VARCHAR(40) DEFAULT NULL,
  `MODE` VARCHAR(40) DEFAULT NULL,
  `IF_MEMBER` INT(11) DEFAULT NULL,
  `INDUSTRY` VARCHAR(40) DEFAULT NULL,
  `DUTY` VARCHAR(40) DEFAULT NULL,
  `HOPPY` VARCHAR(100) DEFAULT NULL,
  `EDUCATION` VARCHAR(40) DEFAULT NULL,
  `INCOME` VARCHAR(40) DEFAULT NULL,
  `SOURCE` VARCHAR(40) DEFAULT NULL,
  `MOBILE_TEL` VARCHAR(50) DEFAULT NULL,
  `MOBILETEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_MOBILETEL` INT(11) DEFAULT NULL,
  `HOME_TEL_REGION` VARCHAR(20) DEFAULT NULL,
  `HOME_TEL` VARCHAR(50) DEFAULT NULL,
  `HOME_TEL_EXT` VARCHAR(20) DEFAULT NULL,
  `HOMETEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_HOMETEL` INT(11) DEFAULT NULL,
  `COMPANY_TEL_REGION` VARCHAR(20) DEFAULT NULL,
  `COMPANY_TEL` VARCHAR(20) DEFAULT NULL,
  `COMPANY_TEL_EXT` VARCHAR(20) DEFAULT NULL,
  `COMPANYTEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_POST` INT(11) DEFAULT NULL,
  `IF_COMPANYTEL` INT(11) DEFAULT NULL,
  `SPARE_TEL` VARCHAR(20) DEFAULT NULL,
  `SPARETEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_SPARETEL` INT(11) DEFAULT NULL,
  `EMAIL` TEXT,
  `EMAIL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_EMAIL` INT(11) DEFAULT NULL,
  `POSTADDR_STATUS` VARCHAR(40) DEFAULT NULL,
  `POSTCODE_STATUS` VARCHAR(40) DEFAULT NULL,
  `CREATE_BY` VARCHAR(40) DEFAULT NULL,
  `CREATE_DATE` DATETIME DEFAULT NULL,
  `MODIFY_BY` VARCHAR(40) DEFAULT NULL,
  `MODIFY_DATE` DATETIME DEFAULT NULL,
  `BELONG_ORG` VARCHAR(40) DEFAULT NULL,
  `SOURCE_OTHER` VARCHAR(40) DEFAULT NULL,
  `MAIN_ADDRESS_ID` VARCHAR(40) DEFAULT NULL,
  `DATA_ENTER_ID` VARCHAR(40) DEFAULT NULL,
  `WARNING_INFO` VARCHAR(200) DEFAULT NULL,
  `OCCUPATION` VARCHAR(40) DEFAULT NULL,
  `INCOME_LIST` VARCHAR(40) DEFAULT NULL,
  `SKIN_TYPE` VARCHAR(40) DEFAULT NULL,
  `USED_BRAND` VARCHAR(40) DEFAULT NULL,
  `KNOW_PRODUCT_MODE` VARCHAR(40) DEFAULT NULL,
  `MOST_CARE_INFO` VARCHAR(40) DEFAULT NULL,
  `SKIN_CARE_INFO` VARCHAR(40) DEFAULT NULL,
  `ACTIVITY_NOTIFY` VARCHAR(40) DEFAULT NULL,
  `CARE_PRODUCT` VARCHAR(40) DEFAULT NULL,
  `SALE_TYPE` VARCHAR(40) DEFAULT NULL,
  `REMARK` TEXT,
  `Summary` INT(11) DEFAULT NULL,
  `REGION` VARCHAR(64) DEFAULT NULL,
  `PROVINCE` VARCHAR(64) DEFAULT NULL,
  `CITY` VARCHAR(64) DEFAULT NULL,
  `ADDRESS` TEXT,
  `POSTALCODE` VARCHAR(50) DEFAULT NULL,
  `FIRST_PUR_DATE` DATETIME DEFAULT NULL,
  `FIRST_BUY_DATE` DATETIME DEFAULT NULL,
  `LAST_BUY_DATE` DATETIME DEFAULT NULL,
  `LAST_BUY_PRODUCT` VARCHAR(100) DEFAULT NULL,
  `BUY_NUMBER` INT(11) DEFAULT NULL,
  `LAST_ORDER_AMOUNT` DECIMAL(11,2) DEFAULT '0.00',
  `MAX_ORDER_AMOUNT` DECIMAL(11,2) DEFAULT '0.00',
  `AGE` INT(11) DEFAULT NULL,
  `IMP_HISTORY_ID` VARCHAR(36) DEFAULT NULL,
  `LAST_VISIT` DATETIME DEFAULT NULL,
  `BUYER_CREDIT` VARCHAR(64) DEFAULT NULL,
  `NICK` VARCHAR(50) DEFAULT NULL,
  `PROMOTED_TYPE` INT(11) DEFAULT NULL,
  `CONSUMER_PROTECTION` VARCHAR(32) DEFAULT NULL,
  `VIP_INFO` VARCHAR(10) DEFAULT NULL,
  `SOURCEID` VARCHAR(36) DEFAULT NULL,
  `CUS_LEVEL` VARCHAR(40) DEFAULT NULL,
  `PER_CUSTOMER_TRANSACT` DECIMAL(11,2) DEFAULT '0.00',
  `REFUND_TIMES` INT(11) DEFAULT '0',
  `REFUND_AMOUNT` DECIMAL(11,2) DEFAULT '0.00',
  `COMPANY_NAME` VARCHAR(100) DEFAULT NULL,
  `INSERT_TIME` DATETIME DEFAULT NULL,
  `MICROBLOG` VARCHAR(100) DEFAULT NULL,
  `WECHAT` VARCHAR(40) DEFAULT NULL,
  `IS_ATTENTION` INT(11) DEFAULT '0',
  `IS_MOBILE_REGISTER` INT(11) DEFAULT '0',
  `IS_EMPLOYEES` INT(11) DEFAULT '0',
  `HEY_CONPONS` VARCHAR(20) DEFAULT NULL,
  `EMP_RECOMMEND` VARCHAR(40) DEFAULT NULL,  
  PRIMARY KEY (`ID`)
);
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_update_customer` (
  `ID` VARCHAR(40) NOT NULL,
  `CUSTOMER_NUM` VARCHAR(50) DEFAULT NULL,
  `FIRST_NAME` VARCHAR(40) DEFAULT NULL,
  `LAST_NAME` VARCHAR(40) DEFAULT NULL,
  `FULL_NAME` VARCHAR(50) DEFAULT NULL,
  `PINYIN` VARCHAR(20) DEFAULT NULL,
  `GENDER` VARCHAR(40) DEFAULT NULL,
  `COUNTRY` VARCHAR(40) DEFAULT NULL,
  `BIRTHDAY` DATETIME DEFAULT NULL,
  `ID_TYPE` VARCHAR(40) DEFAULT NULL,
  `ID_CARD` VARCHAR(30) DEFAULT NULL,
  `REGISTER_COUNTER` VARCHAR(40) DEFAULT NULL,
  `ADMIN_COUNTER` VARCHAR(40) DEFAULT NULL,
  `REGISTER_TIME` DATETIME DEFAULT NULL,
  `SALESMAN_ID` VARCHAR(40) DEFAULT NULL,
  `MODE` VARCHAR(40) DEFAULT NULL,
  `IF_MEMBER` INT(11) DEFAULT NULL,
  `INDUSTRY` VARCHAR(40) DEFAULT NULL,
  `DUTY` VARCHAR(40) DEFAULT NULL,
  `HOPPY` VARCHAR(100) DEFAULT NULL,
  `EDUCATION` VARCHAR(40) DEFAULT NULL,
  `INCOME` VARCHAR(40) DEFAULT NULL,
  `SOURCE` VARCHAR(40) DEFAULT NULL,
  `MOBILE_TEL` VARCHAR(50) DEFAULT NULL,
  `MOBILETEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_MOBILETEL` INT(11) DEFAULT NULL,
  `HOME_TEL_REGION` VARCHAR(20) DEFAULT NULL,
  `HOME_TEL` VARCHAR(50) DEFAULT NULL,
  `HOME_TEL_EXT` VARCHAR(20) DEFAULT NULL,
  `HOMETEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_HOMETEL` INT(11) DEFAULT NULL,
  `COMPANY_TEL_REGION` VARCHAR(20) DEFAULT NULL,
  `COMPANY_TEL` VARCHAR(20) DEFAULT NULL,
  `COMPANY_TEL_EXT` VARCHAR(20) DEFAULT NULL,
  `COMPANYTEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_POST` INT(11) DEFAULT NULL,
  `IF_COMPANYTEL` INT(11) DEFAULT NULL,
  `SPARE_TEL` VARCHAR(20) DEFAULT NULL,
  `SPARETEL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_SPARETEL` INT(11) DEFAULT NULL,
  `EMAIL` TEXT,
  `EMAIL_STATUS` VARCHAR(40) DEFAULT NULL,
  `IF_EMAIL` INT(11) DEFAULT NULL,
  `POSTADDR_STATUS` VARCHAR(40) DEFAULT NULL,
  `POSTCODE_STATUS` VARCHAR(40) DEFAULT NULL,
  `CREATE_BY` VARCHAR(40) DEFAULT NULL,
  `CREATE_DATE` DATETIME DEFAULT NULL,
  `MODIFY_BY` VARCHAR(40) DEFAULT NULL,
  `MODIFY_DATE` DATETIME DEFAULT NULL,
  `BELONG_ORG` VARCHAR(40) DEFAULT NULL,
  `SOURCE_OTHER` VARCHAR(40) DEFAULT NULL,
  `MAIN_ADDRESS_ID` VARCHAR(40) DEFAULT NULL,
  `DATA_ENTER_ID` VARCHAR(40) DEFAULT NULL,
  `WARNING_INFO` VARCHAR(200) DEFAULT NULL,
  `OCCUPATION` VARCHAR(40) DEFAULT NULL,
  `INCOME_LIST` VARCHAR(40) DEFAULT NULL,
  `SKIN_TYPE` VARCHAR(40) DEFAULT NULL,
  `USED_BRAND` VARCHAR(40) DEFAULT NULL,
  `KNOW_PRODUCT_MODE` VARCHAR(40) DEFAULT NULL,
  `MOST_CARE_INFO` VARCHAR(40) DEFAULT NULL,
  `SKIN_CARE_INFO` VARCHAR(40) DEFAULT NULL,
  `ACTIVITY_NOTIFY` VARCHAR(40) DEFAULT NULL,
  `CARE_PRODUCT` VARCHAR(40) DEFAULT NULL,
  `SALE_TYPE` VARCHAR(40) DEFAULT NULL,
  `REMARK` TEXT,
  `Summary` INT(11) DEFAULT NULL,
  `REGION` VARCHAR(64) DEFAULT NULL,
  `PROVINCE` VARCHAR(64) DEFAULT NULL,
  `CITY` VARCHAR(64) DEFAULT NULL,
  `ADDRESS` TEXT,
  `POSTALCODE` VARCHAR(50) DEFAULT NULL,
  `FIRST_PUR_DATE` DATETIME DEFAULT NULL,
  `FIRST_BUY_DATE` DATETIME DEFAULT NULL,
  `LAST_BUY_DATE` DATETIME DEFAULT NULL,
  `LAST_BUY_PRODUCT` VARCHAR(100) DEFAULT NULL,
  `BUY_NUMBER` INT(11) DEFAULT NULL,
  `LAST_ORDER_AMOUNT` DECIMAL(11,2) DEFAULT '0.00',
  `MAX_ORDER_AMOUNT` DECIMAL(11,2) DEFAULT '0.00',
  `AGE` INT(11) DEFAULT NULL,
  `IMP_HISTORY_ID` VARCHAR(36) DEFAULT NULL,
  `LAST_VISIT` DATETIME DEFAULT NULL,
  `BUYER_CREDIT` VARCHAR(64) DEFAULT NULL,
  `NICK` VARCHAR(50) DEFAULT NULL,
  `PROMOTED_TYPE` INT(11) DEFAULT NULL,
  `CONSUMER_PROTECTION` VARCHAR(32) DEFAULT NULL,
  `VIP_INFO` VARCHAR(10) DEFAULT NULL,
  `SOURCEID` VARCHAR(36) DEFAULT NULL,
  `CUS_LEVEL` VARCHAR(40) DEFAULT NULL,
  `PER_CUSTOMER_TRANSACT` DECIMAL(11,2) DEFAULT '0.00',
  `REFUND_TIMES` INT(11) DEFAULT '0',
  `REFUND_AMOUNT` DECIMAL(11,2) DEFAULT '0.00',
  `COMPANY_NAME` VARCHAR(100) DEFAULT NULL,
  `INSERT_TIME` DATETIME DEFAULT NULL,
  `MICROBLOG` VARCHAR(100) DEFAULT NULL,
  `WECHAT` VARCHAR(40) DEFAULT NULL,
  `IS_ATTENTION` INT(11) DEFAULT '0',
  `IS_MOBILE_REGISTER` INT(11) DEFAULT '0',
  `IS_EMPLOYEES` INT(11) DEFAULT '0',
  `HEY_CONPONS` VARCHAR(20) DEFAULT NULL,
  `EMP_RECOMMEND` VARCHAR(40) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
SET autocommit=0;
START TRANSACTION;
SELECT CHINESE_NAME INTO orgName FROM M_ORG WHERE ID = orgId;
SELECT MAX(execute_end) INTO lastProcTmstmp FROM M_PROCEDURE_LOG WHERE procedure_name='SyncCustomer.MD.Batch' AND source=orgName;
IF NOT ISNULL(lastProcTmstmp) THEN
 INSERT INTO tmp_insert_time(dt) SELECT DISTINCT b.INSERT_TIME AS iKey
			        FROM jol_areca_etl.M_CUSTOMER b
			       WHERE b.INSERT_TIME > lastProcTmstmp ORDER BY iKey;
ELSE 
  INSERT INTO tmp_insert_time(dt) SELECT DISTINCT b.INSERT_TIME AS iKey
			        FROM jol_areca_etl.M_CUSTOMER b
			       WHERE b.INSERT_TIME > startTm ORDER BY iKey;
  SET lastProcTmstmp = startTm;
END IF;
IF (SELECT COUNT(*) FROM tmp_insert_time) <> 0 THEN
SELECT MAX(seq) INTO lastSeq FROM tmp_insert_time;
WHILE idx <= lastSeq DO
  SELECT dt INTO procTmStmp FROM tmp_insert_time WHERE seq = idx;									
  
  INSERT INTO tmp_insert_customer SELECT EC.* FROM jol_areca_etl.M_CUSTOMER EC LEFT JOIN M_CUSTOMER C ON C.ID = EC.ID
  WHERE EC.INSERT_TIME = procTmStmp AND C.ID IS NULL;
  
  
  INSERT INTO tmp_update_customer SELECT EC.* FROM jol_areca_etl.M_CUSTOMER EC LEFT JOIN M_CUSTOMER C ON C.ID = EC.ID
  WHERE EC.INSERT_TIME = procTmStmp AND C.ID IS NOT NULL;
  
  -- 添加用户
  INSERT INTO M_CUSTOMER 
	(ID, 
	CUSTOMER_NUM, 
	FIRST_NAME, 
	LAST_NAME, 
	FULL_NAME, 
	PINYIN, 
	GENDER, 
	COUNTRY, 
	BIRTHDAY, 
	ID_TYPE, 
	ID_CARD, 
	REGISTER_COUNTER, 
	ADMIN_COUNTER, 
	REGISTER_TIME, 
	SALESMAN_ID, 
	MODE, 
	IF_MEMBER, 
	INDUSTRY, 
	DUTY, 
	HOPPY, 
	EDUCATION, 
	INCOME, 
	SOURCE, 
	MOBILE_TEL, 
	MOBILETEL_STATUS, 
	IF_MOBILETEL, 
	HOME_TEL_REGION, 
	HOME_TEL, 
	HOME_TEL_EXT, 
	HOMETEL_STATUS, 
	IF_HOMETEL, 
	COMPANY_TEL_REGION, 
	COMPANY_TEL, 
	COMPANY_TEL_EXT, 
	COMPANYTEL_STATUS, 
	IF_POST, 
	IF_COMPANYTEL, 
	SPARE_TEL, 
	SPARETEL_STATUS, 
	IF_SPARETEL, 
	EMAIL, 
	EMAIL_STATUS, 
	IF_EMAIL, 
	POSTADDR_STATUS, 
	POSTCODE_STATUS, 
	CREATE_BY, 
	CREATE_DATE, 
	MODIFY_BY, 
	MODIFY_DATE, 
	BELONG_ORG, 
	SOURCE_OTHER, 
	MAIN_ADDRESS_ID, 
	DATA_ENTER_ID, 
	WARNING_INFO, 
	OCCUPATION, 
	INCOME_LIST, 
	SKIN_TYPE, 
	USED_BRAND, 
	KNOW_PRODUCT_MODE, 
	MOST_CARE_INFO, 
	SKIN_CARE_INFO, 
	ACTIVITY_NOTIFY, 
	CARE_PRODUCT, 
	SALE_TYPE, 
	REMARK, 
	Summary, 
	REGION, 
	PROVINCE, 
	CITY, 
	ADDRESS, 
	POSTALCODE, 
	FIRST_PUR_DATE, 
	FIRST_BUY_DATE, 
	LAST_BUY_DATE, 
	LAST_BUY_PRODUCT, 
	BUY_NUMBER, 
	LAST_ORDER_AMOUNT, 
	MAX_ORDER_AMOUNT, 
	AGE, 
	IMP_HISTORY_ID, 
	LAST_VISIT, 
	BUYER_CREDIT, 
	NICK, 
	PROMOTED_TYPE, 
	CONSUMER_PROTECTION, 
	VIP_INFO, 
	SOURCEID, 
	CUS_LEVEL, 
	PER_CUSTOMER_TRANSACT, 
	REFUND_TIMES, 
	REFUND_AMOUNT, 
	COMPANY_NAME, 
	MICROBLOG,
	WECHAT,
	IS_ATTENTION,
	IS_MOBILE_REGISTER,
	IS_EMPLOYEES,
	EMP_RECOMMEND,
	HEY_CONPONS)
  SELECT b.ID, 
	b.CUSTOMER_NUM, 
	b.FIRST_NAME, 
	b.LAST_NAME, 
	b.FULL_NAME, 
	b.PINYIN, 
	b.GENDER, 
	b.COUNTRY, 
	b.BIRTHDAY, 
	b.ID_TYPE, 
	b.ID_CARD, 
	b.REGISTER_COUNTER, 
	b.ADMIN_COUNTER, 
	b.REGISTER_TIME, 
	b.SALESMAN_ID, 
	b.MODE, 
	b.IF_MEMBER, 
	b.INDUSTRY, 
	b.DUTY, 
	b.HOPPY, 
	b.EDUCATION, 
	b.INCOME, 
	b.SOURCE, 
	b.MOBILE_TEL, 
	b.MOBILETEL_STATUS, 
	b.IF_MOBILETEL, 
	b.HOME_TEL_REGION, 
	b.HOME_TEL, 
	b.HOME_TEL_EXT, 
	b.HOMETEL_STATUS, 
	b.IF_HOMETEL, 
	b.COMPANY_TEL_REGION, 
	b.COMPANY_TEL, 
	b.COMPANY_TEL_EXT, 
	b.COMPANYTEL_STATUS, 
	b.IF_POST, 
	b.IF_COMPANYTEL, 
	b.SPARE_TEL, 
	b.SPARETEL_STATUS, 
	b.IF_SPARETEL, 
	b.EMAIL, 
	b.EMAIL_STATUS, 
	b.IF_EMAIL, 
	b.POSTADDR_STATUS, 
	b.POSTCODE_STATUS, 
	b.CREATE_BY, 
	b.CREATE_DATE, 
	b.MODIFY_BY, 
	b.MODIFY_DATE, 
	orgId, 
	b.SOURCE_OTHER, 
	b.MAIN_ADDRESS_ID, 
	b.DATA_ENTER_ID, 
	b.WARNING_INFO, 
	b.OCCUPATION, 
	b.INCOME_LIST, 
	b.SKIN_TYPE, 
	b.USED_BRAND, 
	b.KNOW_PRODUCT_MODE, 
	b.MOST_CARE_INFO, 
	b.SKIN_CARE_INFO, 
	b.ACTIVITY_NOTIFY, 
	b.CARE_PRODUCT, 
	b.SALE_TYPE, 
	b.REMARK, 
	b.Summary, 
	b.REGION, 
	b.PROVINCE, 
	b.CITY, 
	b.ADDRESS, 
	b.POSTALCODE, 
	b.FIRST_PUR_DATE, 
	b.FIRST_BUY_DATE, 
	b.LAST_BUY_DATE, 
	b.LAST_BUY_PRODUCT, 
	b.BUY_NUMBER, 
	b.LAST_ORDER_AMOUNT, 
	b.MAX_ORDER_AMOUNT, 
	b.AGE, 
	b.IMP_HISTORY_ID, 
	b.LAST_VISIT, 
	b.BUYER_CREDIT, 
	b.NICK, 
	b.PROMOTED_TYPE, 
	b.CONSUMER_PROTECTION, 
	b.VIP_INFO, 
	b.SOURCEID, 
	b.CUS_LEVEL, 
	b.PER_CUSTOMER_TRANSACT, 
	b.REFUND_TIMES, 
	b.REFUND_AMOUNT, 
	b.COMPANY_NAME, 
	b.MICROBLOG, 
	b.WECHAT,
	b.IS_ATTENTION,
	b.IS_MOBILE_REGISTER,
	b.IS_EMPLOYEES,
	b.EMP_RECOMMEND,
	b.HEY_CONPONS
   FROM tmp_insert_customer b;
  
  INSERT INTO M_RELA_CUSTOMER (ID, 
	M_CUSTOMER_ID, 
	S_CUSTOMER_ID, 
	S_CUSTOMER_O_ID, 
	BELONG_ORG, 
	SOURCE)
  SELECT UUID(),
	b.ID,
	UUID(),
	UUID(),
	orgId,
	orgName
   FROM tmp_insert_customer b;
	
  INSERT INTO M_SUB_CUSTOMER (ID, 
	O_ID, 
	CUSTOMER_NUM, 
	FIRST_NAME, 
	LAST_NAME, 
	FULL_NAME, 
	PINYIN, 
	GENDER, 
	COUNTRY, 
	BIRTHDAY, 
	ID_TYPE, 
	ID_CARD, 
	REGISTER_COUNTER, 
	ADMIN_COUNTER, 
	REGISTER_TIME, 
	SALESMAN_ID, 
	MODE, 
	IF_MEMBER, 
	INDUSTRY, 
	DUTY, 
	HOPPY, 
	EDUCATION, 
	INCOME, 
	SOURCE, 
	MOBILE_TEL, 
	MOBILETEL_STATUS, 
	IF_MOBILETEL, 
	HOME_TEL_REGION, 
	HOME_TEL, 
	HOME_TEL_EXT, 
	HOMETEL_STATUS, 
	IF_HOMETEL, 
	COMPANY_TEL_REGION, 
	COMPANY_TEL, 
	COMPANY_TEL_EXT, 
	COMPANYTEL_STATUS, 
	IF_POST, 
	IF_COMPANYTEL, 
	SPARE_TEL, 
	SPARETEL_STATUS, 
	IF_SPARETEL, 
	EMAIL, 
	EMAIL_STATUS, 
	IF_EMAIL, 
	POSTADDR_STATUS, 
	POSTCODE_STATUS, 
	CREATE_BY, 
	CREATE_DATE, 
	MODIFY_BY, 
	MODIFY_DATE, 
	BELONG_ORG, 
	SOURCE_OTHER, 
	MAIN_ADDRESS_ID, 
	DATA_ENTER_ID, 
	WARNING_INFO, 
	OCCUPATION, 
	INCOME_LIST, 
	SKIN_TYPE, 
	USED_BRAND, 
	KNOW_PRODUCT_MODE, 
	MOST_CARE_INFO, 
	SKIN_CARE_INFO, 
	ACTIVITY_NOTIFY, 
	CARE_PRODUCT, 
	SALE_TYPE, 
	REMARK, 
	Summary, 
	REGION, 
	PROVINCE, 
	CITY, 
	ADDRESS, 
	POSTALCODE, 
	FIRST_PUR_DATE, 
	FIRST_BUY_DATE, 
	LAST_BUY_DATE, 
	LAST_BUY_PRODUCT, 
	LAST_ORDER_AMOUNT, 
	MAX_ORDER_AMOUNT, 
	BUY_NUMBER, 
	LAST_VISIT, 
	BUYER_CREDIT, 
	NICK, 
	PROMOTED_TYPE, 
	CONSUMER_PROTECTION, 
	VIP_INFO, 
	SOURCEID, 
	IMP_HISTORY_ID, 
	CUS_LEVEL, 
	PER_CUSTOMER_TRANSACT, 
	REFUND_TIMES, 
	REFUND_AMOUNT, 
	AGE, 
	COMPANY_NAME)
  SELECT c.S_CUSTOMER_ID, 
	c.S_CUSTOMER_O_ID, 
	b.CUSTOMER_NUM, 
	b.FIRST_NAME, 
	b.LAST_NAME, 
	b.FULL_NAME, 
	b.PINYIN, 
	b.GENDER, 
	b.COUNTRY, 
	b.BIRTHDAY, 
	b.ID_TYPE, 
	b.ID_CARD, 
	b.REGISTER_COUNTER, 
	b.ADMIN_COUNTER, 
	b.REGISTER_TIME, 
	b.SALESMAN_ID, 
	b.MODE, 
	b.IF_MEMBER, 
	b.INDUSTRY, 
	b.DUTY, 
	b.HOPPY, 
	b.EDUCATION, 
	b.INCOME, 
	b.SOURCE, 
	b.MOBILE_TEL, 
	b.MOBILETEL_STATUS, 
	b.IF_MOBILETEL, 
	b.HOME_TEL_REGION, 
	b.HOME_TEL, 
	b.HOME_TEL_EXT, 
	b.HOMETEL_STATUS, 
	b.IF_HOMETEL, 
	b.COMPANY_TEL_REGION, 
	b.COMPANY_TEL, 
	b.COMPANY_TEL_EXT, 
	b.COMPANYTEL_STATUS, 
	b.IF_POST, 
	b.IF_COMPANYTEL, 
	b.SPARE_TEL, 
	b.SPARETEL_STATUS, 
	b.IF_SPARETEL, 
	b.EMAIL, 
	b.EMAIL_STATUS, 
	b.IF_EMAIL, 
	b.POSTADDR_STATUS, 
	b.POSTCODE_STATUS, 
	b.CREATE_BY, 
	b.CREATE_DATE, 
	b.MODIFY_BY, 
	b.MODIFY_DATE, 
	orgId, 
	b.SOURCE_OTHER, 
	b.MAIN_ADDRESS_ID, 
	b.DATA_ENTER_ID, 
	b.WARNING_INFO, 
	b.OCCUPATION, 
	b.INCOME_LIST, 
	b.SKIN_TYPE, 
	b.USED_BRAND, 
	b.KNOW_PRODUCT_MODE, 
	b.MOST_CARE_INFO, 
	b.SKIN_CARE_INFO, 
	b.ACTIVITY_NOTIFY, 
	b.CARE_PRODUCT, 
	b.SALE_TYPE, 
	b.REMARK, 
	b.Summary, 
	b.REGION, 
	b.PROVINCE, 
	b.CITY, 
	b.ADDRESS, 
	b.POSTALCODE, 
	b.FIRST_PUR_DATE, 
	b.FIRST_BUY_DATE, 
	b.LAST_BUY_DATE, 
	b.LAST_BUY_PRODUCT, 
	b.LAST_ORDER_AMOUNT, 
	b.MAX_ORDER_AMOUNT, 
	b.BUY_NUMBER, 
	b.LAST_VISIT, 
	b.BUYER_CREDIT, 
	b.NICK, 
	b.PROMOTED_TYPE, 
	b.CONSUMER_PROTECTION, 
	b.VIP_INFO, 
	b.SOURCEID, 
	b.IMP_HISTORY_ID, 
	b.CUS_LEVEL, 
	b.PER_CUSTOMER_TRANSACT, 
	b.REFUND_TIMES, 
	b.REFUND_AMOUNT, 
	b.AGE, 
	b.COMPANY_NAME
   FROM tmp_insert_customer b, M_RELA_CUSTOMER c
  WHERE c.M_CUSTOMER_ID = b.ID; 
  
  INSERT INTO M_ORG_CUSTOMER(ID, ORG_ID, CUSTOMER_ID)
  SELECT UUID(), orgId, b.id
    FROM tmp_insert_customer b; 
    
 -- 新建会员   
  INSERT INTO M_MEMBER 
	(ID, 
	MEMBER_NUM, 
	NAME, 
	CUSTOMER_ID, 
	MEMBER_TYPE, 
	JOIN_DATE, 
	PROGRAM_ID, 
	IS_EMPLOYEE, 
	CREATE_BY, 
	CREATE_DATE, 
	UPDATE_BY, 
	UPDATE_DATE, 
	ACTIVE_FLAG, 
	ORG_ID, 
	START_DATE, 
	END_DATE,
	IS_ATTENTION,
	IS_MOBILE_REGISTER,
	EMP_RECOMMEND,
	HEY_CONPONS
	)
  SELECT UUID(),
	c.CUSTOMER_NUM,
	c.FULL_NAME,
	c.ID,
	'M_INDIVIDUAL',
	NOW(),
	 programId,
	c.IS_EMPLOYEES,
	'ladmin',
	NOW(),
	'ladmin',
	NOW(),
	1,
	orgId,
	NOW(),
	INTERVAL 12 MONTH + NOW(),
	c.IS_ATTENTION,
	c.IS_MOBILE_REGISTER,
	c.EMP_RECOMMEND,
	c.HEY_CONPONS
	FROM M_CUSTOMER c LEFT OUTER JOIN M_MEMBER m ON c.id = m.customer_id
	WHERE m.id IS NULL
	;
 -- 会员与组织中间表	
	INSERT INTO M_MEMBER_ORG 
		(ID, 
		MEMBER_ID,
		ORG_ID)
	SELECT UUID(),
	p1.ID,
	orgId
	 FROM M_MEMBER p1
	 LEFT OUTER JOIN  M_MEMBER_ORG p2 ON p2.MEMBER_ID = p1.ID 
	 WHERE p2.ID IS null;
-- 设置会员默认等级
       
       INSERT INTO M_MEMBER_TIER
	(ID, 
	MEMBER_ID,
	TIER,
	TIER_CLASS,
	START_DATE,
	END_DATE,
	ACTIVE_FLAG)
SELECT UUID(),
	p1.ID,
	p3.ID,
	p3.TIER_CLASS_ID,
	NOW(),
	INTERVAL 12 MONTH + NOW(),
	1
 FROM M_MEMBER p1
 LEFT OUTER JOIN  M_MEMBER_TIER p2 ON p2.MEMBER_ID = p1.ID 
 LEFT OUTER JOIN  M_TIER p3 ON p3.TIER_NAME = member_tier 
 WHERE p2.ID IS NULL;
 	    
  UPDATE M_CUSTOMER a, tmp_update_customer b
	SET
	a.ID = b.ID , 
	a.CUSTOMER_NUM = b.CUSTOMER_NUM , 
	a.FIRST_NAME = b.FIRST_NAME , 
	a.LAST_NAME = b.LAST_NAME , 
	a.FULL_NAME = b.FULL_NAME , 
	a.PINYIN = b.PINYIN , 
	a.GENDER = b.GENDER , 
	a.COUNTRY = b.COUNTRY , 
	a.BIRTHDAY = b.BIRTHDAY , 
	a.ID_TYPE = b.ID_TYPE , 
	a.ID_CARD = b.ID_CARD , 
	a.REGISTER_COUNTER = b.REGISTER_COUNTER , 
	a.ADMIN_COUNTER = b.ADMIN_COUNTER , 
	a.REGISTER_TIME = b.REGISTER_TIME , 
	a.SALESMAN_ID = b.SALESMAN_ID , 
	a.MODE = b.MODE , 
	a.IF_MEMBER = b.IF_MEMBER , 
	a.INDUSTRY = b.INDUSTRY , 
	a.DUTY = b.DUTY , 
	a.HOPPY = b.HOPPY , 
	a.EDUCATION = b.EDUCATION , 
	a.INCOME = b.INCOME , 
	a.SOURCE = b.SOURCE , 
	a.MOBILE_TEL = b.MOBILE_TEL , 
	a.MOBILETEL_STATUS = b.MOBILETEL_STATUS , 
	a.IF_MOBILETEL = b.IF_MOBILETEL , 
	a.HOME_TEL_REGION = b.HOME_TEL_REGION , 
	a.HOME_TEL = b.HOME_TEL , 
	a.HOME_TEL_EXT = b.HOME_TEL_EXT , 
	a.HOMETEL_STATUS = b.HOMETEL_STATUS , 
	a.IF_HOMETEL = b.IF_HOMETEL , 
	a.COMPANY_TEL_REGION = b.COMPANY_TEL_REGION , 
	a.COMPANY_TEL = b.COMPANY_TEL , 
	a.COMPANY_TEL_EXT = b.COMPANY_TEL_EXT , 
	a.COMPANYTEL_STATUS = b.COMPANYTEL_STATUS , 
	a.IF_POST = b.IF_POST , 
	a.IF_COMPANYTEL = b.IF_COMPANYTEL , 
	a.SPARE_TEL = b.SPARE_TEL , 
	a.SPARETEL_STATUS = b.SPARETEL_STATUS , 
	a.IF_SPARETEL = b.IF_SPARETEL , 
	a.EMAIL = b.EMAIL , 
	a.EMAIL_STATUS = b.EMAIL_STATUS , 
	a.IF_EMAIL = b.IF_EMAIL , 
	a.POSTADDR_STATUS = b.POSTADDR_STATUS , 
	a.POSTCODE_STATUS = b.POSTCODE_STATUS , 
	a.CREATE_BY = b.CREATE_BY , 
	a.CREATE_DATE = b.CREATE_DATE , 
	a.MODIFY_BY = b.MODIFY_BY , 
	a.MODIFY_DATE = b.MODIFY_DATE , 
	a.BELONG_ORG = b.BELONG_ORG , 
	a.SOURCE_OTHER = b.SOURCE_OTHER , 
	a.MAIN_ADDRESS_ID = b.MAIN_ADDRESS_ID , 
	a.DATA_ENTER_ID = b.DATA_ENTER_ID , 
	a.WARNING_INFO = b.WARNING_INFO , 
	a.OCCUPATION = b.OCCUPATION , 
	a.INCOME_LIST = b.INCOME_LIST , 
	a.SKIN_TYPE = b.SKIN_TYPE , 
	a.USED_BRAND = b.USED_BRAND , 
	a.KNOW_PRODUCT_MODE = b.KNOW_PRODUCT_MODE , 
	a.MOST_CARE_INFO = b.MOST_CARE_INFO , 
	a.SKIN_CARE_INFO = b.SKIN_CARE_INFO , 
	a.ACTIVITY_NOTIFY = b.ACTIVITY_NOTIFY , 
	a.CARE_PRODUCT = b.CARE_PRODUCT , 
	a.SALE_TYPE = b.SALE_TYPE , 
	a.REMARK = b.REMARK , 
	a.Summary = b.Summary , 
	a.REGION = b.REGION , 
	a.PROVINCE = b.PROVINCE , 
	a.CITY = b.CITY , 
	a.ADDRESS = b.ADDRESS , 
	a.POSTALCODE = b.POSTALCODE , 
	a.FIRST_PUR_DATE = b.FIRST_PUR_DATE , 
	a.FIRST_BUY_DATE = b.FIRST_BUY_DATE , 
	a.LAST_BUY_DATE = b.LAST_BUY_DATE , 
	a.LAST_BUY_PRODUCT = b.LAST_BUY_PRODUCT , 
	a.BUY_NUMBER = b.BUY_NUMBER , 
	a.LAST_ORDER_AMOUNT = b.LAST_ORDER_AMOUNT , 
	a.MAX_ORDER_AMOUNT = b.MAX_ORDER_AMOUNT , 
	a.AGE = b.AGE , 
	a.IMP_HISTORY_ID = b.IMP_HISTORY_ID , 
	a.LAST_VISIT = b.LAST_VISIT , 
	a.BUYER_CREDIT = b.BUYER_CREDIT , 
	a.NICK = b.NICK , 
	a.PROMOTED_TYPE = b.PROMOTED_TYPE , 
	a.CONSUMER_PROTECTION = b.CONSUMER_PROTECTION , 
	a.VIP_INFO = b.VIP_INFO , 
	a.SOURCEID = b.SOURCEID , 
	a.CUS_LEVEL = b.CUS_LEVEL , 
	a.PER_CUSTOMER_TRANSACT = b.PER_CUSTOMER_TRANSACT , 
	a.REFUND_TIMES = b.REFUND_TIMES , 
	a.REFUND_AMOUNT = b.REFUND_AMOUNT , 
	a.COMPANY_NAME = b.COMPANY_NAME,
	a.MICROBLOG = b.MICROBLOG,
	a.WECHAT = b.WECHAT,
	a.IS_ATTENTION = b.IS_ATTENTION,
	a.IS_MOBILE_REGISTER = b.IS_MOBILE_REGISTER,
	a.IS_EMPLOYEES = b.IS_EMPLOYEES,
	a.EMP_RECOMMEND = b.EMP_RECOMMEND,
	a.HEY_CONPONS = b.HEY_CONPONS
	
	WHERE a.ID = b.ID;
											
  UPDATE M_SUB_CUSTOMER a, tmp_update_customer b, M_RELA_CUSTOMER c
	SET
	a.CUSTOMER_NUM = b.CUSTOMER_NUM , 
	a.FIRST_NAME = b.FIRST_NAME , 
	a.LAST_NAME = b.LAST_NAME , 
	a.FULL_NAME = b.FULL_NAME , 
	a.PINYIN = b.PINYIN , 
	a.GENDER = b.GENDER , 
	a.COUNTRY = b.COUNTRY , 
	a.BIRTHDAY = b.BIRTHDAY , 
	a.ID_TYPE = b.ID_TYPE , 
	a.ID_CARD = b.ID_CARD , 
	a.REGISTER_COUNTER = b.REGISTER_COUNTER , 
	a.ADMIN_COUNTER = b.ADMIN_COUNTER , 
	a.REGISTER_TIME = b.REGISTER_TIME , 
	a.SALESMAN_ID = b.SALESMAN_ID , 
	a.MODE = b.MODE , 
	a.IF_MEMBER = b.IF_MEMBER , 
	a.INDUSTRY = b.INDUSTRY , 
	a.DUTY = b.DUTY , 
	a.HOPPY = b.HOPPY , 
	a.EDUCATION = b.EDUCATION , 
	a.INCOME = b.INCOME , 
	a.SOURCE = b.SOURCE , 
	a.MOBILE_TEL = b.MOBILE_TEL , 
	a.MOBILETEL_STATUS = b.MOBILETEL_STATUS , 
	a.IF_MOBILETEL = b.IF_MOBILETEL , 
	a.HOME_TEL_REGION = b.HOME_TEL_REGION , 
	a.HOME_TEL = b.HOME_TEL , 
	a.HOME_TEL_EXT = b.HOME_TEL_EXT , 
	a.HOMETEL_STATUS = b.HOMETEL_STATUS , 
	a.IF_HOMETEL = b.IF_HOMETEL , 
	a.COMPANY_TEL_REGION = b.COMPANY_TEL_REGION , 
	a.COMPANY_TEL = b.COMPANY_TEL , 
	a.COMPANY_TEL_EXT = b.COMPANY_TEL_EXT , 
	a.COMPANYTEL_STATUS = b.COMPANYTEL_STATUS , 
	a.IF_POST = b.IF_POST , 
	a.IF_COMPANYTEL = b.IF_COMPANYTEL , 
	a.SPARE_TEL = b.SPARE_TEL , 
	a.SPARETEL_STATUS = b.SPARETEL_STATUS , 
	a.IF_SPARETEL = b.IF_SPARETEL , 
	a.EMAIL = b.EMAIL , 
	a.EMAIL_STATUS = b.EMAIL_STATUS , 
	a.IF_EMAIL = b.IF_EMAIL , 
	a.POSTADDR_STATUS = b.POSTADDR_STATUS , 
	a.POSTCODE_STATUS = b.POSTCODE_STATUS , 
	a.CREATE_BY = b.CREATE_BY , 
	a.CREATE_DATE = b.CREATE_DATE , 
	a.MODIFY_BY = b.MODIFY_BY , 
	a.MODIFY_DATE = b.MODIFY_DATE , 
	a.BELONG_ORG = b.BELONG_ORG , 
	a.SOURCE_OTHER = b.SOURCE_OTHER , 
	a.MAIN_ADDRESS_ID = b.MAIN_ADDRESS_ID , 
	a.DATA_ENTER_ID = b.DATA_ENTER_ID , 
	a.WARNING_INFO = b.WARNING_INFO , 
	a.OCCUPATION = b.OCCUPATION , 
	a.INCOME_LIST = b.INCOME_LIST , 
	a.SKIN_TYPE = b.SKIN_TYPE , 
	a.USED_BRAND = b.USED_BRAND , 
	a.KNOW_PRODUCT_MODE = b.KNOW_PRODUCT_MODE , 
	a.MOST_CARE_INFO = b.MOST_CARE_INFO , 
	a.SKIN_CARE_INFO = b.SKIN_CARE_INFO , 
	a.ACTIVITY_NOTIFY = b.ACTIVITY_NOTIFY , 
	a.CARE_PRODUCT = b.CARE_PRODUCT , 
	a.SALE_TYPE = b.SALE_TYPE , 
	a.REMARK = b.REMARK , 
	a.Summary = b.Summary , 
	a.REGION = b.REGION , 
	a.PROVINCE = b.PROVINCE , 
	a.CITY = b.CITY , 
	a.ADDRESS = b.ADDRESS , 
	a.POSTALCODE = b.POSTALCODE , 
	a.FIRST_PUR_DATE = b.FIRST_PUR_DATE , 
	a.FIRST_BUY_DATE = b.FIRST_BUY_DATE , 
	a.LAST_BUY_DATE = b.LAST_BUY_DATE , 
	a.LAST_BUY_PRODUCT = b.LAST_BUY_PRODUCT , 
	a.LAST_ORDER_AMOUNT = b.LAST_ORDER_AMOUNT , 
	a.MAX_ORDER_AMOUNT = b.MAX_ORDER_AMOUNT , 
	a.BUY_NUMBER = b.BUY_NUMBER , 
	a.LAST_VISIT = b.LAST_VISIT , 
	a.BUYER_CREDIT = b.BUYER_CREDIT , 
	a.NICK = b.NICK , 
	a.PROMOTED_TYPE = b.PROMOTED_TYPE , 
	a.CONSUMER_PROTECTION = b.CONSUMER_PROTECTION , 
	a.VIP_INFO = b.VIP_INFO , 
	a.SOURCEID = b.SOURCEID , 
	a.IMP_HISTORY_ID = b.IMP_HISTORY_ID , 
	a.CUS_LEVEL = b.CUS_LEVEL , 
	a.PER_CUSTOMER_TRANSACT = b.PER_CUSTOMER_TRANSACT , 
	a.REFUND_TIMES = b.REFUND_TIMES , 
	a.REFUND_AMOUNT = b.REFUND_AMOUNT , 
	a.AGE = b.AGE , 
	a.COMPANY_NAME = b.COMPANY_NAME
  WHERE c.M_CUSTOMER_ID = b.ID AND c.BELONG_ORG = orgId AND a.id = c.S_CUSTOMER_ID;
  
 UPDATE M_MEMBER a, M_CUSTOMER b,tmp_update_customer c
	SET
	a.MEMBER_NUM = b.CUSTOMER_NUM, 
	a.NAME = b.FULL_NAME, 
	
	a.IS_EMPLOYEE = b.IS_EMPLOYEES, 
	a.IS_ATTENTION = b.IS_ATTENTION,
	a.IS_MOBILE_REGISTER = b.IS_MOBILE_REGISTER,
	a.EMP_RECOMMEND = b.EMP_RECOMMEND,
	a.HEY_CONPONS = b.HEY_CONPONS
 WHERE a.CUSTOMER_ID = b.ID and b.ID = c.ID;
	
  SELECT COUNT(*) + insCnt INTO insCnt FROM tmp_insert_customer;
  SELECT COUNT(*) + updCnt INTO updCnt FROM tmp_update_customer;
  
  TRUNCATE tmp_insert_customer;
  TRUNCATE tmp_update_customer;
  SET idx = idx + 1;
END WHILE;
-- 将本次调用存储过程的日志信息存入到日志表中
INSERT INTO M_PROCEDURE_LOG(procedure_name, insert_amount, update_amount, error_amount, total_amount, execute_start, execute_end, source)
VALUES('SyncCustomer.MD.Batch', insCnt, updCnt, errCnt, insCnt + updCnt + errCnt, lastProcTmstmp, procTmStmp, orgName);
SELECT MAX(log_id) INTO @logid FROM M_PROCEDURE_LOG WHERE procedure_name = 'SyncCustomer.MD.Batch';
INSERT INTO M_PROCEDURE_LOG_DETAIL(log_id, error_number, error_state) SELECT @logid, DATE_FORMAT(`dt`, '%Y-%m-%d %H:%i:%S'),`error` FROM tmp_err_time;
END IF;
COMMIT;
DROP TABLE IF EXISTS tmp_insert_customer;
DROP TABLE IF EXISTS tmp_update_customer;
DROP TABLE IF EXISTS tmp_insert_time;
SELECT * FROM tmp_err_time;
DROP TABLE IF EXISTS tmp_err_time;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SyncOrder.MD.Batch` */

/*!50003 DROP PROCEDURE IF EXISTS  `SyncOrder.MD.Batch` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `SyncOrder.MD.Batch`(
  programId VARCHAR(40),
  startTm DATETIME
)
BEGIN
DECLARE idx INT DEFAULT 1;
DECLARE lastSeq INT DEFAULT 0;
DECLARE procTmstmp DATETIME;
DECLARE lastProcTmstmp DATETIME;
DECLARE orgId VARCHAR(40);
DECLARE orgName VARCHAR(40);
DECLARE insCnt INT(10) DEFAULT 0;
DECLARE updCnt INT(10) DEFAULT 0;
DECLARE errCnt INT(10) DEFAULT 0;
DECLARE CONTINUE HANDLER FOR SQLWARNING
BEGIN
  INSERT INTO tmp_err_time(`dt`, `error`) VALUE (procTmStmp, 'WARNING');
END;
DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
BEGIN
  INSERT INTO tmp_err_time(`dt`, `error`) VALUE (procTmStmp, 'EXCEPTION');
  
  SELECT COUNT(*) + errCnt INTO errCnt FROM tmp_insert_order;
  SELECT COUNT(*) + errCnt INTO errCnt FROM tmp_update_order;
END;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_insert_time (seq INT PRIMARY KEY AUTO_INCREMENT, dt DATETIME);
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_err_time (id INT PRIMARY KEY AUTO_INCREMENT, dt DATETIME, error VARCHAR(10));
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_insert_order` (
  `ID` VARCHAR(40) NOT NULL,
  `ORDER_NUM` VARCHAR(40) DEFAULT NULL,
  `PROGRAM_ID` VARCHAR(40) DEFAULT NULL,
  `ORDER_AMOUNT` DECIMAL(20,2) DEFAULT NULL,
  `ORI_ORDER_AMOUNT` DECIMAL(20,2) DEFAULT NULL,
  `MEMBER_ID` VARCHAR(40) DEFAULT NULL,
  `CUSTOMER_ID` VARCHAR(40) DEFAULT NULL,
  `MEMBER_CARD` VARCHAR(40) DEFAULT NULL,
  `TRANS_DATE` DATETIME DEFAULT NULL,
  `TYPE` VARCHAR(64) DEFAULT NULL,
  `STATUS` VARCHAR(64) DEFAULT NULL,
  `COMMENT` TEXT,
  `CURRENCY` VARCHAR(40) DEFAULT NULL,
  `ORG_ID` VARCHAR(40) DEFAULT NULL,
  `STORE_ID` VARCHAR(50) DEFAULT NULL,
  `POSID` VARCHAR(40) DEFAULT NULL,
  `INVOICE` VARCHAR(40) DEFAULT NULL,
  `BA` VARCHAR(40) DEFAULT NULL,
  `UPDATE_BY` VARCHAR(40) DEFAULT NULL,
  `UPDATE_DATE` DATETIME DEFAULT NULL,
  `CREATE_BY` VARCHAR(40) DEFAULT NULL,
  `CREATE_DATE` DATETIME DEFAULT NULL,
  `SOURCE` VARCHAR(40) DEFAULT NULL,
  `QUANTITY_SUM` INT(11) DEFAULT NULL,
  `COD_STATUS` VARCHAR(40) DEFAULT NULL,
  `FULL_NAME` VARCHAR(80) DEFAULT NULL,
  `GENDER` VARCHAR(80) DEFAULT NULL,
  `PROVINCE` VARCHAR(80) DEFAULT NULL,
  `CITY` VARCHAR(80) DEFAULT NULL,
  `IMP_HISTORY_ID` VARCHAR(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` VARCHAR(40) DEFAULT NULL,
  `WEBSITE` VARCHAR(200) DEFAULT NULL,
  `buyer_nick` VARCHAR(50) DEFAULT NULL,
  `receiver_address` TEXT,
  `receiver_mobile` VARCHAR(32) DEFAULT NULL,
  `receiver_phone` VARCHAR(32) DEFAULT NULL,
  `buyer_email` VARCHAR(128) DEFAULT NULL,
  `CUSTOMER_O_ID` VARCHAR(40) DEFAULT NULL,
  `INSERT_TIME` DATETIME DEFAULT NULL,
  `HEY_CONPONS` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
CREATE TEMPORARY TABLE IF NOT EXISTS `tmp_update_order` (
  `ID` VARCHAR(40) NOT NULL,
  `ORDER_NUM` VARCHAR(40) DEFAULT NULL,
  `PROGRAM_ID` VARCHAR(40) DEFAULT NULL,
  `ORDER_AMOUNT` DECIMAL(20,2) DEFAULT NULL,
  `ORI_ORDER_AMOUNT` DECIMAL(20,2) DEFAULT NULL,
  `MEMBER_ID` VARCHAR(40) DEFAULT NULL,
  `CUSTOMER_ID` VARCHAR(40) DEFAULT NULL,
  `MEMBER_CARD` VARCHAR(40) DEFAULT NULL,
  `TRANS_DATE` DATETIME DEFAULT NULL,
  `TYPE` VARCHAR(64) DEFAULT NULL,
  `STATUS` VARCHAR(64) DEFAULT NULL,
  `COMMENT` TEXT,
  `CURRENCY` VARCHAR(40) DEFAULT NULL,
  `ORG_ID` VARCHAR(40) DEFAULT NULL,
  `STORE_ID` VARCHAR(50) DEFAULT NULL,
  `POSID` VARCHAR(40) DEFAULT NULL,
  `INVOICE` VARCHAR(40) DEFAULT NULL,
  `BA` VARCHAR(40) DEFAULT NULL,
  `UPDATE_BY` VARCHAR(40) DEFAULT NULL,
  `UPDATE_DATE` DATETIME DEFAULT NULL,
  `CREATE_BY` VARCHAR(40) DEFAULT NULL,
  `CREATE_DATE` DATETIME DEFAULT NULL,
  `SOURCE` VARCHAR(40) DEFAULT NULL,
  `QUANTITY_SUM` INT(11) DEFAULT NULL,
  `COD_STATUS` VARCHAR(40) DEFAULT NULL,
  `FULL_NAME` VARCHAR(80) DEFAULT NULL,
  `GENDER` VARCHAR(80) DEFAULT NULL,
  `PROVINCE` VARCHAR(80) DEFAULT NULL,
  `CITY` VARCHAR(80) DEFAULT NULL,
  `IMP_HISTORY_ID` VARCHAR(36) DEFAULT NULL,
  `SUB_CUSTOMER_ID` VARCHAR(40) DEFAULT NULL,
  `WEBSITE` VARCHAR(200) DEFAULT NULL,
  `buyer_nick` VARCHAR(50) DEFAULT NULL,
  `receiver_address` TEXT,
  `receiver_mobile` VARCHAR(32) DEFAULT NULL,
  `receiver_phone` VARCHAR(32) DEFAULT NULL,
  `buyer_email` VARCHAR(128) DEFAULT NULL,
  `CUSTOMER_O_ID` VARCHAR(40) DEFAULT NULL,
  `INSERT_TIME` DATETIME DEFAULT NULL,
  `HEY_CONPONS` VARCHAR(32) DEFAULT NULL,
  PRIMARY KEY (`ID`)
);
SET autocommit=0;
START TRANSACTION;
SELECT P.org_id, G.CHINESE_NAME INTO orgId, orgName FROM M_LOY_PROGRAM P, M_ORG G WHERE P.ORG_ID = G.ID AND P.id = programId;
SELECT MAX(execute_end) INTO lastProcTmstmp FROM M_PROCEDURE_LOG WHERE procedure_name='SyncOrder.MD.Batch' AND source=orgName;
IF NOT ISNULL(lastProcTmstmp) THEN
  INSERT INTO tmp_insert_time(dt) SELECT DISTINCT b.INSERT_TIME AS iKey
			        FROM jol_areca_etl.M_ORDER b
			       WHERE b.INSERT_TIME > lastProcTmstmp ORDER BY iKey;
ELSE 
  INSERT INTO tmp_insert_time(dt) SELECT DISTINCT b.INSERT_TIME AS iKey
			        FROM jol_areca_etl.M_ORDER b 
			        WHERE b.INSERT_TIME > startTm ORDER BY iKey;
  SET lastProcTmstmp = startTm;
END IF;
IF (SELECT COUNT(*) FROM tmp_insert_time) <> 0 THEN
SELECT MAX(seq) INTO lastSeq FROM tmp_insert_time;
WHILE idx <= lastSeq DO
  SELECT dt INTO procTmStmp FROM tmp_insert_time WHERE seq = idx;
  
  INSERT INTO tmp_update_order SELECT EO.* FROM jol_areca_etl.M_ORDER EO LEFT JOIN M_ORDER O ON O.ID = EO.ID
  WHERE EO.INSERT_TIME = procTmStmp AND EO.STATUS = 'Z' AND O.ID IS NOT NULL;
  
  INSERT INTO tmp_insert_order SELECT EO.* FROM jol_areca_etl.M_ORDER EO LEFT JOIN M_ORDER O ON O.ID = EO.ID
  WHERE EO.INSERT_TIME = procTmStmp AND EO.STATUS = 'Z' AND O.ID IS NULL;
  
  -- 原存储过程逻辑抄袭
  -- 插入订单表
  INSERT INTO M_ORDER (ID, 
	ORDER_NUM, 
	PROGRAM_ID, 
	ORDER_AMOUNT, 
	ORI_ORDER_AMOUNT, 
	MEMBER_ID, 
	CUSTOMER_ID, 
	MEMBER_CARD, 
	TRANS_DATE, 
	`TYPE`, 
	`STATUS`, 
	`COMMENT`, 
	CURRENCY, 
	ORG_ID, 
	STORE_ID, 
	POSID, 
	INVOICE, 
	BA, 
	UPDATE_BY, 
	UPDATE_DATE, 
	CREATE_BY, 
	CREATE_DATE, 
	SOURCE, 
	QUANTITY_SUM, 
	COD_STATUS, 
	FULL_NAME, 
	GENDER, 
	PROVINCE, 
	CITY, 
	IMP_HISTORY_ID, 
	SUB_CUSTOMER_ID, 
	WEBSITE, 
	buyer_nick, 
	receiver_address, 
	receiver_mobile, 
	receiver_phone, 
	buyer_email, 
	CUSTOMER_O_ID,
	MASTER_IMPORT_TIME,
	HEY_CONPONS)		
  SELECT b.ID, 
	b.ORDER_NUM, 
	b.PROGRAM_ID, 
	b.ORDER_AMOUNT, 
	b.ORI_ORDER_AMOUNT, 
	NULL, 
	b.CUSTOMER_ID, 
	b.MEMBER_CARD, 
	b.TRANS_DATE, 
	b.`TYPE`, 
	b.`STATUS`, 
	b.`COMMENT`, 
	b.CURRENCY, 
	orgId, 
	b.STORE_ID, 
	b.POSID, 
	b.INVOICE, 
	b.BA, 
	b.UPDATE_BY, 
	b.UPDATE_DATE, 
	b.CREATE_BY, 
	b.CREATE_DATE, 
	b.SOURCE, 
	b.QUANTITY_SUM, 
	b.COD_STATUS, 
	b.FULL_NAME, 
	b.GENDER, 
	b.PROVINCE, 
	b.CITY, 
	b.IMP_HISTORY_ID, 
	b.SUB_CUSTOMER_ID, 
	b.WEBSITE, 
	b.buyer_nick, 
	b.receiver_address, 
	b.receiver_mobile, 
	b.receiver_phone, 
	b.buyer_email, 
	b.CUSTOMER_O_ID,
	b.INSERT_TIME,
	b.HEY_CONPONS
  FROM tmp_insert_order b;
 
  -- 插入忠诚度交易表
  INSERT INTO M_LOY_ORDER (ID,
	ORDER_NUM,
	ORDER_AMOUNT,
	VALID_PAYMENT,
	MEMBER_ID,
	CUSTOMER_ID,
	TRANS_DATE,
	-- `TYPE`,
	`STATUS`,
	UPDATE_DATE,
	CURRENCY,
	STORE_ID,
	`TYPE`,
	PROGRAM_ID)
  SELECT UUID(),
	b.ORDER_NUM,
	b.ORI_ORDER_AMOUNT,
	b.ORI_ORDER_AMOUNT,
	m.ID,
	b.CUSTOMER_ID,
	b.TRANS_DATE,
	-- b.`TYPE`,
	'M_PENDING',
	b.CREATE_DATE,
	b.CURRENCY,
	b.STORE_ID,
	'M_ACCRUAL',
	programId
	FROM tmp_insert_order b
	LEFT OUTER JOIN M_MEMBER m ON b.CUSTOMER_ID = m.CUSTOMER_ID;
	
  -- 插入M_ORDER相关数据到M_ORG_ORDER
  INSERT INTO M_ORDER_ORG(ID, ORDER_ID, ORG_ID)						
  SELECT UUID(), b.ID, orgId
    FROM tmp_insert_order b;
   
  -- 插入M_ORDER相关数据到M_LOY_ORDER_ORG
  -- INSERT INTO M_LOY_ORDER_ORG(ID, ORDER_ID, ORG_ID)	
  -- SELECT UUID(), b.ID, orgId
  --  FROM tmp_insert_order b;
 
 -- 插入忠诚度交易表,推荐员工
  INSERT INTO M_LOY_ORDER (ID,
	ORDER_NUM,
	ORDER_AMOUNT,
	VALID_PAYMENT,
	MEMBER_ID,
	CUSTOMER_ID,
	TRANS_DATE,
	-- `TYPE`,
	`STATUS`,
	UPDATE_DATE,
	CURRENCY,
	STORE_ID,
	`TYPE`,
	PROGRAM_ID)
  SELECT UUID(),
	b.ORDER_NUM,
	b.ORI_ORDER_AMOUNT,
	b.ORI_ORDER_AMOUNT,
	m.ID,
	c.EMP_RECOMMEND,
	b.TRANS_DATE,
	-- b.`TYPE`,
	'M_PENDING',
	b.CREATE_DATE,
	b.CURRENCY,
	b.STORE_ID,
	'M_EMPLOYEE',
	programId
	FROM tmp_insert_order b,M_CUSTOMER c , M_CUSTOMER d,M_MEMBER m 
	WHERE b.CUSTOMER_ID = c.ID
	AND  c.EMP_RECOMMEND = d.CUSTOMER_NUM
	AND d.ID = m.CUSTOMER_ID
	AND (b.HEY_CONPONS IS  NULL OR b.HEY_CONPONS = '')
        AND c.IS_EMPLOYEES = 1;
    
-- 插入忠诚度交易表,嘿客店优惠码
  INSERT INTO M_LOY_ORDER (ID,
	ORDER_NUM,
	ORDER_AMOUNT,
	VALID_PAYMENT,
	MEMBER_ID,
	CUSTOMER_ID,
	TRANS_DATE,
	-- `TYPE`,
	`STATUS`,
	UPDATE_DATE,
	CURRENCY,
	STORE_ID,
	`TYPE`,
	PROGRAM_ID)
  SELECT UUID(),
	b.ORDER_NUM,
	b.ORI_ORDER_AMOUNT,
	b.ORI_ORDER_AMOUNT,
	m.ID,
	c.EMP_RECOMMEND,
	b.TRANS_DATE,
	-- b.`TYPE`,
	'M_PENDING',
	b.CREATE_DATE,
	b.CURRENCY,
	b.STORE_ID,
	'M_CONPONS',
	programId
	FROM tmp_insert_order b,M_CUSTOMER c, M_MEMBER m
	WHERE b.HEY_CONPONS = c.HEY_CONPONS
	AND  c.ID = m.CUSTOMER_ID
	AND b.HEY_CONPONS IS NOT NULL
	and b.HEY_CONPONS<> '';
		
-- 插入M_ORDER相关数据到M_LOY_ORDER_ORG
INSERT INTO M_LOY_ORDER_ORG(ID, ORDER_ID, ORG_ID)	
  SELECT UUID(), b.ID, orgId
    FROM M_LOY_ORDER b LEFT OUTER JOIN M_LOY_ORDER_ORG c
    ON b.ID = c.ORDER_ID
    WHERE c.ORDER_ID IS NULL;
    	    
  UPDATE M_ORDER a, tmp_update_order b
	SET 
	a.ORDER_NUM = b.ORDER_NUM , 
	a.PROGRAM_ID = b.PROGRAM_ID , 
	a.ORDER_AMOUNT = b.ORDER_AMOUNT , 
	a.ORI_ORDER_AMOUNT = b.ORI_ORDER_AMOUNT , 
	a.MEMBER_ID = NULL , 
	a.CUSTOMER_ID = b.CUSTOMER_ID , 
	a.MEMBER_CARD = b.MEMBER_CARD , 
	a.TRANS_DATE = b.TRANS_DATE , 
	a.`TYPE` = b.`TYPE` , 
	a.`STATUS` = b.`STATUS` , 
	a.COMMENT = b.COMMENT , 
	a.CURRENCY = b.CURRENCY , 
	a.ORG_ID = orgId , 
	a.STORE_ID = b.STORE_ID , 
	a.POSID = b.POSID , 
	a.INVOICE = b.INVOICE , 
	a.BA = b.BA , 
	a.UPDATE_BY = b.UPDATE_BY , 
	a.UPDATE_DATE = b.UPDATE_DATE , 
	a.CREATE_BY = b.CREATE_BY , 
	a.CREATE_DATE = b.CREATE_DATE , 
	a.SOURCE = b.SOURCE , 
	a.QUANTITY_SUM = b.QUANTITY_SUM , 
	a.COD_STATUS = b.COD_STATUS , 
	a.FULL_NAME = b.FULL_NAME , 
	a.GENDER = b.GENDER , 
	a.PROVINCE = b.PROVINCE , 
	a.CITY = b.CITY , 
	a.IMP_HISTORY_ID = b.IMP_HISTORY_ID , 
	a.SUB_CUSTOMER_ID = b.SUB_CUSTOMER_ID , 
	a.WEBSITE = b.WEBSITE , 
	a.buyer_nick = b.buyer_nick , 
	a.receiver_address = b.receiver_address , 
	a.receiver_mobile = b.receiver_mobile , 
	a.receiver_phone = b.receiver_phone , 
	a.buyer_email = b.buyer_email , 
	a.CUSTOMER_O_ID = b.CUSTOMER_O_ID,
	a.MASTER_IMPORT_TIME = b.INSERT_TIME,
	a.HEY_CONPONS = b.HEY_CONPONS
	WHERE a.ID = b.ID;
	
  SELECT COUNT(*) + insCnt INTO insCnt FROM tmp_insert_order;
  SELECT COUNT(*) + updCnt INTO updCnt FROM tmp_update_order;
	
  TRUNCATE tmp_insert_order;
  TRUNCATE tmp_update_order;
  SET idx = idx + 1;
END WHILE;
-- 订单转积分任务
INSERT INTO `B_TASK_LOG`(`TID`,`NAME`,`TYPE`,`START_TIME`,`END_TIME`,`STATUS`,`HOST`,`PROCESSOR`,`ACTIVITY`,`P1`,`P2`,`P3`,`P4`,`P5`,`P6`)
VALUES ( NULL,'SyncPointsFromOrder','MAIN',NULL,NULL,'DE',NULL,NULL,'1',DATE_FORMAT(lastProcTmstmp, '%Y-%m-%d %H:%i:%S'), DATE_FORMAT(procTmStmp, '%Y-%m-%d %H:%i:%S'), orgId, NULL,NULL,NULL);
-- 将本次调用存储过程的日志信息存入到日志表中
INSERT INTO M_PROCEDURE_LOG(procedure_name, insert_amount, update_amount, error_amount, total_amount, execute_start, execute_end, source)
VALUES('SyncOrder.MD.Batch', insCnt, updCnt, errCnt, insCnt + updCnt + errCnt, lastProcTmstmp, procTmStmp, orgName);
SELECT MAX(log_id) INTO @logid FROM M_PROCEDURE_LOG WHERE procedure_name = 'SyncOrder.MD.Batch';
INSERT INTO M_PROCEDURE_LOG_DETAIL(log_id, error_number, error_state) SELECT @logid, DATE_FORMAT(`dt`, '%Y-%m-%d %H:%i:%S'),`error` FROM tmp_err_time;
END IF;
COMMIT;
DROP TABLE IF EXISTS tmp_insert_time;
SELECT * FROM tmp_err_time;
DROP TABLE IF EXISTS tmp_err_time;
DROP TABLE IF EXISTS tmp_insert_order;
DROP TABLE IF EXISTS tmp_update_order;
END */$$
DELIMITER ;

/*Table structure for table `giftview` */

DROP TABLE IF EXISTS `giftview`;

/*!50001 DROP VIEW IF EXISTS `giftview` */;
/*!50001 DROP TABLE IF EXISTS `giftview` */;

/*!50001 CREATE TABLE  `giftview`(
 `id` varchar(40) NOT NULL ,
 `num` varchar(40) NULL ,
 `giftName` varchar(40) NULL ,
 `giftPoint` int(11) NULL ,
 `storedNum` int(11) NULL ,
 `quantityLeft` int(11) NULL ,
 `validStartTime` varchar(19) NULL ,
 `validEndTime` varchar(19) NULL ,
 `safeStoredNum` int(11) NULL ,
 `price` double NULL ,
 `marketTime` varchar(19) NULL ,
 `programId` varchar(40) NULL ,
 `programName` varchar(100) NULL 
)*/;

/*Table structure for table `giftviewzh` */

DROP TABLE IF EXISTS `giftviewzh`;

/*!50001 DROP VIEW IF EXISTS `giftviewzh` */;
/*!50001 DROP TABLE IF EXISTS `giftviewzh` */;

/*!50001 CREATE TABLE  `giftviewzh`(
 `id` varchar(40) NOT NULL ,
 `编号` varchar(40) NULL ,
 `礼品名称` varchar(40) NULL ,
 `积分兑礼` int(11) NULL ,
 `库存数量` int(11) NULL ,
 `当前剩余数量` int(11) NULL ,
 `有效开始时间` varchar(19) NULL ,
 `有效结束时间` varchar(19) NULL ,
 `安全库存` int(11) NULL ,
 `售价` double NULL ,
 `上市时间` varchar(19) NULL 
)*/;

/*Table structure for table `memberview` */

DROP TABLE IF EXISTS `memberview`;

/*!50001 DROP VIEW IF EXISTS `memberview` */;
/*!50001 DROP TABLE IF EXISTS `memberview` */;

/*!50001 CREATE TABLE  `memberview`(
 `id` varchar(40) NOT NULL ,
 `memberId` varchar(40) NULL ,
 `memberName` varchar(40) NULL ,
 `memberNum` varchar(40) NULL ,
 `programId` varchar(40) NULL ,
 `programName` varchar(100) NULL ,
 `tierClass` varchar(40) NULL ,
 `tierClassName` varchar(40) NULL ,
 `tier` varchar(40) NULL ,
 `tireName` varchar(40) NULL ,
 `activeFlag` int(11) NULL ,
 `startDate` varchar(19) NULL ,
 `endDate` varchar(19) NULL 
)*/;

/*Table structure for table `pointlistview` */

DROP TABLE IF EXISTS `pointlistview`;

/*!50001 DROP VIEW IF EXISTS `pointlistview` */;
/*!50001 DROP TABLE IF EXISTS `pointlistview` */;

/*!50001 CREATE TABLE  `pointlistview`(
 `id` varchar(40) NOT NULL ,
 `customerId` varchar(40) NULL ,
 `memberId` varchar(40) NULL ,
 `orderId` varchar(40) NULL ,
 `points` double NULL ,
 `type` varchar(8) NULL ,
 `memberCard` varchar(40) NULL ,
 `promotionId` varchar(40) NULL ,
 `pointTypeId` varchar(40) NULL ,
 `promotionName` varchar(40) NULL ,
 `promotionType` varchar(40) NULL ,
 `reason` longtext NULL ,
 `memberPeriod` varchar(10) NULL ,
 `bornDate` datetime NULL ,
 `validFlag` int(11) NULL ,
 `fatherGuid` varchar(40) NULL ,
 `combStatus` char(1) NULL  default '0' ,
 `actType` varchar(40) NULL ,
 `actSubType` varchar(40) NULL 
)*/;

/*Table structure for table `v_point_detail` */

DROP TABLE IF EXISTS `v_point_detail`;

/*!50001 DROP VIEW IF EXISTS `v_point_detail` */;
/*!50001 DROP TABLE IF EXISTS `v_point_detail` */;

/*!50001 CREATE TABLE  `v_point_detail`(
 `customerId` varchar(40) NOT NULL  default '' ,
 `type` varchar(8) NULL ,
 `id` varchar(40) NOT NULL ,
 `point` double NULL ,
 `reason` longtext NULL ,
 `bornDate` datetime NULL 
)*/;

/*View structure for view giftview */

/*!50001 DROP TABLE IF EXISTS `giftview` */;
/*!50001 DROP VIEW IF EXISTS `giftview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `giftview` AS select `m_gift`.`ID` AS `id`,`m_gift`.`NUM` AS `num`,`m_gift`.`GIFT_NAME` AS `giftName`,`m_gift`.`GIFT_POINT` AS `giftPoint`,`m_gift`.`STORED_NUM` AS `storedNum`,`m_gift`.`QUANTITY_LEFT` AS `quantityLeft`,date_format(`m_gift`.`VALID_START_TIME`,'%Y-%m-%d %T') AS `validStartTime`,date_format(`m_gift`.`VALID_END_TIME`,'%Y-%m-%d %T') AS `validEndTime`,`m_gift`.`SAFE_STORED_NUM` AS `safeStoredNum`,`m_gift`.`PRICE` AS `price`,date_format(`m_gift`.`MARKET_TIME`,'%Y-%m-%d %T') AS `marketTime`,(select `m_loy_program`.`ID` from `m_loy_program` order by `m_loy_program`.`ID` limit 0,1) AS `programId`,(select `m_loy_program`.`NAME` from `m_loy_program` order by `m_loy_program`.`ID` limit 0,1) AS `programName` from `m_gift` order by `m_gift`.`ID` */;

/*View structure for view giftviewzh */

/*!50001 DROP TABLE IF EXISTS `giftviewzh` */;
/*!50001 DROP VIEW IF EXISTS `giftviewzh` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `giftviewzh` AS select `m_gift`.`ID` AS `id`,`m_gift`.`NUM` AS `编号`,`m_gift`.`GIFT_NAME` AS `礼品名称`,`m_gift`.`GIFT_POINT` AS `积分兑礼`,`m_gift`.`STORED_NUM` AS `库存数量`,`m_gift`.`QUANTITY_LEFT` AS `当前剩余数量`,date_format(`m_gift`.`VALID_START_TIME`,'%Y-%m-%d %T') AS `有效开始时间`,date_format(`m_gift`.`VALID_END_TIME`,'%Y-%m-%d %T') AS `有效结束时间`,`m_gift`.`SAFE_STORED_NUM` AS `安全库存`,`m_gift`.`PRICE` AS `售价`,date_format(`m_gift`.`MARKET_TIME`,'%Y-%m-%d %T') AS `上市时间` from `m_gift` order by `m_gift`.`ID` */;

/*View structure for view memberview */

/*!50001 DROP TABLE IF EXISTS `memberview` */;
/*!50001 DROP VIEW IF EXISTS `memberview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `memberview` AS select `t1`.`ID` AS `id`,`t1`.`MEMBER_ID` AS `memberId`,`t4`.`NAME` AS `memberName`,`t4`.`MEMBER_NUM` AS `memberNum`,`t4`.`PROGRAM_ID` AS `programId`,`t5`.`NAME` AS `programName`,`t1`.`TIER_CLASS` AS `tierClass`,`t3`.`CLASS_NAME` AS `tierClassName`,`t1`.`TIER` AS `tier`,`t2`.`TIER_NAME` AS `tireName`,`t1`.`ACTIVE_FLAG` AS `activeFlag`,concat(date_format(`t1`.`START_DATE`,'%Y-%m-%d'),' ',date_format(`t1`.`START_DATE`,'%T')) AS `startDate`,concat(date_format(`t1`.`END_DATE`,'%Y-%m-%d'),' ',date_format(`t1`.`END_DATE`,'%T')) AS `endDate` from ((((`m_member_tier` `t1` left join `m_tier` `t2` on((`t1`.`TIER` = `t2`.`ID`))) left join `m_tier_class` `t3` on((`t1`.`TIER_CLASS` = `t3`.`ID`))) left join `m_member` `t4` on((`t1`.`MEMBER_ID` = `t4`.`ID`))) left join `m_loy_program` `t5` on((`t4`.`PROGRAM_ID` = `t5`.`ID`))) order by `t4`.`PROGRAM_ID` */;

/*View structure for view pointlistview */

/*!50001 DROP TABLE IF EXISTS `pointlistview` */;
/*!50001 DROP VIEW IF EXISTS `pointlistview` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `pointlistview` AS select `t1`.`ID` AS `id`,(case when isnull(`t3`.`FATHER_GUID`) then `t3`.`ID` else `t3`.`GRANDFATHER_GUID` end) AS `customerId`,(case when isnull(`t2`.`FATHER_GUID`) then `t2`.`ID` else `t2`.`GRANDFATHER_GUID` end) AS `memberId`,`t1`.`ORDER_ID` AS `orderId`,abs(`t1`.`POINTS`) AS `points`,(case when (`t1`.`POINTS` > 0) then 'add' when (`t1`.`POINTS` < 0) then 'subtract' else 'error' end) AS `type`,`t1`.`MEMBER_CARD` AS `memberCard`,`t1`.`PROMOTION_ID` AS `promotionId`,`t1`.`POINT_TYPE_ID` AS `pointTypeId`,`t1`.`PROMOTION_NAME` AS `promotionName`,`t1`.`PROMOTION_TYPE` AS `promotionType`,(case when isnull(`giftValue`(`t1`.`COMMENTS`)) then `t1`.`ACT_SUB_TYPE` else `giftValue`(`t1`.`COMMENTS`) end) AS `reason`,`t1`.`MEMBER_PERIOD` AS `memberPeriod`,`t1`.`BORN_DATE` AS `bornDate`,`t1`.`VALID_FLAG` AS `validFlag`,`t1`.`FATHER_GUID` AS `fatherGuid`,`t1`.`COMB_STATUS` AS `combStatus`,`t1`.`ACT_TYPE` AS `actType`,`t1`.`ACT_SUB_TYPE` AS `actSubType` from ((`m_point_list` `t1` join `m_member` `t2`) join `m_customer` `t3`) where ((`t1`.`MEMBER_ID` = `t2`.`ID`) and (`t2`.`CUSTOMER_ID` = `t3`.`ID`)) */;

/*View structure for view v_point_detail */

/*!50001 DROP TABLE IF EXISTS `v_point_detail` */;
/*!50001 DROP VIEW IF EXISTS `v_point_detail` */;

/*!50001 CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`%` SQL SECURITY DEFINER VIEW `v_point_detail` AS select ifnull(`c`.`GRANDFATHER_GUID`,`c`.`ID`) AS `customerId`,(case when (`p`.`POINTS` < 0) then 'subtract' else 'add' end) AS `type`,`p`.`ID` AS `id`,`p`.`POINTS` AS `point`,ifnull(`giftValue`(`p`.`COMMENTS`),concat(`p`.`ACT_TYPE`,concat('-',`p`.`ACT_SUB_TYPE`))) AS `reason`,`p`.`BORN_DATE` AS `bornDate` from ((`m_point_list` `p` join `m_member` `m`) join `m_customer` `c`) where ((`p`.`MEMBER_ID` = `m`.`ID`) and (`m`.`CUSTOMER_ID` = `c`.`ID`) and (`p`.`VALID_FLAG` = 1)) */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
