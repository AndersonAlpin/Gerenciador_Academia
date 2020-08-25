# Host: mysql669.umbler.com:41890  (Version 5.6.40)
# Date: 2020-08-25 17:23:04
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "academia"
#

DROP TABLE IF EXISTS `academia`;
CREATE TABLE `academia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `valor` double NOT NULL DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "academia"
#

INSERT INTO `academia` VALUES (1,'Profitness',100,'2020-01-06 20:52:45','2020-08-17 06:02:20'),(2,'b',35,'2019-01-01 00:00:00','2020-01-07 16:41:25');

#
# Structure for table "administradors"
#

DROP TABLE IF EXISTS `administradors`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "administradors"
#

INSERT INTO `administradors` VALUES (1,'Pelé','Santana','Masculino','005.540.125-29','1980-06-22','(73)98891-8550','academiaprofitness@hotmail.com','chefe',1,'2020-01-06 20:52:45','2020-01-06 21:29:30',1),(2,'Usuário','User','Masculino','111.111.111-11','1999-11-11','(73)11111-1111','user@gmail.com','chefe',1,'2019-01-01 00:00:00','2019-01-01 00:00:00',2),(6,'Maria Beatriz ','santos santana','Feminino','076.887.935-30','1998-05-15','(73)98851-9278','biaazinha237@gmail.com','funcionario',1,'2020-08-17 14:30:57','2020-08-17 14:30:57',1),(7,'Leonardo','de Carvalho','Masculino','079.305.715-99','2001-01-04','(73)99939-3822','leonardocamacan@gmail.com','funcionario',1,'2020-08-21 06:15:44','2020-08-21 06:15:44',1);

#
# Structure for table "enderecoacademia"
#

DROP TABLE IF EXISTS `enderecoacademia`;
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

#
# Data for table "enderecoacademia"
#

INSERT INTO `enderecoacademia` VALUES (1,'Praça Mário Batista','48','Camacã','Centro','45880000','BA','2020-01-06 20:52:45','2020-08-17 06:02:20',1),(2,'sa','142','sadf','sadf','43414-124','BA','2019-01-01 00:00:00','2020-01-07 16:41:25',2);

#
# Structure for table "enderecoadministradors"
#

DROP TABLE IF EXISTS `enderecoadministradors`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "enderecoadministradors"
#

INSERT INTO `enderecoadministradors` VALUES (1,'praça mario batista','1','camacan','centro','45880000','BA','2020-01-06 20:52:45','2020-01-06 21:29:30',1),(2,'safa','342','sadfs','safd','12412412','BA','2019-01-01 00:00:00','2019-01-01 00:00:00',2),(6,'rua são pedro ','333','Camacan','Cidade Alta','45880-000','BA','2020-08-17 14:30:57','2020-08-17 14:30:57',6),(7,'Rua dois de julho','805','Camacã','Centro','45880-000','BA','2020-08-21 06:15:44','2020-08-21 06:15:44',7);

#
# Structure for table "gastos"
#

DROP TABLE IF EXISTS `gastos`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

#
# Data for table "gastos"
#

INSERT INTO `gastos` VALUES (5,25,'Desconto para Amanda Kelly','2020-08-19 06:34:51','2020-08-19 06:34:51',1),(6,16,'alcool,papel toalha e papel higienico','2020-08-19 17:32:35','2020-08-19 17:32:35',1),(7,30,'Desconto para Laise Almeida','2020-08-20 06:09:23','2020-08-20 06:09:23',1);

#
# Structure for table "logins"
#

DROP TABLE IF EXISTS `logins`;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "logins"
#

INSERT INTO `logins` VALUES (1,'academiaprofitness@hotmail.com','$2a$10$XvHStHZ9C32i/yKdxO8XceHX9yX58VzinL.YXSP9XBlDuZma.wTFC','2020-01-06 20:52:45','2020-08-21 06:19:52',1),(2,'user@gmail.com','$2a$10$aQ10Mf9XwvaO/4rF8CjjMO0GDKC8kq/5OPGPpFTDj1yXgtP7ZfcCi','2019-01-01 00:00:00','2019-01-01 00:00:00',2),(4,'biamariasantana@hotmail.com','$2a$10$qupHbiake.4AbD5bVSSTL.ON2G82kGuU/FgSaulbZZ7beXYHTSQqK','2020-08-17 14:13:54','2020-08-17 14:13:54',NULL),(5,'bIaazinha237@gmailcom','$2a$10$X1m4UrUbQg7t5X6dM24vdOBqtYnrK8u31Vf1YPOs/ztWd1mOHFfX6','2020-08-17 14:18:14','2020-08-17 14:18:14',NULL),(6,'biaazinha237@gmail.com','$2a$10$3n5iBWne8bx7GXGgVzbNAe1PCrY3xCGl8CpZaOuUifG6abcGahqcS','2020-08-17 14:30:57','2020-08-17 14:30:57',6),(7,'leonardocamacan@gmail.com','$2a$10$9Dp7kRocUjwmISN7V.VStOwsNko81TAW0CJx3FiKHnArMelEMVCkq','2020-08-21 06:15:44','2020-08-21 06:15:44',7);

#
# Structure for table "mensalidadeacademia"
#

DROP TABLE IF EXISTS `mensalidadeacademia`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "mensalidadeacademia"
#


#
# Structure for table "pacotes"
#

DROP TABLE IF EXISTS `pacotes`;
CREATE TABLE `pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxaDesconto` double NOT NULL,
  `academiumId` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "pacotes"
#

INSERT INTO `pacotes` VALUES (1,'Nenhum','Nenhum desconto',0,1,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Nenhum','Nenhum desconto\t',0,2,'2020-01-01 00:00:00','2020-01-01 00:00:00'),(7,'Capoeira','Apenas capoeira',60,1,'2020-08-17 06:04:42','2020-08-17 06:04:42'),(8,'2 ou 3 Dias ','2 ou 3 dias de treino',35,1,'2020-08-17 06:06:19','2020-08-17 06:06:19'),(9,'Musculação','Apenas musculação',20,1,'2020-08-17 06:06:49','2020-08-17 06:06:49'),(10,'+3 pessoas','A partir de 3 pessoas o valor da mensalidade fica por 70',30,1,'2020-08-17 06:14:10','2020-08-17 06:14:10'),(11,'funcional','apenas funcional',40,1,'2020-08-17 16:20:30','2020-08-17 16:20:30');

#
# Structure for table "clientes"
#

DROP TABLE IF EXISTS `clientes`;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "clientes"
#

INSERT INTO `clientes` VALUES (63,'Michelle ','Almeida Marques ','Feminino','1994-09-22','','(73)98134-0924','',1,'2020-08-17 06:25:03','2020-08-17 06:32:51',1,9),(64,'Darlete','Ribeiro Silva de Oliveira','Feminino','2000-12-19','','','',1,'2020-08-17 06:29:54','2020-08-17 06:29:54',1,9),(65,'Larissa ','Sandes','Feminino','1999-12-25','','','',0,'2020-08-17 06:32:27','2020-08-18 18:24:34',1,9),(66,'Márcia ','Silva Ramos','Feminino','1973-01-23','','(73)98875-6249','',1,'2020-08-17 06:37:50','2020-08-18 18:47:54',1,8),(67,'Alejandro','Afonso Vargas','Masculino','1999-07-10','','(73)98123-3067','',1,'2020-08-17 06:40:15','2020-08-17 06:40:15',1,9),(68,'Gerliane ','Dias Barra','Feminino','1993-04-09','','(73)98862-4278','',1,'2020-08-17 06:41:54','2020-08-17 06:41:54',1,9),(69,'Marcelo','Batisti','Masculino','1988-05-27','','(73)98189-0159','',1,'2020-08-17 10:28:56','2020-08-17 10:28:56',1,9),(70,'Madson Flavio','santos porto','Masculino','2000-07-26','','(73)98152-3761','',1,'2020-08-17 16:07:22','2020-08-17 16:07:22',1,9),(71,'Ricardo ','Viana','Masculino','1983-06-15','','(73)98160-3744','',1,'2020-08-17 16:12:04','2020-08-17 16:12:04',1,9),(72,'Maria Hilda ','rodrigues Peluso','Feminino','1958-04-06','','(73)99900-1546','',1,'2020-08-17 17:09:24','2020-08-17 17:09:24',1,8),(73,'Daiane','Souza Santos','Feminino','1994-09-01','','(73)98163-0540','',1,'2020-08-17 17:23:18','2020-08-17 17:23:18',1,9),(74,'Jessica ','De Araújo lima','Feminino','1991-08-05','','(73)91243-692','',1,'2020-08-17 18:07:22','2020-08-17 18:07:22',1,9),(75,'Cleison','araújo','Masculino','0000-00-00','','','',1,'2020-08-17 18:10:15','2020-08-17 18:22:36',1,9),(76,'Lijia ','marina','Feminino','1983-06-15','','(73)98212-2826','',1,'2020-08-17 18:12:34','2020-08-17 18:12:34',1,9),(77,'Diego','Batista ','Masculino','1987-09-01','','(73)98113-7142','',1,'2020-08-17 19:02:32','2020-08-17 19:02:32',1,10),(78,'Aline','Marques','Feminino','1982-04-11','','(73)99123-4048','',1,'2020-08-17 19:15:06','2020-08-17 19:15:06',1,9),(79,'Elton ','Tinum santos','Masculino','1989-07-24','','(73)98233-6604','',1,'2020-08-17 19:18:22','2020-08-17 19:22:25',1,10),(80,'Wiliam','Alerson do Ouro','Masculino','1988-07-11','','(73)98209-4309','',1,'2020-08-17 19:21:31','2020-08-17 19:21:31',1,10),(81,'Edvan ','Junior','Masculino','1990-07-25','','','',1,'2020-08-17 19:51:59','2020-08-17 19:51:59',1,9),(82,'Rafael ','Joviano','Masculino','1988-10-17','','','',1,'2020-08-18 05:30:53','2020-08-19 07:36:26',1,9),(83,'Filipe','Santos Silva','Masculino','2000-09-24','','(73)98110-9342','',1,'2020-08-18 09:58:58','2020-08-18 09:58:58',1,9),(84,'Leoni','saldana','Feminino','1998-02-09','','(73)99835-7898','',1,'2020-08-18 15:22:28','2020-08-18 15:22:28',1,9),(85,'Jose Aloisio','silva conceição','Masculino','1965-02-18','','','',1,'2020-08-18 15:24:23','2020-08-18 15:24:23',1,9),(86,'Felipe ','Agobar','Masculino','1993-01-30','','(73)99955-3675','',1,'2020-08-18 15:41:48','2020-08-18 15:41:48',1,9),(87,'Amanda kelly','silva cardoso','Feminino','2001-08-11','','(73)98186-9487','',1,'2020-08-18 16:18:46','2020-08-18 16:18:46',1,9),(88,'Sara ','Rainer','Feminino','1986-04-11','','(73)99377-511','',1,'2020-08-18 18:05:50','2020-08-18 18:05:50',1,9),(89,'Ludmilla','Bezerra','Feminino','0000-00-00','','(73)99144-6380','',1,'2020-08-18 18:21:25','2020-08-18 18:21:25',1,9),(90,'Sabrina ','lima pinheiro','Feminino','1997-05-31','','(73)99134-4422','',1,'2020-08-19 14:38:13','2020-08-19 14:38:13',1,9),(91,'Laise','Santos Almeida','Feminino','1994-03-05','','(73)98801-9126','',1,'2020-08-20 06:08:51','2020-08-20 06:08:51',1,9),(92,'Yago ','Souza Silva','Masculino','1996-02-12','','(73)99821-6552','',1,'2020-08-20 07:01:17','2020-08-20 07:01:17',1,9),(93,'Rômulo ','Antônio Ribeiro Costa','Masculino','1996-06-13','','(73)99858-6904','',1,'2020-08-20 07:16:01','2020-08-20 07:16:01',1,9),(94,'Amanhã ','Freire','Feminino','1988-05-11','','(73)98194-6300','',1,'2020-08-20 11:11:03','2020-08-20 11:11:03',1,9),(95,'Reginaldo ','Oliveira alves','Masculino','1975-11-21','','(73)99152-9393','',1,'2020-08-20 13:09:16','2020-08-20 13:09:16',1,10),(96,'Karina','Vendittos santos','Feminino','1979-08-29','','(73)98120-7236','',1,'2020-08-20 15:15:42','2020-08-20 15:15:42',1,9),(97,'Reginaldo ','sena','Masculino','1980-06-22','','(73)98827-5872','',1,'2020-08-20 17:07:35','2020-08-20 17:07:35',1,9),(98,'Nádia','Sara','Feminino','1987-05-31','','(73)98167-3959','',1,'2020-08-24 07:15:21','2020-08-24 07:15:21',1,11),(99,'Adriene','Marques','Feminino','1980-12-31','','(73)32831-998','',1,'2020-08-24 07:18:20','2020-08-24 07:18:20',1,9),(100,'Samuel','Oliveira Santos','Masculino','0000-00-00','','(73)98123-0101','',1,'2020-08-24 10:31:56','2020-08-24 10:31:56',1,9),(101,'Natiene','S. Sobrinho ','Feminino','1991-02-18','','(73)98222-7883','',1,'2020-08-25 06:28:55','2020-08-25 06:28:55',1,11),(103,'Laura ','Carvalho Santana','Feminino','1998-05-28','','(73)99127-8040','',1,'2020-08-25 07:22:15','2020-08-25 07:22:15',1,11),(104,'Jaqueline','Machado','Feminino','1986-10-15','','','',1,'2020-08-25 10:35:44','2020-08-25 10:35:44',1,11),(105,'patrick','andrade da silva','Masculino','1992-11-04','','(73)82130-820','',1,'2020-08-25 13:26:05','2020-08-25 13:26:05',1,8),(106,'Pedro Henrrique ','Batista Mendes','Masculino','1996-12-11','','(73)99199-8046','',1,'2020-08-25 13:56:08','2020-08-25 13:56:08',1,9),(107,'crismara','santos oliveira','Feminino','2000-04-25','','(73)98185-9596','',1,'2020-08-25 15:37:03','2020-08-25 15:37:03',1,11),(108,'Teste','Teste','Masculino','1231-03-12','333.333.333-33','(34)44444-4444','asdfsad@gmail.com',0,'2020-08-25 15:44:03','2020-08-25 15:59:07',2,2);

#
# Structure for table "mensalidades"
#

DROP TABLE IF EXISTS `mensalidades`;
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
  CONSTRAINT `mensalidades_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=289 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "mensalidades"
