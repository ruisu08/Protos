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
-- Table structure for table `equipo_has_campeonato`
--

DROP TABLE IF EXISTS `equipo_has_campeonato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo_has_campeonato` (
  `Equipo_idEquipo` int(11) NOT NULL,
  `Campeonato_idCampeonato` int(11) NOT NULL,
  `puntos` int(11) DEFAULT NULL,
  `estado` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`Equipo_idEquipo`,`Campeonato_idCampeonato`),
  KEY `fk_Equipo_has_Campeonato_Campeonato1_idx` (`Campeonato_idCampeonato`),
  KEY `fk_Equipo_has_Campeonato_Equipo1_idx` (`Equipo_idEquipo`),
  CONSTRAINT `fk_Equipo_has_Campeonato_Campeonato1` FOREIGN KEY (`Campeonato_idCampeonato`) REFERENCES `campeonato` (`idCampeonato`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Equipo_has_Campeonato_Equipo1` FOREIGN KEY (`Equipo_idEquipo`) REFERENCES `equipo` (`idEquipo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo_has_campeonato`
--

LOCK TABLES `equipo_has_campeonato` WRITE;
/*!40000 ALTER TABLE `equipo_has_campeonato` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo_has_campeonato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-15  1:47:33
