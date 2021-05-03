-- MySQL dump 10.13  Distrib 8.0.23, for Linux (x86_64)
--
-- Host: localhost    Database: SpotifyClone
-- ------------------------------------------------------
-- Server version	8.0.23-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `albuns`
--

LOCK TABLES `albuns` WRITE;
/*!40000 ALTER TABLE `albuns` DISABLE KEYS */;
INSERT INTO `albuns` VALUES (1,'Envious',1),(2,'Exuberant',1),(3,'Hallowed Steam',4),(4,'Incandescent',3),(5,'Temporary Culture',2);
/*!40000 ALTER TABLE `albuns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Walter Phoenix'),(2,'Freedie Shannon'),(3,'Lance Day'),(4,'Peter Strong');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `artistas_seguidos`
--

LOCK TABLES `artistas_seguidos` WRITE;
/*!40000 ALTER TABLE `artistas_seguidos` DISABLE KEYS */;
INSERT INTO `artistas_seguidos` VALUES (1,1),(2,1),(3,1),(1,2),(4,2),(1,3),(2,3),(3,4);
/*!40000 ALTER TABLE `artistas_seguidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cancoes`
--

LOCK TABLES `cancoes` WRITE;
/*!40000 ALTER TABLE `cancoes` DISABLE KEYS */;
INSERT INTO `cancoes` VALUES (1,'Soul For Us',1),(2,'Reflections Of Magic',1),(3,'Dance With Her Own',1),(4,'Troubles Of My Inner Fire',2),(5,'Time Fireworks',2),(6,'Magic Circus',3),(7,'Honey, So Do I',3),(8,'Sweetie, Let\'s Go Wild',3),(9,'She Knows',3),(10,'Fantasy For Me',4),(11,'Celebration Of More',4),(12,'Rock His Everything',4),(13,'Home Forever',4),(14,'Diamond Power',4),(15,'Honey, Let\'s Be Silly',4),(16,'Thang Of Thunder',5),(17,'Words Of Her Life',5),(18,'Without My Streets',5);
/*!40000 ALTER TABLE `cancoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `historico_de_reproducao`
--

LOCK TABLES `historico_de_reproducao` WRITE;
/*!40000 ALTER TABLE `historico_de_reproducao` DISABLE KEYS */;
INSERT INTO `historico_de_reproducao` VALUES (1,1),(2,2),(4,3),(3,4),(1,6),(3,6),(4,11),(2,13),(1,14),(2,15),(1,16),(3,16),(2,17),(4,18);
/*!40000 ALTER TABLE `historico_de_reproducao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `plano`
--

LOCK TABLES `plano` WRITE;
/*!40000 ALTER TABLE `plano` DISABLE KEYS */;
INSERT INTO `plano` VALUES (1,0.00,'gratuito'),(2,7.99,'familiar'),(3,5.99,'universitário');
/*!40000 ALTER TABLE `plano` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'Thati',23,1),(2,'Cintia',35,2),(3,'Bill',20,3),(4,'Roger',45,1);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-03 15:31:30
