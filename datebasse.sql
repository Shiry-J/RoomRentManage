/*
SQLyog Community v13.1.6 (64 bit)
MySQL - 8.0.25 : Database - roommanagement
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`roommanagement` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `roommanagement`;

/*Table structure for table `cart` */

DROP TABLE IF EXISTS `cart`;

CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `roomid` bigint NOT NULL COMMENT '房间id',
  `isend` int NOT NULL COMMENT '是否结束',
  `price` double(20,2) NOT NULL COMMENT '价格',
  `roommaster` varchar(20) NOT NULL COMMENT '房东名字',
  PRIMARY KEY (`id`),
  CONSTRAINT `cart_chk_1` CHECK (((`isend` = 0) or (`isend` = 1)))
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cart` */

insert  into `cart`(`id`,`userid`,`roomid`,`isend`,`price`,`roommaster`) values 
(2,1,1,0,56457.01,'test'),
(3,1,7,0,123.00,'test'),
(5,1,11,1,231.00,'test'),
(6,1,1,1,56457.01,'test'),
(7,8,1,0,56457.01,'test'),
(8,8,1,1,56457.01,'test'),
(9,8,7,0,123.00,'test'),
(10,8,10,0,111.00,'test'),
(11,8,11,1,231.00,'test'),
(12,8,37,1,123.00,'test'),
(13,11,1,1,56457.01,'test'),
(14,12,7,0,123.00,'test'),
(16,12,1,1,56457.01,'test'),
(17,12,8,1,1111.00,'test'),
(18,12,9,1,444.00,'test'),
(19,14,7,0,123.00,'test'),
(20,14,9,1,444.00,'test'),
(21,15,7,1,123.00,'test'),
(22,15,9,0,444.00,'test'),
(23,16,1,0,56457.01,'test'),
(24,16,9,0,444.00,'test'),
(25,16,8,1,1111.00,'test'),
(26,17,7,0,123.00,'test'),
(27,17,1,0,56457.01,'test'),
(28,17,9,0,444.00,'test'),
(29,17,43,0,123.00,'qwe11');

/*Table structure for table `cleanercart` */

DROP TABLE IF EXISTS `cleanercart`;

CREATE TABLE `cleanercart` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `userid` bigint NOT NULL COMMENT 'userid',
  `roomid` bigint NOT NULL COMMENT 'roomid',
  `roomaddress` varchar(500) NOT NULL COMMENT 'roomaddress',
  `cleaner` varchar(20) NOT NULL COMMENT 'cleaner',
  `price` decimal(20,2) NOT NULL COMMENT 'price',
  `status` int NOT NULL COMMENT 'status',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `cleanercart` */

insert  into `cleanercart`(`id`,`userid`,`roomid`,`roomaddress`,`cleaner`,`price`,`status`) values 
(2,1,7,'room2','test',123123.00,0),
(3,1,10,'room4','qwe',123.00,1),
(4,1,1,'森林路100号','无',123123.00,2),
(6,1,7,'room2','无',123123.00,2),
(7,17,43,'room11','qwe11',123123.00,0);

/*Table structure for table `cleanner` */

DROP TABLE IF EXISTS `cleanner`;

CREATE TABLE `cleanner` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账号',
  `phone` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  `idcard` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份信息',
  `address` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '服务地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `cleanner` */

insert  into `cleanner`(`id`,`username`,`phone`,`email`,`idcard`,`address`) values 
(1,'test','11122233344','123@qq.com','320583199911198032','阿大声道'),
(2,'qwe','12312312312','649140990@qq.com','320583199911198032','11111111'),
(3,'qwe11','12312312312','649140990@qq.com','320583199911198032','11111111');

/*Table structure for table `evalute` */

DROP TABLE IF EXISTS `evalute`;

CREATE TABLE `evalute` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `cartid` bigint NOT NULL COMMENT '订单id',
  `userid` bigint NOT NULL COMMENT '用户id',
  `roomid` bigint NOT NULL COMMENT '房间id',
  `roommaster` varchar(20) NOT NULL COMMENT '房东',
  `message` varchar(500) NOT NULL COMMENT '留言',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `evalute` */

insert  into `evalute`(`id`,`cartid`,`userid`,`roomid`,`roommaster`,`message`) values 
(1,7,8,1,'test','123123'),
(2,9,8,7,'test','好好爱好'),
(3,10,8,10,'test','阿双方三房'),
(4,15,12,39,'qwe','好十分完美'),
(5,19,14,7,'test','环境优美'),
(6,22,15,9,'test','地理位置优越'),
(7,23,16,1,'test','123123'),
(8,26,17,7,'test','good');

/*Table structure for table `room` */

DROP TABLE IF EXISTS `room`;

CREATE TABLE `room` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `roomname` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间名称',
  `roomprice` decimal(20,2) DEFAULT NULL COMMENT '房间价格',
  `roomimage` varchar(500) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间图片',
  `roomdate` date DEFAULT NULL COMMENT '最后一次上架时间',
  `roomdescription` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间描述',
  `roommaster` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '发布人',
  `roomaddress` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '房间地址',
  `ison` int NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `room_chk_1` CHECK (((`ison` = 1) or (`ison` = 0)))
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `room` */

insert  into `room`(`id`,`roomname`,`roomprice`,`roomimage`,`roomdate`,`roomdescription`,`roommaster`,`roomaddress`,`ison`) values 
(1,'room1',56457.01,'/statics/img/fc8349f2-7085-4b03-be5c-b745d7771470123123.jpeg','2021-06-07','森林气息精装小别墅','test','森林路100号',1),
(7,'room2',123.00,'/statics/img/2.jpeg','2021-06-09','room2','test','room2',1),
(8,'room3',1111.00,'/statics/img/3.jpeg','2021-06-09','room3','test','room3',1),
(9,'room10',444.00,'/statics/img/10.jpeg','2021-06-08','room10','test','room10',1),
(10,'room4',111.00,'/statics/img/4.jpeg','2021-06-05','room4','test','room4',1),
(11,'room5',231.00,'/statics/img/5.jpeg','2021-06-02','room5','test','room5',1),
(12,'room6',124234.00,'/statics/img/6.jpeg','2021-06-25','room6','test','room6',1),
(13,'room7',3453.00,'/statics/img/7.jpeg','2021-06-14','room7','test','room7',1),
(14,'room8',1231.00,'/statics/img/8.jpeg','2021-06-03','room8','test','room8',1),
(15,'room9',4234.00,'/statics/img/9.jpeg','2021-06-01','room9888','test','room9',1),
(37,'room11',123.00,'/statics/img/9bdb4d3d-8943-4320-9663-d8ec8150ae0874e5087915d0250c3f25ef9ce56eb8dc.jpeg','2021-06-12','room11','test','room11',0),
(39,'qwe',123.00,'/statics/img/df9944d5-31bf-4e4d-ba68-721f4d86250b9.jpeg','2021-06-16','qwe','qwe','qwe',1),
(40,'123',123.00,'/statics/img/e802ccf0-9741-4208-a555-e347ab2f790f6.jpeg','2021-06-16','123','asd','room11',0),
(41,'room11',123.00,'/statics/img/ddf2d76d-f99e-43b4-b240-1e7d6ffa7ade123.jpeg','2021-06-16','room11','zxc','room11',0),
(42,'qwe1',123.00,'/statics/img/49340e47-9f46-4958-9021-d59af5657dff123123.jpeg','2021-06-16','qwe1','qwe1','123123',1),
(43,'room11',123.00,'/statics/img/5b1c8fe5-aaa8-401d-aca5-b0467002396c10.jpeg','2021-06-16','room11','qwe11','room11',1);

/*Table structure for table `roommaster` */

DROP TABLE IF EXISTS `roommaster`;

CREATE TABLE `roommaster` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT 'id',
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账号',
  `idcard` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '身份信息',
  `address` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '地址',
  `phone` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `roommaster` */

insert  into `roommaster`(`id`,`username`,`idcard`,`address`,`phone`,`email`) values 
(8,'test','123123123123','11111111','11122233344','123@qq.com'),
(9,'123123123','320583199911198032','11111111','12312312312','649140990@qq.com'),
(10,'qwe','320583199911198032','11111111','12312312312','649140990@qq.com'),
(11,'asd','320583199911198032','12312312','12312312312','649140990@qq.com'),
(12,'zxc','320583199911198032','11111111','12312312312','649140990@qq.com'),
(13,'qwe1','320583199911198032','12312312','12312312312','649140990@qq.com'),
(14,'qwe11','320583199911198032','11111111','12312312312','649140990@qq.com');

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `username` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '账号',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '密码',
  `phone` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电话',
  `email` varchar(30) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

/*Data for the table `user` */

insert  into `user`(`id`,`username`,`password`,`phone`,`email`) values 
(1,'test','test','11122233344','123@qq.com'),
(7,'123','123','11122233344','649140990@qq.com'),
(8,'1234','1234','12312312312','649140990@qq.com'),
(9,'123123','123123','12312312312','649140990@qq.com'),
(10,'111','111','11122233333','649140990@qq.com'),
(11,'123123123','123','12312312312','649140990@qq.com'),
(12,'qwe','qweqwe','12312312312','649140990@qq.com'),
(13,'12312312','123','11111111123','649140990@qq.com'),
(14,'asd','123','12312312312','649140990@qq.com'),
(15,'zxc','123','12312312312','649140990@qq.com'),
(16,'qwe1','123','12312312312','649140990@qq.com'),
(17,'qwe11','123','12312312312','649140990@qq.com');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
