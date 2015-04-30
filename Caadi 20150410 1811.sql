-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.42


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema caadi
--

CREATE DATABASE IF NOT EXISTS caadi;
USE caadi;

--
-- Definition of table `actividad`
--

DROP TABLE IF EXISTS `actividad`;
CREATE TABLE `actividad` (
  `numActividadID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombre` varchar(45) NOT NULL,
  `strNombreCorto` varchar(5) NOT NULL,
  `datFechaInsercion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numActividadID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `actividad`
--

/*!40000 ALTER TABLE `actividad` DISABLE KEYS */;
INSERT INTO `actividad` (`numActividadID`,`strNombre`,`strNombreCorto`,`datFechaInsercion`,`strUsuarioInsercion`) VALUES 
 (1,'Listening','LST','2015-04-08 19:32:39',NULL),
 (2,'Reading','RED','2015-04-08 19:34:31',NULL),
 (3,'Sleeping','SLP','2015-04-09 00:21:10',NULL),
 (4,'Chatting','CHT','2015-04-09 02:53:30',NULL),
 (5,'Writing','WRT','2015-04-09 14:24:03',NULL);
/*!40000 ALTER TABLE `actividad` ENABLE KEYS */;


--
-- Definition of table `almacen`
--

DROP TABLE IF EXISTS `almacen`;
CREATE TABLE `almacen` (
  `numIdAlmacen` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strDesCorta` varchar(45) NOT NULL,
  `bolEliminado` tinyint(1) NOT NULL,
  PRIMARY KEY (`numIdAlmacen`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `almacen`
--

/*!40000 ALTER TABLE `almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen` ENABLE KEYS */;


--
-- Definition of table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
CREATE TABLE `alumno` (
  `numAlumnoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombres` varchar(60) NOT NULL,
  `strApellidos` varchar(60) NOT NULL,
  `strDireccion` varchar(100) NOT NULL,
  `datFechaNacimiento` date NOT NULL,
  `strLugarNacimiento` varchar(50) NOT NULL,
  `strSexo` int(1) unsigned NOT NULL,
  `strNUA` varchar(10) NOT NULL,
  `strTelefono` varchar(15) NOT NULL,
  `strMovil` varchar(15) NOT NULL,
  `strEmail` varchar(50) NOT NULL,
  `strObservaciones` blob NOT NULL,
  `datFechaInsercion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  `numUsuarioID` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`numAlumnoID`),
  KEY `FK_alumno_1` (`numUsuarioID`),
  CONSTRAINT `FK_alumno_1` FOREIGN KEY (`numUsuarioID`) REFERENCES `usuario` (`numUsuarioID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alumno`
--

/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` (`numAlumnoID`,`strNombres`,`strApellidos`,`strDireccion`,`datFechaNacimiento`,`strLugarNacimiento`,`strSexo`,`strNUA`,`strTelefono`,`strMovil`,`strEmail`,`strObservaciones`,`datFechaInsercion`,`strUsuarioInsercion`,`numUsuarioID`) VALUES 
 (1,'Rolando Palermo','Rodríguez Cruz','Av. 16 de Septiembre 15B','1988-04-02','Guanajuato',0,'14489','','+51993014608','rolando.roc@gmail.com','','2015-04-06 00:53:56',NULL,NULL),
 (2,'Maria Fernanda','Hernández Luquin','Salamanca','1990-04-24','Distrito Federal',1,'14490','','','','','2015-04-06 01:14:32',NULL,NULL),
 (3,'César Choto2','Hernandez Martinez','Su casa','1985-04-13','Distrito Federal',0,'14491','','','','','2015-04-06 01:18:48',NULL,NULL),
 (4,'Daniel Andrés2','Mezquida','Su casa','1988-04-07','Distrito Federal',0,'14492','','','',0x5361636120656C20706973746F2E,'2015-04-06 01:20:34',NULL,NULL),
 (5,'Willie','Colon','Puerto Rico','2015-04-11','Distrito Federal',0,'14493','','','',0x45737461626120657363756368616E646F206573612063616E6369C3B36E2079206C6120707573652E,'2015-04-06 01:25:22',NULL,NULL),
 (6,'Felipe','Gómez','Su casa','2015-04-06','Distrito Federal',0,'14494','','','','','2015-04-06 01:28:45',NULL,NULL),
 (7,'Orlando','Oferbrench','','2015-04-08','Distrito Federal',0,'14495','','','','','2015-04-08 17:31:32',NULL,NULL),
 (8,'Claudia','Van','','2015-04-08','Distrito Federal',0,'14496','','','','','2015-04-08 17:46:56',NULL,NULL),
 (9,'Narda','Ocampo','','2015-04-08','Distrito Federal',1,'14497','','','','','2015-04-08 18:18:11',NULL,1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;


--
-- Definition of table `alumno_curso`
--

DROP TABLE IF EXISTS `alumno_curso`;
CREATE TABLE `alumno_curso` (
  `numMateriaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numAlumnoID` int(10) unsigned NOT NULL,
  `numCalificacion` double DEFAULT '0',
  `strObservacion` blob,
  PRIMARY KEY (`numMateriaID`,`numAlumnoID`) USING BTREE,
  KEY `FK_alumno_curso_2` (`numAlumnoID`),
  CONSTRAINT `FK_alumno_curso_1` FOREIGN KEY (`numMateriaID`) REFERENCES `materia` (`numMateriaID`),
  CONSTRAINT `FK_alumno_curso_2` FOREIGN KEY (`numAlumnoID`) REFERENCES `alumno` (`numAlumnoID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `alumno_curso`
--

/*!40000 ALTER TABLE `alumno_curso` DISABLE KEYS */;
INSERT INTO `alumno_curso` (`numMateriaID`,`numAlumnoID`,`numCalificacion`,`strObservacion`) VALUES 
 (3,1,0,NULL),
 (3,2,0,NULL),
 (4,3,0,NULL),
 (4,4,0,NULL),
 (4,5,0,NULL),
 (4,6,0,NULL);
/*!40000 ALTER TABLE `alumno_curso` ENABLE KEYS */;


--
-- Definition of table `articulo`
--

DROP TABLE IF EXISTS `articulo`;
CREATE TABLE `articulo` (
  `numIdArticulo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strDesCorta` varchar(45) NOT NULL,
  `srtDesLarga` blob,
  `numCantidad` int(10) unsigned NOT NULL DEFAULT '0',
  `datFechaRegistro` date DEFAULT NULL,
  `bolEliminado` tinyint(1) NOT NULL,
  `numIdUnidad` int(10) unsigned NOT NULL,
  `numIdTipo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numIdArticulo`),
  KEY `FK_articulo_1` (`numIdUnidad`),
  KEY `FK_articulo_2` (`numIdTipo`),
  CONSTRAINT `FK_articulo_1` FOREIGN KEY (`numIdUnidad`) REFERENCES `unidad_articulo` (`numIdUnidad`),
  CONSTRAINT `FK_articulo_2` FOREIGN KEY (`numIdTipo`) REFERENCES `tipo_articulo` (`numIdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articulo`
--

/*!40000 ALTER TABLE `articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo` ENABLE KEYS */;


--
-- Definition of table `articulo_almacen`
--

DROP TABLE IF EXISTS `articulo_almacen`;
CREATE TABLE `articulo_almacen` (
  `numId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numIdArticulo` int(10) unsigned NOT NULL,
  `numIdAlmacen` int(10) unsigned NOT NULL,
  `numCantidad` int(10) unsigned NOT NULL,
  `strPosicion` varchar(20) NOT NULL,
  PRIMARY KEY (`numId`),
  KEY `FK_articulo_almacen_1` (`numIdArticulo`),
  KEY `FK_articulo_almacen_2` (`numIdAlmacen`),
  CONSTRAINT `FK_articulo_almacen_1` FOREIGN KEY (`numIdArticulo`) REFERENCES `articulo` (`numIdArticulo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_articulo_almacen_2` FOREIGN KEY (`numIdAlmacen`) REFERENCES `almacen` (`numIdAlmacen`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `articulo_almacen`
--

/*!40000 ALTER TABLE `articulo_almacen` DISABLE KEYS */;
/*!40000 ALTER TABLE `articulo_almacen` ENABLE KEYS */;


--
-- Definition of table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
CREATE TABLE `asistencia` (
  `numAsistenciaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numMateriaID` int(10) unsigned NOT NULL,
  `numAlumnoID` int(10) unsigned NOT NULL,
  `numActividadID` int(10) unsigned NOT NULL,
  `datHoraEntrada` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `datHoraSalida` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `strObservacion` blob,
  PRIMARY KEY (`numAsistenciaID`),
  KEY `FK_asistencia_1` (`numMateriaID`),
  KEY `FK_asistencia_2` (`numAlumnoID`),
  KEY `FK_asistencia_3` (`numActividadID`),
  CONSTRAINT `FK_asistencia_1` FOREIGN KEY (`numMateriaID`) REFERENCES `materia` (`numMateriaID`),
  CONSTRAINT `FK_asistencia_2` FOREIGN KEY (`numAlumnoID`) REFERENCES `alumno` (`numAlumnoID`),
  CONSTRAINT `FK_asistencia_3` FOREIGN KEY (`numActividadID`) REFERENCES `actividad` (`numActividadID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `asistencia`
--

/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;


--
-- Definition of table `estados_mexico`
--

DROP TABLE IF EXISTS `estados_mexico`;
CREATE TABLE `estados_mexico` (
  `numEstadoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombre` varchar(50) NOT NULL,
  PRIMARY KEY (`numEstadoID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `estados_mexico`
--

/*!40000 ALTER TABLE `estados_mexico` DISABLE KEYS */;
INSERT INTO `estados_mexico` (`numEstadoID`,`strNombre`) VALUES 
 (1,'Distrito Federal'),
 (2,'Aguascalientes'),
 (3,'Baja California'),
 (4,'Baja California Sur'),
 (5,'Campeche'),
 (6,'Chiapas'),
 (7,'Chihuahua'),
 (8,'Coahuila de Zaragoza'),
 (9,'Colima'),
 (10,'Durango'),
 (11,'Guanajuato'),
 (12,'Guerrero'),
 (13,'Hidalgo'),
 (14,'Jalisco'),
 (15,'México'),
 (16,'Michoacán de Ocampo'),
 (17,'Morelos'),
 (18,'Nayarit'),
 (19,'Nuevo León'),
 (20,'Oaxaca'),
 (21,'Puebla'),
 (22,'Querétaro de Arteaga'),
 (23,'Quintana Roo'),
 (24,'San Luis Potosí'),
 (25,'Sinaloa'),
 (26,'Sonora'),
 (27,'Tabasco'),
 (28,'Tamaulipas'),
 (29,'Tlaxcala'),
 (30,'Veracruz de Ignacio de la Llave'),
 (31,'Yucatán'),
 (32,'Zacatecas');
/*!40000 ALTER TABLE `estados_mexico` ENABLE KEYS */;


--
-- Definition of table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE `grupo` (
  `numGrupoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombre` varchar(5) NOT NULL,
  `datFechaInsercion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numGrupoID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `grupo`
--

/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` (`numGrupoID`,`strNombre`,`datFechaInsercion`,`strUsuarioInsercion`) VALUES 
 (1,'A','2015-04-09 00:31:19',NULL),
 (2,'B','2015-04-09 01:04:21',NULL),
 (3,'C','2015-04-09 01:06:17',NULL);
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;


--
-- Definition of table `maestro`
--

DROP TABLE IF EXISTS `maestro`;
CREATE TABLE `maestro` (
  `numMaestroID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombresMaestro` varchar(50) NOT NULL,
  `strApellidosMaestro` varchar(50) NOT NULL,
  `datFechaNacimiento` date NOT NULL,
  `strSexo` varchar(1) NOT NULL,
  `strTelefono` varchar(15) DEFAULT NULL,
  `strCelular` varchar(15) DEFAULT NULL,
  `strDireccion` varchar(50) DEFAULT NULL,
  `datFechaIngreso` date DEFAULT NULL,
  `strFormacion` varchar(60) DEFAULT NULL,
  `strEspecialidad` varchar(60) DEFAULT NULL,
  `datFechaInsercion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numMaestroID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `maestro`
--

/*!40000 ALTER TABLE `maestro` DISABLE KEYS */;
INSERT INTO `maestro` (`numMaestroID`,`strNombresMaestro`,`strApellidosMaestro`,`datFechaNacimiento`,`strSexo`,`strTelefono`,`strCelular`,`strDireccion`,`datFechaIngreso`,`strFormacion`,`strEspecialidad`,`datFechaInsercion`,`strUsuarioInsercion`) VALUES 
 (1,'Patty','Razo','2015-04-08','1','-','-','Canadá','2015-04-08','Licenciada','Contabilidad','2015-04-08 08:42:41',NULL),
 (2,'Iván','Calderon','2015-04-07','0','','','Estados Unidos','2015-04-04','Licenciado','Lenguas','2015-04-08 08:45:45',NULL),
 (3,'Rocío','Lizárraga','2015-04-08','1','','','','2015-04-08','','','2015-04-08 18:59:46',NULL);
/*!40000 ALTER TABLE `maestro` ENABLE KEYS */;


--
-- Definition of table `materia`
--

DROP TABLE IF EXISTS `materia`;
CREATE TABLE `materia` (
  `numMateriaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numNivelID` int(10) unsigned NOT NULL,
  `numGrupoID` int(10) unsigned NOT NULL,
  `numMaestroID` int(10) unsigned NOT NULL,
  `datPeriodo` int(4) unsigned NOT NULL,
  `numSemestre` int(2) unsigned NOT NULL,
  `strObservacion` blob,
  `numActivo` int(1) unsigned DEFAULT '0',
  PRIMARY KEY (`numMateriaID`),
  KEY `FK_materia_1` (`numNivelID`),
  KEY `FK_materia_2` (`numGrupoID`),
  KEY `FK_materia_3` (`numMaestroID`),
  CONSTRAINT `FK_materia_1` FOREIGN KEY (`numNivelID`) REFERENCES `nivel` (`numNivelID`),
  CONSTRAINT `FK_materia_2` FOREIGN KEY (`numGrupoID`) REFERENCES `grupo` (`numGrupoID`),
  CONSTRAINT `FK_materia_3` FOREIGN KEY (`numMaestroID`) REFERENCES `maestro` (`numMaestroID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `materia`
--

/*!40000 ALTER TABLE `materia` DISABLE KEYS */;
INSERT INTO `materia` (`numMateriaID`,`numNivelID`,`numGrupoID`,`numMaestroID`,`datPeriodo`,`numSemestre`,`strObservacion`,`numActivo`) VALUES 
 (3,1,1,1,2015,1,0x477275706F206465207072756562612E,1),
 (4,1,2,1,2015,1,'',1),
 (5,1,3,2,2015,1,'',0),
 (6,1,1,3,2014,2,'',0);
/*!40000 ALTER TABLE `materia` ENABLE KEYS */;


--
-- Definition of table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
CREATE TABLE `nivel` (
  `numNivelID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombre` varchar(5) NOT NULL,
  `datFechaInsercion` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numNivelID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `nivel`
--

/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` (`numNivelID`,`strNombre`,`datFechaInsercion`,`strUsuarioInsercion`) VALUES 
 (1,'1','2015-04-09 02:35:02',NULL),
 (2,'2','2015-04-09 02:36:10',NULL),
 (3,'3','2015-04-09 02:51:32',NULL),
 (4,'4','2015-04-09 02:52:49',NULL),
 (5,'5','2015-04-09 02:53:05',NULL);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;


--
-- Definition of table `rol`
--

DROP TABLE IF EXISTS `rol`;
CREATE TABLE `rol` (
  `numRolID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombre` varchar(45) NOT NULL,
  PRIMARY KEY (`numRolID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rol`
--

/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` (`numRolID`,`strNombre`) VALUES 
 (1,'Usuario');
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;


--
-- Definition of table `tipo_articulo`
--

DROP TABLE IF EXISTS `tipo_articulo`;
CREATE TABLE `tipo_articulo` (
  `numIdTipo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strDescripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`numIdTipo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipo_articulo`
--

/*!40000 ALTER TABLE `tipo_articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_articulo` ENABLE KEYS */;


--
-- Definition of table `unidad_articulo`
--

DROP TABLE IF EXISTS `unidad_articulo`;
CREATE TABLE `unidad_articulo` (
  `numIdUnidad` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strDescripcion` varchar(45) NOT NULL,
  PRIMARY KEY (`numIdUnidad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `unidad_articulo`
--

/*!40000 ALTER TABLE `unidad_articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad_articulo` ENABLE KEYS */;


--
-- Definition of table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `numUsuarioID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strNombre` varchar(45) NOT NULL,
  `strPassword` blob NOT NULL,
  `numRolID` int(10) unsigned NOT NULL,
  `datFechaInsercion` datetime DEFAULT NULL,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numUsuarioID`),
  KEY `FK_usuario_1` (`numRolID`),
  CONSTRAINT `FK_usuario_1` FOREIGN KEY (`numRolID`) REFERENCES `rol` (`numRolID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `usuario`
--

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` (`numUsuarioID`,`strNombre`,`strPassword`,`numRolID`,`datFechaInsercion`,`strUsuarioInsercion`) VALUES 
 (1,'nocampo',0xBF5E316C142BB476860BC8B2046199CD,1,NULL,NULL);
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;


--
-- Definition of table `utilizacion_articulo`
--

DROP TABLE IF EXISTS `utilizacion_articulo`;
CREATE TABLE `utilizacion_articulo` (
  `numId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numIdUsuario` int(10) unsigned NOT NULL,
  `numIdAlumno` int(10) unsigned NOT NULL,
  `numIdArtAlm` int(10) unsigned NOT NULL,
  `datFechaUso` datetime NOT NULL,
  PRIMARY KEY (`numId`),
  KEY `FK_utilizacion_articulo_1` (`numIdUsuario`),
  KEY `FK_utilizacion_articulo_2` (`numIdAlumno`),
  KEY `FK_utilizacion_articulo_3` (`numIdArtAlm`),
  CONSTRAINT `FK_utilizacion_articulo_1` FOREIGN KEY (`numIdUsuario`) REFERENCES `usuario` (`numUsuarioID`),
  CONSTRAINT `FK_utilizacion_articulo_2` FOREIGN KEY (`numIdAlumno`) REFERENCES `alumno` (`numAlumnoID`),
  CONSTRAINT `FK_utilizacion_articulo_3` FOREIGN KEY (`numIdArtAlm`) REFERENCES `articulo_almacen` (`numId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `utilizacion_articulo`
--

/*!40000 ALTER TABLE `utilizacion_articulo` DISABLE KEYS */;
/*!40000 ALTER TABLE `utilizacion_articulo` ENABLE KEYS */;


--
-- Definition of table `vista`
--

DROP TABLE IF EXISTS `vista`;
CREATE TABLE `vista` (
  `numVistaID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `strCodigo` varchar(10) NOT NULL,
  `strTitulo` varchar(100) NOT NULL,
  `datFechaInsercion` datetime DEFAULT NULL,
  `datFechaModificacion` datetime DEFAULT NULL,
  `strUsuarioInsercion` varchar(45) DEFAULT NULL,
  `strUsuarioModificacion` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`numVistaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vista`
--

/*!40000 ALTER TABLE `vista` DISABLE KEYS */;
/*!40000 ALTER TABLE `vista` ENABLE KEYS */;


--
-- Definition of table `vista_rol`
--

DROP TABLE IF EXISTS `vista_rol`;
CREATE TABLE `vista_rol` (
  `numID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `numRolID` int(10) unsigned NOT NULL,
  `numVistaID` int(10) unsigned NOT NULL,
  PRIMARY KEY (`numID`),
  KEY `FK_vista_rol_1` (`numRolID`),
  KEY `FK_vista_rol_2` (`numVistaID`),
  CONSTRAINT `FK_vista_rol_1` FOREIGN KEY (`numRolID`) REFERENCES `rol` (`numRolID`),
  CONSTRAINT `FK_vista_rol_2` FOREIGN KEY (`numVistaID`) REFERENCES `vista` (`numVistaID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `vista_rol`
--

/*!40000 ALTER TABLE `vista_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `vista_rol` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
