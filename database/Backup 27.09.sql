-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: mysql669.umbler.com    Database: sublimemanager
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
  `valor` double NOT NULL DEFAULT '0',
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
INSERT INTO `academia` VALUES (1,'Profitness',100,'2020-01-06 20:52:45','2020-08-17 06:02:20'),(2,'Academia Teste',70,'2019-01-01 00:00:00','2020-09-14 10:42:54');
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
  CONSTRAINT `administradors_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administradors`
--

LOCK TABLES `administradors` WRITE;
/*!40000 ALTER TABLE `administradors` DISABLE KEYS */;
INSERT INTO `administradors` VALUES (1,'Pelé','Santana','Masculino','005.540.125-29','1980-06-22','(73)98891-8550','academiaprofitness@hotmail.com','chefe',1,'2020-01-06 20:52:45','2020-01-06 21:29:30',1),(2,'Usuário','User','Masculino','111.111.111-11','1999-11-11','(73)11111-1111','user@gmail.com','chefe',1,'2019-01-01 00:00:00','2019-01-01 00:00:00',2),(6,'Maria Beatriz ','santos santana','Feminino','076.887.935-30','1998-05-15','(73)98851-9278','biaazinha237@gmail.com','funcionario',1,'2020-08-17 14:30:57','2020-08-17 14:30:57',1),(7,'Leonardo','de Carvalho','Masculino','079.305.715-99','2001-01-04','(73)99939-3822','leonardocamacan@gmail.com','funcionario',1,'2020-08-21 06:15:44','2020-08-21 06:15:44',1),(9,'sdaf','Teste','Masculino','333.333.333-33','1111-02-21','(34)44444-4444','teste@gmail.com','funcionario',1,'2020-08-25 18:38:00','2020-08-25 18:38:00',2);
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
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`pacoteId`) REFERENCES `pacotes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (63,'Michelle ','Almeida Marques ','Feminino','1994-09-22','','(73)98134-0924','',1,'2020-08-17 06:25:03','2020-08-17 06:32:51',1,9),(64,'Darlete','Ribeiro Silva de Oliveira','Feminino','2000-12-19','','','',1,'2020-08-17 06:29:54','2020-08-17 06:29:54',1,9),(66,'Márcia ','Silva Ramos','Feminino','1973-01-23','','(73)98875-6249','',0,'2020-08-17 06:37:50','2020-09-21 17:08:40',1,8),(67,'Alejandro','Afonso Vargas','Masculino','1999-07-10','','(73)98123-3067','',1,'2020-08-17 06:40:15','2020-08-17 06:40:15',1,9),(68,'Gerliane ','Dias Barra','Feminino','1993-04-09','','(73)98862-4278','',1,'2020-08-17 06:41:54','2020-08-17 06:41:54',1,9),(69,'Marcelo','Batisti','Masculino','1988-05-27','','(73)98189-0159','',1,'2020-08-17 10:28:56','2020-08-17 10:28:56',1,9),(70,'Madson Flavio','santos porto','Masculino','2000-07-26','','(73)98152-3761','',1,'2020-08-17 16:07:22','2020-08-17 16:07:22',1,9),(71,'Ricardo ','Viana','Masculino','1983-06-15','','(73)98160-3744','',1,'2020-08-17 16:12:04','2020-08-17 16:12:04',1,9),(72,'Maria Hilda ','rodrigues Peluso','Feminino','1958-04-06','','(73)99900-1546','',1,'2020-08-17 17:09:24','2020-08-17 17:09:24',1,8),(73,'Daiane','Souza Santos','Feminino','1994-09-01','','(73)98163-0540','',0,'2020-08-17 17:23:18','2020-09-21 17:09:21',1,9),(74,'Jessica ','De Araújo lima','Feminino','1991-08-05','','(73)91243-692','',1,'2020-08-17 18:07:22','2020-08-17 18:07:22',1,9),(75,'Cleison','araújo','Masculino','0000-00-00','','','',1,'2020-08-17 18:10:15','2020-08-17 18:22:36',1,9),(76,'Lijia ','marina','Feminino','1983-06-15','','(73)98212-2826','',1,'2020-08-17 18:12:34','2020-08-17 18:12:34',1,9),(77,'Diego','Batista ','Masculino','1987-09-01','','(73)98113-7142','',1,'2020-08-17 19:02:32','2020-08-17 19:02:32',1,10),(78,'Aline','Marques','Feminino','1982-04-11','','(73)99123-4048','',1,'2020-08-17 19:15:06','2020-08-17 19:15:06',1,9),(79,'Elton ','Tinum santos','Masculino','1989-07-24','','(73)98233-6604','',1,'2020-08-17 19:18:22','2020-08-17 19:22:25',1,10),(80,'Wiliam','Alerson do Ouro','Masculino','1988-07-11','','(73)98209-4309','',1,'2020-08-17 19:21:31','2020-08-17 19:21:31',1,10),(81,'Edvan ','Junior','Masculino','1990-07-25','','','',1,'2020-08-17 19:51:59','2020-08-17 19:51:59',1,9),(82,'Rafael ','Joviano','Masculino','1988-10-17','','','',1,'2020-08-18 05:30:53','2020-08-19 07:36:26',1,9),(83,'Filipe','Santos Silva','Masculino','2000-09-24','','(73)98110-9342','',1,'2020-08-18 09:58:58','2020-08-18 09:58:58',1,9),(84,'Leoni','saldana','Feminino','1998-02-09','','(73)99835-7898','',1,'2020-08-18 15:22:28','2020-08-18 15:22:28',1,9),(85,'Jose Aloisio','silva conceição','Masculino','1965-02-18','','','',1,'2020-08-18 15:24:23','2020-08-18 15:24:23',1,9),(86,'Felipe ','Agobar','Masculino','1993-01-30','','(73)99955-3675','',1,'2020-08-18 15:41:48','2020-08-18 15:41:48',1,9),(87,'Amanda kelly','silva cardoso','Feminino','2001-08-11','','(73)98186-9487','',1,'2020-08-18 16:18:46','2020-08-18 16:18:46',1,9),(88,'Sara ','Rainer','Feminino','1986-04-11','','(73)99377-511','',1,'2020-08-18 18:05:50','2020-08-18 18:05:50',1,9),(89,'Ludmilla','Bezerra','Feminino','0000-00-00','','(73)99144-6380','',1,'2020-08-18 18:21:25','2020-08-18 18:21:25',1,9),(90,'Sabrina ','lima pinheiro','Feminino','1997-05-31','','(73)99134-4422','',1,'2020-08-19 14:38:13','2020-08-19 14:38:13',1,9),(91,'Laise','Santos Almeida','Feminino','1994-03-05','','(73)98801-9126','',1,'2020-08-20 06:08:51','2020-08-20 06:08:51',1,9),(92,'Yago ','Souza Silva','Masculino','1996-02-12','','(73)99821-6552','',1,'2020-08-20 07:01:17','2020-08-20 07:01:17',1,9),(93,'Rômulo ','Antônio Ribeiro Costa','Masculino','1996-06-13','','(73)99858-6904','',1,'2020-08-20 07:16:01','2020-08-20 07:16:01',1,9),(94,'Amanda','Freire','Feminino','1988-05-11','','(73)98194-6300','',1,'2020-08-20 11:11:03','2020-08-27 18:20:35',1,9),(95,'Reginaldo ','Oliveira alves','Masculino','1975-11-21','','(73)99152-9393','',1,'2020-08-20 13:09:16','2020-08-20 13:09:16',1,10),(96,'Karina','Vendittos santos','Feminino','1979-08-29','','(73)98120-7236','',1,'2020-08-20 15:15:42','2020-08-20 15:15:42',1,9),(97,'Reginaldo ','sena','Masculino','1980-06-22','','(73)98827-5872','',1,'2020-08-20 17:07:35','2020-08-20 17:07:35',1,9),(98,'Nádia','Sara','Feminino','1987-05-31','','(73)98167-3959','',1,'2020-08-24 07:15:21','2020-08-24 07:15:21',1,11),(99,'Adriene','Marques','Feminino','1980-12-31','','(73)32831-998','',1,'2020-08-24 07:18:20','2020-08-24 07:18:20',1,9),(100,'Samuel','Oliveira Santos','Masculino','0000-00-00','','(73)98123-0101','',1,'2020-08-24 10:31:56','2020-08-24 10:31:56',1,9),(101,'Natiene','S. Sobrinho ','Feminino','1991-02-18','','(73)98222-7883','',1,'2020-08-25 06:28:55','2020-08-25 06:28:55',1,11),(103,'Laura ','Carvalho Santana','Feminino','1998-05-28','','(73)99127-8040','',1,'2020-08-25 07:22:15','2020-08-25 07:22:15',1,11),(104,'Jaqueline','Machado','Feminino','1986-10-15','','','',1,'2020-08-25 10:35:44','2020-08-25 10:35:44',1,11),(105,'Patrick','Andrade da Silva','Masculino','1992-11-04','','(73)82130-820','',1,'2020-08-25 13:26:05','2020-09-22 10:19:39',1,9),(106,'Pedro Henrrique ','Batista Mendes','Masculino','1996-12-11','','(73)99199-8046','',1,'2020-08-25 13:56:08','2020-08-25 13:56:08',1,9),(107,'crismara','santos oliveira','Feminino','2000-04-25','','(73)98185-9596','',1,'2020-08-25 15:37:03','2020-08-25 15:37:03',1,11),(111,'sdaf','Teste','Masculino','1124-11-11','333.333.333-33','(34)44444-4444','asdfsad@gmail.com',1,'2020-08-25 18:37:12','2020-09-14 11:03:14',2,2),(112,'Mateus ','M barbosa','Masculino','1994-07-23','','(73)98235-0070','',1,'2020-08-26 19:08:34','2020-08-26 19:08:34',1,9),(113,'Liliane souza','Santos','Feminino','1989-06-08','','','',1,'2020-08-26 19:10:47','2020-08-26 19:10:47',1,8),(114,'Daniel ','avancini','Masculino','1999-10-02','','(73)98227-0968','',1,'2020-08-26 19:13:22','2020-08-26 19:13:22',1,9),(115,'jucimar ','de jesus ','Masculino','1976-12-12','','(73)99915-7771','',1,'2020-08-27 18:30:30','2020-08-27 18:30:30',1,9),(116,'Risomar ','Da Cruz','Masculino','1975-06-04','','(73)99943-6556','',1,'2020-08-27 19:09:00','2020-08-27 19:09:00',1,9),(117,'João Gabriel','cruz','Masculino','2002-04-21','','(73)99147-9301','',1,'2020-08-27 19:11:43','2020-08-27 19:11:43',1,9),(118,'Hilário','Andrade ','Masculino','1980-12-19','','','',1,'2020-08-28 05:47:03','2020-08-28 05:47:03',1,9),(119,'Dayana ','Carvalho Rocha ','Feminino','1997-11-12','','(73)98161-7473','',1,'2020-08-28 14:59:56','2020-08-28 14:59:56',1,11),(120,'Joáo Gabriel','Brito Tanajura','Masculino','1999-05-16','','(73)99144-1737','',1,'2020-08-28 16:27:35','2020-08-28 16:27:35',1,9),(121,'Valda ','Bezerra','Feminino','1972-02-04','','(73)99145-5659','',1,'2020-09-01 07:16:05','2020-09-01 07:16:05',1,10),(122,'Maria Gabriele','Carvalho Cardoso','Feminino','2000-05-12','','(73)98136-0180','',1,'2020-09-01 10:04:38','2020-09-01 10:04:38',1,9),(123,'Gerson Vitor','dos Santos Cavalcante','Masculino','2000-07-08','','(73)98815-1068','',1,'2020-09-01 11:06:45','2020-09-01 11:06:45',1,9),(124,'Alisson','nery','Masculino','1994-06-03','','(73)98212-2401','',1,'2020-09-01 15:58:54','2020-09-01 15:58:54',1,9),(125,'Lara ','Almeida santos ','Feminino','2003-03-29','','(73)98204-0617','',1,'2020-09-01 16:29:56','2020-09-01 16:29:56',1,9),(126,'Deilza ','santos Vasconcelos','Feminino','1976-10-06','','(73)98200-6721','',1,'2020-09-01 16:58:31','2020-09-01 16:58:31',1,11),(127,'Cosmira','Rosa nascimento','Feminino','1970-07-07','','(73)98129-0437','',1,'2020-09-01 18:25:12','2020-09-01 18:25:12',1,8),(128,'Gleidison','Santos','Masculino','1991-04-21','','(73)98171-3213','',1,'2020-09-01 19:16:28','2020-09-01 19:16:28',1,9),(129,'Tainá','Viana da Silva','Feminino','1994-10-26','','(73)98153-2301','',1,'2020-09-01 19:44:36','2020-09-01 19:44:36',1,11),(131,'Ana Carolina','Sá Macedo','Feminino','2000-12-27','','(73)98271-1200','',1,'2020-09-03 10:21:05','2020-09-03 10:21:05',1,8),(132,'Patrick','Santos Silva','Masculino','1982-05-14','','(73)99973-8551','',1,'2020-09-03 10:58:44','2020-09-03 10:58:44',1,9),(133,'Gabriel ','Oliveira Aragão','Masculino','1999-04-05','','(73)98229-8126','',1,'2020-09-03 11:35:49','2020-09-03 11:35:49',1,9),(134,'Tais ','Souza, F','Feminino','1995-03-06','','(73)98111-2494','',1,'2020-09-03 15:22:34','2020-09-03 15:22:34',1,9),(135,'Danilo','Reis ','Masculino','1992-11-21','','(73)99172-316','',1,'2020-09-03 17:16:42','2020-09-03 17:16:42',1,9),(136,'Sirleide ','Souza Santos','Feminino','1987-01-22','','(73)98100-2869','',1,'2020-09-08 10:04:40','2020-09-08 10:04:40',1,9),(137,'Alice Karollyne','de Oliveira Aragão','Feminino','2003-03-16','','(73)98229-8126','',1,'2020-09-08 12:07:13','2020-09-08 12:07:13',1,9),(138,'Isabel cristina','De Lima','Feminino','1981-10-27','','(73)99110-0450','',1,'2020-09-08 17:19:22','2020-09-08 17:19:22',1,9),(139,'Leon ','marques gomes','Masculino','1991-06-18','','(73)98209-4338','',1,'2020-09-08 19:06:47','2020-09-08 19:06:47',1,9),(140,'Glauber ','Almeida Rocha','Masculino','1987-09-30','','(73)98206-0901','',1,'2020-09-09 06:54:24','2020-09-09 06:54:24',1,9),(141,'Iago','Batista do Sacramento','Masculino','1998-05-12','','(73)99159-5982','',1,'2020-09-09 06:57:17','2020-09-09 06:57:17',1,9),(142,'Eduarda noely','almeida seara ','Feminino','2002-09-22','','(73)98237-3220','',1,'2020-09-09 15:03:41','2020-09-09 15:03:41',1,9),(143,'Haloesis','leite oliveira ','Masculino','1989-01-21','','(73)98208-1494','',1,'2020-09-09 18:12:07','2020-09-09 18:12:07',1,9),(144,'Dafne','O. Sobral','Feminino','1982-08-17','','(73)98803-3459','',1,'2020-09-10 11:26:49','2020-09-10 11:26:49',1,1),(145,'Tainá','Nobre','Feminino','1998-06-13','','(73)98198-3841','',1,'2020-09-10 13:43:54','2020-09-10 13:43:54',1,9),(146,'Suely ','Nobre de Carvalho','Feminino','1975-05-15','','(73)98198-3841','',1,'2020-09-10 13:58:38','2020-09-10 13:58:38',1,11),(147,'Jad',' dos anjos ','Masculino','1993-12-14','','','',1,'2020-09-10 15:53:06','2020-09-10 15:53:06',1,9),(148,'Eliane','Pereira Neves santos ','Feminino','1978-04-04','','(73)98222-051','',1,'2020-09-10 17:14:01','2020-09-10 17:14:01',1,9),(150,'Adrielly','Batista de Melo','Feminino','1990-07-27','','(73)98231-8962','',1,'2020-09-14 06:43:04','2020-09-22 10:21:42',1,1),(151,'Lucia','Cruz dos Santos','Feminino','1993-11-24','','(73)98215-5412','',1,'2020-09-14 08:01:00','2020-09-14 08:01:00',1,1),(152,'Matheus Henrique','Santos Silva','Masculino','1996-05-31','','(73)98829-1226','',1,'2020-09-14 08:12:21','2020-09-14 08:12:21',1,9),(153,'Angelica ','brito de jesus ','Feminino','1985-06-03','','(73)98228-9590','',1,'2020-09-14 16:15:08','2020-09-14 16:15:08',1,11),(154,'Edinelia ','Ferreira Silva','Feminino','1977-01-01','','(73)99100-4492','',1,'2020-09-14 18:05:25','2020-09-14 18:05:25',1,8),(156,'Dalziane Lima ','silva ','Feminino','1990-03-07','','(73)99145-1122','',1,'2020-09-14 18:54:54','2020-09-14 18:54:54',1,9),(157,'Osirleide ','Dos santos plineo ','Feminino','1981-03-12','','(73)98175-1418','',1,'2020-09-14 18:57:07','2020-09-14 18:57:07',1,9),(158,'Jennifer','Cabral','Feminino','1985-06-17','','(73)98229-4601','',1,'2020-09-15 07:00:12','2020-09-15 07:00:12',1,8),(159,'Rebeca ','Silva','Feminino','1989-08-09','','(73)99838-5189','',1,'2020-09-16 07:01:11','2020-09-16 07:01:11',1,9),(160,'Genivaldo','Assis','Masculino','1996-08-23','','(73)98109-4341','',1,'2020-09-16 08:22:33','2020-09-21 18:27:07',1,20),(161,'Diego','Marques','Masculino','1996-09-06','','(73)97146-9783','',1,'2020-09-16 08:24:57','2020-09-16 08:24:57',1,20),(162,'Jéssica Stefane','Santos Santana','Feminino','1994-06-01','','(73)99812-4726','',1,'2020-09-16 08:27:00','2020-09-16 08:27:00',1,20),(163,'Rayla','Soares Silva','Feminino','1996-06-12','','(73)99115-1455','',1,'2020-09-16 08:29:21','2020-09-16 08:29:21',1,20),(164,'Aryane ','pires','Feminino','1986-03-30','','(73)98149-7527','',1,'2020-09-16 15:05:03','2020-09-16 15:05:03',1,11),(165,'Neuzete ','cardoso santos ','Feminino','1980-05-14','','(73)99198-6830','',1,'2020-09-16 18:20:02','2020-09-16 18:20:02',1,9),(166,'Renata Matos','Matos','Feminino','1997-02-22','','(73)98180-6232','',1,'2020-09-21 11:20:42','2020-09-21 11:20:42',1,9),(167,'Rafaella','A Definir','Feminino','1997-02-16','','(73)98826-5185','',1,'2020-09-21 11:23:05','2020-09-21 11:23:05',1,9),(168,'Alexandre ','araújo','Masculino','1977-09-26','','(73)98238-0099','',1,'2020-09-21 15:52:11','2020-09-21 15:52:11',1,9),(169,'Luara Emilly','santos souza ','Feminino','2001-10-23','','(73)99112-8744','',1,'2020-09-21 17:23:10','2020-09-21 17:23:10',1,9),(170,'Everlin Caroline ','Ribeiro Assis ','Feminino','1997-06-26','','(73)98231-8822','',1,'2020-09-21 18:58:41','2020-09-21 18:58:41',1,9),(171,'Pedro ','G de Farias','Masculino','1986-03-02','','(73)99199-6519','',1,'2020-09-22 06:49:43','2020-09-22 06:49:43',1,9),(172,'Victor Hugo','Assis','Masculino','1992-05-19','','(84)99911-2384','',1,'2020-09-22 06:51:29','2020-09-22 06:51:29',1,9),(173,'Arthur','Santos Matos','Masculino','1999-12-20','','(73)91712-992','',1,'2020-09-22 08:24:04','2020-09-22 08:24:04',1,9),(174,'Adriene','O. Sousa','Feminino','2020-09-03','','(77)98864-1696','',1,'2020-09-22 08:27:27','2020-09-22 08:27:27',1,9),(175,'Leviton ','Lima carvalho','Masculino','1995-03-24','','(73)99140-6111','',1,'2020-09-22 16:03:57','2020-09-22 16:03:57',1,9),(176,'Laila Fernanda','Moreira Ponciano','Feminino','2003-12-02','','(73)99179-4243','',1,'2020-09-22 17:02:23','2020-09-22 17:02:23',1,9),(177,'sirleide','souza','Feminino','1994-04-30','','(73)98255-3202','',1,'2020-09-22 17:37:13','2020-09-22 17:37:13',1,9),(178,'Isabela','Lima de Farias ','Feminino','1998-09-23','','(73)99939-1672','',1,'2020-09-23 05:59:47','2020-09-23 05:59:47',1,11),(179,'Ariana ','lima dos santos ','Feminino','1985-01-14','','(73)98171-3324','',1,'2020-09-23 15:59:08','2020-09-23 15:59:08',1,11),(180,'Milena ','Araújo Pereira','Feminino','2002-01-06','','(73)99118-7752','',1,'2020-09-24 07:32:57','2020-09-24 07:32:57',1,21),(181,'Mirelle ','Araújo Pereira','Feminino','2004-07-05','','(73)99120-6865','',1,'2020-09-24 07:34:14','2020-09-24 07:34:14',1,21),(182,'Francielle ','silva dos santos ','Feminino','2001-07-07','','(73)98234-2698','',1,'2020-09-24 18:58:52','2020-09-24 18:58:52',1,9);
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
  CONSTRAINT `enderecoacademia_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoacademia`
--

LOCK TABLES `enderecoacademia` WRITE;
/*!40000 ALTER TABLE `enderecoacademia` DISABLE KEYS */;
INSERT INTO `enderecoacademia` VALUES (1,'Praça Mário Batista','48','Camacã','Centro','45880000','BA','2020-01-06 20:52:45','2020-08-17 06:02:20',1),(2,'sa','142','sadf','sadf','43414-124','BA','2019-01-01 00:00:00','2020-09-14 10:42:54',2);
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
  CONSTRAINT `enderecoadministradors_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `administradors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoadministradors`
