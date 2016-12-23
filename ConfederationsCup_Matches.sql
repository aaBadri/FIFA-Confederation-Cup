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
  `matchId` int(11) NOT NULL AUTO_INCREMENT,
  `teamName1` varchar(30) NOT NULL,
  `teamName2` varchar(30) NOT NULL,
  `goalNumber1` int(11) DEFAULT NULL,
  `goalNumber2` int(11) DEFAULT NULL,
  `stadiumName` varchar(20) NOT NULL,
  `refereeGroupId` int(6) NOT NULL,
  `round` int(6) NOT NULL,
  `timeSlotId` int(6) NOT NULL,
  PRIMARY KEY (`matchId`),
  KEY `teamName1` (`teamName1`),
  KEY `teamName2` (`teamName2`),
  KEY `stadiumName` (`stadiumName`),
  KEY `timeSlotId` (`timeSlotId`),
  KEY `fk_Matches_1_idx` (`refereeGroupId`),
  CONSTRAINT `fk_Matches_1` FOREIGN KEY (`refereeGroupId`) REFERENCES `Referees` (`groupId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Matches_ibfk_1` FOREIGN KEY (`teamName1`) REFERENCES `Teams` (`teamName`),
  CONSTRAINT `Matches_ibfk_2` FOREIGN KEY (`teamName2`) REFERENCES `Teams` (`teamName`),
  CONSTRAINT `Matches_ibfk_3` FOREIGN KEY (`stadiumName`) REFERENCES `Stadiums` (`stadiumName`),
  CONSTRAINT `Matches_ibfk_8` FOREIGN KEY (`timeSlotId`) REFERENCES `TimeSlot` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Matches`
--

LOCK TABLES `Matches` WRITE;
/*!40000 ALTER TABLE `Matches` DISABLE KEYS */;
INSERT INTO `Matches` VALUES (1,'Brazil','Japan',NULL,NULL,'Azadi',1,1,1),(2,'Mexico','Italy',NULL,NULL,'Ghadir',2,1,2),(3,'Spain','Uruguay',NULL,NULL,'Naghsh-e-Jahan',3,1,3),(4,'Tahiti','Nigeria',NULL,NULL,'Sahand',4,1,4),(5,'Brazil','Mexico',NULL,NULL,'Azadi',1,1,5),(6,'Italy','Japan',NULL,NULL,'Ghadir',2,1,6),(7,'Spain','Tahiti',NULL,NULL,'Naghsh-e-Jahan',3,1,7),(8,'Nigeria','Uruguay',NULL,NULL,'Sahand',4,1,8),(9,'Brazil','Italy',NULL,NULL,'Azadi',1,1,9),(10,'Mexico','Japan',NULL,NULL,'Ghadir',2,1,9),(11,'Spain','Nigeria',NULL,NULL,'Naghsh-e-Jahan',3,1,9),(12,'Tahiti','Nigeria',NULL,NULL,'Sahand',4,1,9);
/*!40000 ALTER TABLE `Matches` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Matches_insert
BEFORE INSERT
ON Matches
FOR EACH ROW
BEGIN
	
	set @gn1 = (SELECT groupNumber FROM Teams 
		 where Teams.teamName= new.teamName1  limit 1);

	set @gn2 = (SELECT groupNumber FROM Teams 
		 where Teams.teamName= new.teamName2  limit 1);
	IF new.round = 1 and (@gn1 != @gn2) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'these are not in same group';
	end if;
	IF new.round = 2 and (@gn1 = @gn2) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'these was in a group and it is immposible.';
	end if;

	if exists (SELECT * FROM Matches where new.timeSlotId = timeSlotId and new.refereeGroupId = refereeGroupId) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'concurrent in referee group';
	end if;
	if exists (SELECT * FROM Matches where new.timeSlotId = timeSlotId and new.stadiumName = stadiumName) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'concurrent in stadium';
	end if;
	if new.teamName1 = new.teamName2 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'teamNames are not different!!';
	end if;
	
	SELECT COUNT(*) INTO @gameNumber FROM Matches where teamName1 = NEW.teamName1 or teamName1 = new.teamName2 or teamName2 = new.teamName1 or teamName2 = new.teamName1;
	IF @gameNumber = 2 and new.round = 1 and new.timeSlotId != 9 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'in third match of every team in group round , timeSlotId must be 9';
	elseif @gameNumber >=3 and new.round = 1 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'every team in group round has 3 matches no more!!';
	END IF;

	SELECT COUNT(*) INTO @groupGameNumber FROM Matches where round=1;
	if @groupGameNumber >=12 and new.round =1 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Number of mtches in group round is 12 no more!!';
	end if;
	
	if new.round > 4 then
		signal sqlstate '45000' set message_text = 'round is maximum 4';
	end if;
	
	set @third_time = (SELECT timeSlotId FROM Matches 
		 where Matches.round = 3  limit 1);
	set @final_time = (SELECT timeSlotId FROM Matches 
		 where Matches.round = 4  limit 1);
	if @third_time is null and !(@final_time is null) then
		signal sqlstate '45000' set message_text = 'add match for third palce first';
	end if;
	
	if @third_time > @final_time then
		signal sqlstate '45000' set message_text = 'Round of match for third palce must be less than final match';
	end if;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Matches_update
BEFORE update
ON Matches
FOR EACH ROW
BEGIN
	
	set @gn1 = (SELECT groupNumber FROM Teams 
		 where Teams.teamName= new.teamName1  limit 1);

	set @gn2 = (SELECT groupNumber FROM Teams 
		 where Teams.teamName= new.teamName2  limit 1);
	IF new.round = 1 and (@gn1 != @gn2) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'these are not in same group';
	end if;
	IF new.round = 2 and (@gn1 = @gn2) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'these was in a group and it is immposible.';
	end if;

	if exists (SELECT * FROM Matches where new.timeSlotId = timeSlotId and new.refereeGroupId = refereeGroupId) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'concurrent in referee group';
	end if;
	if exists (SELECT * FROM Matches where new.timeSlotId = timeSlotId and new.stadiumName = stadiumName) then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'concurrent in stadium';
	end if;
	if new.teamName1 = new.teamName2 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'teamNames are not different!!';
	end if;
	
	SELECT COUNT(*) INTO @gameNumber FROM Matches where teamName1 = NEW.teamName1 or teamName1 = new.teamName2 or teamName2 = new.teamName1 or teamName2 = new.teamName1;
	IF @gameNumber = 2 and new.round = 1 and new.timeSlotId != 9 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'in third match of every team in group round , timeSlotId must be 9';
	elseif @gameNumber >=3 and new.round = 1 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'every team in group round has 3 matches no more!!';
	END IF;

	SELECT COUNT(*) INTO @groupGameNumber FROM Matches where round=1;
	if @groupGameNumber >=12 and new.round =1 then
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='Number of mtches in group round is 12 no more!!';
	end if;
	
	if new.round > 4 then
		signal sqlstate '45000' set message_text = 'round is maximum 4';
	end if;
	
	set @third_time = (SELECT timeSlotId FROM Matches 
		 where Matches.round = 3  limit 1);
	set @final_time = (SELECT timeSlotId FROM Matches 
		 where Matches.round = 4  limit 1);
	if @third_time is null and !(@final_time is null) then
		signal sqlstate '45000' set message_text = 'add match for third palce first';
	end if;
	
	if @third_time > @final_time then
		signal sqlstate '45000' set message_text = 'Round of match for third palce must be less than final match';
	end if;
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

-- Dump completed on 2016-12-24  0:09:18
