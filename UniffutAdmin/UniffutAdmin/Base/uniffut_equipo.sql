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
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipo` (
  `idEquipo` int(11) NOT NULL AUTO_INCREMENT,
  `abreviatura` varchar(10) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `historia` varchar(500) NOT NULL,
  `campeonatosGanados` int(11) NOT NULL,
  `idDivision` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `escudo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `fk_Equipo_Divisiones1_idx` (`idDivision`),
  CONSTRAINT `fk_Equipo_Divisiones1` FOREIGN KEY (`idDivision`) REFERENCES `division` (`idDivisiones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (10,'LDA','Liga Deportiva Alajuelense','&lt;p&gt;&lt;img style=&quot;display: block; margin-left: auto; margin-right: auto;&quot; src=&quot;../../UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;TOME!!!&quot; width=&quot;378&quot; height=&quot;225&quot; /&gt;&lt;/p&gt;\r\n&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: large; font-family: impact, chicago;&quot;&gt;Esto es para voooooz!!&lt;/span&gt;&lt;/p&gt;',0,3,1,NULL),(11,'CSC','Club Sport Cartagines','&lt;p&gt;&lt;img src=&quot;../../UserFiles/Misc-FuckOff.jpg&quot; alt=&quot;Fuck Off&quot; width=&quot;306&quot; height=&quot;518&quot; /&gt;&lt;/p&gt;',0,3,1,NULL),(12,'CSH','Club Sport Herediano','&lt;p style=&quot;text-align: center;&quot;&gt;&lt;span style=&quot;font-size: xx-large; font-family: impact, chicago;&quot;&gt;Si se va a hacer el mundial&lt;/span&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;img style=&quot;display: block; margin-left: auto; margin-right: auto;&quot; src=&quot;../../UserFiles/Atrapitis.gif&quot; alt=&quot;fdfd&quot; width=&quot;288&quot; height=&quot;374&quot; /&gt;&lt;/p&gt;\r\n&lt;p&gt;&lt;br /&gt;&lt;br /&gt;&lt;/p&gt;',0,3,1,NULL);
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-09 12:24:08