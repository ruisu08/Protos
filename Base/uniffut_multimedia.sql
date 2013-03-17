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
-- Table structure for table `multimedia`
--

DROP TABLE IF EXISTS `multimedia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `multimedia` (
  `idMultimedia` int(11) NOT NULL AUTO_INCREMENT,
  `fuenteGrafica` varchar(500) NOT NULL,
  `comentario` varchar(200) DEFAULT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`idMultimedia`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (1,'&lt;p&gt;&lt;img src=&quot;../../UserFiles/Atrapitis.gif&quot; alt=&quot;fdfdfd&quot; width=&quot;288&quot; height=&quot;374&quot; /&gt;&lt;/p&gt;','Test',1),(2,'&lt;p&gt;&lt;img src=&quot;/UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;fgfgfg&quot; width=&quot;550&quot; height=&quot;400&quot; /&gt;&lt;/p&gt;','Test',1),(3,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/embed/labytsb3gfI&quot; frameborder=&quot;0&quot; width=&quot;425&quot; height=&quot;350&quot; /&gt;&lt;/p&gt;','Mastodon Rocks',1),(4,'&lt;p&gt;&lt;img src=&quot;/UserFiles/Misc-FuckOff.jpg&quot; alt=&quot;dfdff&quot; width=&quot;306&quot; height=&quot;518&quot; /&gt;&lt;/p&gt;','sdfsdf',1),(5,'&lt;p&gt;&lt;img src=&quot;/UserFiles/Atrapitis.gif&quot; alt=&quot;gfgf&quot; width=&quot;288&quot; height=&quot;374&quot; /&gt;&lt;/p&gt;','ghghg',1),(6,'&lt;p&gt;&lt;img src=&quot;/UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;&quot; width=&quot;550&quot; height=&quot;400&quot; /&gt;&lt;/p&gt;','ggggggggggg',1),(7,'&lt;p&gt;&lt;img src=&quot;/UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;&quot; width=&quot;550&quot; height=&quot;400&quot; /&gt;&lt;/p&gt;','gfgfgfgfgf',1),(8,'&lt;p&gt;&lt;img title=&quot;fdfdfd&quot; src=&quot;/UserFiles/Misc-FuckOff.jpg&quot; alt=&quot;fdfdffffffffff&quot; width=&quot;306&quot; height=&quot;518&quot; /&gt;&lt;/p&gt;','dfdfdfdfdfdfd',1),(9,'&lt;p&gt;&lt;img title=&quot;fdfdfdf&quot; src=&quot;http://static.elandroidelibre.com/wp-content/uploads/2012/04/futbol.jpg&quot; alt=&quot;dfdfd&quot; width=&quot;1024&quot; height=&quot;768&quot; /&gt;&lt;/p&gt;','dsfdfdfdfd',1),(11,'&lt;p&gt;&lt;img title=&quot;dfdfd&quot; src=&quot;http://www.youtube.com/watch?v=8ue8eDrQZKg&quot; alt=&quot;dfdf&quot; /&gt;&lt;/p&gt;','fdfdfdfd',1),(12,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','Mastodon Rocks',1),(13,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','Mastodon Rocks',1),(14,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=TsdIO8RHMTc&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;','Video',1),(15,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','Mastodon Rocks',1),(16,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=sYVooUE2Rz8&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;','BB',1);
/*!40000 ALTER TABLE `multimedia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-18 12:11:09
