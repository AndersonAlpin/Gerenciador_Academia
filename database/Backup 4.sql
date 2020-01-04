CREATE DATABASE  IF NOT EXISTS `academiaironfit` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `academiaironfit`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: mysql669.umbler.com    Database: academiaironfit
-- ------------------------------------------------------
-- Server version	5.6.40

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
-- Table structure for table `academia`
--

DROP TABLE IF EXISTS `academia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `academia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academia`
--

LOCK TABLES `academia` WRITE;
/*!40000 ALTER TABLE `academia` DISABLE KEYS */;
INSERT INTO `academia` VALUES (1,'Academia IronFit','2019-11-12 13:59:05','2019-12-27 21:43:28'),(2,'Academia Teste','2019-12-18 17:48:05','2019-12-18 17:48:05');
/*!40000 ALTER TABLE `academia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `administradors`
--

DROP TABLE IF EXISTS `administradors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administradors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'chefe',
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  CONSTRAINT `administradors_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradors`
--

LOCK TABLES `administradors` WRITE;
/*!40000 ALTER TABLE `administradors` DISABLE KEYS */;
INSERT INTO `administradors` VALUES (1,'Flavio','Souza','Masculino','056.123.125-11','1982-07-14','(73)95543-1256','adminironfit@gmail.com','chefe',1,'2019-12-01 19:19:53','2019-12-29 22:15:00',1),(2,'Vanessa','Santos','Feminino','123.515.743-12','1998-12-13','(99)99129-1244','novoadmin@gmail.com','chefe',1,'2019-12-18 19:19:53','2019-12-19 00:00:17',2);
/*!40000 ALTER TABLE `administradors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  `pacoteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  KEY `pacoteId` (`pacoteId`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`pacoteId`) REFERENCES `pacotes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Júlia','Santana','Feminino','1996-08-11','123.123.123-66','(22)22222-2222','julia@gmail.com',1,'2019-12-17 11:42:40','2019-12-19 13:52:50',2,3),(2,'Júlio','Santos','Masculino','1999-07-11','412.412.412-41','(14)24124-1241','julio@gmail.com',0,'2019-12-18 19:50:31','2019-12-18 19:50:45',2,4),(3,'Carlos','Alberto','Masculino','1982-02-11','452.344.235-23','(64)56346-4523','carlos@gmail.com',1,'2019-12-19 14:41:41','2019-12-23 18:44:42',1,2),(4,'Amanda','Santos','Feminino','1987-12-11','141.241.241-24','(12)41241-2412','amanda@gmail.com',1,'2019-12-19 21:06:44','2019-12-22 13:19:31',1,1),(5,'Leandro','Silva','Masculino','1990-08-05','981.491.247-12','(41)24124-1241','leandro@gmail.com',1,'2019-12-22 11:26:21','2019-12-22 11:27:22',1,1),(6,'Maria','Oliveira','Feminino','1983-04-11','512.341.412-41','(41)42134-2134','maria@gmail.com',0,'2019-12-22 13:20:27','2019-12-23 12:54:58',1,1),(7,'Daniel','Nei','Masculino','2000-01-19','987.897.897-98','(87)87878-7878','danielcardin172@gmal.com',1,'2019-12-22 20:39:41','2019-12-24 19:43:56',1,2),(8,'Tiago','Batista','Masculino','2005-08-11','124.124.124-12','(14)12412-3412','tiago@gmail.com',1,'2019-12-23 18:26:01','2019-12-23 18:26:01',2,4);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoacademia`
--

