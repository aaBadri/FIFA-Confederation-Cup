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
-- Table structure for table `Players`
--

DROP TABLE IF EXISTS `Players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Players` (
  `playerId` int(11) NOT NULL AUTO_INCREMENT,
  `post` varchar(20) NOT NULL,
  `playerName` varchar(30) NOT NULL,
  `playerFamily` varchar(30) NOT NULL,
  `teamName` varchar(30) NOT NULL,
  `goal` int(6) unsigned zerofill DEFAULT '000000',
  PRIMARY KEY (`playerId`),
  KEY `teamName` (`teamName`),
  CONSTRAINT `Players_ibfk_1` FOREIGN KEY (`teamName`) REFERENCES `Teams` (`teamName`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Players`
--

LOCK TABLES `Players` WRITE;
/*!40000 ALTER TABLE `Players` DISABLE KEYS */;
INSERT INTO `Players` VALUES (1,'GK','Jefferson','Oliveira','Brazil',000000),(2,'DF','Dani','Alves','Brazil',000000),(3,'DF','Thiago','Silva','Brazil',000000),(4,'DF','David','Luiz','Brazil',000000),(5,'MF','Fernando','Martins','Brazil',000000),(6,'DF','Marcelo','Vieira','Brazil',000000),(7,'MF','Lucas','Rodrigues','Brazil',000003),(8,'MF','Anderson','Hernanes','Brazil',000000),(9,'FW','Frederico','Chaves','Brazil',000002),(10,'FW','Neymar','Silva','Brazil',000006),(11,'MF','Oscar','Santos','Brazil',000002),(12,'GK','Julio','Cesar','Brazil',000000),(13,'DF','Dante','Bonfim','Brazil',000000),(14,'DF','Filipe','Luis','Brazil',000000),(15,'MF','Jean','Raphael','Brazil',000000),(16,'DF','Rever','Humberto','Brazil',000000),(17,'MF','Luiz','Gustavo','Brazil',000000),(18,'MF','Jose','Paulo','Brazil',000000),(19,'FW','Givanildo','Vieira','Brazil',000000),(20,'MF','Bernard','Anicio','Brazil',000000),(21,'FW','Leandro','Damiao','Brazil',000000),(22,'GK','Diego','Cavalieri','Brazil',000000),(23,'GK','Eiji','Kawashima','Japan',000000),(24,'DF','Masahiko','Inoha','Japan',000000),(25,'DF','Gotoku','Sakai','Japan',000000),(26,'MF','Keisuke','Honda','Japan',000000),(27,'DF','Yuto','Nagatomo','Japan',000000),(28,'DF','Atsuto','Uchida','Japan',000000),(29,'FW','Hiroshi','Kiyotake','Japan',000000),(30,'FW','Shinji','Okazaki','Japan',000000),(31,'FW','Shinji','Kagawa','Japan',000001),(32,'FW','Mike','Havenaar','Japan',000001),(33,'GK','Shusaku','Nishikawa','Japan',000002),(34,'MF','Hajime','Hosogai','Japan',000000),(35,'MF','Kengo','Nakamura','Japan',000000),(36,'DF','Yasuyuki','Konno','Japan',000000),(37,'DF','Yuzo','Kurihara','Japan',000000),(38,'MF','Makoto','Hasebe','Japan',000000),(39,'FW','Ryoichi','Maeda','Japan',000000),(40,'FW','Takashi','Inui','Japan',000000),(41,'MF','Hideto','Takahashi','Japan',000000),(42,'MF','Shuichi','Gonda','Japan',000000),(43,'DF','Hiroki','Sakai','Japan',000000),(44,'DF','Maya','Yoshida','Japan',000000),(45,'GK','Guillermo','Ochoa','Mexico',000000),(46,'DF','Francisco','Rodriguez','Mexico',000000),(47,'DF','Carlos','Salcido','Mexico',000000),(48,'MF','Diego','Reyes','Mexico',000000),(49,'MF','Gerardo','Torrado','Mexico',000000),(50,'MF','Pablo','Barrera','Mexico',000000),(51,'MF','Angel','Reyna','Mexico',000001),(52,'FW','Aldo','Nigris','Mexico',000002),(53,'FW','Giovani','Santos','Mexico',000000),(54,'MF','Javier','Aquino','Mexico',000000),(55,'GK','Jesus','Corona','Mexico',000000),(56,'DF','Severo','Meza','Mexico',000000),(57,'MF','Javier','Hernandez','Mexico',000000),(58,'DF','Hector','Moreno','Mexico',000000),(59,'MF','Hector','Herrera','Mexico',000000),(60,'MF','Jesus','Zavala','Mexico',000000),(61,'MF','Andres','Guardado','Mexico',000000),(62,'FW','Raul','Jimenez','Mexico',000000),(63,'DF','Jorge','Torres','Mexico',000000),(64,'DF','Hiram','Mier','Mexico',000000),(65,'DF','Gerardo','Flores','Mexico',000000),(66,'GF','Alfredo','Talavera','Mexico',000000),(67,'GK','Gianluigi','Buffon','Italy',000000),(68,'DF','Christian','Maggio','Italy',000000),(69,'DF','Giorgio','Chiellini','Italy',000000),(70,'DF','Davide','Astori','Italy',000000),(71,'DF','Mattia','DeSciglio','Italy',000000),(72,'MF','Antonio','Candreva','Italy',000000),(73,'MF','Alberto','Aquilani','Italy',000000),(74,'MF','Claudio','Marchisio','Italy',000000),(75,'FW','Mario','Balotelli','Italy',000005),(76,'FW','Sebastian','Giovinco','Italy',000002),(77,'FW','Alberto','Gilardino','Italy',000000),(78,'GK','Salvatore','Sirigu','Italy',000000),(79,'GK','Federico','Marchetti','Italy',000000),(80,'FW','Stephan','ElShaarawy','Italy',000000),(81,'DF','Andrea','Barzagli','Italy',000000),(82,'MF','Daniele','DeRossi','Italy',000001),(83,'FW','Alessio','Cerci','Italy',000000),(84,'MF','Riccardo','Montolivo','Italy',000000),(85,'DF','Leonardo','Bonucci','Italy',000000),(86,'DF','Ignazio','Abate','Italy',000000),(87,'MF','Andrea','Pirlo','Italy',000000),(88,'MF','Emanuele','Giaccherini','Italy',000000),(89,'GK','Iker','Casillas','Spain',000000),(90,'DF','Raul','Albiol','Spain',000000),(91,'DF','Gerard','Pique','Spain',000000),(92,'MF','Javi','Martinez','Spain',000000),(93,'DF','Cesar','Azpilicueta','Spain',000000),(94,'MF','Andres','Iniesta','Spain',000002),(95,'FW','David','Villa','Spain',000003),(96,'MF','Xavi','Hernandez','Spain',000000),(97,'FW','Fernando','Torres','Spain',000005),(98,'MF','Cesc','Fabregas','Spain',000000),(99,'FW','Pedro','Rodriguez','Spain',000000),(100,'GK','Victor','Valdes','Spain',000000),(101,'MF','Juan','Mata','Spain',000000),(102,'FW','Roberto','Soldado','Spain',000000),(103,'DF','Sergio','Ramos','Spain',000000),(104,'MF','Sergio','Busquets','Spain',000000),(105,'DF','Alvaro','Arbeloa','Spain',000000),(106,'DF','Jordi','Alba','Spain',000000),(107,'DF','Nacho','Monreal','Spain',000000),(108,'MF','Santi','Cazorla','Spain',000000),(109,'MF','David','Silva','Spain',000001),(110,'MF','Jesus','Navas','Spain',000002),(111,'GK','Fernando','Muslera','Uruguay',000000),(112,'DF','Diego','Lugano','Uruguay',000000),(113,'DF','Diego','Godin','Uruguay',000000),(114,'DF','Sebastian','Coates','Uruguay',000000),(115,'MF','Walter','Gargano','Uruguay',000000),(116,'MF','Alvaro','Pereira','Uruguay',000000),(117,'MF','Cristian','Rodriguez','Uruguay',000000),(118,'MF','Sebastian','Eguren','Uruguay',000000),(119,'FW','Luis','Suarez','Uruguay',000004),(120,'FW','Diego','Forlan','Uruguay',000004),(121,'FW','Abel','Hernandez','Uruguay',000003),(122,'GK','Juan','Castillo','Uruguay',000000),(123,'DF','Matias','Aguirregaray','Uruguay',000000),(124,'MF','Nicolas','Lodeiro','Uruguay',000000),(125,'MF','Diego','Perez','Uruguay',000000),(126,'DF','Maxi','Pereira','Uruguay',000000),(127,'DF','Egidio','Rioa','Uruguay',000000),(128,'FW','Gaston','Ramirez','Uruguay',000000),(129,'DF','Andres','Scotti','Uruguay',000000),(130,'MF','Alvaro','Gonzalez','Uruguay',000000),(131,'FW','Edinson','Cavani','Uruguay',000000),(132,'DF','Martin','Caceres','Uruguay',000000),(133,'GK','Mickael','Roche','Tahiti',000000),(134,'MF','Alvin','Tehau','Tahiti',000000),(135,'FW','Marama','Vahirua','Tahiti',000000),(136,'DF','Teheivarii','Ludivion','Tahiti',000000),(137,'DF','Tamatoa','Wagemann','Tahiti',000000),(138,'MF','Henri','Caroine','Tahiti',000000),(139,'MF','Heimano','Bourebare','Tahiti',000000),(140,'DF','Stephane','Faatiarau','Tahiti',000000),(141,'FW','Teaonui','Tehau','Tahiti',000000),(142,'DF','Nicolas','Vallar','Tahiti',000000),(143,'FW','Stanley','Atani','Tahiti',000001),(144,'DF','Edson','Lemaire','Tahiti',000000),(145,'FW','Steevy','ChongHue','Tahiti',000000),(146,'MF','Rainui','Aroita','Tahiti',000000),(147,'MF','Lorenzo','Tehau','Tahiti',000000),(148,'FW','Ricky','Aitamai','Tahiti',000000),(149,'MF','Jonathan','Tehau','Tahiti',000000),(150,'MF','Yohann','Tihoni','Tahiti',000000),(151,'DF','Vincent','Simon','Tahiti',000000),(152,'DF','Yannick','Vero','Tahiti',000000),(153,'FW','Samuel','Hnanyine','Tahiti',000000),(154,'DF','Gilbert','Meriel','Tahiti',000000),(155,'GK','Vincent','Enyeama','Nigeria',000000),(156,'DF','Godfrey','Oboabona','Nigeria',000000),(157,'DF','Elderson','Echiejile','Nigeria',000000),(158,'MF','John','Ugochukwu','Nigeria',000000),(159,'DF','Efe','Ambrose','Nigeria',000000),(160,'DF','Azubuike','Egwuekwe','Nigeria',000000),(161,'FW','Ahmed','Musa','Nigeria',000000),(162,'FW','Brown','Ideye','Nigeria',000000),(163,'FW','Joseph','Akpala','Nigeria',000000),(164,'MF','John','ObiMikel','Nigeria',000003),(165,'FW','Mohammed','Gambo','Nigeria',000002),(166,'DF','Solomon','Kwambe','Nigeria',000000),(167,'MF','Fegor','Ogude','Nigeria',000000),(168,'FW','Anthony','Ujah','Nigeria',000001),(169,'MF','Michel','Babatunde','Nigeria',000000),(170,'GK','Austin','Ejide','Nigeria',000000),(171,'MF','Ogenyi','Onazi','Nigeria',000000),(172,'MF','Emeka','Eze','Nigeria',000000),(173,'MF','Sunday','Mba','Nigeria',000000),(174,'FW','Nnamdi','Oduamadi','Nigeria',000000),(175,'DF','Francis','Benjamin','Nigeria',000000),(176,'DF','Kenneth','Omeruo','Nigeria',000000);
/*!40000 ALTER TABLE `Players` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Players_insert
BEFORE INSERT
ON Players
FOR EACH ROW
BEGIN
	DECLARE msg varchar(255);
	SELECT COUNT(*) INTO @cnt FROM Players where teamName = NEW.teamName;
	IF @cnt >= 22 THEN
		SET msg = 'more than 22';
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = msg;
	END IF;
	IF NEW.post != 'GK' and NEW.post != 'DF' and NEW.post != 'MF' and NEW.post != 'FW' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid post.it must be on of : GK,DF,MF,FW';
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER Players_update
BEFORE UPDATE
ON Players
FOR EACH ROW
BEGIN
	DECLARE msg varchar(255);
	IF NEW.post != 'GK' and NEW.post != 'DF' and NEW.post != 'MF' and NEW.post != 'FW' THEN 
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid post.it must be on of : GK,DF,MF,FW';
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