#

INSERT INTO `mensalidades` VALUES (195,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:25:08','2020-08-17 06:25:08',63),(196,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 06:25:08','2020-08-17 06:25:08',63),(197,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:30:00','2020-08-17 06:30:00',64),(198,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 06:30:00','2020-08-17 06:30:00',64),(199,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:32:32','2020-08-17 06:32:32',65),(200,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 06:32:32','2020-08-17 06:32:32',65),(201,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:37:55','2020-08-17 06:37:55',66),(202,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 06:37:55','2020-08-17 06:37:55',66),(203,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:40:21','2020-08-17 06:40:21',67),(204,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 06:40:21','2020-08-17 06:40:21',67),(205,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 06:42:00','2020-08-17 06:42:00',68),(206,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 06:42:00','2020-08-17 06:42:00',68),(207,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 10:29:01','2020-08-17 10:29:01',69),(208,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 10:29:01','2020-08-17 10:29:01',69),(209,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 16:07:28','2020-08-17 16:07:28',70),(210,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 16:07:28','2020-08-17 16:07:28',70),(211,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 16:12:10','2020-08-17 16:12:10',71),(212,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 16:12:11','2020-08-17 16:12:11',71),(213,65,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 17:09:30','2020-08-17 17:09:30',72),(214,65,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 17:09:30','2020-08-17 17:09:30',72),(215,80,'2020-08-17','2020-08-17','2020-08-17','Cartão','Pago','2020-08-17 17:23:24','2020-08-17 17:23:24',73),(216,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 17:23:24','2020-08-17 17:23:24',73),(217,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 18:07:28','2020-08-17 18:07:28',74),(218,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 18:07:28','2020-08-17 18:07:28',74),(219,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 18:10:21','2020-08-17 18:10:21',75),(220,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 18:10:21','2020-08-17 18:10:21',75),(221,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 18:12:40','2020-08-17 18:12:40',76),(222,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 18:12:40','2020-08-17 18:12:40',76),(223,70,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:02:38','2020-08-17 19:02:38',77),(224,70,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 19:02:38','2020-08-17 19:02:38',77),(225,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:15:12','2020-08-17 19:15:12',78),(226,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 19:15:12','2020-08-17 19:15:12',78),(227,70,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:18:28','2020-08-17 19:18:28',79),(228,70,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 19:18:28','2020-08-17 19:18:28',79),(229,70,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:21:37','2020-08-17 19:21:37',80),(230,70,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 19:21:37','2020-08-17 19:21:37',80),(231,80,'2020-08-17','2020-08-17','2020-08-17','Dinheiro','Pago','2020-08-17 19:52:05','2020-08-17 19:52:05',81),(232,80,'2020-08-17','2020-09-17',NULL,NULL,'Em aberto','2020-08-17 19:52:05','2020-08-17 19:52:05',81),(233,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 05:30:59','2020-08-18 05:30:59',82),(234,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 05:30:59','2020-08-18 05:30:59',82),(235,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 09:59:04','2020-08-18 09:59:04',83),(236,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 09:59:04','2020-08-18 09:59:04',83),(237,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 15:22:34','2020-08-18 15:22:34',84),(238,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 15:22:34','2020-08-18 15:22:34',84),(239,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 15:24:29','2020-08-18 15:24:29',85),(240,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 15:24:29','2020-08-18 15:24:29',85),(241,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 15:41:54','2020-08-18 15:41:54',86),(242,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 15:41:54','2020-08-18 15:41:54',86),(243,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 16:18:52','2020-08-18 16:18:52',87),(244,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 16:18:52','2020-08-18 16:18:52',87),(245,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 18:05:56','2020-08-18 18:05:56',88),(246,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 18:05:56','2020-08-18 18:05:56',88),(247,80,'2020-08-18','2020-08-18','2020-08-18','Dinheiro','Pago','2020-08-18 18:21:32','2020-08-18 18:21:32',89),(248,80,'2020-08-18','2020-09-18',NULL,NULL,'Em aberto','2020-08-18 18:21:32','2020-08-18 18:21:32',89),(249,80,'2020-08-19','2020-08-19','2020-08-19','Dinheiro','Pago','2020-08-19 14:38:20','2020-08-19 14:38:20',90),(250,80,'2020-08-19','2020-09-19',NULL,NULL,'Em aberto','2020-08-19 14:38:20','2020-08-19 14:38:20',90),(251,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 06:08:58','2020-08-20 06:08:58',91),(252,80,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 06:08:58','2020-08-20 06:08:58',91),(253,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 07:01:24','2020-08-20 07:01:24',92),(254,80,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 07:01:24','2020-08-20 07:01:24',92),(255,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 07:16:08','2020-08-20 07:16:08',93),(256,80,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 07:16:08','2020-08-20 07:16:08',93),(257,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 11:11:10','2020-08-20 11:11:10',94),(258,80,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 11:11:10','2020-08-20 11:11:10',94),(259,70,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 13:09:24','2020-08-20 13:09:24',95),(260,70,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 13:09:24','2020-08-20 13:09:24',95),(261,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 15:15:49','2020-08-20 15:15:49',96),(262,80,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 15:15:50','2020-08-20 15:15:50',96),(263,80,'2020-08-20','2020-08-20','2020-08-20','Dinheiro','Pago','2020-08-20 17:07:42','2020-08-20 17:07:42',97),(264,80,'2020-08-20','2020-09-20',NULL,NULL,'Em aberto','2020-08-20 17:07:42','2020-08-20 17:07:42',97),(265,60,'2020-08-24','2020-08-24','2020-08-24','Cartão','Pago','2020-08-24 07:15:21','2020-08-24 07:15:21',98),(266,60,'2020-08-24','2020-09-24',NULL,NULL,'Em aberto','2020-08-24 07:15:21','2020-08-24 07:15:21',98),(267,80,'2020-08-24','2020-08-24','2020-08-24','Dinheiro','Pago','2020-08-24 07:18:20','2020-08-24 07:18:20',99),(268,80,'2020-08-24','2020-09-24',NULL,NULL,'Em aberto','2020-08-24 07:18:20','2020-08-24 07:18:20',99),(269,80,'2020-08-24','2020-08-24','2020-08-24','Dinheiro','Pago','2020-08-24 10:31:56','2020-08-24 10:31:56',100),(270,80,'2020-08-24','2020-09-24',NULL,NULL,'Em aberto','2020-08-24 10:31:56','2020-08-24 10:31:56',100),(271,60,'2020-08-25','2020-08-25','2020-08-25','Cartão','Pago','2020-08-25 06:28:56','2020-08-25 06:28:56',101),(272,60,'2020-08-25','2020-09-25',NULL,NULL,'Em aberto','2020-08-25 06:28:56','2020-08-25 06:28:56',101),(275,60,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 07:22:15','2020-08-25 07:22:15',103),(276,60,'2020-08-25','2020-09-25',NULL,NULL,'Em aberto','2020-08-25 07:22:15','2020-08-25 07:22:15',103),(277,60,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 10:35:44','2020-08-25 10:35:44',104),(278,60,'2020-08-25','2020-09-25',NULL,NULL,'Em aberto','2020-08-25 10:35:44','2020-08-25 10:35:44',104),(279,65,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 13:26:05','2020-08-25 13:26:05',105),(280,65,'2020-08-25','2020-09-25',NULL,NULL,'Em aberto','2020-08-25 13:26:05','2020-08-25 13:26:05',105),(281,80,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 13:56:08','2020-08-25 13:56:08',106),(282,80,'2020-08-25','2020-09-25',NULL,NULL,'Em aberto','2020-08-25 13:56:08','2020-08-25 13:56:08',106),(283,60,'2020-08-25','2020-08-25','2020-08-25','Dinheiro','Pago','2020-08-25 15:37:03','2020-08-25 15:37:03',107),(284,60,'2020-08-25','2020-09-25',NULL,NULL,'Em aberto','2020-08-25 15:37:03','2020-08-25 15:37:03',107),(285,35,'2020-08-25','2020-08-25','2020-08-25','Cartão','Pago','2020-08-25 15:44:04','2020-08-25 15:44:04',108);

#
# Structure for table "examebiometricos"
#

DROP TABLE IF EXISTS `examebiometricos`;
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
  CONSTRAINT `examebiometricos_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

#
# Data for table "examebiometricos"
#


#
# Structure for table "enderecoclientes"
#

DROP TABLE IF EXISTS `enderecoclientes`;
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
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "enderecoclientes"
#

INSERT INTO `enderecoclientes` VALUES (63,'Colina dos Laranjais','307','Camacã','','45880-000','BA','2020-08-17 06:25:03','2020-08-17 06:32:51',63),(64,'Ana Nere','','Camacã','','45880-000','BA','2020-08-17 06:29:54','2020-08-17 06:29:54',64),(65,'Colina dos laranjais','','Camacã','','45880-000','BA','2020-08-17 06:32:27','2020-08-17 06:32:27',65),(66,'Avenida Dr. João Vargens ','','Camacã','Centro','45880-000','BA','2020-08-17 06:37:50','2020-08-18 18:47:54',66),(67,'Rua Bahia','','Camacã','Centro','45880-000','BA','2020-08-17 06:40:15','2020-08-17 06:40:15',67),(68,'Rua São Francisco','','Camacã','','45880-000','BA','2020-08-17 06:41:54','2020-08-17 06:41:54',68),(69,'Rua Canavieiras ','20','Camacã','Centro','45880-000','BA','2020-08-17 10:28:56','2020-08-17 10:28:56',69),(70,'praça mario batista ','217','Camacan','Centro','45880-000','BA','2020-08-17 16:07:22','2020-08-17 16:07:22',70),(71,'travessa califórnia','153','Camacan','Centro','45880-000','BA','2020-08-17 16:12:04','2020-08-17 16:12:04',71),(72,'Nossa senhora do socorro','65','Camacan','Cidade Alta','45880-000','BA','2020-08-17 17:09:24','2020-08-17 17:09:24',72),(73,'da coelba','412','Camacan','Cidade Alta','45880-000','BA','2020-08-17 17:23:18','2020-08-17 17:23:18',73),(74,'igreja catolica ','','Camacan','Centro','45880-000','BA','2020-08-17 18:07:22','2020-08-17 18:07:22',74),(75,'carlos gomes','210','Camacan','Centro','','BA','2020-08-17 18:10:15','2020-08-17 18:22:36',75),(76,'carlos gomes','210','Camacan','','45880-000','BA','2020-08-17 18:12:34','2020-08-17 18:12:34',76),(77,'2 De Julho','817','Camacan','Centro','','BA','2020-08-17 19:02:32','2020-08-17 19:02:32',77),(78,'Da Cabana','','Camacan','Centro','45880-000','BA','2020-08-17 19:15:06','2020-08-17 19:15:06',78),(79,'Castro alves','163','Camacan','','45880-000','BA','2020-08-17 19:18:22','2020-08-17 19:22:25',79),(80,'2 De Julho','1040','Camacan','Centro','45880-000','BA','2020-08-17 19:21:31','2020-08-17 19:21:31',80),(81,'carlos gomes','','Camacan','','45880-000','BA','2020-08-17 19:51:59','2020-08-17 19:51:59',81),(82,'Rua Antônio Pereira','628','Camacã','Centro','45880-000','BA','2020-08-18 05:30:53','2020-08-19 07:36:26',82),(83,'Rua das Laranjeiras','124','Camacã','Cidade alta','45880-000','BA','2020-08-18 09:58:58','2020-08-18 09:58:58',83),(84,'2 De Julho','1144','Camacan','Centro','45880-000','BA','2020-08-18 15:22:28','2020-08-18 15:22:28',84),(85,'Bela vista','145','Camacan','','','BA','2020-08-18 15:24:23','2020-08-18 15:24:23',85),(86,'Avenida Dr João Vargens ','79','Camacan','Centro','45880-000','BA','2020-08-18 15:41:48','2020-08-18 15:41:48',86),(87,'colina dos laranjais','260','Camacan','','45880-000','BA','2020-08-18 16:18:46','2020-08-18 16:18:46',87),(88,'Da Cabana','','Camacan','','45880-000','BA','2020-08-18 18:05:50','2020-08-18 18:05:50',88),(89,'santa lucia ','136','Camacan','','','BA','2020-08-18 18:21:25','2020-08-18 18:21:25',89),(90,'california','376','Camacan','Centro','45880-000','BA','2020-08-19 14:38:13','2020-08-19 14:38:13',90),(91,'Rua Nova','21','Camacã','Centro','45880-000','BA','2020-08-20 06:08:51','2020-08-20 06:08:51',91),(92,'Rua Everaldo Figueredo dos Anjos','162','Camacã','Centro','45880-000','BA','2020-08-20 07:01:17','2020-08-20 07:01:17',92),(93,'Rua Santa Lúcia','174','Camacã','Centro','45880-000','BA','2020-08-20 07:16:01','2020-08-20 07:16:01',93),(94,'Rua canavieiras','20','Camacã','Centro','45880-000','BA','2020-08-20 11:11:03','2020-08-20 11:11:03',94),(95,'Barão Do Rio Branco','144','Camacan','Centro','45880-000','BA','2020-08-20 13:09:17','2020-08-20 13:09:17',95),(96,'uniao rocha','44','Camacan','','','BA','2020-08-20 15:15:42','2020-08-20 15:15:42',96),(97,'são vicente','11','Camacan','','','BA','2020-08-20 17:07:35','2020-08-20 17:07:35',97),(98,'Rua Carlos Gomes','317','Camacã','Centro','45880-000','BA','2020-08-24 07:15:21','2020-08-24 07:15:21',98),(99,'Rua de Mascote','102','Camacã','Centro','','BA','2020-08-24 07:18:20','2020-08-24 07:18:20',99),(100,'Rua Rui Barbosa','','Camacã','Centro','','BA','2020-08-24 10:31:56','2020-08-24 10:31:56',100),(101,'Praça Mário Batista','32','Camacã','Centro','45880-000','BA','2020-08-25 06:28:56','2020-08-25 06:28:56',101),(103,'Alto Paraguai','283','Camacã','Cidade alta','45880-000','BA','2020-08-25 07:22:15','2020-08-25 07:22:15',103),(104,'Rua dois de julho','911','Camacã','Centro','45880-000','BA','2020-08-25 10:35:44','2020-08-25 10:35:44',104),(105,'praça do bené','149','Camacan','Centro','','BA','2020-08-25 13:26:05','2020-08-25 13:26:05',105),(106,'Barão Do Rio Branco','65','Camacan','Centro','','BA','2020-08-25 13:56:08','2020-08-25 13:56:08',106),(107,'travessa joana angelica','49','Camacan','','','BA','2020-08-25 15:37:03','2020-08-25 15:37:03',107),(108,'SDFAsddaf','2131','sdafasdfasfd','dsafasdf','12323-321','PB','2020-08-25 15:44:03','2020-08-25 15:44:03',108);

#
# Procedure "alterarVencimento"
#

DROP PROCEDURE IF EXISTS `alterarVencimento`;
CREATE PROCEDURE `alterarVencimento`(

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



END;

#
# Procedure "anteciparMensalidade"
#

DROP PROCEDURE IF EXISTS `anteciparMensalidade`;
CREATE PROCEDURE `anteciparMensalidade`(

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



END;

#
# Procedure "calculoIMC"
#

DROP PROCEDURE IF EXISTS `calculoIMC`;
CREATE PROCEDURE `calculoIMC`(

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



END;

#
# Procedure "gerarExcluirMensalidade"
#

DROP PROCEDURE IF EXISTS `gerarExcluirMensalidade`;
CREATE PROCEDURE `gerarExcluirMensalidade`(

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
  
  SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);

  SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 1 MONTH));
  
  
  IF @statusCliente = "1" AND @statusMensalidade != "Em aberto" THEN

    INSERT INTO mensalidades (valor, dataEmissao, dataVencimento, status,  createdAt, updatedAt, clienteId)      
    VALUES (@valorMensalidade, NOW(), @dataVencimento, 'Em aberto', NOW(), NOW(), @idCliente);

  END IF;
  
  IF @statusCliente = "0" AND @statusMensalidade = "Em aberto" THEN

    DELETE FROM mensalidades WHERE id = @idMensalidade;

  END IF;
  
END;

#
# Procedure "primeiraMensalidadeAberta"
#

DROP PROCEDURE IF EXISTS `primeiraMensalidadeAberta`;
CREATE PROCEDURE `primeiraMensalidadeAberta`(
  idAcademia int(11)
)
BEGIN


  SET @idAcademia = idAcademia;



  SET @valor = (SELECT valor FROM academia WHERE id = @idAcademia);
  


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



END;

#
# Procedure "primeiraMensalidadePaga"
#

DROP PROCEDURE IF EXISTS `primeiraMensalidadePaga`;
CREATE PROCEDURE `primeiraMensalidadePaga`(idAcademia int(11), idPacote int(11), forma varchar(250))
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



END;

#
# Procedure "relatorioClientes"
#

DROP PROCEDURE IF EXISTS `relatorioClientes`;
CREATE PROCEDURE `relatorioClientes`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;



  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM clientes as C JOIN enderecoclientes as EC

  WHERE C.AcademiumId = @idAcademia AND MONTH(C.createdAt) = @mes AND YEAR(C.createdAt) = @ano AND C.id = EC.clienteId;



END;

#
# Procedure "relatorioDiarioClientes"
#

DROP PROCEDURE IF EXISTS `relatorioDiarioClientes`;
CREATE PROCEDURE `relatorioDiarioClientes`(

  idAcademia int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SELECT * FROM clientes WHERE DATE(createdAt) = CURDATE() AND academiumId = @idAcademia;



END;

#
# Procedure "relatorioDiarioEntradas"
#

DROP PROCEDURE IF EXISTS `relatorioDiarioEntradas`;
CREATE PROCEDURE `relatorioDiarioEntradas`(

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



END;

#
# Procedure "relatorioGastos"
#

DROP PROCEDURE IF EXISTS `relatorioGastos`;
CREATE PROCEDURE `relatorioGastos`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;
  
  
  
  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM gastos WHERE academiumId = @idAcademia AND MONTH(createdAt) = @mes AND YEAR(createdAt) = @ano;



END;

#
# Procedure "relatorioMensalidades"
#

DROP PROCEDURE IF EXISTS `relatorioMensalidades`;
CREATE PROCEDURE `relatorioMensalidades`(

  idAcademia int(11),

  mes int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;

  

  SET @mes = mes;
  
  
  
  SET @ano = (SELECT YEAR(curdate()));

  

  SELECT * FROM mensalidades as M JOIN clientes as C

  WHERE C.AcademiumId = @idAcademia AND MONTH(M.createdAt) = @mes AND YEAR(M.createdAt) = @ano AND C.id = M.clienteId;



END;

#
# Event "eventGerarMensalidades"
#

DROP EVENT IF EXISTS `eventGerarMensalidades`;
CREATE EVENT `eventGerarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-12 12:47:17' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por gerar mensalidades mensalmente' DO BEGIN



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

END;

#
# Event "eventVerificarMensalidades"
#

DROP EVENT IF EXISTS `eventVerificarMensalidades`;
CREATE EVENT `eventVerificarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-12-17 10:06:44' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por verificar mensalidades diariamente' DO BEGIN



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



END;
