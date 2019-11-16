CREATE DATABASE  IF NOT EXISTS `academia` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `academia`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: academia
-- ------------------------------------------------------
-- Server version	5.7.26

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
  `nome` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academia`
--

LOCK TABLES `academia` WRITE;
/*!40000 ALTER TABLE `academia` DISABLE KEYS */;
INSERT INTO `academia` VALUES (1,'Academia Teste','2019-11-12 13:59:05','2019-11-12 13:59:05');
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
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AcademiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`AcademiumId`),
  CONSTRAINT `administradors_ibfk_1` FOREIGN KEY (`AcademiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradors`
--

LOCK TABLES `administradors` WRITE;
/*!40000 ALTER TABLE `administradors` DISABLE KEYS */;
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
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(255) DEFAULT NULL,
  `telefone` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT '1',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AcademiumId` int(11) DEFAULT NULL,
  `pacoteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`AcademiumId`),
  KEY `pacoteId` (`pacoteId`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`AcademiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`pacoteId`) REFERENCES `pacotes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Anderson','Alpin','1994-07-11','777.777.777-77','(77)77777-7777','anderson@gmail.com',1,'2019-11-12 13:58:56','2019-11-12 13:58:56',1,1),(2,'Testando','Santos','1999-01-22','555.555.555-55','(55)55555-5555','teste@gmail.com',0,'2019-11-13 15:28:00','2019-11-13 15:28:00',1,1);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enderecoclientes`
--

DROP TABLE IF EXISTS `enderecoclientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecoclientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `logradouro` varchar(255) DEFAULT NULL,
  `numero` varchar(255) DEFAULT NULL,
  `cidade` varchar(255) DEFAULT NULL,
  `bairro` varchar(255) DEFAULT NULL,
  `cep` varchar(255) DEFAULT NULL,
  `uf` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `enderecoclientes_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoclientes`
--

LOCK TABLES `enderecoclientes` WRITE;
/*!40000 ALTER TABLE `enderecoclientes` DISABLE KEYS */;
INSERT INTO `enderecoclientes` VALUES (1,'Logradouro Teste','22','Cidade Teste','Bairro Teste','00000-000','TE','2019-11-12 13:58:56','2019-11-12 13:58:56',1),(2,'Loa','51','Cid','Bai','55550-000','VD','2019-11-12 13:58:56','2019-11-12 13:58:56',2);
/*!40000 ALTER TABLE `enderecoclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL,
  `senha` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `administradorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administradorId` (`administradorId`),
  CONSTRAINT `logins_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `administradors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
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
  `dataEmissao` datetime NOT NULL,
  `dataVencimento` datetime NOT NULL,
  `dataPagamento` datetime DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'Em aberto',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `mensalidades_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidades`
--

