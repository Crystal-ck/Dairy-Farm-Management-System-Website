-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dms
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `alert`
--

DROP TABLE IF EXISTS `alert`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alert` (
  `alert_id` int NOT NULL AUTO_INCREMENT,
  `alert_type` varchar(50) DEFAULT NULL,
  `message` text NOT NULL,
  `related_cow_id` int DEFAULT NULL,
  `related_stock_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`alert_id`),
  KEY `related_cow_id` (`related_cow_id`),
  KEY `related_stock_id` (`related_stock_id`),
  CONSTRAINT `alert_ibfk_1` FOREIGN KEY (`related_cow_id`) REFERENCES `cow` (`cow_id`) ON DELETE SET NULL,
  CONSTRAINT `alert_ibfk_2` FOREIGN KEY (`related_stock_id`) REFERENCES `feeding` (`stock_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alert`
--

LOCK TABLES `alert` WRITE;
/*!40000 ALTER TABLE `alert` DISABLE KEYS */;
INSERT INTO `alert` VALUES (3,'Low Stock','Feed stock is low for Hay (Only 70kg left)',NULL,305,'2025-07-07 19:59:49'),(5,'Low Stock','Feed stock is low for Hay (Only 70kg left)',NULL,305,'2025-07-07 20:28:08'),(6,'Health','Cow Bessie (#113) has an injured leg',113,NULL,'2025-07-07 20:28:44');
/*!40000 ALTER TABLE `alert` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `breeding`
--

DROP TABLE IF EXISTS `breeding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `breeding` (
  `breeding_id` int NOT NULL AUTO_INCREMENT,
  `cow_id` int DEFAULT NULL,
  `inseminator_id` int DEFAULT NULL,
  `inseminator_name` varchar(50) DEFAULT NULL,
  `pregnancy_start` date DEFAULT NULL,
  `gestation_days` int DEFAULT NULL,
  `calving_date` date DEFAULT NULL,
  PRIMARY KEY (`breeding_id`),
  KEY `cow_id` (`cow_id`),
  CONSTRAINT `breeding_ibfk_1` FOREIGN KEY (`cow_id`) REFERENCES `cow` (`cow_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `breeding`
--

LOCK TABLES `breeding` WRITE;
/*!40000 ALTER TABLE `breeding` DISABLE KEYS */;
/*!40000 ALTER TABLE `breeding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cow`
--

DROP TABLE IF EXISTS `cow`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cow` (
  `cow_id` int NOT NULL AUTO_INCREMENT,
  `cow_name` varchar(50) NOT NULL,
  `cow_age` int DEFAULT NULL,
  `cow_breed` varchar(50) DEFAULT NULL,
  `cow_weight` decimal(6,2) DEFAULT NULL,
  `health_status` enum('Healthy','Sick','Injured') DEFAULT 'Healthy',
  `milk_yield` decimal(6,2) DEFAULT NULL,
  `breeding_id` int DEFAULT NULL,
  PRIMARY KEY (`cow_id`),
  CONSTRAINT `cow_chk_1` CHECK ((`cow_age` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=114 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cow`
--

LOCK TABLES `cow` WRITE;
/*!40000 ALTER TABLE `cow` DISABLE KEYS */;
INSERT INTO `cow` VALUES (113,'Bessie',4,'Jersey',450.50,'Injured',34.50,NULL);
/*!40000 ALTER TABLE `cow` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feeding`
--

DROP TABLE IF EXISTS `feeding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `feeding` (
  `stock_id` int NOT NULL AUTO_INCREMENT,
  `feed_type` varchar(50) NOT NULL,
  `quantity_in_stock` decimal(8,2) DEFAULT '0.00',
  `supplier` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=306 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feeding`
--

LOCK TABLES `feeding` WRITE;
/*!40000 ALTER TABLE `feeding` DISABLE KEYS */;
INSERT INTO `feeding` VALUES (305,'Hay',70.00,'Fresh Milk Org');
/*!40000 ALTER TABLE `feeding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` varchar(10) NOT NULL,
  `name` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-07 23:37:32