--

LOCK TABLES `enderecoadministradors` WRITE;
/*!40000 ALTER TABLE `enderecoadministradors` DISABLE KEYS */;
INSERT INTO `enderecoadministradors` VALUES (1,'praça mario batista','1','camacan','centro','45880000','BA','2020-01-06 20:52:45','2020-01-06 21:29:30',1),(2,'safa','342','sadfs','safd','12412412','BA','2019-01-01 00:00:00','2019-01-01 00:00:00',2),(6,'rua são pedro ','333','Camacan','Cidade Alta','45880-000','BA','2020-08-17 14:30:57','2020-08-17 14:30:57',6),(7,'Rua dois de julho','805','Camacã','Centro','45880-000','BA','2020-08-21 06:15:44','2020-08-21 06:15:44',7),(9,'SDFAsddaf','12','sdafasdfasfd','dsafasdf','12323-321','PI','2020-08-25 18:38:00','2020-08-25 18:38:00',9);
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
  CONSTRAINT `enderecoclientes_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enderecoclientes`
--

LOCK TABLES `enderecoclientes` WRITE;
/*!40000 ALTER TABLE `enderecoclientes` DISABLE KEYS */;
INSERT INTO `enderecoclientes` VALUES (63,'Colina dos Laranjais','307','Camacã','','45880-000','BA','2020-08-17 06:25:03','2020-08-17 06:32:51',63),(64,'Ana Nere','','Camacã','','45880-000','BA','2020-08-17 06:29:54','2020-08-17 06:29:54',64),(66,'Avenida Dr. João Vargens ','','Camacã','Centro','45880-000','BA','2020-08-17 06:37:50','2020-09-08 18:05:25',66),(67,'Rua Bahia','','Camacã','Centro','45880-000','BA','2020-08-17 06:40:15','2020-08-17 06:40:15',67),(68,'Rua São Francisco','','Camacã','','45880-000','BA','2020-08-17 06:41:54','2020-08-17 06:41:54',68),(69,'Rua Canavieiras ','20','Camacã','Centro','45880-000','BA','2020-08-17 10:28:56','2020-08-17 10:28:56',69),(70,'praça mario batista ','217','Camacan','Centro','45880-000','BA','2020-08-17 16:07:22','2020-08-17 16:07:22',70),(71,'travessa califórnia','153','Camacan','Centro','45880-000','BA','2020-08-17 16:12:04','2020-08-17 16:12:04',71),(72,'Nossa senhora do socorro','65','Camacan','Cidade Alta','45880-000','BA','2020-08-17 17:09:24','2020-08-17 17:09:24',72),(73,'da coelba','412','Camacan','Cidade Alta','45880-000','BA','2020-08-17 17:23:18','2020-08-17 17:23:18',73),(74,'igreja catolica ','','Camacan','Centro','45880-000','BA','2020-08-17 18:07:22','2020-08-17 18:07:22',74),(75,'carlos gomes','210','Camacan','Centro','','BA','2020-08-17 18:10:15','2020-08-17 18:22:36',75),(76,'carlos gomes','210','Camacan','','45880-000','BA','2020-08-17 18:12:34','2020-08-17 18:12:34',76),(77,'2 De Julho','817','Camacan','Centro','','BA','2020-08-17 19:02:32','2020-08-17 19:02:32',77),(78,'Da Cabana','','Camacan','Centro','45880-000','BA','2020-08-17 19:15:06','2020-08-17 19:15:06',78),(79,'Castro alves','163','Camacan','','45880-000','BA','2020-08-17 19:18:22','2020-08-17 19:22:25',79),(80,'2 De Julho','1040','Camacan','Centro','45880-000','BA','2020-08-17 19:21:31','2020-08-17 19:21:31',80),(81,'carlos gomes','','Camacan','','45880-000','BA','2020-08-17 19:51:59','2020-08-17 19:51:59',81),(82,'Rua Antônio Pereira','628','Camacã','Centro','45880-000','BA','2020-08-18 05:30:53','2020-08-19 07:36:26',82),(83,'Rua das Laranjeiras','124','Camacã','Cidade alta','45880-000','BA','2020-08-18 09:58:58','2020-08-18 09:58:58',83),(84,'2 De Julho','1144','Camacan','Centro','45880-000','BA','2020-08-18 15:22:28','2020-08-18 15:22:28',84),(85,'Bela vista','145','Camacan','','','BA','2020-08-18 15:24:23','2020-08-18 15:24:23',85),(86,'Avenida Dr João Vargens ','79','Camacan','Centro','45880-000','BA','2020-08-18 15:41:48','2020-08-18 15:41:48',86),(87,'colina dos laranjais','260','Camacan','','45880-000','BA','2020-08-18 16:18:46','2020-08-18 16:18:46',87),(88,'Da Cabana','','Camacan','','45880-000','BA','2020-08-18 18:05:50','2020-08-18 18:05:50',88),(89,'santa lucia ','136','Camacan','','','BA','2020-08-18 18:21:25','2020-08-18 18:21:25',89),(90,'california','376','Camacan','Centro','45880-000','BA','2020-08-19 14:38:13','2020-08-19 14:38:13',90),(91,'Rua Nova','21','Camacã','Centro','45880-000','BA','2020-08-20 06:08:51','2020-08-20 06:08:51',91),(92,'Rua Everaldo Figueredo dos Anjos','162','Camacã','Centro','45880-000','BA','2020-08-20 07:01:17','2020-08-20 07:01:17',92),(93,'Rua Santa Lúcia','174','Camacã','Centro','45880-000','BA','2020-08-20 07:16:01','2020-08-20 07:16:01',93),(94,'Rua canavieiras','20','Camacã','Centro','45880-000','BA','2020-08-20 11:11:03','2020-08-27 18:20:35',94),(95,'Barão Do Rio Branco','144','Camacan','Centro','45880-000','BA','2020-08-20 13:09:17','2020-08-20 13:09:17',95),(96,'uniao rocha','44','Camacan','','','BA','2020-08-20 15:15:42','2020-08-20 15:15:42',96),(97,'são vicente','11','Camacan','','','BA','2020-08-20 17:07:35','2020-08-20 17:07:35',97),(98,'Rua Carlos Gomes','317','Camacã','Centro','45880-000','BA','2020-08-24 07:15:21','2020-08-24 07:15:21',98),(99,'Rua de Mascote','102','Camacã','Centro','','BA','2020-08-24 07:18:20','2020-08-24 07:18:20',99),(100,'Rua Rui Barbosa','','Camacã','Centro','','BA','2020-08-24 10:31:56','2020-08-24 10:31:56',100),(101,'Praça Mário Batista','32','Camacã','Centro','45880-000','BA','2020-08-25 06:28:56','2020-08-25 06:28:56',101),(103,'Alto Paraguai','283','Camacã','Cidade alta','45880-000','BA','2020-08-25 07:22:15','2020-08-25 07:22:15',103),(104,'Rua dois de julho','911','Camacã','Centro','45880-000','BA','2020-08-25 10:35:44','2020-08-25 10:35:44',104),(105,'praça do bené','149','Camacan','Centro','','BA','2020-08-25 13:26:05','2020-09-22 10:19:39',105),(106,'Barão Do Rio Branco','65','Camacan','Centro','','BA','2020-08-25 13:56:08','2020-08-25 13:56:08',106),(107,'travessa joana angelica','49','Camacan','','','BA','2020-08-25 15:37:03','2020-08-25 15:37:03',107),(111,'SDFAsddaf','123','sdafasdfasfd','dsafasdf','12323-321','PR','2020-08-25 18:37:12','2020-09-14 11:02:11',111),(112,'Tv. Boa vista','265','Camacan','Centro','','BA','2020-08-26 19:08:34','2020-08-26 19:08:34',112),(113,'antonio pereira dos santos','565','Camacan','Centro','','BA','2020-08-26 19:10:47','2020-08-26 19:10:47',113),(114,'churrascaria do paulão','','Camacan','','','BA','2020-08-26 19:13:22','2020-08-26 19:13:22',114),(115,'antonio pereira dos santos','915','Camacan','','',NULL,'2020-08-27 18:30:30','2020-08-27 18:30:30',115),(116,'Barão Do Rio Branco','126','Camacan','Centro','',NULL,'2020-08-27 19:09:00','2020-08-27 19:09:00',116),(117,'rua barão do rio branco','126','Camacan','Centro','','BA','2020-08-27 19:11:43','2020-08-27 19:11:43',117),(118,'','','Camacã','','45880-000','BA','2020-08-28 05:47:03','2020-08-28 05:47:03',118),(119,'uniao rocha','','Camacan','Leoveutura','',NULL,'2020-08-28 14:59:56','2020-08-28 14:59:56',119),(120,'carlos gomes','298','Camacan','','','BA','2020-08-28 16:27:35','2020-08-28 16:27:35',120),(121,'Rua Santa Lúcia','132','Camacã','Centro','45880-000','BA','2020-09-01 07:16:05','2020-09-01 07:16:05',121),(122,'Rua Campo Santo','16','Camacã','Centro','45880-000','BA','2020-09-01 10:04:38','2020-09-01 10:04:38',122),(123,'Praça Mário Batista','','Camacã','Centro','45880-000','BA','2020-09-01 11:06:45','2020-09-01 11:06:45',123),(124,'travessa  Alto Paraguai','62','Camacan','','','BA','2020-09-01 15:58:54','2020-09-01 15:58:54',124),(125,'rua Ana Nery','184','Camacan','','','BA','2020-09-01 16:29:56','2020-09-01 16:29:56',125),(126,'travessa  Alto Paraguai','62','Camacan','','','BA','2020-09-01 16:58:31','2020-09-01 16:58:31',126),(127,'Ladslaw padilha','66','Camacan','','','BA','2020-09-01 18:25:12','2020-09-01 18:25:12',127),(128,'rua são pedro ','21','Camacan','Cidade Alta','','BA','2020-09-01 19:16:29','2020-09-01 19:16:29',128),(129,'travessa Belo Horizonte ','03','Camacan','','','BA','2020-09-01 19:44:36','2020-09-01 19:44:36',129),(131,'Rua Luciano Santana','10','Camacã','Centro','45880-000','BA','2020-09-03 10:21:05','2020-09-03 10:21:05',131),(132,'Avenida dos pioneiros','215','Camacã','Centro','45880-000','BA','2020-09-03 10:58:44','2020-09-03 10:58:44',132),(133,'Rua Nova','145','Camacã','Centro','45880-000','BA','2020-09-03 11:35:49','2020-09-03 11:35:49',133),(134,'antonio pereira dos santos','761','Camacan','','','BA','2020-09-03 15:22:34','2020-09-03 15:22:34',134),(135,'rua   dr osvaldo valverde','148','Camacan','','',NULL,'2020-09-03 17:16:42','2020-09-03 17:16:42',135),(136,'Rua Antonio Pereira dos Santos','565','Camacã','Centro','45880-000','BA','2020-09-08 10:04:40','2020-09-08 10:04:40',136),(137,'Rua Manoel J. santos','145','Camacã','Centro','','BA','2020-09-08 12:07:14','2020-09-08 12:07:14',137),(138,'antonio pereira dos santos','145','Camacan','','','BA','2020-09-08 17:19:23','2020-09-08 17:19:23',138),(139,'antonio pereira dos santos','702','Camacan','','',NULL,'2020-09-08 19:06:47','2020-09-08 19:06:47',139),(140,'Rua dois de julho','605','Camacã','Centro','45880-000','BA','2020-09-09 06:54:24','2020-09-09 06:54:24',140),(141,'Rua independência','129','Camacã','Centro','45880-000','BA','2020-09-09 06:57:17','2020-09-09 06:57:17',141),(142,'Rui Barbosa ','12','Camacan','','','BA','2020-09-09 15:03:41','2020-09-09 15:03:41',142),(143,'rua renato cabral','163','Camacan','Centro','','BA','2020-09-09 18:12:08','2020-09-09 18:12:08',143),(144,'Avenida Dr. João Vargens','15','Camacã','Centro','45880-000','BA','2020-09-10 11:26:50','2020-09-10 11:26:50',144),(145,'Barão Do Rio Branco','190','Camacan','Centro','','BA','2020-09-10 13:43:54','2020-09-10 13:43:54',145),(146,'Barão Do Rio Branco','190','Camacan','Centro','','BA','2020-09-10 13:58:39','2020-09-10 13:58:39',146),(147,'alto paraguai ','287','Camacan','','','BA','2020-09-10 15:53:06','2020-09-10 15:53:06',147),(148,'travessa califórnia','56','Camacan','','','BA','2020-09-10 17:14:01','2020-09-10 17:14:01',148),(150,'Rua São João','611','Camacã','Centro','45880-000','BA','2020-09-14 06:43:04','2020-09-22 10:21:43',150),(151,'Rua das Flores','97','Camacã','Centro','45880-000','BA','2020-09-14 08:01:00','2020-09-14 08:01:00',151),(152,'Rua dois de julho ','575','Camacã','Centro','45880-000','BA','2020-09-14 08:12:21','2020-09-14 08:12:21',152),(153,'Lucianno Santana ','43','Camacan','','','BA','2020-09-14 16:15:08','2020-09-14 16:15:08',153),(154,'Fazenda Santa Rita ','','Camacan','','',NULL,'2020-09-14 18:05:25','2020-09-14 18:05:25',154),(156,'São João','443','Camacan','','','BA','2020-09-14 18:54:54','2020-09-14 18:54:54',156),(157,'colina dos laranjais','261','Camacan','','','BA','2020-09-14 18:57:07','2020-09-14 18:57:07',157),(158,'Rua São Boaventura','234','Camacã','Centro','45880-000','BA','2020-09-15 07:00:12','2020-09-15 07:00:12',158),(159,'Rua Ana nery','350','Camacã','Centro','45880-000','BA','2020-09-16 07:01:11','2020-09-16 07:01:11',159),(160,'Rua Barão do Rio Branco','363','Camacã','Centro','45880-000','BA','2020-09-16 08:22:34','2020-09-21 18:27:07',160),(161,'Rua Barão do Rio Branco','303','Camacã','Centro','45880-000','BA','2020-09-16 08:24:57','2020-09-16 08:24:57',161),(162,'Rua Barão do Rio Branco','27','Camacã','Centro','45880-000','BA','2020-09-16 08:27:00','2020-09-16 08:27:00',162),(163,'Rua Antônio Pereira dos Santos','387','Camacã','Centro','45880-000','BA','2020-09-16 08:29:22','2020-09-16 08:29:22',163),(164,'Rua de Macote ','102','Camacan','Centro','','BA','2020-09-16 15:05:03','2020-09-16 15:05:03',164),(165,'california','13','Camacan','','','BA','2020-09-16 18:20:02','2020-09-16 18:20:02',165),(166,'Praça Mário Batista','176','Camacã','Centro ','45880-000','BA','2020-09-21 11:20:42','2020-09-21 11:20:42',166),(167,'Rua Ana Nere','488','Camacã','Centro','45880-000','BA','2020-09-21 11:23:05','2020-09-21 11:23:05',167),(168,'rua bahia','138','Camacan','','','BA','2020-09-21 15:52:11','2020-09-21 15:52:11',168),(169,'av dr joão vargens ','671','Camacan','','',NULL,'2020-09-21 17:23:10','2020-09-21 17:23:10',169),(170,'california','399','Camacan','','','BA','2020-09-21 18:58:41','2020-09-21 18:58:41',170),(171,'Av Dr João Vargens','102','Camacã','','45880-000','BA','2020-09-22 06:49:43','2020-09-22 06:49:43',171),(172,'Av Dr João Vargens','102','Camacã','Centro','45880-000','BA','2020-09-22 06:51:29','2020-09-22 06:51:29',172),(173,'Rua Barão do Rio Branco','133','Camacã','Centro','','BA','2020-09-22 08:24:04','2020-09-22 08:24:04',173),(174,'Rua São Pedro','98','Camacã','Centro','','BA','2020-09-22 08:27:28','2020-09-22 08:27:28',174),(175,'renato cabral','156','Camacan','','',NULL,'2020-09-22 16:03:57','2020-09-22 16:03:57',175),(176,'Avenida Dr João Vargens ','649','Camacan','','','BA','2020-09-22 17:02:23','2020-09-22 17:02:23',176),(177,'alto sumaré','308','Camacan','','','BA','2020-09-22 17:37:13','2020-09-22 17:37:13',177),(178,'','267','Camacã','','45880-000','BA','2020-09-23 05:59:47','2020-09-23 05:59:47',178),(179,'professora Tereza Lima ','169','Camacan','','','BA','2020-09-23 15:59:08','2020-09-23 15:59:08',179),(180,'Osvaldo Valverde','172','Camacã','Centro','','BA','2020-09-24 07:32:57','2020-09-24 07:32:57',180),(181,'Osvaldo Valverde','172','Camacã','','','BA','2020-09-24 07:34:14','2020-09-24 07:34:14',181),(182,'parque casa nova ','10','Camacan','','','BA','2020-09-24 18:58:52','2020-09-24 18:58:52',182);
/*!40000 ALTER TABLE `enderecoclientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `examebiometricos`
--

DROP TABLE IF EXISTS `examebiometricos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examebiometricos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `altura` float DEFAULT NULL,
  `peso` float NOT NULL,
  `imc` float NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `examebiometricos_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `examebiometricos`
--

LOCK TABLES `examebiometricos` WRITE;
/*!40000 ALTER TABLE `examebiometricos` DISABLE KEYS */;
/*!40000 ALTER TABLE `examebiometricos` ENABLE KEYS */;
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
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gastos`
--

LOCK TABLES `gastos` WRITE;
/*!40000 ALTER TABLE `gastos` DISABLE KEYS */;
INSERT INTO `gastos` VALUES (5,25,'Desconto para Amanda Kelly','2020-08-19 06:34:51','2020-08-19 06:34:51',1),(6,16,'alcool,papel toalha e papel higienico','2020-08-19 17:32:35','2020-08-19 17:32:35',1),(7,30,'Desconto para Laise Almeida','2020-08-20 06:09:23','2020-08-20 06:09:23',1),(8,0,'Mateus M. Barbosa','2020-08-26 19:14:45','2020-08-26 19:14:45',1),(9,0,'Daniel Avancini','2020-08-26 19:15:19','2020-08-26 19:15:19',1),(10,10,'desconto Risomar e Joáo Gabriel( filho )','2020-08-28 15:01:46','2020-08-28 15:01:46',1),(11,70,'conta de luz','2020-08-28 16:53:47','2020-08-28 16:53:47',1),(12,200,'Parte do aluguel','2020-09-04 07:28:48','2020-09-04 07:28:48',1),(13,50,'Álcool ','2020-09-08 07:05:44','2020-09-08 07:05:44',1),(14,498.1,'contas de água ','2020-09-09 13:43:40','2020-09-09 13:43:40',1),(15,25,'materiais  de Limpeza','2020-09-15 14:05:48','2020-09-15 14:05:48',1),(16,60,'produtos de limpeza','2020-09-23 15:54:24','2020-09-23 15:54:24',1),(17,32,'Vasos Para alcoól','2020-09-23 15:59:56','2020-09-23 15:59:56',1),(18,20,'Alimentação','2020-09-24 07:59:30','2020-09-24 07:59:30',1);
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
  CONSTRAINT `logins_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `administradors` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,'academiaprofitness@hotmail.com','$2a$10$XvHStHZ9C32i/yKdxO8XceHX9yX58VzinL.YXSP9XBlDuZma.wTFC','2020-01-06 20:52:45','2020-08-21 06:19:52',1),(2,'user@gmail.com','$2a$10$aQ10Mf9XwvaO/4rF8CjjMO0GDKC8kq/5OPGPpFTDj1yXgtP7ZfcCi','2019-01-01 00:00:00','2019-01-01 00:00:00',2),(4,'biamariasantana@hotmail.com','$2a$10$qupHbiake.4AbD5bVSSTL.ON2G82kGuU/FgSaulbZZ7beXYHTSQqK','2020-08-17 14:13:54','2020-08-17 14:13:54',NULL),(5,'bIaazinha237@gmailcom','$2a$10$X1m4UrUbQg7t5X6dM24vdOBqtYnrK8u31Vf1YPOs/ztWd1mOHFfX6','2020-08-17 14:18:14','2020-08-17 14:18:14',NULL),(6,'biaazinha237@gmail.com','$2a$10$3n5iBWne8bx7GXGgVzbNAe1PCrY3xCGl8CpZaOuUifG6abcGahqcS','2020-08-17 14:30:57','2020-08-17 14:30:57',6),(7,'leonardocamacan@gmail.com','$2a$10$9Dp7kRocUjwmISN7V.VStOwsNko81TAW0CJx3FiKHnArMelEMVCkq','2020-08-21 06:15:44','2020-08-21 06:15:44',7),(9,'teste@gmail.com','$2a$10$Nzj9ypJ/ftk4idDo0HxJse4ZvMuCTKJ3oPwJ7nhviMwKj9KkuOmSq','2020-08-25 18:38:00','2020-08-25 18:38:00',9);
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
  CONSTRAINT `mensalidadeacademia_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `academia` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidadeacademia`
