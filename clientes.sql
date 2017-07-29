/*
SQLyog Community v12.2.2 (64 bit)
MySQL - 5.7.12-log : Database - clientes
*********************************************************************
*/


/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`clientes` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `clientes`;
/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(10) NOT NULL,
  `contrasenia` varchar(100) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  UNIQUE KEY `ix_usuario` (`usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `usuario` */

insert  into `usuario`(`idUsuario`,`usuario`,`contrasenia`,`nombre`) values

(1,'achacon','202cb962ac59075b964b07152d234b70','ALEXANDER CHACÓN MEDINA'),

(2,'ALEX','202cb962ac59075b964b07152d234b70','ALEX CHACON');

/*Table structure for table `clientetelefono` */

DROP TABLE IF EXISTS `clientetelefono`;

CREATE TABLE `clientetelefono` (
  `idClienteTelefono` int(11) NOT NULL AUTO_INCREMENT,
  `idCliente` int(11) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `numero` bigint(20) NOT NULL,
  `estado` char(1) NOT NULL,
  PRIMARY KEY (`idClienteTelefono`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `clientetelefono` */

insert  into `clientetelefono`(`idClienteTelefono`,`idCliente`,`tipo`,`numero`,`estado`) values

(1,65,'CASA',234567,'A'),

(3,65,'CELULAR',456789,'A'),

(4,66,'CASA',234567,'A'),

(5,67,'CASA',234567,'A'),

(6,67,'OFICINA',2345678,'A'),

(7,68,'OFICINA',123456,'A');

/*Table structure for table `departamento` */

DROP TABLE IF EXISTS `departamento`;

CREATE TABLE `departamento` (
  `idDepartamento` int(2) NOT NULL,
  `departamento` varchar(100) NOT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `departamento` */

insert  into `departamento`(`idDepartamento`,`departamento`,`estado`) values

(1,'HUILA','A'),

(2,'TOLIMA','A');


/*Table structure for table `municipio` */

DROP TABLE IF EXISTS `municipio`;

CREATE TABLE `municipio` (
  `idMunicipio` int(5) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(50) NOT NULL,
  `idDepartamento` int(5) DEFAULT NULL,
  `estado` char(1) NOT NULL DEFAULT 'A',
  PRIMARY KEY (`idMunicipio`),
  KEY `FK_municipio_departamento_idDepartamento` (`idDepartamento`),
  CONSTRAINT `FK_municipio_departamento_idDepartamento` FOREIGN KEY (`idDepartamento`) REFERENCES `departamento` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `municipio` */

insert  into `municipio`(`idMunicipio`,`municipio`,`idDepartamento`,`estado`) values 

(1,'NEIVA',1,'A'),

(2,'IBAGUÉ',2,'A'),

(3,'CAMPOALEGRE',1,'A'),

(4,'PITALITO',1,'A'),

(5,'GARZON',1,'A'),

(6,'RIVERA',1,'A');

/*Table structure for table `cliente` */

DROP TABLE IF EXISTS `cliente`;

CREATE TABLE `cliente` (
  `idCliente` int(10) NOT NULL AUTO_INCREMENT,
  `numeroIdentificacion` bigint(20) DEFAULT NULL,
  `cliente` varchar(100) NOT NULL,
  `idMunicipioResidencia` int(5) NOT NULL,
  `fechaNacimiento` date NOT NULL,
  `estado` varchar(1) NOT NULL DEFAULT 'A',
  `idMunicipioNegocio` int(11) DEFAULT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `numeroIdentificacion` (`numeroIdentificacion`),
  KEY `fkClienteMunicipioIdMunicipioResidenciaIdMunicipio` (`idMunicipioResidencia`),
  CONSTRAINT `fkClienteMunicipioIdMunicipioResidenciaIdMunicipio` FOREIGN KEY (`idMunicipioResidencia`) REFERENCES `municipio` (`idMunicipio`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

/*Data for the table `cliente` */

insert  into `cliente`(`idCliente`,`numeroIdentificacion`,`cliente`,`idMunicipioResidencia`,`fechaNacimiento`,`estado`,`idMunicipioNegocio`) values

(34,1,'alex',1,'2001-01-01','A',2),

(64,2,'UNO',1,'2000-01-01','A',2),

(65,3,'UNO',1,'2000-01-01','I',1),

(67,4,'CUATRO',1,'2000-01-01','A',2);

/* Procedure structure for procedure `SpAdicionarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `SpAdicionarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SpAdicionarCliente`(
	VnumerId int(20)
	,Vcliente varchar(50)
	, Vsaldo float(15,2)
	,Vdescuento float(15,2)
	, VlimiteD int(20)
	,VidMuniResi int(10)
	,idMuniNego int(10)
	,Vdireccion varchar(50)
	,Vcomuna varchar(50)
	,VfechaNaci date
	,estado varchar(10)
	)
begin
insert into cliente(
	numeroIdentificacion
	,cliente
	,saldo
	,descuento
	,limiteDescuento
	,idMunicipioResidencia
	,idMunicipioNegocio
	,direccion
	,comuna
	,fechaNacimiento
	,estado
)
values(
	VnumerId
	,Vcliente
	,Vsaldo
	,Vdescuento
	, VlimiteD
	,VidMuniResi
	,idMuniNego
	,Vdireccion
	,Vcomuna
	,VfechaNaci
	,estado
);
end */$$
DELIMITER ;

/* Procedure structure for procedure `spConsultarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spConsultarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spConsultarCliente`(vNumeroIdentificacion int(15))
BEGIN
SELECT 
	idCliente
	, numeroIdentificacion
	,cliente
	,saldo
	,descuento
	,limiteDescuento
	,idMunicipioResidencia
	,idMunicipioNegocio
	,direccion
	,comuna
	,fechaNacimiento
	,estado
FROM 
	cliente
WHERE
	numeroIdentificacion = vNumeroIdentificacion;
END */$$
DELIMITER ;

/* Procedure structure for procedure `spEliminarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `spEliminarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `spEliminarCliente`(vidCliente int(15))
BEGIN
DELETE 
FROM 
	cliente
WHERE
	idCliente = vidCliente;
END */$$
DELIMITER ;

/* Procedure structure for procedure `SpModificarCliente` */

/*!50003 DROP PROCEDURE IF EXISTS  `SpModificarCliente` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`localhost` PROCEDURE `SpModificarCliente`(
	VidCliente INT(20)
	, VnumerId int(20)
	,Vcliente varchar(50)
	, Vsaldo float(15,2)
	,Vdescuento float(15,2)
	, VlimiteD int(20)
	,VidMuniResi int(10)
	,idMuniNego int(10)
	,Vdireccion varchar(50)
	,Vcomuna varchar(50)
	,VfechaNaci date
	,estado varchar(10)
	)
begin
UPDATE cliente
SET
	numeroIdentificacion = VnumerId
	,cliente = Vcliente
	,saldo = Vsaldo
	,descuento = Vdescuento
	,limiteDescuento = VlimiteD
	,idMunicipioResidencia = VidMuniResi
	,idMunicipioNegocio = idMuniNego
	,direccion = Vdireccion
	,comuna = Vcomuna
	,fechaNacimiento = VfechaNaci
	,estado = estado
WHERE
	idCliente = VidCliente;
end */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
