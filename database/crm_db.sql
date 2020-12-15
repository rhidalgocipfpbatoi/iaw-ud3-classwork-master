CREATE DATABASE  IF NOT EXISTS `crm_db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crm_db`;

-- MySQL dump 10.13  Distrib 8.0.18, for osx10.14 (x86_64)
--
-- Host: localhost    Database: crm_db
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Enterprise`
--

DROP TABLE IF EXISTS `Enterprise`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Enterprise` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `country` varchar(2) NOT NULL,
  `locale` varchar(5) NOT NULL DEFAULT 'es_ES',
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `nif` varchar(12) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `nif` (`nif`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enterprise`
--

LOCK TABLES `Enterprise` WRITE;
/*!40000 ALTER TABLE `Enterprise` DISABLE KEYS */;
INSERT INTO `Enterprise` VALUES (1,'Enterprise 1','C/ La rambla 1','Gandía','Valencia','ES','es_ES','2017-08-08 00:00:00','2111221',0),(3,'Enterprise 3','C/ La rambla 3','Gandía','Valencia','ES','es_ES','2017-08-08 00:00:00','2211121221',1),(4,'Enterprise 4','C/ La rambla, 4','Gandía','Valencia','ES','es_ES','2017-12-27 16:46:07','21679885Q',1),(5,'Enterprise 5','C/ La rambla, 5','Gandía','Valencia','ES','es_ES','2017-12-27 16:46:42','21679885',1);
/*!40000 ALTER TABLE `Enterprise` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `User` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phoneNumber` varchar(15) DEFAULT NULL,
  `password` varchar(160) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `createdOn` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastLogin` datetime DEFAULT NULL,
  `locale` varchar(5) NOT NULL,
  `idEnterprise` int(11) NOT NULL,
  `birthday` date NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  KEY `user_ibfk_1` (`idEnterprise`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`idEnterprise`) REFERENCES `enterprise` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
INSERT INTO `User` VALUES (1,'Alex','Garcia','garcia@test.com','609761692','123',0,'2017-12-26 23:47:32','2000-01-01 00:00:00','es_ES',1,'2000-01-01'),(2,'Pepe','Ivars','ivars@test.com','609761692','123',0,'2017-12-26 23:47:32','2007-01-02 00:00:00','es_ES',1,'2006-01-01'),(4,'Monica','Navarro','navarro@test.com','609761692','123',1,'2017-12-26 23:47:32','2007-01-04 00:00:00','es_ES',3,'2004-01-01'),(5,'Juanjo','Coloma','coloma@test.com','609761692','123',0,'2017-12-26 23:47:32','2007-01-05 00:00:00','es_ES',1,'2003-01-01'),(6,'Juan','Pedros','pedros@test.com','609761692','123',1,'2017-12-26 23:47:32','2007-01-06 00:00:00','es_ES',4,'2002-01-01'),(19,'Ignacio','Pla','pla@test.com','965525271','ad3878ef7ad0b0e51fc6f367d8577c13106f5486',0,'2017-12-27 15:47:00','2007-01-07 00:00:00','es_ES',1,'1981-08-11'),(20,'Maria','Marrahi','marrahi@test.com','965525271','ad3878ef7ad0b0e51fc6f367d8577c13106f5486',1,'2017-12-27 15:47:05','2007-01-08 00:00:00','es_ES',5,'1981-08-11'),(26,'Lirios','Esteve','esteve@test.com','965525271','ad3878ef7ad0b0e51fc6f367d8577c13106f5486',0,'2017-12-27 16:33:03','2007-01-12 00:00:00','es_ES',1,'1981-08-11');
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-16 23:16:17