# Host: localhost  (Version 5.7.26)
# Date: 2019-11-12 15:21:43
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "academia"
#

DROP TABLE IF EXISTS `academia`;
CREATE TABLE `academia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "academia"
#

INSERT INTO `academia` VALUES (1,'Academia Teste','2019-11-12 13:59:05','2019-11-12 13:59:05');

#
# Structure for table "administradors"
#

DROP TABLE IF EXISTS `administradors`;
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

#
# Data for table "administradors"
#


#
# Structure for table "logins"
#

DROP TABLE IF EXISTS `logins`;
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

#
# Data for table "logins"
#


#
# Structure for table "pacotes"
#

DROP TABLE IF EXISTS `pacotes`;
CREATE TABLE `pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` text NOT NULL,
  `taxaDesconto` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "pacotes"
#

INSERT INTO `pacotes` VALUES (1,'Verão','Desconto especial de verão',10,'2019-11-12 13:59:34','2019-11-12 13:59:34');

#
# Structure for table "clientes"
#

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `sobrenome` varchar(255) NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "clientes"
#

INSERT INTO `clientes` VALUES (1,'Anderson','Alpin','777.777.777-77','(77)77777-7777','anderson@gmail.com',1,'2019-11-12 13:58:56','2019-11-12 13:58:56',1,1);

#
# Structure for table "mensalidades"
#

DROP TABLE IF EXISTS `mensalidades`;
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

#
# Data for table "mensalidades"
#


#
# Structure for table "enderecoclientes"
#

DROP TABLE IF EXISTS `enderecoclientes`;
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Data for table "enderecoclientes"
#

INSERT INTO `enderecoclientes` VALUES (1,'Logradouro Teste','22','Cidade Teste','Bairro Teste','00000-000','TE','2019-11-12 13:58:56','2019-11-12 13:58:56',1);
