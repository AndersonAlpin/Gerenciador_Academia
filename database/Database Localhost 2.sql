# Host: localhost  (Version 5.5.5-10.4.10-MariaDB)
# Date: 2020-01-05 00:12:44
# Generator: MySQL-Front 6.1  (Build 1.26)


CREATE DATABASE IF NOT EXISTS `sublimemanager`;

#
# Structure for table "academia"
#

DROP TABLE IF EXISTS `academia`;
CREATE TABLE `sublimemanager`.`academia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "academia"
#

INSERT INTO `academia` VALUES (1,'Academia IronFit','2019-11-12 13:59:05','2019-12-27 21:43:28'),(2,'Academia Teste','2019-12-18 17:48:05','2019-12-18 17:48:05');

#
# Structure for table "administradors"
#

DROP TABLE IF EXISTS `administradors`;
CREATE TABLE `sublimemanager`.`administradors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'chefe',
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  CONSTRAINT `administradors_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `sublimemanager`.`academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "administradors"
#

INSERT INTO `administradors` VALUES (1,'Flavio','Souza','Masculino','056.123.125-11','1982-07-14','(73)95543-1256','adminironfit@gmail.com','chefe',1,'2019-12-01 19:19:53','2019-12-29 22:15:00',1),(2,'Vanessa','Santos','Feminino','123.515.743-12','1998-12-13','(99)99129-1244','novoadmin@gmail.com','chefe',1,'2019-12-18 19:19:53','2019-12-19 00:00:17',2),(3,'Fernando','Noronha','Masculino','142.124.124-12','1985-12-10','(41)24124-1241','fernando@gmail.com','funcionario',1,'2020-01-04 23:45:10','2020-01-04 23:45:10',1);

#
# Structure for table "enderecoacademia"
#