DROP TABLE IF EXISTS `enderecoacademia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecoacademia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  CONSTRAINT `enderecoacademia_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoacademia`
--

LOCK TABLES `enderecoacademia` WRITE;
/*!40000 ALTER TABLE `enderecoacademia` DISABLE KEYS */;
INSERT INTO `enderecoacademia` VALUES (1,'Rua Qualquer','14','Ubatã','Qualquer','45550-000','BA','2019-12-18 22:02:37','2019-12-27 21:43:28',1),(2,'Rua Nova','51','Camacã','Seila','45519-151','BA','2019-12-18 22:02:37','2019-12-18 22:02:37',2);
/*!40000 ALTER TABLE `enderecoacademia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoadministradors`
--

DROP TABLE IF EXISTS `enderecoadministradors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecoadministradors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `administradorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administradorId` (`administradorId`),
  CONSTRAINT `enderecoadministradors_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `administradors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoadministradors`
--

LOCK TABLES `enderecoadministradors` WRITE;
/*!40000 ALTER TABLE `enderecoadministradors` DISABLE KEYS */;
INSERT INTO `enderecoadministradors` VALUES (1,'Rua Qualquer','32','Ubatã','Qualquer','45550-000','BA','2019-12-01 19:19:53','2019-12-29 22:15:00',1),(2,'Rua Qualquer','51','Camacã','New Bairro','61231-118','BA','2019-12-01 19:19:53','2019-12-19 00:00:17',2);
/*!40000 ALTER TABLE `enderecoadministradors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoclientes`
--

DROP TABLE IF EXISTS `enderecoclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecoclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `numero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bairro` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cep` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `uf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `enderecoclientes_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoclientes`
--

