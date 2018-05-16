/*
SQLyog 企业版 - MySQL GUI v7.14 
MySQL - 5.5.5-10.1.30-MariaDB : Database - mytest
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

CREATE DATABASE /*!32312 IF NOT EXISTS*/`mytest` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `mytest`;

/*Table structure for table `myapp_users` */

DROP TABLE IF EXISTS `myapp_users`;

CREATE TABLE `myapp_users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL,
  `age` int(11) NOT NULL,
  `phone` varchar(20) NOT NULL,
  `addtime` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

/*Data for the table `myapp_users` */

insert  into `myapp_users`(`id`,`name`,`age`,`phone`,`addtime`) values (1,'zhangsan',25,'123456789','2018-03-29 14:34:39.299440'),(3,'lisi',22,'3413451234','2018-03-29 14:56:14.000000'),(4,'wangwu',30,'123453463456','2018-03-29 14:57:40.000000'),(5,'李四',22,'33333333333','2018-03-29 14:58:11.000000');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