DROP TABLE IF EXISTS `enderecoacademia`;
CREATE TABLE `sublimemanager`.`enderecoacademia` (
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
  CONSTRAINT `enderecoacademia_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `sublimemanager`.`academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "enderecoacademia"
#

INSERT INTO `enderecoacademia` VALUES (1,'Rua Qualquer','14','Ubatã','Qualquer','45550-000','BA','2019-12-18 22:02:37','2019-12-27 21:43:28',1),(2,'Rua Nova','51','Camacã','Seila','45519-151','BA','2019-12-18 22:02:37','2019-12-18 22:02:37',2);

#
# Structure for table "enderecoadministradors"
#

DROP TABLE IF EXISTS `enderecoadministradors`;
CREATE TABLE `sublimemanager`.`enderecoadministradors` (
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
  CONSTRAINT `enderecoadministradors_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `sublimemanager`.`administradors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "enderecoadministradors"
#

INSERT INTO `enderecoadministradors` VALUES (1,'Rua Qualquer','32','Ubatã','Qualquer','45550-000','BA','2019-12-01 19:19:53','2019-12-29 22:15:00',1),(2,'Rua Qualquer','51','Camacã','New Bairro','61231-118','BA','2019-12-01 19:19:53','2019-12-19 00:00:17',2),(3,'Seila','51','Ubatã','Fonseca','45550-000','BA','2020-01-04 23:45:10','2020-01-04 23:45:10',3);

#
# Structure for table "gastos"
#

DROP TABLE IF EXISTS `gastos`;
CREATE TABLE `sublimemanager`.`gastos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double DEFAULT NULL,
  `descricao` text DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  CONSTRAINT `gastos_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `sublimemanager`.`academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
;

#
# Data for table "gastos"
#

INSERT INTO `gastos` VALUES (1,150,'Conta de energia','2019-12-27 19:41:07','2019-12-27 19:41:07',1),(2,75,'Conta de água','2019-12-27 19:41:07','2019-12-27 19:41:07',1),(3,112.9,'Conta de internet','2019-11-27 21:52:47','2019-11-27 21:52:47',1),(4,112.9,'Conta de internet','2019-12-27 22:15:29','2019-12-27 22:15:29',1);

#
# Structure for table "logins"
#

DROP TABLE IF EXISTS `logins`;
CREATE TABLE `sublimemanager`.`logins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `administradorId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `administradorId` (`administradorId`),
  CONSTRAINT `logins_ibfk_1` FOREIGN KEY (`administradorId`) REFERENCES `sublimemanager`.`administradors` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "logins"
#

INSERT INTO `logins` VALUES (1,'adminironfit@gmail.com','$2a$10$aQ10Mf9XwvaO/4rF8CjjMO0GDKC8kq/5OPGPpFTDj1yXgtP7ZfcCi','2019-12-01 19:19:53','2019-12-29 22:15:11',1),(2,'novoadmin@gmail.com','$2a$10$pwkPmNqou/0UEyjY0ASEFOVpgBVMdsmrR3YLonOuJRnkrKkSzenhu','2019-12-01 19:19:53','2019-12-19 00:00:17',2),(3,'fernando@gmail.com','$2a$10$asRHGn5ZxX/fQWpzu9/dHecmv9j8F6Kzk8va4bCX8Hz31iIt9jaRK','2020-01-04 23:45:10','2020-01-04 23:45:10',3);

#
# Structure for table "mensalidadeacademia"
#

DROP TABLE IF EXISTS `mensalidadeacademia`;
CREATE TABLE `sublimemanager`.`mensalidadeacademia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL DEFAULT 50,
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
  CONSTRAINT `mensalidadeacademia_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `sublimemanager`.`academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "mensalidadeacademia"
#

INSERT INTO `mensalidadeacademia` VALUES (1,40,'1969-12-31','1969-12-31',NULL,NULL,'Em aberto','2019-12-18 21:56:09','2019-12-18 21:56:09',2);

#
# Structure for table "pacotes"
#

DROP TABLE IF EXISTS `pacotes`;
CREATE TABLE `sublimemanager`.`pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxaDesconto` double NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "pacotes"
#

INSERT INTO `pacotes` VALUES (1,'Nenhum','Nenhum desconto',0,1,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Verão','Grupos a partir de 4 pessoas tem 10% de desconto na mensalidade.',10,1,'2019-11-12 13:59:34','2019-12-12 15:09:46'),(3,'Nenhum','Nenhum desconto',0,2,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(4,'Família','Grupos a partir de 3 pessoas tem desconto de 5% nas mensalidades;',5,2,'2019-12-08 12:26:48','2019-12-08 12:26:48'),(5,'Premium','Grupos a partir de 6 pessoas tem desconto de 15% nas mensalidades.',15,2,'2019-12-08 12:26:07','2019-12-08 12:26:07');

#
# Structure for table "clientes"
#

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `sublimemanager`.`clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ativo` tinyint(1) NOT NULL DEFAULT 1,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  `pacoteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`academiumId`),
  KEY `pacoteId` (`pacoteId`),
  CONSTRAINT `clientes_ibfk_1` FOREIGN KEY (`academiumId`) REFERENCES `sublimemanager`.`academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `clientes_ibfk_2` FOREIGN KEY (`pacoteId`) REFERENCES `sublimemanager`.`pacotes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "clientes"
#

INSERT INTO `clientes` VALUES (1,'Júlia','Santana','Feminino','1996-08-11','123.123.123-66','(22)22222-2222','julia@gmail.com',1,'2019-12-17 11:42:40','2019-12-19 13:52:50',2,3),(2,'Júlio','Santos','Masculino','1999-07-11','412.412.412-41','(14)24124-1241','julio@gmail.com',0,'2019-12-18 19:50:31','2019-12-18 19:50:45',2,4),(3,'Carlos','Alberto','Masculino','1982-02-11','452.344.235-23','(64)56346-4523','carlos@gmail.com',1,'2019-12-19 14:41:41','2019-12-23 18:44:42',1,2),(4,'Amanda','Santos','Feminino','1987-12-11','141.241.241-24','(12)41241-2412','amanda@gmail.com',1,'2019-12-19 21:06:44','2019-12-22 13:19:31',1,1),(5,'Leandro','Silva','Masculino','1990-08-05','981.491.247-12','(41)24124-1241','leandro@gmail.com',1,'2019-12-22 11:26:21','2019-12-22 11:27:22',1,1),(6,'Maria','Oliveira','Feminino','1983-04-11','512.341.412-41','(41)42134-2134','maria@gmail.com',0,'2019-12-22 13:20:27','2019-12-23 12:54:58',1,1),(7,'Daniel','Nei','Masculino','2000-01-19','987.897.897-98','(87)87878-7878','danielcardin172@gmal.com',1,'2019-12-22 20:39:41','2019-12-24 19:43:56',1,2),(8,'Tiago','Batista','Masculino','2005-08-11','124.124.124-12','(14)12412-3412','tiago@gmail.com',1,'2019-12-23 18:26:01','2019-12-23 18:26:01',2,4),(9,'Ludimila','Silva','Feminino','1990-12-12','412.412.414-12','(41)24124-1241','ludimila@gmail.com',1,'2020-01-04 21:23:54','2020-01-04 21:23:54',1,2);

#
# Structure for table "mensalidades"
#

DROP TABLE IF EXISTS `mensalidades`;
CREATE TABLE `sublimemanager`.`mensalidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL DEFAULT 50,
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
  CONSTRAINT `mensalidades_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `sublimemanager`.`clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "mensalidades"
#

INSERT INTO `mensalidades` VALUES (1,50,'2019-12-17','2020-01-17','2019-12-20','Dinheiro','Pago','2019-12-17 11:42:41','2019-12-19 22:11:30',1),(2,50,'2019-12-17','2019-12-17','2019-12-19','Dinheiro','Pago','2019-12-17 11:42:41','2019-12-19 14:16:55',1),(3,50,'2019-12-18','2020-01-18','2019-12-22','Cartão','Pago','2019-12-18 19:50:34','2019-12-22 20:30:06',2),(4,50,'2019-12-18','2019-12-18','2019-12-18','Dinheiro','Pago','2019-12-18 19:50:34','2019-12-18 19:50:34',2),(5,45,'2019-12-19','2020-01-19','2019-12-20','Cartão','Pago','2019-12-19 14:41:42','2019-12-20 15:26:49',3),(6,45,'2019-12-19','2019-12-19','2019-12-20','Cartão','Pago','2019-12-19 14:41:42','2019-12-20 15:27:49',3),(7,45,'2019-12-19','2019-12-19','2019-12-19','Cartão','Pago','2019-12-19 21:06:45','2019-12-19 21:06:45',4),(8,45,'2019-12-19','2020-01-02','2019-12-26','Dinheiro','Pago','2019-12-19 21:15:27','2019-12-25 21:31:25',4),(13,45,'2019-12-20','2020-02-19','2020-01-04','Dinheiro','Pago','2019-12-20 15:29:29','2019-12-20 15:29:29',3),(14,50,'2019-12-20','2020-03-20',NULL,NULL,'Em aberto','2019-12-20 15:31:55','2019-12-20 15:34:52',3),(15,50,'2019-12-22','2019-12-22','2019-12-22','Dinheiro','Pago','2019-12-22 11:26:22','2019-12-22 11:26:22',5),(16,50,'2019-12-22','2020-01-22','2019-12-26','Depósito','Pago','2019-12-22 11:26:22','2019-12-26 09:43:24',5),(17,50,'2019-12-22','2019-12-22','2019-12-22','Cartão','Pago','2019-12-22 13:20:28','2019-12-22 13:20:28',6),(20,45,'2019-12-22','2019-12-22','2020-01-03','Depósito','Pago','2019-12-22 20:39:43','2020-01-03 17:30:45',7),(21,45,'2019-12-22','2019-12-22','2019-12-26','Transferência','Pago','2019-12-22 20:39:43','2019-12-25 21:25:46',7),(22,47.5,'2019-12-23','2019-12-23','2019-12-23','Cartão','Pago','2019-12-23 18:26:05','2019-12-23 18:26:05',8),(23,47.5,'2019-12-23','2020-01-23',NULL,NULL,'Em aberto','2019-12-23 18:26:05','2019-12-23 18:26:05',8),(24,50,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 16:15:47','2020-01-04 16:15:47',1),(25,50,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 16:20:47','2020-01-04 16:20:47',4),(26,45,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 16:25:37','2020-01-04 16:25:37',7),(27,45,'2020-01-04','2020-01-04','2020-01-04','Dinheiro','Pago','2020-01-04 21:23:54','2020-01-04 21:23:54',9),(28,45,'2020-01-04','2020-02-04',NULL,NULL,'Em aberto','2020-01-04 21:23:54','2020-01-04 21:23:54',9);

#
# Structure for table "enderecoclientes"
#

DROP TABLE IF EXISTS `enderecoclientes`;
CREATE TABLE `sublimemanager`.`enderecoclientes` (
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
  CONSTRAINT `enderecoclientes_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `sublimemanager`.`clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
;

#
# Data for table "enderecoclientes"
#

INSERT INTO `enderecoclientes` VALUES (3,'Qualquer','43','São Paulo','Qualquer','12312-314','SP','2019-12-17 11:42:40','2019-12-19 13:52:50',1),(4,'Nova Vida','5123','Nova','Novo','21512-351','AL','2019-12-18 19:50:31','2019-12-18 19:50:31',2),(5,'Rua Qualquer','10','Catalão','Qualquer','53423-441','PR','2019-12-19 14:41:42','2019-12-23 18:44:42',3),(6,'Rua Seila','41','Seila','Qualquer','15123-512','PB','2019-12-19 21:06:44','2019-12-22 13:19:14',4),(7,'Rua Seila','14','Rio de Janeiro','Novo','51235-231','RJ','2019-12-22 11:26:21','2019-12-22 11:27:22',5),(8,'Rua Qualquer','12','New Jersey','Novo','23412-412','AP','2019-12-22 13:20:27','2019-12-22 13:20:27',6),(9,'São Jose','154','Camacan','Centro','45880-000','BA','2019-12-22 20:39:42','2019-12-24 19:43:57',7),(10,'Rua Complexo','55','Ubatã','Dois de Julho','12412-412','BA','2019-12-23 18:26:02','2019-12-23 18:26:02',8),(11,'Rua 2','41','Ribeirão','Santos','14124-124','AL','2020-01-04 21:23:54','2020-01-04 21:23:54',9);

#
# View "viewmensalidade"
#

DROP VIEW IF EXISTS `viewmensalidade`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `sublimemanager`.`viewmensalidade`
  AS
  SELECT `information_schema`.`columns`.`COLUMN_DEFAULT` AS 'valor' FROM `information_schema`.`columns` WHERE `information_schema`.`columns`.`TABLE_SCHEMA` = 'sublimemanager' AND `information_schema`.`columns`.`TABLE_NAME` = 'mensalidades' AND `information_schema`.`columns`.`COLUMN_NAME` = 'valor'
;

#
# Procedure "alterarVencimento"
#

DROP PROCEDURE IF EXISTS `alterarVencimento`;
CREATE PROCEDURE `sublimemanager`.`alterarVencimento`(

  idCliente int(11),

  dataVenc date

)
BEGIN

  

  SET @dataVencimento = dataVenc;

  

  SET @idCliente = idCliente;

  

  SET @idMensalidade = (SELECT MAX(id) FROM `sublimemanager`.mensalidades WHERE clienteId = @idCliente);



  UPDATE `sublimemanager`.mensalidades

  SET dataVencimento = @dataVencimento

  WHERE id = @idMensalidade;



END;
;

#
# Procedure "anteciparMensalidade"
#

DROP PROCEDURE IF EXISTS `anteciparMensalidade`;
CREATE PROCEDURE `sublimemanager`.`anteciparMensalidade`(

  idCliente int(11), 

  idPacote int(11),

  forma varchar(250),

  dataVenc date

)
BEGIN



  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'sublimemanager' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');



  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `sublimemanager`.`pacotes` WHERE `id` = idPacote);



  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);



  SET @forma = forma;

  

  SET @dataVencimento = dataVenc;

  

  SET @idCliente = idCliente;



  INSERT



    INTO `sublimemanager`.`mensalidades`



    (`valor`, `dataEmissao`, `dataVencimento`, `dataPagamento`, `formaPagamento`, `status`, `createdAt`, `updatedAt`, `clienteID`)



  VALUES



    (@valorMensalidade, CURDATE(), @dataVencimento, CURDATE(), @forma, 'Pago', NOW(), NOW(), @idCliente);



END;
;

#
# Procedure "primeiraMensalidadeAberta"
#

DROP PROCEDURE IF EXISTS `primeiraMensalidadeAberta`;
CREATE PROCEDURE `sublimemanager`.`primeiraMensalidadeAberta`()
BEGIN



  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'sublimemanager' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');



  SET @ultimoID = (SELECT MAX(`id`) FROM `sublimemanager`.`clientes`);



  SET @idPacote = (SELECT pacoteId FROM `sublimemanager`.clientes WHERE id = @ultimoID);



  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `sublimemanager`.`pacotes` WHERE `id` = @idPacote);



  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);



  SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));



  INSERT



    INTO `sublimemanager`.`mensalidades`



    (`valor`, `dataEmissao`, `dataVencimento`, `status`, `createdAt`, `updatedAt`, `clienteID`)



  VALUES



    (@valorMensalidade, CURDATE(), @dataVencimento, 'Em aberto', NOW(), NOW(), @ultimoID);