--

LOCK TABLES `mensalidadeacademia` WRITE;
/*!40000 ALTER TABLE `mensalidadeacademia` DISABLE KEYS */;
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
  `valor` double NOT NULL DEFAULT '0',
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
  CONSTRAINT `mensalidades_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensalidades`
--

LOCK TABLES `mensalidades` WRITE;
/*!40000 ALTER TABLE `mensalidades` DISABLE KEYS */;
INSERT INTO `mensalidades` VALUES (195,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:25:08','2020-08-17 06:25:08',63),(196,80,'2020-08-17','2020-09-17','2020-09-23','Dinheiro','Pago','2020-08-17 06:25:08','2020-09-23 17:58:48',63),(197,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:30:00','2020-08-17 06:30:00',64),(198,80,'2020-08-17','2020-09-17','2020-09-23','Dinheiro','Pago','2020-08-17 06:30:00','2020-09-23 17:39:21',64),(201,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:37:55','2020-08-17 06:37:55',66),(202,80,'2020-08-17','2020-09-17',NULL,NULL,'Em atraso','2020-08-17 06:37:55','2020-08-17 06:37:55',66),(203,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:40:21','2020-08-17 06:40:21',67),(204,80,'2020-08-17','2020-09-17','2020-09-22','Cartão','Pago','2020-08-17 06:40:21','2020-09-22 08:20:09',67),(205,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:42:00','2020-08-17 06:42:00',68),(206,80,'2020-08-17','2020-09-17','2020-09-21','Dinheiro','Pago','2020-08-17 06:42:00','2020-09-21 15:01:21',68),(207,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 10:29:01','2020-08-17 10:29:01',69),(208,80,'2020-08-17','2020-09-17','2020-09-25','Transferência','Pago','2020-08-17 10:29:01','2020-09-25 10:54:52',69),(209,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 16:07:28','2020-08-17 16:07:28',70),(210,80,'2020-08-17','2020-09-17','2020-09-17','Dinheiro','Pago','2020-08-17 16:07:28','2020-09-17 15:56:11',70),(211,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 16:12:10','2020-08-17 16:12:10',71),(212,80,'2020-08-17','2020-09-17','2020-09-23','Dinheiro','Pago','2020-08-17 16:12:11','2020-09-23 17:47:23',71),(213,65,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 17:09:30','2020-08-17 17:09:30',72),(214,65,'2020-08-17','2020-09-17','2020-09-21','Dinheiro','Pago','2020-08-17 17:09:30','2020-09-21 17:03:40',72),(215,80,'2020-08-17','2020-08-17','2020-08-17','Cartão','Pago','2020-08-17 17:23:24','2020-08-17 17:23:24',73),(216,80,'2020-08-17','2020-09-17',NULL,NULL,'Em atraso','2020-08-17 17:23:24','2020-08-17 17:23:24',73),(217,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 18:07:28','2020-08-17 18:07:28',74),(218,80,'2020-08-17','2020-09-17','2020-09-22','Dinheiro','Pago','2020-08-17 18:07:28','2020-09-22 08:25:49',74),(219,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 18:10:21','2020-08-17 18:10:21',75),(220,80,'2020-08-17','2020-09-17','2020-09-17','Dinheiro','Pago','2020-08-17 18:10:21','2020-09-17 18:07:57',75),(221,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 18:12:40','2020-08-17 18:12:40',76),(222,80,'2020-08-17','2020-09-17','2020-09-17','Dinheiro','Pago','2020-08-17 18:12:40','2020-09-17 18:08:29',76),(223,70,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:02:38','2020-08-17 19:02:38',77),(224,70,'2020-08-17','2020-09-17',NULL,NULL,'Em atraso','2020-08-17 19:02:38','2020-08-17 19:02:38',77),(225,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:15:12','2020-08-17 19:15:12',78),(226,80,'2020-08-17','2020-09-17','2020-09-17','Dinheiro','Pago','2020-08-17 19:15:12','2020-09-17 18:04:27',78),(227,70,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:18:28','2020-08-17 19:18:28',79),(228,70,'2020-08-17','2020-09-17','2020-09-17','Dinheiro','Pago','2020-08-17 19:18:28','2020-09-17 19:10:05',79),(229,70,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:21:37','2020-08-17 19:21:37',80),(230,70,'2020-08-17','2020-09-17',NULL,NULL,'Em atraso','2020-08-17 19:21:37','2020-08-17 19:21:37',80),(231,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:52:05','2020-08-17 19:52:05',81),(232,80,'2020-08-17','2020-09-17',NULL,NULL,'Em atraso','2020-08-17 19:52:05','2020-08-17 19:52:05',81),(233,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 05:30:59','2020-08-18 05:30:59',82),(234,80,'2020-08-18','2020-09-18','2020-09-23','Dinheiro','Pago','2020-08-18 05:30:59','2020-09-23 05:26:07',82),(235,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 09:59:04','2020-08-18 09:59:04',83),(236,80,'2020-08-18','2020-09-18','2020-09-21','Dinheiro','Pago','2020-08-18 09:59:04','2020-09-21 08:11:55',83),(237,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 15:22:34','2020-08-18 15:22:34',84),(238,80,'2020-08-18','2020-09-18','2020-09-14','Dinheiro','Pago','2020-08-18 15:22:34','2020-09-14 13:13:58',84),(239,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 15:24:29','2020-08-18 15:24:29',85),(240,80,'2020-08-18','2020-09-18','2020-09-21','Dinheiro','Pago','2020-08-18 15:24:29','2020-09-21 16:55:57',85),(241,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 15:41:54','2020-08-18 15:41:54',86),(242,80,'2020-08-18','2020-09-18',NULL,NULL,'Em atraso','2020-08-18 15:41:54','2020-08-18 15:41:54',86),(243,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 16:18:52','2020-08-18 16:18:52',87),(244,80,'2020-08-18','2020-09-18',NULL,NULL,'Em atraso','2020-08-18 16:18:52','2020-08-18 16:18:52',87),(245,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 18:05:56','2020-08-18 18:05:56',88),(246,80,'2020-08-18','2020-09-18',NULL,NULL,'Em atraso','2020-08-18 18:05:56','2020-08-18 18:05:56',88),(247,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 18:21:32','2020-08-18 18:21:32',89),(248,80,'2020-08-18','2020-09-18',NULL,NULL,'Em atraso','2020-08-18 18:21:32','2020-08-18 18:21:32',89),(249,80,'2020-08-19','2020-08-19','2020-08-19','Dinheiro','Pago','2020-08-19 14:38:20','2020-08-19 14:38:20',90),(250,80,'2020-08-19','2020-09-19',NULL,NULL,'Em atraso','2020-08-19 14:38:20','2020-08-19 14:38:20',90),(251,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 06:08:58','2020-08-20 06:08:58',91),(252,80,'2020-08-20','2020-09-20',NULL,NULL,'Em atraso','2020-08-20 06:08:58','2020-08-20 06:08:58',91),(253,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 07:01:24','2020-08-20 07:01:24',92),(254,80,'2020-08-20','2020-09-20','2020-09-21','Dinheiro','Pago','2020-08-20 07:01:24','2020-09-21 07:05:05',92),(255,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 07:16:08','2020-08-20 07:16:08',93),(256,80,'2020-08-20','2020-09-20',NULL,NULL,'Em atraso','2020-08-20 07:16:08','2020-08-20 07:16:08',93),(257,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 11:11:10','2020-08-20 11:11:10',94),(258,80,'2020-08-20','2020-09-20','2020-09-25','Transferência','Pago','2020-08-20 11:11:10','2020-09-25 10:55:18',94),(259,70,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 13:09:24','2020-08-20 13:09:24',95),(260,70,'2020-08-20','2020-09-20',NULL,NULL,'Em atraso','2020-08-20 13:09:24','2020-08-20 13:09:24',95),(261,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 15:15:49','2020-08-20 15:15:49',96),(262,80,'2020-08-20','2020-09-20',NULL,NULL,'Em atraso','2020-08-20 15:15:50','2020-08-20 15:15:50',96),(263,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 17:07:42','2020-08-20 17:07:42',97),(264,80,'2020-08-20','2020-09-20','2020-09-21','Dinheiro','Pago','2020-08-20 17:07:42','2020-09-21 17:02:55',97),(265,60,'2020-08-24','2020-08-24','2020-08-24','Cartão','Pago','2020-08-24 07:15:21','2020-08-24 07:15:21',98),(266,60,'2020-08-24','2020-09-24',NULL,NULL,'Em atraso','2020-08-24 07:15:21','2020-08-24 07:15:21',98),(267,80,'2020-08-24','2020-08-24','2020-08-24','Dinheiro','Pago','2020-08-24 07:18:20','2020-08-24 07:18:20',99),(268,80,'2020-08-24','2020-09-24',NULL,NULL,'Em atraso','2020-08-24 07:18:20','2020-08-24 07:18:20',99),(269,80,'2020-08-24','2020-08-24','2020-08-24','Dinheiro','Pago','2020-08-24 10:31:56','2020-08-24 10:31:56',100),(270,80,'2020-08-24','2020-09-24','2020-09-24','Dinheiro','Pago','2020-08-24 10:31:56','2020-09-24 14:03:56',100),(271,60,'2020-08-25','2020-08-25','2020-08-25','Cartão','Pago','2020-08-25 06:28:56','2020-08-25 06:28:56',101),(272,60,'2020-08-25','2020-09-25',NULL,NULL,'Em atraso','2020-08-25 06:28:56','2020-08-25 06:28:56',101),(275,60,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 07:22:15','2020-08-25 07:22:15',103),(276,60,'2020-08-25','2020-09-25',NULL,NULL,'Em atraso','2020-08-25 07:22:15','2020-08-25 07:22:15',103),(277,60,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 10:35:44','2020-08-25 10:35:44',104),(278,60,'2020-08-25','2020-09-25',NULL,NULL,'Em atraso','2020-08-25 10:35:44','2020-08-25 10:35:44',104),(279,65,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 13:26:05','2020-08-25 13:26:05',105),(280,65,'2020-08-25','2020-09-25','2020-09-22','Dinheiro','Pago','2020-08-25 13:26:05','2020-09-22 09:51:08',105),(281,80,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 13:56:08','2020-08-25 13:56:08',106),(282,80,'2020-08-25','2020-09-25',NULL,NULL,'Em atraso','2020-08-25 13:56:08','2020-08-25 13:56:08',106),(283,60,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 15:37:03','2020-08-25 15:37:03',107),(284,60,'2020-08-25','2020-09-25',NULL,NULL,'Em atraso','2020-08-25 15:37:03','2020-08-25 15:37:03',107),(295,35,'2020-08-25','2020-08-25','2020-08-25','Cartão','Pago','2020-08-25 18:37:13','2020-08-25 18:37:13',111),(297,80,'2020-08-26','2020-08-26','2020-08-26','Dinheiro','Pago','2020-08-26 19:08:34','2020-08-26 19:08:34',112),(298,80,'2020-08-26','2020-09-26',NULL,NULL,'Em atraso','2020-08-26 19:08:34','2020-08-26 19:08:34',112),(299,65,'2020-08-26','2020-08-26','2020-08-26','Dinheiro','Pago','2020-08-26 19:10:47','2020-08-26 19:10:47',113),(300,65,'2020-08-26','2020-09-26',NULL,NULL,'Em atraso','2020-08-26 19:10:50','2020-08-26 19:10:50',113),(301,80,'2020-08-26','2020-08-26','2020-08-26','Dinheiro','Pago','2020-08-26 19:13:22','2020-08-26 19:13:22',114),(302,80,'2020-08-26','2020-09-26',NULL,NULL,'Em atraso','2020-08-26 19:13:22','2020-08-26 19:13:22',114),(303,80,'2020-08-27','2020-08-27','2020-08-27','Dinheiro','Pago','2020-08-27 18:30:30','2020-08-27 18:30:30',115),(304,80,'2020-08-27','2020-09-27','2020-09-24','Dinheiro','Pago','2020-08-27 18:30:30','2020-09-24 16:44:44',115),(305,80,'2020-08-27','2020-08-27','2020-08-27','Dinheiro','Pago','2020-08-27 19:09:01','2020-08-27 19:09:01',116),(306,80,'2020-08-27','2020-09-27',NULL,NULL,'Em aberto','2020-08-27 19:09:01','2020-08-27 19:09:01',116),(307,80,'2020-08-27','2020-08-27','2020-08-27','Dinheiro','Pago','2020-08-27 19:11:43','2020-08-27 19:11:43',117),(308,80,'2020-08-27','2020-09-27',NULL,NULL,'Em aberto','2020-08-27 19:11:43','2020-08-27 19:11:43',117),(309,80,'2020-08-28','2020-08-28','2020-08-28','Cartão','Pago','2020-08-28 05:47:03','2020-08-28 05:47:03',118),(310,80,'2020-08-28','2020-09-28',NULL,NULL,'Em aberto','2020-08-28 05:47:03','2020-08-28 05:47:03',118),(311,60,'2020-08-28','2020-08-28','2020-08-28','Dinheiro','Pago','2020-08-28 14:59:56','2020-08-28 14:59:56',119),(312,60,'2020-08-28','2020-09-28',NULL,NULL,'Em aberto','2020-08-28 14:59:56','2020-08-28 14:59:56',119),(313,80,'2020-08-28','2020-08-28','2020-08-28','Dinheiro','Pago','2020-08-28 16:27:35','2020-08-28 16:27:35',120),(314,80,'2020-08-28','2020-09-28',NULL,NULL,'Em aberto','2020-08-28 16:27:35','2020-08-28 16:27:35',120),(315,70,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 07:16:05','2020-09-01 07:16:05',121),(316,70,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 07:16:05','2020-09-01 07:16:05',121),(317,80,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 10:04:38','2020-09-01 10:04:38',122),(318,80,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 10:04:38','2020-09-01 10:04:38',122),(319,80,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 11:06:45','2020-09-01 11:06:45',123),(320,80,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 11:06:45','2020-09-01 11:06:45',123),(321,80,'2020-09-01','2020-09-01','2020-09-01','Cartão','Pago','2020-09-01 15:58:54','2020-09-01 15:58:54',124),(322,80,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 15:58:54','2020-09-01 15:58:54',124),(323,80,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 16:29:56','2020-09-01 16:29:56',125),(324,80,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 16:29:56','2020-09-01 16:29:56',125),(325,60,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 16:58:31','2020-09-01 16:58:31',126),(326,60,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 16:58:31','2020-09-01 16:58:31',126),(327,65,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 18:25:12','2020-09-01 18:25:12',127),(328,65,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 18:25:12','2020-09-01 18:25:12',127),(329,80,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 19:16:29','2020-09-01 19:16:29',128),(330,80,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 19:16:29','2020-09-01 19:16:29',128),(331,60,'2020-09-01','2020-09-01','2020-09-01','Dinheiro','Pago','2020-09-01 19:44:36','2020-09-01 19:44:36',129),(332,60,'2020-09-01','2020-10-01',NULL,NULL,'Em aberto','2020-09-01 19:44:36','2020-09-01 19:44:36',129),(335,65,'2020-09-03','2020-09-03','2020-09-03','Dinheiro','Pago','2020-09-03 10:21:05','2020-09-03 10:21:05',131),(336,65,'2020-09-03','2020-10-03',NULL,NULL,'Em aberto','2020-09-03 10:21:05','2020-09-03 10:21:05',131),(337,80,'2020-09-03','2020-09-03','2020-09-03','Dinheiro','Pago','2020-09-03 10:58:44','2020-09-03 10:58:44',132),(338,80,'2020-09-03','2020-10-03',NULL,NULL,'Em aberto','2020-09-03 10:58:44','2020-09-03 10:58:44',132),(339,80,'2020-09-03','2020-09-03','2020-09-03','Dinheiro','Pago','2020-09-03 11:35:49','2020-09-03 11:35:49',133),(340,80,'2020-09-03','2020-10-03',NULL,NULL,'Em aberto','2020-09-03 11:35:49','2020-09-03 11:35:49',133),(341,80,'2020-09-03','2020-09-03','2020-09-03','Dinheiro','Pago','2020-09-03 15:22:34','2020-09-03 15:22:34',134),(342,80,'2020-09-03','2020-10-03',NULL,NULL,'Em aberto','2020-09-03 15:22:34','2020-09-03 15:22:34',134),(343,80,'2020-09-03','2020-09-03','2020-09-03','Cartão','Pago','2020-09-03 17:16:42','2020-09-03 17:16:42',135),(344,80,'2020-09-03','2020-10-03',NULL,NULL,'Em aberto','2020-09-03 17:16:42','2020-09-03 17:16:42',135),(345,80,'2020-09-08','2020-09-08','2020-09-08','Dinheiro','Pago','2020-09-08 10:04:40','2020-09-08 10:04:40',136),(346,80,'2020-09-08','2020-10-08',NULL,NULL,'Em aberto','2020-09-08 10:04:40','2020-09-08 10:04:40',136),(347,80,'2020-09-08','2020-09-08','2020-09-08','Dinheiro','Pago','2020-09-08 12:07:14','2020-09-08 12:07:14',137),(348,80,'2020-09-08','2020-10-08',NULL,NULL,'Em aberto','2020-09-08 12:07:14','2020-09-08 12:07:14',137),(349,80,'2020-09-08','2020-09-08','2020-09-08','Dinheiro','Pago','2020-09-08 17:19:23','2020-09-08 17:19:23',138),(350,80,'2020-09-08','2020-10-08',NULL,NULL,'Em aberto','2020-09-08 17:19:23','2020-09-08 17:19:23',138),(351,80,'2020-09-08','2020-09-08','2020-09-08','Dinheiro','Pago','2020-09-08 19:06:47','2020-09-08 19:06:47',139),(352,80,'2020-09-08','2020-10-08',NULL,NULL,'Em aberto','2020-09-08 19:06:47','2020-09-08 19:06:47',139),(353,80,'2020-09-09','2020-09-09','2020-09-09','Dinheiro','Pago','2020-09-09 06:54:24','2020-09-09 06:54:24',140),(354,80,'2020-09-09','2020-10-09',NULL,NULL,'Em aberto','2020-09-09 06:54:24','2020-09-09 06:54:24',140),(355,80,'2020-09-09','2020-09-09','2020-09-09','Dinheiro','Pago','2020-09-09 06:57:17','2020-09-09 06:57:17',141),(356,80,'2020-09-09','2020-10-09',NULL,NULL,'Em aberto','2020-09-09 06:57:17','2020-09-09 06:57:17',141),(357,80,'2020-09-09','2020-09-09','2020-09-09','Dinheiro','Pago','2020-09-09 15:03:41','2020-09-09 15:03:41',142),(358,80,'2020-09-09','2020-10-09',NULL,NULL,'Em aberto','2020-09-09 15:03:41','2020-09-09 15:03:41',142),(359,80,'2020-09-09','2020-09-09','2020-09-09','Dinheiro','Pago','2020-09-09 18:12:08','2020-09-09 18:12:08',143),(360,80,'2020-09-09','2020-10-09',NULL,NULL,'Em aberto','2020-09-09 18:12:08','2020-09-09 18:12:08',143),(361,100,'2020-09-10','2020-09-10','2020-09-10','Dinheiro','Pago','2020-09-10 11:26:50','2020-09-10 11:26:50',144),(362,100,'2020-09-10','2020-10-10',NULL,NULL,'Em aberto','2020-09-10 11:26:50','2020-09-10 11:26:50',144),(363,80,'2020-09-10','2020-09-10','2020-09-10','Dinheiro','Pago','2020-09-10 13:43:54','2020-09-10 13:43:54',145),(364,80,'2020-09-10','2020-10-10',NULL,NULL,'Em aberto','2020-09-10 13:43:54','2020-09-10 13:43:54',145),(365,60,'2020-09-10','2020-09-10','2020-09-10','Dinheiro','Pago','2020-09-10 13:58:38','2020-09-10 13:58:38',146),(366,60,'2020-09-10','2020-10-10',NULL,NULL,'Em aberto','2020-09-10 13:58:38','2020-09-10 13:58:38',146),(367,80,'2020-09-10','2020-09-10','2020-09-10','Cartão','Pago','2020-09-10 15:53:06','2020-09-10 15:53:06',147),(368,80,'2020-09-10','2020-10-10',NULL,NULL,'Em aberto','2020-09-10 15:53:06','2020-09-10 15:53:06',147),(369,80,'2020-09-10','2020-09-10','2020-09-10','Dinheiro','Pago','2020-09-10 17:14:01','2020-09-10 17:14:01',148),(370,80,'2020-09-10','2020-10-10',NULL,NULL,'Em aberto','2020-09-10 17:14:01','2020-09-10 17:14:01',148),(373,80,'2020-09-14','2020-09-14','2020-09-14','Dinheiro','Pago','2020-09-14 06:43:04','2020-09-14 06:43:04',150),(374,80,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 06:43:04','2020-09-14 06:43:04',150),(375,100,'2020-09-14','2020-09-14','2020-09-14','Dinheiro','Pago','2020-09-14 08:01:00','2020-09-14 08:01:00',151),(376,100,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 08:01:00','2020-09-14 08:01:00',151),(377,80,'2020-09-14','2020-09-14','2020-09-14','Dinheiro','Pago','2020-09-14 08:12:21','2020-09-14 08:12:21',152),(378,80,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 08:12:21','2020-09-14 08:12:21',152),(384,70,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 11:03:15','2020-09-14 11:03:15',111),(385,60,'2020-09-14','2020-09-14','2020-09-14','Dinheiro','Pago','2020-09-14 16:15:08','2020-09-14 16:15:08',153),(386,60,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 16:15:08','2020-09-14 16:15:08',153),(387,65,'2020-09-14','2020-09-14','2020-09-14','Cartão','Pago','2020-09-14 18:05:26','2020-09-14 18:05:26',154),(388,65,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 18:05:26','2020-09-14 18:05:26',154),(391,80,'2020-09-14','2020-09-14','2020-09-14','Cartão','Pago','2020-09-14 18:54:54','2020-09-14 18:54:54',156),(392,80,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 18:54:54','2020-09-14 18:54:54',156),(393,80,'2020-09-14','2020-09-14','2020-09-14','Dinheiro','Pago','2020-09-14 18:57:07','2020-09-14 18:57:07',157),(394,80,'2020-09-14','2020-10-14',NULL,NULL,'Em aberto','2020-09-14 18:57:07','2020-09-14 18:57:07',157),(395,65,'2020-09-15','2020-09-15','2020-09-15','Dinheiro','Pago','2020-09-15 07:00:12','2020-09-15 07:00:12',158),(396,65,'2020-09-15','2020-10-15',NULL,NULL,'Em aberto','2020-09-15 07:00:12','2020-09-15 07:00:12',158),(397,80,'2020-09-16','2020-09-16','2020-09-16','Dinheiro','Pago','2020-09-16 07:01:11','2020-09-16 07:01:11',159),(398,80,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 07:01:11','2020-09-16 07:01:11',159),(399,50,'2020-09-16','2020-09-16','2020-09-16','Dinheiro','Pago','2020-09-16 08:22:34','2020-09-16 08:22:34',160),(400,50,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 08:22:34','2020-09-16 08:22:34',160),(401,50,'2020-09-16','2020-09-16','2020-09-16','Dinheiro','Pago','2020-09-16 08:24:57','2020-09-16 08:24:57',161),(402,50,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 08:24:57','2020-09-16 08:24:57',161),(403,50,'2020-09-16','2020-09-16','2020-09-16','Dinheiro','Pago','2020-09-16 08:27:00','2020-09-16 08:27:00',162),(404,50,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 08:27:00','2020-09-16 08:27:00',162),(405,50,'2020-09-16','2020-09-16','2020-09-16','Dinheiro','Pago','2020-09-16 08:29:22','2020-09-16 08:29:22',163),(406,50,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 08:29:22','2020-09-16 08:29:22',163),(407,60,'2020-09-16','2020-09-16','2020-09-16','Dinheiro','Pago','2020-09-16 15:05:03','2020-09-16 15:05:03',164),(408,60,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 15:05:03','2020-09-16 15:05:03',164),(409,80,'2020-09-16','2020-09-16','2020-09-16','Cartão','Pago','2020-09-16 18:20:03','2020-09-16 18:20:03',165),(410,80,'2020-09-16','2020-10-16',NULL,NULL,'Em aberto','2020-09-16 18:20:03','2020-09-16 18:20:03',165),(411,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',63),(412,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',64),(414,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',67),(415,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',68),(416,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',69),(417,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',70),(418,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',71),(419,65,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',72),(421,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',74),(422,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',75),(423,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',76),(424,70,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',77),(425,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',78),(426,70,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',79),(427,70,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',80),(428,80,'2020-09-17','2020-10-17',NULL,NULL,'Em aberto','2020-09-17 00:00:07','2020-09-17 00:00:07',81),(429,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',82),(430,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',83),(431,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',84),(432,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',85),(433,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',86),(434,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',87),(435,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',88),(436,80,'2020-09-18','2020-10-18',NULL,NULL,'Em aberto','2020-09-18 00:00:08','2020-09-18 00:00:08',89),(437,80,'2020-09-19','2020-10-19',NULL,NULL,'Em aberto','2020-09-19 00:00:07','2020-09-19 00:00:07',90),(438,80,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',91),(439,80,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',92),(440,80,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',93),(441,80,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',94),(442,70,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',95),(443,80,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',96),(444,80,'2020-09-20','2020-10-20',NULL,NULL,'Em aberto','2020-09-20 00:00:07','2020-09-20 00:00:07',97),(445,80,'2020-09-21','2020-09-21','2020-09-21','Dinheiro','Pago','2020-09-21 11:20:42','2020-09-21 11:20:42',166),(446,80,'2020-09-21','2020-10-21',NULL,NULL,'Em aberto','2020-09-21 11:20:42','2020-09-21 11:20:42',166),(447,80,'2020-09-21','2020-09-21','2020-09-21','Dinheiro','Pago','2020-09-21 11:23:05','2020-09-21 11:23:05',167),(448,80,'2020-09-21','2020-10-21',NULL,NULL,'Em aberto','2020-09-21 11:23:05','2020-09-21 11:23:05',167),(449,80,'2020-09-21','2020-09-21','2020-09-21','Dinheiro','Pago','2020-09-21 15:52:11','2020-09-21 15:52:11',168),(450,80,'2020-09-21','2020-10-21',NULL,NULL,'Em aberto','2020-09-21 15:52:11','2020-09-21 15:52:11',168),(451,80,'2020-09-21','2020-09-21','2020-09-21','Dinheiro','Pago','2020-09-21 17:23:10','2020-09-21 17:23:10',169),(452,80,'2020-09-21','2020-10-21','2020-09-23','Dinheiro','Pago','2020-09-21 17:23:10','2020-09-23 18:03:25',169),(453,80,'2020-09-21','2020-09-21','2020-09-21','Dinheiro','Pago','2020-09-21 18:58:41','2020-09-21 18:58:41',170),(454,80,'2020-09-21','2020-10-21',NULL,NULL,'Em aberto','2020-09-21 18:58:41','2020-09-21 18:58:41',170),(455,80,'2020-09-22','2020-09-22','2020-09-22','Dinheiro','Pago','2020-09-22 06:49:43','2020-09-22 06:49:43',171),(456,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 06:49:43','2020-09-22 06:49:43',171),(457,80,'2020-09-22','2020-09-22','2020-09-22','Dinheiro','Pago','2020-09-22 06:51:29','2020-09-22 06:51:29',172),(458,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 06:51:29','2020-09-22 06:51:29',172),(459,80,'2020-09-22','2020-09-22','2020-09-22','Dinheiro','Pago','2020-09-22 08:24:04','2020-09-22 08:24:04',173),(460,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 08:24:04','2020-09-22 08:24:04',173),(461,80,'2020-09-22','2020-09-22','2020-09-22','Cartão','Pago','2020-09-22 08:27:28','2020-09-22 08:27:28',174),(462,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 08:27:28','2020-09-22 08:27:28',174),(463,80,'2020-09-22','2020-09-22','2020-09-22','Dinheiro','Pago','2020-09-22 16:03:57','2020-09-22 16:03:57',175),(464,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 16:03:57','2020-09-22 16:03:57',175),(465,80,'2020-09-22','2020-09-22','2020-09-22','Dinheiro','Pago','2020-09-22 17:02:23','2020-09-22 17:02:23',176),(466,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 17:02:23','2020-09-22 17:02:23',176),(467,80,'2020-09-22','2020-09-22','2020-09-22','Dinheiro','Pago','2020-09-22 17:37:13','2020-09-22 17:37:13',177),(468,80,'2020-09-22','2020-10-22',NULL,NULL,'Em aberto','2020-09-22 17:37:13','2020-09-22 17:37:13',177),(469,60,'2020-09-23','2020-09-23','2020-09-23','Cartão','Pago','2020-09-23 05:59:47','2020-09-23 05:59:47',178),(470,60,'2020-09-23','2020-10-23',NULL,NULL,'Em aberto','2020-09-23 05:59:47','2020-09-23 05:59:47',178),(471,60,'2020-09-23','2020-09-23','2020-09-23','Dinheiro','Pago','2020-09-23 15:59:08','2020-09-23 15:59:08',179),(472,60,'2020-09-23','2020-10-23',NULL,NULL,'Em aberto','2020-09-23 15:59:08','2020-09-23 15:59:08',179),(473,60,'2020-09-24','2020-10-24',NULL,NULL,'Em aberto','2020-09-24 00:00:07','2020-09-24 00:00:07',98),(474,80,'2020-09-24','2020-10-24',NULL,NULL,'Em aberto','2020-09-24 00:00:07','2020-09-24 00:00:07',99),(475,80,'2020-09-24','2020-10-24',NULL,NULL,'Em aberto','2020-09-24 00:00:07','2020-09-24 00:00:07',100),(476,70,'2020-09-24','2020-09-24','2020-09-24','Dinheiro','Pago','2020-09-24 07:32:57','2020-09-24 07:32:57',180),(477,70,'2020-09-24','2020-10-24',NULL,NULL,'Em aberto','2020-09-24 07:32:57','2020-09-24 07:32:57',180),(478,70,'2020-09-24','2020-09-24','2020-09-24','Dinheiro','Pago','2020-09-24 07:34:14','2020-09-24 07:34:14',181),(479,70,'2020-09-24','2020-10-24',NULL,NULL,'Em aberto','2020-09-24 07:34:14','2020-09-24 07:34:14',181),(480,80,'2020-09-24','2020-09-24','2020-09-24','Dinheiro','Pago','2020-09-24 18:58:52','2020-09-24 18:58:52',182),(481,80,'2020-09-24','2020-10-24',NULL,NULL,'Em aberto','2020-09-24 18:58:52','2020-09-24 18:58:52',182),(482,60,'2020-09-25','2020-10-25',NULL,NULL,'Em aberto','2020-09-25 00:00:07','2020-09-25 00:00:07',101),(483,60,'2020-09-25','2020-10-25',NULL,NULL,'Em aberto','2020-09-25 00:00:07','2020-09-25 00:00:07',103),(484,60,'2020-09-25','2020-10-25',NULL,NULL,'Em aberto','2020-09-25 00:00:07','2020-09-25 00:00:07',104),(485,80,'2020-09-25','2020-10-25',NULL,NULL,'Em aberto','2020-09-25 00:00:07','2020-09-25 00:00:07',105),(486,80,'2020-09-25','2020-10-25',NULL,NULL,'Em aberto','2020-09-25 00:00:07','2020-09-25 00:00:07',106),(487,60,'2020-09-25','2020-10-25',NULL,NULL,'Em aberto','2020-09-25 00:00:07','2020-09-25 00:00:07',107),(488,80,'2020-09-26','2020-10-26',NULL,NULL,'Em aberto','2020-09-26 00:00:07','2020-09-26 00:00:07',112),(489,65,'2020-09-26','2020-10-26',NULL,NULL,'Em aberto','2020-09-26 00:00:07','2020-09-26 00:00:07',113),(490,80,'2020-09-26','2020-10-26',NULL,NULL,'Em aberto','2020-09-26 00:00:07','2020-09-26 00:00:07',114),(491,80,'2020-09-27','2020-10-27',NULL,NULL,'Em aberto','2020-09-27 00:00:08','2020-09-27 00:00:08',115),(492,80,'2020-09-27','2020-10-27',NULL,NULL,'Em aberto','2020-09-27 00:00:08','2020-09-27 00:00:08',116),(493,80,'2020-09-27','2020-10-27',NULL,NULL,'Em aberto','2020-09-27 00:00:08','2020-09-27 00:00:08',117);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacotes`
--

LOCK TABLES `pacotes` WRITE;
/*!40000 ALTER TABLE `pacotes` DISABLE KEYS */;
INSERT INTO `pacotes` VALUES (1,'Nenhum','Nenhum desconto',0,1,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Nenhum','Nenhum desconto	',0,2,'2020-01-01 00:00:00','2020-01-01 00:00:00'),(7,'Capoeira','Apenas capoeira',60,1,'2020-08-17 06:04:42','2020-08-17 06:04:42'),(8,'2 ou 3 Dias ','2 ou 3 dias de treino',35,1,'2020-08-17 06:06:19','2020-08-17 06:06:19'),(9,'Musculação','Apenas musculação',20,1,'2020-08-17 06:06:49','2020-08-17 06:06:49'),(10,'+3 pessoas','A partir de 3 pessoas o valor da mensalidade fica por 70',30,1,'2020-08-17 06:14:10','2020-08-17 06:14:10'),(11,'funcional','apenas funcional',40,1,'2020-08-17 16:20:30','2020-08-17 16:20:30'),(18,'Funcional 3x na semana','3x na semana ',50,1,'2020-09-08 07:08:02','2020-09-08 07:08:02'),(19,'Teste','Teste',20,2,'2020-09-14 10:39:08','2020-09-14 10:39:08'),(20,'Amortização dívida (Jimmy)','Amortização\r\n',50,1,'2020-09-16 08:20:21','2020-09-16 08:20:21'),(21,'Desconto pra $70','Mensalidade no valor de 70\r\n',30,1,'2020-09-24 07:30:27','2020-09-24 07:30:27');
/*!40000 ALTER TABLE `pacotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sublimemanager'
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
/*!50106 CREATE*/ /*!50117 DEFINER=`innovation`@`%`*/ /*!50106 EVENT `eventGerarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-12 12:47:17' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por gerar mensalidades mensalmente' DO BEGIN



  START TRANSACTION;



    SET @minID = (SELECT MIN(id) FROM clientes);



    SET @maxID = (SELECT MAX(id) FROM clientes);



    WHILE @minID <= @maxID DO



      SET @clienteID = @minID;

      SET @pacoteID = (SELECT pacoteId from clientes WHERE id = @clienteID);

      SET @mensalidadeID = (SELECT MAX(id) FROM mensalidades WHERE clienteId = @clienteID);

      SET @idAcademia = (SELECT academiumId FROM clientes WHERE id = @clienteID);


      SET @isAtivo = (SELECT ativo FROM clientes WHERE id = @clienteID);



      SET @valor = (SELECT valor FROM academia WHERE id = @idAcademia);

      SET @taxaDesconto = (SELECT taxaDesconto FROM pacotes WHERE id = @pacoteID);

    	SET @valorMensalidade = (@valor - @taxaDesconto);



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
/*!50106 CREATE*/ /*!50117 DEFINER=`innovation`@`%`*/ /*!50106 EVENT `eventVerificarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-17 10:06:44' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por verificar mensalidades diariamente' DO BEGIN



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
-- Dumping routines for database 'sublimemanager'
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
CREATE DEFINER=`innovation`@`%` PROCEDURE `alterarVencimento`(

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
CREATE DEFINER=`innovation`@`%` PROCEDURE `anteciparMensalidade`(

  idAcademia int(11),

  idCliente int(11), 

  idPacote int(11),

  forma varchar(250),

  dataVenc date

)
BEGIN



  SET @idAcademia = idAcademia;



  SET @valor = (SELECT valor FROM academia WHERE id = @idAcademia);



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
/*!50003 DROP PROCEDURE IF EXISTS `calculoIMC` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`innovation`@`%` PROCEDURE `calculoIMC`(

  idCliente int(11),
  altura float,
  peso float

)
BEGIN

  

  SET @idCliente = idCliente;
  SET @altura = altura;
  SET @peso = peso;
  SET @imc = (@peso / (@altura * @altura));

  

  INSERT INTO examebiometricos (altura, peso, imc, createdAt, updatedAt, clienteId)
  VALUES (@altura, @peso, @imc, now(), now(), @idCliente);



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `gerarExcluirMensalidade` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`innovation`@`%` PROCEDURE `gerarExcluirMensalidade`(

  idCliente int(11),
  idAcademia int(11)
  
)
BEGIN

  SET @idAcademia = idAcademia;
  SET @valor = (SELECT valor FROM academia WHERE id = @idAcademia);
  
  SET @idCliente = idCliente;  
  
  SET @statusCliente = (SELECT ativo FROM clientes WHERE id = @idCliente);
  
  SET @idPacote = (SELECT pacoteId FROM clientes WHERE id = @idCliente);

  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `pacotes` WHERE `id` = @idPacote);

  SET @idMensalidade = (SELECT MAX(id) FROM mensalidades WHERE clienteId = @idCliente);
  
  SET @statusMensalidade = (SELECT status FROM mensalidades WHERE id = @idMensalidade);
  
  SET @valorMensalidade = (@valor - @taxaDesconto);

  SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));
  
  
  IF @statusCliente = "1" AND @statusMensalidade != "Em aberto" THEN

    INSERT INTO mensalidades (valor, dataEmissao, dataVencimento, status,  createdAt, updatedAt, clienteId)      
    VALUES (@valorMensalidade, NOW(), @dataVencimento, 'Em aberto', NOW(), NOW(), @idCliente);

  END IF;
  
  IF @statusCliente = "0" AND @statusMensalidade = "Em aberto" THEN

    DELETE FROM mensalidades WHERE id = @idMensalidade;

  END IF;
  
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
CREATE DEFINER=`innovation`@`%` PROCEDURE `primeiraMensalidadeAberta`(
  idAcademia int(11)
)
BEGIN


  SET @idAcademia = idAcademia;



  SET @valor = (SELECT valor FROM academia WHERE id = @idAcademia);
  


  SET @ultimoID = (SELECT MAX(`id`) FROM `clientes`);



  SET @idPacote = (SELECT pacoteId FROM clientes WHERE id = @ultimoID);



  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `pacotes` WHERE `id` = @idPacote);



  SET @valorMensalidade = (@valor - @taxaDesconto);



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
CREATE DEFINER=`innovation`@`%` PROCEDURE `primeiraMensalidadePaga`(idAcademia int(11), idPacote int(11), forma varchar(250))
BEGIN



  SET @idAcademia = idAcademia;



  SET @valor = (SELECT valor FROM academia WHERE id = @idAcademia);



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
CREATE DEFINER=`innovation`@`%` PROCEDURE `relatorioClientes`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;



  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM clientes as C JOIN enderecoclientes as EC

  WHERE C.AcademiumId = @idAcademia AND MONTH(C.createdAt) = @mes AND YEAR(C.createdAt) = @ano AND C.id = EC.clienteId;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatorioDiarioClientes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`innovation`@`%` PROCEDURE `relatorioDiarioClientes`(

  idAcademia int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SELECT * FROM clientes WHERE DATE(createdAt) = CURDATE() AND academiumId = @idAcademia;



END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `relatorioDiarioEntradas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`innovation`@`%` PROCEDURE `relatorioDiarioEntradas`(

  idAcademia int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;


  
  SELECT SUM(M.valor) AS valor, COUNT(M.valor) AS numMensalidades FROM mensalidades AS M, clientes AS C, academia AS A
  WHERE M.clienteId = C.id AND C.academiumId = A.id 
  AND M.status = 'Pago' 
  AND DAY(M.dataPagamento) = DAY(CURDATE()) 
  AND MONTH(M.dataPagamento) = MONTH(CURDATE())
  AND YEAR(M.dataPagamento) = YEAR(CURDATE())
  AND A.id = @idAcademia;



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
CREATE DEFINER=`innovation`@`%` PROCEDURE `relatorioGastos`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;
  
  
  
  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM gastos WHERE academiumId = @idAcademia AND MONTH(createdAt) = @mes AND YEAR(createdAt) = @ano;



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
CREATE DEFINER=`innovation`@`%` PROCEDURE `relatorioMensalidades`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;
  
  
  
  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM mensalidades as M JOIN clientes as C

  WHERE C.AcademiumId = @idAcademia AND MONTH(M.createdAt) = @mes AND YEAR(M.createdAt) = @ano AND C.id = M.clienteId;



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

-- Dump completed on 2020-09-27 13:57:53