LOCK TABLES `mensalidades` WRITE;
/*!40000 ALTER TABLE `mensalidades` DISABLE KEYS */;
INSERT INTO `mensalidades` VALUES (65,45,'2019-11-15 00:00:00','2019-11-14 00:00:00',NULL,'Em atraso','2019-11-15 00:00:00','2019-11-15 00:00:00',1),(66,45,'2019-11-15 00:00:00','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 00:00:00','2019-11-15 00:00:00',2),(67,45,'2019-11-15 00:00:00','2019-10-12 00:00:00',NULL,'Em atraso','2019-11-15 00:00:00','2019-11-15 00:00:00',1),(68,45,'2019-11-15 00:00:00','2019-10-13 00:00:00',NULL,'Em atraso','2019-11-15 00:00:00','2019-11-15 00:00:00',2),(79,45,'2019-11-15 14:22:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:22:35','2019-11-15 14:22:35',1),(80,45,'2019-11-15 14:22:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:22:35','2019-11-15 14:22:35',2),(81,45,'2019-11-15 14:27:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:27:35','2019-11-15 14:27:35',1),(82,45,'2019-11-15 14:27:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:27:35','2019-11-15 14:27:35',2),(83,45,'2019-11-15 14:30:33','2019-11-15 00:00:00','2019-11-15 14:30:33','Pago','2019-11-15 14:30:33','2019-11-15 14:30:33',2),(84,45,'2019-11-15 14:32:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:32:35','2019-11-15 14:32:35',1),(85,45,'2019-11-15 14:32:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:32:35','2019-11-15 14:32:35',2),(86,45,'2019-11-15 14:37:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:37:35','2019-11-15 14:37:35',1),(87,45,'2019-11-15 14:37:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:37:35','2019-11-15 14:37:35',2),(88,45,'2019-11-15 14:42:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:42:35','2019-11-15 14:42:35',1),(89,45,'2019-11-15 14:42:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:42:35','2019-11-15 14:42:35',2),(90,45,'2019-11-15 14:47:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:47:35','2019-11-15 14:47:35',1),(91,45,'2019-11-15 14:47:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:47:35','2019-11-15 14:47:35',2),(92,45,'2019-11-15 14:52:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:52:35','2019-11-15 14:52:35',1),(93,45,'2019-11-15 14:52:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:52:35','2019-11-15 14:52:35',2),(94,45,'2019-11-15 14:57:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:57:35','2019-11-15 14:57:35',1),(95,45,'2019-11-15 14:57:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 14:57:35','2019-11-15 14:57:35',2),(96,45,'2019-11-15 15:02:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 15:02:35','2019-11-15 15:02:35',1),(97,45,'2019-11-15 15:02:35','2019-12-15 00:00:00',NULL,'Em aberto','2019-11-15 15:02:35','2019-11-15 15:02:35',2);
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
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `taxaDesconto` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacotes`
--

LOCK TABLES `pacotes` WRITE;
/*!40000 ALTER TABLE `pacotes` DISABLE KEYS */;
INSERT INTO `pacotes` VALUES (1,'Nenhum','Não possui descontos',0,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Verão','Pacote especial de verão',15,'2019-11-12 13:59:34','2019-11-12 13:59:34');
/*!40000 ALTER TABLE `pacotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'academia'
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
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `eventGerarMensalidades` ON SCHEDULE EVERY 5 MINUTE STARTS '2019-11-15 14:07:35' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por gerar mensalidades mensalmente' DO BEGIN
  START TRANSACTION;
    SET @minID = (SELECT MIN(id) FROM clientes);
    SET @maxID = (SELECT MAX(id) FROM clientes);
    
    WHILE @minID <= @maxID DO
    
      SET @clienteID = @minID;
      SET @pacoteID = (SELECT pacoteId from clientes WHERE id = @clienteID); 
      SET @valor = (SELECT COLUMN_DEFAULT AS valor FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'academia'  AND TABLE_NAME = 'mensalidades' AND COLUMN_NAME = 'valor');
      SET @taxaDesconto = (SELECT taxaDesconto FROM pacotes WHERE id = @pacoteID);
	    SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);
      SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 30 DAY));
      
      IF @clienteID > 0 THEN
        INSERT INTO mensalidades (valor, dataEmissao, dataVencimento, createdAt, updatedAt, clienteId)
        VALUES (@valorMensalidade, NOW(), @dataVencimento, NOW(), NOW(), @clienteID);
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
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `eventVerificarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-11-15 14:25:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por verificar mensalidades diariamente' DO BEGIN
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
-- Dumping routines for database 'academia'
--
/*!50003 DROP PROCEDURE IF EXISTS `primeiraMensalidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_ALL_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `primeiraMensalidade`(
	idPacote int(11)
)
BEGIN
	SET @valor = (SELECT COLUMN_DEFAULT AS valor FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'academia'  AND TABLE_NAME = 'mensalidades' AND COLUMN_NAME = 'valor');
	SET @taxaDesconto = (SELECT taxaDesconto FROM pacotes WHERE id = idPacote);
	SET @ultimoID = (SELECT MAX(id) FROM Clientes);
	SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);
	INSERT INTO Mensalidades(valor, dataEmissao, dataVencimento, dataPagamento, status, createdAt, updatedAt, clienteID) 
    VALUES (@valorMensalidade, now(), curdate(), now(), 'Pago', now(), now(), @ultimoID);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-11-15 23:39:29
