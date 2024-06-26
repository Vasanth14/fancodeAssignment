-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: testfancode
-- ------------------------------------------------------
-- Server version	8.4.0

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
-- Table structure for table `matches`
--

DROP TABLE IF EXISTS `matches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matches` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `tourId` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `format` varchar(50) NOT NULL,
  `startTime` timestamp NOT NULL,
  `endTime` timestamp NOT NULL,
  `recUpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `tourId` (`tourId`),
  CONSTRAINT `matches_ibfk_1` FOREIGN KEY (`tourId`) REFERENCES `tours` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matches`
--

LOCK TABLES `matches` WRITE;
/*!40000 ALTER TABLE `matches` DISABLE KEYS */;
INSERT INTO `matches` VALUES (1,'GT vs RCB',1,1,'T20','2023-04-09 12:30:00','2023-04-09 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(2,'CSK vs MI',1,1,'T20','2023-04-10 12:30:00','2021-04-10 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(3,'LSG vs KXIP',1,1,'T20','2023-04-11 12:30:00','2023-04-11 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(4,'RR vs SRH',1,1,'T20','2023-04-12 12:30:00','2023-04-12 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(5,'BLR vs BEN',2,1,'soccer','2023-04-29 12:30:00','2023-04-29 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(6,'ATK vs MCFC',2,1,'soccer','2023-04-21 12:30:00','2023-04-21 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(7,'KER vs JFC',2,1,'soccer','2023-04-22 12:30:00','2023-04-22 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(8,'IND vs WI',3,1,'ODI','2023-06-10 04:30:00','2023-06-10 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(9,'IND vs WI',3,1,'ODI','2023-06-12 04:30:00','2023-06-12 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(10,'IND vs WI',3,1,'ODI','2023-06-14 04:30:00','2023-06-14 17:30:00','2024-05-30 02:50:09','2024-05-30 02:50:09'),(11,'KER vs JFC',4,1,'soccer','2022-04-09 12:30:00','2022-04-09 17:30:00','2024-05-30 02:50:11','2024-05-30 02:50:11');
/*!40000 ALTER TABLE `matches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `matchId` int DEFAULT NULL,
  `tourId` int DEFAULT NULL,
  `sportId` int DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `match_id` (`matchId`),
  KEY `tour_id` (`tourId`),
  KEY `sport_id` (`sportId`),
  CONSTRAINT `news_ibfk_1` FOREIGN KEY (`matchId`) REFERENCES `matches` (`id`),
  CONSTRAINT `news_ibfk_2` FOREIGN KEY (`tourId`) REFERENCES `tours` (`id`),
  CONSTRAINT `news_ibfk_3` FOREIGN KEY (`sportId`) REFERENCES `sports` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (10,'test title','test desc',1,NULL,1,'2024-05-30 15:02:31'),(11,'test title','test desc',1,NULL,1,'2024-05-30 15:07:58'),(12,'test title','test desc',1,1,NULL,'2024-05-30 15:23:24'),(13,'test title','test desc',NULL,1,1,'2024-05-30 15:24:36');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sports` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `recUpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (1,'Cricket',1,'2024-05-30 02:47:35','2024-05-30 02:47:35'),(2,'Football',1,'2024-05-30 02:47:38','2024-05-30 02:47:38');
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tours`
--

DROP TABLE IF EXISTS `tours`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tours` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `sportId` int NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `startTime` timestamp NOT NULL,
  `endTime` timestamp NOT NULL,
  `recUpdatedAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `sportId` (`sportId`),
  CONSTRAINT `tours_ibfk_1` FOREIGN KEY (`sportId`) REFERENCES `sports` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tours`
--

LOCK TABLES `tours` WRITE;
/*!40000 ALTER TABLE `tours` DISABLE KEYS */;
INSERT INTO `tours` VALUES (1,'Indian Premier League, 2023',1,1,'2023-04-08 18:30:00','2023-05-29 18:30:00','2024-05-30 02:49:05','2024-05-30 02:49:05'),(2,'India Super League, 2023',2,1,'2023-04-20 18:30:00','2023-06-19 18:30:00','2024-05-30 02:49:05','2024-05-30 02:49:05'),(3,'India Tour of West Indies, 2023',1,1,'2023-06-09 18:30:00','2023-06-28 18:30:00','2024-05-30 02:49:05','2024-05-30 02:49:05'),(4,'English Premier League, 2022',2,1,'2022-04-08 18:30:00','2022-05-29 18:30:00','2024-05-30 02:49:07','2024-05-30 02:49:07');
/*!40000 ALTER TABLE `tours` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-30 22:10:00
