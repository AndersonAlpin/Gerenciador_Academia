# Host: mysql669.umbler.com:41890  (Version 5.6.40)
# Date: 2020-01-09 13:09:09
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

INSERT INTO `academia` VALUES (1,'A',50,'2020-01-06 20:52:45','2020-01-06 20:52:45'),(2,'b',35,'2019-01-01 00:00:00','2020-01-07 16:41:25');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "administradors"
#

INSERT INTO `administradors` VALUES (1,'Pelé','Santana','Masculino','005.540.125-29','1980-06-22','(73)98891-8550','academiaprofitness@hotmail.com','chefe',1,'2020-01-06 20:52:45','2020-01-06 21:29:30',1),(2,'Usuário','User','Masculino','111.111.111-11','1999-11-11','(73)11111-1111','user@gmail.com','chefe',1,'2019-01-01 00:00:00','2019-01-01 00:00:00',2),(3,'Rita De Cassia ','Santana Silva','Feminino','000.000.000-00','2001-03-19','(73)98149-9516','ritadecassiasantanasilva280@gmail.com','funcionario',1,'2020-01-09 08:31:41','2020-01-09 08:31:41',1);

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

INSERT INTO `enderecoacademia` VALUES (1,'a','2','a','a','45550-111','BA','2020-01-06 20:52:45','2020-01-06 20:52:45',1),(2,'sa','142','sadf','sadf','43414-124','BA','2019-01-01 00:00:00','2020-01-07 16:41:25',2);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "enderecoadministradors"
#

