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
  `historia` varchar(2000) DEFAULT NULL,
  `campeonatosGanados` int(11) DEFAULT NULL,
  `idDivision` int(11) NOT NULL,
  `estado` tinyint(1) NOT NULL,
  `escudo` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idEquipo`),
  KEY `fk_Equipo_Divisiones1_idx` (`idDivision`),
  CONSTRAINT `fk_Equipo_Divisiones1` FOREIGN KEY (`idDivision`) REFERENCES `division` (`idDivisiones`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (10,'LDA','Liga Deportiva Alajuelense','&lt;p&gt;&lt;img src=&quot;../../UserFiles/Misc-FuckOff.jpg&quot; alt=&quot;dfdfdf&quot; width=&quot;306&quot; height=&quot;518&quot; /&gt;&lt;/p&gt;',0,3,1,NULL),(11,'CSC','Club Sport Cartagines','<p><img src=\"../../UserFiles/Atrapitis.gif\" alt=\"\" width=\"288\" height=\"374\" /></p>',0,3,0,NULL),(12,'CSH','Club Sport Herediano','&lt;p&gt;&lt;img src=&quot;../../UserFiles/Misc-FuckOff.jpg&quot; alt=&quot;&quot; width=&quot;306&quot; height=&quot;518&quot; /&gt;&lt;/p&gt;',0,3,0,NULL),(13,'CSL','Club Sport Limon','&lt;p&gt;&lt;img src=&quot;../../UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;&quot; width=&quot;550&quot; height=&quot;400&quot; /&gt;&lt;img src=&quot;C:/Users/zombie/Documents/GitHub/Protos/UserFiles/Misc-FuckOff.jpg&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;',0,3,0,NULL),(14,'DS','Deportivo Saprissa','&lt;p&gt;&lt;img src=&quot;../../UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;dfgfdgfgfgf&quot; width=&quot;385&quot; height=&quot;280&quot; /&gt;&lt;/p&gt;',0,3,1,NULL),(15,'CAR','Carmelita','&lt;p&gt;&lt;img src=&quot;../../UserFiles/Atrapitis.gif&quot; alt=&quot;dfdfdd&quot; width=&quot;288&quot; height=&quot;374&quot; /&gt;&lt;/p&gt;\r\n&lt;p&gt;fdfdfdfdfdfdf&lt;/p&gt;',0,3,1,NULL),(16,'URU','Uruguay',NULL,0,3,1,NULL);
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

-- Dump completed on 2013-03-15  1:47:39
