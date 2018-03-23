-- MySQL dump 10.16  Distrib 10.1.30-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	10.1.30-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `grade`
--

DROP TABLE IF EXISTS `grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `sid` int(10) unsigned DEFAULT NULL,
  `subject` varchar(16) DEFAULT NULL,
  `score` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grade`
--

LOCK TABLES `grade` WRITE;
/*!40000 ALTER TABLE `grade` DISABLE KEYS */;
INSERT INTO `grade` VALUES (1,3,'python',87),(2,4,'python',90),(3,2,'python',58),(4,7,'python',98),(5,5,'python',78),(6,9,'python',86),(7,11,'python',88),(8,10,'python',76),(9,1,'python',69);
/*!40000 ALTER TABLE `grade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu`
--

DROP TABLE IF EXISTS `stu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `sex` enum('w','m') NOT NULL DEFAULT 'm',
  `classid` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu`
--

LOCK TABLES `stu` WRITE;
/*!40000 ALTER TABLE `stu` DISABLE KEYS */;
INSERT INTO `stu` VALUES (1,'zhangsan',22,'m','python03'),(2,'lisi',25,'w','python04'),(3,'wangwu',20,'m','python03'),(4,'zhaoliu',19,'w','python04'),(5,'qq01',20,'m','python03'),(6,'qq02',21,'w','python04'),(7,'qq03',20,'m','python05'),(8,'uu01',21,'w','python04'),(9,'uu02',20,'m','python05'),(10,'aa',29,'w','python03'),(11,'bb',20,'m','python04');
/*!40000 ALTER TABLE `stu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stu2`
--

DROP TABLE IF EXISTS `stu2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stu2` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `sex` enum('w','m') NOT NULL DEFAULT 'm',
  `classid` char(8) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stu2`
--

LOCK TABLES `stu2` WRITE;
/*!40000 ALTER TABLE `stu2` DISABLE KEYS */;
INSERT INTO `stu2` VALUES (2,'lisi',25,'w','python04'),(4,'zhaoliu',19,'w','python04'),(6,'qq02',21,'w','python04'),(8,'uu01',21,'w','python04'),(11,'bb',20,'m','python04');
/*!40000 ALTER TABLE `stu2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tt2`
--

DROP TABLE IF EXISTS `tt2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tt2` (
  `id` int(11) DEFAULT NULL,
  `name` varchar(8) NOT NULL,
  `age` tinyint(3) unsigned NOT NULL DEFAULT '20',
  `num` tinyint(3) unsigned DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt2`
--

LOCK TABLES `tt2` WRITE;
/*!40000 ALTER TABLE `tt2` DISABLE KEYS */;
INSERT INTO `tt2` VALUES (NULL,'lisi',20,NULL,NULL),(NULL,'wangwu',0,NULL,'2018-03-08 12:24:36'),(NULL,'zhangsan',30,NULL,'2018-03-08 12:24:36');
/*!40000 ALTER TABLE `tt2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `type`
--

DROP TABLE IF EXISTS `type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(16) NOT NULL,
  `pid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'服装',0),(2,'数码',0),(3,'男装',1),(4,'手机',2),(5,'相机',2),(6,'电脑',2),(7,'女装',1),(8,'童装',1),(9,'食品',0),(10,'零食',9),(11,'特产',9),(12,'休闲装',1);
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-03-07 15:04:48
