CREATE DATABASE  IF NOT EXISTS `uniffut` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `uniffut`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: uniffut
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `album_multimedia_equipo`
--

DROP TABLE IF EXISTS `album_multimedia_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `album_multimedia_equipo` (
  `idAlbum` int(11) NOT NULL,
  `idMultimedia` int(11) NOT NULL,
  PRIMARY KEY (`idAlbum`,`idMultimedia`),
  KEY `R_albumEquipo_multimedia_idx` (`idAlbum`),
  KEY `R_albumEquipo_multimedia_idx1` (`idMultimedia`),
  CONSTRAINT `R_albumEquipo_multimedia` FOREIGN KEY (`idAlbum`) REFERENCES `album_equipo` (`idAlbum_Equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `R_multimedia_albumEquipo` FOREIGN KEY (`idMultimedia`) REFERENCES `multimedia` (`idMultimedia`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `album_multimedia_equipo`
--

LOCK TABLES `album_multimedia_equipo` WRITE;
/*!40000 ALTER TABLE `album_multimedia_equipo` DISABLE KEYS */;
INSERT INTO `album_multimedia_equipo` VALUES (1,26),(1,27),(1,28),(1,32),(1,33),(1,34),(1,35);
/*!40000 ALTER TABLE `album_multimedia_equipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-25 22:28:06
