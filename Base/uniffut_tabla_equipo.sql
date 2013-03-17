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
-- Table structure for table `tabla_equipo`
--

DROP TABLE IF EXISTS `tabla_equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabla_equipo` (
  `idTabla` int(11) NOT NULL,
  `idEquipo` int(11) NOT NULL,
  `puntos` int(3) NOT NULL,
  PRIMARY KEY (`idTabla`,`idEquipo`),
  KEY `equipo_tabla_idx` (`idEquipo`),
  KEY `tabla_tabla_idx` (`idTabla`),
  CONSTRAINT `equipo_tabla` FOREIGN KEY (`idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `tabla_tabla` FOREIGN KEY (`idTabla`) REFERENCES `tabla_posiciones` (`idTabla`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabla_equipo`
--

LOCK TABLES `tabla_equipo` WRITE;
/*!40000 ALTER TABLE `tabla_equipo` DISABLE KEYS */;
INSERT INTO `tabla_equipo` VALUES (6,16,0),(6,17,0),(6,18,0),(6,22,0),(6,23,0),(6,25,0),(6,27,0),(7,19,0),(7,20,0),(7,21,0),(7,24,0),(7,26,0),(7,28,0);
/*!40000 ALTER TABLE `tabla_equipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-18 12:11:21
