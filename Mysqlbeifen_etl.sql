/*
SQLyog Job Agent Version 8.14 Copyright(c) Webyog Softworks Pvt. Ltd. All Rights Reserved.


MySQL - 5.5.17 : Database - jol_areca_etl
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`jol_areca_etl` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `jol_areca_etl`;

/*Table structure for table `items` */

DROP TABLE IF EXISTS `items`;

CREATE TABLE `items` (
  `num_iid` varchar(100) NOT NULL,
  `title` text,
  `created` datetime DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `list_time` datetime DEFAULT NULL,
  `delist_time` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `approve_status` varchar(32) DEFAULT NULL,
  `outer_id` varchar(100) DEFAULT NULL,
  `violation` varchar(32) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `category_id` varchar(40) DEFAULT NULL,
  `category_str` varchar(60) DEFAULT NULL,
  `description` varchar(100) DEFAULT NULL,
  `org_id` varchar(40) DEFAULT NULL,
  `insert_time` datetime NOT NULL,
  PRIMARY KEY (`num_iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `items` */

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
  `INSERT_TIME` datetime DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `WECHAT` varchar(20) DEFAULT NULL,
  `IS_ATTENTION` int(11) DEFAULT NULL,
  `IS_MOBILE_REGISTER` int(11) DEFAULT NULL,
  `IS_EMPLOYEES` int(11) DEFAULT NULL,
  `HEY_CONPONS` varchar(20) DEFAULT NULL,
  `EMP_RECOMMEND` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_CUSTOMER_1` (`BELONG_ORG`),
  KEY `IX_M_CUSTOMER_2` (`CUSTOMER_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer` */

insert  into `m_customer` values ('20140815141810465','6',NULL,NULL,'杨洪鹏',NULL,'1',NULL,'1989-04-20 00:00:00',NULL,NULL,NULL,NULL,'2014-08-12 08:27:13',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18563923532',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370212','370000','370200','松岭路169号崂山软件园B503','266000',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,'2014-08-23 09:40:03',NULL,NULL,1,0,1,NULL,'0'),('20140815141810730','1',NULL,NULL,'绍瑞',NULL,NULL,NULL,'1987-03-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 11:52:44',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'370202','370000','370200','漳州二路','266520',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,'2014-08-23 23:40:04',NULL,NULL,1,0,1,NULL,'1'),('20140815141810739','4',NULL,NULL,'王斌',NULL,'1',NULL,'2014-01-01 00:00:00',NULL,NULL,NULL,NULL,'2014-08-10 21:33:37',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'18954834868',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0','110000','110100','丰台区88号','100000',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,'2014-08-22 15:40:03',NULL,NULL,1,0,1,NULL,'0'),('20140826094003641','16',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-08-20 16:58:27',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','','','','',NULL,NULL,NULL,NULL,NULL,'0.00','0.00',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0.00',0,'0.00',NULL,'2014-08-26 09:40:03',NULL,NULL,1,0,0,NULL,'0');

/*Table structure for table `m_customer_his` */

DROP TABLE IF EXISTS `m_customer_his`;

CREATE TABLE `m_customer_his` (
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
  `INSERT_TIME` datetime DEFAULT NULL,
  `MICROBLOG` varchar(100) DEFAULT NULL,
  `WECHAT` varchar(20) DEFAULT NULL,
  `IS_ATTENTION` int(11) DEFAULT NULL,
  `IS_MOBILE_REGISTER` int(11) DEFAULT NULL,
  `IS_EMPLOYEES` int(11) DEFAULT NULL,
  `HEY_CONPONS` varchar(20) DEFAULT NULL,
  `EMP_RECOMMEND` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IX_M_CUSTOMER_HIS_1` (`BELONG_ORG`),
  KEY `IX_M_CUSTOMER_HIS_2` (`CUSTOMER_NUM`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_customer_his` */

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
  `INSERT_TIME` datetime DEFAULT NULL,
  `HEY_CONPONS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_CUSTOMER_O_ID` (`CUSTOMER_O_ID`),
  KEY `INDEX_ORDER_NUM` (`ORDER_NUM`),
  KEY `IX_M_ORDER_1` (`CUSTOMER_ID`),
  KEY `IX_M_ORDER_2` (`TRANS_DATE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order` */

insert  into `m_order` values ('20140815141810120','11',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-13 16:29:21','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810151','10',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-13 08:33:22','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810216','3',NULL,'281.20','296.00','6','20140815141810465',NULL,'2014-08-23 09:37:20','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-23 09:40:03',''),('20140815141810465','5',NULL,'98.00','98.00','16','20140826094003641',NULL,'2014-08-26 09:08:39','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'2014-08-26 09:40:03',''),('20140815141810540','2',NULL,'93.10','98.00','4','20140815141810739',NULL,'2014-08-22 15:18:44','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'丰台区88号','丰台区88号',NULL,NULL,NULL,NULL,'丰台区88号','18954834868','18954834868',NULL,NULL,'2014-08-22 15:40:03',''),('20140815141810550','12',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-13 16:39:52','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810560','6',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-12 16:35:49','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810626','7',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-12 16:51:45','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810633','17',NULL,'98.00','98.00','1','20140815141810730',NULL,'2014-08-14 08:41:22','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'漳州二路','漳州二路',NULL,NULL,NULL,NULL,'漳州二路','1531882','1531882',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810680','13',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-13 16:50:20','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810730','1',NULL,'159.60','168.00','6','20140815141810465',NULL,'2014-08-22 10:10:03','1','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山东省 青岛市 崂山区 松岭路169号崂山软件园B503','山东省 青岛市 崂山区 松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'山东省 青岛市 崂山区 松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-22 10:40:05',''),('20140815141810739','4',NULL,'93.10','98.00','1','20140815141810730',NULL,'2014-08-23 22:56:52','1','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','山东省 青岛市 市南区 漳州二路',NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','1531882','1531882',NULL,NULL,'2014-08-23 23:40:04',''),('20140815141810774','9',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-13 08:33:12','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810789','15',NULL,'294.00','294.00','1','20140815141810730',NULL,'2014-08-13 21:05:24','1','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','山东省 青岛市 市南区 漳州二路',NULL,NULL,NULL,NULL,'山东省 青岛市 市南区 漳州二路','1531882','1531882',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810840','16',NULL,'98.00','98.00','1','20140815141810730',NULL,'2014-08-13 23:24:56','0','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'漳州二路','漳州二路',NULL,NULL,NULL,NULL,'漳州二路','1531882','1531882',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810919','8',NULL,'98.00','98.00','6','20140815141810465',NULL,'2014-08-12 17:28:46','1','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10',''),('20140815141810986','14',NULL,'266.00','266.00','6','20140815141810465',NULL,'2014-08-13 16:50:47','1','Z','',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','松岭路169号崂山软件园B503',NULL,NULL,NULL,NULL,'松岭路169号崂山软件园B503','18563923532','18563923532',NULL,NULL,'2014-08-15 14:18:10','');

/*Table structure for table `m_order_his` */

DROP TABLE IF EXISTS `m_order_his`;

CREATE TABLE `m_order_his` (
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
  `INSERT_TIME` datetime DEFAULT NULL,
  `HEY_CONPONS` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_CUSTOMER_O_ID` (`CUSTOMER_O_ID`),
  KEY `INDEX_ORDER_NUM` (`ORDER_NUM`),
  KEY `IX_M_ORDER_HIS_1` (`CUSTOMER_ID`),
  KEY `IX_M_ORDER_HIS_2` (`TRANS_DATE`),
  KEY `IX_M_ORDER_HIS_3` (`INSERT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_his` */

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
  `INSERT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_ORIGINAL_ID` (`ORIGINAL_ID`),
  KEY `INX_M_ORDER_ITEM_1` (`ORDER_ID`),
  KEY `INX_M_ORDER_ITEM_2` (`PRODUCT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_item` */

/*Table structure for table `m_order_item_his` */

DROP TABLE IF EXISTS `m_order_item_his`;

CREATE TABLE `m_order_item_his` (
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
  `INSERT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INDEX_ORIGINAL_ID` (`ORIGINAL_ID`),
  KEY `INX_M_ORDER_ITEM_HIS_1` (`ORDER_ID`),
  KEY `INX_M_ORDER_ITEM_HIS_2` (`PRODUCT_ID`),
  KEY `INX_M_ORDER_ITEM_HIS_3` (`INSERT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_order_item_his` */

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
  `INSERT_TIME` datetime DEFAULT NULL,
  `PRODUCT_CATEGORY_ID` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_product` */

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
  `INSERT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `m_store` */

/*Table structure for table `orders` */

DROP TABLE IF EXISTS `orders`;

CREATE TABLE `orders` (
  `oid` varchar(40) NOT NULL,
  `tid` varchar(40) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `status` varchar(64) DEFAULT NULL,
  `type` varchar(64) DEFAULT NULL,
  `alipay_id` varchar(50) DEFAULT NULL,
  `seller_id` varchar(50) DEFAULT NULL,
  `buyer_nick` varchar(50) DEFAULT NULL,
  `receiver_name` varchar(64) DEFAULT NULL,
  `receiver_address` text,
  `receiver_mobile` varchar(32) DEFAULT NULL,
  `receiver_phone` varchar(32) DEFAULT NULL,
  `buyer_email` varchar(128) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `num_iid` varchar(100) DEFAULT NULL,
  `payment` bigint(20) DEFAULT NULL,
  `buyer_message` text,
  `user_id` varchar(40) DEFAULT NULL,
  `outer_id` varchar(100) DEFAULT NULL,
  `source` varchar(40) DEFAULT NULL,
  `org_id` varchar(40) DEFAULT NULL,
  `insert_time` datetime NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `orders` */

/*Table structure for table `t_send_msg` */

DROP TABLE IF EXISTS `t_send_msg`;

CREATE TABLE `t_send_msg` (
  `id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `code` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `price` double DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `msgGuid` varchar(40) CHARACTER SET utf8 NOT NULL,
  `action_group_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `action_id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `action_name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `client_id` varchar(40) CHARACTER SET utf8 NOT NULL,
  `client_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `msgPlat` varchar(20) CHARACTER SET utf8 NOT NULL,
  `phone` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `micro_channel` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `microblogging` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `two_id` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `two_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `two_path` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `micropic_id` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `micropic_name` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `micropic_path` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `action_start_date` date DEFAULT NULL,
  `planSendTime` datetime NOT NULL,
  `status` varchar(20) CHARACTER SET utf8 NOT NULL,
  `created` varchar(40) CHARACTER SET utf8 NOT NULL,
  `createTime` datetime NOT NULL,
  `updated` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `sender` varchar(40) CHARACTER SET utf8 DEFAULT NULL,
  `sendTarget` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `subject` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `msgType` varchar(20) CHARACTER SET utf8 DEFAULT NULL,
  `actualSendTime` datetime DEFAULT NULL,
  `content` text CHARACTER SET utf8,
  `msgExpandGuid` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `t_send_msg` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `user_id` varchar(40) NOT NULL,
  `cust_num` varchar(50) DEFAULT NULL,
  `nick` varchar(50) DEFAULT NULL,
  `sex` varchar(4) DEFAULT NULL,
  `zip` varchar(50) DEFAULT NULL,
  `state` varchar(64) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `district` varchar(64) DEFAULT NULL,
  `address` text,
  `created` datetime DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `type` varchar(32) DEFAULT NULL,
  `status` varchar(32) DEFAULT NULL,
  `email` text,
  `mobile` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `home_tel` varchar(50) DEFAULT NULL,
  `country` varchar(40) DEFAULT NULL,
  `id_type` varchar(40) DEFAULT NULL,
  `id_card` varchar(30) DEFAULT NULL,
  `education` varchar(40) DEFAULT NULL,
  `industry` varchar(40) DEFAULT NULL,
  `duty` varchar(40) DEFAULT NULL,
  `income` varchar(40) DEFAULT NULL,
  `hoppy` varchar(100) DEFAULT NULL,
  `org_id` varchar(40) DEFAULT NULL,
  `insert_time` datetime NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `users` */

/*!50106 set global event_scheduler = 1*/;

/* Event structure for event `RkylinCustomersToAreca` */

/*!50106 DROP EVENT IF EXISTS `RkylinCustomersToAreca`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`%` EVENT `RkylinCustomersToAreca` ON SCHEDULE EVERY 1 DAY STARTS '2014-07-18 01:00:00' ENDS '2014-12-31 08:00:00' ON COMPLETION PRESERVE ENABLE DO begin 
-- SET autocommit=0;
-- START TRANSACTION;
 CALL jol_areca.`SyncCustomer.MD.Batch`('7F57AE5B-EC02-4032-BDF6-3AE13E23B870','b72a0045-2bea-4ea7-95f7-14755a94d597','普通会员',STR_TO_DATE('2001-01-01 00:00:00','%Y-%m-%d %k:%i:%s'));
 CALL jol_areca.JolMemberDowith();
-- COMMIT;
end */$$
DELIMITER ;

/* Event structure for event `RkylinOrdersToAreca` */

/*!50106 DROP EVENT IF EXISTS `RkylinOrdersToAreca`*/;

DELIMITER $$

/*!50106 CREATE DEFINER=`root`@`%` EVENT `RkylinOrdersToAreca` ON SCHEDULE EVERY 1 DAY STARTS '2014-07-18 02:00:00' ENDS '2014-12-31 08:00:00' ON COMPLETION PRESERVE ENABLE DO begin
-- SET autocommit=0;
-- START TRANSACTION;
CALL jol_areca.`SyncOrder.MD.Batch`('b72a0045-2bea-4ea7-95f7-14755a94d597',STR_TO_DATE('2001-01-01 00:00:00','%Y-%m-%d %k:%i:%s'));
CALL jol_areca.JolPointsDowith();
-- COMMIT;
end */$$
DELIMITER ;

/* Procedure structure for procedure `sp_customer_insert` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_customer_insert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_customer_insert`(IN `newXml` longtext)
BEGIN
	

	DECLARE i INT DEFAULT 1;
	DECLARE count1 INT DEFAULT 0;

	DECLARE nowtime DATETIME;
	SET nowtime = SYSDATE();
	
	DROP TEMPORARY TABLE IF EXISTS tmp_table;
	
	CREATE TEMPORARY TABLE tmp_table		
	(
			ID  VARCHAR(40),
			CUSTOMER_NUM  VARCHAR(50),
			FULL_NAME  VARCHAR(50),
			COUNTRY  VARCHAR(40),
			HOPPY  VARCHAR(100),
			SOURCE  VARCHAR(40),
			MOBILE_TEL  VARCHAR(50),
			HOME_TEL  VARCHAR(50),
			EMAIL  TEXT,
			CREATE_DATE  datetime,
			MODIFY_DATE  datetime,
			REMARK  TEXT,
			REGION  VARCHAR(64),
			PROVINCE  VARCHAR(64),
			CITY  VARCHAR(64),
			ADDRESS  TEXT,
			POSTALCODE  VARCHAR(50),
			SOURCEID  VARCHAR(36),
			MICROBLOG VARCHAR(100),
			WECHAT VARCHAR(20)
	);

	SET count1 =  ExtractValue(newXml, 'COUNT(/table)');	

	WHILE i <= count1 DO
	
		INSERT INTO tmp_table(ID,CUSTOMER_NUM,FULL_NAME,COUNTRY,HOPPY,SOURCE,MOBILE_TEL,HOME_TEL,EMAIL,CREATE_DATE,MODIFY_DATE,REMARK,REGION,PROVINCE,CITY,ADDRESS,POSTALCODE,SOURCEID,MICROBLOG,WECHAT)
		SELECT 	ExtractValue(newXml, 'table[$i]/cust_guid'),
						ExtractValue(newXml, 'table[$i]/party_id'),
						ExtractValue(newXml, 'table[$i]/cons'),
						ExtractValue(newXml, 'table[$i]/country'),
						ExtractValue(newXml, 'table[$i]/hoppy'),
						ExtractValue(newXml, 'table[$i]/role_type_code'),
						ExtractValue(newXml, 'table[$i]/cons_mobile'),
						ExtractValue(newXml, 'table[$i]/cons_tel'),
						ExtractValue(newXml, 'table[$i]/email'),
						ExtractValue(newXml, 'table[$i]/rx_inserttime'),
						ExtractValue(newXml, 'table[$i]/rx_updateTime'),
						ExtractValue(newXml, 'table[$i]/remark'),
						ExtractValue(newXml, 'table[$i]/dist'),
						ExtractValue(newXml, 'table[$i]/prov'),
						ExtractValue(newXml, 'table[$i]/city'),
						ExtractValue(newXml, 'table[$i]/cons_addr'),
						ExtractValue(newXml, 'table[$i]/cons_post_code'),
						ExtractValue(newXml, 'table[$i]/partyId'),
						ExtractValue(newXml, 'table[$i]/wbUrl'),
						ExtractValue(newXml, 'table[$i]/wxOpenId');
			
		SET i = i + 1; 
		
	END WHILE; 



DROP TEMPORARY TABLE IF EXISTS tmp_table_two;
CREATE TEMPORARY TABLE tmp_table_two (ID varchar(40));

insert into tmp_table_two(ID)
select x.ID
from tmp_table x
inner join M_CUSTOMER y on x.ID = y.ID;

delete x
from tmp_table x,tmp_table_two y
where x.ID = y.ID;




INSERT into M_CUSTOMER
(
		ID,
		CUSTOMER_NUM,
		FULL_NAME,
		COUNTRY,
		HOPPY,
		SOURCE,
		MOBILE_TEL,
		HOME_TEL,
		EMAIL,
		CREATE_DATE,
		MODIFY_DATE,
		REMARK,
		REGION,
		PROVINCE,
		CITY,
		ADDRESS,
		POSTALCODE,
		SOURCEID,
		MICROBLOG,
		WECHAT,
		INSERT_TIME
)
select 	x.ID,
				x.CUSTOMER_NUM,
				x.FULL_NAME,
				x.COUNTRY,
				x.HOPPY,
				x.SOURCE,
				x.MOBILE_TEL,
				x.HOME_TEL,
				x.EMAIL,
				x.CREATE_DATE,
				x.MODIFY_DATE,
				x.REMARK,
				x.REGION,
				x.PROVINCE,
				x.CITY,
				x.ADDRESS,
				x.POSTALCODE,
				x.SOURCEID,
				x.MICROBLOG,
				x.WECHAT,
				SYSDATE()
from tmp_table x;

	
END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_orderitem_insert` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_orderitem_insert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_orderitem_insert`(IN `newXml` longtext)
BEGIN
DECLARE i INT DEFAULT 1;
	DECLARE count1 INT DEFAULT 0;
	DECLARE nowtime DATETIME;
	SET nowtime = SYSDATE();
	
	DROP TEMPORARY TABLE IF EXISTS tmp_table;
	
	CREATE TEMPORARY TABLE tmp_table		
	(
		 ID		VARCHAR(40)
		,ORDER_ID	VARCHAR(40)
		,ORDER_NUM	VARCHAR(40)
		,PRODUCT_SKU	VARCHAR(100)
		,AMOUNT		DECIMAL(20,2)
		,QUANTITY	INT(11)
		,COMMENT	VARCHAR(100)
		,PRODUCT_ID	VARCHAR(40)
		,UPDATE_DATE	DATETIME
		,CREATE_DATE	DATETIME
		,CUSTOMER_ID	VARCHAR(40)
		,STORE_ID	VARCHAR(40)
		,SUB_CUSTOMER_ID	VARCHAR(40)
		,SOURCE		VARCHAR(40)
		,PRIMARY_PRODUCT_ID	VARCHAR(60)
		,PRIMARY_PRODUCT_NAME	VARCHAR(100)
		,ORIGINAL_ID	VARCHAR(40)
	);
		
	SET count1 =  ExtractValue(newXml, 'COUNT(/table)');	
	WHILE i <= count1 DO
		INSERT INTO tmp_table(
					ID
					,ORDER_ID
					,ORDER_NUM
					,PRODUCT_SKU
					,AMOUNT
					,QUANTITY
					,COMMENT
					,PRODUCT_ID
					,UPDATE_DATE
					,CREATE_DATE
					,CUSTOMER_ID
					,STORE_ID
					,SUB_CUSTOMER_ID
					,SOURCE
					,PRIMARY_PRODUCT_ID
					,PRIMARY_PRODUCT_NAME
					,ORIGINAL_ID
		)
		SELECT 	ExtractValue(newXml, 'table[$i]/GUID'),
						ExtractValue(newXml, 'table[$i]/ORDER_GUID'),
						ExtractValue(newXml, 'table[$i]/ORDER_CODE'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_CODE'),
						ExtractValue(newXml, 'table[$i]/FACT_UNIT_PRIC'),
						ExtractValue(newXml, 'table[$i]/QTY'),
						ExtractValue(newXml, 'table[$i]/REMARK'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_GUID'),
						ExtractValue(newXml, 'table[$i]/rx_updateTime'),
						ExtractValue(newXml, 'table[$i]/rx_insertTime'),
						ExtractValue(newXml, 'table[$i]/CUST_GUID'),
						ExtractValue(newXml, 'table[$i]/ONLINE_SHOP_NAME'),
						ExtractValue(newXml, 'table[$i]/CUST_GUID'),
						ExtractValue(newXml, 'table[$i]/ORDER_SOUR_NAME'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_GUID'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_NAME'),
						ExtractValue(newXml, 'table[$i]/OID');
		SET i = i + 1; 
				
	END WHILE; 

DROP TEMPORARY TABLE IF EXISTS tmp_table_two;
CREATE TEMPORARY TABLE tmp_table_two (ID varchar(40));

insert into tmp_table_two(ID)
select x.ID
from tmp_table x
inner join M_ORDER_ITEM y on x.ID = y.ID;

delete x
from tmp_table x,tmp_table_two y
where x.ID = y.ID;

	
	INSERT INTO M_ORDER_ITEM 
			(
				ID,
				ORDER_ID,
				ORDER_NUM,
				PRODUCT_SKU,
				AMOUNT,
				QUANTITY,
				COMMENT,
				PRODUCT_ID,
				UPDATE_DATE,
				CREATE_DATE,
				CUSTOMER_ID,
				STORE_ID,
				SUB_CUSTOMER_ID,
				SOURCE,
				PRIMARY_PRODUCT_ID,
				PRIMARY_PRODUCT_NAME,
				ORIGINAL_ID,
				INSERT_TIME
			)		
	select  ID,
					ORDER_ID,
					ORDER_NUM,
					PRODUCT_SKU,
					AMOUNT,
					QUANTITY,
					COMMENT,
					PRODUCT_ID,
					UPDATE_DATE,
					CREATE_DATE,
					CUSTOMER_ID,
					STORE_ID,
					SUB_CUSTOMER_ID,
					SOURCE,
					PRIMARY_PRODUCT_ID,
					PRIMARY_PRODUCT_NAME,
					ORIGINAL_ID,
					SYSDATE()
	FROM tmp_table;


END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_order_insert` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_order_insert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_order_insert`(IN `newXml` longtext)
BEGIN
DECLARE i INT DEFAULT 1;
	DECLARE count1 INT DEFAULT 0;
	DECLARE nowtime DATETIME;
	SET nowtime = SYSDATE();
	
	DROP TEMPORARY TABLE IF EXISTS tmp_table;
	
	CREATE TEMPORARY TABLE tmp_table		
	(
		ID		VARCHAR(40),
		ORDER_NUM	VARCHAR(40),
		ORI_ORDER_AMOUNT	DECIMAL(20,2),
		CUSTOMER_ID	VARCHAR(40),
		TRANS_DATE	DATETIME,
		STATUS		VARCHAR(64),
		COMMENT		TEXT,
		CURRENCY	VARCHAR(40),
		STORE_ID	VARCHAR(50),
		UPDATE_DATE	DATETIME,
		CREATE_DATE	DATETIME,
		SOURCE		VARCHAR(40),
		FULL_NAME	VARCHAR(80),
		PROVINCE	VARCHAR(80),
		CITY		VARCHAR(80),
		receiver_address	TEXT,
		receiver_mobile	VARCHAR(32),
		receiver_phone	VARCHAR(32),
		buyer_email	VARCHAR(128)
	);
	
	SET count1 =  ExtractValue(newXml, 'COUNT(/table)');		
	WHILE i <= count1 DO
	
		INSERT INTO tmp_table(
				ID,
				ORDER_NUM,
				ORI_ORDER_AMOUNT,
				CUSTOMER_ID,
				TRANS_DATE,
				STATUS,
				COMMENT,
				CURRENCY,
				STORE_ID,
				UPDATE_DATE,
				CREATE_DATE,
				SOURCE,
				FULL_NAME,
				PROVINCE,
				CITY,
				receiver_address,
				receiver_mobile,
				receiver_phone,
				buyer_email
		)
		SELECT 	ExtractValue(newXml, 'table[$i]/ORDER_GUID'),
						ExtractValue(newXml, 'table[$i]/ORDER_CODE'),
						ExtractValue(newXml, 'table[$i]/ORDER_MONEY'),
						ExtractValue(newXml, 'table[$i]/CUST_GUID'),
						ExtractValue(newXml, 'table[$i]/PAID_DATE'),
						ExtractValue(newXml, 'table[$i]/ORDER_STUS'),
						ExtractValue(newXml, 'table[$i]/REMARK'),
						ExtractValue(newXml, 'table[$i]/CURRENCY'),
						ExtractValue(newXml, 'table[$i]/ONLINE_SHOP_NAME'),
						ExtractValue(newXml, 'table[$i]/rx_updateTime'),
						ExtractValue(newXml, 'table[$i]/rx_insertTime'),
						ExtractValue(newXml, 'table[$i]/ORDER_SOUR_NAME'),
						ExtractValue(newXml, 'table[$i]/CONS'),
						ExtractValue(newXml, 'table[$i]/PROV'),
						ExtractValue(newXml, 'table[$i]/CITY'),
						ExtractValue(newXml, 'table[$i]/CONS_ADDR'),
						ExtractValue(newXml, 'table[$i]/CONS_MOBILE'),
						ExtractValue(newXml, 'table[$i]/CONS_TEL'),
						ExtractValue(newXml, 'table[$i]/Email');
		SET i = i + 1; 
		
	END WHILE; 


DROP TEMPORARY TABLE IF EXISTS tmp_table_two;
CREATE TEMPORARY TABLE tmp_table_two (ID varchar(40));

insert into tmp_table_two(ID)
select x.ID
from tmp_table x
inner join M_ORDER y on x.ID = y.ID;

delete x
from tmp_table x,tmp_table_two y
where x.ID = y.ID;

SELECT * FROM tmp_table;


	INSERT INTO M_ORDER
	(
		ID,
		ORDER_NUM,
		ORI_ORDER_AMOUNT,
		CUSTOMER_ID,
		TRANS_DATE,
		STATUS,
		COMMENT,
		CURRENCY,
		STORE_ID,
		UPDATE_DATE,
		CREATE_DATE,
		SOURCE,
		FULL_NAME,
		PROVINCE,
		CITY,
		receiver_address,
		receiver_mobile,
		receiver_phone,
		buyer_email,
		INSERT_TIME
	)
	SELECT  ID,
					ORDER_NUM,
					ORI_ORDER_AMOUNT,
					CUSTOMER_ID,
					TRANS_DATE,
					STATUS,
					COMMENT,
					CURRENCY,
					STORE_ID,
					UPDATE_DATE,
					CREATE_DATE,
					SOURCE,
					FULL_NAME,
					PROVINCE,
					CITY,
					receiver_address,
					receiver_mobile,
					receiver_phone,
					buyer_email,
					SYSDATE()
	FROM tmp_table;


END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_product_insert` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_product_insert` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_product_insert`(IN `newXml` longtext)
BEGIN
	
	DECLARE i INT DEFAULT 1;
	DECLARE count1 INT DEFAULT 0;

	DECLARE nowtime DATETIME;
	SET nowtime = SYSDATE();
	
	DROP TEMPORARY TABLE IF EXISTS tmp_table;
	
	CREATE TEMPORARY TABLE tmp_table		
	(
			ID  VARCHAR(40),
			PRODUCT_NUM  VARCHAR(60),
			NAME  TEXT,
			PRODUCT_TYPE  VARCHAR(30),
			DESCRIPTION  VARCHAR(100),
			CREATE_DATE  DATETIME,
			MODIFY_DATE  DATETIME,
			PRODUCT_PRICE  DOUBLE,
			SPECIFICATION  VARCHAR(40),
			PRODUCT_NUMBER  INT(11),
			PRODUCT_CATEGORY  VARCHAR(60),
			PRIMARY_PRODUCT_NAME  TEXT
	);

	
	SET count1 =  ExtractValue(newXml, 'COUNT(/table)');	


	WHILE i <= count1 DO
	
		INSERT INTO tmp_table(ID,PRODUCT_NUM,NAME,PRODUCT_TYPE,DESCRIPTION,CREATE_DATE,MODIFY_DATE,PRODUCT_PRICE,SPECIFICATION,PRODUCT_NUMBER,PRODUCT_CATEGORY,PRIMARY_PRODUCT_NAME)
		SELECT 	ExtractValue(newXml, 'table[$i]/GOODS_SKU_GUID'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_CODE'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_NAME'),
						ExtractValue(newXml, 'table[$i]/BRND_NAME'),
						ExtractValue(newXml, 'table[$i]/GOODS_DESC'),
						ExtractValue(newXml, 'table[$i]/rx_insertTime'),
						ExtractValue(newXml, 'table[$i]/rx_updateTime'),
						ExtractValue(newXml, 'table[$i]/SALE_PRICE'),
						ExtractValue(newXml, 'table[$i]/GOODS_SKU_NAME'),
						ExtractValue(newXml, 'table[$i]/GOODS_CODE'),
						ExtractValue(newXml, 'table[$i]/FBRND_NAME'),
						ExtractValue(newXml, 'table[$i]/GOODS_NAME');
			
		SET i = i + 1; 
		
	END WHILE; 





DROP TEMPORARY TABLE IF EXISTS tmp_table_two;
CREATE TEMPORARY TABLE tmp_table_two (ID varchar(40));

insert into tmp_table_two(ID)
select x.ID
from tmp_table x
inner join M_PRODUCT y on x.ID = y.ID;

delete x
from tmp_table x,tmp_table_two y
where x.ID = y.ID;

INSERT into M_PRODUCT
(
		ID,
		PRODUCT_NUM,
		NAME,
		PRODUCT_TYPE,
		DESCRIPTION,
		CREATE_DATE,
		MODIFY_DATE,
		PRODUCT_PRICE,
		SPECIFICATION,
		PRODUCT_NUMBER,
		PRODUCT_CATEGORY,
		PRIMARY_PRODUCT_NAME,
		INSERT_TIME
)
select 	x.ID,
				x.PRODUCT_NUM,
				x.NAME,
				x.PRODUCT_TYPE,
				x.DESCRIPTION,
				x.CREATE_DATE,
				x.MODIFY_DATE,
				x.PRODUCT_PRICE,
				x.SPECIFICATION,
				x.PRODUCT_NUMBER,
				x.PRODUCT_CATEGORY,
				x.PRIMARY_PRODUCT_NAME,
				SYSDATE()
from tmp_table x;



END */$$
DELIMITER ;

/* Procedure structure for procedure `sp_save_order` */

/*!50003 DROP PROCEDURE IF EXISTS  `sp_save_order` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `sp_save_order`(orderXml longtext,orderItemXml longText)
BEGIN

	call sp_order_insert(orderXml);

	call sp_orderitem_insert(orderItemXml);

END */$$
DELIMITER ;

/* Procedure structure for procedure `toOrderitem_20140530` */

/*!50003 DROP PROCEDURE IF EXISTS  `toOrderitem_20140530` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `toOrderitem_20140530`()
BEGIN
DECLARE idx INT DEFAULT 1;
DECLARE lastSeq INT DEFAULT 0;
DECLARE procTmstmp DATETIME;
DECLARE lastProcTmstmp DATETIME;
DECLARE CONTINUE HANDLER FOR SQLWARNING
BEGIN
  INSERT INTO tmp_err_time(`dt`, `error`) VALUE (procTmStmp, 'WARNING');
  COMMIT;
END;
DECLARE CONTINUE HANDLER FOR NOT FOUND
BEGIN
  INSERT INTO tmp_err_time(`dt`, `error`) VALUE (procTmStmp, 'EXCEPTION');
  COMMIT;
END;
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_insert_time (seq INT PRIMARY KEY AUTO_INCREMENT, dt DATETIME);
CREATE TEMPORARY TABLE IF NOT EXISTS tmp_err_time (dt DATETIME PRIMARY KEY, error VARCHAR(10));
TRUNCATE TABLE tmp_insert_time;
TRUNCATE TABLE tmp_err_time;
SELECT MAX(execute_start) INTO lastProcTmstmp FROM M_PROCEDURE_LOG WHERE procedure_name='ordersitem_to_ORDERSITEM' AND source='中粮';
IF ISNULL(lastProcTmstmp) THEN
  INSERT INTO tmp_insert_time(dt) SELECT DISTINCT b.INSERT_TIME AS iKey
			        FROM M_ORDER_ITEM b
			       WHERE b.INSERT_TIME > lastProcTmstmp ORDER BY iKey;
ELSE 
  INSERT INTO tmp_insert_time(dt) SELECT DISTINCT b.INSERT_TIME AS iKey
			        FROM M_ORDER_ITEM b ORDER BY iKey;
END IF;
SELECT MAX(seq) INTO lastSeq FROM tmp_insert_time;
WHILE idx <= lastSeq DO
  START TRANSACTION;
  SELECT dt INTO procTmStmp FROM tmp_insert_time WHERE seq = idx;
  
  INSERT INTO M_ORDER_ITEM(ID, 
	ORDER_ID, 
	ORDER_NUM, 
	PRODUCT_SKU, 
	AMOUNT, 
	QUANTITY, 
	COMMENT, 
	ORI_AMOUNT, 
	PRODUCT_ID, 
	UPDATE_BY, 
	UPDATE_DATE, 
	CREATE_BY, 
	CREATE_DATE, 
	TRANS_DATE, 
	CUSTOMER_ID, 
	MEMBER_ID, 
	STORE_ID, 
	IMP_HISTORY_ID, 
	SUB_CUSTOMER_ID, 
	SOURCE, 
	PRIMARY_PRODUCT_ID, 
	PRIMARY_PRODUCT_NAME, 
	PRIMARY_PRODUCT_CATEGORY, 
	WEBSITE, 
	ORIGINAL_ID
	)
  SELECT b.ID, 
	b.ORDER_ID, 
	b.ORDER_NUM, 
	b.PRODUCT_SKU, 
	b.AMOUNT, 
	b.QUANTITY, 
	b.COMMENT, 
	b.ORI_AMOUNT, 
	b.PRODUCT_ID, 
	b.UPDATE_BY, 
	b.UPDATE_DATE, 
	b.CREATE_BY, 
	b.CREATE_DATE, 
	b.TRANS_DATE, 
	b.CUSTOMER_ID, 
	NULL, 
	b.STORE_ID, 
	b.IMP_HISTORY_ID, 
	b.SUB_CUSTOMER_ID, 
	b.SOURCE, 
	b.PRIMARY_PRODUCT_ID, 
	b.PRIMARY_PRODUCT_NAME, 
	b.PRIMARY_PRODUCT_CATEGORY, 
	b.WEBSITE, 
	b.ORIGINAL_ID
  FROM M_ORDER_ITEM b
 WHERE b.insert_time = procTmStmp;
 
  INSERT INTO M_LOY_ORDER_ITEM
	(ID,
	ORDER_ID,
	ORDER_NUM,
	PRODUCT_SKU,
	AMOUNT,
	QUANTITY,
	TRANS_DATE,
	UPDATE_DATE,
	PRODUCT_ID
	)
  SELECT UUID(),
	b.ORDER_ID,
	b.ORDER_NUM,
	b.PRODUCT_SKU,
	b.AMOUNT,
	b.QUANTITY,
	b.CREATE_DATE,
	b.CREATE_DATE,
	b.PRODUCT_ID
  FROM M_ORDER_ITEM b
  WHERE b.insert_time = procTmStmp;
  SET idx = idx + 1;
  COMMIT;
END WHILE;
INSERT INTO M_PROCEDURE_LOG(procedure_name, execute_start, source)
VALUES('ordersitem_to_ORDERSITEM', procTmStmp, '中粮');
 
DROP TABLE IF EXISTS tmp_insert_time;
SELECT * FROM tmp_err_time;
DROP TABLE IF EXISTS tmp_err_time;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