END;
;

#
# Procedure "primeiraMensalidadePaga"
#

DROP PROCEDURE IF EXISTS `primeiraMensalidadePaga`;
CREATE PROCEDURE `sublimemanager`.`primeiraMensalidadePaga`(idPacote int(11), forma varchar(250))
BEGIN



  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'sublimemanager' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');



  SET @taxaDesconto = (SELECT `taxaDesconto` FROM `sublimemanager`.`pacotes` WHERE `id` = idPacote);



  SET @ultimoID = (SELECT MAX(`id`) FROM `sublimemanager`.`clientes`);



  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);



  SET @forma = forma;



  INSERT



    INTO `sublimemanager`.`mensalidades`



    (`valor`, `dataEmissao`, `dataVencimento`, `dataPagamento`, `formaPagamento`, `status`, `createdAt`, `updatedAt`, `clienteID`)



  VALUES



    (@valorMensalidade, CURDATE(), CURDATE(), CURDATE(), @forma, 'Pago', NOW(), NOW(), @ultimoID);



END;
;

#
# Procedure "relatorioClientes"
#

DROP PROCEDURE IF EXISTS `relatorioClientes`;
CREATE PROCEDURE `sublimemanager`.`relatorioClientes`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;



  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM `sublimemanager`.clientes as C JOIN `sublimemanager`.enderecoclientes as EC

  WHERE `sublimemanager`.C.AcademiumId = @idAcademia AND MONTH(`sublimemanager`.C.createdAt) = @mes AND YEAR(`sublimemanager`.C.createdAt) = @ano AND `sublimemanager`.C.id = `sublimemanager`.EC.clienteId;



