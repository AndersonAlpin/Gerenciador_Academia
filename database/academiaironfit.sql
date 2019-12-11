# Host: mysql669.umbler.com:41890  (Version 5.6.40)
# Date: 2019-12-11 13:15:03
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "academia"
#

CREATE TABLE `academia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "academia"
#

REPLACE INTO `academia` VALUES (1,'Academia IronFit','2019-11-12 13:59:05','2019-11-12 13:59:05');

#
# Structure for table "administradors"
#

CREATE TABLE `administradors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataNascimento` date DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `AcademiumId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `AcademiumId` (`AcademiumId`),
  CONSTRAINT `administradors_ibfk_1` FOREIGN KEY (`AcademiumId`) REFERENCES `academia` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "administradors"
#

REPLACE INTO `administradors` VALUES (1,'Administrador','IronFit','056.123.125.11','1982-07-14','(73)95543-1256','2019-12-01 19:19:53','2019-12-11 10:44:55',1);

#
# Structure for table "logins"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "logins"
#

REPLACE INTO `logins` VALUES (1,'adminironfit@gmail.com','$2a$10$pwkPmNqou/0UEyjY0ASEFOVpgBVMdsmrR3YLonOuJRnkrKkSzenhu','2019-12-01 19:19:53','2019-12-09 08:55:20',1);

#
# Structure for table "pacotes"
#

CREATE TABLE `pacotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `taxaDesconto` double NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "pacotes"
#

REPLACE INTO `pacotes` VALUES (1,'Nenhum','Nenhum deseconto',0,'2019-11-12 13:59:34','2019-11-12 13:59:34'),(2,'Verão','Grupos a partir de 4 pessoas tem 10% de desconto na mensalidade.',15,'2019-11-12 13:59:34','2019-12-09 09:44:50'),(4,'Premium','Grupos a partir de 6 pessoas tem desconto de 15% nas mensalidades.',15,'2019-12-08 12:26:07','2019-12-08 12:26:07'),(5,'Família','Grupos a partir de 3 pessoas tem desconto de 5% nas mensalidades;',5,'2019-12-08 12:26:48','2019-12-08 12:26:48');

#
# Structure for table "clientes"
#

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sobrenome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataNascimento` date DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "clientes"
#

REPLACE INTO `clientes` VALUES (1,'Renato','Russo','1960-03-27','123.123.123-23','(22)22222-2222','renatorussoo@gmail.com',0,'2019-12-08 15:01:23','2019-12-11 11:37:16',1,2),(2,'Leonardo','Carvalho','1996-01-20','989.898.795.65','(99)99999-9999','leonardocamcan@gmail.com',1,'2019-12-09 19:16:10','2019-12-11 11:13:31',1,1),(3,'Anderson','Alpin','2002-01-04','123.456.890.11','(40)02892-22','anderson@gmail.com',1,'2019-12-09 19:19:50','2019-12-09 19:19:50',1,4);

#
# Structure for table "mensalidades"
#

CREATE TABLE `mensalidades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `valor` double NOT NULL DEFAULT '50',
  `dataEmissao` datetime NOT NULL,
  `dataVencimento` date DEFAULT NULL,
  `dataPagamento` datetime DEFAULT NULL,
  `formaPagamento` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Em aberto',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `clienteId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `clienteId` (`clienteId`),
  CONSTRAINT `mensalidades_ibfk_1` FOREIGN KEY (`clienteId`) REFERENCES `clientes` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "mensalidades"
#

REPLACE INTO `mensalidades` VALUES (1,42.5,'2019-12-08 15:08:07','2019-12-08','2019-12-08 15:08:07','Dinheiro','Pago','2019-12-08 15:08:07','2019-12-08 15:08:07',1),(2,42.5,'2019-12-08 15:14:41','2020-01-07','2019-12-10 15:15:41','Depósito','Pago','2019-12-08 15:14:41','2019-12-10 15:15:41',1),(3,47.5,'2019-12-09 19:16:10','2019-12-09','2019-12-09 19:16:10','Transferência','Pago','2019-12-09 19:16:10','2019-12-09 19:16:10',2),(4,42.5,'2019-12-09 19:19:50','2019-12-09','2019-12-09 19:19:50','Cartão','Pago','2019-12-09 19:19:50','2019-12-09 19:19:50',3);

#
# Structure for table "enderecoclientes"
#

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Data for table "enderecoclientes"
#

REPLACE INTO `enderecoclientes` VALUES (1,'Ilha do Governador','33','Rio de Janeiro','Ilha do Governador','21412-412','RN','2019-12-08 15:01:23','2019-12-10 14:38:01',1),(2,'travessa california','17','camacan','centro','45880-000','BA','2019-12-09 19:16:10','2019-12-11 11:13:31',2),(3,'Travessa','254','Camacan','Centro','45880-000','BA','2019-12-09 19:19:50','2019-12-09 19:19:50',3);

#
# Procedure "primeiraMensalidade"
#

CREATE PROCEDURE `primeiraMensalidade`(idPacote int(11), forma varchar(250))
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
    (@valorMensalidade, NOW(), CURDATE(), NOW(), @forma, 'Pago', NOW(), NOW(), @ultimoID);
END;

#
# Event "eventGerarMensalidades"
#

CREATE EVENT `eventGerarMensalidades` ON SCHEDULE EVERY 3 DAY STARTS '2019-12-08 15:15:37' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por gerar mensalidades mensalmente' DO BEGIN
  START TRANSACTION;
    SET @minID = (SELECT MIN(id) FROM clientes);
    SET @maxID = (SELECT MAX(id) FROM clientes);
    
    WHILE @minID <= @maxID DO
    
      SET @clienteID = @minID;
      SET @pacoteID = (SELECT pacoteId from clientes WHERE id = @clienteID); 
      SET @isAtivo = (SELECT ativo FROM clientes WHERE id = @clienteID);
      SET @valor = (SELECT COLUMN_DEFAULT AS valor FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'academiaironfit'  AND TABLE_NAME = 'mensalidades' AND COLUMN_NAME = 'valor');
      SET @taxaDesconto = (SELECT taxaDesconto FROM pacotes WHERE id = @pacoteID);
	    SET @valorMensalidade = (@valor - @taxaDesconto / 100 * @valor);
      SET @dataVencimento = (SELECT DATE_ADD(CURDATE(), INTERVAL 30 DAY));
      
      IF @clienteID > 0 AND @isAtivo = 1 THEN
        INSERT INTO mensalidades (valor, dataEmissao, dataVencimento, createdAt, updatedAt, clienteId)
        VALUES (@valorMensalidade, NOW(), @dataVencimento, NOW(), NOW(), @clienteID);
      END IF;
      
      SET @minID = @minID + 1;
    END WHILE;
    
  COMMIT;
END;

#
# Event "eventVerificarMensalidades"
#

CREATE EVENT `eventVerificarMensalidades` ON SCHEDULE EVERY 10 SECOND STARTS '2019-11-15 14:25:00' ON COMPLETION NOT PRESERVE ENABLE COMMENT 'Responsável por verificar mensalidades diariamente' DO BEGIN
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
