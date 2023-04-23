-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `app_user`
--

DROP TABLE IF EXISTS `app_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone_number` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `cart_id` bigint DEFAULT NULL,
  `wish_list_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKgtujx34ywr423dvoik1f2ljl` (`cart_id`),
  KEY `FKqv7fdn5b17g38xyhoyh0du56e` (`wish_list_id`),
  CONSTRAINT `FKgtujx34ywr423dvoik1f2ljl` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKqv7fdn5b17g38xyhoyh0du56e` FOREIGN KEY (`wish_list_id`) REFERENCES `wish_list` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user`
--

LOCK TABLES `app_user` WRITE;
/*!40000 ALTER TABLE `app_user` DISABLE KEYS */;
INSERT INTO `app_user` VALUES (3,'Odishamnkn','2022-07-06 02:04:14.112643','Subhasis','Khuntia','bisu@','+917381779419','ROLE_USER','2022-07-13 12:35:18.763145','subhasiskhuntia506@gmail.com',2,2),(4,'vivek utterpradesh','2022-07-08 00:43:06.854820','vivek','kumar','Vivek@','111512220','ROLE_USER','2022-07-08 00:43:06.854820','vivek@gmail.com',3,3),(5,'Andhra Pradesh','2022-07-08 00:56:52.454410','sahaj','Shrimal','Sahaj@','2323332','ROLE_USER','2022-07-08 00:56:52.454410','sahajshrimal@gmail.com',4,4),(6,'Mumbai','2022-07-08 01:04:05.748599','Shreya','Thalker','Shreya@','122221212','ROLE_USER','2022-07-08 01:04:05.748599','shreyathalker@gmail.com',5,5),(7,'Kolkata','2022-07-08 01:06:23.115568','Swastika','Kundu','Swastika@','3322554454141','ROLE_USER','2022-07-08 01:06:23.115568','swastikakundu@gmail.com',6,6),(8,'Gorakhpur Up','2022-07-11 12:14:02.091572','Vivek ','Kumar','12345','12255655551','ROLE_USER','2022-07-11 12:14:02.091572','vivek12345@gmail.com',7,7),(9,'Gorakhpur Up','2022-07-12 21:51:11.823505','vivek kumar','Singh','Vivek@','4222221122','ROLE_USER','2022-07-12 21:51:11.823505','viveksingh@gmail.com',8,8);
/*!40000 ALTER TABLE `app_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:49
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `app_user_discounts`
--

DROP TABLE IF EXISTS `app_user_discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_user_discounts` (
  `discounted_user_id` bigint NOT NULL,
  `discounts_id` bigint NOT NULL,
  KEY `FK1abt5v28pd8hcisth1okhrvij` (`discounts_id`),
  KEY `FKmbd1g8hgq33s4qp4tly4n2ers` (`discounted_user_id`),
  CONSTRAINT `FK1abt5v28pd8hcisth1okhrvij` FOREIGN KEY (`discounts_id`) REFERENCES `discounts` (`id`),
  CONSTRAINT `FKmbd1g8hgq33s4qp4tly4n2ers` FOREIGN KEY (`discounted_user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_user_discounts`
--

LOCK TABLES `app_user_discounts` WRITE;
/*!40000 ALTER TABLE `app_user_discounts` DISABLE KEYS */;
INSERT INTO `app_user_discounts` VALUES (4,4),(4,7),(5,7),(3,4),(3,7);
/*!40000 ALTER TABLE `app_user_discounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:49
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (2,'2022-07-06 02:04:14.104633','2022-07-06 02:04:14.104633'),(3,'2022-07-08 00:43:06.850846','2022-07-08 00:43:06.850846'),(4,'2022-07-08 00:56:52.450409','2022-07-08 00:56:52.450409'),(5,'2022-07-08 01:04:05.744599','2022-07-08 01:04:05.744599'),(6,'2022-07-08 01:06:23.112995','2022-07-08 01:06:23.112995'),(7,'2022-07-11 12:14:02.036222','2022-07-11 12:14:02.036222'),(8,'2022-07-12 21:51:11.813104','2022-07-12 21:51:11.813104');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:47
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `cart_items`
--

DROP TABLE IF EXISTS `cart_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `quantity` bigint NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `cart_product_id` bigint DEFAULT NULL,
  `user_cart_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKluhhohh5o63o803wmw0vje0mh` (`cart_product_id`),
  KEY `FKlj0wf3812ra966tn0xeshcqaj` (`user_cart_id`),
  CONSTRAINT `FKlj0wf3812ra966tn0xeshcqaj` FOREIGN KEY (`user_cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `FKluhhohh5o63o803wmw0vje0mh` FOREIGN KEY (`cart_product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=119 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_items`
--

LOCK TABLES `cart_items` WRITE;
/*!40000 ALTER TABLE `cart_items` DISABLE KEYS */;
INSERT INTO `cart_items` VALUES (35,'2022-07-08 00:57:19.395250',9,'2022-07-08 00:57:49.020943',1,4),(36,'2022-07-08 00:57:23.707498',9,'2022-07-08 00:58:43.339625',2,4),(38,'2022-07-08 01:09:52.317947',1,'2022-07-08 01:09:52.317947',53,6),(39,'2022-07-08 01:10:08.472844',1,'2022-07-08 01:10:08.472844',52,6),(94,'2022-07-11 14:35:58.663888',1,'2022-07-11 14:35:58.663888',11,7);
/*!40000 ALTER TABLE `cart_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:49
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `discounts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `discount_name` varchar(255) DEFAULT NULL,
  `discount_percentage` float NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (4,'2022-07-11 14:42:46.001266','Diwali40',40,'2022-07-11 14:42:46.001266'),(7,'2022-07-12 21:48:29.381373','Monsoon30',30,'2022-07-12 21:48:29.381373'),(8,'2022-07-12 23:21:57.492730','EASY10',10,'2022-07-12 23:21:57.492730');
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:48
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_details` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `total_price` bigint NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKq67sjwni6gul2jyc8jh50hh78` (`order_user_id`),
  CONSTRAINT `FKq67sjwni6gul2jyc8jh50hh78` FOREIGN KEY (`order_user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (27,'2022-07-10 02:53:47.873272','random id',1216850,'2022-07-10 02:53:47.873272',3),(28,'2022-07-10 03:01:44.980531','random id',197226,'2022-07-10 03:01:44.980531',3),(29,'2022-07-10 03:06:56.071380','random id',955427,'2022-07-10 03:06:56.071380',3),(30,'2022-07-10 03:16:13.057626','random id',1748222,'2022-07-10 03:16:13.057626',3),(31,'2022-07-10 22:45:10.591341','random id',854956,'2022-07-10 22:45:10.591341',3),(32,'2022-07-10 23:00:37.221415','random id',21972,'2022-07-10 23:00:37.221415',3),(33,'2022-07-10 23:02:07.015984','random id',23997,'2022-07-10 23:02:07.015984',3),(34,'2022-07-10 23:04:08.551511','random id',134997,'2022-07-10 23:04:08.551511',3),(35,'2022-07-10 23:04:58.469849','random id',382495,'2022-07-10 23:04:58.469849',3),(36,'2022-07-10 23:08:27.633201','random id',76499,'2022-07-10 23:08:27.633201',3),(37,'2022-07-10 23:20:49.902101','random id',229497,'2022-07-10 23:20:49.902101',3),(38,'2022-07-11 02:08:45.408421','random id',68784,'2022-07-11 02:08:45.408421',3),(39,'2022-07-11 15:34:41.385203','random id',7824,'2022-07-11 15:34:41.385203',3),(40,'2022-07-11 19:39:37.187104','random id',283952,'2022-07-11 19:39:37.187104',3),(41,'2022-07-11 22:33:55.571246','random id',455,'2022-07-11 22:33:55.571246',3),(42,'2022-07-12 14:49:10.381428','random id',472194,'2022-07-12 14:49:10.381428',3),(43,'2022-07-12 18:02:09.767714','random id',173998,'2022-07-12 18:02:09.767714',3),(44,'2022-07-12 18:04:06.220409','random id',434995,'2022-07-12 18:04:06.220524',3),(45,'2022-07-12 19:32:32.937032','random id',121089,'2022-07-12 19:32:32.937032',3),(46,'2022-07-12 21:39:40.591300','random id',209808,'2022-07-12 21:39:40.591300',3),(47,'2022-07-12 22:06:09.059471','random id',417169,'2022-07-12 22:06:09.059471',4),(48,'2022-07-12 22:06:16.681183','random id',417169,'2022-07-12 22:06:16.681183',4),(49,'2022-07-12 22:06:23.763839','random id',417169,'2022-07-12 22:06:23.763839',4),(50,'2022-07-12 22:06:24.774331','random id',417169,'2022-07-12 22:06:24.774331',4),(51,'2022-07-12 22:06:25.462208','random id',417169,'2022-07-12 22:06:25.462208',4),(52,'2022-07-12 22:06:25.662093','random id',417169,'2022-07-12 22:06:25.662093',4),(53,'2022-07-12 22:06:29.319792','random id',417169,'2022-07-12 22:06:29.319792',4),(54,'2022-07-12 22:06:35.074894','random id',695282,'2022-07-12 22:06:35.075913',4),(55,'2022-07-12 22:06:54.400418','random id',695282,'2022-07-12 22:06:54.400418',4),(56,'2022-07-12 22:06:55.129279','random id',695282,'2022-07-12 22:06:55.129279',4),(57,'2022-07-12 22:06:55.363481','random id',695282,'2022-07-12 22:06:55.363481',4),(58,'2022-07-12 22:06:58.790996','random id',695282,'2022-07-12 22:06:58.790996',4),(59,'2022-07-12 22:07:05.892498','random id',695282,'2022-07-12 22:07:05.892498',4),(60,'2022-07-12 22:07:17.221196','random id',695282,'2022-07-12 22:07:17.221196',4),(61,'2022-07-12 22:09:12.280493','random id',4497,'2022-07-12 22:09:12.280493',4),(62,'2022-07-12 23:28:06.890647','random id',247442,'2022-07-12 23:28:06.890647',4),(63,'2022-07-13 11:59:52.641696','random id',20877,'2022-07-13 11:59:52.641696',3),(64,'2022-07-13 12:35:57.176229','random id',15658,'2022-07-13 12:35:57.176229',3);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:48
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `quantity` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `order_details_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKroqxg3b97n259t79co1tol4an` (`order_details_id`),
  KEY `FK551losx9j75ss5d6bfsqvijna` (`product_id`),
  CONSTRAINT `FK551losx9j75ss5d6bfsqvijna` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `FKroqxg3b97n259t79co1tol4an` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (66,'2022-07-10 02:53:47.874569',6,'2022-07-10 02:53:47.874569',27,1),(67,'2022-07-10 02:53:47.876263',8,'2022-07-10 02:53:47.876263',27,2),(68,'2022-07-10 03:01:44.982167',6,'2022-07-10 03:01:44.982533',28,8),(69,'2022-07-10 03:06:56.072390',2,'2022-07-10 03:06:56.072390',29,2),(70,'2022-07-10 03:16:13.059611',5,'2022-07-10 03:16:13.059611',30,1),(71,'2022-07-10 03:16:13.061614',10,'2022-07-10 03:16:13.061614',30,3),(72,'2022-07-10 03:16:13.062608',1,'2022-07-10 03:16:13.062608',30,4),(73,'2022-07-10 03:16:13.063758',10,'2022-07-10 03:16:13.063758',30,5),(74,'2022-07-10 22:45:10.597797',1,'2022-07-10 22:45:10.598359',31,7),(75,'2022-07-10 22:45:10.602589',3,'2022-07-10 22:45:10.602589',31,13),(76,'2022-07-10 22:45:10.604615',3,'2022-07-10 22:45:10.604615',31,9),(77,'2022-07-10 22:45:10.606594',1,'2022-07-10 22:45:10.606594',31,11),(78,'2022-07-10 22:45:10.610545',1,'2022-07-10 22:45:10.610545',31,12),(79,'2022-07-10 22:45:10.613793',1,'2022-07-10 22:45:10.613793',31,4),(80,'2022-07-10 23:00:37.226335',1,'2022-07-10 23:00:37.226335',32,6),(81,'2022-07-10 23:02:07.019664',3,'2022-07-10 23:02:07.019664',33,9),(82,'2022-07-10 23:04:08.556511',3,'2022-07-10 23:04:08.556511',34,10),(83,'2022-07-10 23:04:58.473848',5,'2022-07-10 23:04:58.473848',35,14),(84,'2022-07-10 23:08:27.638161',1,'2022-07-10 23:08:27.638161',36,12),(85,'2022-07-10 23:20:49.904600',3,'2022-07-10 23:20:49.904600',37,12),(86,'2022-07-11 02:08:45.411372',3,'2022-07-11 02:08:45.411372',38,4),(87,'2022-07-11 15:34:41.399734',6,'2022-07-11 15:34:41.399734',39,16),(88,'2022-07-11 19:39:37.190032',3,'2022-07-11 19:39:37.190032',40,2),(89,'2022-07-11 19:39:37.194040',4,'2022-07-11 19:39:37.194040',40,47),(90,'2022-07-11 19:39:37.195617',1,'2022-07-11 19:39:37.195617',40,7),(91,'2022-07-11 22:33:55.580996',1,'2022-07-11 22:33:55.580996',41,49),(92,'2022-07-12 14:49:10.398676',8,'2022-07-12 14:49:10.398676',42,1),(93,'2022-07-12 14:49:10.403217',1,'2022-07-12 14:49:10.403217',42,2),(94,'2022-07-12 18:02:09.771606',2,'2022-07-12 18:02:09.771606',43,1),(95,'2022-07-12 18:04:06.222803',3,'2022-07-12 18:04:06.222803',44,1),(96,'2022-07-12 19:32:32.942778',1,'2022-07-12 19:32:32.942778',45,7),(97,'2022-07-12 19:32:32.947810',1,'2022-07-12 19:32:32.947810',45,2),(98,'2022-07-12 19:32:32.949815',4,'2022-07-12 19:32:32.949815',45,8),(99,'2022-07-12 21:39:40.594298',5,'2022-07-12 21:39:40.594298',46,6),(100,'2022-07-12 22:06:09.062049',5,'2022-07-12 22:06:09.062049',47,3),(101,'2022-07-12 22:06:09.065444',3,'2022-07-12 22:06:09.065444',47,1),(102,'2022-07-12 22:06:16.686149',5,'2022-07-12 22:06:16.686149',48,3),(103,'2022-07-12 22:06:16.689206',3,'2022-07-12 22:06:16.689206',48,1),(104,'2022-07-12 22:06:23.771832',5,'2022-07-12 22:06:23.771832',49,3),(105,'2022-07-12 22:06:23.776222',3,'2022-07-12 22:06:23.776222',49,1),(106,'2022-07-12 22:06:24.777637',5,'2022-07-12 22:06:24.777637',50,3),(107,'2022-07-12 22:06:24.781199',3,'2022-07-12 22:06:24.781199',50,1),(108,'2022-07-12 22:06:25.468197',5,'2022-07-12 22:06:25.468197',51,3),(109,'2022-07-12 22:06:25.471242',3,'2022-07-12 22:06:25.471242',51,1),(110,'2022-07-12 22:06:25.667524',5,'2022-07-12 22:06:25.667524',52,3),(111,'2022-07-12 22:06:25.672932',3,'2022-07-12 22:06:25.672932',52,1),(112,'2022-07-12 22:06:29.323808',5,'2022-07-12 22:06:29.323808',53,3),(113,'2022-07-12 22:06:29.325800',3,'2022-07-12 22:06:29.325800',53,1),(114,'2022-07-12 22:06:35.078977',4,'2022-07-12 22:06:35.078977',54,3),(115,'2022-07-12 22:06:35.080898',3,'2022-07-12 22:06:35.080898',54,1),(116,'2022-07-12 22:06:54.402397',4,'2022-07-12 22:06:54.402397',55,3),(117,'2022-07-12 22:06:54.403509',3,'2022-07-12 22:06:54.403509',55,1),(118,'2022-07-12 22:06:55.133261',4,'2022-07-12 22:06:55.133261',56,3),(119,'2022-07-12 22:06:55.136287',3,'2022-07-12 22:06:55.136287',56,1),(120,'2022-07-12 22:06:55.368496',4,'2022-07-12 22:06:55.368496',57,3),(121,'2022-07-12 22:06:55.373201',3,'2022-07-12 22:06:55.373201',57,1),(122,'2022-07-12 22:06:58.793996',4,'2022-07-12 22:06:58.793996',58,3),(123,'2022-07-12 22:06:58.795947',3,'2022-07-12 22:06:58.795947',58,1),(124,'2022-07-12 22:07:05.894510',4,'2022-07-12 22:07:05.894510',59,3),(125,'2022-07-12 22:07:05.895521',3,'2022-07-12 22:07:05.896502',59,1),(126,'2022-07-12 22:07:17.224244',4,'2022-07-12 22:07:17.224244',60,3),(127,'2022-07-12 22:07:17.226473',3,'2022-07-12 22:07:17.226928',60,1),(128,'2022-07-12 22:09:12.282412',3,'2022-07-12 22:09:12.282412',61,18),(129,'2022-07-12 23:28:06.892655',4,'2022-07-12 23:28:06.892655',62,1),(130,'2022-07-12 23:28:06.894747',1,'2022-07-12 23:28:06.894747',62,2),(131,'2022-07-12 23:28:06.896290',1,'2022-07-12 23:28:06.896290',62,4),(132,'2022-07-12 23:28:06.899283',4,'2022-07-12 23:28:06.899283',62,7),(133,'2022-07-13 11:59:52.647553',4,'2022-07-13 11:59:52.647553',63,1),(134,'2022-07-13 12:35:57.181234',3,'2022-07-13 12:35:57.181234',64,1);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:48
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `color` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` bigint NOT NULL,
  `sku` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `category_id` bigint DEFAULT NULL,
  `inventory_id` bigint DEFAULT NULL,
  `sales` bigint DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `FKmvkt1rb6tm0gmdlyjyunyykm2` (`brand_id`),
  KEY `FK5cypb0k23bovo3rn1a5jqs6j4` (`category_id`),
  KEY `FKp87odom7p0ufqin9v3t5dmbjv` (`inventory_id`),
  CONSTRAINT `FK5cypb0k23bovo3rn1a5jqs6j4` FOREIGN KEY (`category_id`) REFERENCES `product_category` (`id`),
  CONSTRAINT `FKmvkt1rb6tm0gmdlyjyunyykm2` FOREIGN KEY (`brand_id`) REFERENCES `product_brand` (`id`),
  CONSTRAINT `FKp87odom7p0ufqin9v3t5dmbjv` FOREIGN KEY (`inventory_id`) REFERENCES `product_inventory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'brown','2022-07-02 14:31:11.055237','This Is Furniture Product','furniture1.webp','Indus Solid Wood 3 Seater Sofa Cum Bed In Provincial Teak Finish',8699,'4822','2022-07-13 12:36:54.667381',3,5,1,35),(2,'grey','2022-07-02 14:33:29.172287','This Is beds&mattresses Product','beds&mattresses5.jpg','Avey Solid Wood Queen Size Poster Bed In Provincial Teak Finish',90999,'482859','2022-07-12 23:28:06.853197',3,5,2,3),(3,'black','2022-07-02 14:35:15.332619','This Is Furniture Product','furniture2.webp','Ines Sofa Cum Bed In Chestnut Brown Colour with Storage',86857,'482225','2022-07-12 22:06:35.122132',4,3,3,12),(4,'blue','2022-07-02 14:36:38.563961','This Is Furniture Product','furniture5.webp','Rogelio LHS Sofa Cum Bed With Storage In Slate Grey Colour',29935,'482285','2022-07-12 23:28:06.866207',4,3,4,5),(5,'brown','2022-07-02 14:40:37.150816','Dining','dining10.jpg','Fumiko 4 Seater Dining set in Walnut & Light Grey Finish',27001,'dining40','2022-07-11 19:53:33.432016',4,6,5,10),(6,'blue','2022-07-02 14:46:11.122647','This Is Furniture Product','furniture3.webp','Morris 3 Seater Sofa cum Bed in Royal Blue Colour',46624,'482285','2022-07-12 21:46:18.654789',5,3,6,7),(7,'red','2022-07-02 14:47:58.460625','This Is Furniture Product','furniture4.jpg','Edo Sofa Cum Bed in Brown Colour',22928,'482285','2022-07-12 23:28:06.878648',6,3,7,5),(8,'green','2022-07-02 14:55:13.653229','This Is Storage Product','storage1.webp','Kosmo Coral 2 Door Wardrobe in Drift Wood Finish',21972,'482569','2022-07-12 19:32:32.926590',7,4,8,4),(9,'brown','2022-07-02 14:56:33.512634','This Is Storage Product','storage2.webp','Sun & Moon Wardrobe with Drawer Storage in Multicolour',47336,'482569','2022-07-11 19:53:33.485609',8,4,9,0),(10,'red','2022-07-02 14:57:35.668051','This Is Storage Product','storage3.webp','Winslet 3 Door Wardrobe in Exotic Teak & Frosty White Colour',32871,'482859','2022-07-11 19:53:33.497896',9,4,10,0),(11,'aqua blue','2022-07-02 15:01:09.502081','This Is Storage Product','storage4.webp','Aqua Splash 2 Door Wardrobe In White & Blue Finish',7999,'482859','2022-07-11 19:53:33.509225',10,4,11,0),(12,'pink','2022-07-02 15:02:11.188271','This Is Storage Product','storage5.webp','Fiona Kids\' 3 Door Multi Colour Wardrobe with 3 Drawers In Barbie Pink Colour',50000,'482859','2022-07-11 19:53:33.518748',11,4,12,10),(13,'black','2022-07-02 15:04:01.212326','This Is beds&mattresses Product','beds&mattresses1.webp','Siramika Solid Wood Poster Bed in Honey Oak Finish',60999,'482859','2022-07-11 19:53:33.531203',12,5,13,0),(14,'red','2022-07-02 15:06:17.602049','This Is beds&mattresses Product','beds&mattresses2.webp','Vayaka Solid Wood King Size Poster Bed In Provincial Teak Finish',84999,'482859','2022-07-11 19:53:33.539595',12,5,14,0),(15,'grey','2022-07-02 15:07:22.856840','This Is beds&mattresses Product','beds&mattresses4.jpg','Vayaka Solid Wood King Size Poster Bed In Honey Oak Finish',84999,'482859','2022-07-11 19:53:33.550341',12,5,15,0),(16,'red','2022-07-02 15:12:12.706304','This Is beds&mattresses Product','beds&mattresses3.webp','Navah Poster Queen Bed In American Walnut Finish',204899,'482859','2022-07-11 19:53:33.560752',13,5,16,0),(17,'white','2022-07-02 15:13:37.175414','This Is  dining&Bar Product','dining&Bar1.webp','Single Black Cap 750ml Stainless Steel Bottle',1449,'482859','2022-07-11 19:53:33.569491',14,6,17,0),(18,'black','2022-07-02 15:14:34.367465','This Is  dining&Bar Product','dining&Bar2.webp','Aztec Green & Black 400ml (Set Of 4) Ceramic Everyday Glass',1499,'482859','2022-07-12 22:09:12.268412',15,6,18,3),(24,'yellow','2022-07-02 23:19:43.919662','This is decor Product','decor2.jpg','Wood Round Shape Wall Mirror',4594,'4587963','2022-07-11 19:53:33.636801',18,9,24,0),(25,'brown','2022-07-02 23:20:57.851124','This is wall Accents Product','wallAccents3.webp','Sheesham Wood Book Shelf in Rustic Finish',5105,'4587963','2022-07-11 19:53:33.646954',19,8,25,0),(26,'black','2022-07-02 23:22:44.224817','This is wall Accents Product','wallAccents4.webp','Mango Wood Floating Wall Shelf in Black Colour',1799,'4587963','2022-07-11 19:53:33.656129',20,8,26,0),(27,'brown','2022-07-02 23:23:36.245431','This is wall Accents Product','wallAccents5.webp','Mango Wood Wall Shelf In Natural Wood',3625,'4587963','2022-07-11 19:53:33.670279',21,8,27,0),(28,'white','2022-07-02 23:24:50.631058','This is decor Product','decor3.webp','Marble Finish Decorative Mirror in Beige Colour',773,'4587963','2022-07-11 19:53:33.681906',22,9,28,0),(29,'green','2022-07-02 23:28:54.057152','This is decor Product','decor4.jpg','Eye See You Boho Mirror In Green',2495,'4587963','2022-07-11 19:53:33.690300',23,9,29,0),(30,'brown','2022-07-02 23:30:28.384896','This is decor Product','decor5.webp','MDF Decorative Hand Crafted Round Wall Mirror',2349,'4587963','2022-07-11 19:53:33.701456',24,9,30,0),(31,'white','2022-07-02 23:32:47.003666','This is decor Product','decor1.webp','Metal Small Mirror Wall Art in Bronze Antique colour',3299,'4587963','2022-07-11 19:53:33.712722',25,9,31,0),(32,'yellow','2022-07-02 23:34:21.807037','This is lighting Product','lighting1.webp','Alexa 12 Light Modern & Contemporary Crystal Chandelier Kapoor E Illuminations',81222,'4587963','2022-07-11 19:53:33.722989',26,10,32,0),(33,'brown','2022-07-02 23:36:16.525943','This is lighting Product','lighting2.webp','Karly Beige Fabric Shade Floor Lamp With Brown Base',5084,'4597963','2022-07-11 19:53:33.737820',27,10,33,0),(34,'brown','2022-07-02 23:44:46.645642','This is lighting Product','lighting3.webp','Pellucid Cilindro Golden Metal Wall Sconces',1722,'4597963','2022-07-11 19:53:33.748815',28,10,34,0),(35,'white','2022-07-02 23:46:38.378375','This is lighting Product','lighting4.webp','Brass Metal Wall Sconces',4879,'4595663','2022-07-11 19:53:33.758739',29,10,35,0),(36,'brown','2022-07-02 23:48:02.719515','This is lighting Product','lighting5.jpg','Grey Metal Outdoor Wall Light',1761,'4595663','2022-07-11 19:53:33.770115',30,10,36,1),(37,'white','2022-07-02 23:49:01.689720','This is lighting Product','lighting4.webp','Brass Metal Wall Sconces',4879,'4595663','2022-07-07 22:51:45.745292',29,10,37,0),(38,'brown','2022-07-02 23:50:20.532332','This is lighting Product','lighting5.jpg','Grey Metal Outdoor Wall Light',1761,'4595663','2022-07-07 22:59:04.517806',30,10,38,0),(39,'blue','2022-07-03 21:56:40.465045','this is furnishings product','furnishings1.jpg','Blue Geometric 200 TC Poly Cotton 1 Single Bedhseet with 1 Pillow Cover',348,'58796','2022-07-03 21:56:40.465045',31,11,39,0),(40,'blue','2022-07-03 21:59:50.570605','this is furnishings product','furnishings2.jpg','Blue Floral 210 TC Poly Cotton 1 Single Bedhseet with 1 Pillow Cover',575,'587965','2022-07-03 21:59:50.570605',32,11,40,0),(41,'brown','2022-07-03 22:01:50.458016','this is furnishings product','furnishings3.webp','Strasbourg Cotton 300TC Double Bedsheet with 2 Pillow Covers',2399,'587965','2022-07-03 22:01:50.458016',33,11,41,0),(42,'white','2022-07-03 22:03:40.236052','this is furnishings product','furnishings4.jpg','Blue Floral 300 TC Cotton 1 Double Bedsheet with 2 Pillow Covers',1580,'587965','2022-07-07 23:14:14.249724',34,11,42,0),(43,'solid blue','2022-07-03 22:05:25.780449','this is furnishings product','furnishings5.webp','Blue Solid 250 TC Cotton 1 Double Bedsheet with 2 Pillow Covers',1780,'587896','2022-07-03 22:05:25.780449',35,11,43,0),(44,'solid brown','2022-07-03 22:08:47.709004','this is carpets product','carpets1.jpg','Beige and Teal Blue Geometric Polypropylene 5x2 Feet Machine Made',3591,'588896','2022-07-03 22:08:47.709004',36,12,44,0),(45,'solid blue','2022-07-03 22:10:05.570939','this is carpets product','carpets2.webp','Oriental Pattern Polyester 5 x 2 Feet Machine Made Bedside Runner',479,'588896','2022-07-03 22:10:05.570939',37,12,45,0),(46,'brown','2022-07-03 22:13:08.876678','this is carpets product','carpets3.webp','Geometric Pattern Jute 3 X 5 Feet Flat Weave Runner',1899,'588256','2022-07-03 22:13:08.876678',38,12,46,0),(47,'brown','2022-07-03 22:15:20.803403','this is carpets product','carpets4.webp','Solid Pattern Artificial Grass 6.5 X 2 Feet Machine Made Bedside Runner',1899,'58663','2022-07-11 19:43:07.081409',38,12,47,4),(48,'brown','2022-07-03 22:16:07.712421','this is carpets product','carpets5.jpg','Solid Pattern Artificial Grass 6.5 X 2 Feet Machine Made Bedside Runner',1342,'58663','2022-07-03 22:16:07.712421',39,12,48,0),(49,'golden','2022-07-03 22:25:15.732507','this is Garden and Outdoor product','GardenAndOutdoor1.jpg','Gold-Toned Metal Hanging Planter',759,'586645','2022-07-11 22:33:55.546995',40,13,49,1),(50,'golden','2022-07-03 22:26:50.038133','this is Garden and Outdoor product','GardenAndOutdoor2.webp','Brown Metal Hanging Basket For Indoor Or Outdoor Plant',399,'586645','2022-07-03 22:26:50.038133',41,13,50,0),(51,'golden','2022-07-03 22:28:05.942745','this is Garden and Outdoor product','GardenAndOutdoor3.webp','Hanging Capsule Shape Planter, Set of 2',999,'58458','2022-07-03 22:28:05.942745',42,13,51,0),(52,'black','2022-07-03 22:29:54.248965','this is Garden and Outdoor product','GardenAndOutdoor4.webp','Black Ceramic Bird Shape Hanging Planter',1399,'58458','2022-07-08 01:10:08.477628',43,13,52,0),(53,'black','2022-07-03 22:31:20.377913','this is Garden and Outdoor product','GardenAndOutdoor5.webp','Black Goblet\' Metal Hand-Painted Hanging Planter Pot With Jute',599,'58458','2022-07-08 01:09:52.326966',44,13,53,0);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:47
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `product_brand`
--

DROP TABLE IF EXISTS `product_brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_brand`
--

LOCK TABLES `product_brand` WRITE;
/*!40000 ALTER TABLE `product_brand` DISABLE KEYS */;
INSERT INTO `product_brand` VALUES (3,'Woodsworth','','2022-07-03 00:26:21.000000','2022-07-13 12:36:54.670562'),(4,'CasaCraft','','2022-07-03 00:26:21.000000','2022-07-12 23:28:06.862202'),(5,'ARRA','','2022-07-03 00:26:21.000000','2022-07-12 21:46:18.657789'),(6,'Trevi Furniture','','2022-07-03 00:26:21.000000','2022-07-12 23:28:06.876641'),(7,'Spacewood','','2022-07-03 00:26:21.000000','2022-07-12 19:32:32.921586'),(8,'Boingg! - A Happy Start','','2022-07-03 00:26:21.000000','2022-07-11 19:39:37.175107'),(9,'A GLOBIA CREATIONS','','2022-07-03 00:26:21.000000','2022-07-10 03:01:44.973531'),(10,'Mintwud','','2022-07-03 00:26:21.000000','2022-07-10 23:02:06.992064'),(11,'Adona','','2022-07-03 00:26:21.000000','2022-07-10 23:04:08.527519'),(12,'Mudramark','','2022-07-03 00:26:21.000000','2022-07-10 23:20:28.667467'),(13,'Orange Tree','','2022-07-03 00:26:21.000000','2022-07-10 22:45:10.484496'),(14,'CasaGold','','2022-07-03 00:26:21.000000','2022-07-11 15:34:41.316426'),(15,'Vareesha','','2022-07-03 00:26:21.000000','2022-07-12 22:09:12.263865'),(16,'Cdi','','2022-07-03 00:26:21.000000','2022-07-12 18:34:32.315831'),(17,'The White Ink Decor','','2022-07-03 00:26:21.000000','2022-07-12 18:32:30.774458'),(18,'WallMantra','','2022-07-03 00:26:21.000000','2022-07-12 18:43:12.283806'),(19,'WoodenMood','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(20,'Craft Tree','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(21,'Disoo Fashions','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(22,'Art Street','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(23,'Chumbak','','2022-07-03 00:26:21.000000','2022-07-08 00:22:14.291536'),(24,'The Urban Store','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(25,'Craftter','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(26,'Kapoor E Illuminations','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(27,'Sapphire','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(28,'Eliante by Jainsons Lights','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(29,'New Era','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(30,'Superscape Outdoor Lighting','','2022-07-03 00:26:21.000000','2022-07-03 00:27:20.000000'),(31,'FLORIDA','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(32,'Klotthe','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(33,'Petal Home','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(34,'Jaipur Fabric','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(35,'Romee','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(36,'Obsessions','','2022-07-04 12:09:07.000000','2022-07-12 18:34:10.447242'),(37,'Status','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(38,'The Home Talk','','2022-07-04 12:09:07.000000','2022-07-11 19:43:07.084411'),(39,'Luxe Home International','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(40,'Tied Ribbons','','2022-07-04 12:09:07.000000','2022-07-11 22:33:55.483821'),(41,'Fourwalls','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(42,'Amaya Decors','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(43,'Justoriginals','','2022-07-04 12:09:07.000000','2022-07-04 12:09:31.000000'),(44,'ExclusiveLane','','2022-07-04 12:09:07.000000','2022-07-04 12:32:16.437223');
/*!40000 ALTER TABLE `product_brand` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:48
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `product_category`
--

DROP TABLE IF EXISTS `product_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_category`
--

LOCK TABLES `product_category` WRITE;
/*!40000 ALTER TABLE `product_category` DISABLE KEYS */;
INSERT INTO `product_category` VALUES (3,'2022-07-02 14:31:11.051236','furniture','2022-07-12 23:28:06.875643',''),(4,'2022-07-02 14:46:11.118631','storage','2022-07-12 19:32:32.923593',''),(5,'2022-07-02 15:01:09.498088','beds&mattresses','2022-07-13 12:36:54.673080',''),(6,'2022-07-02 15:12:12.703303','dining&Bar','2022-07-12 22:09:12.265384',''),(8,'2022-07-02 23:19:43.916661','wall Accents','2022-07-12 18:43:12.285799',''),(9,'2022-07-02 23:28:54.045153','decor','2022-07-12 18:34:08.873043',''),(10,'2022-07-02 23:44:46.642633','lighting','2022-07-02 23:44:46.642633',''),(11,'2022-07-03 21:56:40.444085','furnishings','2022-07-12 23:20:19.100234',''),(12,'2022-07-03 22:08:47.702014','carpets','2022-07-12 18:34:10.449543',''),(13,'2022-07-03 22:25:15.728504','Garden and Outdoor','2022-07-11 22:33:55.537026','');
/*!40000 ALTER TABLE `product_category` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:49
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `product_inventory`
--

DROP TABLE IF EXISTS `product_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_inventory` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) DEFAULT NULL,
  `quantity` int NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_inventory`
--

LOCK TABLES `product_inventory` WRITE;
/*!40000 ALTER TABLE `product_inventory` DISABLE KEYS */;
INSERT INTO `product_inventory` VALUES (1,'2022-07-02 13:18:41.540470',10,'2022-07-13 12:36:54.674497'),(2,'2022-07-02 13:18:41.949327',19,'2022-07-12 23:28:06.851203'),(3,'2022-07-02 14:05:21.125556',0,'2022-07-12 22:06:35.119124'),(4,'2022-07-02 14:31:11.052236',17,'2022-07-12 23:28:06.865202'),(5,'2022-07-02 14:33:29.170280',15,'2022-07-11 19:53:33.429085'),(6,'2022-07-02 14:35:15.329616',10,'2022-07-12 21:46:18.660958'),(7,'2022-07-02 14:36:38.561964',0,'2022-07-12 23:28:06.877660'),(8,'2022-07-02 14:40:37.148816',4,'2022-07-12 19:32:32.924589'),(9,'2022-07-02 14:46:11.119631',8,'2022-07-11 19:53:33.484048'),(10,'2022-07-02 14:47:58.458625',12,'2022-07-11 19:53:33.496233'),(11,'2022-07-02 14:55:13.651230',12,'2022-07-11 19:53:33.507208'),(12,'2022-07-02 14:56:33.511634',25,'2022-07-11 19:53:33.517869'),(13,'2022-07-02 14:57:35.666050',24,'2022-07-11 19:53:33.530227'),(14,'2022-07-02 15:01:09.500093',24,'2022-07-11 19:53:33.538425'),(15,'2022-07-02 15:02:11.186274',22,'2022-07-11 19:53:33.549343'),(16,'2022-07-02 15:04:01.211318',24,'2022-07-11 19:53:33.557753'),(17,'2022-07-02 15:06:17.590518',22,'2022-07-11 19:53:33.569491'),(18,'2022-07-02 15:07:22.854829',11,'2022-07-12 22:09:12.266641'),(24,'2022-07-02 23:19:43.918662',18,'2022-07-11 19:53:33.635138'),(25,'2022-07-02 23:20:57.838616',12,'2022-07-11 19:53:33.645954'),(26,'2022-07-02 23:22:44.223816',12,'2022-07-11 19:53:33.655114'),(27,'2022-07-02 23:23:36.244432',12,'2022-07-11 19:53:33.668964'),(28,'2022-07-02 23:24:50.630057',18,'2022-07-11 19:53:33.680908'),(29,'2022-07-02 23:28:54.056150',18,'2022-07-11 19:53:33.689067'),(30,'2022-07-02 23:30:28.382897',18,'2022-07-11 19:53:33.699882'),(31,'2022-07-02 23:32:47.002658',30,'2022-07-11 19:53:33.712722'),(32,'2022-07-02 23:34:21.806038',3,'2022-07-11 19:53:33.721652'),(33,'2022-07-02 23:36:16.524944',3,'2022-07-11 19:53:33.735797'),(34,'2022-07-02 23:44:46.643642',3,'2022-07-11 19:53:33.747818'),(35,'2022-07-02 23:46:38.377376',3,'2022-07-11 19:53:33.756731'),(36,'2022-07-02 23:48:02.718515',3,'2022-07-11 19:53:33.768103'),(37,'2022-07-02 23:49:01.687720',10,'2022-07-07 22:51:45.746293'),(38,'2022-07-02 23:50:20.531325',10,'2022-07-07 22:59:04.519793'),(39,'2022-07-03 21:56:40.460041',10,'2022-07-03 21:56:40.460041'),(40,'2022-07-03 21:59:50.565621',10,'2022-07-03 21:59:50.566624'),(41,'2022-07-03 22:01:50.453961',10,'2022-07-03 22:01:50.453961'),(42,'2022-07-03 22:03:40.234050',10,'2022-07-07 23:14:14.251752'),(43,'2022-07-03 22:05:25.777537',10,'2022-07-03 22:05:25.777537'),(44,'2022-07-03 22:08:47.706010',10,'2022-07-03 22:08:47.706010'),(45,'2022-07-03 22:10:05.567930',10,'2022-07-03 22:10:05.567930'),(46,'2022-07-03 22:13:08.874668',10,'2022-07-03 22:13:08.874668'),(47,'2022-07-03 22:15:20.799401',10,'2022-07-11 19:43:07.088581'),(48,'2022-07-03 22:16:07.710856',10,'2022-07-03 22:16:07.710856'),(49,'2022-07-03 22:25:15.730517',9,'2022-07-11 22:33:55.540000'),(50,'2022-07-03 22:26:50.037133',10,'2022-07-03 22:26:50.037133'),(51,'2022-07-03 22:28:05.940744',10,'2022-07-03 22:28:05.940744'),(52,'2022-07-03 22:29:54.247531',10,'2022-07-08 01:10:08.479669'),(53,'2022-07-03 22:31:20.374928',10,'2022-07-08 01:09:52.328966');
/*!40000 ALTER TABLE `product_inventory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:47
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `wish_list`
--

DROP TABLE IF EXISTS `wish_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_list` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKn5hrvslugfq86610799b8861w` (`user_id`),
  CONSTRAINT `FKn5hrvslugfq86610799b8861w` FOREIGN KEY (`user_id`) REFERENCES `app_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list`
--

LOCK TABLES `wish_list` WRITE;
/*!40000 ALTER TABLE `wish_list` DISABLE KEYS */;
INSERT INTO `wish_list` VALUES (2,'2022-07-06 02:04:14.110218','2022-07-06 18:57:54.687850',3),(3,'2022-07-08 00:43:06.851846','2022-07-08 00:43:06.851846',4),(4,'2022-07-08 00:56:52.453411','2022-07-08 01:02:55.987251',5),(5,'2022-07-08 01:04:05.746627','2022-07-08 01:04:05.750057',6),(6,'2022-07-08 01:06:23.114580','2022-07-08 01:06:23.117554',7),(7,'2022-07-11 12:14:02.080152','2022-07-11 12:14:02.102003',8),(8,'2022-07-12 21:51:11.819521','2022-07-12 21:51:11.828951',9);
/*!40000 ALTER TABLE `wish_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:47
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: capstone
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `wish_list_items`
--

DROP TABLE IF EXISTS `wish_list_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish_list_items` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `user_wishlist_id` bigint DEFAULT NULL,
  `wishlisted_product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK4n4fpqsr0fpp82e682vehqbs7` (`user_wishlist_id`),
  KEY `FKowoj07e9e4gntamhk5k5of067` (`wishlisted_product_id`),
  CONSTRAINT `FK4n4fpqsr0fpp82e682vehqbs7` FOREIGN KEY (`user_wishlist_id`) REFERENCES `wish_list` (`id`),
  CONSTRAINT `FKowoj07e9e4gntamhk5k5of067` FOREIGN KEY (`wishlisted_product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish_list_items`
--

LOCK TABLES `wish_list_items` WRITE;
/*!40000 ALTER TABLE `wish_list_items` DISABLE KEYS */;
INSERT INTO `wish_list_items` VALUES (21,'2022-07-08 01:02:55.983360','2022-07-08 01:02:55.983360',4,4),(22,'2022-07-08 01:02:59.249169','2022-07-08 01:02:59.249169',4,7),(23,'2022-07-08 01:03:02.544628','2022-07-08 01:03:02.544628',4,8),(24,'2022-07-08 01:09:59.728308','2022-07-08 01:09:59.728308',6,1),(25,'2022-07-08 01:10:03.022463','2022-07-08 01:10:03.022463',6,2),(36,'2022-07-12 19:25:12.256109','2022-07-12 19:25:12.256109',2,1),(37,'2022-07-12 19:27:06.610952','2022-07-12 19:27:06.610952',2,12),(40,'2022-07-12 23:27:19.717099','2022-07-12 23:27:19.717099',3,7);
/*!40000 ALTER TABLE `wish_list_items` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-07-13 13:17:50
