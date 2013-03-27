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
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `multimedia`
--

LOCK TABLES `multimedia` WRITE;
/*!40000 ALTER TABLE `multimedia` DISABLE KEYS */;
INSERT INTO `multimedia` VALUES (21,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;fdfdfd&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','fdfdfdfdf',0),(22,'&lt;p&gt;&lt;img src=&quot;/UserFiles/2628376325_68c642a9ee_o.png&quot; alt=&quot;fdfdfdfd&quot; width=&quot;550&quot; height=&quot;400&quot; /&gt;&lt;/p&gt;','fdfdfdfd',0),(23,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','sds',0),(24,'&lt;p&gt;&lt;img src=&quot;/UserFiles/Atrapitis.gif&quot; alt=&quot;&quot; width=&quot;288&quot; height=&quot;374&quot; /&gt;&lt;/p&gt;','x',0),(25,'&lt;p&gt;&lt;img src=&quot;/UserFiles/Atrapitis.gif&quot; alt=&quot;fdfdf&quot; width=&quot;288&quot; height=&quot;374&quot; /&gt;&lt;/p&gt;','dfdfdfdd',1),(26,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;dfdfd&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','dfdfdfdd',1),(27,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?NR=1&amp;amp;feature=endscreen&amp;amp;v=f3LLX9ThXjI&quot; alt=&quot;dsds&quot; /&gt;&lt;/p&gt;','dfdfdfdd',0),(28,'&lt;p&gt;&lt;img src=&quot;http://www.eldiariony.com/apps/pbcsi.dll/storyimage/IM/20130108/DEPORTES04/130109466/AR/0/AR-130109466.jpg&amp;amp;imageversion=Article&quot; alt=&quot;&quot; width=&quot;953&quot; height=&quot;733&quot; /&gt;&lt;/p&gt;','dsdsd',1),(29,'&lt;p&gt;&lt;img src=&quot;/UserFiles/1361_photo.jpg&quot; alt=&quot;fgfgfg&quot; width=&quot;600&quot; height=&quot;485&quot; /&gt;&lt;/p&gt;','fgfgf',1),(30,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=XcvHk-vN088&quot; alt=&quot;sdf&quot; /&gt;&lt;/p&gt;','sdsdsd',1),(31,'&lt;p&gt;&lt;img title=&quot;fdf&quot; src=&quot;http://www.youtube.com/watch?v=2nkeBG0nh84&quot; alt=&quot;fdf&quot; /&gt;&lt;/p&gt;','dfdfd',1),(32,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=D55PP3IJ0xo&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;','fdfdfdfdf',1),(33,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=XnSuVev5fVc&quot; alt=&quot;fd&quot; /&gt;&lt;/p&gt;','sdfdf',1),(34,'&lt;p&gt;&lt;img src=&quot;http://cdn.pocket-lint.com/images/JtKM/porsche-cayman-pictures-and-hands-on-0.jpg?20121130-191448&quot; alt=&quot;fd&quot; width=&quot;960&quot; height=&quot;641&quot; /&gt;&lt;/p&gt;','dfdfs',1),(35,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=c9N8svHfwD0&quot; alt=&quot;fdf&quot; /&gt;&lt;/p&gt;','fdfdf',1),(36,'&lt;p&gt;&lt;img src=&quot;http://www.youtube.com/watch?v=wJnv2CdcYRI&quot; alt=&quot;&quot; /&gt;&lt;/p&gt;','dfdfdf',1);
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

-- Dump completed on 2013-03-27 13:42:40
