# Host: mysql669.umbler.com:41890  (Version 5.6.40)
# Date: 2020-01-06 20:59:35
# Generator: MySQL-Front 6.1  (Build 1.26)


#
# Structure for table "academia"
#

DROP TABLE IF EXISTS `academia`;
CREATE TABLE `academia` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# Structure for table "mensalidades"
#

DROP TABLE IF EXISTS `mensalidades`;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

#
# View "viewmensalidade"
#

DROP VIEW IF EXISTS `viewmensalidade`;
CREATE
  ALGORITHM = UNDEFINED
  VIEW `viewmensalidade`
  AS
  SELECT `information_schema`.`columns`.`COLUMN_DEFAULT` AS 'valor' FROM `information_schema`.`columns` WHERE ((`information_schema`.`columns`.`TABLE_SCHEMA` = 'sublimemanager') AND (`information_schema`.`columns`.`TABLE_NAME` = 'mensalidades') AND (`information_schema`.`columns`.`COLUMN_NAME` = 'valor'));

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

  idCliente int(11), 

  idPacote int(11),

  forma varchar(250),

  dataVenc date

)
BEGIN



  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'sublimemanager' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');



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
CREATE PROCEDURE `primeiraMensalidadeAberta`()
BEGIN



  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'sublimemanager' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');



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
CREATE PROCEDURE `primeiraMensalidadePaga`(idPacote int(11), forma varchar(250))
BEGIN



  SET @valor = (SELECT `COLUMN_DEFAULT` AS 'valor' FROM `INFORMATION_SCHEMA`.`COLUMNS` WHERE `TABLE_SCHEMA` = 'sublimemanager' AND `TABLE_NAME` = 'mensalidades' AND `COLUMN_NAME` = 'valor');



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
# Procedure "relatorioDiarioEntradas"
#

DROP PROCEDURE IF EXISTS `relatorioDiarioEntradas`;
CREATE PROCEDURE `relatorioDiarioEntradas`(

  idAcademia int(11)

)
BEGIN

  

  SET @idAcademia = idAcademia;


  
  SELECT SUM(valor) AS valor, COUNT(valor) AS numMensalidades FROM mensalidades AS M, clientes AS C, academia AS A
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



      SET @isAtivo = (SELECT ativo FROM clientes WHERE id = @clienteID);



      SET @valor = (SELECT COLUMN_DEFAULT AS valor FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'sublimemanager'  AND TABLE_NAME = 'mensalidades' AND COLUMN_NAME = 'valor');

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
