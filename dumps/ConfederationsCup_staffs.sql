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
-- Table structure for table `staffs`
--

DROP TABLE IF EXISTS `staffs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staffs` (
  `staffId` int(11) NOT NULL AUTO_INCREMENT,
  `staffName` varchar(30) NOT NULL,
  `staffFamily` varchar(30) NOT NULL,
  `teamName` varchar(30) NOT NULL,
  `post` varchar(30) NOT NULL,
  PRIMARY KEY (`staffId`),
  KEY `teamName` (`teamName`),
  CONSTRAINT `staffs_ibfk_1` FOREIGN KEY (`teamName`) REFERENCES `Teams` (`teamName`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staffs`
--

LOCK TABLES `staffs` WRITE;
/*!40000 ALTER TABLE `staffs` DISABLE KEYS */;
INSERT INTO `staffs` VALUES (1,'Luiz','Scolari','Brazil','coach'),(2,'Vicente','delBosque','Spain','coach'),(3,'Alberto','Zaccheroni','Japan','coach'),(4,'Miguel','Herrera','Mexico','coach'),(5,'Oscar','Tabarez','Uruguay','coach'),(6,'Eddy','Etaeta','Tahiti','coach'),(7,'Cesare','Prandelli','Italy','coach'),(8,'Stephen','Keshi','Nigeria','coach'),(9,'Faye','Abbott','Brazil','coachassistant1'),(10,'Frankie','Albert','Spain','coachassistant1'),(11,'Doc','Alexander','Japan','coachassistant1'),(12,'George','Allen','Mexico','coachassistant1'),(13,'Hunk','Anderson','Uruguay','coachassistant1'),(14,'Roy','Andrews','Tahiti','coachassistant1'),(15,'Neill','Armstrong','Italy','coachassistant1'),(16,'Bill','Arnsparger','Nigeria','coachassistant1'),(17,'Joe','Bach','Brazil','coachassistant2'),(18,'Herman',' Ball','Spain','coachassistant2'),(19,'Shorty','Barr','Japan','coachassistant2'),(20,'Norm','Barry','Mexico','coachassistant2'),(21,'Jim','Bates','Uruguay','coachassistant2'),(22,'Dim','Batterson','Tahiti','coachassistant2'),(23,'Cliff','Battles','Italy','coachassistant2'),(24,'Sammy','Baugh','Nigeria','coachassistant2'),(25,'Bull','Behman','Brazil','supervisor'),(26,'Bill','Belichick','Spain','supervisor'),(27,'Phil','Bengtson','Japan','supervisor'),(28,'Leeman','Bennett','Mexico','supervisor'),(29,'Raymond','Berry','Uruguay','supervisor'),(30,'Tom','Bettis','Tahiti','supervisor'),(31,'Scotty','Bierce','Italy','supervisor');
/*!40000 ALTER TABLE `staffs` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER staff_insert
BEFORE INSERT
ON staffs
FOR EACH ROW
BEGIN
	DECLARE msg varchar(255);
	SELECT COUNT(*) INTO @cnt FROM staffs where teamName = NEW.teamName;
	IF @cnt >= 4 THEN
		SET msg = 'more than 4';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	END IF;
	IF NEW.post != 'coach' and NEW.post != 'coachassistant1' and NEW.post != 'coachassistant2' and NEW.post != 'supervisor' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid post.it must be on of : coach,coachassistant1,coachassistant2,supervisor';
	END if;
	IF NEW.teamName != 'Brazil' and NEW.teamName != 'Japan' and NEW.teamName != 'Mexico' and NEW.teamName != 'Italy' and NEW.teamName != 'Nigeria' and NEW.teamName != 'Tahiti' and NEW.teamName != 'Uruguay' and NEW.teamName != 'Spain' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid country name.it must be one of : Brazil,Japan,Mexico,Italy,Nigeria,Tahiti,Uruguay,Spain';
	END if;
	IF (EXISTS(SELECT * FROM staffs WHERE teamName = NEW.teamName and post = NEW.post)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'exists a row with this post and country';
	END IF;
	
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER staff_uppdate
BEFORE update
ON staffs
FOR EACH ROW
BEGIN
	DECLARE msg varchar(255);
	SELECT COUNT(*) INTO @cnt FROM staffs where teamName = NEW.teamName;
	IF @cnt >= 4 THEN
		SET msg = 'more than 4';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	END IF;
	IF NEW.post != 'coach' and NEW.post != 'coachassistant1' and NEW.post != 'coachassistant2' and NEW.post != 'supervisor' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid post.it must be on of : coach,coachassistant1,coachassistant2,supervisor';
	END if;
	IF NEW.teamName != 'Brazil' and NEW.teamName != 'Japan' and NEW.teamName != 'Mexico' and NEW.teamName != 'Italy' and NEW.teamName != 'Nigeria' and NEW.teamName != 'Tahiti' and NEW.teamName != 'Uruguay' and NEW.teamName != 'Spain' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid country name.it must be one of : Brazil,Japan,Mexico,Italy,Nigeria,Tahiti,Uruguay,Spain';
	END if;
	IF (EXISTS(SELECT * FROM staffs WHERE teamName = NEW.teamName and post = NEW.post)) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'exists a row with this post and country';
	END IF;
	
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
