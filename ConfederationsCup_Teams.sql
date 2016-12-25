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
-- Table structure for table `Teams`
--

DROP TABLE IF EXISTS `Teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Teams` (
  `teamName` varchar(30) NOT NULL,
  `groupNumber` tinyint(4) NOT NULL,
  `win` int(4) unsigned zerofill NOT NULL,
  `lose` int(4) unsigned zerofill NOT NULL,
  `draw` int(4) unsigned zerofill NOT NULL,
  `goalF` int(4) unsigned zerofill NOT NULL,
  `goalA` int(4) unsigned zerofill NOT NULL,
  `pts` int(4) unsigned zerofill NOT NULL,
  PRIMARY KEY (`teamName`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Teams`
--

LOCK TABLES `Teams` WRITE;
/*!40000 ALTER TABLE `Teams` DISABLE KEYS */;
INSERT INTO `Teams` VALUES ('Brazil',1,0003,0000,0000,0009,0002,0009),('Italy',1,0002,0001,0000,0011,0009,0006),('Japan',1,0000,0003,0000,0004,0009,0000),('Mexico',1,0001,0002,0000,0004,0008,0003),('Nigeria',2,0001,0002,0000,0007,0009,0003),('Spain',2,0003,0000,0000,0015,0001,0009),('Tahiti',2,0000,0003,0000,0001,0042,0000),('Uruguay',2,0002,0001,0000,0015,0004,0006);
/*!40000 ALTER TABLE `Teams` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Teams_insert
BEFORE INSERT
ON Teams
FOR EACH ROW
BEGIN
	DECLARE msg varchar(255);
	SELECT COUNT(teamName) INTO @cnt FROM Teams;
	
	IF NEW.groupNumber != 1 and NEW.groupNumber != 2 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid groupNumber.it must be 1 or 2';
	END if;
	IF NEW.teamName != 'Brazil' and NEW.teamName != 'Japan' and NEW.teamName != 'Mexico' and NEW.teamName != 'Italy' and NEW.teamName != 'Nigeria' and NEW.teamName != 'Tahiti' and NEW.teamName != 'Uruguay' and NEW.teamName != 'Spain' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid country name.it must be one of : Brazil,Japan,Mexico,Italy,Nigeria,Tahiti,Uruguay,Spain';
	END if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = '' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Teams_update
BEFORE UPDATE
ON Teams
FOR EACH ROW
BEGIN
	DECLARE msg varchar(255);
	SELECT COUNT(teamName) INTO @cnt FROM Teams;
	
	IF NEW.groupNumber != 1 and NEW.groupNumber != 2 THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid groupNumber.it must be 1 or 2';
	END if;
	IF NEW.teamName != 'Brazil' and NEW.teamName != 'Japan' and NEW.teamName != 'Mexico' and NEW.teamName != 'Italy' and NEW.teamName != 'Nigeria' and NEW.teamName != 'Tahiti' and NEW.teamName != 'Uruguay' and NEW.teamName != 'Spain' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid country name.it must be one of : Brazil,Japan,Mexico,Italy,Nigeria,Tahiti,Uruguay,Spain';
	END if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-25  4:39:13
