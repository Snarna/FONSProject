CREATE DATABASE  IF NOT EXISTS `emrdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `emrdb`;
-- MySQL dump 10.13  Distrib 5.7.16, for Linux (x86_64)
--
-- Host: localhost    Database: emrdb
-- ------------------------------------------------------
-- Server version	5.7.16-0ubuntu0.16.10.1

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
-- Table structure for table `cd4testData`
--

DROP TABLE IF EXISTS `cd4testData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cd4testData` (
  `cd4testid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `cd4testnum` int(11) NOT NULL,
  `cd4testnotes` varchar(200) NOT NULL,
  `cd4testdate` date NOT NULL,
  `cd4testenterdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `cd4testeditdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cd4testid`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cd4testData`
--

LOCK TABLES `cd4testData` WRITE;
/*!40000 ALTER TABLE `cd4testData` DISABLE KEYS */;
INSERT INTO `cd4testData` VALUES (1,1,12,'','2016-11-21','2016-11-14 15:42:07','2016-11-14 20:17:22'),(2,1,3,'Again 2','2016-11-14','2016-11-14 16:21:55','2016-11-14 18:32:43'),(3,1,321,'Again','2016-11-14','2016-11-14 16:22:42','2016-11-14 18:32:41'),(4,1,123,'','2016-11-14','2016-11-14 18:25:35','2016-11-14 18:25:39'),(5,1,123,'fref','2016-11-15','2016-11-14 20:10:09','2016-11-14 20:10:09'),(6,1,123,'Hahe','2016-11-17','2016-11-18 03:31:31','2016-11-18 03:31:39');
/*!40000 ALTER TABLE `cd4testData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loadtestData`
--

DROP TABLE IF EXISTS `loadtestData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loadtestData` (
  `loadtestid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `loadtestnum` int(11) NOT NULL,
  `loadtestnotes` varchar(200) NOT NULL,
  `loadtestdate` date NOT NULL,
  `loadtestenterdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `loadtesteditdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`loadtestid`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loadtestData`
--

LOCK TABLES `loadtestData` WRITE;
/*!40000 ALTER TABLE `loadtestData` DISABLE KEYS */;
INSERT INTO `loadtestData` VALUES (1,1,2,'','2016-11-21','2016-11-14 18:25:51','2016-11-14 18:25:51'),(2,1,322,'asd','2016-11-14','2016-11-14 18:26:38','2016-11-14 18:26:38'),(3,1,233,'233','2016-11-14','2016-11-14 18:27:56','2016-11-14 18:27:56'),(4,1,233,'123','2016-11-14','2016-11-14 18:28:53','2016-11-14 18:28:53'),(5,1,123,'123','2016-11-14','2016-11-14 18:29:55','2016-11-14 18:29:55'),(6,1,9,'123','2016-11-14','2016-11-14 18:32:05','2016-11-14 18:32:05'),(7,26,123,'123','2016-11-21','2016-11-14 21:00:42','2016-11-14 21:00:42');
/*!40000 ALTER TABLE `loadtestData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patientsData`
--

DROP TABLE IF EXISTS `patientsData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patientsData` (
  `patientid` int(11) NOT NULL AUTO_INCREMENT,
  `pfname` varchar(45) NOT NULL,
  `plname` varchar(45) NOT NULL,
  `pdob` date NOT NULL,
  PRIMARY KEY (`patientid`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patientsData`
--

LOCK TABLES `patientsData` WRITE;
/*!40000 ALTER TABLE `patientsData` DISABLE KEYS */;
INSERT INTO `patientsData` VALUES (1,'Ben','Lee','1993-10-28'),(2,'Hunan','Lee','1992-09-10'),(24,'John','Flo','1993-10-28'),(25,'John','John','1993-10-28'),(26,'John','John','1993-10-28'),(27,'John','John','1993-10-28'),(28,'John','John','1993-10-28'),(29,'John','John','1993-10-28'),(30,'John','John','1993-10-28'),(31,'John','John','1993-10-28'),(32,'John','John','1993-10-28'),(33,'John','John','1993-10-28'),(34,'John','John','1993-10-28'),(35,'John','John','1993-10-28'),(36,'John','John','1993-10-28'),(37,'John','John','1993-10-28'),(38,'John','John','1993-10-28'),(39,'John','John','1993-10-28'),(40,'John','John','1993-10-28'),(41,'John','John','1993-10-28'),(42,'John','John','1993-10-28'),(43,'John','John','1993-10-28'),(44,'John','John','1993-10-28'),(45,'John','John','1993-10-28'),(46,'John','Flo','1993-10-28'),(47,'John','John','1993-10-28'),(48,'John','John','1993-10-28'),(49,'John','John','1993-10-28'),(50,'John','John','1993-10-28'),(51,'John','John','1993-10-28'),(52,'John','John','1993-10-28'),(53,'John','John','1993-10-28'),(54,'John','John','1993-10-28'),(55,'John','John','1993-10-28'),(56,'John','John','1993-10-28'),(57,'John','John','1993-10-28'),(58,'John','John','1993-10-28'),(59,'John','John','1993-10-28'),(60,'John','John','1993-10-28'),(61,'John','John','1993-10-28'),(62,'John','John','1993-10-28'),(63,'John','John','1993-10-28'),(64,'John','John','1993-10-28'),(65,'John','John','1993-10-28'),(66,'John','John','1993-10-28'),(67,'John','John','1993-10-28');
/*!40000 ALTER TABLE `patientsData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `providersData`
--

DROP TABLE IF EXISTS `providersData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `providersData` (
  `providerid` int(11) NOT NULL AUTO_INCREMENT,
  `prousername` varchar(45) NOT NULL,
  `profname` varchar(45) NOT NULL,
  `prolname` varchar(45) NOT NULL,
  `proemail` varchar(45) NOT NULL,
  `propassword` varchar(512) NOT NULL,
  PRIMARY KEY (`providerid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `providersData`
--

LOCK TABLES `providersData` WRITE;
/*!40000 ALTER TABLE `providersData` DISABLE KEYS */;
INSERT INTO `providersData` VALUES (1,'xyq163446','Anthony','Chung','xyq163446@gmail.com','B109F3BBBC244EB82441917ED06D618B9008DD09B3BEFD1B5E07394C706A8BB980B1D7785E5976EC049B46DF5F1326AF5A2EA6D103FD07C95385FFAB0CACBC86');
/*!40000 ALTER TABLE `providersData` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `surveyData`
--

DROP TABLE IF EXISTS `surveyData`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `surveyData` (
  `surveyid` int(11) NOT NULL AUTO_INCREMENT,
  `patientid` int(11) NOT NULL,
  `question1` text NOT NULL,
  `question2` text NOT NULL,
  `question3` text NOT NULL,
  PRIMARY KEY (`surveyid`),
  KEY `patientid_idx` (`patientid`),
  CONSTRAINT `patientid_fk` FOREIGN KEY (`patientid`) REFERENCES `patientsData` (`patientid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `surveyData`
--

LOCK TABLES `surveyData` WRITE;
/*!40000 ALTER TABLE `surveyData` DISABLE KEYS */;
INSERT INTO `surveyData` VALUES (1,1,'Q1A','Q2A','Q3A');
/*!40000 ALTER TABLE `surveyData` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-20 13:43:05