END;
;

#
# Procedure "relatorioDiarioEntradas"
#

DROP PROCEDURE IF EXISTS `relatorioDiarioEntradas`;
CREATE PROCEDURE `sublimemanager`.`relatorioDiarioEntradas`(

  idAcademia int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;


  
  SELECT SUM(valor) AS valor, COUNT(valor) AS numMensalidades FROM `sublimemanager`.mensalidades AS M, `sublimemanager`.clientes AS C, `sublimemanager`.academia AS A
  WHERE `sublimemanager`.M.clienteId = `sublimemanager`.C.id AND `sublimemanager`.C.academiumId = `sublimemanager`.A.id 
  AND `sublimemanager`.M.status = 'Pago' 
  AND DAY(`sublimemanager`.M.dataPagamento) = DAY(CURDATE()) 
  AND MONTH(`sublimemanager`.M.dataPagamento) = MONTH(CURDATE())
  AND YEAR(`sublimemanager`.M.dataPagamento) = YEAR(CURDATE())
  AND `sublimemanager`.A.id = @idAcademia;



END;
;

#
# Procedure "relatorioGastos"
#

DROP PROCEDURE IF EXISTS `relatorioGastos`;
CREATE PROCEDURE `sublimemanager`.`relatorioGastos`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;
  
  
  
  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM `sublimemanager`.gastos WHERE academiumId = @idAcademia AND MONTH(createdAt) = @mes AND YEAR(createdAt) = @ano;



END;
;

#
# Procedure "relatorioMensalidades"
#

DROP PROCEDURE IF EXISTS `relatorioMensalidades`;
CREATE PROCEDURE `sublimemanager`.`relatorioMensalidades`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;
  
  
  
  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM `sublimemanager`.mensalidades as M JOIN `sublimemanager`.clientes as C

  WHERE `sublimemanager`.C.AcademiumId = @idAcademia AND MONTH(`sublimemanager`.M.createdAt) = @mes AND YEAR(`sublimemanager`.M.createdAt) = @ano AND `sublimemanager`.C.id = `sublimemanager`.M.clienteId;



END;
;

#
# Event "eventGerarMensalidades"
#

DROP EVENT IF EXISTS `eventGerarMensalidades`;
CREATE EVENT `sublimemanager`.`eventGerarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-12 12:47:17' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por gerar mensalidades mensalmente' DO BEGIN



  START TRANSACTION;



    SET @minID = (SELECT MIN(id) FROM `sublimemanager`.clientes);



    SET @maxID = (SELECT MAX(id) FROM `sublimemanager`.clientes);



    WHILE @minID <= @maxID DO



      SET @clienteID = @minID;

      SET @pacoteID = (SELECT pacoteId from `sublimemanager`.clientes WHERE id = @clienteID);

      SET @mensalidadeID = (SELECT MAX(id) FROM `sublimemanager`.mensalidades WHERE clienteId = @clienteID);



      SET @isAtivo = (SELECT ativo FROM `sublimemanager`.clientes WHERE id = @clienteID);



      SET @valor = (SELECT COLUMN_DEFAULT AS valor FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sublimemanager'  AND TABLE_NAME = 'mensalidades' AND COLUMN_NAME = 'valor');

      SET @taxaDesconto = (SELECT taxaDesconto FROM `sublimemanager`.pacotes WHERE id = @pacoteID);

    	SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);



      SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));

      SET @dataVencimentoAtual = (SELECT dataVencimento FROM `sublimemanager`.mensalidades WHERE id = @mensalidadeID);

      SET @dataEmissao = (SELECT dataEmissao FROM `sublimemanager`.mensalidades WHERE id = @mensalidadeID);

      SET @dataAtual = (SELECT CURDATE());

      SET @mesEmissao = (SELECT MONTH(@dataEmissao));

      SET @mesAtual = (SELECT MONTH(CURDATE()));



      #SET @diaVencimento = (SELECT DAY(@dataVencimentoAtual));

      #SET @mesVencimento = (SELECT MONTH(@dataVencimentoAtual));

      #SET @diaAtual = (SELECT DAY(CURDATE()));



      IF @clienteID > 0 AND @isAtivo = 1 THEN

        IF @dataAtual >= @dataVencimentoAtual AND @mesEmissao != @mesAtual THEN



          INSERT INTO `sublimemanager`.mensalidades (valor, dataEmissao, dataVencimento, status,  createdAt, updatedAt, clienteId)

          VALUES (@valorMensalidade, NOW(), @dataVencimento, 'Em aberto', NOW(), NOW(), @clienteID);



        END IF;

      END IF;    



      SET @minID = @minID + 1; 



    END WHILE;



  COMMIT;

END;
;

#
# Event "eventVerificarMensalidades"
#

DROP EVENT IF EXISTS `eventVerificarMensalidades`;
CREATE EVENT `sublimemanager`.`eventVerificarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-17 10:06:44' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por verificar mensalidades diariamente' DO BEGIN



  START TRANSACTION;



    SET @minID = (SELECT MIN(id) FROM `sublimemanager`.mensalidades);



    SET @maxID = (SELECT MAX(id) FROM `sublimemanager`.mensalidades);



    



    WHILE @minID <= @maxID DO



    



      SET @statusMensalidade = (SELECT status FROM `sublimemanager`.mensalidades WHERE id = @minID);



      SET @vencimento = (SELECT dataVencimento FROM `sublimemanager`.mensalidades WHERE id = @minID);



      



      IF @minID > 0 THEN



        IF @statusMensalidade = 'Em aberto' AND @vencimento < CURDATE() THEN



          UPDATE `sublimemanager`.mensalidades



          SET status = 'Em atraso'



          WHERE ID = @minID;



        END IF;



      END IF;



      



      SET @minID = @minID + 1;



    END WHILE;



    



  COMMIT;



END;
;