LOCK TABLES `enderecoclientes` WRITE;
/*!40000 ALTER TABLE `enderecoclientes` DISABLE KEYS */;
INSERT INTO `enderecoclientes` VALUES (3,'Qualquer','43','São Paulo','Qualquer','12312-314','SP','2019-12-17 11:42:40','2019-12-19 13:52:50',1),(4,'Nova Vida','5123','Nova','Novo','21512-351','AL','2019-12-18 19:50:31','2019-12-18 19:50:31',2),(5,'Rua Qualquer','10','Catalão','Qualquer','53423-441','PR','2019-12-19 14:41:42','2019-12-23 18:44:42',3),(6,'Rua Seila','41','Seila','Qualquer','15123-512','PB','2019-12-19 21:06:44','2019-12-22 13:19:14',4),(7,'Rua Seila','14','Rio de Janeiro','Novo','51235-231','RJ','2019-12-22 11:26:21','2019-12-22 11:27:22',5),(8,'Rua Qualquer','12','New Jersey','Novo','23412-412','AP','2019-12-22 13:20:27','2019-12-22 13:20:27',6),(9,'São Jose','154','Camacan','Centro','45880-000','BA','2019-12-22 20:39:42','2019-12-24 19:43:57',7),(10,'Rua Complexo','55','Ubatã','Dois de Julho','12412-412','BA','2019-12-23 18:26:02','2019-12-23 18:26:02',8);
/*!40000 ALTER TABLE `enderecoclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gastos`
--

DROP TABLE IF EXISTS `gastos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT NULL,
  `descricao` text,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (1,150,'Conta de energia','2019-12-27 19:41:07','2019-12-27 19:41:07',1),(2,75,'Conta de água','2019-12-27 19:41:07','2019-12-27 19:41:07',1),(3,112.9,'Conta de internet','2019-11-27 21:52:47','2019-11-27 21:52:47',1),(4,112.9,'Conta de internet','2019-12-27 22:15:29','2019-12-27 22:15:29',1);
/*!40000 ALTER TABLE `gastos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `administradorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administradorId` (`administradorId`),
  CONSTRAINT `logins_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `administradors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,'adminironfit@gmail.com','$2a$10$aQ10Mf9XwvaO/4rF8CjjMO0GDKC8kq/5OPGPpFTDj1yXgtP7ZfcCi','2019-12-01 19:19:53','2019-12-29 22:15:11',1),(2,'novoadmin@gmail.com','$2a$10$pwkPmNqou/0UEyjY0ASEFOVpgBVMdsmrR3YLonOuJRnkrKkSzenhu','2019-12-01 19:19:53','2019-12-19 00:00:17',2);
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensalidadeacademia`
--

DROP TABLE IF EXISTS `mensalidadeacademia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensalidadeacademia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL DEFAULT '50',
  `dataEmissao` date NOT NULL DEFAULT '0000-00-00',
  `dataVencimento` date DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `formaPagamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Em aberto',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  CONSTRAINT `mensalidadeacademia_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidadeacademia`
--

LOCK TABLES `mensalidadeacademia` WRITE;
/*!40000 ALTER TABLE `mensalidadeacademia` DISABLE KEYS */;
INSERT INTO `mensalidadeacademia` VALUES (1,40,'1969-12-31','1969-12-31',NULL,NULL,'Em aberto','2019-12-18 21:56:09','2019-12-18 21:56:09',2);
/*!40000 ALTER TABLE `mensalidadeacademia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensalidades`
--

DROP TABLE IF EXISTS `mensalidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mensalidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL DEFAULT '50',
  `dataEmissao` date NOT NULL DEFAULT '0000-00-00',
  `dataVencimento` date DEFAULT NULL,
  `dataPagamento` date DEFAULT NULL,
  `formaPagamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Em aberto',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `mensalidades_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidades`
--

LOCK TABLES `mensalidades` WRITE;
/*!40000 ALTER TABLE `mensalidades` DISABLE KEYS */;
INSERT INTO `mensalidades` VALUES (1,50,'2019-12-17','2020-01-17','2019-12-20','Dinheiro','Pago','2019-12-17 11:42:41','2019-12-19 22:11:30',1),(2,50,'2019-12-17','2019-12-17','2019-12-19','Dinheiro','Pago','2019-12-17 11:42:41','2019-12-19 14:16:55',1),(3,50,'2019-12-18','2020-01-18','2019-12-22','Cartão','Pago','2019-12-18 19:50:34','2019-12-22 20:30:06',2),(4,50,'2019-12-18','2019-12-18','2019-12-18','Dinheiro','Pago','2019-12-18 19:50:34','2019-12-18 19:50:34',2),(5,45,'2019-12-19','2020-01-19','2019-12-20','Cartão','Pago','2019-12-19 14:41:42','2019-12-20 15:26:49',3),(6,45,'2019-12-19','2019-12-19','2019-12-20','Cartão','Pago','2019-12-19 14:41:42','2019-12-20 15:27:49',3),(7,45,'2019-12-19','2019-12-19','2019-12-19','Cartão','Pago','2019-12-19 21:06:45','2019-12-19 21:06:45',4),(8,45,'2019-12-19','2020-01-02','2019-12-26','Dinheiro','Pago','2019-12-19 21:15:27','2019-12-25 21:31:25',4),(13,45,'2019-12-20','2020-02-19','2019-12-20','Dinheiro','Pago','2019-12-20 15:29:29','2019-12-20 15:29:29',3),(14,50,'2019-12-20','2020-03-20',NULL,NULL,'Em aberto','2019-12-20 15:31:55','2019-12-20 15:34:52',3),(15,50,'2019-12-22','2019-12-22','2019-12-22','Dinheiro','Pago','2019-12-22 11:26:22','2019-12-22 11:26:22',5),(16,50,'2019-12-22','2020-01-22','2019-12-26','Depósito','Pago','2019-12-22 11:26:22','2019-12-26 09:43:24',5),(17,50,'2019-12-22','2019-12-22','2019-12-22','Cartão','Pago','2019-12-22 13:20:28','2019-12-22 13:20:28',6),(20,45,'2019-12-22','2019-12-22','2020-01-03','Depósito','Pago','2019-12-22 20:39:43','2020-01-03 17:30:45',7),(21,45,'2019-12-22','2019-12-22','2019-12-26','Transferência','Pago','2019-12-22 20:39:43','2019-12-25 21:25:46',7),(22,47.5,'2019-12-23','2019-12-23','2019-12-23','Cartão','Pago','2019-12-23 18:26:05','2019-12-23 18:26:05',8),(23,47.5,'2019-12-23','2020-01-23',NULL,NULL,'Em aberto','2019-12-23 18:26:05','2019-12-23 18:26:05',8),(24,50,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 16:15:47','2020-01-04 16:15:47',1),(25,50,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 16:20:47','2020-01-04 16:20:47',4),(26,45,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 16:25:37','2020-01-04 16:25:37',7);
/*!40000 ALTER TABLE `mensalidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacotes`
--

DROP TABLE IF EXISTS `pacotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxaDesconto` double NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacotes`
--

LOCK TABLES `pacotes` WRITE;
/*!40000 ALTER TABLE `pacotes` DISABLE KEYS */;
INSERT INTO `pacotes` VALUES (1,'Nenhum','Nenhum desconto',0,1,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Verão','Grupos a partir de 4 pessoas tem 10% de desconto na mensalidade.',10,1,'2019-11-12 13:59:34','2019-12-12 15:09:46'),(3,'Nenhum','Nenhum desconto',0,2,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(4,'Família','Grupos a partir de 3 pessoas tem desconto de 5% nas mensalidades;',5,2,'2019-12-08 12:26:48','2019-12-08 12:26:48'),(5,'Premium','Grupos a partir de 6 pessoas tem desconto de 15% nas mensalidades.',15,2,'2019-12-08 12:26:07','2019-12-08 12:26:07');
/*!40000 ALTER TABLE `pacotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `viewMensalidade`
--

DROP TABLE IF EXISTS `viewMensalidade`;
/*!50001 DROP VIEW IF EXISTS `viewMensalidade`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `viewMensalidade` AS SELECT 
 1 AS `valor`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'academiaironfit'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `eventGerarMensalidades` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`academiaironfit`@`%`*/ /*!50106 EVENT `eventGerarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-12 12:47:17' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por gerar mensalidades mensalmente' DO BEGIN

  START TRANSACTION;

    SET @minID = (SELECT MIN(id) FROM clientes);

    SET @maxID = (SELECT MAX(id) FROM clientes);

    WHILE @minID <= @maxID DO

      SET @clienteID = @minID;
      SET @pacoteID = (SELECT pacoteId from clientes WHERE id = @clienteID);
      SET @mensalidadeID = (SELECT MAX(id) FROM mensalidades WHERE clienteId = @clienteID);

      SET @isAtivo = (SELECT ativo FROM clientes WHERE id = @clienteID);

      SET @valor = (SELECT COLUMN_DEFAULT AS valor FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'academiaironfit'  AND TABLE_NAME = 'mensalidades' AND COLUMN_NAME = 'valor');
      SET @taxaDesconto = (SELECT taxaDesconto FROM pacotes WHERE id = @pacoteID);
    	SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);

      SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));
      SET @dataVencimentoAtual = (SELECT dataVencimento FROM mensalidades WHERE id = @mensalidadeID);
      SET @dataEmissao = (SELECT dataEmissao FROM mensalidades WHERE id = @mensalidadeID);
      SET @dataAtual = (SELECT CURDATE());
      SET @mesEmissao = (SELECT MONTH(@dataEmissao));
      SET @mesAtual = (SELECT MONTH(CURDATE()));

      #SET @diaVencimento = (SELECT DAY(@dataVencimentoAtual));
      #SET @mesVencimento = (SELECT MONTH(@dataVencimentoAtual));
      #SET @diaAtual = (SELECT DAY(CURDATE()));

      IF @clienteID > 0 AND @isAtivo = 1 THEN
        IF @dataAtual >= @dataVencimentoAtual AND @mesEmissao != @mesAtual THEN

          INSERT INTO mensalidades (valor, dataEmissao, dataVencimento, status,  createdAt, updatedAt, clienteId)
          VALUES (@valorMensalidade, NOW(), @dataVencimento, 'Em aberto', NOW(), NOW(), @clienteID);

        END IF;
      END IF;    

      SET @minID = @minID + 1; 

    END WHILE;

  COMMIT;
END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
/*!50106 DROP EVENT IF EXISTS `eventVerificarMensalidades` */;;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`academiaironfit`@`%`*/ /*!50106 EVENT `eventVerificarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-17 10:06:44' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por verificar mensalidades diariamente' DO BEGIN

  START TRANSACTION;

    SET @minID = (SELECT MIN(id) FROM mensalidades);

    SET @maxID = (SELECT MAX(id) FROM mensalidades);

    

    WHILE @minID <= @maxID DO

    

      SET @statusMensalidade = (SELECT status FROM mensalidades WHERE id = @minID);

      SET @vencimento = (SELECT dataVencimento FROM mensalidades WHERE id = @minID);

      

      IF @minID > 0 THEN

        IF @statusMensalidade = 'Em aberto' AND @vencimento < CURDATE() THEN

          UPDATE mensalidades

          SET status = 'Em atraso'

          WHERE ID = @minID;

        END IF;

      END IF;

      

      SET @minID = @minID + 1;

    END WHILE;

    

  COMMIT;

END */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'academiaironfit'
--
/*!50003 DROP PROCEDURE IF EXISTS `alterarVencimento` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `alterarVencimento`(
  idCliente int(11),
  dataVenc date
)
BEGIN
  
  SET @dataVencimento = dataVenc;
  
  SET @idCliente = idCliente;
  
  SET @idMensalidade = (SELECT MAX(id) FROM mensalidades WHERE clienteId = @idCliente);

  UPDATE mensalidades
  SET dataVencimento = @dataVencimento
  WHERE id = @idMensalidade;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `anteciparMensalidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `anteciparMensalidade`(
  idCliente int(11), 
  idPacote int(11),
  forma varchar(250),
  dataVenc date
)
BEGIN

  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'academiaironfit' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');

  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `pacotes` WHERE `id` = idPacote);

  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);

  SET @forma = forma;
  
  SET @dataVencimento = dataVenc;
  
  SET @idCliente = idCliente;

  INSERT

    INTO `mensalidades`

    (`valor`, `dataEmissao`, `dataVencimento`, `dataPagamento`, `formaPagamento`, `status`, `createdAt`, `updatedAt`, `clienteID`)

  VALUES

    (@valorMensalidade, CURDATE(), @dataVencimento, CURDATE(), @forma, 'Pago', NOW(), NOW(), @idCliente);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `primeiraMensalidadeAberta` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `primeiraMensalidadeAberta`()
BEGIN

  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'academiaironfit' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');

  SET @ultimoID = (SELECT MAX(`id`) FROM `clientes`);

  SET @idPacote = (SELECT pacoteId FROM clientes WHERE id = @ultimoID);

  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `pacotes` WHERE `id` = @idPacote);

  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);

  SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));

  INSERT

    INTO `mensalidades`

    (`valor`, `dataEmissao`, `dataVencimento`, `status`, `createdAt`, `updatedAt`, `clienteID`)

  VALUES

    (@valorMensalidade, CURDATE(), @dataVencimento, 'Em aberto', NOW(), NOW(), @ultimoID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `primeiraMensalidadePaga` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `primeiraMensalidadePaga`(idPacote int(11), forma varchar(250))
BEGIN

  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'academiaironfit' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');

  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `pacotes` WHERE `id` = idPacote);

  SET @ultimoID = (SELECT MAX(`id`) FROM `clientes`);

  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);

  SET @forma = forma;

  INSERT

    INTO `mensalidades`

    (`valor`, `dataEmissao`, `dataVencimento`, `dataPagamento`, `formaPagamento`, `status`, `createdAt`, `updatedAt`, `clienteID`)

  VALUES

    (@valorMensalidade, CURDATE(), CURDATE(), CURDATE(), @forma, 'Pago', NOW(), NOW(), @ultimoID);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatorioClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `relatorioClientes`(
  idAcademia int(11),
  mes int(11)
)
BEGIN
  
  SET @idAcademia = idAcademia;
  
  SET @mes = mes;
  
  SELECT * FROM clientes as C JOIN enderecoclientes as EC
  WHERE C.AcademiumId = @idAcademia AND MONTH(C.createdAt) = @mes AND C.id = EC.clienteId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatorioGastos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `relatorioGastos`(
  idAcademia int(11),
  mes int(11)
)
BEGIN
  
  SET @idAcademia = idAcademia;
  
  SET @mes = mes;
  
  SELECT * FROM gastos WHERE academiumId = @idAcademia AND MONTH(createdAt) = @mes;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatorioMensalidades` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`academiaironfit`@`%` PROCEDURE `relatorioMensalidades`(
  idAcademia int(11),
  mes int(11)
)
BEGIN
  
  SET @idAcademia = idAcademia;
  
  SET @mes = mes;
  
  SELECT * FROM mensalidades as M JOIN clientes as C
  WHERE C.AcademiumId = @idAcademia AND MONTH(M.createdAt) = @mes AND C.id = M.clienteId;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `viewMensalidade`
--

/*!50001 DROP VIEW IF EXISTS `viewMensalidade`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`academiaironfit`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `viewMensalidade` AS select `information_schema`.`COLUMNS`.`COLUMN_DEFAULT` AS `valor` from `INFORMATION_SCHEMA`.`COLUMNS` where ((`information_schema`.`COLUMNS`.`TABLE_SCHEMA` = 'academiaironfit') and (`information_schema`.`COLUMNS`.`TABLE_NAME` = 'mensalidades') and (`information_schema`.`COLUMNS`.`COLUMN_NAME` = 'valor')) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-04 16:38:09