INSERT INTO `enderecoadministradors` VALUES (1,'praça mario batista','1','camacan','centro','45880000','BA','2020-01-06 20:52:45','2020-01-06 21:29:30',1),(2,'safa','342','sadfs','safd','12412412','BA','2019-01-01 00:00:00','2019-01-01 00:00:00',2),(3,'laranjeiras','45880000','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-09 08:31:41','2020-01-09 08:31:41',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

#
# Data for table "gastos"
#

INSERT INTO `gastos` VALUES (1,200,'esteira ','2020-01-08 09:40:24','2020-01-08 09:40:24',1),(2,470.88,'Alvará','2020-01-08 09:42:19','2020-01-08 09:42:19',1),(3,50.32,'Cref / Concelho Regional De Ed.Fisica ','2020-01-08 09:50:59','2020-01-08 09:50:59',1),(4,180,'vander','2020-01-09 10:08:46','2020-01-09 10:08:46',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "logins"
#

INSERT INTO `logins` VALUES (1,'academiaprofitness@hotmail.com','$2a$10$7wqwvhFaQJfysJKsT6Gyk.pktp4lgJlI/kGIwQC28kXW7JyVowLAu','2020-01-06 20:52:45','2020-01-09 07:40:42',1),(2,'user@gmail.com','$2a$10$aQ10Mf9XwvaO/4rF8CjjMO0GDKC8kq/5OPGPpFTDj1yXgtP7ZfcCi','2019-01-01 00:00:00','2019-01-01 00:00:00',2),(3,'ritadecassiasantanasilva280@gmail.com','$2a$10$e.o.ra4JpGguQsrCqj6WKeOtzYG5O/NP8iA/hZTyEWTUYa6KQmuxu','2020-01-09 08:31:41','2020-01-09 08:31:41',3);

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "pacotes"
#

INSERT INTO `pacotes` VALUES (1,'Nenhum','Nenhum desconto',0,1,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Nenhum','Nenhum desconto\t',0,2,'2020-01-01 00:00:00','2020-01-01 00:00:00'),(3,'Luis Antonio ','Pacote De 3 (Familia)',20,1,'2020-01-09 07:32:32','2020-01-09 07:34:53');

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "clientes"
#

INSERT INTO `clientes` VALUES (1,'Leonardo','Carvalho','Masculino','2001-01-04','','(73)99939-3822','',1,'2020-01-07 11:09:44','2020-01-07 17:25:29',1,1),(2,'Marilene','Lima Oliveira ','Feminino','1969-03-11','','(73)99198-4900','',1,'2020-01-07 11:21:32','2020-01-07 11:22:21',1,1),(4,'Emille','Menezes ','Feminino','1987-10-08','','(73)99169-2183','',1,'2020-01-07 17:15:25','2020-01-07 17:32:45',1,1),(5,'Joseane','Carvalho','Feminino','1978-09-08','','(73)98229-4770','',1,'2020-01-07 17:19:10','2020-01-07 17:34:11',1,1),(6,'Eliana ','Matos Dos Santos','Feminino','1962-03-02','','(73)99141-5402','',1,'2020-01-07 17:20:46','2020-01-07 17:35:07',1,1),(7,'Breno','Santo Matos','Masculino','2001-09-01','','','',1,'2020-01-07 17:25:05','2020-01-08 19:18:37',1,1),(9,'Natiene','Nascimento Sobrinho  ','Feminino','1991-02-18','','(73)98222-7883','',1,'2020-01-07 17:37:29','2020-01-07 17:37:29',1,1),(10,'Reginaldo ','Pinto Do Santos Filhos','Masculino','1995-05-23','','(73)98132-5409','',0,'2020-01-07 17:39:02','2020-01-07 17:58:26',1,1),(11,'Ligia ','Marina','Masculino','1983-06-15','','(73)98233-6357','',1,'2020-01-07 17:42:48','2020-01-07 17:42:48',1,1),(12,'Rafael','Ferreira','Masculino','1988-10-17','','(73)99982-1944','',1,'2020-01-07 17:46:52','2020-01-07 17:46:52',1,1),(13,'Maxsuel ','Santos Dos Anjos ','Masculino','2000-10-25','','(73)99829-1303','',1,'2020-01-07 17:50:33','2020-01-07 17:50:33',1,1),(14,'Maria Cristina ','Brito Coelho','Feminino','0000-00-00','','','',1,'2020-01-07 18:00:21','2020-01-07 18:00:21',1,1),(15,'Lucineide ','Dias Da Cruz',NULL,'1980-06-24','','(73)98216-8467','',1,'2020-01-07 18:02:06','2020-01-07 18:02:06',1,1),(16,'Allan ','Moreira','Masculino','0000-00-00','','','',1,'2020-01-07 18:03:42','2020-01-07 18:03:42',1,1),(17,'Nadiele','D´virgen','Feminino','1996-05-07','','(73)99831-6540','',1,'2020-01-07 18:05:35','2020-01-07 18:05:35',1,1),(18,'Erivaldo ','Oliveira',NULL,'1963-05-24','','(73)99198-6775','',1,'2020-01-07 18:15:29','2020-01-07 18:15:29',1,1),(19,'Léia','Ribeiro',NULL,'1996-01-29','','(73)98885-7014','',1,'2020-01-07 18:17:18','2020-01-07 18:17:18',1,1),(20,'Lucas ','Souza Santos','Masculino','0000-00-00','','(73)99109-9215','',1,'2020-01-07 18:25:15','2020-01-07 18:25:15',1,1),(21,'Alexandre ','De Castro Gueds','Masculino','0000-00-00','','(73)99997-0092','',1,'2020-01-07 18:27:12','2020-01-07 18:27:12',1,1),(22,'Samuel ','Da Silva Oliveira ','Masculino','0000-00-00','','(73)98872-9800','',1,'2020-01-07 18:37:27','2020-01-07 18:38:38',1,1),(23,'Maicon ','Miranda Santos ','Masculino','1994-09-18','','(73)98221-0161','',1,'2020-01-07 19:03:26','2020-01-07 19:03:26',1,1),(24,'Stefane Rafaela','Dias Araujo','Feminino','1989-06-06','','(73)98255-3330','',1,'2020-01-07 19:04:59','2020-01-07 19:04:59',1,1),(25,'Hércules','Santos Santana','Masculino','1997-05-07','','','',1,'2020-01-07 19:10:46','2020-01-07 19:16:50',1,1),(26,'Sabrina ','Duque De Caxias','Feminino','1999-09-21','','','',1,'2020-01-07 19:12:37','2020-01-07 19:16:20',1,1),(27,'Katiane','De Jesus Castro','Feminino','2001-08-24','','(73)98231-3751','',1,'2020-01-07 19:15:48','2020-01-07 19:15:48',1,1),(28,'Aline ','Marques Silva','Feminino','1982-04-11','','(73)99123-4048','',1,'2020-01-07 19:23:42','2020-01-07 19:23:42',1,1),(29,'Jessica ','De Araujo Lima','Feminino','0000-00-00','','(73)99124-3692','',1,'2020-01-07 19:25:14','2020-01-07 19:25:14',1,1),(30,'marcos luan','santana santos','Masculino','2000-12-26','','(73)98244-2633','',1,'2020-01-07 19:27:26','2020-01-07 19:27:26',1,1),(31,'tainan','oliveira castro ','Feminino','1982-10-30','','(73)98167-8880','',1,'2020-01-07 19:28:54','2020-01-07 19:28:54',1,1),(32,'Ruan','Pereira','Masculino','2003-01-10','','(73)99136-6005','',1,'2020-01-07 19:34:34','2020-01-07 19:34:34',1,1),(33,'Laise ','Santos Almeida','Feminino','1994-03-05','','(73)98801-9126','',1,'2020-01-07 19:37:09','2020-01-07 19:37:09',1,1),(34,'Maicon Douglas','Dos Santos Santana','Feminino','1996-08-20','','(73)98167-2056','',1,'2020-01-07 19:39:17','2020-01-07 19:39:17',1,1),(35,'Renata','Matos','Feminino','1997-02-22','','(73)98180-6232','',1,'2020-01-07 20:35:30','2020-01-07 20:35:30',1,1),(36,'Pamela','Barbalho','Feminino','1992-01-22','','(73)98212-1662','',1,'2020-01-07 20:46:57','2020-01-07 20:46:57',1,1),(37,'Alexandre ','Rosa','Masculino','1989-11-24','','(73)98105-2425','',1,'2020-01-07 20:49:29','2020-01-08 19:17:23',1,1),(38,'Railane','Santos  Silva','Feminino','1992-04-20','','(73)98164-3466','',1,'2020-01-08 08:05:02','2020-01-08 08:05:49',1,1),(39,'Maira','Pena Oliveira','Feminino','2000-12-25','','(73)99806-2651','',1,'2020-01-08 08:09:50','2020-01-08 08:09:50',1,1),(40,'Paula ','Silva','Feminino','2002-10-28','','(73)98245-2410','',1,'2020-01-08 08:14:45','2020-01-08 08:14:45',1,1),(41,'Haloesis','Leite Oliveira','Masculino','1989-01-21','','(73)98208-1494','',1,'2020-01-08 09:56:39','2020-01-08 09:56:39',1,1),(42,'Leioson Henrrique','Lima Carvalho','Masculino','1991-06-21','','(73)99193-5242','',1,'2020-01-08 14:59:14','2020-01-08 14:59:14',1,1),(43,'Thamiles','Durigan','Feminino','1998-10-29','','(73)98897-4526','',1,'2020-01-08 15:00:31','2020-01-08 15:00:31',1,1),(44,'Queila','Moteiro Da Silva','Feminino','1982-05-10','','','',1,'2020-01-08 15:10:36','2020-01-08 15:10:36',1,1),(45,'Leiticia','Santos','Feminino','2004-05-24','','(73)98172-5440','',1,'2020-01-08 15:37:36','2020-01-08 15:37:36',1,1),(46,'Erica ','Ribeiro','Feminino','1992-07-04','','(73)98136-7467','',1,'2020-01-08 16:35:04','2020-01-08 16:35:04',1,1),(47,'Leonardo','Andrade Da Silva','Masculino','2001-04-17','','','',1,'2020-01-08 17:10:14','2020-01-08 17:12:35',1,1),(48,'Tiago','Barbosa Rego',NULL,'1987-10-06','','(73)98165-4798','',1,'2020-01-08 17:47:07','2020-01-08 17:47:07',1,1),(49,'Priscila','Lopes','Feminino','1993-02-08','','(73)98167-8072','',1,'2020-01-08 18:13:58','2020-01-08 18:13:58',1,1),(50,'Alessandra ','Marchado De Souza ','Feminino','1981-03-27','','','',1,'2020-01-08 18:22:12','2020-01-08 18:22:12',1,1),(51,'Lucas ','Soares','Masculino','2002-07-14','','(73)98246-1435','',1,'2020-01-08 19:10:44','2020-01-08 19:10:44',1,1),(52,'Luis BRENO','Cardoso','Masculino','1999-04-05','','(73)98163-5733','',1,'2020-01-08 19:12:00','2020-01-08 19:12:00',1,1),(53,'Jusciara','Munez De Oliveira  ','Feminino','0000-00-00','','(73)99198-6775','',1,'2020-01-08 19:23:03','2020-01-08 19:23:03',1,1),(54,'Jóse Rogeiro','Silva','Masculino','1993-06-25','','(73)98201-3610','',1,'2020-01-08 20:03:38','2020-01-08 20:03:38',1,1),(55,'Mateus ','Mendes ','Masculino','1994-07-23','','(73)98235-0070','',1,'2020-01-08 20:40:58','2020-01-08 20:40:58',1,1),(56,'Gustavo','Lima Couto ','Masculino','1984-07-28','','(14)99724-2735','',1,'2020-01-09 06:23:03','2020-01-09 06:24:01',1,1),(57,'Ione','De Menezes ','Feminino','1991-02-25','','(73)99286-247','',1,'2020-01-09 06:40:38','2020-01-09 06:41:38',1,1),(58,'Diana ','Silva Do Ouro','Feminino','1990-08-13','','(73)98182-3171','',1,'2020-01-09 06:56:45','2020-01-09 06:56:45',1,1),(59,'Luis Antonio ','Lypynher De Andrade ','Masculino','1981-11-15','','(73)99119-8528','',1,'2020-01-09 07:15:08','2020-01-09 07:33:21',1,3),(60,'Ilza ','Ribeiro ','Feminino','1951-01-03','','(73)99150-0010','',1,'2020-01-09 07:17:10','2020-01-09 07:36:11',1,3),(61,'Mileide ','Mota Torres','Feminino','1983-10-03','','(73)98116-3699','',1,'2020-01-09 07:18:59','2020-01-09 07:36:58',1,3),(62,'Adelan','Mascarenha Falcão','Masculino','1991-02-06','','(73)99910-9399','',1,'2020-01-09 09:43:25','2020-01-09 09:43:25',1,1);

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
) ENGINE=InnoDB AUTO_INCREMENT=136 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "mensalidades"
#

INSERT INTO `mensalidades` VALUES (1,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 11:09:54','2020-01-07 11:09:54',1),(2,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 11:09:54','2020-01-07 11:09:54',1),(3,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 11:21:41','2020-01-07 11:21:41',2),(4,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 11:21:41','2020-01-07 11:21:41',2),(8,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:15:38','2020-01-07 18:15:38',18),(9,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:15:38','2020-01-07 18:15:38',18),(10,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:17:27','2020-01-07 18:17:27',19),(11,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:17:27','2020-01-07 18:17:27',19),(12,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:25:25','2020-01-07 18:25:25',20),(13,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:25:25','2020-01-07 18:25:25',20),(14,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:27:21','2020-01-07 18:27:21',21),(15,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:27:21','2020-01-07 18:27:21',21),(16,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:37:37','2020-01-07 18:37:37',22),(17,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:37:37','2020-01-07 18:37:37',22),(18,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:03:35','2020-01-07 19:03:35',23),(19,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:03:35','2020-01-07 19:03:35',23),(20,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:05:08','2020-01-07 19:05:08',24),(21,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:05:08','2020-01-07 19:05:08',24),(22,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:10:55','2020-01-07 19:10:55',25),(23,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:10:55','2020-01-07 19:10:55',25),(24,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:12:47','2020-01-07 19:12:47',26),(25,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:12:47','2020-01-07 19:12:47',26),(26,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:15:57','2020-01-07 19:15:57',27),(27,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:15:57','2020-01-07 19:15:57',27),(28,50,'2020-01-07','2020-01-07','2020-01-07','Depósito','Pago','2020-01-07 19:23:52','2020-01-07 19:23:52',28),(29,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:23:52','2020-01-07 19:23:52',28),(30,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:25:23','2020-01-07 19:25:23',29),(31,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:25:23','2020-01-07 19:25:23',29),(32,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:27:35','2020-01-07 19:27:35',30),(33,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:27:36','2020-01-07 19:27:36',30),(34,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:29:03','2020-01-07 19:29:03',31),(35,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:29:03','2020-01-07 19:29:03',31),(36,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:34:43','2020-01-07 19:34:43',32),(37,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:34:43','2020-01-07 19:34:43',32),(38,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:37:18','2020-01-07 19:37:18',33),(39,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:37:18','2020-01-07 19:37:18',33),(40,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 19:39:30','2020-01-07 19:39:30',34),(41,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 19:39:30','2020-01-07 19:39:30',34),(42,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 20:35:39','2020-01-07 20:35:39',35),(43,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 20:35:39','2020-01-07 20:35:39',35),(44,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 20:47:06','2020-01-07 20:47:06',36),(45,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 20:47:06','2020-01-07 20:47:06',36),(46,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 20:49:39','2020-01-07 20:49:39',37),(47,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 20:49:39','2020-01-07 20:49:39',37),(48,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:15:25','2020-01-07 17:15:25',4),(49,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:15:25','2020-01-07 17:15:25',4),(50,50,'2020-01-07','2020-01-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:19:10','2020-01-07 17:19:10',5),(51,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:19:10','2020-01-07 17:19:10',5),(52,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:20:46','2020-01-07 17:20:46',6),(53,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:20:46','2020-01-07 17:20:46',6),(54,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:25:05','2020-01-07 17:25:05',7),(55,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:25:05','2020-01-07 17:25:05',7),(58,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:37:29','2020-01-07 17:37:29',9),(59,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:37:29','2020-01-07 17:37:29',9),(60,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:39:02','2020-01-07 17:39:02',10),(61,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:39:02','2020-01-07 17:39:02',10),(62,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:42:48','2020-01-07 17:42:48',11),(63,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:42:48','2020-01-07 17:42:48',11),(73,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:46:52','2020-01-07 17:46:52',12),(74,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:46:52','2020-01-07 17:46:52',12),(75,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 17:50:33','2020-01-07 17:50:33',13),(76,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 17:50:33','2020-01-07 17:50:33',13),(77,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:00:21','2020-01-07 18:00:21',14),(78,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:00:21','2020-01-07 18:00:21',14),(79,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:02:06','2020-01-07 18:02:06',15),(80,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:02:06','2020-01-07 18:02:06',15),(81,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:03:42','2020-01-07 18:03:42',16),(82,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:03:42','2020-01-07 18:03:42',16),(83,50,'2020-01-07','2020-02-07','2020-01-07','Dinheiro','Pago','2020-01-07 18:05:35','2020-01-07 18:05:35',17),(84,50,'2020-01-07','2020-02-07',NULL,NULL,'Em aberto','2020-01-07 18:05:35','2020-01-07 18:05:35',17),(86,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 08:05:12','2020-01-08 08:05:12',38),(87,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 08:05:12','2020-01-08 08:05:12',38),(88,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 08:10:00','2020-01-08 08:10:00',39),(89,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 08:10:00','2020-01-08 08:10:00',39),(90,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 08:14:54','2020-01-08 08:14:54',40),(91,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 08:14:54','2020-01-08 08:14:54',40),(92,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 09:56:49','2020-01-08 09:56:49',41),(93,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 09:56:49','2020-01-08 09:56:49',41),(94,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 14:59:23','2020-01-08 14:59:23',42),(95,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 14:59:23','2020-01-08 14:59:23',42),(96,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 15:00:41','2020-01-08 15:00:41',43),(97,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 15:00:41','2020-01-08 15:00:41',43),(98,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 15:10:46','2020-01-08 15:10:46',44),(99,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 15:10:46','2020-01-08 15:10:46',44),(100,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 15:37:46','2020-01-08 15:37:46',45),(101,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 15:37:46','2020-01-08 15:37:46',45),(102,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 16:35:14','2020-01-08 16:35:14',46),(103,50,'2020-01-08','2020-02-26',NULL,NULL,'Em aberto','2020-01-08 16:35:14','2020-01-08 16:35:14',46),(104,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 17:10:24','2020-01-08 17:10:24',47),(105,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 17:10:24','2020-01-08 17:10:24',47),(106,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 17:47:17','2020-01-08 17:47:17',48),(107,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 17:47:17','2020-01-08 17:47:17',48),(108,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 18:14:08','2020-01-08 18:14:08',49),(109,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 18:14:08','2020-01-08 18:14:08',49),(110,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 18:22:22','2020-01-08 18:22:22',50),(111,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 18:22:22','2020-01-08 18:22:22',50),(112,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 19:10:54','2020-01-08 19:10:54',51),(113,50,'2020-01-08','2020-02-09',NULL,NULL,'Em aberto','2020-01-08 19:10:54','2020-01-08 19:10:54',51),(114,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 19:12:10','2020-01-08 19:12:10',52),(115,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 19:12:10','2020-01-08 19:12:10',52),(116,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 19:23:13','2020-01-08 19:23:13',53),(117,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 19:23:13','2020-01-08 19:23:13',53),(118,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 20:03:48','2020-01-08 20:03:48',54),(119,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 20:03:48','2020-01-08 20:03:48',54),(120,50,'2020-01-08','2020-01-08','2020-01-08','Dinheiro','Pago','2020-01-08 20:41:08','2020-01-08 20:41:08',55),(121,50,'2020-01-08','2020-02-08',NULL,NULL,'Em aberto','2020-01-08 20:41:08','2020-01-08 20:41:08',55),(122,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 06:23:14','2020-01-09 06:23:14',56),(123,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 06:23:14','2020-01-09 06:23:14',56),(124,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 06:40:48','2020-01-09 06:40:48',57),(125,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 06:40:48','2020-01-09 06:40:48',57),(126,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 06:56:55','2020-01-09 06:56:55',58),(127,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 06:56:55','2020-01-09 06:56:55',58),(128,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 07:15:19','2020-01-09 07:15:19',59),(129,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 07:15:19','2020-01-09 07:15:19',59),(130,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 07:17:21','2020-01-09 07:17:21',60),(131,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 07:17:21','2020-01-09 07:17:21',60),(132,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 07:19:10','2020-01-09 07:19:10',61),(133,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 07:19:10','2020-01-09 07:19:10',61),(134,50,'2020-01-09','2020-01-09','2020-01-09','Dinheiro','Pago','2020-01-09 09:43:35','2020-01-09 09:43:35',62),(135,50,'2020-01-09','2020-02-09',NULL,NULL,'Em aberto','2020-01-09 09:43:35','2020-01-09 09:43:35',62);

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

INSERT INTO `examebiometricos` VALUES (1,170,69,0.00238754,'2020-01-09 08:36:22','2020-01-09 08:36:22',1),(2,1.7,69,23.8754,'2020-01-09 08:36:34','2020-01-09 08:36:34',1);

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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "enderecoclientes"
#

INSERT INTO `enderecoclientes` VALUES (1,'Travessa Califórnia','117','Camacã','Centro','45880-000','BA','2020-01-07 11:09:44','2020-01-07 17:25:29',1),(2,'São pedro','121','Camacan','Cidade Alta ','','BA','2020-01-07 11:21:32','2020-01-07 11:22:21',2),(4,'25 de dezembro','27','CAMACAN','centro','45880-000','BA','2020-01-07 17:15:25','2020-01-07 17:32:45',4),(5,'travessa sao francisco','75','CAMACAN','centro','45880-000','BA','2020-01-07 17:19:10','2020-01-07 17:34:11',5),(6,'carlos gomes','129','CAMACAN','centro','45880-000','BA','2020-01-07 17:20:46','2020-01-07 17:35:07',6),(7,'Caminho 03','03','Camacan','Parque Casa Nova','45880-000','BA','2020-01-07 17:25:05','2020-01-08 19:18:37',7),(9,'Praca Mario Batista ','32','CAMACAN','Centro ','45880-000','BA','2020-01-07 17:37:29','2020-01-07 17:37:29',9),(10,'Antonio Pereira dos Santos ','655','CAMACAN','Centro','','BA','2020-01-07 17:39:02','2020-01-07 17:39:02',10),(11,'Carlos Gomes','210','CAMACAN','Centro','45880-000','BA','2020-01-07 17:42:48','2020-01-07 17:42:48',11),(12,'Renato Cabral ','628','CAMACAN','Centro','45880-000','BA','2020-01-07 17:46:52','2020-01-07 17:46:52',12),(13,'Laranjeiras','146','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-07 17:50:33','2020-01-07 17:50:33',13),(14,'Alto Do Sossego','45','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-07 18:00:21','2020-01-07 18:00:21',14),(15,'Antonio Pereira dos Santos ','341','CAMACAN','Centro','45880-000','BA','2020-01-07 18:02:06','2020-01-07 18:02:06',15),(16,'Avenida DrJão Vargens ','303','CAMACAN','Centro','45880-000','BA','2020-01-07 18:03:43','2020-01-07 18:03:43',16),(17,'São Jose','319','CAMACAN','Centro','45880-000','BA','2020-01-07 18:05:35','2020-01-07 18:05:35',17),(18,'Sao Pedro','121','CAMACAN','Centro','','BA','2020-01-07 18:15:29','2020-01-07 18:15:29',18),(19,'Antonio Pereira dos Santos ','589','CAMACAN','Centro','','BA','2020-01-07 18:17:18','2020-01-07 18:17:18',19),(20,'Ana Neris','159','CAMACAN','Centro','45880-000','BA','2020-01-07 18:25:15','2020-01-07 18:25:15',20),(21,'Rua De Mascote ','200','CAMACAN','Centro','45880-000','BA','2020-01-07 18:27:12','2020-01-07 18:27:12',21),(22,'ana nere','','CAMACAN','Centro','','BA','2020-01-07 18:37:27','2020-01-07 18:38:38',22),(23,'São Boa Ventura','319','CAMACAN','Centro','45880-000','BA','2020-01-07 19:03:26','2020-01-07 19:03:26',23),(24,'Antonio Pereira dos Santos','','CAMACAN','','45880-000','BA','2020-01-07 19:04:59','2020-01-07 19:04:59',24),(25,'castro alves','90','CAMACAN','Centro','45880-000','BA','2020-01-07 19:10:46','2020-01-07 19:16:50',25),(26,'castro alves','90','CAMACAN','Centro','','BA','2020-01-07 19:12:37','2020-01-07 19:16:20',26),(27,'Ana Neri','30','CAMACAN','Centro','45880-000','BA','2020-01-07 19:15:48','2020-01-07 19:15:48',27),(28,'ubate','37','CAMACAN','nova ipanema ','','BA','2020-01-07 19:23:42','2020-01-07 19:23:42',28),(29,'Campo Santo','02','CAMACAN','Centro','45880-000','BA','2020-01-07 19:25:14','2020-01-07 19:25:14',29),(30,'bela vista ','23','CAMACAN','Centro','45880-000','CE','2020-01-07 19:27:26','2020-01-07 19:27:26',30),(31,'Sao jose ','82','CAMACAN','Centro','45880-000','BA','2020-01-07 19:28:54','2020-01-07 19:28:54',31),(32,'bela vista','82','CAMACAN','c','45880-000','BA','2020-01-07 19:34:34','2020-01-07 19:34:34',32),(33,'Rua Nova','21','CAMACAN','Centro','45880-000','BA','2020-01-07 19:37:09','2020-01-07 19:37:09',33),(34,'MONTES claro','','CAMACAN','Centro','','BA','2020-01-07 19:39:21','2020-01-07 19:39:21',34),(35,'mario batista ','176','CAMACAN','Centro','45880-000','BA','2020-01-07 20:35:30','2020-01-07 20:35:30',35),(36,'sao francisco','288','CAMACAN','Cidade ALTA','','BA','2020-01-07 20:46:57','2020-01-07 20:46:57',36),(37,'São João','256','CAMACAN','Cidade Alta','45880-000','BA','2020-01-07 20:49:29','2020-01-08 19:17:23',37),(38,'SANTA LUZIA','135','CAMACAN','Centro','45880-000','BA','2020-01-08 08:05:03','2020-01-08 08:05:49',38),(39,'Getulio Vargas ','68','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-08 08:09:50','2020-01-08 08:09:50',39),(40,'independencia','462','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-08 08:14:45','2020-01-08 08:14:45',40),(41,'renato cabral','163','CAMACAN','Centro','45880-000','BA','2020-01-08 09:56:39','2020-01-08 09:56:39',41),(42,'Everaldo Figueireido Do Santos','42','CAMACAN','Centro','45880-000','BA','2020-01-08 14:59:14','2020-01-08 14:59:14',42),(43,'canavieiras','14','CAMACAN','Centro','45880-000','BA','2020-01-08 15:00:32','2020-01-08 15:00:32',43),(44,'2 De julho ','796','CAMACAN','','45880-000','BA','2020-01-08 15:10:36','2020-01-08 15:10:36',44),(45,'santa lucia','512','CAMACAN','Centro','45880-000','BA','2020-01-08 15:37:36','2020-01-08 15:37:36',45),(46,'rui barbosa','360','CAMACAN','Centro','45880-000','BA','2020-01-08 16:35:04','2020-01-08 16:35:04',46),(47,'','','CAMACAN','Leo Ventura','45880-000','BA','2020-01-08 17:10:14','2020-01-08 17:12:35',47),(48,'luciano jose de santana','81','CAMACAN','nova ipanema ','45880-000','BA','2020-01-08 17:47:07','2020-01-08 17:47:07',48),(49,'alto paraguai','262','CAMACAN','Centro','45880-000','BA','2020-01-08 18:13:58','2020-01-08 18:13:58',49),(50,'São José','242','CAMACAN','Centro','45880-000','BA','2020-01-08 18:22:12','2020-01-08 18:22:12',50),(51,'Everaldo Figueireido Do Santos','72','CAMACAN','antonio elias ribeiro','45880-000','BA','2020-01-08 19:10:44','2020-01-08 19:10:44',51),(52,'praca 8 de março','110','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-08 19:12:00','2020-01-08 19:12:00',52),(53,'canavieiras','41','CAMACAN','Centro','45880-000','BA','2020-01-08 19:23:03','2020-01-08 19:23:03',53),(54,'10 De Janeiro','286','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-08 20:03:38','2020-01-08 20:03:38',54),(55,'travessa boa vista','265','CAMACAN','Centro','45880-000','BA','2020-01-08 20:40:58','2020-01-08 20:40:58',55),(56,'ANA MOURA ','113','CAMACAN','JOANA ANGELICA','45880-000','BA','2020-01-09 06:23:03','2020-01-09 06:24:01',56),(57,'25 de dezembro ','30','CAMACAN','Centro','45880-000','BA','2020-01-09 06:40:38','2020-01-09 06:41:38',57),(58,'travessa belo horizonte ','133','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-09 06:56:45','2020-01-09 06:56:45',58),(59,'Colina Dos Laranjais','405','CAMACAN','Centro','45880-000','BA','2020-01-09 07:15:08','2020-01-09 07:33:21',59),(60,'Barão Do Rio Branco','341','CAMACAN','Cidade ALTA','45880-000','BA','2020-01-09 07:17:10','2020-01-09 07:36:11',60),(61,'Colina Dos Laranjais ','405','CAMACAN','Centro','45880-000','BA','2020-01-09 07:18:59','2020-01-09 07:36:58',61),(62,'rua da providencia','02','CAMACAN','Centro','45880-000','BA','2020-01-09 09:43:25','2020-01-09 09:43:25',62);

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
