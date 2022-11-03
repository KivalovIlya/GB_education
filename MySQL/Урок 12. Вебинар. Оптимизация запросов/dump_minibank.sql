-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: mini_bank
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_inf`
--

DROP TABLE IF EXISTS `additional_inf`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_inf` (
  `id_client` bigint unsigned NOT NULL,
  `inn` varchar(12) DEFAULT NULL,
  `education` text,
  `office` text,
  `client_secret_code` text,
  PRIMARY KEY (`id_client`),
  UNIQUE KEY `inn` (`inn`),
  CONSTRAINT `additional_inf_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_inf`
--

LOCK TABLES `additional_inf` WRITE;
/*!40000 ALTER TABLE `additional_inf` DISABLE KEYS */;
INSERT INTO `additional_inf` VALUES (1,'123456789123','высшее','главный специалист','дратути'),(2,'123456111123','среднее','строитель','широкую на широкую'),(4,'222456789123','неполное высшее','студент','зачет');
/*!40000 ALTER TABLE `additional_inf` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_client` bigint unsigned NOT NULL,
  `type_address` tinyint unsigned NOT NULL,
  `locality` varchar(250) DEFAULT NULL,
  `region` varchar(250) DEFAULT NULL,
  `street` varchar(250) DEFAULT NULL,
  `build` varchar(250) DEFAULT NULL,
  `apartment` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `type_address` (`type_address`),
  KEY `id_client` (`id_client`),
  CONSTRAINT `address_ibfk_1` FOREIGN KEY (`type_address`) REFERENCES `types_of_address` (`id`),
  CONSTRAINT `address_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
INSERT INTO `address` VALUES (1,1,1,'Россия','Санкт-Петербург','Пушкина','14','245'),(2,1,2,'Россия','Санкт-Петербург','Пушкина','14','245'),(3,2,1,'Россия','Санкт-Петербург','Брянцева','21','4'),(4,2,2,'Россия','Санкт-Петербург','Учительская','31','11'),(5,4,1,'Россия','Санкт-Петербург','Еремная','16','2');
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `analytical_features`
--

DROP TABLE IF EXISTS `analytical_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `analytical_features` (
  `id` bigint unsigned NOT NULL,
  `vip` tinyint(1) DEFAULT '0',
  `use_ios` tinyint(1) DEFAULT NULL,
  `use_android` tinyint(1) DEFAULT NULL,
  `online_banking` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `analytical_features_ibfk_1` FOREIGN KEY (`id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analytical_features`
--

LOCK TABLES `analytical_features` WRITE;
/*!40000 ALTER TABLE `analytical_features` DISABLE KEYS */;
INSERT INTO `analytical_features` VALUES (1,1,1,0,1),(2,0,0,1,1),(4,0,0,1,0);
/*!40000 ALTER TABLE `analytical_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attribute_of_document`
--

DROP TABLE IF EXISTS `attribute_of_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attribute_of_document` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attribute_of_document`
--

LOCK TABLES `attribute_of_document` WRITE;
/*!40000 ALTER TABLE `attribute_of_document` DISABLE KEYS */;
INSERT INTO `attribute_of_document` VALUES (1,'Основной документ'),(2,'Дополнительный документ');
/*!40000 ALTER TABLE `attribute_of_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `lastname` varchar(70) NOT NULL,
  `patronymic` varchar(50) DEFAULT NULL,
  `gender` tinyint(1) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `snils` char(11) DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `telephone` char(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `telephone` (`telephone`),
  UNIQUE KEY `snils` (`snils`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Илья','Кивалов','Юрьевич',1,'kivalovilya@icloud.com','12345678901','2022-04-27 19:38:02','88005553535'),(2,'Максим','Петров','Юрьевич',1,'pavlov@icloud.com','23456789011','2022-04-27 19:42:11','88115553535'),(4,'Денис','Николаев','Алексеевич',1,'dennik@icloud.com','23445789011','2022-04-27 19:43:08','88122553535');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client_document`
--

DROP TABLE IF EXISTS `client_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_document` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `id_client` bigint unsigned DEFAULT NULL,
  `type_doc` tinyint unsigned DEFAULT NULL,
  `attr_doc` tinyint unsigned DEFAULT NULL,
  `series_of_doc` varchar(10) DEFAULT NULL,
  `number_of_doc` varchar(15) DEFAULT NULL,
  `date_of_issue` date DEFAULT NULL,
  `unit_code` varchar(20) DEFAULT NULL,
  `action_time` date DEFAULT NULL,
  `issued` text,
  PRIMARY KEY (`id`),
  KEY `type_doc` (`type_doc`),
  KEY `id_client` (`id_client`),
  KEY `attr_doc` (`attr_doc`),
  CONSTRAINT `client_document_ibfk_1` FOREIGN KEY (`type_doc`) REFERENCES `types_of_document` (`id`),
  CONSTRAINT `client_document_ibfk_2` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `client_document_ibfk_3` FOREIGN KEY (`attr_doc`) REFERENCES `attribute_of_document` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_document`
--

LOCK TABLES `client_document` WRITE;
/*!40000 ALTER TABLE `client_document` DISABLE KEYS */;
INSERT INTO `client_document` VALUES (2,1,1,1,'4019','321456','1999-03-21','100128','2015-03-21','мвд по спб'),(3,2,1,1,'4019','123456','2006-05-15','670013','2026-05-15','мвд по спб'),(4,4,1,1,'4019','234567','1987-11-13','540015','9999-12-30','мвд по спб');
/*!40000 ALTER TABLE `client_document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id_client` bigint unsigned NOT NULL,
  `calls` tinyint(1) DEFAULT '1',
  `email` tinyint(1) DEFAULT '1',
  `sms` tinyint(1) DEFAULT '1',
  `letter` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_client`),
  CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
INSERT INTO `contacts` VALUES (1,0,1,0,0),(2,1,0,0,0),(4,0,0,1,0);
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contract`
--

DROP TABLE IF EXISTS `contract`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contract` (
  `number_deal` bigint unsigned NOT NULL AUTO_INCREMENT,
  `product` int unsigned NOT NULL,
  `id_client` bigint unsigned NOT NULL,
  `date_open` date NOT NULL,
  `date_close` date DEFAULT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`number_deal`),
  KEY `id_client` (`id_client`),
  KEY `product` (`product`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contract`
--

LOCK TABLES `contract` WRITE;
/*!40000 ALTER TABLE `contract` DISABLE KEYS */;
INSERT INTO `contract` VALUES (1,1,1,'2022-01-04','2035-01-04',1),(2,2,1,'2017-02-03','2019-02-03',0),(3,1,2,'2010-11-14','2020-02-03',0),(4,2,2,'2015-01-16','2025-11-16',1),(5,3,2,'2020-08-25','2030-07-07',1),(6,3,4,'2019-09-26','2025-11-22',1),(7,2,4,'2015-08-29','2022-03-11',0),(8,1,4,'2014-04-11','2024-04-20',1);
/*!40000 ALTER TABLE `contract` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `start_prod` date NOT NULL,
  `finish_prod` date NOT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Текущий счет','2019-04-20','9999-12-01'),(2,'visa platinum','2017-05-10','2050-05-10'),(3,'Расчетный счет','2020-01-01','2050-01-01');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_of_address`
--

DROP TABLE IF EXISTS `types_of_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_of_address` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `type_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_of_address`
--

LOCK TABLES `types_of_address` WRITE;
/*!40000 ALTER TABLE `types_of_address` DISABLE KEYS */;
INSERT INTO `types_of_address` VALUES (1,'Адрес постоянной регистрации'),(2,'Место пребывания'),(3,'Почтовый адрес');
/*!40000 ALTER TABLE `types_of_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `types_of_document`
--

DROP TABLE IF EXISTS `types_of_document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `types_of_document` (
  `id` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `types_of_document`
--

LOCK TABLES `types_of_document` WRITE;
/*!40000 ALTER TABLE `types_of_document` DISABLE KEYS */;
INSERT INTO `types_of_document` VALUES (1,'Паспорт гражданина РФ');
/*!40000 ALTER TABLE `types_of_document` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-07  1:50:24
