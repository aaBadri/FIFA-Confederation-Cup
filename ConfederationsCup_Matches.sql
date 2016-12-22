CREATE DATABASE  IF NOT EXISTS `ConfederationsCup` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `ConfederationsCup`;
-- MySQL dump 10.13  Distrib 5.5.53, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: ConfederationsCup
-- ------------------------------------------------------
-- Server version	5.5.53-0ubuntu0.14.04.1

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
-- Table structure for table `Matches`
--

DROP TABLE IF EXISTS `Matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Matches` (
  `matchId` int(11) NOT NULL,
  `teamName1` varchar(30) NOT NULL,
  `teamName2` varchar(30) NOT NULL,
  `goalNumber1` int(11) NOT NULL,
  `goalNumber2` int(11) NOT NULL,
  `stadiumName` varchar(20) NOT NULL,
  `refereeId1` int(6) NOT NULL,
  `refereeId2` int(6) NOT NULL,
  `refereeId3` int(6) NOT NULL,
  `refereeId4` int(6) NOT NULL,
  `round` int(6) NOT NULL,
  `teamName` varchar(30) NOT NULL,
  `timeSlotId` int(6) NOT NULL,
  PRIMARY KEY (`matchId`),
  KEY `teamName1` (`teamName1`),
  KEY `teamName2` (`teamName2`),
  KEY `stadiumName` (`stadiumName`),
  KEY `refereeId1` (`refereeId1`),
  KEY `refereeId2` (`refereeId2`),
  KEY `refereeId3` (`refereeId3`),
  KEY `refereeId4` (`refereeId4`),
  KEY `timeSlotId` (`timeSlotId`),
  CONSTRAINT `Matches_ibfk_1` FOREIGN KEY (`teamName1`) REFERENCES `Teams` (`teamName`),
  CONSTRAINT `Matches_ibfk_2` FOREIGN KEY (`teamName2`) REFERENCES `Teams` (`teamName`),
  CONSTRAINT `Matches_ibfk_3` FOREIGN KEY (`stadiumName`) REFERENCES `Stadiums` (`stadiumName`),
  CONSTRAINT `Matches_ibfk_4` FOREIGN KEY (`refereeId1`) REFERENCES `Referees` (`id`),
  CONSTRAINT `Matches_ibfk_5` FOREIGN KEY (`refereeId2`) REFERENCES `Referees` (`id`),
  CONSTRAINT `Matches_ibfk_6` FOREIGN KEY (`refereeId3`) REFERENCES `Referees` (`id`),
  CONSTRAINT `Matches_ibfk_7` FOREIGN KEY (`refereeId4`) REFERENCES `Referees` (`id`),
  CONSTRAINT `Matches_ibfk_8` FOREIGN KEY (`timeSlotId`) REFERENCES `TimeSlot` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-22 14:46:28
