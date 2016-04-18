-- MySQL dump 10.13  Distrib 5.6.23, for Win64 (x86_64)
--
-- Host: localhost    Database: scse
-- ------------------------------------------------------
-- Server version	5.6.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (6,33,28);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `area` (
  `area_id` int(11) NOT NULL AUTO_INCREMENT,
  `area` varchar(30) NOT NULL,
  PRIMARY KEY (`area_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (17,'Coordinacion'),(18,'Subdireccion'),(19,'Posgrado'),(20,'Registro Academico');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `beca`
--

DROP TABLE IF EXISTS `beca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `beca` (
  `beca_id` int(11) NOT NULL AUTO_INCREMENT,
  `publicacion_id` int(11) NOT NULL,
  `programa_academico` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  PRIMARY KEY (`beca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beca`
--

LOCK TABLES `beca` WRITE;
/*!40000 ALTER TABLE `beca` DISABLE KEYS */;
INSERT INTO `beca` VALUES (1,79,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','');
/*!40000 ALTER TABLE `beca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cargo`
--

DROP TABLE IF EXISTS `cargo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cargo` (
  `cargo_id` int(11) NOT NULL AUTO_INCREMENT,
  `area_id` int(11) NOT NULL,
  `cargo` varchar(30) NOT NULL,
  PRIMARY KEY (`cargo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cargo`
--

LOCK TABLES `cargo` WRITE;
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` VALUES (25,18,'Subdirector'),(26,17,'Coordinador');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera`
--

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `carrera_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_carrera` varchar(45) NOT NULL,
  PRIMARY KEY (`carrera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
INSERT INTO `carrera` VALUES (1,'IngenierÃ­a civil'),(2,'IngenierÃ­a de sistemas'),(3,'Ingenieria industrial'),(4,'IngenierÃ­a agroindustrial'),(5,'IngenierÃ­a mecÃ¡nica');
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`categoria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'abierta'),(2,'cerrada'),(3,'selecciÃ³n Ãºnica'),(4,'selecciÃ³n mÃºltiple');
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contacto` (
  `contacto_id` int(11) NOT NULL AUTO_INCREMENT,
  `telefono` varchar(10) DEFAULT NULL,
  `celular` varchar(10) DEFAULT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  `municipio_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`contacto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (24,'',NULL,'',6),(25,'','','',1),(26,'','8946-9271','Costado oeste Escuela  Ramiro Sacaza',6),(27,'','8839-8262','Musuli, Palacaguina',90),(28,'','','direccion de jorshua',153),(29,'','','direccion de jorshua',153),(30,'',NULL,'',1),(31,'','','',153),(32,'','','',1),(33,'','','',2);
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curriculum`
--

DROP TABLE IF EXISTS `curriculum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curriculum` (
  `curriculum_id` int(11) NOT NULL AUTO_INCREMENT,
  `egresado_id` int(11) NOT NULL,
  PRIMARY KEY (`curriculum_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curriculum`
--

LOCK TABLES `curriculum` WRITE;
/*!40000 ALTER TABLE `curriculum` DISABLE KEYS */;
INSERT INTO `curriculum` VALUES (3,24);
/*!40000 ALTER TABLE `curriculum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `curso_id` int(11) NOT NULL AUTO_INCREMENT,
  `publicacion_id` int(11) NOT NULL,
  `nombre_curso` varchar(100) NOT NULL,
  `costo` float NOT NULL,
  `duracion` int(11) NOT NULL,
  `libre` tinyint(1) NOT NULL DEFAULT '0',
  `inicio` date DEFAULT NULL,
  PRIMARY KEY (`curso_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,78,'Curso de redes',100,2,1,'2016-01-17');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamento`
--

DROP TABLE IF EXISTS `departamento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departamento` (
  `departamento_id` int(11) NOT NULL AUTO_INCREMENT,
  `departamento` varchar(45) NOT NULL,
  PRIMARY KEY (`departamento_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamento`
--

LOCK TABLES `departamento` WRITE;
/*!40000 ALTER TABLE `departamento` DISABLE KEYS */;
INSERT INTO `departamento` VALUES (1,'Nueva Segovia'),(2,'EstelÃ­'),(3,'Matagalpa'),(4,'Madriz'),(5,'RegiÃ³n autÃ³noma del AtlÃ¡ntico Sur'),(6,'Boaco'),(7,'Carazo'),(8,'Chinandega'),(9,'Chontales'),(10,'Granada'),(11,'Jinotega'),(12,'LeÃ³n'),(13,'Managua'),(14,'Masaya'),(15,'RegiÃ³n AutÃ³noma del AtlÃ¡ntico Norte'),(16,'RÃ­o San Juan'),(17,'Rivas'),(18,'Sin asignar');
/*!40000 ALTER TABLE `departamento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `destino_mensaje`
--

DROP TABLE IF EXISTS `destino_mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `destino_mensaje` (
  `destino_mensaje_id` int(11) NOT NULL AUTO_INCREMENT,
  `mensaje_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `visto` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`destino_mensaje_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `destino_mensaje`
--

LOCK TABLES `destino_mensaje` WRITE;
/*!40000 ALTER TABLE `destino_mensaje` DISABLE KEYS */;
INSERT INTO `destino_mensaje` VALUES (1,1,34,1),(2,2,34,1),(3,3,34,0),(4,3,36,0),(5,4,32,0),(6,5,34,0),(7,5,36,0),(8,5,37,0),(9,6,34,0),(10,7,34,0),(11,7,36,0),(12,8,33,1),(13,9,33,0);
/*!40000 ALTER TABLE `destino_mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `egresado`
--

DROP TABLE IF EXISTS `egresado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `egresado` (
  `egresado_id` int(11) NOT NULL AUTO_INCREMENT,
  `carnet` varchar(10) NOT NULL,
  `cedula` varchar(16) DEFAULT NULL,
  `titulado` tinyint(1) NOT NULL DEFAULT '0',
  `trabaja` tinyint(1) NOT NULL DEFAULT '0',
  `fecha_egresado` int(11) DEFAULT NULL,
  `contacto_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `persona_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`egresado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `egresado`
--

LOCK TABLES `egresado` WRITE;
/*!40000 ALTER TABLE `egresado` DISABLE KEYS */;
/*!40000 ALTER TABLE `egresado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empresa`
--

DROP TABLE IF EXISTS `empresa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `empresa` (
  `empresa_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_empresa` varchar(60) NOT NULL,
  `ruc` varchar(20) DEFAULT NULL,
  `sociedad_id` int(11) DEFAULT NULL,
  `mision` tinytext,
  `vision` tinytext,
  `ocupacion` tinytext,
  `sitio_web` varchar(100) DEFAULT NULL,
  `contacto_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  `autenticada` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`empresa_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empresa`
--

LOCK TABLES `empresa` WRITE;
/*!40000 ALTER TABLE `empresa` DISABLE KEYS */;
/*!40000 ALTER TABLE `empresa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta`
--

DROP TABLE IF EXISTS `encuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta` (
  `encuesta_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `titulo` varchar(200) NOT NULL,
  `objetivo` varchar(100) NOT NULL,
  `descripcion` tinytext,
  PRIMARY KEY (`encuesta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta`
--

LOCK TABLES `encuesta` WRITE;
/*!40000 ALTER TABLE `encuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `encuesta_carrera`
--

DROP TABLE IF EXISTS `encuesta_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `encuesta_carrera` (
  `encuesta_carrera_id` int(11) NOT NULL AUTO_INCREMENT,
  `encuesta_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  PRIMARY KEY (`encuesta_carrera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `encuesta_carrera`
--

LOCK TABLES `encuesta_carrera` WRITE;
/*!40000 ALTER TABLE `encuesta_carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `encuesta_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `experiencia_laboral`
--

DROP TABLE IF EXISTS `experiencia_laboral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `experiencia_laboral` (
  `experiencia_laboral_id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `cargo` varchar(60) DEFAULT NULL,
  `fecha_comienzo` int(11) DEFAULT NULL,
  `fecha_finalizacion` int(11) DEFAULT NULL,
  PRIMARY KEY (`experiencia_laboral_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `experiencia_laboral`
--

LOCK TABLES `experiencia_laboral` WRITE;
/*!40000 ALTER TABLE `experiencia_laboral` DISABLE KEYS */;
INSERT INTO `experiencia_laboral` VALUES (13,3,'Alcaldia de Esteli','Licitador de proyectos',2014,2015);
/*!40000 ALTER TABLE `experiencia_laboral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha`
--

DROP TABLE IF EXISTS `ficha`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha` (
  `ficha_id` int(11) NOT NULL AUTO_INCREMENT,
  `publicacion_id` int(11) NOT NULL,
  `cargo` varchar(100) NOT NULL,
  `ubicacion` varchar(40) DEFAULT NULL,
  `cantidad` varchar(30) DEFAULT NULL,
  `experiencia` varchar(45) DEFAULT NULL,
  `jefe` varchar(45) DEFAULT NULL,
  `a_cargo` mediumtext,
  `finalidad` mediumtext,
  `funciones` mediumtext,
  `requisitos` mediumtext,
  `competencia` mediumtext,
  PRIMARY KEY (`ficha_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha`
--

LOCK TABLES `ficha` WRITE;
/*!40000 ALTER TABLE `ficha` DISABLE KEYS */;
INSERT INTO `ficha` VALUES (1,48,'Programador web','Produccion','3','3','Jorge Andres','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.\r\n','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.<br />\r\n','1. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi,<br />\r\n2. vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti.<br />\r\n3.  accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.<br />\r\n','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.<br />\r\n'),(2,53,'Ingeniero de Software','Informatica','2','2','Jefe de proyectos','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?\r\n','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?'),(3,54,'Prueba de ficha ocupacional','informatica','1','1','Ingeniero de software','Programadores\r\nTesters\r\nDiseÃ±adores\r\nAnalistas','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','1234567890123'),(4,55,'Prueba de ficha ocupacional','informatica','1','2','Ingeniero de software','Programadores\r\nTesters\r\nDiseÃ±adores','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','responsable'),(5,56,'Prueba de ficha ocupacional','informatica','1','2','Ingeniero de software','Programadores\r\nTesters\r\nDiseÃ±adores','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','responsable'),(7,58,'Prueba de ficha ocupacional','informatica','1','2','Ingeniero de software','Programadores\r\nTesters\r\nDiseÃ±adores','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','responsable'),(12,63,'Contador','Contabilidad','1','1','Administracion','Caja','','Recibe y clasifica todos los documentos, debidamente enumerados que le sean asignados (comprobante de ingreso, cheques nulos, cheques pagados, cuentas por cobrar y otros).<br />\r\nExamina y analiza la informaciÃ³n que contienen los documentos que le sean asignados.<br />\r\nCodifica las cuentas de acuerdo a la informaciÃ³n y a los lineamientos establecidos.<br />\r\nPrepara los estados financieros y balances de ganancias y pÃ©rdidas.<br />\r\nContabiliza las nÃ³minas de pagos del personal de la InstituciÃ³n.<br />\r\nRevisa y conforma cheques, Ã³rdenes de compra, solicitudes de pago, entre otros.<br />\r\nPrepara proyecciones, cuadros y anÃ¡lisis sobre los aspectos contables.<br />\r\nDesarrolla sistemas contables necesarios para la InstituciÃ³n.<br />\r\nElabora comprobantes de los movimientos contables.<br />\r\nAnaliza los diversos movimientos de los registros contables.<br />\r\nCorrige los registros contables.<br />\r\nElabora los asientos contables, de acuerdo al manual de procedimientos de la unidad de registro, en la documentaciÃ³n asignada.<br />\r\nVerifica la exactitud de los registros contables en el comprobante de diario procesado con el programa de contabilidad.<br />\r\nRealiza recapitulaciÃ³n o chequeo de la historia de las personas naturales o jurÃ­dicas con cheques nulos.<br />\r\nChequea los cÃ³digos de las cuentas, contrastÃ¡ndolos con los que recibe de la Unidad de Presupuesto.<br />\r\nEmite cheques correspondientes a pagos de proveedores y servicios de personal, etc.<br />\r\nLleva el control de cuentas por pagar.<br />\r\nLleva el control bancario de los ingresos de la InstituciÃ³n que entran por caja.<br />\r\nRealiza transferencias bancarias.<br />\r\nElabora Ã³rdenes de pago para la reposiciÃ³n de caja chica de las dependencias.<br />\r\nTranscribe y accesa informaciÃ³n operando el microcomputador.<br />\r\nCumple con las normas y procedimientos en materia de seguridad integral, establecidos por la organizaciÃ³n.<br />\r\nMantiene en orden equipo y sitio de trabajo reportando cualquier anomalÃ­a.<br />\r\nElabora informes periÃ³dicos de las actividades realizadas.<br />\r\nRealiza cualquier otra tarea afÃ­n que le sea asignada.','',''),(13,71,'Ingeniero de Software','Sistemas','1','3','Jefe de Sistemas','Programadores de Software','Supervisar y llevar el control del proyecto','gestionar los distintas etapas del desarrollo del software<br />\r\n','Ingeniero de software','Responsable<br />\r\nAlta Capacidad de Analisis'),(14,75,'Jefe de proyecto','Administracion','1','1','Gerente','Analistas Funcionales\r\nAnalistas de aplicaciones\r\nProgramadores','Ejecutar los proyectos informÃ¡ticos asignados por el Director de Proyecto, dirigiendo y coordinando el proyecto de desarrollo y mantenimiento de aplicaciones, supervisando las funciones y recursos de anÃ¡lisis funcional, orgÃ¡nico y programaciÃ³n, asegurando la adecuada explotaciÃ³n de las aplicaciones.','Control y seguimiento de plazos, indicadores econÃ³micos y de calidad.<br />\r\nSupervisar y coordinar el desarrollo completo de aplicaciones y administrar la introducciÃ³n de los sistemas de gestiÃ³n.<br />\r\nControlar las aplicaciones en explotaciÃ³n, minimizando las consecuencias.<br />\r\nAnalizar y recoger nuevas tÃ©cnicas y herramientas del mercado estudiando su viabilidad y necesidad. Posibilidad de contratar recursos externos.<br />\r\nControl y GestiÃ³n del Desarrollo del Proyecto InformÃ¡tico.','Capaz de dominar todas las etapas de la vida de un proyecto (anÃ¡lisis de concepciÃ³n, anÃ¡lisis tÃ©cnico, programaciÃ³n, pruebas, documentaciÃ³n y formaciÃ³n de usuarios).',''),(15,76,'TÃ©cnico de redes','Area de redes','1','2 aÃ±os','Jefe de redes','','Dirigir, planificar y coordinar la gestiÃ³n de la infraestructura de redes y comunicaciones','â€¢ GestiÃ³n de grandes redes corporativas y/o operadores de telecomunicaciones, redes de acceso, redes de transmisiÃ³n de voz, datos, imÃ¡genes, conmutaciÃ³n, gestiÃ³n de trÃ¡fico, asÃ­ como de todos los aspectos de las redes WAN y las estrategias ligadas a Internet<br />\r\nâ€¢ Poner en marcha las redes tanto a nivel material como logÃ­stico.<br />\r\nâ€¢ Desarrollar y mantener dichas redes. ElecciÃ³n de los elementos HW y SW para la optimizaciÃ³n de los servicios de redes de comunicaciones.<br />\r\nâ€¢ Gestionar las relaciones con los proveedores y negociar los contratos.<br />\r\nâ€¢ Seguimiento de los presupuestos, los costes y las inversiones.<br />\r\nâ€¢ Mantenimiento y evoluciÃ³n de los sistemas de gestiÃ³n de las Telecomunicaciones.<br />\r\nâ€¢ Enmarcar los participantes internos y externos en los proyectos de Telecomunicaciones.<br />\r\nâ€¢ Escoger y gestionar los contratos con los operadores.','Gerente de la fiabilidad, de la coherencia y de la evoluciÃ³n de la arquitectura de la Red y de las Telecomunicaciones utilizadas por los Sistemas InformÃ¡ticos de la Empresa.',''),(16,77,'Director de Obras Municipales','DirecciÃ³n de Obras Municipales','1','5 aÃ±os','Alcalde','Responsable de Obras\r\nSupervisor de Proyectos y Secretaria','Garantizar la ejecuciÃ³n de los proyectos de inversiones<br />\r\nurbanos y rurales, de acuerdo a una planificaciÃ³n y orientaciones<br />\r\nsuperiores.','Planifica, organiza, dirige y controla las actividades realizadas en las diferentes<br />\r\nÃ¡reas bajo su responsabilidad.<br />\r\nElabora plan anual de inversiones en consideraciÃ³n a los fondos propios disponibles<br />\r\ny a recursos de cooperaciÃ³n externa y transferencias.<br />\r\nCoordina con las fuentes de financiamiento los proyectos a realizar.<br />\r\nSupervisa la ejecuciÃ³n de los planes de trabajo de Ã¡reas y proyectos bajo su<br />\r\nresponsabilidad.<br />\r\nDa seguimiento, controla y supervisa los proyectos en ejecuciÃ³n.<br />\r\nSupervisa el proceso de formulaciÃ³n, diseÃ±o y ejecuciÃ³n de proyectos.<br />\r\nMantiene estrecha coordinaciÃ³n con instancias homÃ³logas.<br />\r\nDa seguimiento y control al plan de explotaciÃ³n de los equipos pesados.<br />\r\nEstablece coordinaciÃ³n con la direcciÃ³n de finanzas de la AlcaldÃ­a para definir<br />\r\nla disposiciÃ³n de fondos para ejecuciÃ³n de proyectos.<br />\r\nRealiza avalÃºos de obras para garantizar la adecuada contrataciÃ³n de los diferentes<br />\r\nproyectos a ejecutarse.','Nivel acadÃ©mico: Ingeniero Civil<br />\r\nOtros estudios: AdministraciÃ³n de Proyectos<br />\r\nExperiencia laboral: Cinco aÃ±os en cargos similares',''),(17,80,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','1','1','EEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
/*!40000 ALTER TABLE `ficha` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ficha_solicitante`
--

DROP TABLE IF EXISTS `ficha_solicitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ficha_solicitante` (
  `ficha_solicitante_id` int(11) NOT NULL AUTO_INCREMENT,
  `ficha_id` int(11) NOT NULL,
  `usuario_id` int(11) NOT NULL,
  PRIMARY KEY (`ficha_solicitante_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ficha_solicitante`
--

LOCK TABLES `ficha_solicitante` WRITE;
/*!40000 ALTER TABLE `ficha_solicitante` DISABLE KEYS */;
/*!40000 ALTER TABLE `ficha_solicitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacion_academica`
--

DROP TABLE IF EXISTS `formacion_academica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formacion_academica` (
  `formacion_academica_id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL,
  `fecha_comienzo` int(11) NOT NULL,
  `fecha_finalizacion` int(11) NOT NULL,
  `titulo_id` int(11) NOT NULL,
  PRIMARY KEY (`formacion_academica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion_academica`
--

LOCK TABLES `formacion_academica` WRITE;
/*!40000 ALTER TABLE `formacion_academica` DISABLE KEYS */;
INSERT INTO `formacion_academica` VALUES (3,3,2009,2014,2);
/*!40000 ALTER TABLE `formacion_academica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formacion_complementaria`
--

DROP TABLE IF EXISTS `formacion_complementaria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `formacion_complementaria` (
  `formacion_complementaria_id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL,
  `curso` varchar(45) NOT NULL,
  `fecha_comienzo` int(11) NOT NULL,
  `fecha_finalizacion` int(11) NOT NULL,
  PRIMARY KEY (`formacion_complementaria_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formacion_complementaria`
--

LOCK TABLES `formacion_complementaria` WRITE;
/*!40000 ALTER TABLE `formacion_complementaria` DISABLE KEYS */;
INSERT INTO `formacion_complementaria` VALUES (3,3,'Topologia',2012,2013);
/*!40000 ALTER TABLE `formacion_complementaria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `idioma`
--

DROP TABLE IF EXISTS `idioma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `idioma` (
  `idioma_id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL,
  `idioma` varchar(10) DEFAULT NULL,
  `nivel` enum('basico','medio','alto') DEFAULT NULL,
  PRIMARY KEY (`idioma_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `idioma`
--

LOCK TABLES `idioma` WRITE;
/*!40000 ALTER TABLE `idioma` DISABLE KEYS */;
INSERT INTO `idioma` VALUES (2,3,'Ingles','basico');
/*!40000 ALTER TABLE `idioma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imagen_publicacion`
--

DROP TABLE IF EXISTS `imagen_publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `imagen_publicacion` (
  `imagen_publicacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `imagen` mediumblob,
  `tipo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`imagen_publicacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imagen_publicacion`
--

LOCK TABLES `imagen_publicacion` WRITE;
/*!40000 ALTER TABLE `imagen_publicacion` DISABLE KEYS */;
INSERT INTO `imagen_publicacion` VALUES (82,NULL,NULL),(83,NULL,NULL),(84,'ÿØÿà\0JFIF\0\0`\0`\0\0ÿÛ\0C\0\n\r	\n\n\r\r\Z\Z\ZÿÛ\0C\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\ZÿÀ\0*´\"\0ÿÄ\0\0\0\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0\0}\0!1AQa\"q2‘¡#B±ÁRÑğ$3br‚	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyzƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚáâãäåæçèéêñòóôõö÷øùúÿÄ\0\0\0\0\0\0\0\0	\nÿÄ\0µ\0\0w\0!1AQaq\"2B‘¡±Á	#3RğbrÑ\n$4á%ñ\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz‚ƒ„…†‡ˆ‰Š’“”•–—˜™š¢£¤¥¦§¨©ª²³´µ¶·¸¹ºÂÃÄÅÆÇÈÉÊÒÓÔÕÖ×ØÙÚâãäåæçèéêòóôõö÷øùúÿÚ\0\0\0?\0øŠ^*÷ö5ßüòoÊè÷cşX·å@şZCÕoû*ïşx·åIı™t>ô-ùP<ÑVŸp?å‹~TÓep?å‹~T^—&¥û$ÿ\0óÉÿ\0*_±Ïÿ\0<›ò €4»MIöIÇü²Ê“ìÓÿ\0Ï6ü¨ª˜<Ô‡m\'‘?üóoÊ“ìóÏ6ü¨r)2(ò&òÍ¿*2÷¨\0=)Fh	\"uŒşT|ÿ\0óÌşT\0ášPM3sÿ\0Ï3ùQ¹ÿ\0¸*\0“¢šCü“l¿Ü4\0ü\nô¨öÉıÓNE“<© æ—$SŠ·÷i¤7÷M\0(cLù¿ºiCr¦€XÓw\Z]Çû´…÷h\0ÜiéŠqşíH¡¿»@f€phÁşé¥Î;P¨Ù4ñíUüÌğ=Xú\Z\0´Š“náU”“Vˆ€.Ø^5¤À™¯JĞ|@<µW5æ°F¯‚z×A¦ÂÛ†Ó@µkuÈŠĞDPAÇéĞšêm‹6(rİ¾QWaåª•°ùE_·_š€,:ğ)ğ¦4â8©x Arâ´4äıĞ¨obËUı><&(UNi	5dGFÊ\0ª#õ¥úU‘/—@‚zÓÀÅO³ŠnÊ\0E§†¦ã`ĞŠÜÕ¸Z¨Œæ­Bp(æsE05=FhhÅY^•]YAÅ\0(©V™Š•E\0MX^:°(ËR¨ÍDµb!š\0*UëJ8\n\0péN\n‘FE\04S¶æ—mJ‰ë@ı*xş^´à\0§ÏJ\0nrx¦Ër\"^MUººX3ƒÍeMv÷Dªgš\0¹6ª!j›ÜÍ9ÂÍXÓôvî–·-ôØâÁÅ\0a[i’Ìrâµ¡ÒbŒ\rÀf´°a(„ÉÖ€ XvŒ/JpˆÕ‘ÑŠ~Ê\0¬\"¥òI«A)Áh · Ûæ®€)áA —´5V}.”ïĞÁ¤òÀP¨x\Z ~Q\\­ÿ\0Ã‘Z5ı+ØÈ ãã\nÈ>e€>u»ğİİ£ˆØÔÈe½µ8*ÜW¾Üéògr}«óÂPÈ	TûP—Áâ{ˆ05¯iâ±!CZWşIEı+\noÏ;ĞOm­Û\\aI«£ìóñ‘Ípk¤]Z¾ì6*Ò^OnyÍ\0uwµºRN+\nïÁñ©& )öúÔÍ“Zê‡s@üz<¶¼bQáê\rt-}Çµ/Ùb¸¹ kí¡N\Z§ö9ëZòø}‘P7†°ÓÍ\0@%>SNUcŞª¶‰y¤âkyŞĞ‚®:Ô¨ËÛ­PK‡ıbš™nã~phò€O5.Äªhç¹©Õ‡­\0<ázP¼ÓŠ”\0òqHNh1©V:\0‡fjUZ”GJT( \\A|T-&ÚÌÉ 	Œ•6êiÓ‚ç­\0Cåæœ#©Âb\0E³ŠCjn)ê Ğ#=©†Û ŠÓæ¤òí@Mc×šlí]¶ö©¨=E\0s?caÚ³7a]9³_ALû\"/j\0æ~Îã¨4ˆë]#Z©è*´–º\n\0È¢¤] UÆÓœôÃ§8õ AñíN6n½©\n2ö ‘@vÍ&â:Švñ@š\0j ÀÓÆ{PƒÒ—uGÈ¢€$ÎhÅ §”\0ª)ø¦­KŒŠ\0‡mH«JjE\0Ğ¼Ó‚ÓÀÉ§… vÒl5cfhT 6S‚â¦ÛFÊ\0‹Ò[§j›eH#s@	\'\rQË Û\\›ÕÓ	Ïõ‰èoØMàb²¯>i—\0íUçÚ»‘^[¥XB‡  \Z½ø+m&ã\nÊ¹«ï‚×\nO’Ÿ¥}æè ˜ª?*\0ù7PøQªZ¶6ÇÒ¹ë¿jvY-ñí_iIWëQ*©7‡´Û¡‰bSŸj\0ø’K[»s‰cÊ¢,Gß¿*û&óá¶v\"\\Ÿjç®ş\riòçËE…\0|²&EşKçƒĞWĞß‹yKúW3ğFù3äƒ@J$cĞÓÄ‡øÏØŞü)Õ­	Â9ü+\ZãÁZ¾wÂäj\0ÉŸÃNéR¾…{XòªÏÄ\'\r~T\0ÿ\00Ó”î9¨Ì:Äß•yşétšŒ²gŠ‰fS÷©ÙFèE\0J¬{PW%³òš“$Pá8\Z¬$ Ó„´`ã‚¢2ñ@’€&§nÅE¾—9 	7QQÑ@ùğ>™ÿ\0<Wò¦7tßùâ¿•vUU\0pÇÀzwhò£şşšıa_Ê»¯(R4^œPßôßùâ¿•Dß´Óÿ\0,Wò®ÿ\0Ê4]\0yéøq¦Ÿùb¿•B~Ø“‘ÇÒ½ÇŠ6\Z\0óVøecÿ\0<‡åQ·Ã/ùä?*ôí†šS4æ?ğ¬lÏü²•1¾Ùÿ\0Ï1ùW¨˜é¾Qõ +…ö£•@ßí¿ç˜ü«ÖŒTP \"o…–Íÿ\0,ÇåLÿ\0…Wmÿ\0<Çå^Â!ÍgãÇá]¶?ÕÊ“ş]·üó•{€S|Š\0ñÃğ¦,ğœ})§áLgø?Jö]¸íMÛ@5ÿ\0\nª?îÊ˜ÿ\0\nĞô¯g1ƒIåôâgájÿ\0sô¨Ûárÿ\0sô¯o1/¥1 µ\0xqø^¹ûŸ¥FßxOÒ½ÄÚ¯¥FÖêJ\0ñğÀsô¦ÿ\0Â°ÿ\0cô¯pû2úQödô ÿ\0…b?¹úSÃ\\¹^Øm—Ò—ìÊ{P‡Ÿ†ÄôJ‚_†Ïô¯w‰ÜR›8ÛøE\0|õ7ÃÙ ¶\ZÌ¸ğ«Ä>å}s¥Fè~Q\\¾©¡¦€<9tj_ì&şíz,úbÄÜ-F-ñ¶€<øi2Ærâµ,VHHÈ5×$Æ\nÔGLRr€§ê»-7P‰dŒ×ÚyC•â¤…å·a‚p(Ñ ¹¡â´­¦Ë\ná¬õc…·ìµ!Á&€:ÍÙ§N•“o|%ÀÍi¤ƒ€t¢®X¯ËU¥ùÅX²“m\0hùi*r˜LŠŒ! “@\r–—n)â<Ğ6Ò©Jb”G@l£eY\n<¼\Z\0­²§ivf¤UÅ\0(©R˜£f:°µ^>•:¾(@*P8¨•³R©Ï$u`T\n6ÔëÍ\09jx*2\n\0œ\ZzÔ\"¦J\0”\n‘GŠ™ğ¸4\0õ^)øÅ,c\"’y1É —ÉéY—ú‡—Äf™u¨dNµ^ÚÅ®[/Ş€\"‰%½qœâ·lt…‹Â­Yéén W7v\0¡\0\\\'Ÿ04ø×Ş¦P;Š\0laHäSØ`|´»3ÓŠz®4\Z®G4ı´ğ´à¾´\0À´í¹§J(=†œ¢¤Ô‹\0D”ÅŸj°#ƒÏ\\[÷4»\0« `bƒê\0ªaiJcdGŠ_(PlÔUyt¸Ü}ÑùV¶ÌSJæ€9‹¿G\"ğ¢°.ü$½“Dµ\0y\rÇ‡ä¶\'j\Z¦Ö³\n‘^Ã&Ÿƒ¹3Y·\Z$NNÂ€<Î+wN¼UÈäxû×SwáòäZÌŸI‘	ùhŠß8êjÂ_1ïUd²u<Š”<õ \rt»ÅVkwûàV:³0TÉ\Z\0ÒkKá^m\"33KN:\ZµÈ‡“Å\0cM£Ë;rj“ZÜF~é®¹gÄ3Ry°‘ó  J%}ô5/–IÎ1]>ÛVê\0¨ÊÚNU€ $ëS«\nÓ:\\m÷X\Z‰ô–Q•æ€)î’f§’Òd\nj“Ã0\'*h794ˆ0h!ÇU§.{Ğ«R*\0ûiÂLĞôÂ(=)Ù>”\0jTZtqn\\ÔŠ„v 	8©•9¢$cÚ¬ˆğ((”¤\Z@§4\0Ò3J±—8©U\rJ‹·µ\0@-½jA\0‘Sæ”ó@üµ©­Õ`¦iD9 \nOl­Ú m=[µjy4y4ŒúXÛÅU:i«£ò©\0ö a¬Ù{TMÕÔ5¨=ª°SÚ€9ÕSüTì}+n]00ùE@t¶š8¥®=ƒ/jˆÚ8í@©©E4@ËO\nGj\0*P8¨€\"ô4\0õ©TqQ-J§€):QºŒç¥\0/Z1@õ\0Ğ¹¤Î*\\\n`ô \0)4 RíAZ\0@‡=*DE =©@Å\0)j‚zR€=(Ç¥\0I€ÃŠL…¦€}iÁ}hT”ö§™$ìj5ÀíN<ĞÅÓt5 ™X|À~U\\`v§=(òCi0ıäj\n©6¥L>xş0ü€:PD¾Ñ®>Î£ğ¬{Ï…šMÈ;\"QøW_»ÓŠPî?Š€<ÂçàÅ“R1ùV¡ğ,LI€m¯p8êi|Önôó.£ğ>î,˜òk•½øYªY“¶78ö¯±>Vûã4mg ıä şñŞÕ-ÉÍ»œ{U\'Ó58kwãÚ¾Ş—DÓ%6ËÏµfÍà*rH·AŸj\0ø±íî£?<$~Ñ#\'ŞLW×·¿\ntë°vÆ£>ÕÍ_|µ”˜óO­ÇJip:\Z÷Û¿€Ë´ùGšç/¾\n]@Å&€<N=jT˜õÙ]ü,Ô \'d,\nÆ¸ğF­mŸôwü¨\'Í´U¯øFuùöÊŠ\0÷=††­y~Ôy~ÔWa %Zòı¨1â€+l¤1Õ”l \nÛ)<º³²“e\0W)MòêÎÊM”_Ë£Ë«(Û@Œb“Ë«%i6Ğ}˜Rl«Ai\nPFJnÊ¶RšR€+©¦1VŠÓYh©JnÚ—4Ò¼P%i¥j]´Ò´ZO/w5&ÚQÅ\0WhñLÛVÊæ£hñ@l§ìE\0š\0]”¡)Ãš•G­\0Cåç­eêÀ©â¶Ùxâ¨]¡*s@5õ œVg’šé5ùn+E!\0@c§ˆ–“iÍ<)\0Æ€\ZíÏpf—m\0fˆLg\"¤[¶ˆõ«nªEQš.hsNÔFMtÖº€`9¯<Šc	­;L—Á4èÑJ$^µbÜáÁÉ[êÛxÍkZjŠÄdĞi‚œÒ°ª…”âU5 \0EjU^)¸æ§A@í£mLV“m\03„TÛi\nĞAhÅJ”\0Š*eLŠj§5i€\Z«GJ”)›y 	æ¬ ¨#Z¶ƒ@5*ÔcŠ•E\0J¢¤ZbÓÖ€$QSÆ*%©Ñht§Å0p*U#ĞØ¼Ö.£vÅˆSV5¿,\rgÚ©º“&€ÆÙç”WMŸ•ŒRYÚ¤HjîìĞ‡LR…É¡Fj^”\0*â59©\0 œ\0SÀ ”ÒOU J¥N	@*óS§*Ts@ÛN4ı´åZ\0Œ-.Ú—m öÒíÍKŠ1@m£eO¶´¦O5\'”¢Ÿ³)0M\00Ä¸¨Í¸=ª}¦€(=°ôÍ@úrIÕEl\0 sQ²ƒÒ€9Û7\n+\ZçÃ%€é]ß”j\'‡<@xt“ÆŞ”ÓhÉÚ»÷ÓÑ¹ÀÍS›JSĞP\ZŞ¢n1[³é8ÎS“Ndä\n\0Ê“+ĞUI¤ğ ×Aï¼*äZTGï@4‹rßw5Y’ıË»ék¥ÛÂ›-Œ*8Q@½Åôdn\r[Vº„€8VÌQ&p¢².by2#¨š…«¬ÅM¾ÂnÜšä%Ò¯$l¦qN‹L¼ˆä– »û&Öq”ÅVŸÃÊ(*…œ·05µ¤ØÅ\0`\\èRº*‹isÇü&»EÔ\"?x\n”Mm/P(ƒÊ‡¦§AÇÌ+µkY‡ÍW}7?&(˜\\öU¸qÜV³èş_\0T\r§º\05\0ÇJl€õãÆ:\Z‚Iˆ Ğº úTQœjôJ§­\01xê)ìAT…\"Ğ@f¤Rl¥€\Z©OÙKOQ‘@ì£eM²œ€+„§ùU6ÊvÚ\0ªb¤òjŞ=¨Û@DxëAAéV¼­Ôy€)Tö¦eô«æ\Z<ª\0ÉkNqQµ—µml¦˜³Ú€0ZÏª6µ>•Ğ|ö¦Q”€a\"›´+mí=ª»ÙŸJ\0Ê ÓíëWşÆ})f{\n\0¬\Zx9§ı•‡j_,­\04)5(P38§dĞÆ(4Ìšxæ€u§Ğ4ê\0(¥–€\nQIJ(ã¥8SGJp QJ\0”ô£Å\06”PiqŠ\0)ÀÑ¶”\n\03FhÅ 4Ã¡£üŠ\0A+ææêM7ni6‘@)ÚsÖœZ6?:øT iûwu 	<»64*\n§q¤ØLú:~U1Lw¤m ßøG¬yÿ\0FOÊŠÔóè \"ÛFÚ«öå _­\0ZÛI³5[ûA)Eúš\0±å\nCCöå£í«@ùBƒ¨¾Ú´Ót	àĞ¾X4†:‹í^ô}¤ô!ŠnÊgÚG­i\0â”›)>Ò)>Ğ(ÛqHE1®›ö• ‘MÅ0Ü­\'ÚV€¶¦i¿i}¤PùBšÑqKö‘Hnšc©Âšf“Ë§y¢J1@\r+I³=i\ZQQ´Ô\'“šŒÃ@2€£Šg™Fú\0“>µ^à¦¤ßŠ­;Îê@ñ\\ü n5Ô^@ÒgŠÃÂBI\0Ğ\r‚àTÿ\0b”ºiÂÊLr¦€*ä\n7U†µu©¨YJŸ»@2µ®jÖ\r5“#Š\0Í’,æ R`læ´$»UY-ÛŠ\0Ô³c\"ƒš³ö–¸5‡Ë\03ŠÖ@gNG4ØhZÆp×o¢hƒ^;ÉfAç®×@×ƒÆÚ€;Ö¬F8ª°È³ *jÄ-´ó@‘HJØeÊÓS¯4\0˜¤\"¦8ô¨Û”\0ˆ9§ì¦¨©\0 T©Å\n*P‚€y¡iÀSÕhQ*uSTTƒ¥\0\n*U¨Ö¦Q@(§Šh§  	S­YAU^*äChâ ¹›ËNµ3œVEü»¸€(Ìís&:Öî“cµA\"¨i¶Á›,3]$+å€&Ò¸¤EÍçåâ€)sJ;\0±Š”TkíS( ZxÎ•\"ŒĞ…=E\"¯5`/\0Š)àfT¨(\0¸¦Ğ±@ ÔŠ ĞqE<Šâ€\nAÍH8%\0ENÅJ4»()WµK³4¢:\0nÑHp*]”yy v†(\0ô©Äx¥òÇ¥\0F\0=ª6ˆ“ÅZúR…Å\0TòMFĞŸJÑÚ\r¥\0dµ¶î¢¢{G\"¶üµô¦4`Œb€0\ZÃû¢«½¤‹Òº‹F\"ÏQ@éEê\rDå€ÁÒ5ª÷Zm<:ğ(–•CE68v­™4³¸ñUå°d( @àR˜AÀ¨|™äÔÛ¡ ›d\'¥E%˜=[Võ«•î(	¬[=*3g\"Ÿ—5ÔŒ»H-Ğö iEÄG©«1ßËæ¶ÍHª²ØĞPqêˆGï:Õˆî “®+6]1‰ÊŠ¬\'O»š\0Ş6ğL8\"ªÍ¤Dı1Y¨·1ã$Õ”¹™9c@Ú)N•Z¼]hGªöz·õ¼œ0‚UÇcOLµ¼a·Ÿî‘PË¤äeh(6iàf¬¶šéØÔFÙ×± m©cŠo–Ô¡H<š\0S±H)À@\n.Úx\0is@œ¤\\zS¸ q”`ÔÜzRàPI¥òÍOÅ€+˜è	Õd(<ĞT\n\0¯·Ú¯µO¶´_fi\0ö«;ivĞ3n=)Hô«ÛhòÁ ç€zUw¶ÏjØ1ŠaˆzPYçµ\'Ùöõ·å\na€Ô†Ñãµ3•¸Ö«éPµ˜ÏJ\0Ëê¾ö˜\nƒìçÒ€!£©L&™ä·¥\0! Q´´ c­\08t§\n`4ğÂ€(¦ƒRP\n\\fœhÒã4¸ P\0)qJ=@Å\0GŠ1Rí…q@â€•&)q@(ÎjM´m Êç¥ ÍHF  …\'­#\"µ È Œõ p”T¾X¢€<4ÙœSM™­ß\"šm½¨Ú\Z>Êİ«lÚ“Ú•möõ‡öW£ì¯[¾@ô£È”…öW¥òVç=)¿gö o!¨ò\Z¶~ÏíGÙı¨Èj<–­¡míKöaé@KQäµmı˜zQöaé@/g½3ìîk 6£Ò“ì£Ò€9ónãÖ“ìÏ]µ”Ÿe”ä5CVÙ¶ç¥fö O!©D\r[_fö¤6ŞÔäµgjÙû7µgÇj\0Æû;PmÍlùÔÖƒ”ŠÖÇÒ£kR{V÷Ùı©\r·µ\0`ı˜Š<£[fÛÚ™öoj\0ÇòQ­³{Qöoj\0ÈXI<ÓÍ¸=«LÚûQöZ\0É6\nİE4éQÕ±öcKä\Z\0ÆşÈˆuQ@Òb?Â+oÈÈæAÍ\0aË¢DÃ…w¡(B×p\"æ –ÑX(Ë®4ÖŒ*Ÿ‘´ó^‡}¦	¹‹»Œp(ÈTml3È­#^Ôß³— \nbÁ6ç-´kŒÕ(6ÍÔP‰,’å0*”VÒØË•Î*ı³4dfµ>Î³Å’9Å\0YÒ5‚0®k©‚áe\0ƒ\\\nÚ</¹{V½ ÑaXĞf’db¥E¬‹;Á 5«À@‘Å36AÖ_J\0jŠxŠ*P(Ê*UÕ0PqÎ)áhÅ=E\0=VŸŒP£ \0Å_J5¤U©‘h\0OU§§¢æ€š´£jÔj¸5#\n\0­<»sXç3Mz³{.	¤Ó¡ó$µ§Û@H«çƒMv ¥š\0™FjE¤iàP–ŸŠqNÅ\0 :\nˆ\n(\0ÍJ‹HL‹@juSsS¨â€\Z5 \\\nLTƒ¥\02Œf— P\0J£ŠEZ”\n\0a¡sNÅ9V€-HŠr­;m\00-;m.Ú]´\0Š¼Ô›4/4î”\0»EE-(â€\ZW´â3FÚ\0@´»iBÒí §§í§m Jâ“o59ZiZ\0€ÇšU.)Ê(»D)P\'aÎ:Ócœät \nÒÃ´tª¾H~¢¶]QW28õ¬«­gL±É¸™ôRk4ôªo§¡j¿øj\0L—hÿ\0j°§ø¿á”%RéN=èm¬O@ÓøkºøË¡Œˆæª‹Úl§àĞ~®İÖ¥BOµpqüI±›£\nÒ´ñÆŸ)¤€:ğ3Ş±ƒXø‡OŸ%>õ£\rärÿ\0ªlĞß)zJaB:TbN9ëG™ï@Ëj§ ª2XŸJÖSº¦«{Ğ35]¢³ä´™OË+¶‰ŞÙGè(‹îb=êı®©4G÷¹ÅoIaè¢ªÍ¦¡1@.ª~aS¬ĞÍÜVdúqQòU&Šâ#Æq@Ùc~„SKÏ Ö\"^ÜGÁÍ]‹W.43Z²c4SzTĞêQ¹ıå^x$b€2LL:Òğ+\\Û,Ÿwé¾”\nzÕ+Ø2)K%\0.ÑNU£ù©Uˆ 	¼ºi‹4«&iàñ@K¶œ9§@í¥	RK¶€\"ÙFÊ›mh”l©¶Ğ€!ÙM1Õ´l \n†*x„b¬l¥Å\0Vò©¦!VŠÔEM\0@Ğ‚*#n*ŞÓK¶€3ÚÜS´dÓL&€3ZÓ=ª3h}+XGÔÖÚ€1ÚÛ©†ZÍµFa\'µ\0e+J+DÛ{Tmjq@U<)ÿ\0g#µ#Š\0nêZO,ŠpC@	OA‘K¶”\0¸£m\0Ó…\07mj@)1@ÛFÚ}^)6Ô¸£m\03m©1K¶€\"Úh©¶Š(Ë|£éG”}*èÚ—Ë \n>_µ!ˆUãµ\'‘º€)y\"$Uß\'ÚšcÅ\0TòE\'“VÊS6š\0¯äÑäÕœRâ€*ù4¾UX#ŠLPUUOŠ1@Z,Ryuofhòè™“Ë«¾]\'•í@L\\ÒyUxÅíMò¨Ÿ—J#ê×•íHbÀ \nÆ5¦˜ÅX)I³XÅšiŠ­í¤òó@D~´¦1V|¿j<¿j\0¦ÑñQù-éZ_µ/—í@ŞSÔ›ëZ-µDÑĞ\"¸íIøU¯+4Æ‡Ú€!È `Ô†*A(…A4«\ZÓŠsN	Í\07Êƒ\0ÅL©OÛ@0dŠç¯­G<W_<|\ZÃ½‡9â€9 \0*;V­Ì8\'Š¢ÉƒÅ\0@bç¡O¥M¶œ\0GcøªÜííQm¡FÖÍ\0ky+\"p+6{WF$\n¹ms\r^òÄ«@v·/ÖıµúœdÖ<Ö»N@¦FLf€;H.ÇZ³Ôq\\­­öÌkrÚôH:Ğõâ¤\\T;ÁSĞæ€,¨©@ÅD†¥4\0ì\ZrûÒ»Bhe”ğ)T€r(\0QëS ÏJfÚÅ\08!©\"Sš~)ÑŒPN¤—;sÚëÍGpÛb4…zÙ|\nÔÑá*7JËeó&ük£²M°¯}ğ@Å€)¥=Wš\0r+u©Ö‘zS€ ­?š¢¤\0Š¦§E¦ 52Š\0r©©c­5E>€5:*0=iÃŠ\0x§ö¦Šp ”)§-N£Ú€¨jM§½=x¥#=(=´õœ=V€Z“m .0(=´à¾”RƒŠ\0B¸˜§ç4m í¥ONÛ@\rUãšP)ÁivĞm¥ÛN”y lç¬6}êYQ€Ü”‰™A/Ú€Ë%r:SÏJ<Çİ±Gü ;Ç­\0F\'•‚Æ2ìÔ×â‰ZO†ÄóÆ\\Zù÷Ç?´xa$zKînÛM\0}/ªx«KÒ”›É£\0µ^eâÚBÒ·Ek*³85ò£ë¾2øƒtc¶ˆÜğFk½ğÇìÛ¬ê…\'ÕÚR[“š\0±â_ÚUÔdhôa#gŠäPøâ¹Å¸ÇĞ×Ô^\rıô}*4{ØÕœzŠõ+	é:B…´‚>?Ù ŒôŸ‚ş+ÕŠ›é\'PİsšîtßÙ¢fÚ×3É“×&¾­‰â…p± ü(k€s…ğ ±ıš´ÕPg˜çÜÖÄ³ŞoŞşµëìäÔL	 5‹à“âJ{ü Ó.NkĞözr¥\0ytŸ\rÅ¡ÌN*Ht[û.#q^Ÿ³•F?º?*\0á#K šjÌ{ÇŞ®¢[!!ÎU“Mô–Š™_Ò¤{SÀ¨L.§ P€xëN=MUÇZz1hĞ\0Ò˜j4j™dÛÖ€\Z,Pö¨äÓŒmu%SSnS@2iJ„Ui4¥âºG£0‡ BãNÛ÷xª³Àr„×lú~şÕ]ô¬ö V=Væ\"7Š¿¼8ßZh»‡J¥&€9À Ğêöò›dIÃå\"¹Ù4y#?.j-—t&€:f¶B>\\TmdHâ°RûÌÕû(Ç™@şÊËN‘Ö³o(Ç«q”Ÿ•a@äa©Eh5²„Q5‹Ÿ»@ÀÅ;4­k\"õ˜U“­\0;»M*0ô¥cé@\rÚhÎŞ´.sÍHÈ\Z€iÛsJ-(ö íÅ§àÓNh¼Rí»sÖœ\0Â£SDu6ÑFÚ\0ˆ(¥Ú´í”l ÙéMò…M²—m\0W0ŒRyÒ¬í£m\0S0óÒ#Ú­ãÚ“I­ÁíQµ· «åhÏJ\0Ì6§Ò£kfô­rÔÆOj\0Ç00¨Ì[?jO+=¨ÊaÖœkM ö¨^ÛÚ€)n¸TÆÔúTF;Pn£šO,Òa…\0?€¦š¬sÍ<5\0.Ò(ÛKºš\0nÚ)Ù¢€<ø\n]´àµ\"¥\0C¶.*Ï—MhèSJf¬ytlÅ\0V1Ôf<\Z»¶šÉÅ\0QÛŠ6Õ†JhZ\0„§İ•kfE&Ê\0­²•ge(\\SñO+J€#ÛK²¥	O	@ŠRl«;)\nPR”…2*ÖÊB˜ \nF:M•l­FÂ€+l¤ÛSâšFh-´m©vÑ¶€\"ÛK¶¤ÛFÚ\0‹m1’¬ì¤)@BŒÒ2U‚˜¤š\0¨R˜R®˜é\0UÙšPœÔÅvšP( ´í¼SÀÅ) \n’\rdŞ æ¶e^\re]´ÍŞGÉÅf:ó[WkÉ¬ÉX-8-Hœ€#HÉ‘S…¥Û@†cjÔµ¼\0`š©,YUe@ Û*ÕImúâ ¶»Æ5¦„8ÈÈÜUÛK¢„sSMnªL›\r\0tv×ÀÉ«ğÊzäá¸1MiÛ^gĞH’f¬!±#ºéWáŸ4¨ËBœš‰[rÓó@c©\0æ¡‰¸©æ€\'UäU„Z‚1š´” õZbÔê2(…j•ñÄf´q“Tuù\r\0eYGæMÏ­tÑGµ\0¬-s7ã]:§J\0b¯5:­(àq@)ÁiàqJ\0\n*@´(ÍH(\0QS(¦(©R€$QO…ìPNhğ(@§b€)ê2hcZ°«ÅF«R© \0ŒR§4iè1@\nH«H´ñÖ€\nq R@\r\"“ğ3O	š\0b\n-8&iÂ€\Z¢œ(»hÛO¤=h PG”ñM +2ä74«OAO(¨†YNz×–üCøÍ¥ø^ÒTK„óŒĞu¬xŸNğõ»Ëw2£<šù§âŸí\"H4i—‘òšğ?ülÖ<kªÉe¥»²³`m5·ğãö{Ö¼[}Şªå±İóf€9iõ/|G¾Ú‚fWld^Çğïög½¸xnu…r§†¯¦<ğ[Gğ¬fX¤P9ÅzLI.İB(ôÆxGá®…á»4[ ™G]µØ@+ˆÕBœRKÎ3OT!q@ò;ğ\rE³o-V¼“I/<š\0‡nş”¢#OHñ×Š“\"€ ò:ŸƒF(˜İµa—ŠhLĞ$b£aíWVÔ‚ÈÔ˜A¦}+_ì`pE/Ø‡¥\0a˜·v¨Ú×#î×D,ÑzÒ˜b\0ô Qì8Z«%”ƒ¢šì|¸Aç¤ZãÃ¥C÷M(v_¾+¯–géŠªúl÷€9Õœ\n™nkV]1÷Hªri»>í\01_wz‘]¢‘:NVÛ÷ºĞŠhlUDœT¢LĞÌ ©ªíçŠ‘_œTœPt°íYóÙç¢×Aé@‰OQ@}ÎŸ»ªV|ºAaò©è&Ö7êµ–1öç\r¥ÏÊæK{np¤×}&œ§µR›MN~Z\0çíµçˆ(;«ZÛÄ±œÅWŸF‰ b²nt¦Œ’”ØG©Ar8#šx·CÃÁ/Ú <VcÕnc<“Š\0ìd²ù\rW6Î‡‘Y¶Zş\Zİ‡T¶¸Ph _j]„Uï-_•æäŠ\0Ì ŠLÖ‘·µFÖgµ\0UVér*ShÃ¥4Û°í@È ûQ°ƒÍ9phŠj]´ı£oƒ¥\0 Z]´à3O€\"ÙFÊ›b€!ÙFÊ›b€+•¤Ùšœ¯4¡q@üªO/l&i8 \n›i¥jÏ—I²€*• -Yò¨ò¨±^)…«f\ZiŠ€*˜Å1 _J¶c¤ò¥\0RkqQ›qéWü³ŞšSš\0Î{^ø¨Ì$V™4† h,ÆE3V›[ç ¨Í±ô \n4Uÿ\0²ŸJ(ÏÄ4õŠ¥NŠ\0ŒEA‹0Zp\\Ğc4Ãš¸R›²€*yU\\)LÙ“Š\0¢ğf£ò1Z~UFÑP\r”ldÇG•@¶\n6\n³åQåPF\\RVš,Ò¸ •E<-?Ë¥Û@mmÍM²‚˜ \nå@¤dÈ©öf‚œPC*6J¶R£d \ne)1Š°c¦˜è\Z*o.¦(*mM¶›¶€šZvÚLP\näSqŠ—ÖZ\0Œµ4œö§í£m\0BË“MÙSì£e\0A²•>Ê6P9WŠÉ»^µ·*ğk&íqš\0çnÇ&³e«Rì`šÌqÍ\0D)ÀQNQ@Å.Êr­J@˜Uw\\ÕæJ‰£ \n!J°\"µ,î`1ª–SòĞIÃ–«K\0ZÂ÷kI€”dPT“K†\Z¿,YªRÄE\0Z‚ğ±­{kŒŠæUŠ\Z»\rÙQ@„W@3S¤•ÏÚ]îQÍjÃ.E\0jÅ-[Ny¬¨¤Á­(¤ùhÜOƒVÔæ¨ÄsVĞñ@U…àT	ÍO@\n\rRÔrb¯š¥z¿-\0UÒbıök¥ƒX\ZPıít$s@Š_.…T P/S‚Ğš/4\0Š*@)óRŠ\0U\\Ôª´Ô*Š\0z­?‹N –J\0=iëÖ˜¢¥QÍ\0HH˜µ*Ğ\0œ(Å8\n\0U§M\08Q·4 Râ€\0¹§¯€S€ g<P€9§P\08\n(4\0ª¹&šª\\)\noqŸ»CHÑ¾ØùZ\0fàX¯z7­²´·„$kÜšKé!³·{™.Á““_+|rı¡’Æôí2\\Hi ŸãÇ»ÚMi¥Ü“|¦¾%½Ô<Añ3YalòÈ’?NjmBÖ¾*x€2Ê’79É¯½ş~ÏZw…ôø.õPÍ´˜P•üıš#·ê:ä\ró\núÿ\0NÑì´{D‚Æ@£§Ùh-íF«Ç\rñü§• `Ì0[Šj¦Ê“¥Í\0FW\'4ğ8¥ÛF1@\rlö¥GÛÔS€¥Ú(\'Ì‡)¥qÒ§Ú)’\r”\0ÜÒÆCt§ÅlÓšµ†Æ \n«;`*QlAàV˜³ùF\0\rõí¾i™Aô\0°Y»ˆ Ê°¾¼ûVø©k`ìˆãzâõ?ŠopI…¨Únu¾ğüë>ÚÂdx%Ï/f«5aÍâ«ÙÜ†v  .<cf™P?\Z¡\'Œ-ˆ%%ñ¯¸¹¼œn7çV4ù\'*VGj\0õ‹¯DŒG™úÔÅânc—?yUõŒÎ¥ÕWÓo$¶›d¬zĞµZx…ÜüÏZ_ÛÃåoÖ¼ÚÖ÷z)F­{kÖÆ	 Ù5gîÄÔ«ª“×šåa¹\'½\\YM\0t©|ÔT¦¦³Šæ–r;Õ˜®ääâ€4ŞØ¯Ü¦åÒŸmt¬ãV˜¤ƒŒP1.O5`µ¶çï\n€Lc84tHA«qº‘Yé2ºûÓ7²·(X¸íQ·=ê²ÍÅ8Iš\0—Suõ9§€\r\0Q{=Æ },8é[\0\nxE\"€9y´U?ÃU[E\\òµØ´\njµVÂİh[¿ÕñT£±¸´l‚x®ùìÕG5Nkd9ùh\ZÓS’0Ö­¶¢’ıãY÷DıÑYòÁ,\'åÍ\0uñÏt52ºŸzäíî$ïZjŒš\0Ü\07j(ÜUH¯£šµˆÇ9 \nóÙ©éU™+cİêU‰1@éÁÆ8¤?)Á®…­Ñº\n…ôÅĞR\0G¡lÅ¥\"u«1ØÆ…ä6Üâ¡ä\ZêZÑvğc_Zì$Š\0§´c9¦\0M\"ç8©rP1J.3KŠ\0(\"—¸Í\03h¤Ú*M´m ö\n>íI¶šV€øSvÔ»hÛ@ì§ìö§í§m \ní¨Ìy«Ei…(±ŠÅV¶sA€*Å7ÕlÇšo•@\n*×•E\0y˜Cš]•lÅG•@všr©«]1@b‚µ>ÊB”)¡y«)6b€#Å5–¦ÛA\\ĞMœÒù~Õ`¥&Ú\0ƒËö£Ëö©öÑ¶€+˜é<º™¸¦Ğ%)»*Æ)6Ğa8¤+Râ’€#ÙLeâ¦\"šİ(\r´Â•1˜ tÓµOŒR`Pr”Ò•`ŠcPr´İµ1¤Û@m¤+SL\"€#Æ)§\Zi4¤¥4”\0QHM%\0:ƒM (HÁ¬‹³Ö´¥=k.èõ +±É¬Ç5«uŞ³f iÀ\nm*ĞËOÎ*5§P\0ÍQ±4ò)„PmÈ¨˜€9©ˆ¨]7ô \nù!²½+bÂó€¬k!Ï–1MŠRŒ\Z€:í€®ê¯,Aª£ç|„ÖŠÇÖ€3d·9¨\n5²ñ*œ‘c4^³[¶wÀ“\\ü`îÔ¸h˜Pso0|sZ‘7k‹°Ô5¿m{¼š\0ß‰êômÀ¬¸›§5z6éÍ\0_‰ºTûºUHJŸwJ\0´¦ª^ıÚ±ª÷¿r€#Ò¿Ö×Aƒšçt³ûÚèÇo¥\0H‚¦U¨ã«Ò€-</4¢Š\0@¼ÔŠ´O€Z‘\"Š‘E\08\nô¥¢€Oô‚•zĞŠ¼ÔÊ9¦ àqR…â€\n”\nŒT PŠp´ P\0)àR\nzĞKŠP)h\0œœ(TsOÅ\"iØ â’M ›äÀëLGX#g™‚¨É©U,ç\ns_=|zøÏ…í%²°˜yÄÁ ÚãŒZ5´ºv‘0óˆ*všùAĞ5?‰:ìnY\ZWù^õ5­¦§ñCÄHpò3ÉÏzûÿ\0àoÁM;ÁÚD—Ğ¯Ú6ƒÈç4\'Àï‚6\nÒà»½…<ò ò9¯d¹‹„€mˆzRÈí/ÉËè\"aÓ@b\r/ïR— m~´Ó˜ÛrÒ•/óš\0Jp”‚\0£m8\nqPxÅ¤T±DXğ(§¨$vÍ;ŒŠ½·MÂ®ù)e‡Z\0-„(1Ö¦P°¡yX\0=k:ãV\0L¬Zñÿ\0‰?aÒ\"x­æ°G€;¿xşÛHFXä]ÃĞ×…ø¿âÅòºBçĞ×—ê?Ÿ\\¹f–BTŸZdÇs’Z€×÷7÷;å‘°O­tˆ‹ÜÙ8®flÄß»­.Bê7š\0Û·\níQß@a;ÔRˆŠaÓ¥[\\\\Å†ëŠ\0ƒN¼Y0+Wb©+ì×Öı´¢E\\u ñ€Ëµ±\\î¹§I2Ä?*İÃU‰n *ıq@¦‰«¼n#”½ë·´º ƒ\\¥hl§,ƒŒæµô=KÎùIÁ öŞàõ£ÅsVòÖ¤Nxæ€6’@jÒH»}ë\"7\"¬£¹ \r4fÈÛWíå`y¬¨eéš½»¨a\'V]¦¡–ÏÌŠª€îÎkJŞà}Ó@Ò+Û·9ÅOáÇ5¥uh³)\"°§­Øğq@–AëR	=ë.9óÆjq-\0i¤õ(—ë5ÔêÙï@Ãçšp|UE—œ% ~a4»Í@¯“R\0ç­\08©~´¿c\rNY”š“ÌãŠ\0§-ªœšx~¢¶Ö”ª‘@µÆš@;EfÉg*õÚ8NõZH‘¿‡4Èfd=êü\Z‰@g5~kdÉÜ6ÖUãÙÚ©i&UÇ½\0n[_šÓ†`ı\ry«ñMÒs›¨øÿ\0j¸û¿Ú#MÓä Nz\0úm!ÊäÓ)ÔWÍZ_íK¦ùê²2•Ï­z§†ş3èŞ\"ÚĞ÷ CƒÅJ j¬v·¨	çĞÔÀÇ4d|Â³5È5¡TsLš5OË•èa»¥[¾¶òòERûPÀÀÅ?4Ây£4\0úQLÍ;4\0ê)´P¨Å6œ­\0£¹dPbŠLŠZ\0n(ÛN¢€W•.ÚM´”›jm”»(\r´Tû( 6ÚhÚjJ(=´c%5¹ ÏSñM\"€E;˜ ¢—b€\Zİ)•)Sq@â’¤\"Š\0ˆZLSØRb€ŠLSéÅ\0!æ›N¤4¦·JÓ[¥\0EM4óM4\0Êò\rJiŒ( ç­\rŒRŠaj\0k\niÍ?9¦P\r0æ¤&£<PI¦Ò±ã4Ìæ€\nmÍ4œĞö¤i3Fê\0“T.iå¸ªò=\0A+pk.åºÕé[ƒYwh>äõ¬ÉjıÉëYÏÖ€#¥Šnq@)¥¨·Rï “LcIº›š\0CPî#5!<Tõ4\0×ç¯5TŒÕ\Z\0C¼WA§j(êk›nEF³44Ş…2:T3&î1YšF¬$Â9­Ù]7\'4—$mS{~sŠÚ#åÁZHÇ<PH-qZÖWşYRAUX2t úÊøL\rlDø\0æ¼×OÔÚİ†ã]†Ÿª,àh«†pÀTÛ°Eg@FÜƒS£–84¤²)npĞš©¸ƒS–İÍ\0R²b·Ï®¦#”¹DıÜÙ÷®ÊMÑ\n\0³Ş«lp£Q~öjÆr¢€%•æ”ÈÏËRG@âœ))@æ€J¢˜J£Š\0B1H8Š\0 µ<j\r0/9©ã\\Pˆ T€P¢h¸§\nP¼Ó€ õ \nv1@§S<t Q@§Å\0\0f ©\0 ÆhŒîlS»Q\ZmmÔ\0çÂğzÔ&w\0t4—…‹.Ê«¬ë0èšL—3°RŠOZ\0ã>+xşßÁúÑ‰BÎTÍ~tøÇ\\½ñÏˆæi‹I€3õé?~#ÏâmZX-e%ã\0×Aû;ü}{R‹P¾‹t9\r’(Ô?f_ƒ©¦¬z–£oŒ€Ã+_W\\ R#‡ˆÔ`U­,-ô+­lP(\n§F;n´\0Á•àRãÖ–—\0zÓ‡b”PR\nm( dSR¸4Ğ3SGjeÆ(±À\\ñÈ«ÑÆ-†Xf¦†5·æëLÈ`ÒKÂ\n\0’9Q“ò\\Ç‰ü]g¢ÄÅç^;f¸‰?í¼7ÚÈ<Îœ\Zù‡Ä5Ï&e`Œxæ€=+âÆ¬¤‘X¿=2\r|÷¨ëšıËIu!*NpMiÿ\0gµÉ-9ÜO­;û+˜Æ(\Z,Gò§jÑ´ÔÆx¨ŸN’9·`y ‰5ep7u­.ñ]‡Í\\Z¦ÑV­®¤„ü¤Ğ©ÛÌ¬ g\"­FvŸ—¥yíˆ6\nÆº{-m$Æã@\Z÷Ñ¹Ç4ı.@ †<Óæ;ˆø#¥Sƒ)8Áã4ÔDùëR¯-ÅV‹”\\S•Š=\07S³Y bFN+·‘¬oxàf»ÙM\rq~!´0ê(²Ó¯hF8­[Yo˜ñ^}áı@‚ªÆ»xäÜªV€7|ÀÊ6ÔÑ9îk6İÎŞjÜo@\Z·LÕè›Ò²¢~•z \rHœñZb²b~EiBÙ¥nù8=)×Ö<D¨äŠ¤Q«^Öpà êÖK	²ÙÅ<NF:×eªi+}eŠá¯mŞÎR¤`\n\0¿È	ƒÖ¶ıÄñYi <æ¬¬Ü`P¸š•\\V\\rñ‚jÂËÅ\0]•2>:Õzœ>hŞÁ\' â¤FÙÁ9ªi¹¹ÎJwÊ¼µ\0]ùHÈ<Ğ™“\"«,DCÌv¥s/ø‡£ø^ÑšK”YTtİ@T¾Uº–¹p€z×âˆº6„ŒZê2Ê:f¾YøûLÜË,¶Ö.Bg\0ƒ^\rªx·ZñEÁò.drç¦M\0}Uã?ÚbÎÕ-\\{`×ˆëÿ\05qİ,İ1U|ğ_TñIGÔ•‚rkŞ¼1û<éÚXŒÍ¹r(åógãÊOï¶¿Ö¶´Ï~!Ôİ^äÉÏ\\æ¾åÑ¼¤é±\"¥¢d³]E®f\0Ù\n¯á@é³æÅó7n®ÏGøOªxvEhd`õ¯¨Î•gäÖÒ_¾´æ^ÔuM-Ufv`+¿Ó<`øhæ­?‡`#…Uô\0‡äJ\0é­5Øï\0$í­xo¡‘pW¶3ÃÂäTÑ=Ä\rÉ4ÔêŞb’§5Ë]LÖ¯µ«ªØÛ%>E‚èÀf€1ÒãpOZ°“©ïPË§çoJ„Û:\Z\0Ò­ĞÒíÇ5œ­\"T«rÃï(ğ4¨#¸\rSeM\0*®ê“f*-ØéR+ñÍ\0/)¤æÖ€RÓÚ\0)ÀQ@ šR1@§Pi\r>”\n\0Š“P™í£mIÅP{hÅI‘Mb(¤Rbši Å0Ô”ÃÖ€Š(Í\0¥6”8¨Ëc­\0-İâŒæ€\ZÇšLÑ!ÛÖ™º€šni¥…($Ğ\0M4œĞN\r0¸\0¤ÓXñM2\niph\0&µ!4ÒÔ\0Mf¤Ş)Œâ€š¢-Šs0¨Y…\0?~)…ê2İj2ãÖ€%-Lg¨ËÓúP…é¥ª2ş´İô!zazap)›Å\0JZ“}Fd¦æ€&/ÁªÒ?ZVUf”s@Í/³g”Ô“K×šÍšNx4Ä•Ÿ,¸©.úÖ|¯@y™¤fªï¥ó­\0[H_š…\\zÒ3ó@ï£}AºŒûĞÅ²*üšq<Tàf€£/M2LfÍ\0<¾*»¾óŠ~áŞ¡|• Ç;Z¶T×Y¢jâl,§ó®4üßz•g{|M\0zsmv:Sd‡å¬ZGŒ$§ç÷®™H–<©Í\0eIS’,¶+^EéUŞä@×ÁZ}•ì–Î2OnXÏ9NhÇn´Úi:à“\næºxî€*y¯#·–H šê´}g8YM\0w\"PÕ2É‘ŠÉ¶»IGÊjâ7=x ~Emi“æ0+v«š\\Á›h4Ò†ÍXSÅSÀ«`€0hhÏ<bª¡Á«hh^¢œ) Šp 	¦QQ 5:ô \"\nqë@*®EL‹LNœÔÊ=(Ê)às@ìPbœ”\np\0iÀf”-8) …æœšpSN€ŒT€qIŠxPŠxsO\0ª™<ÔlØbJ”çµAsÀë@Šåû«ë_/şÑ…Œ3XYË‚r85ï^<×#Ğ´	äg\nåN9ö¯Î_ˆş ŸÄ~$š=Ìù~?:\0OxbïÆ^(DuiG${×éÃ¯CáÁmae(9¼\'öhøt#±‹Qºˆy€2+ê¥Ã\"ä`¨Æ(/ÉûŞM<Û¥ËÔ7^(˜¥Å;ŒPŠP9 Ó•Nh\0ÛNTÍ!88«¦ìb€‹\"®[ÆSÔ*…ÔÊÁ»ó@	?–¼¬y5ä_¾(ZèvrÁk(ß‚85ñâì:RZÙJ<ÜÁ¯“u/_xŠñ¥»‘Ê1îhO\\Öî|O¨<ÓHÅ	Ï&©ùj¸X€$Qk\Zzz©Œå{Ğš.Ñæpjê¡pdUK5`½j/Ê0´Ú$ËÊÕŸq¤z\nİEÈëR\0Ş :M9×<UsGÔWnĞFİ@ª²éÑ¿a@šF3¸õ«qJÊ~SZ3èíÖ1ÅPkI!<ƒ@\ZpjRF&¬Å¬0”dÖ	fb¦L‘ôèún¬ªÖÊÏƒ Šò»k©b=N+vÏY+í@â8¬}HMEi¬DàdŠƒY½F‹ƒ@í¤æŞäckĞt›Ÿ6%Éí^fìL¡…vºÄÄ{Peƒ€*Üf±mæÃ€kZ)Å\0iBÕv#ÍgÂÂ®ÄÔ£t­;WÉÁ¬¨qWàlŠ\0Ö\r[·MP‰[\0lC6Ğò\rekÚBÏH‹Î*İ¼«­jGµÓdœƒ@7p^ÒvVÈbÁ­ÿ\0h¦\rÓ ã­q0\\”Ğ¤Â¬¤Ù‰ÛûÕ˜îqš\0Ù^jÔN^•¹`3V·zš\0ÓóK6ÈúU™eµÒ`k›ÉvŒòkSÖm<3¥=åüˆ\\òkã¿‹ß´=Æ§<öz<¤(Êü¦€=ƒâÏíg¥G-¶Ÿ(Ş2Ó_xËâN£âë§/q Ü~P\rq·W÷Ş\"¿+;I$®xï^ßğŸà}Æ­,WZ¬dGÁ…\0p¾øs¬øªá<è¢cÔŠúƒÀ³İ˜\"¸ºEgàEzç…<a¡YÇ¦åÎ+±¶ƒhÆÜPN›áû]:ŠU01+f\0\0ÏJ¹o-ó*Ø@N;P1ZÆ½N‘p£Šx€V­Â£4¶M¹ÏÍJ°níS¹È©£ĞamëR‹uQÓ5`/58E\"€2ä¶xZ‰¬\rl¤`Tël¤gÊK¤däT`’>™®ÈÚ†è)¦À¢€8í²¦2·q]‘ÒÔEFÚ:7A@c\0:Šb¢ÊÛHÅuï¡ÆzŠiğò¹zĞ,m’1ÅDÒªw®·ûùª¼º\'4Í¥Ôyæ¤ó•ùJÓ} xª²é†ˆºPJôıÔÖ´–>MD	€%&œ­4Š3Í\0?4 Ó)y çàj?­¨juDàâ€E&áE\0yµİÂÔ\0R\ZMÂ‘˜PÑLİFê\0}0õ£u4š\03IIšLĞÉ¤eİÔÒÆ€¯¥7v(/Q4¸4#İj6#µDd÷¨™‰èhVëÖ€Äµ\\’;ÓK5\0Xij&”T[Ò¢%ı(Á’€Ù5[-éJ7ç@Ö¢o­0ù¾‡ò¦‘\'÷M\0;Ö¢’Q²ÿ\0tÔnø—4\00=*&“4¬­Ù\rDÉ/d4\0¥­7>ôÆ~ÑšŒ¥Çüó?•\0HÍïQ3ã½!†sÿ\0,Í0ÛÜùf*\0w˜;š‚˜m.,şT‚Æãşyš\0w˜´İëKöùæ*>Ãqÿ\0<Ïå@gÃ õ©›rÜ„?•0éW_Üj\0ä<Õ)Ÿ9æ´N‘t¿*†Mèñ±¿*\0Ä•ºóY×\rŒó]xfí‰ù\rUŸÂ·l>á RyyëTıMtÒøBñÜ5\n¼eá\Z€9³(ìh¯­nÿ\0Âz?©?á½şãP0™Gzwš¾µ²<{ıÆ¤oß/HÛò c(ìi†_zÙoß/ü³oÊ¢o\nŞùfß•\0e	I=i\\Œk@øfôt‰¿*ü5ÿ\0<›ò ÌZ7{ÕãáC?ê›ò¦·†5ªoÊ€(3Ş˜Hõ«ßğß©æ&ü©‡ïGX›ò ö>õnjûhwƒ¬mùT\'G»òÍ¿*\0«ío(pk´ĞuÑ&Ô‘«”:EÉÆ*[kËiATn\r\0zÜpGp—ƒgÆ1XŞ½™Dê\ZëVU-\0`O§ğx¬étò	â»MV{U~ÔÆKjWµ@7BÀŒ×Y6j¡>™»<P,5ƒ5ÓXjë(\0šâ¦ÓİÊ*KI%¶qœĞ£.A¨#»û ç©¬‹\rK*\ZšõüÕ½¨¿Ó§Yágš¼’no¥q>Õ±ˆ˜×]ƒƒ´¤‡5e\rR‰°Xù B¤SÍWš2(ÊTÀTju4\0„sNAF)ê(U^*d\ZŠ™\0<\nvÚP8§@\ršx¸§*Ğ¨¥ìPE\0œiTª´\0Í´à)áy£4\0 S¨Š\0kä)	A;ÿ\0Í>¹Ïj‹£éw2ÈÛ~CŠ\0ù¿ö˜øŒ--¤´¶“æÆ0\r|ığ‡Âø×ÄQ\\L…Ô°$‘ïT>+ø‚OøÁí÷Fr>õõŸìÑà$ÓtØnå‹@ ‘@õàß§†ôx ‰Bü€t®…E\0äì´ì`P\n4ª(ø¤Å?QŠ\0jŠvvÒÍ?fìP\0\"İƒWà„*ƒQÆ¿(•j> P\0ŠŞ¯,ø±ñ\rXË2!pk´ñ~¶šónÚ@5ğ÷ÅOâ=ZB²@Ş´Éø“ZŸÄº£Ï;3)cŞ›\n.À‰Ú«Äª«´š­ÛÂbù›½\0O â­w°ÜI505\0_³+I8ª6‹À«Êy 	OÍD<\Z\0}™¥Å\0Z„LI&˜³gŠ}ºäUøøÍÜè˜ÉQY²i²¡Èİ§­!µAŒ\n\0àŒR(äS2Ëë]•Î’˜%EcÏ¥xZ\0Ë†åÓ¡5dŞ<ÃM6KcQPƒŒP‚~aŠëtÚ£5ÉÄ…ØWO¥Š(«·`ÏZÑ•jÇp­ˆXñ@µ]„óY°7~Í\0kBzb´ ê+2Õ£äP¤=\\­Sƒ¥]ŒPÊ¿0>•¥»ŠŸJ ‹ÅJŒSŠ\0›]³şĞ±e<WŠj¶vÑ‘š÷»6Vî+Ìş hEÜF¾ôÆÇ+.OqfÜ¡”óXPİ6<¶íV¢œ£æ€:yLë¶3óQ©xÓÂÚl—Z”ÊA X:¦½†tù.çp¤y5ñÆ?Œ×Ş\'Ô%³±˜ˆ`àĞÿ\0Æ_×\"ºšÏO˜‹pHà×†YÛÜkW‹ª¼“HÜ‘ÍWÓífÕoÖ2Ë#rG5õ×Áo‚PéĞE©j±\rÜ0(Á¿*‚C[$àÂ¾¤ÓôH4è4UEÍ>Ø:¬6«²4à`WAkncnH Ú[íÆEi*ÒF€TÁhÑÔÉÖš‹R¢ó@¨©’£Z‘zĞ…éO˜§ñ@(©\0ô¦-H´\0á9È«HvŒ\Z†7Ú(\nÌÙí@CÒ¯µ*£“Li€h¸nFeuª‘owîYuFep½\01®ÖNy¦„™\n­s¬iö*I‘r=ëÔ>\"ZÛdFÀâ€:Ï%ÿ\0ˆÓ^4yÅyµÏÄĞÀì5‡uñyIØÆ€=qÄ?óÑ:­!€õ‹^5\'‹¯¤<9üê3â[Öë!üèØ%J0$Z¤Úzã5åÉâ+ßùè:Fñmä\'æsŠ\0õ§1û­‘L’Ì¨éÍpúoÄŒ«1ë]…ˆ­¯ã$P^&SÒ£,k}bŠå2¤Õ‹=¤àPx\'<ÔœSeBª Æ€,ijzĞ¨¢Š\0óôo¨é	 ï¤/šŒš@Ş´.ê7SJ\0=èÛ©j3ÇJR~^(Ù¤¨÷\ZRã½\08ZGaŠycHÈïŒP²x¨ÌDÖ›XíL´Am¼à(:-9îÆkVÛÃÌàfµl¬ÕqZĞá€9ßøFÇz™<2‡­n»f‘XŠ\0Çÿ\0„r1ØS‡bô¹¸úÑŠ\0ÃˆöåğôJs[\'#½&M\0eÿ\0aÃıÑIıƒ ­N}i	>´™ıƒ÷EDş…Ïİ±“ëFM\0cB:¨§\r\nüò­mÆ“4›ı‹oÿ\0<ÇåGö%¯÷åZTÌ{Ğö-°ÿ\0–cò¥şÆµÿ\0cò«Æ˜h™Ò-‡ü³•ÙVßóÌ~Uhœ\nis@—l?å˜ü©™mÿ\0<ÅX-MÉ ¾Ãn£ˆÇåQ›[pÕÊ¬ƒÅFÃ4Ùí€ÿ\0V?* ¶Î<±ùT„S\nŒĞö{qÿ\0,Å0ÛÛŸùf?*€EFx Í•·üó•4ÚÛùf?*{9¦uë@0Zÿ\0Ï1ùSL¿óÌ~Tæ_zfÓ@\n µÿ\0cò¦²Û/P?…8FM8B;Ğ&+VêGåM6–ÿ\0,GåV¼‘G”\0T\Z}¡?ê—ò§ÿ\0gYùb¿•M·šqLPL²?òÅ*K²ÿ\0+ùU…¦€(>“bİa_Ê«M¤Xş©*¿/Ö©ËÓ­\0d\\iV|â%ü«6].Ó´KùV½Çë2W#4—>Ÿl§1ùRE§Úcò«2sP0İŞ€l`^aP*ÄJ±®æ£‡+ïR0ÜhŒy4)¥u¨KhV\0Šã=haÅ\0Tx‘¸\"ªOb¤eEhòsAéŠ\0ÆXš#ÅhCqòcÎ)Í&«ÈA 	l¤k{ İk¼±¼3F¤•çF|Ÿ¥kiÚËBBv H‚}Ãq°t»¤– sÉ­håĞ‚½NTUı*Änxâ€4\"n*Ê\Z§	Èæ­)&jT¨€àûhÈ9©ÕdlÕ„é@ƒÅ9zÔkR¯Z\0xÔ‚£æ¥Z\0pà™ -<PBâœ-8-\0&iivÓ£Lõ †¤uÛÒ£#Œš\0TÁÜOA_:~Ò>9şÊÒ¥·ö±R85ô<Ò,VÓ;a\r~z~Ò^*{İ~[%|®â:ĞŸxD“Æ~-·›ÿ\0{Ïç_§ĞCğíš\"í!kã¯Ù?Á=Ò]Î™ç#\"¾èCÀ¼â€ )OJ{Fhö â¥EÍ\n€ÓÇËÒ€›iCQ@\n¢¤ŒdÔJy«1&M\0OÉ¦ÜMötgô§“å®Eqş5ñiZUÃ³\0ÁN9 øÕãà#’Ñ$Á9Í|Ægifv“Ç5ĞxÃZ“Ä:´Ï#¡¸®}Ğ.1Ú€@>jvÜHãŠd)jÂ¾ï—f<zÓãå©±E°g­M\ne¨NØ`\n°zÔ0\nŸ4(éJ\r4\ZP9 	¤Õ Z\0’)\nhÄÄ¯5B0«‘¹€,b¤LŠ€jÂ\Z\0•>~\r=­‡\"š§*’zĞuÆ’’t›>ƒƒ•Ó)àƒÔP1o¤”#\"µ\"‹ÉÅh0 ª³PÛ7¯ghyë[–í€(^\nĞƒ¨¬Ëg\'«n9§jĞ€ò*„C­‘@\Zpt~!T\"à\n½	æ€.Ä9©d\\‘Š\Z´ªæ€	\n8Å?_Ó—RÓXc\'m5SœÖ­¶\'Väb€>iÖmÆ~ñ‘jwœqr@Uæº_ˆÚoÙõ	.ÂšùãÄÆÓ,ÚÒÅğÄ`àĞ+ñÃâÓŞI.Ÿ§ÊJò85óÔAîe)ÓÈj]RêKÙÚáØ¼®sŠõ¯ƒ¿]ºşş<*@\"€;ß€hõMJ,õuœ~`KhËF0+Ã61ØÛÅºP1Åz—§(Ãƒ@YÛıyîkQcAïOTğjXâîh0µ:%8%H¢€õë@§(Á 	9zĞiÀb€%àj0*Tû¼õ 	Ôªjëót§³à 	7•<T­1Ò¢MÀe…Ofáº|´\0ÈIÛÚ¬É\Z@»¤ UuMfÏCšWPÀtÍxÿ\0‰¾&K4«§(ÒuoYX#uÜ=ëÍõ¿ˆ“LÌ°1Ç±¯>¸Ôn/$2I#sÛ5\Z~nhfã\\¼½$´­Ï½Uòä•²îMD‡=*ub(\0ò\0ëN«Ú‚I¤P»‚¥1(Ëpj$lv§ä“‘Å\0K·Ëè3HÑ¬£iÊü`Óƒb€2î4üÉÁªÖºµÖŸ/ÌÄ(­§ùºôª7¶Ëp„(æ€:ıÇ9Úÿ\0­z–«ês_8ÉÚ|›Ôœ\nìü-â¶Ü±ÊÔìsB²¯ËÖ¨Km³µ3MÔ–`¤æµÙËš\0Ào”âVî,ñ’+1Ë£ãPÍÔUpÇP›“M$b˜^š^€M&7SÓKÔ)\\t¤ŞE7yÇ5Ê &iáÇz¨³\nn‚€%yAIm+p*Õ¦ó0È5ÒXè@,(×Lf`H­¸´Ô=Ìkf$\\UR_%\n­\0c\\…-´Q\n¨ãS#jm¤6\0_ƒâ­¯J©\0À«h(\Z@)íM M§PZ›Njm\0†–ĞRKMcÍ\0.hÍ74f€ši>”f’€ÓM)¦“@İ*3O<Ó ši4â=)¤PŠijR) Éõ¦Ô…sI²€\"Í!©BRùt\\®i\n\ZµåŠQÍ\0RòÍ(‹Ö®ù@SLx \nâ<PV¥#mÍ\0EŠk\nŸe4¥\0WÇ¥)âŸ²‘…\00u¤cNÅ1è¼ÍTå<U©j¤İ(:å¸5•+sZw#­eJ9 \n²75îiÒpy¨sÍ\0[G§‡æ«¡©æ€\'<Ôl´ğsAé@(S´æÁòĞí¨Ùjuæ‘“4I³UfRkE¢ªÒ¥\0Pšfóf­mÁ¨¥Œ@\Zš^°ÑHªXâ»{ñ>0kËcù‡Z×Òu–…†ã@µ\0¹ÍO šætíagPVä.¤\r\0l£`qSÆÕ›Ù«qÉ@Ôæ”æ£G©A,mŒU¤5I[­Fs@­Lµjt 	@©TT@Ô«@¨§b‘M<Ğ§Jœ\0 Zs¸Å8\nVˆ ØŒÒL0œU‰¥BÀ³@¯uìÏ9;NÃ_™ş>¿øÜ`–\r6?Zûûö†Ö—MğŒÈ\r°×À^°xÊ6Ú_÷ßÖ€>ôı<,š?‡-ç)µ™Aé^ÔT¼¤öÍbxG\Zw…-P.A]\\Z\0sò8¨ñÍ<)¤Ç4\0ô¤R ¥\"€):ÓÈô¡W&€dÕèbÍCud¶Å8 \nw÷)m8Å|½ñ»Æ§s[ÛÉ×\r{gÄhiútí¿i¯‹|OªÉ­êÓbÀ1 ˜Ñ¤&FêÜÒ˜²)êz íV–,h¬Q*hãùªB¡MK}èEQ¶¥…0iª¹8«qG@b^L)ˆ¸¥€ZpëN€£š”ST Pˆ*Â*:Ğ«S¥VSÍXC@©©TÔ\njU404å<Ô`Ó”ó@*…ÑÅ_ÍgİhK&Ë\nß·ä\nçl¾ğ®ŠßîŠ\0Õ·íZÖı«&Øt­{qÒ€4¢íZVã¥gÂ:V¸éš\0¿àUØ5R!À«°hô=ªÚ*¬#Ò® â€UûS=jnß¨ \"ı \\i^é	CÍ~^øÇ]¸ÕµyüÖ%Cf¿V~>hçWğmÂ ÉT5ùAâÅ3Z*œï#õ ^ğÌÚŞ­*L{†x¯´ü¡ÛèÚtÄ\\¨Îy/ÂGcl“ÌƒyäW¿øoOkÉĞòƒ@¯†´Ü€XWu¸FPÒ,„¯«j$É\0ÁÈâ¬ø©ü¬ND tà•ce(”í˜©6Ó‚dPB2iŞ]H±Ğ@ÛÉ©w|Ôáî´ÑûGJ\0Vù¸«Şœš{¦\0ÛÔÕ»kRƒ|Ç×š\0KxYÆ_…÷®{Å^2´ğõ³¬.¾`dxóâ\Z,MojÀ¿N\rx«¬^kWM%Ã±BsÖ€5õï^x‚åòì>µ”ª02rjº E>µ<HG$ó@”õëL§Š\0³©ÔÕd526M\0JO¥\0ÒQ@Š‘* MH§2šuBš‘[4\0ìf“ÊÙÉ§Å9Iqƒ@÷” \nç	tûêH®Ä F¬İJÛÍ\\@>ñ+Tv¯UÒõ¸Œs+ç‹VkYÆ29¯Qğ®­¹Y¨Ñğ®qTï-\0€§[Í¼\r_’1$tÍrh­SeÉâŠ\0ñ]Ô…ª/¥0ÊM\0X-Mó6õªÛÍ\0³œš\0²fqMXVàTöº|’°8®–ÃKËÍ\0bÚéLøÈ­û]`dVÄV*\0Ú+FF\0€*Yé«¤ (À\'®(EÏ&€+ÎŞTeúW/}9¸úVŞ­?ÈUMsê¼äĞ‘ D\ZînE*sÖ¬¢ŒP£úU•éLE§P\0F{Ò;ÒÒŠ\0SN t¢€\ZÔÚ’(”†ŠJ\0m!§bŒPh§Q@\r¦RÓ6ĞfšjB)¤P(\"E\0GŠiÕ5 6Ñ¶¦Å(ÚMœÕ¢—h <º6T´Ò(›i¬6Šy„PAÍf–ĞN”â¤¢€ŠB´óM&€!+LaSÅG¶€!Å1ñS²U¤ôƒ5RUâ­7ê¤Øõ ë‘YRµ¯8Îk.à\0h.o½Pš´ëÍDF;P\0•(¨Ç*œĞÅ;9¤\n=iq@3PÌ6ã)\'Ò£nzŠ\0\"9ÆjÚ¨j ƒ‘W-å€hÆ?j¯%¶OJÔT*\'‰Æ(KlUy\"À­§€¢©Í3š\0Çx³Æ*nPäVœ€\n©!Å\0Ke©=«k´Ò5±0š¼úDİÒŸkröíØ d‚pÊ\nœÕèfç“^u£ø€,]ÚÜ(*ÔÒE&{Õ•zÇ†b†´¢H=(Újäf³×õj#ï@–§J‚!š°©Í\0<\Z™MD:Ô‹@)©£ç­Dƒ4âqÒ€\'à*$©Ò€\n­:“ %¸§B™”ı)BáO­6±ØŸîš\0ù3ö±×|›-ƒã Œf¼‹öSğÇö·ˆ<éS IœšÔı­õ—[0«ñ»Ízì}¤yQ$Û9<çö¾,í–Ø\0S@ù‰bõ™ÅEÂó@9S@©\0¥Å\0*\n\Z€)qŠ\0n3Ò¥rhA‘RÄ™ 	”`T²ùQ1ÏAVäÎkS¹ÂÍ“ÀS@<|{ñ‡Ø­(ß’Ækæ;=P<¦W<½wu“.³,E²+È Ñ§ÜE:³†SšĞówcÅX^4ëk~×RYZ\0Ó,KqZ&V©Û:IŠÔ‰F8 8ùéV#^hUäb¬PŒNhX‰©6`PÇñMˆóV6Š\0E©@¤¤\0ä©ÅD)â€$^µ2š…iëÖ€,)©–¢)ë@ƒR%D)ë@fªsòjÁ5ZS@Ú0­ûoº+ŸµûÂ·­Ú(fßµk[ö¬‹A[VÃ¥\0hÂ:V¸éYğõ£j\0Ñ «°jœ#W¢v.*ä}*”}*Ü=(\\sÅOÅ6<cšHß÷´[ÅZpÔt+ÈÜg1+óc[ğ\0?nä’<(ö÷¯ÓË‘æYN½AC_üB±ÛÄw\ZbÇœP&‡§ˆ0D8¯nğ™öhĞíä×•øV6æ2Fy¯ğõ¨G‘Ú€7,áù@\"´â·I\ZÆXŠ\0‰‡ÍŠ¦8y§° vÒb¤\"/4\0ÌSÕiÁjuZ\0R·Ò§Xévâ€ \nsO1»ÓÉ\0t§À†fÁû¢€kñ¾N\0®âbÒmä‚ÙÇ™Œpjÿ\0|m†lZ8˜yŒ¸¯›µ}Jmjéî$rÊç8Í\02ûQ›Z»yîX°Îy5*ípñŠ­\n:t 	†mšH÷DÙs‘@î½h`wsNZjeé@Z>µ\\\Z(RhÌÓ 	E8T`ÓÅ\0;uH†¡Í=hÒ\Z˜\01Š¨¦®/J\0F„i\Z èAÔëJE\0r×¶F)cŠµ¢jmÂ®p3Zz„\"H¸ÖpyRg¥\0{F…|\'‰9É®¢Ñšòß	ßuVn+Ò#1T­\0\\Ş=(¨ÁÀ¢€>wSQ´™80Í;\0®KğóLC8 û¹ bºk…\0ºÖ½¦’–Š£0\0S·Ó£‹ ma\0ü¢¤T$Õ¸¢\0s@†#Vâ@¹&˜X&\0§–ùhn~).$CÏZ–?”jÃÖos•S@·7iHÏz`LT0‚X±«cš\0j/5f5À¦¢Tª=hAÅ›»Ò€}hhÅ\0Ó³@\rÅê(´¸¥¢€›iÔP1LaÍIHh=´m§Ñ@ÛHV¤¥#4ZiZœŠiZ\0‹mjP´»h´m©¶Ñ¶€!Û@Ô„sHE\07b–ŒĞ¦‘ÅKŠiSHÅJE5‡„SÈ¤Å\00ŠM´ò(à\n\0Œ­4­JOÓÒ€!ÛKåŠ“£i ^!UeŒf®H*œ Š\0©2\0:Õ)TUÉ5FPq@ç\0ÍdÜ“Z’ÆNk>{f4šÄŠ…˜úUÖ´“Ò¢kI=(®óéOj_±È{T‚ÊOJ\0Œ0õ§¥ûŠiŒ§Z\0RôÒÙëÅFÓëPµäk÷¨Ñ`¢¡ó0ÜU\'Ô\"ÏZT½‰¨zÎñSlÇ\ZÎ»Æ9®3í(@+šÔ±Ö\ná9Å\0te¸p*Œúc7jÔ³¼ Í[` ÉI¤7b³.,°®êH7/J¬tõpr(€6ì½EA$ô®ŞçJ\\œ\nË—K+ü4ÈIç@ášèt=±U‘:M;vAZ¡.ŒÙÜ¼P¦i:ÜWArÜ×@·\0¡¯²’{\'\'»}#YÜ Hh¹Šb@Éæ®C-`Áv®µ 0 \r˜féWc“ucE ­^€/R!ª¡êdj\0º”æ¨£5!9 	§J*t S–›JxÅ\0ø¦LvC#îšÂ£¿>]¤Ÿî\Z\0üàı§/Lş5“‘æãõ¯ªÿ\0e=`ğü3mÆTWÈŸ´Yó<zŸõßú×ÜŸ³U°‡ÀöÒcA@ÁxwNj ;S¤É”š|Iš\0nÜRâ¤aÍ b—ğ)p(Š0jä b ÙÒ¦@TPnÜ\"šãuëƒ\r­Ã“üº]Fm«\\O&ò´iÜpĞÂßõNÈŞk”D0Fº¿uâ;†<üÆ³f°2?€17±«‘9€€\rXÉ¢P@ª¢&\'‘@\Zöš‘5·g« \\€B*İ´Œ‡9 E´dPM^\\v®&ÏS)€MoÛêjÀdĞÖN8¥RIæ£·¸IZ¶O\"€LsOH„“ŠŸ\0iÁiÁiÁhqOŠp\0à)Ê9 \nx(è)ëL^”õ 	/AH){P	ªòÔíP8æ€\'´ŠèmWå‰d¹\"º+eÂŠ\0Òµ^•±l1Y–ËÒµí×¥\0hD:VŒ¥Q„ŠÑ…zPèWWáRÀÍ_ˆPˆÖ¬ÇÒ¡¥Oâ€$Fâ¢WıõJ£Š®¿ë¨f?Ş@º•|¡ñfÓÉÖ%lujúº!¥|Ññº u4‡à;/:XÛ•ô“f#…8í^EğÎÃzFÄv¯s´‡lJ1@D©vqR¤tâ˜ ÓŠÓ¶óOU vPšŸm9R€\"	S¤\\t§,u8\0-\0F\nB3Ò”Ó•h%‹y§^Ì¶6®Ë÷±ÅX\\F\Zçõ+¿:GF? à¾Ñ¨_H÷,Dy8Íq6±`¨é]ßÄJ)ç6öøÜjàáÃ\rÖ€\'N¦§AQFsÍL´\"óN¤à(ËRÔiÖ¤ 2š®5*µ\0Ošp5iÂ€%Í.i™¥Í\0H\rHµjd 	Å[N‚ª­[Œp(d&Ş(ŒdTá(³E¼Ö%ä+¤)Åfja	 \nº5ÓCr£=ë×´iüëu$ö¯·>\\à×¨øZ÷|*¤ĞWš(Û‘š(Î,´(à °µ+â1R‹v5:@GZ\0…›ït©¼¿võ ¢R€iÊ´üq@¨ZP™8…±I¸ -@\r¾™má<ó\\tÎ×Sœt­=RìÊÅ3T¡„ İ@\nË\0w©c_Zi¹©bBhU§`”¡1M9€u¥\0Ó–4¼Ğ€S±Q®iÜĞ³K@aiÛ–€Aâ—+ëI…n7P\09éC)@Eş1JZ3ücó èÛNİş1HZ?ïŠ\0M´»)|ÈGY4ÜÛ¯üµ_Î€e.ÚˆßÛ²¯çHÚ¥ ÿ\0–«ùĞ…O¥4j­&³h£ıjşuUüCj¿òÑ:\0ÒšvÓX­â{XùŞµxÂ×³\n\0ß¢¹™<e\0éŠ¼kè(«<šM¹ko\Z§ğ­V›Æç«@ÁL´ÎûÂ¼öOÌÿ\0uMD|Wtİ¨Ò²€}áLgAüB¼Ìø’ùº+SNµ¨IÑZ€=,Í÷…D÷1/ñ­y¹¿ÔŸ ji“T—³P£èGW_Î¢:œÕÇç^{ö}M¸ùéÃJÔäşõ\0w¬[¬*×-ÁûÂ¸ÏøGµ7çæ©“ÂšƒŒ±j\0ê[ÄÃø…DŞ#¶Åa\'ƒïŞ&¬§‚®ï@\Z\râ{`1š¬|W<R\'¥È,N*Òø,dP\'ñJŒUY<Hğ¦·ãğlcªÕ¥ğ}¸ê”Ç6¸dáTÔO¨Hı×}…mbëüªqáëAÿ\0,Çå@r%™ÿ\0€şTí“7ğÊ½-4KEÿ\0–cò©—I´˜Çå@]ö[†è‡ò§\r:åú)ü«Ô¿²í» §\r6ÑGå@dš-ÓtSS\rì†½,YÆ½ô¥û2öæ\ráËÏCPÉá{¦ê\rz‹ÛŸJà>”åøNã¸5RO	ÊÃ\ršõyíÉ*„öävårøI×Ö›†Šs^‰qÇJ ĞÔÏÛx~0ñZ0xr0w(­$LUøN\0J-+ÊQ¶‰!’*Ü‰w\nlÖÛ‡J\0ÀóÈàÔò8«3éøçPÆV€\r»4IeqH\\ŠnìĞsh‡<U9,NxV™âœĞ,–Š€Bñ0Ù+rEÍWhó@Øj[+k¦²¿VšâÚ‡\"¬ÚŞ4L2hĞa¹Î9­+yòEr:~¢¬\0c]\nØ*h C»¡©•ök&’­œ?Z\0¿îÀ`ñÖ©ÆBô©Õ÷Ğ¤©•€¨#5(ë@ƒNÆâ1LNjaò‘@\0„f©êà›91ıÓV§äŠí<Ë9û€?3~?.ÿ\0 ?óßú×Ş?³ÈÀVª:ìğ¯í	“ñ	ÿ\0ÿ\0Ö¾éı9ğ%«°(Õ0iÑü¼\ZBÛ˜Ó”f€ƒiqKÔÒĞb”-(¥ ŒT¬ASÏËÉ \r^\\6ÎõÂüH¸û\'‡$/İ\rv:«nºük†ø³ÿ\0\r?û´ñmâ™u™¥şÆ¯F¨:Š­8Û} ÿ\0hÔø41µYFHâ¨\\i œÆ+^¹OHË\Z\0å¥²t\'Š‹Ëd<Šìÿ\0³„ƒ‘T®´Œ@ u[fÜ‚hšÅÑ¸SpPtæ€6­56‹oÙk	 \0šáC3š»o!„ç4èĞJ­È5mFîEp¶:áW\nÆºKMUdæ \r‘Å?¥W†A\'9«x}h fœI§mæ€W\"œÒRĞG´Úx\0ñKĞR\nq ˜â ,	ÅK!Å@¼½\0jX®®ŠÙraØ¦@®‚Ù0\0iÚ§µ-øÅP¶^i@¼ĞøH­8Aâ¨Û¯JÒŒp(ìWâZ¥n:V„cŠ\0jxêUˆW4\0à¼Uu#Î«oò­PFÌô»Ä\rô¯œ>2b[õUëšú=?ãİ¾•óÅuİ¬ Ú€:†:{-¤LGjõÈSä®áí™‡L„‘ÕEwŠ6ñ@QŠÍ?mh¦ªjM´Š\0nÊz¡¥õ\0¡i\0,p*AOÜP»zÓÓæéHÇqæ)BÌ;\n\0¥©Ş,QÔüÕÁx§W]2ÂI°ä\Zè..CLÒLp£Ö¼CâO‰EÍá¶…²™ÇÄê—©j\r*rM\råê:ÕXG–2:šĞîäõ4\0‘0*u¨ã]§5(æ€$ZpÕâ@S·M¤\0ñR%Fµ\"Ğ \ZwN´Šh&€iiŠiàĞ”TÈj jD IÎ*ä|Õ8ûUØG4n%8«\0S\"éS*Ğqµ\rü^d\'snqDÑæÔÆ0Û)Åv^¼ÊˆÇ“\\Êl¸jÕĞæòïš\0öTE>¢ŠÊR4çµWyô¥ÔÕº‰úS.ÖéŠ\0AÍ;E.1IœŠ\0h|TŠÙ¨väÔ¡JŠ\0Vë;R¾Æ@<Õ™¦ÚØW+¨]ùÓÏJ\0Î3I¸Õ¯;+YÂU‰y5_ûML@\ZÊå_•m\'UªVÒ-Òœš³ö7ï@›µê?´‚j6±zÉÅ\0,—;OÑySİE8iŞÔ¼§}®¦\Zwµ8iÜô \nm|İ…W—Pt²4ñ»Húrÿ\0v€9‹Ruè\rgÍ¬İ Êƒ]\\úpşåQ“OQÖ1ùP\'\'ˆ/½\Z¡\ZõùìÕÖ:#ÿ\0,ÇåNM6ÕÊ€93¬j j†MWS?uZ½\r2÷cò­(t‹b¼Ä¿•\0y9¿ÕŸŒ8¦ÿ\0ÄÚ_ï×°\r\ZÜô„~U\"é/H‡å@<4ıZNïIıƒ«1ÉwüëÙÅŒKÇ”?*x²ˆ\0ü¨Æ“Ã\Z›ıçj<~ı]«ØÒ1Ñ<[ è´äKà;Ç8g5:|<Ÿ»šõs\0ì(š\0ó(ş¸ûÄš²¾\0äW£yTï.€<ı<	\ZW4ñàX{ ®í”ƒÅOz\0ã#ğE²õŒ~Um<f½c•ua3Nò}è™ÿ\0„ZÈË!ùS×ÃvkÒ%ü«¢û?½F(	t;Eê‡åR.j?åü«cÉ£ÉÏZ\0Ê\ZU°<F?*X@½#•hù\"—ËÇj\0¢-b~T¿fNÊ]Ø}(Ù¢€(›uÏ#^ÙíIj\0¥å5;Éö«`{Sÿ\0\n\0¤!ö¥òEZÆM(·’;ÒWÒ¬ˆñÒ—gµ\0T0JO zU½´˜ö \nßdÏ4¢Û>NqF	 „\0RùKSÍ)Ş€)È‚«<~Õ éš…¢ö É#Bâ0k^hñT\'\\P,ñpk6Xù­ÙcÖtÑòh;«\nc§4ä8 \r+sVÀV|-ŒU´bhÒDYóYpx­!×4æÁ bkb§¥@\"*zWG-° ñYÓÀô ×ZfÚ´È3M)@TF®<uEí@\0óL––§1Ô›OñPHe’ï]›ªüÀ;V;ªÔ 4m¹hÑí.ÒB0kb&Àâ¼ÛOÔÚ6v\Zv¨%P3@,NM[C·› ŒÕ¥“qĞŒmšZ©DÆ§V hiå²E@R ÎM\0Jã+H>hd_öM\"¶r*Xs²ú© Íÿ\0Ú^É¢ñÔrc;ú×Ú?³tâ_[(9!|ÁûWé\"Û[KŒ`ù™¯yı•õ37…aŒÂ€>€+‰S×ŠlìÆÛë@÷¥¥ŠZ\0(ÆsJ)hÑ\nYÎØ‰§ Âæ«]·î\Z€9[×ßsø×5ñ2/7Ã’D®†Ošr}ë;ÆP}§E•Hş@Ş©M^U?Ş5}!È¾ ·kó\0?ˆÔÑ\0 Ç\\Š 1*ÒŒ`P‘\n”Âr)±àU…a@¤Ó#u?-bİh¥I WR	¥hÃğE\0yô¶	éQ«g†®êãKPp+÷G(IQ@¦ >e<Õˆ/^9¦5¼‘7Ì*=£<ĞCg®²	®–ÇVITnjóà¡FA©á¼’>š\0õ(¤\0TñVV<×¦ë¾Zó]5¦²¨æ€4¶b\nÌ¤€\0)ê)<\n\0P(n<qQÎp(	M$)¹©¤æ­Ú&M\0kØE…»n½+.Ípm[¨À \rdàVœóU-”`V”\n3@ N•~5ªğ/J» VëœV„kU-ÅhF2(D^*Å¸¨ĞqRÁÆh.NÔ5—mó\\~5¡zØCTtÑºçñ „|¶íŸî×Ï?¢û_ˆ\"Î¾‚¸“dökÄ5Ko¶øˆdg@—ákA“mÆ>Q[å9ªºl^NŸÇAWP†\0bŒRÑ@	Š1KJ(@§M\"Š\0\0 ¦êx¨òÁ¨Ì˜_¥fŞ\\…+JGØ„šæõ{µ†\'rz@/õñ¦ØH±6Šğ	nP¹y¦9;«±ñŞ´o5‹wËšä#`â€\'Tè{\n±¸6\0íQ“ˆñŞm\0– \0)A¨“ œÔƒš\0‘iàÓÅ:€$¤£¥  ­H*5§ö 	Ò“LSJM\09M<j%5 42Ô©P­L”r!À«°j¤C¥^„b€/D¼U…ZŠÅZA@\0\\\nÜŒ*]¿-6!Â€9-F-³\Z[Ç:š±ª®\'5+@R_‹Ïj+OÀæŠ\0°·SÅÉ&¯[kR)I,\nã¥Q–Èƒ‘@-®¦’¸Ö‚KŠá‡™LÔğjrÂÀĞfÀV”Kòæ°¡ÖIOš©ŞëD”Ğ­^üC‡­slù&By4“ÜµÑæ«Jå^îäóÍaÏrÛ‰ÍY½œäÖ<²hgK×åµF~\\×ªè×‘jêÜoÅxS9®ÇÁzãCt±ÊÜg½\0zÂÙƒÔQöÏzÚhîbVL*ğ…JŞ€0>ÍƒÒ”[sÒ·ØzS~Ì=( [{SÅ¨ô­_³{Qöoj\0Ìû0©¦\0;V¯Ù½©\ZÛÚ€1d·¨ª³Ú)^•Ğ5·µA-®GJ\0åŞÔ/j„CÍoËiÇJ¨ÖØ=(\"Æ*üKÅEx«¥\0J‰íR„ö©¡5d@(ˆÔï³Šº!\'’(?ìâ V‡’(òE\0P\n_ Uáô¥ò‡¥\0Pû=\'ÙëCÊ”yCÒ€3Í¸ô¤û8«íÏJO+Ú€)aNû=]ò½¨Ù@ü¡Hc«F:B”[e!ˆ5Yòèó@|€(1\n¶c¤òè¶Ìv¤òÁ«^]&Ê\0ªb¦…\\1ÓLtTF)|±S˜évPc4]X)Í(·—ƒK·9JM”Ê<ºŸe7m\0W1óFÊœàRdP;qKZvE&3Å\0Fø¨š§hH¨š:\0¥8Èª/nµ§2qTezPlñ\08¬ÙãëZ³dæ³æ•2x¦)­Z‘95ÅÏ4b\"8«HÜU4**ÂH´8bx©b¡WñSÍ\0+tæªË·Z²HÅFÀ\Z\0Ê¸µ#”¨<¢8=kVNR‘Y[&€+ˆûÕˆ·İ«€†/’Ğh7Ë àŠc ÅjÕù¨Ş€2#)Dg0â´\Zß8¨$E\0Qu+ÊUËù q“Jm5V\">å\0wºf¬²¨k¡·•r5äÖ—R@rI®³HÖw®ÔÛG1İíW‘”Yv’$±‚ÍXI6¶3@\Z‘óÖ¦VÀ8ªĞÈ¥jXÎìĞÈx\'½Mk!·|UUÏ54\'iÇ­\0|©ûXè«q§ı¨AÍXı‘uO2ÍmKt8¯@ı£<;ı§áY$)5àŸ²ö·ı•âf±‘¶âB0~´÷uÌgÎ8¥\\µ,®‚AÈ Sé@u£\nZ\0\0§H)hùÀÅU¾;m›dš£©1­ô [vd\'Ş›¨Fo,fŒŒü†£Wıã}jõ¶ÖGVî1@øÿ\0Ok?Îq¸ÖU¢îÛº½sã/†ü‹¶¹Uàœô¯,¶Œykë@Z0¤l©@9¦ÇÓš•~c@D©@ÇJiáhÊjLšj­LÖ€œÖë ù€§.H¸ «í\"9*9®~çG1•İ SÃt¨ç²IÀæò[89§Bz×]w¢g%EbÏ¦4g@‡~å8­=BXHäâªÉFpE4>8 ®Ó[<5ÑY_Ç0#&¼Ì*jõ§$“@œ¥I5#(^•ÊZkŠ‚k¥¶nƒ@£ÚÃš«tÇ8íR6R«Nù  ,kRÎ.•Fİ7[¶p(JÚ![6°µFÚ.kÛ\'€.ÛGÒ´à©Û§JÒhÜKŒUÈUxÖ®Ä½(Ü)ŒUè…V‰xj1@¨ì*T@¦’5É!àŠ\0«|£eC§D÷µ=éÊÑ`´=ë(¶›¨Zò}?·x]ã!Xâ½Ä÷?c²çZâ<ŸªI/© L…\0…SĞS•vô¦>TàT±à¯4\0bŒRÑ@ÚP1J)E\0(Zx¤Zx\0”¹b¯VîA°õæ9Õ¾Åa/Í†ÁÅzûóg_?üXÖ¿äDÜ{Pš\\ÜµıÔ’9ş*±í¨-aù§šE\0H£\'&§İÆ*5 ´\0áÍ8R-:€\nx4ÑK@Å8\n`éN€)ã)‚œ¦€~ZicC\Zm\0H¦¤^j4æ¤^´:\n±\Zô¨¬Ä:PØW¥h@‚©B:VŒ@£Å^ÕH×¥_ˆq@E* ^GzR9©h™×\"ØàŠÎŒeFkg^NEd¢ü´\0n4QŠ(³`½ªSQ,¤u§ùàĞeW?0¦}9\r=ÆóÅFÆx4\0=¸QÅgÏj_5ªÌ6õ¨n=() ò³š£xİk ¸„m&¹»æÃ0 ³ó\Z W5väåW4ÑŞ£[¦²•]8æ¦`OÖâDæ€=§À\ZÀ½·U‘²q]şî:W‚xT6Wil×¿iì·#ƒœŠ\0R	í@B{UÓ1Å(‡USÚ\"ÍYò©Bb€*ù^Ô†ö«_µ/•@íFĞV›Eša‹”‰=¿+6h0x®xr8™<G(\'Ë©càÔí=)›0ÜPënÕyER·ã£æ€cÍ;eXD¤òÍ\0A²•>Ê6P(ÙVsNÙí@vQ²­lö¤Ø(©Ni¥*Ó(¦ì[mjr¢“m\0BR›²§¤Å\0BR€µ)ÜP\nÒm©)¹ ¤ÛRR´ZiZõ¦\Z\0bLçÒ€b—šh¤àS¾´ÒGs@\r4ÂiY×¹¨Œˆ?Š€4m¦™ã–^D?ŒPÛE!\0Š¨×ğùh?:‰µ8\0Ï˜(ÓÈÕ;\Z¡&·n?ŒU)|A\nç(Jf5NLµd\\xš!üB²®|[\Zta@·æ³flw®vëÆƒƒX×1àĞW4˜=j-êzµp“øÄäâ³$ñt…Î	Å\0zx•«\n”]D½XW–ÊãïR7ˆfnŒhÕWP…NKŠ‘µ{qüb¼„ë³·0ê·«\Z\0õ§ÖàÆ*ñø…yKj\rüf›ö™ÛøÍ\0zmÇˆá^C\nÌ¹ñTL0®\r¦—3U†âÜµ\0wøµbd×]¥j‘j¨9¯¹H*kcAñ#é² \'ŒĞ±5¡qÒ –&N¢¤Ñµ«kûtc .{V´–¢eÊŒæ€0±¸r*œˆó]ÓğŸsdÁ¸™!ÏJ\0}ê¸ğíTæPR=*™íÎå4¤y¦3ƒÁ “Gñ†Í]Í•ÊÜ ;¹ÅxËH`mÉ[zGŠšT‘°(ÖUŠ\r^¶“šæô­^+Äx$ÖĞ(àñ@\ZHàšs6ÖÈªËÍ[\r¸POlWVğİÄEw,ÿ\0*ø#Ã72xKâ›”C?õ¯ÑİÛÍô(E|!ñ»CoøÙ/\"MªeÎqï@zxzøj·$¨«Ğ3šó‚zâj~´Q&öÚ;×¤±Úø \nsN¦§Ju\0(¥¤´\0g5GTÿ\0VúUÕªzªŸ²6=(ˆ‰ëWR¥qëYŒÛe`x9«1H9é@÷Åmu\rÈ‹–_.º5µËÄÃ5öUì#SÓæ‰Æp¼WË1Ñ›OÕæÊm]ÇÏ $ñVU6šdK´Š°>c@\"ñOÛšXÇ§Š\0p(\"ŒÑ°úPE<Pà´\0™\'¥X‰Êõ¨—ƒRhÉ*ãZK—<T±¡ÍYå nóEN`İém	$^ˆ@cÈª7–08ç •àŠ{ÒÜhx$¨¬›‹f¶nGJ\0¦ÂÙ×Q¡êÇ!X×4çÌ^XÒÁY…\0z+Oæ&G¥@2Æ™ióD9íW-âËt vq+~Ò,T,áq[vñ{PÛtàV½²|µFŞ>¯n˜^(Ü	Z­VO¥_„PˆÖ¯DµZ5«±P˜×¥ZŒb¡Œcb1@#ëRH½)Š:b¥n‚€(ÜŒŠ’ÍvŠ\'\\)ğ#{\n\0ä~$_¬* òk?áÜXA)kœø£ªo8clØÅv^ˆ&	Ù¸r(qQ#õ©“(ÔQE\08RŠANZ\0zÓé«N š~é§TSHP`\n\0å<K¨ıŠÊvc‚¯–üI¨>­ªÈI$¯qø¯«­«!}¥…|ùª÷,ùÎã@J\0¾Õ:­0Ì*p(Ê´à(–€S±H´ê\0)@ Râ€\np¦ÒŠ\0x§\n`§gŠ\0V4‚šiTĞÉRµT«@#«pŠ««©â€/À½+BÍR„\nĞ€b€- éWâ^*œc¥_‹îĞ\\S”â‡¦ô‹®œ‘Y‘.V¯ëd–ªöë• ¼š*æÃéE\0Ng¦›Œw¨\\b«»b€.ı«èó÷Ífùô©) ñ¹-Ö´`‘lry­xx oÎ×)|sšéõ&ùMr÷œæ€1d5FV¬ºdÓ\nf€!dÊÓJnM½êÖÏ–£A†9 ¬œÚİFAÇ5ôO¯Õ„y9 WÎÓ¦\\2ö¯Wøa¬àˆ]½¨ØÌH¤Å:5Êîõ§í Íj@´»h<QRm¥Û@RÅM¶­\0Utt¬û”ñZì•Nx³š\0Ã‘9¨ŠóWæ‹«•õ æµm—ŠÊVÁ­i(Go¥.ïjjŠ/®(¸€÷§àw\"ìÄ(sš†i7Ä‡%‡çQ½Ìø‡ç@Îi¬OjŒßÛ¯ñÎ¢}VØuaùĞÁwriÅEg¾³j½\\~uZM~ÕsóÎ€4ÙOjAœV+ø–ÙGŞV“ÅVëÑ…\0t,\r Ír²x²?ï\n§/Œ•~é ÙE¿šà&ñ»àÕ<näœ\Z\0ôÃ\"õ–1Õ…yƒøÎSĞš®ş+Lá\0z¡½z°¨ŸQƒ<0¯):ôî~ñ¨ßY¸çæ4êrjĞ\'ñÎªI¯Û¯ñÎ¼¶]Vá¿ˆÕV¼ú¹ UoÛ÷ÇçUÛÅ0âæ>dÇ«šäoïš\0ô™<[ğš©\'Œ1Ğ×Õ©\\Œõ ÆO\Z0èj¤¾4+“••FsPî\rÒ€:gñ”Äñš€ø²à÷5³”¼‚€7Ä“·;V“]¸nŒk,“”¸>”eõ{–ş3ùÔ-©Üæ£(Ş”ÍŒN\0 ’ösüf k¹OW5;ZJ„ÔfÂSÚ€(O4Œ>ñ¬é·ËVéÒ¥nÕÚòtÎÊ½~jÎ™Fz×_ÿ\0ÌíÔ\ZkxFFê(‡rƒ­Db¹Ívíà¶=EX‡Àé€Z€8%ˆ\rL°·¡¯H‡ÁöéÕhø^ÕGA@b°6~Uæ¥û5Ãü«Ñ‡`ŒîUÍ(ÓË?Ò€<ù4ë–?pÔŸÙ× }Ã^†¶$–?Ò¢–ÒP>X¿J\0à“M¾ú‘S&‡#˜®¢[;’~X¿Jh‚í:F*\0ÃÃÇÍR2:ÖäiyŸ¸kF[ÆtĞ—¥M¦JÌ;Gjîtï*(ù¬è´Ée8pjÚxq†zĞWk$wi¸´Ù`RûqšÏÓíæ¶À9ÅlÆT‘»­\0gÍ¦+gŠÍŸI•Õ€\Z£’Ô0 \Zmš¡q¥2TW{%†OJ©5†Ş6æ€<ôÚ¸8e&¨İéÒçt`Šô)t°vÕv²^…h•Ñ¯®¬]C1Åz^›¬ˆ1ä×0ÚZvâ¤¶ŠKgg€=İƒ(lÕ”›µrÖ\Z‘ÀRknC€hb6Â’Q_?şÑ^:›ö¸cË İœW¹EqÎ*ˆ¬\"×t›«y1òÈ ı˜üJa˜é·dÆq‚kêÃ.÷Ïjø?@işüGq&c†Ixì:×Ü:Uâj:M­Ì$ê	Å\0k”ôúÔ*ù¤R(aKL—4\0ğ;Ô7Ã}³}*uû†£q¾İÇµ\0y^§/—zW8æ¥·—æ³¼NÆDö¤³¹Ş£š\0é¬®AÈìkÌş\'øx^+O\nr9\'ÜÁ/–r\rIª[¥ö*°ˆ4òÀdhÈåjp¸­Oé/¦ê2’¸ªŒcp ¨«´Š•2-\0(ı¼Rí¥ öÒm©qIŠ\0Wš•i¥jHÖ€%AS)Å5Šv1@#<Ô‹å¦ÇÈÁ©7ì ü‘ÎEbë\Zz¼lÁk _˜f²õK±²š\0ávl,*ÅŒy˜QÜŞw5§¤Û— ‘@-ˆ>X­Ë(³+:ÊƒÑYÛíŠ\0³m#ŠÙ¶ªÛEÒµíâ 0GÀâ´­Ó¡‚.£Xf1V£Ô1-\\†<š\0³\nò*ê/JŠñV‘y 	¢«J*×aE\0KÁ¤”ó@^séD§pãµ\0W‘°Ô—[Y$n>SN3,˜®kÇúªéÚs\"¶	ã%¹7¾$å·.ş•ìBšl@p0+Â,]¯µU”ó—¯~Ğ\0Oˆ{\n\0ŞQòÔ°¶¢‰²*E458t¦N\0ñOZŒ\ZzĞ‚MÓ¨\0ª×R˜ö©É¬½ja›päã\nhå¿~$/yåFøÁéšò{\rkj©cZ¯Î£¯N»²\ZäbŒ¢/4èv:ÒK…&¶#¹CŒ×—Årñr§šØ°Ö¼Ğ¢#dfÖ¹ëMr2 1­H5åèE\0h*KåŞ¢œ`ÓÕÎhş^)7Ú´ì/z\0ŒsNÆ(ÆPN)1K@h´Í\0H¢¬F*<b€-D:UèFqUa^•¡çràUè– 8z4 	¡^™«`qQÄœTøâ€õ¤ÛÁ4­ÒÄ,DĞ7©d9ªğ˜Ôëöİ)¦Ú)yTPˆAÅ¢¶d¨8íE\0cËÁâ³¦Vü¨â³gƒ­\0djH²jg‡±GÎ\0[³NkY:UXöóZ\n8 ıG•5Íİw®šüd\ZæîW’(34¥)á9§0 Š|µ	ŒŠ¶ŠFPM\0UHòkcÂw­a©ÇÎjÎ#wİ¢Õü»¸Ø	æ€>¡Ò®Í”L9È«€W/à‹áw§ +©ïŠ\0)qHÇhæ•NFhqF(¢€QŠ( \"¡•2\rMº‘†E\0cÜ§ZÏqÉ­k´\"²Üá¹ ‚óš9–1É¨dpŠI¬-KWX\0ĞNÚ¼q!%‡?‹‘€zWs©K3aIÅTŒd““@mÇŒˆû¦³åñ”§£\ZæY7)¢\"€7åñmÃ/j›øàÿ\0¬ö€Î*»Fs÷M\0iŸ\\·ñ\Z…õ‹–ş#ùÕEÏE4<Â\Z\0˜ê7ÕÍ1®å=Xşu\nÆç¨ÅYÎIp@›‡=Xşu9a÷k@h³±û¦¬§‡&#$\Z\0çÙ¥õ8¦\0İÉ®¥|;#ö©†<Š\0äYF9Í@Ñ©<f»áBÃšÂŠ‡æÅ\0pşXsHxè\rv7^TÎ*’i	»P3ºOá§ŒJW•5ÚÚèÖà\rê*ÉÓ­W€¢€8­ÑMÎsÑMwâÊØ\0ü©Eµ¸è¢€81cpxÚy¦¾rH85ßˆaaEHĞ¡tP‘2®H5Ø8nk¿{pË€µ™.‘#¾Tq@ÜZA˜\rÕj=\rïb·F•0_—ƒLm&è÷4”4È®)­en=+E´k£ëMşÁ¸=s@âŞÑzHbµ\0­”ğãmËõ¥]Aù¨–Û²Ó6Áœ…ı+«@ƒø±SbÚ/\\P*·Dı(kGo¸•×Å§Z/aS‹kd@7öuÉû«RÅ¦İƒÊ×h+Ğ\n‘^1Ô\n\0ãÓN¹\'•ı*Ôz\\Çª×Pd‹¶(§lP:4YğÔ«¤…y®„\\(ô¥ó#<÷  «uÿ\0øGÓø…nyÊ:SMÂš\0Æ\Z9äS›B€tQZzN)\rä~”˜4x—¢Ški1t~U¤o¢ªÔ#ì(<éQt~UéQÿ\0tU¹5S—PÉâ€+9W¢ŠQŒà(¦›âM)»Í\0\\ÚjÜ*3È¬¥•=ªÂNË@bØv¨\ZÔÈ<Vq¼qĞÓMä¤u \rBô5,5s¯u6zš³k~Ê~j\0ÜuÀ¨ÄaòXScºŒTë€9 \nï7¨›MFçt(\'4æRzPD–\0t§†^k¬Ş¥`ûP±h›\"´-İ—\0Ö‰OZˆÛÒ€­jh›fÚàÕ-…=I^½¨Â¾<x,ù±jv)‡C¸•İü\rñ‰Ô´¸ì®_/ã×[¯i‘ëºMÅ¼ÊŠ¹¯Ÿ<5y7Ã_<7€ˆ¥~3Ó­\0}r$Á>™©’LÖ.•©Å«YC5» ñZ*û(A5 ªñ°ÅL\n\0›vŠbŸİ°=Å!;†E lœ\n\0òŸAåÎ\\z×/cxqÖ»ßˆ–l¶Í «Ë,.Bä7­\0v¶×^`5­»Š¡èk°¹Ãç<Vı¬Ûs@§Ä_	ãó¡_~+Ê2·Q_J\\A©fĞ0Èâ¼WÅŸG»f*J“š\0æ•*P´‘üı*eLœ\Z\0hRlæ¥+ƒŒSÂf€ ÙK°Õ€™§¸ \nëjeªEiÍJ±æ€«Kåæ¤	ŠzŒĞ*„5+¦â*~	ÀëI!Ï@\r,°ÄwW\'«Ü	¶š¿«jÊêR3Ísc|®sÎh„Ë(×é\Z~VvŸ¤»H¬Ev¶6~\\`P–V¸#Šİ‚.\0ÅVµ·Á­{{r9 	-¡ö­kxºU{x¹­HcÆ(xcö­“Š†àUÈĞĞ±%hCµW†#Z.(T^•aW¥FˆsVPt 	#:Š*a@\n0¨7m\rHıA^Sæ¸	@ÆâÚCØW†üL×İËBÆq^§ãÁáoËsrÀaOZù•|I‹/$º€å\Z\0ŞğÕ¾\'Bzæ½×Iÿ\08Ç°¯\ZĞSlÉõ¯eÑ˜5ºA@‘’ f¬)Î*°`ø¦U+Š\0šœ\r0Ó ŠzšŒ5=(uéJi«JN(6<×%ãûÓg£ÏƒŒ©®­›-^{ñjàC¥OQ@ønµ›‰0H,k!£t\"½&M>9¥w e«2ëÃşfJ\n\0â\"Îï›¥Zûµ©u I$\n m%¨4¼ˆx&´-uI ÆIªŠ§½‚€:‹/ä|æ¶í5xä#$W›î*p•rŞíáîhÔ¢¹@0E<òx®Ó^òÈk µÖ–@9 \ráÒŠ¯än£TêC\r\0-.8£¥\0çŠ\0Jri6Ó—ƒÒ€\'Eâ¬Ä™¨#äUè#â€\'…1Š¿\0éU£Lb®D¾Ô¡éWã^*„*x­(†áÅ\0XŒT‡¥B­ƒŠ˜ƒŒĞq“Q^ËåBELƒ&³uy€R(˜ìjŞ•ëµSTâù2MnxzÍ®/× 4ÙG¦\ZñÛÒŠè#ˆĞ{Q@`Ã\"«J™©ËÔls@$‡=©\"ƒ­°§F£4\0‘®Şµa[Šhé@ï ×=u÷oİ\ra\\¯&€(Í+-=WšqZ\0`\\­&ÜŒU…_–¢èÔÍŠj¡µ_˜ñP<yŒø Yøe¨ƒ5êCÖ¼áåé·¼T\'×¼DÛáVÅ\0HFá@¤^”Å\0:Š( ƒE\0ÜbÚ‚h \n7C­cO€Ç5»p8¬[Ô (Ö/ü¥ \Zâ§»iå9­mnrf*Ma„É \0qÖ¥ƒO–áú\Z,b3Ì\0é]ş•¦Æ¨¥—š\0æ­<6îV´ãğ†îH®Á DQ´T¡ˆ\n\0äG„\0\"œ¾º×Q½Ër)L„P?†`ªŠshVÀòƒò­–rj2»&€8MkIHeÌkZ\Z%„,œ\n¹â(¶Û–k°ÔšÈÎ(ª”[Bz*»jvëòàW36¬YÎZ²§ÔÂ±;¨¶7ñÿ\0\0Íıq¶ZÚ3aÚº+MBŞ\\\0Â€/<ÒòÕß–äœVÍ´Ê™\\\ZyµÉÀ„ĞI ùª4ÓNs]ØÏaN[Fî(\r¬ÙWŠ|Ve‡Ì+ KE=j_±¢ôÏ}„zP,í]¶QIä( !`3Ò¥#ÒµÚ5\0š€¶3@~Æ¢—ìê*ËzTeXĞMlpqQ˜D}[5+£qÅWhÜğI \n·š¬VhKÅs7>†İŠ€+cVÒ^â#Jó_@xä%‡z\0Ú?üÉ0£ŠÑ¶ñA¹\0Ö¼ş=;Ë9Û[z|‚\"Ú\rFIËša’w=M3Ou+b8AÇË@#Y»“S„”¦´£€zTGµ\0f,2ôónõ¢!9éNò¥\0fÖäIëZ\"#éKåJ\0Íò$õ©6“W¼£éGÙÉí@\n7­0ÆŞµ¥öcéMû)ô ÓTe	íZ¦Øã¥7ìŞÔĞ“Ú¢h\rn}”Ô}“Ú€9Ù-¥@ÖÇ°®¬·v¨ÎŸí@×Ù	íO[3é]°µ(²µ\0`­»\0©ÒÕjÜ[5ôf;Eô ±\'µ<iç=+£[eô©²ôÅ\0sGL\'µ7û(q]ZZ¯¥Hm“(•KW‹ ©ã\rüU¼ö¨{Ui­@?( ğqO\rR´¨™H ŠP* qR b€´š•h±¨î¦÷¿*R¹©\"zĞ3˜ĞšóßŠX²kûtİ4c Šõn·*Ç¸ª‘(=½ÀÊ9 ,øCâç²\r¦jmµ×å]Õí>`@ïæ¼OÅş—HÕ¥§.Õ\r“Šï¼âhõKEŠé±\"Œs@ÌRîPE[6ƒY‘H íÕb\',Ä”¥´¨ìÕH˜‚@éSä@^2³ûfàñ_>ßfÎñ¢s_MİÛı¢ÕÔŒüµóÏŒtæ³ÕØas@í.ˆšè,.Ë`f¹($ÊÖµÓ@Ã=(¾°¹10lÕŸhğëºk6IŠçtûÁ0\0šê4Ùö|¤åM\0x©¦I£Ş::3P˜Ë1k×üeáeÔÃM\nóÖ¼¦æÚm>cª@Ò€$#‘I·§1PÉŞœ±š\0‰R¥T©:•c 6R*â§	G—@„Í4¦*g!Mg\\ê)rhy&HW,y®wVÖ8*¦©êz³;‘â³	.ßœš\0ˆH×ñÍt\Zv–eeb)Ú~ŠA–ºû5‰\0Å\0Gmd#QZ°FF1LHÉ5¥k8È 	-¢5¯l‡ŒÒ[À\0Uøc¨X\"ö­£éP@•¡\Zt 	b®Ä*(–®ÄœPĞ©«h¦£‰*Ò-\0J‚§E¦F*Àâ€V”œRç¢vë@™ÎğJ±\Z/˜„zTQ¨lç­U¹½û#|ÇPËŸµ§ŸL³m>7À<`\Zò‚\Zâß@afù˜×aûSè3j¬÷€£&¾~ø7¯6•âµCâ€>İÒãÌ•êÚƒ×“hW|‘Ê‡ ^¢>ÈÖ€:e;Z¬-Š¨’*äl6Ğ¨iÆ£SN=(ËÖ§J¬\rL†€,­#r)ªiÌx OZòŒ·è!sÚ½a»×‹üb—÷8Í\0x¼9#5n5ÍCh Æ\rN§€\ZÖk+a±Š£{¢ÆãäZÔÜIâ¤ÿ\0\0qZ®JŠÇ¹°’ ×©ÑÁV}Ö“çå 0ÚTò)3“]•÷‡6œªÖ-ÎŒñd… Øãç&®GtaéU$ŒàƒRF¡ÇÍ@\Z–ºÄ‡<WCi­p75qÁUOã;\'İ4è°j1ÉÜUåtuùO5ævú”‘‘’kvÇ\\*FãÅ\0vQ‚:Ôë·½aÛë	69­h%I1Í\0]sÒ®À6õªğ¯¥]Š2Ôr¸Š¿bªÀ„b¯D¦€-D W`\\Uh£\'uÜPÖ.sJçš~c@\rÎ“\\î­6_®‚íÄPŸ¥rr%4\0Šû°+¾ğ…¡ù[ÂÙ@d™F+Ö¼/eå@¤Ô¾±|¢Š±Æã$SH§škPdPÓA4hu9õ^*%8©7àP;Å¬;…äÖìçvsYKÏœ4\ZiJ@N•®\Z§\n\0¤(Z\0„®áQ±ÀÛVO\n„ \'&€.øvãìúœ`d×Ñ:L¾m”gÚ¾iµ&õqƒ_AøBäÜéˆIè\0t)sÍ.ihJZ( Š( · æ‚)1Å\0W²¯ Ö´¼õ¬{äĞ™ëÄ­ãcÖ±–RÒ[~&&$W3™“@O‡À7>µé(%\"¼·Ãóµ.Ozô¸eİ\núP‚Ë‘Hn\nš®C8&€\'ûA<â˜fÍBdì*—š\0¸¢’u^õ\ZÊ¬­BèGh¦»~¬¦<×(Ì85gQ¸ód\'5‰spFph+¹Â±æ³e;ÏŞàÓ¦>aäÔ\'\0b€ÿ\0ºûÍX´¿–\r¸àUR›i­1@ƒ¡x¤nXİ¹é^ƒi2MqƒšùşÙÌ½O\"»Ïø’FœErß/½\0zŒ@9éSÉoòeE2À¤À2Eh\0a´2†àT‹óV¾Õ¹£Ë¨ v‰©†5´b…0Ä=(ìîi¿e>•°SĞS6P_Ù°9y V™ˆ\ZoÙÁ ï%}*,ûâµ¸²0E\0d,q°*Â°u­nC^ÕØ}‰sšÙ”Œ@`m¦1íª&‰³Šõoøy4±¯Í\\,¶.®VEÅ\0&“r(5ÛY–1µÄGfc®§I•U4µ\r•a`$t«pÂY­ClÄá…\0g-¿µ<ÛqÒµM¶1Oû/Š\0ÆãÒöjØ£Ò¤€ö 1n=)\r¹Ï·şÄ¾• ´Œ”Î}œúRı˜úWGöXÇj>Ì”Î}”Ô¿aö®‹ìÉéMhtÏ‹j_±{VÑEDÿ\0/J\0ÉkMEFĞJÑ“æëU¤\0(=ã¡l\n³)àÕV>´\0ĞÜÕ„5S<ñR£‘@¤^95]š™[40|Ó¹5À§† d4Ò™ëSn£ë@\Z {UIaëZ…Bñƒ@,˜ÍA¿ŠÕhG5J[l1\"€#F©ÔÕ7§Jts°ë@™¶*HÎàIª«0qÍJ­ØP‘Èñ1ÇCVAşaÖ wZ_h î¬c¿ ™C;×™ê»ğıÿ\0Ÿi‘ìñ^¤E‘Ç}nb•Aë@\Z¬oaQŸœu®š;€à*Ÿ›½r£L:l„Ûg¯ØNñ¾é:š\0ê¡m¸ÏZµ¸cCtƒšĞGÎhépzó‰š›jf‰yÆx¯G±ªúÍ‚jNŒâ€>[¶v³}²úÖÊJ“ +Rx«Dk;çùHLÖ<LÑãfq@\rœíÎk¥Óu\"J–<WÚmúÕ¸/Š0÷s@©gqÄ{[\\ßŠ|#\räM4\n7c<St­ID`fº[Ñ0ØÜƒ@5“ÙNÑÌ§¬`Šõ½gÂÖ×¨Ò*ç¦+Ïµ\râÍ˜í;GJ\0Ç	ŠP¼ÒnØÛdâ’{˜¢\\’(Ì8ª·BÉ¬»İ}+æ°/5YgÎ	 \rKít€kŸ¹¾iÉÁ5vÒ\\?ÍkjÓER\"€(XØXfº{\r)c\0‘W,tÅ‰kEn\0é@Án£\0\n¼àŒt§Å\0qW¢ˆ1@\r†qÅjÛB*¡Æ0+Bù GW „ƒÍ6$>•z\'­\0K|ÕèãTp§5z4â€]*äK€)±­XTãŠ\05éVUj¼ïV¸(XÖ¤<S\"$}î”Là\rÃ¥\0ôÌæ¡ó§äéV¢xÇz\0hÊ‚Ã ®S]½3M„=+oW½û,LŠFH®4ÌœÉÔĞñKÃÉ­øjq°3ì5ù÷¨Ú?…¼NTeıkôÒKo·ÛIŒ‚¤s_|øq>Ÿ©6¡g`mÙ€=§áF®o4[vvÉÀ¯sÒ¥ÌjE|mğ\'Æš;ÛN0M}w¤Ü+ÆYàŠ\0ì %”\Zµâ³mf)·wJ¼X–>”}M8Ô1¾qRĞ¯Z™MWš•Ö€,¯4óÒ¡V©9Å\0!èkÄ~2F|¼ö¯pÀÁ¯ø¼7EƒÒ€<ZÈâ1V—“QÄTm©Â\02:Ğ……Ji¨22iãš\0pQN(\0Rà\n\0cÇæuV[ä*şi…yÍ\0swº0%V¹û%á\'h5èd0j	,ãÀP™<L‡æÍDXWuu¡£’TV\ræ„ÊIPh(=)ØaĞÔ¯g$\'i€6pE\0Morñ‚kvÇXt 15‚‰W\"Œq@ŞŸ­+¸×Ke|³.TŠòøIAÁ5­eªKo€	 R¶pØ­8@®MÖÏÍuV:ªIŒ‘@,dSF7\Z§o<n\"®ôŒĞ¥EıÒj\"Íÿ\0-VïPXP„<Ğ=Vï\\Ö,kæ6M,Ó5ÄÄ¿J’%Â§9 \r­ÔIp¹ëÖ,![®8®CÂšZå^AÍv·, Œc \0¾a¢²Î €h 3fÅDÏC·]€%/O^j°jš7\0P‚Ÿ»å¨‚œ®\r\02LœÖmÈëZÈ¬Û¡É à9§é@ÓØP\0 Šp@ëQâ¦\"£\"€(ÎÆ9CZ÷O†÷~všÕá×Š6“^£ğ¾ü*‰ VÎh+’\r ë@¢Š(\0¢Š(\04„ĞM1¦²/rsZS5fÜœæ€<ïÅrMqAö±¯CñDcÊc^o+\0Æ€54{Ï.éyï^§aqæ@‡Ú¼^Ò]—*}ëÔô;öéÍ\0t^n)6*“µ’ñÖ€-¬üäÔRI¸ñU‹åx4Àš\0³æ„^M`ê·³ƒW.fààÖë±\'4“s.	¬©äÉ«·Gæ5Ÿ É \nìj6ÍNRšR€!ZV\0ŠR¸¦õ [\"ˆ¯¤´•Y	5#&j!\r\0{\'üF·Q$nÜ×¢.ÈèkæjriwhI f½ûÃš²jvhÁ²@ \rœdæ–£i¶Úy £™ Ğ´S|±O¢€åŠ<±O¢€cP©( ü¡G”*J(¼¶‰*ã9®3^Ñ¹d^+º\'ZòÙn\"9â€<É,”ÍMo•(#¥\\Ôb6óS~G½\0vºT‹*¨­\Z‚¸İ\ZìÆà]Œ2	hÛ¥.¥ Pmp(Á£\0f–›¶œ:PEP\0j\'5)éP¿4=j¼‡­N{Õy;Ğg5ZCSÉU¤ \n’µYªÌ•\\hÖœ¦šG4á@£TèÜÕe©PĞ iêj\0Ù©ĞÀæœ)«N€£e©(<Ğr•¨5t¯EŞ€3¦ˆÕb#¥lI*¬‘ó@crjt¦xCb«µ¹Z\0·ã:ÉšËåMJ“‘Ö€4•ûTÊ02k1\'Ëf® W %ÆªSÚå*hÛ\'9«>bã€3ágCƒZ–×=3U!ÔT@•<PA±ƒS3_›¡¬‹k‚1“ZjDËŒô Çú$sÚ4Ñ¯8Ïâ¿hÚVQ‚=ké»»D¿à~x¯ñçƒ&¶¹y`SŒö mg‹víÃaoá†ÌOiuÉÍgK\räMüX OÓ¯”ãkVÌZêÚ0,ÕåzN£<,LÖ½ôòÏS9Å\0zşŸâËY”uÍhH-5HÈÊó_;Á-ô3¥°+¯ÒüIu¨$ŒP÷‰üä3Ú}«ËuMS·f®V½I|Y!\0Lr*S®Ø\\.&‰I>Ôá-a<·Ë`ßJÑ³Ğ.$ÆäoÊ½YÆ—+–%éVí„Â¿•\0yí¯‡dLü«R-)Ğ}ÃùWö=•*°dßÂ´ÃÁe\"¯Ü5i-ØuS]–,ñÂŠc­·eÌÇ	îµz¥_o$SĞ¡à\n\0aÅZŠ<\ZzÇš(ù 0GÀ«ÑEPÀ•~Í\0Iuv8ø¦D‚­¢PÆ•n$ÍG\ZÔëÅ\0HT(âŸ–4ÅRÄUèc\n9 \0.\rgÜÈIòÓ½X¹f\'Nµ´ç2u ³·Û;ÔZ£i$³0êİİÔZt4Ì^ñ#Ç­©ÌÖ¶o•phæ¡ã³y©º†ù7zÖİ¦¡àC¸f¼N=ê7’wšÒ²ÖnlÛïP¶‰„dùÎxóÂöŞ-Ñf…£S.ÃÚ³4?Æà%Ãsï]ÜRêÃkPç¼Öw|tV@ÑÀeü:×Ù_µñ¬iPM†;Fq\\oÇÿ\0…I®Ø¶¥¦Ç™nÊŠó‚ßdğÎ¢º>ªJmm¿5\0}©§\\	â!¾ğ­k)°¤5r:UÊÜCÍ»e+¢†@@ ĞÄmÍX\rÅeÅ/#š¶²q@A§©ÅWW§îæ€.ÇÍMÚªÄõd(c\"¼“âÜ­²zÑ5Â|I°ûE8Î\0|ñj¹51EL°y3:1FÎh!òñOZy”¡9 —4à˜¤+@\09¥4(À¥Å\02ŠqÜPÁ­r)ÁFhOJ\0Ì¹Òc“8²nt- ²ŠëmR$Îq@{&$}TÔA5éiQÊ8Fo\r†åV€989ÆjØLã¥&…$g…5Yí$€àƒ@;Ôğk^ÎêHˆäÖlYR2*ü8j\0èíu¶M šŞ‡ÄPkˆXIÁz/€h§Ÿ_2Œ)ª>t“6I8ªiNM]¶S)E\0>A…~õtÒ^éÕj-#@–êUŞ§éš>–)Æ 	ì¬Eœc¨uk¬BFy­9%]§5Æë×ŞY`×¹¹ïEcC“Íì:Uv<Ô^~hó3@©æ•ßoJ‡Ì¦<ô!Ô‘ËëUüÁHæ \rÙJèjİ»‚*¡œñ@j2ÔöéKŒ\ZS@ŠSÒœGÚ\0a\n˜ÔBó;k¦øyzĞê	8æ°&\\jï„äòõ¸ÏAº€>’·F§ÔR÷¨mÌµŒîÔª(ÔQE\0„ñA¦çš\0c51›ŠY\r@íÅ\0C1÷¬ë†ëW%j¡pzĞ)âm[kË§l9Ö½O^‰»ñ^U©|·\rÛš\0lm¶E>õèŞ¸İà×˜—é]¿…gıØ İäÉâ™#ñPG(ïA—/í@Íâ[DYÛsâ8ıñùÕ?\\<vä£^i=ÌÒà4ë¶z ¼!İQßÉïXÖdçŠÔ¿l¹€2%mÄš¨ãš¹0Áâ a@FsšœŠM¢€#eSsRc­&Ú\0c€VbsÅXaQ‘@îF^¢½áŞ·å:Ã#ãñ¯>uãµgJ¹:}Ú>ìĞÒÃlŠ®¼µ\"œŠÁğ¾¦º‚á²@­ÕE\0:ŠLóK@˜¥ Š( 4”ê(´S¨ õâ—±´€äĞ9¯XÀ®PG‡ ö¯C¿ƒÎ„â¸[øŒÂ€ c£µÙiW‚HÀ&¸‡l‘ZšMæÉ\0\'½\0wŠÙ¤â¡¶”K\"¦h7{Ræ–Š\0LÒÑE\0QHh\0=*©MBâ€\"cUäæ¬ÍA!Æh£Uy*ËÕY{Ğg	©Ú«É@°É¢ƒE\0=zÔ¢˜µ*Ğ–¦CQ­H´*šRy¨éE\0J\r;5§”\0êa\'=)âŠ\0‰—5ZH³WMDÔèWµ3nîµvQòÕVÒ€ xUw·# «êjÂDµ\0b•(§5\nÈÁ«nâĞõ¨µ¾J\0HïŒVcdç5›5©íP£<G4Ğ$ÊxÍHT0â¹árëÎjdÔÊõ4®	SÅ^³œ³mÍa&¢¯Ö¦[Õˆ†S@ÎÆİ÷Ö©ë1jvŒJ†lQmv—‹†<ÕŒ*hÇ5_ˆ®[1ñŸJÉ›GG8òóøW³jºLwq–U«—L0¹{Ğ›\\ø|¡İ\Z~”Gg*.\n~•èOf;¦j#d§ø\0qpYƒ÷£ı*_°(û©Šë³×²Ó>ÃşÍ\0rmdOğÒ}‹bºÃaÕX{P4¶\'¯JSjã¡®¬H\nŒÚÚ€2b†AŞ­(uîjÑ€Ôİ„Pk$€õ5j6fêj%Oj•Wev3Vãˆ\n©Æ*Ê>xÍ\0[EnE«·\"€4\"AVá5R*´E\0_Š­(ªUøèéR¨É¤XóW-áÏ8 	mã\\ÓåÈáiÅ”óMMÌÜ(±E¸äŠY#·Rò°PzIæKXZG *Šñoˆ_Jo·´n\r\0CñGâ\0]övRg·¼†Ö•ÄÇs1ïAGÕf3Ü1bNy«¨¾PÚ:\n\0nŞw”Ñ*ÉF1Scpª²FCq@Y[|oŒVæŸâyívÄÄàV$9jV@yš\0ôı+Ä6º¥³Úß°eqkç/Œ¿§Ò5?í¯ÆHqÚ+¾ˆÉ†G+Šİµ×Åå»Yj1‰†2ÔğGâ½³OÕdÙ:\0¸c^õm!\0á=\r|¡â/7‡õaªhÌTnÜUkÙ>|DV·ÛQm³(Ç4ë‘8ãš¸CXÉ(`g ÕÛi1÷\0i©õ©U1!,3Ò­nM£iæ€-Dİ*âÖb>\r]ŠNE\0\\\0qX-·\Zt˜8­Å9¨/íÄ–²ƒÏòî¥†şU#ÔqÖºOiÆ\rJGÆkâócµ\0A³åÍ0/5`qòš~ÔÚk)«[)\nĞB¤RV™A¨™(\n)ì”›M\07eHœRˆêXãäPgµN±æ~Õe#æ€eM]r9Eµ\\Hı¨·Ùú­C6…ã;kY\"«(¸4Äİh„ìJ¡ıŸ,M÷\rz`‰~eØE!û¢€<ıc”`m5n+y†\n©ÍvÉ¢ÄßÂ+BËBPÃ)‘@†—qr@d8úWq¢øX.Ö‘kvÇMH€ıØ…oAU\0PvQZ…­“pÁéQ$;›”Ë™Ö T\Z\0§ª]í5Âj—\"á›kc\\ÔR5`Íú×\r=ŞùK#dPæÉ¢£ûsQ@@ôğp)I\0TNø iqQy»E#f˜†æ€-—Å\nıê|RyŸ-\0lØ¾ãSİ/›¥ËºLV½Òå(i\r9¸cI@	ŒŠLSûRb€\ZE1…JG­1…\0W”qÍ3E“ÊÕQ¿Ú©eRET¶>Uâ7½\0}\' Ëçiñ·°­:ç¼7›¤Æ}…t\rÒ€ŠnM!|P\0æ£fÀ¤f¨ø ’J®ÒQ#Õwz\0d¯T¦n¹©ez¥<œP.´7BßJògä¾µêú™İ}+Ê|AÄÍõ v—¥uşŸ8®ŞºŸ	MûÀ(Ò¸Íj0ß  6E\0aø¢?2ØçÒ¼Ô:-Â¡õ¯VÖ\"[6}+Ê. Æ¨ª?½@©á¨Õ,¨¨µûÆÅhh–şV˜„úUÁ¹Î(1†j&Z²Sj7Z\0ªVšV¦ÛM+@ì ®*m´ \nŒµ-Ze¨Ù8 \nçÒªŞdŒ§QW@àæ¡TÔßü7ÖŒn°Hİxæ½„ÀĞ×Íš%á°ÔÔàf½ÿ\0AÔõŠ89â€4öóN Ò\Z\0Z)¼šu\0QE\0QE\0QE\0#J\0ÅéOJ\0N\\·ˆ,8.¢º…ªº”\"kWÈí@iÜŠX$1Ê½ItTÌ=ê20P¢ÏæBy­nõÆèØ!s]„græ€EPEPHii\r\0 ¦È8S\\ĞvÍU—½[z­(àĞR3UäqVˆªò¸ \n¬*´ƒš¶Â«H(¹bœzÒP­J§j iëÖ€\'¥¡Z•hô¢›šQ@áLœ(àÒÓh \Z†jJiö ¶äàÓ$„cŠ”ŒSrM\0R‘v)ÑM³­K\"n¨\Z:\0Ù´U¸µö’¢«ÙÜN3ÅmÃ*ºó@ü¶„gŠ£%yÅuÏl²tN[<gŠ\0å\ZØtÅW’Ë®+§“NÇ UImŠö i téš‰šQÁÎ+ híM[“9‰ÜÖìŠê4ıH\\Æõ¬–²nÌqWc³û8(óÜ|»P\\Û¤çpŸó†ZvÃ—-‚öª=–·HÏZcFj\0Á6ØíLû7µn›Pi¿d”ˆm½©kí[âĞzSZÌzP:ÖÕZÚº7´éP›@{P5%— ªíf}+©k<ö¦}€zP2,È(6¤•ÒéQµ–{P=äOX˜0â·>Âj_°{PXSÅY„E_[jš;j\0d\0àUøšX­0:UÛx0zPÁ~(úRÃµ^(\0Š,â­¦\0Å65ÅHO‘¶àR’êşKÎÀ`Um[\\¶Ò¡f•× tÍx—Œ|m6¥+ÇhÄ/± \r|GaæZÙ±ç#ƒ^TĞ½ñin˜’ÜóVÒÛÎ“Íº%›Ş/$*\n\0ÊÚam±ô§«Ã=êÜ±¦–a É 	ÌÔmMXAÇjc`\Z\0„EŠR1S.¦ºPyA\\Ôçd`ÇÃT›„‹µ»Swòs@Š²ÂÑİ\rßZæ§Ò¦Ónş×bÅ@9À®”DÙİ\'JŠiw e;Ğqào™ÑRù°G×§CwÈ\r1Ú¾r`a!­2¿Jë|3âÙ¬ÙRá=Í\0{bMü-V£ÂŒƒ\\¦Ÿâ/‚íq“ï[É6äP¢µX‰ù¬ØæÍY^hj&È§ÈÛ¯­R‚n*ÒòÀš\0ò¯ˆ\ZN7H«^uj>ğj÷Ïé‚úÕ¶Œñ^-©éÍc3ñh2HFüŠ6Šz’Ãš6Ğl1Q5NËQ²P&˜jBœÑ³4ÜĞ¦ÓÄ^´LŠ–8ù\"ÇÅL‘ó@\ZU”J\"¬¤T\0è’­¢ñQÅY	Š\0|b¦\0T)ÅL¼Ğ“éNèÓ&´­`PZÀå†GÒÙÂ¡FG5ZŞ \0â´`€,(¥Yˆ“Q¤y©Æs@#ùjM`j—i3³b´onÕclœ`WøãÅgßOÏ± _ø•–fX_ò®{L×İ¿Ö\\İÅì—×¤$‚jü1*Æ\nõ ¸kI¢Šä÷z(»-ÅBíŠBõ@y\0¨Zà+\n†Ij»É¹…\0]–äS\rÈÙT¥~*6”l \rİ\"äyÕÔÊ<È•Ài—g÷¯@€oµSí@rBAÍBWr~\rV\"€\Z\r)­Í\0ÓÍI¶˜x 0ãšÏm™O½_zÏ¸È‘O½\0{ß€›v¿JêÁÍq?çÎ–£Ú»üĞÛŠ‰œRÈõY›š\0{½@ò`R;Õgz\0Y%ªí&E5Wg ‘³Tgæ¬Høª’½\0e_·ÈÃÚ¼»Äß$^™|~õy—Š[÷‡ë@»|À×EáWÙp ú×7»å­¯\rË‹¥úĞªgä_qOSŠ¬¯º4úT›ºP}U‰µp½q^Sùõ°¾^¡ª1ïJá4«MúÆâ?Š€=RÉvé‘¯|VTÉ²CºµÕv‹JÊ¸Bí@gNxªÎ1W%]½j¤ƒš\0‹ni¥qRÓH h=)ûi\nĞDf£d5cŒ8 \n†:†HÎ8«˜¨äDå0GZö/‡º˜–Ì@ÇæÅy‹šë<\rª}–ùPœs@â>QÍ©‘È&‰\\wü|´\0¹Å-1_viô\0QE\0QE\0QE\0Rb–Š\0JTß/¨©( 8×­Ú	ÉÇzÏc˜s]w‰mƒ¡|WT­\0O¤]ıuÉêkÒí$[£â¼ª8ŠÊ¥wúÏ™\n¡=(pÒÒ\nSÒ€\n)¥ ŒÒÑ@EFÃ5)¦Ğv¨$«.3U€+¸ª²U¶éUeï@˜Õy5e…@â€+•¦í©ˆ¦0 bœ½hÅ9G4 5\"µF=h@sJ) b8 ñÒ˜)ã¥\0(¥ Q@š3IE\0Ş‘€íKHh&Z†jb*21@Øl9©ã½(E5“5E@\Zöº¢½WMÔrã®Xå:RÇN†€:ÒŠãƒU\'±İÈ¬hu7S–5©o¬!r(¤¶,½ª«ÂË÷F+¢K¸g©Ö9R€9ÓÛÓæ¢0Àüİ+V[\":\n§%»Ô\0Ğ}Ş)ûwi‹jUã¥\0@ñÕR;Uà¤(=(˜$v§ö«&0Hâ”ÛŒq@.\r.ÀiZ):õ 0Ò|ö©Tõ&á@\r­0ÛûUñƒŞä† £µ\'Ùı«TÛÒˆP@¶ö§}›ÚµvÚš@ì(‚ZîíV¨Z°±â¥š\0¬‘gŒU˜í¶š•#ÇAVQûPGÑšî1JÏ	ûÆ¦¹­_ÆúxaE\0tsO²“+y®#ÄŸ`´G‚Øı2+†ñ.o‹,@ö5Ç<ï9ÌÄ–>´sXñ\rö©9ß#\'Ö³„`\rÇïT‹9¦HûN(ä¶JYPã­HŠ­ÏzG \nÑ¯ÍóóV<¿îp)EN½8 *ZÌ¸“\rZ¹ÊšÈ¹_Ş\Z\0|\rµ99¨`N*ÆÚ\0ŠDzÒ€»FGÍNn)”\0ÖÉ=*¾Ğ ƒVZ«½\0 *\0T-€r½içå\\¿4¥§ê÷p=ëĞ4G8Xç`õ¯/?0Áª3I%»î‡ŒPÓšv£\râ†WÖ‡™ƒòó_9è2¹³eWsï^¡øŞÂ‰\\gë@•ØÆx­HdàŠå­/£¾PbaZq\\2aE\0nK\Z´e[œ×šø»Ãí!i#^+Ñ \'fæ5Nÿ\0eÒ#4à2ÂmÜ£\nn+½ñ†v™ErjTE\0Po¥7njùµÈéP˜Jh¡‡Ú›å`Õãi¦*\0ª¥RˆM<CÒ€#XóS¤U*EÅN‘Ğ<Uˆ×šzÇš•#\0Ğ ¤éFÜP“@\n£5\"ƒ»\0Tğ[–­k XdP{{rHÈ­ÛKL\0H© ²\0+F8\0Z\0l©À«‰0)°ÂA«Gj±Á ?»5VæçHéK<ÅÁİÂú×ã[hğ<q¸gÇ­\0Wñ¯‰“NµqŸ93^	©ŞÏ©Ü™‰RjÖ«®\\kWm$ŒLyéTÂ€p(h¡R€Í]…|µÃT6àjÉ`\0/¥ñE\0u&J†GÍW3Tm-\0,ÍBZ‘¡y1@‘úÔüS^Z„¾hÅ´Ş\\ÊsŞ½CI“Í°_¥y&üH¿ZôïK¾Íµ\0Mt¸cUXqWïWæªğ(,dP´ôZLPÔn)ÄÒš\0Œ\rSºN3ïWíÇúŒûĞªü=“ı.k¼ç?dÿ\0Eß<˜4+µVvæ‘åâ«¼¼ĞÕZF¡åÍVy3š\0J®ïI#f«³P»ÕYdëô§HÕRf4Bõø5æ)?9¯Fº<×›x¤üæ€9ß-jè/¶í>µ»ŠÑÑäÛvŸZ\0õ¸èSéRîæ©ÚÉ›túS¼Şh\0¼*Ñ°oJåt÷HõQïVİì¤†Ò¹ÛiR\rï@¬\0{#Ò°fr$#¹o•±P}+*DÉ47=jœƒš¿qŒñT¤Ğ`SH©) ñHE:Š\0f)qO=i1š\0ˆ­DËÅY+Q° \nL´ºd¦ÖıÔ*´ÇË ¹  ¼7z.ìç$\nØÎN+Ï~êHUæ½æ€Sniô‡šZ\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢ƒ@Úµ°šÑıkÎšÃë^Ÿ:¯µpZ¼EÑãĞùI V×‡.Ï›´šÉÊ•9©´™6\\ŒP£©ÊäR•«î„j™h\0šu3?=>€\n(¢€\niê\r\0@õ]êËŠ¬ôÕY[j­\'Z\0®ËPºÕ’3Q° \nÅiŒµ1ÓHÍ\0E¶•VŸŠU\0N— PSÀ¤Æ)E\08S…4SÇJ\0P(Å(¢€b–Š\0B))ÔÓ@\r\"šEIIŠ\0‰…0ğ9©œTL¹ XQ4+Ö§hÈ¦m4]Ğ@Ñ09­´dsP¶á@wñ\Z¹²ÑŸ˜ÖqºĞ±.ï›¥\0tPë))ùªè–	‡Q\\|€/ú³LK©£<Š\0ëdµ÷*³´|YPkMùëB-r¼#4!V¥&ïZ°—MĞŠ—ÉG@÷ŒPÏ=*Ñ³ˆ¨ÚÜŠ\0r²‘Í9£VUrŒ´	Jõ ı””Öµ\"¤[°½h7ŠzĞC”à$XûT}êd»ƒ¾(º£•æ-êÉ¹ŒŸ—©’x@ùˆ \n\"\'ô©ÏJ]RÒó2Õ|Sa~e Ÿg-ÔSÖÙW–\"¹Û¯[\0|¶ÎßxÒCŸ(Ğ¡Éymo÷˜VF¥âËk(ÎÆ¯1ºñ\rÕÉ?1¬›‰\'¹ÿ\0Xæ€:=sÆ7E„p}+‘šyî˜™˜Õ¤‹bóÍ2B¤\Z\0Ë•D|j±99éWåUš¢Ã-Å\0J‘TîÉ5z8NÚ«rph¤2¶à*ÛŒ\nŠ²Ùi×\"€)—\"¤÷b™$|Óá\\\Z\0°FÖ\\ã/Z¯ÂVTÜ½\0On¹1Ze¿J˜Ğ,*\"*v¨Z€#j®õaúUg<Ğ2*·V«t¨‘rÔ&Ü-UÂç#5}†¨ÈªIİ@–%s‘Åê{7\r)â2W¥Epã5\0v¾\ZñÜ¶l«+œW¬è¾.¶¾UËßZù²r§­aª\\iÎ\n¹À ¬-.Òá\0FÕ¦¶Ø»«Á|?ñ\nHÌp=ëÖ4OÛj‘*ï]ÇŞ€4o-ş×B+ƒÖ´“nI^Šd\0o*k>şÁo£$ÔåJÁI’HCò+gUÒ\r´„Y¨vpE\0TmëAŠ­±\rÒšV€+ˆ…8EÕ0ô§â€#àR…©öñOH²h4¥U\'µZŠÛ=ªô69=(>8Y»UÈ¬‰íZ°éà•~+01Å\0Pµ²ÀéZ¶ö€c5f`;U¥·=¨©S$g5,p9§£*h¥Lc5VfŞw¹Ú£­7SÔã·BÌÊ\0ëÍyş\'%´o‹üı\r\0t8ñí¶—hğ[¸óq\r|ıy¨ÜkWo%Ë’¤÷5NóQ¸Ö\'i§rrz\ZHÙ  ‚ µ(šdS(ïOiÀ 	—å¤y1T¤»ÛŞ«=îOZ\0Ñó=è¬Ï¶{Ñ@jc5F^˜Í@\nÒTNù¦;T/&(\0v#¥BÎi\ZLšc7’ãë^•à«¯: ¬sŠòéŸ½v>\0¾ÍÆÂ{Ğ£\\ %³XÒç~;VÕèùr;ÖIL’h<`qMÅHyéM IO\"Š\0c(*sUæ\\¦ŞÙ«G¡¨%/ã@Ï¦t¯Es“^màƒ‡èlô\0ŒÜÔ.F)üšŞ€	dÅV2sI+ÔÆ€#ÔE½j7z‰œĞÈÕNi8©$z¥3ñ@î¤àı+ÎüNÀ¹®êéú×ø™şs@é#H\0Ü§Ö²KdV–Šßé)õ Sµl@ŸJ$|*_\'Ò’I9 ®d\0}+\ZÏPPUŞ«š„¿»lzWgzÃYIş*\0÷Ø›u”gÔVeĞÚÜV§Í¥ÂßìŠÎ¸j\0£8ªRjôıjœ‚€!¤4üSH âŒS¨ `R•%#(>iŒKŠk-\0WeZhÃUÖZ‰× ĞOğîïÊ¿òÜü¹¯f0t5óÆvlõ9ÆZ½óL›Ï±‰ıE\0\\ÅÕ9§PEPEPEPEPEP\\‰`ùË]wñV.¿o¾ÔÂŒâ§µÄr‚:Ó6áˆ¨ËìP¢i2yúVCÅaxzmğšİ=E\0&êu\'zZ\0(¢Š\0(=( ô  eÍNõ\n\0¯\"UİjÔ¢«° \n­ÇJŒóSºÔeh\"´Í TåsL+@l§í´¡h¡E(ZvÚvÚ\0fÑN\n.ÚpZ\0h¸ìR@\rÅ.)Ø¤ bŠ(\0Å&-\0Ò(Å)¤ °¦‘ŠyÒ(&æšjB)„P$•.jÁJ–€+2b£eÈ«,µ/_`Ò*rµZ\0®È\rD`î	«%j7$p(‹4ıÒjÔZÄÉÔšªT°äTM\0nE¯°ÆóÅ_OÛÆk1œT\09Ï4ß®»fıqN:¥“wçm¹zQ4²„Ğ£›Û\'PIyh£ï\nóß>àÒ<×rÆ€;“©ZÉVçYµ@v‘\\O™)<“QL¬Ã’hzïÆ@J¡®zûÆ³³VEÕ¨wÉ5Sì¨­Í\0_›_½¸»~u3O;|îß&ÅTâ¦¶Sš\0±åä}ãIå\nŸoÒ(€t¤aÅK¶šÂ€##j€š°EDÃ€3¯Åg¦CV×5V4É 	ÓîÖuŞ7V©\\%e\\½\0-ªò*ëF6ÕkuÚ3V·dP	İÅ:©Ş<šzÇ´P-f8ËÕûÆÚ*š.M\0X‰p)ıéTaiŒq@üT¥një@¹âª¹æ¬¹â«7Ş àÍ5SŠV85\"—4Í„5š	y9«“¿$T1§9 	1…â¨Éöæ®<›x¦(h(¢8§¶ZŒ\nB™Z\0‹°œÔ–^&»Ò.£¶Ğ}j˜Dy¬ëÉ~”ï>ø™\rÚ$73ŒrkÒ­u[{Åf‘H>õñ¬O-¿Í•aï]/‡ş!_hó BÊ­\0}?yf“çÌ®~ûCC“Ågø_âu†­¤ìªäcšìQa¼H%`h„m5£ci?³Øö®ûû:62çğª²é€•hŠ\Z\\¤ä\n4ÆxWX¶%zŠSeí@Äzi\'‘Å_‹Iq[kf=*u¶=¨\"=;oj¹¦â´Ru«	\ZôÅ\0Sß•d[œp*ÒÚädSÕL}Fh\"!¾j´ÎªB­2IâQó0O­rúÿ\0l4Dmó)aï@L¯ä)gpW%âXi±¸2.ğ=kÇ<]ñ°ñ[IÇN\ry&©âË^Fy% ë@“âÿ\0‰Wr<vnv7\Zóç•îœË3Í×5Šº”0‚fîj¤\'	 ¥$ŒOûJ¬+„¸ñr\0vÖ-×‹elì&€=JKØâ·Î«K­D«÷…y&»rA\'ëW¶	4é7\ZúîàÕY5ñ\rrÖç\0±5©’n4{şEWşÏ‡ûÂŠ\0ö2üTm%W.i&;Ğ­%V™é(­DÏ¾€ÉŠkI‘P¹9â›É ÌÙ¶¼wökåÉÆMaHiú|ÆŞò#œĞĞ,â{TaÜV{®ĞiÚ$ÿ\0iÓ£*sòÑp&€*\Zm)<Ss@\nx¤\'4†›œĞ·J†O¹Ršd„l »Á‡®ù¼ûÂ\r‡Ü³Ò€\ZïÉ¨$zd’rj»É@wÍFÍŠˆ±¦3àP»\n‰ŸŠßŞ£gâ€	UIZ+š«+às@÷oÖ¼óÄ¯óšî¯_ƒ^wâGËœPï–´t6ÍÒıkqÛZš7Kõ LI1})¯%E»÷iJc6:ĞKÉ€WÏ¥pp]ŒƒüuÕësâb§µyºÜ±Öb$ÿ\0\0}Y¤·›¢Áşèª“®	§øRO7Dƒ¿Ê(¼1Å\0eËÖªH9«²ûÕI(SH©)¤Ğm£m<Q@ÛHV¤¢€˜ËRâ‚h³-FÂ¬}*9@\01ÜÆÃûÕîŞºé‘.r@¯—‚¤õÍz¿Ãû“$	è(¹ÒÑE\0QE\0QE\0QE\0QE\0QA Ç9ªzœ~e³\n¶NE6Eßé@gr<©Ø{Õy¹äUİmwmŞ©Sæô £Ã3t×zWáÇÛ(»•?(Í\0;ÑE\0QE\0PzQHzP\Z£aRSM\0WT,*Ì£š–€+°É¦©ÊÓh´Â•9¦h”»jLQ¶€#ÛNNÚiBâ€¶”Š~(Å\03¥ìRâ€Òµ&)q@m£mKj(-¸¤©¥GŠ\0B)1N\"›@	Ši§Ò\Z\0ˆŠi#S ‘šc\n”Ôf€!\"˜ÃŠ•…0Š\0„­FV§5 \nĞqÍ<ÓJæ€!`@æ­óQ´`PR	â£hO­Z\"¢`hœ‘b¢ÛŠ¶êj&S@;)¦@GJ™“#‘M(1@:•ã­^òÅP¾áx ¹³ä\Z¨ğİkJ8wŒš‚X°h¾Ì/5jÔ)^x«–¶à´\0ı´Ò¼ÔÄS ŠóM+R‘IŠ\0®İjF¬°9ª×Š\0Ì›“MŒ`ÓÜÔ€hò}Ú ÑnlÕÖäR(­\0WµhSÅI.;U}Ø 	§;aj¸c)e“Í\0P½“\'¶ë•ªÓ’òqW`Aš\0œ\n¹¥9Í!äPdàT-R· n´\0ÇéUXüÕfCÅU~´\0$æ•ŸjÓŒsUnŸ–€\"s¹ªUùV£OSK#`q@&î T‘QËäÕ¥U@j6r¿JqàÔÌ¸À ®\0pj˜¶“š°Üµ\\’3@çà6*£E–än©çŒ»pig’¸ë@‚i¬ˆ{y\nÏZí|9ñJûJeYİG½yä…¤lçŸæ*&0	 ¥4_Œ6wˆ¢á‚7½vÚg4«ğ3:û×ÅyÌÛ¢§ĞÕ˜5­BÈ|—\rÇ½\0}Ò·šlÃ1Ü)Ï½N‚Ø•Áükâ>%j–$fw {Ö¬¯íØãŞ€>Åhã,px§¬(zµ|s\'í-u\0’j”ßµøá7PÛ¶ıd€~4É/´Ø^áF=ëá;ßÚ?Vº#8Ía]|k×/A,ƒ>ô÷ÿ\0Œ4{$%¯Pcıªà5ÿ\0z^–b™d#Ğ×Å—~,×5C†ºîj µ¾Ÿæv|úš\0úÄß´+]³­£mô ×“kŸµbRÆV`}ëG2œ=_·Ò1š\0¨×’ÜÒäšiî6â,ŠßM)p*Ô:|k÷—4ÀKg¨NÙÜØ§&—qüd×¢5¬@p‚¡k“¢Ğº_9¤m1;×iıƒ¾œ¾Éæ€8ˆt ï‚¼UÈô%Â×`4•Œd-)³Ú3Š\0Å‡N1¦TÛ\\);s[Ãrœm«™h’ò®ıè®³÷İı( ÓÍ¦3©ëU·šnìš\0˜…=é»UzSñ† 0=©˜oJ´PÈøé@Ùu¨Y\\J¸ìjÎIéT®nLGÔì^¼?dÇ<WCp»·g½y—€us$Ë=ëÕ§Oİõ 7I¤©f_›5h\0&’ŠLĞ75£ŠŸµDüĞWá^®ÍÛŞ¸ïñŠêNÔ‡“ÍWfÁëK$œšªòsÖ€&/PJüTm\'½BÒdĞ³ÔfJcšˆ½\0=äªWpjI\Z¨Ü?Bò@#jó½z\\Êk·¿“Ü×k/ºS“@›şS[~\\Ì\r`Åt_›4Û+íAQ\\KòÒ3üµZVÍ\0ejÇ|=«Î¦ıŞ§ûÕŞê³lFÉí^zù½F\0}Cà9¼Í!Ÿá«·#÷\\ïÂÛ¯?MTÎp+©¼‹5\0cL9ª’jüËÍT‘y @¤=jLS âŒSöÑ¶€Š1OÛFÚ\0hbzP${Tr*ÁZ¯)Å\0gÜ§C^ƒğòä)ÚMpÓ®c5¹à«³â©8É j¾´´ÈèúŠ}\0QE\0QE\0QE\0QE\0QE\0¤=\r-&hÏüD»n‰Åe½Et&ƒç-\\ükµ9 \r=\ZP—(=ë¾S•Cí^c§LVõ~µéV­¾$úP‚2(^(¢€\n(¢€M§\Zm\0Ö§SZ€!za©\r4Š\0„Ša3.i»h´„TûhÛ@öÑŠ˜­!Z\0‹ÔT›hÛ@ÑRm£m\0GEI¶´?Rí£\0ÚB)äzÒé@Å4ŒÔ˜¤#Ò€\"\"›ŒÔ¤SHô !§°¦š\0a¦\ZŠm\00Ši©qL4	¦0â¦#Ò£aÅ\0DE5…KŠc\n\0®Â™S0¨˜P\Z˜jCLj\0Œ÷¨H©È¦@šc.;TÌ´Â(\\*¹B*ãS\nf€+ÅPº5©\"àVeÌ˜Í\0Q-°b«¹Üh™É~)£š\0tkÍ\\Œb¡*Ò.(äS\rIMa@‘Lj”óLz\0‡Bá±Wİ°µ—tüš\0€œšR03LC“N‘ğ1@³â™»4ÇÉ4à0(²!5M_sTÓ?ÊECĞêvŠ‚áò*Ó&ª:dâ€+B™bMZ^5#ÙJM\0&*1\'4×9¦PÛæ«ÈØ¡ØŠ‚G e‘ª‘‹İ)ï Ï5H q@ÊW\Z¬j»OôÏµP“š‰Á=)†bÃŠD›`;Í\0H w¥.ª:Õ)î@Î\rgË|«Î€4f¹Úxª­&yÍeÍªF3—gÜx–Ş,‚ã#Ş€7šv\rD÷¹®:ëÆP&pÂ±î|nv\Z\0ô6¹QÕ…Sö5ÎæyÇ‹ç~#&³ä×¯gîÔé’ëVñç,?:£7‰­Ôıá^p^òsÉj™,¦qó Êo¡ÿ\0Vk:Êßs&² ÒÜúÖ¥¶– |â€+6±q6p¦¢&ânªy­ø´ø—®Çdœah“şÉi9#š’=±åJìÒÉ}*ÔvŠ;P‚ªÊ¯Ã£ªŸ¸?*ê>Ê½…9myé@+§<(«QÚÚ¶E°î)ŞJ¨é@ñÚJ¶(Ò°ÛÒ‘Ußš\0\"”ázP‘1ëšµ\Zc­\0B-ÉÇim€Š•YTt£Ì X±AŒ‚“Í\\Š0Æ€(I=)ÂËwjÙKu©£A !¤ïş\ZpĞv®(”v«‘ªc  ;şÖô¢»]©è( %I5*ÆZáeø‡kùXV]ÏÄôLù|Ğ¨QÔŠ§]àW‹Ü|P¸$ìRk:ˆšÀıÊ° v{«xß2Æ²®õÛ8Aıú~uàWş&×.óåïÎİMâÉæLPĞ—1µˆœL¼{Ößm¥,¡Á¯	{]uÍæ~µbÊŞÿ\0xYƒdúĞÑ~ñ¼1ê‘.ñËz×ÔÖ‹¨é‘Èœåkàis[j0LÎ@µö¿ÃëÁ>‰–É@\Z!ÍV­¥\ZÍo–€ÑH4„Ğ¿„ÔYÉ§Ï¬(¯ğñÀ­÷“šç´#ˆóZÒOó\Z\0$““ULÒ<™&¡f\0æsQîù©ê2Â€ïP´”É$ªï-\0>Ij…ÄœS¤¨\\O@º”ØŒ×êræc]¦«6#5Àß>é\0BÏŒW]á¥ù3\\n7:Ší´1öhW=èy¤ç²šRŠªÜ·ÊNhšñæ2®RD-‡­-zlÌy¬“y˜ö@ëğrótE3ĞW§Ş`’kÆ~¹C»½{MÌ_»İ@“MRsWåäš©\"Ğb)‡­HÔÒ¼ĞŠ1NÅ âŒSöÑ¶€\ZhÛOÛA ˆªóG•h­5°8 \n,™R*mO³_ÇÛšG5gË¹‡­\0{¾›/›g{UºÅğİÇa°­ª\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0)„Óè gÄñâ,×$WÛxµ¶Ú^xfßøP«2EÚzô½5ó\n}+Ìm$h_­zF’û¡Sí@\ZôRÆih\0¢Š(\04Úu&()­N¦‘@ÒO+M<PqŠB¹§Òg\0İ´˜Å?„PÍ!üPE\0E¶µ%Ú6Ô”P{hÛOÎ(Í\03m&*BÔÜf€E&)æ›@\r<S	§±â£ &šiM6€ÓH§\ZCÒ€i¤S%\06˜M<óL#4\0ÂiÒœF)Œ(´Æ§\ZkPLqQjF¦Š\0aÂ*CÖ˜Ô0Ô„TF€\ZÔÃÖ¤ÆiŒ”Òt§\ZúP3?²®±â®O.Úªg”ĞœóBÇŠ±$Š[ŠAƒ@c« qQ¢TØâ€x¦O+Q‘ï@&˜çŠsw¨]Æ(µÄ¸¬Ùq5jã•L¡€â™!$ÓÉ#µ4óÍ\0GŠñÅ+;ÔLhRZ1¥Î95ZyÁà\Z\0§b¢.3T„š˜q@$“#Š£ŞE1œw8 	7ÔO8\\ÕynãAË\nÍŸS€ûÁùĞ›\\j\'•q\\üúå¼9>`üë\ZóÆQE¬\r\0u’Ì£½T{•Myıç€ÎŞkãÇr…€=FKè†rÂªI«ÛD	.¿y4Ş*¹Ÿ!r3T$½½¸\'æ<ûĞ«Üx®Ş?:È¼ñÔ+œ0¯;û-Ü¿y‰§.,¿{&€:[Ïv\Zçîües1>Y4Õğácó\n½†ĞuJ\0ç\'×µ	OÊ[š¬$½¸9fnk¹OÇıÊ±‡r(‚].æ^Xšµ„ÄüÙ®õtA=tr§¥\0rèE_‹EUÇË]:Ø‘Æ*xìöõÏÅ¦ªÿ\0\r[NVş\Zİè;T‰\n‚€2âÒÔ<éŞ‚¶bŒNòh,Jö«1Æ#à­j$cÒå!í@â>õ*&*Ç•íCAË\n\0D\0u©EäÖt÷‹;NjƒjO!Ú\0o<ªzTY,x¬ûvvÆjòÍ°r(tƒwZb	Æ*¼wjxéW#‘Îs@\nª*@‹LÈ=\r.=èL@ÒytdŠvs@£<s5\\Š7`Ğ”w^¦¬­Øõ¬A\'¥J¬}hz; {Õ¥ºµÎ,û{Ôëqï@ßj´V\'œ}h \ZO…·Ì~`kJ×á4§bgğ¯n[È‡ğ\n°—q°áE\0y·Âˆ@dcò­Ko†vpõJ\nôàoİájëÚ€<ö?‡öIÖüªoøA,ÿ\0R¿•wÂĞ¢—ì€P¿Ãû&Î!_Ê±ïşÃĞÄúW­ıœ\nPp \n¹ğmÅ‹«¢½‡á¤ğD°JHíV®maºJ\nƒN²\Z}Èdàf€=*x‹(eèk6qŒÕÛ¿>\0¥EuZ\0Íšy<SY0h\'Š\0`ûÔæùœS;Ô‘\rÎ(¨ÑÛdC5zIMeØ¾ÈÅNóP­\'5IP™*\'’€&i}ê&—Ş«¼¸¨^(Y&Í@ÏP´™¦4œP+Ö|ò|Õ4²ÖmÌØæ€1u» Œ×;nbkk]ºË\rsÅ²(Í¢y’¯Ö»[EÛ×%¤DZ@}ë°‹„€\'w8ªWrúU‚ø¬Jì*@†°I”“ëPYÛ‰1‘R_?œçkJ·bÀb€=ÀWkcu\Zg5îÅüë4aÜWÎÚB4ğ‘ÀÍ}	¤°ŸLœü´˜ë‚j´‚¯N¸r*¤‚€)µ3mLËÍ7\0ÌRKŠv(¸¥Å;b€ŠB)äR@ÅFFZ¦\"›·š\0§*œÔDbTúÕÖLš­\"â@hÖ<\"û¬‡ÒºJä|&ël{W]@Q@Q@Q@Q@Q@\'zZNôÎx»ş=Ò¼áx$×¤ø´¡şæÌ945£¤/Ö½#GoÜ/Ò¼Ò×ş>ë^£ŸÜ¯Ò€7Ôü´áÒ˜Ÿv½(h¢Š\0(=( ô Ò\ZZC@\r4”ìf›@\r óJE%\0Rõ@ ô§bšE\06Š\\QŠ\0JP3F)h1M\"ŸM=h¸¤&ŸQ´\0†šM)4Òh¥0ñN&˜M\0!4ÃN4Âh\0¤&—4Òh\r4šRi´\0S	Å.sHÔ\0ÂsLn”ãLc@4ÂiÔÆ škRÓI šŒŠ‘©„Ğ¨	æ§¨ØPtÖ8ü\nkãyªó¾ĞjbØª7RP‰95Xšt­–¦­\01¾ıMÍ7nZ¦@\0 …¥-Š\0* Í\0#Ji»Í#ÈW’|P’½R–Lô¨..˜gL]1\'4ißj˜ÕY®O­S{Ğ½Hüèä—t¸8¬ÉuH×«Î¨Üköñƒ—úĞ»Ü6x¦ùç½rW>+‚\"pÃó¬«¯¢ƒµ¨¾’ì+œU6•%›õ¯3»ñËàùdæ±eñ…ô¹Æê\0õù5khÜãzÌ¹ñuœY`üëÈ®5{ûœòÜÖl°^Ü–nhÕï<{mú·±®¾ S±«ÏãÑîXüåNº¤óš\0Ø½ñœó±cM¯^ÊIªô\Z1¸Vœ:D`¨ Mç¿œä³sH–WRŸŸ&»¸t¨û «©¥&8Q@Z#?ßf?\r#•®å4°VSMÎ(‡_ şùUˆü>«ü5Û1ıÚp²”È&Š\0ûµ4zP^«]P³”¿b”Í.œj™l”v­ï±{R?j\0Ç‹éN[ò+Sì¸¦íeãQ,ñÖm…[ô§c=h‡ÙGaM6Õ£°”Ïj\0Ìû9¥jÕò¨š0\r\0g˜Ê)Ê§½Xl)æšXv d/Zi™W\'Ò†Bİ*6µvRz\0©q« Ê©æ³dYÛå\'š±&‰/˜[œ\Z3	ät \nĞéòK÷óÍ^‹JD9`*È›Ë^@×lÍ”e`1Ú¡˜)éH¬_©«	\0<æ€3şÎÄüµjİ“VJéLó;P\r+§zE¼ òjVÌíLt2^úÔ‚ìT+iÍ1£Å\0][…5&õjÉ;‡JU‘Áï@\Z¤\02½hˆª;\'-RAGZ\0³†ïR¡ÇSUùŠ8n†€.yƒÖŠ«·ŞŠ\0ê¥¶Ú8X3D{Õ3Çºuşe­ôû5úƒ‹Ï½\0Go©4XÍiÛë1‘‰1YÒi› æ³æ·lü ñ@H¿OºE)—wzäÑå„÷«+©2€\r\0t&@:Ó\0Öuµò¿ß5hŞÇĞ@‘Dg\"¢gÜA Éçt4õ¶fPC¡Ş)	æ·%LŠã,á’ÚPüâºÛ+Ÿ9Fê\0©:`š¨zÖÍÔ+YRDPœĞÅOkË\n®Í“V`!phj#µ8 ¾j€¸ u¤7@u4i¥Çzå÷ª¯q“Á¨\ZSë@^oz…¦ëÍWi3Ş bTä(Ñ–˜ÒñÖª™Æ*\' Ï7½dßÜâ69§Ü\\sÖ¹İZÿ\0`*\r\0cßÜe95]âFò	[ƒÍZ²ƒs‚ÍÅ\0t:5·Ê+w¬ûIa·Œ|àT­©[\'-2Æ€!<Ö¦Œç€jåÏˆla<ÎŸcİxÏJ;æŒş4:is’+^ÆĞDsÀ®Zçâ6™\0;$Cø×9¨üX·Œ‘ô Xkµ‚emÀ`×µøQûu€]ÀàWÃ—Şàkè¿ÙûÅçP‡ËòO½\0{mâmıj„‚¶u­d°€)°4ÜT¤5G\"‘Ò€\Z)Ø Q@\n.)¹¢€JJ3E\0!“KNÀô>j«8ùªÎNãPÈ3œĞ}à&ÌD{Wo\\€›…w”\0QE\0QE\0QE\0QE\0Ph¢€RÑH:š\0çüYÿ\0b¼á‡&»ÿ\0È|’;WïË\Z\0u¿õ¯EÑ¿Ô¯Ò¼òßız×¢h¿qsÓ½ù*AÒ¡Vù°:TÆ€Š@ih\0 ô¢›@! ÒPE!¤æ€\n(4Ú\0uRs@	AéA¦ĞE†€šJ	 \0ŸZLÒ\Zi4\0êa>”dĞqÚ€\Zi¦•FZ€ºTf‚M%\0!4ÓJsM ÒQš\0CM4¤óI‘@	L&œÍŠ‹“@¦7JySŠ‰”š\0i¦N(}j&R;Ğ\0iŒy£§Zks@5lÓ\\‘Q3\Z\0œ\n…¤¦4œõ¦3\0:ĞŒ•ÉïQ´Ê;Õ›œƒ@&—\0óY—3g<ÕK›Öìj‘¹-÷\0Zß“O\rT¼åX\nwÛ\"^²Î€/©ã4¥öÖ<úå½¸æUüëóÇ6vÙİ\"ŸÆ€:×˜úÔ&P9,+Íïş\'Z¨\"6ú×1}ñ9˜0ˆõé@Ëq¨D€üëùÖßˆ!‡9uüëÄn¼u}.HfÇÖ±.<G¨\\“ó7ç@İuâûdÎ\\~uwã«x”íaù×4·÷ÛšXtÛËƒóîÅ\0z\r÷ÄD\0ì5ÍŞxşâRD[ª”\Zg#Ìµ­¼)ÆV€0&ñF§1ùsJšìëûÂÙ®Ê/Dƒ„©‡†Ôò«@JÛÜÎ~bÕnäûä×g‚Wr=!—µ\0q‘øm	Œš½‡Sû¿¥uÉ¦m9\"¬-¨â€9dĞ#Q÷åS.‡÷å]R[¯qS-¼~”Êa§eı)ë¡\'÷EuB‚\0Ì\r\r\0éAÑTv®¤Ä)†.zP24’ÿ\0±2v®“ÊéM0©ê(Ÿ0íR*„VÙ=)¦ÙAÍ\0dˆ‡¥8DjÑkLt@E\0W\nYéRì\"”!Í\0Aä{S~ÏW\0ÇZB}(™¶¤6ŠzŠ¼£4Œ¾”œÖ t[Òµ|¢{Sdˆ(ê(+ìäu¦‘¶­Í.ÑŒUbÛûPv—Kš¼¶»ûRµˆÇJ\0ÏòÌ§Š‘-«+GÒ…\0D¶Àu©B(íAÍ7<ó@;c kdnÕ`mÅ(Û@òX«tª²i½Ôs[EsÒ“nÑ“@&ÊUTl“GØ×BOjF‰r(š2È>ğ4øß\'šÚ{(Ïj‰´ĞÃä \n‘°©‹€*¼Ö\'İÍU1\\)ç8 o9TjÍD¬Aù«‰q\ZÅ\0*Ûg“JÑ\"u¤kåŠ€Ëæ(ÎQ¸ªÏ\0<-Z[|œõ©Ò%E\0f%£ç\"§	*w«®Á:Ug•J\0g™-™j(Æ#k‹&Ì.F=ë Ó<q¨X`4ïY2\r§‘šŒ…cm\0zñ?~å³õ®çMñvŸ~£sª“_6ıŸceN*ÄwsÀÀÅ1\\{ĞÓá-o1Hj´š~ß»Íxf—ã‹ËHXzôâDí[¦\0ûĞQ%´©Ó\"¡F‘æÍkZë\Zn €‰W\'Ş¥{Hœf,ë@-¯6¸Öå¥üM€XW9sa ÉAT‘n!n¦€=Î‰“†jÎácèÕÀEy8Üjü\Z„±ıâhÑc¸ó:Óg#î×/câŒ0ÖÁñ%³\',(’ÆñQ—ÛĞÖmş¿n[åp*™×mYç@fàõ\\{Öºõª¯úÑùÖM×Š-’%{ĞX÷ej»^–ã8®À™]Ãó®{Rø°†1š\0õ†¸Èûø¨^í@ùåÀú×Ï\ZŸÅû˜IØN+—¿øÍy2”V€>§}ZÎ—¸_Î²/¼e§À÷ëŸ­|™uñ#Q¸È7>õ“/‰u+£“3ûĞÒÚ¯ÄKd\'ËÆ¹kÏˆQJNX\Zğï·]Éş±ÉüjHç•›“@´Ş>E$ƒQ?Ä³všó…™y¤kbİE\0v÷n˜>õÎê5iA1ÊÃ>õB\r=dêµuteoà OPñ^¿9%e“Zçnuıs\'Ì•ÿ\0:õ˜ô(ÊàÅúU{¬ı\"ı(Ë-õNGıã³~5Òi’K73‚k©ƒÁKnçğ«‰ ˜1íJ\0çd¸ò‘¶§5íÿ\0³ÏŠrw%T°ÂZè0H?x£&»/éi¤k°MÊ\n\0ûâåk9ÊƒX.¥\\æ®xcP\Z†NHAQŞÇµ‰FJˆŒÓŸ‘M^3@ÑJzÒPEPEPMfÇêcu ¯ZAÁ©G˜ã*h®ğ3á±^‡šóoœHkÑTåE\0IE¥\0QFh Š( Š( ƒE¥\0 9¥¦)IÀ4Çx¶L!Àùv-—$ŠáØĞë!¾á~µèº@Úª+Ït…ß:ıkÑ¬j¯Ò€5Tüâ§\'š~õK@§š`8¥ RIš(\0¤4ŠJ\0(¤Í¨Z)3Fê\0ZCM&Ô\0´†šN)q@¤&›º›º€N)¤Òn¦3PÉâšOÂÔÒÔ\0òi¹¦nÅ!j\0v}iŒi7Ss@E7<æ‚Ô\0\Zm©¥¨\0jiéKº˜Í@i¹¤fÆq@cŠÌšòäT%¹ 	Şj€ÊIâšØõ¦;\Z\0Vf=ê2»Sˆªï>Ñó6(ÃJ­A$ùäVuÆ¥dïp?\ZÆ»ñœ9\r0\0oÉy´õ¨šğõÃ^øÛOƒ$Î¿rúŸÅ;pŞ\\Àş4êò\\Œòøª·\ZŒQ¯Í(üëçİKã6ÂËŸ­sÒüP¹»\'l‡Ÿz\0ú\"ëÄ¶ğg2Î¹ûï[®q(üëÂßÄW—Ç>csïBCwuÖCÏ½\0zÄ¾>‚2I`ßg\\üFeppè“dbE[‹Ã¦CÍ\0mÜ|A•óåæ².<g~ä”İW ğÒ¯ŞJ¾šJ9ŒÂ€8ÛWT½mÁ˜­fÏk¨\\»1ükÒWJxáOşÈpŸ¥\0yOö5Á?>MOŒÙ”šõğşó÷?J¿…Ğ‘”ı(ËcĞ‹c)ZVŞJôõğÌiƒ´T¿ØJ½€8‹?G••lCáøp£ò­ñ¦4}L–Î¿xP\nè¨:-XM á­èáõi#\\r(]/»S&Tt®€F¸éO©(Xãµ/ØO¥l´xíMÚ€1şÀ}(6>Õ´µHô CiÔß³Ú¶Ì\0ÓM¸ô \'…— ¦\0Ã¨­ÿ\0³)ëPÉh½…\0e/½J¡OZ°ö•	¶aÒ€\Zc¥4Ä)ØeâšXĞLB›å…9§y”Òû¸ \0¸5(\'¥L\"£ËÅ\0V1Jc@[¥Z+Š#¥\0g¼,\r4D}+OjŸ½U®gŠ<ĞFj3*Eó;\nÏ¼×c šÂ77W’ ì4ÓI«D~U#5dœä7—)Ãæ®ÇæÛğTàPµ¶Ï\rÍ<Zş\ZŠ;Ğ‡/Å[Q†^â€\Z/jkj¸\Z\'èE%=(?Ëõ†,ö­\"ƒ ÓBÖÆµ\Z<Teh+É Ó‚‘Wš.i¾Nh lS²ƒR˜\r1 #‘@\rò€£e&Ö€‘Ö€©  oZ]ùè( ÷©­mØT n§ytM¬#n€UWÓ<V®Şi60æ€0eÒÛ°¨Eœ‘•Ò‚;ŠR‘·Q@ø‘áe&£{Üÿ\0+ kh¤ã«Ë¦!è(Í.}*Ô6êıZ¬I¥ª*³ÙLŸw4hY§÷…KÈ¸õ4P*3˜S<\n»¸Ø§„É æ„¸çŠ€Ù‘“šÓvÂÔe2h<FÀã]När§Ú®1=1Mò‹PÚë7¶Dl™¸÷®§IøŸ{	X¦ÉQÜ×$Ê¨¤òTò8 tÑ|{itª.X}MvwÚ^ Ç\\Ÿzùhy±œÆì+cLñæÀ¬Œqï@P®	]ñE1ô°ÊxÅxÖ…ñBæ)•.˜ù~õéÚOôëÀªî¹>ô\0ë0+pqT\'Óæäc]zIg¨\0ĞH¼ûÓŸL;~\\\Z\0ó+í>ï¬ÕÎŞÅ}~f¯`’À!Ä‹ŸÂ³/4håşùP\\\\Ş®w3V\\²ÜHOÎÕë×¾XÎÕ®ZçÂrÇ!Ø¼P›_	Ğæ±äwÄ¤â½nOoâEæ«7£—´ä·š|3Fp2ÕÍŸ\rMspU#;sé^ïÿ\0GÎ2+FßÂ1B8Œgé@:ÜøNæß”ŒŸÂ©®waâ8úWÒÓxj6ëüªœŞ‚uÇ–3ô µ[QƒZÖÚLscè×$¢cè+ãÃw:c~í¥\0b.)*ñVbĞ2óô®‡K¸tp“Æqî+´³µ´™e\0š\0ó‹m‡ğÖ•®ŠÁ¾e¯GƒÃë9Ì b­\0EÕy \"\rN>_Òµ­¼:Œ9Q]$Zr©ákNÚÏoj\0åÃ@Bgğ«àè®Bå\0?Jì‘>ğ«öñ$˜*\0y½Ç€v˜ªX¼15ƒ¬‘©$W§ıW¨¤Kt—¢€;O†W®táç0k²¾Œ²ä\nóï\r1µºT^zK, ûP–qÍWpFkBáJvªO’(½¸æ–€E”PQJM%\0œRša4\00ïL?tÔ’7ÈDíû¼POàáûÂkĞã9çŞ^Mwöı(ÈéE!é@é@\0ëKE\0QE\0QE\0QE\0t¨¥ÎÓŠsJ†ivÆßJ\0à<U(i\nçšäx­ı}üËÆæ±Šò(GBŒùÊH¯E´Æ¸Í²œWil›@ \ræ‘Qîù)õ 	©AÍFihù¦–Å4ŸJJ\0vsHN)3M n£4Ú\r\0)jLÓsM&€M!8¦n¤-@Í!<Teé¥¸ æš\\\nfêBE\0<¸4Öp*=ê;ÓY•º\Z\0¶zSI¨‹ã¥4¹4!qš7Š`ÁëFÑë@È£\"˜HéŒsÒ€%\')µ,¼ÓLÌhbi……@Òä~uL£«Î€,»ÕKU$¿†,ï‘:Î¹ñ%•¾wH¿\0l3M,}k½øƒa\0!\\qï\\õßÄø;\r\0zs8xÎ “P·ˆ#¨ükÄµO‰—­örs^w­øëÄò<ÌPÓw~*Ó­Áß2Œ{×?¨|FÒ¬Ô·¿|›}â?LOœeÇãYn¿º}·/(ôô¶«ñÊ%>L ş5Ãê?¤‘˜@Ä×—ÛhfìÎÜúÖ¬~læ€4ï¾\'ê—d˜ËóX7^\'ÕïI%ÜVÂh8EÏáVcÒõ|ı(ŠšMRç—‘ñõ¨Ÿ4ƒ÷²¶kÑaÑ%‘°Ññô­ko	ÛÈ”`Ğ7†šSI«v¾\Z™ÂŸÊ½ˆxRÆc˜tÈíşò(Ïmt‹ˆÀùå[¶1<$y«ŠèšhSåóô¨ÛMšûˆŒûP¶m&ˆÍnZÙÂ@ÛÍeé>	¿3î”0Zîl¼/,J2\r\0dEèM˜ÍÑkphÎÒ´¡³òÔeh›C-‚V¯C¢¨ÆVºĞÈ©UĞ ÒÑG@³ÁÀĞS½/ÙÓ³@†ÃŠAcÏ\"¶<“Hc>””lG÷ib§¨Åly~¢šñn\n\0Å6°¨Í“ƒÀ­£ŞÔÂ}¨ì®:ŠaWSŒVÃsÚ¢xòzPh÷a;Õ§ƒ=ª·\"€vŠN;R<D*¼hcÒšx¦†=êA´õ ›-Ò®:Ôå@û´Â…¨»TMÇj·³šc( \n†nMDöÙéWvg¥1‘—š\0Í{Vì*&ÔdV“I¥w$q@!˜u§‡ÍZ¹òÇJÏi\0é@3¨ûÆªÜjVöÃçaš†á&—î\\î©¥]ÊàüØ —ºÓ¾E¿5•¾úé¾`ÛMZ°´û1x\'ë]½Õ®Ğ6ŒĞ-§‡ë\r9æµcÓ\"·GêæäÎc T2ÜËPˆÄC*´òÆÀ£5}¦CÈùjÌ6ªØó:ĞD–~yÀàPº;ÇÊ“]\0´Q÷(Ûåhì÷ıÜÓÖæX9–´gœ¨ùEgÈ\rÙ*Ã 	¡Õ¡~	æ­%ÌoĞÕô8ÓæÏ4Ig$c÷DĞ˜úR4µ“\\ÛŸ›88Ö\0À~´xÁŠa‹G¨Å\"Š°¬’t\"€+y~ÔyDö«aTw„|½h“ÀQP›pMhì\'ïÒlAÒ€3Åi’[”?(­@™éHÑzĞ9:\nşõ¤aç¥(·ÏQ@ß/~´òù*ËÙ§ZŒÂG€ \0´ï)Ozq€ŠizĞDXn\r+n^´yÁ9ªó]ç@5Â¨Áª“N_î.hUóO5v+t^zĞNé¿¹Enm_AE\0yîµğ¿PÓeF {Ws§\\Ø³ÄÜ{Wİw:e­ê‘4a³í\\µğÇNÔÕ¶Ä Ÿj\0øÉ¤RØÛƒN(Xuâ½·Å¥·ŞöhO¦yN§á\rSK«Âäj\0Å0\ZB\nÕ†Š{oõèWëQ´ÈİÆh‹}4¦ÑŠ›Ôø¢.ÜĞQ¦zŠ¶¶êG\"¯Áb1’*G…Sµ\0d½²°ÀàÔJ÷m˜†=ëNE\n2RxSÅ\0jé¾5Ôôò¸‘ˆõŞè¤M¢ñ¾¹¯+0m75€1à@Oèş:Ó5p²†5¼Öqê	ºÖUçŞ¾J‚{»İÈÇ½túWÄ=OKu+ôô)Ğ®÷…U}\Zf\')úW=áoŒöî«ö	é“^Ÿ¥øŸHÖ”–4\'Ş€8‰t=ßÁÏÒ«ã?wŠõv³±‘s«“éYw–!	ÛGÒ€<ùlGGOÒœÚ|dp¸5Ö¼½ÒªÉj…\\P<š\ZÌ:R¯…Énº¢0š½ÊÇ÷±@êøYvüê?*Vğe”ñ‘*.~•Ò5ün0¤T$I)ù(‹—á½‹1(ª\rdê^{Q›`xô¯LûËr	©á±sÄÃ\"€<b¾Ó›íZ¶Ú²HBÎ˜=ó^®ú¤ÃçŒdûVU÷íçR`@¤Ğ-YL>] ÓŞĞõ\\j­àëË/8\rµìöá	Ç­\0]K&s†Ÿöy l 8¢ëÄ±,»æúVd^0Ep%€7áf#÷€Õ”•Pü£š«i¯Yİ ÜU\r[Kg9I Ú]Ã-âŸzôı:ìKÒ¼âËÊR+¬Ñïãg\nPÍúç¥P6œÖÍÄ\"HpmŠ\0¬Ë‚i‡Š‡¨Ğh¢”ô ¤4I@5†iI§c+@±ãôŸÔâšß|\n\0ì<$˜®êqş÷`×bœ\n\0•š€x¨™¹§/J\0p<Ó³PîäÒî 	sFj-Ôn 	sFj-Ôn 	sHNGº·\0ìåk/SŸÊ…{Vƒ¶ØÉ®g^ºÛnÜö \'S¸ßrÇŞ©‡Ë¨’±–R}ê[[rò¯Ö€:ı>U5ÕGŒ\nÃÒ-ü¸‡³\0ZSÆ)İ)±Ò´\0ğisL—4\0¹£4ÜÒP‰¤Í&i¹ ƒëIº˜[Æj\0qjizš£-Š\0œœÓI¨¼ÊcK@¦–¨\ZZaš€,Å0Ê;Õs)>´Æp:œP‚Êi¤ñÅSk¨×ï0Fu|ÒøĞ¶“i JMcO®ÚEÓ/çY·2´„²)üh«,}iwmØ¯;»øyÚA®nóâ\\®H‰M\0{;JŠ2Ò¨üj”úÕµ·Ş™x÷¯Ô<i«Ü“ä³X3jZíËÎøúĞÑW~9±¶BYÔ­`İ|N±\0ùx¯ŠJVÿ\0H,V´!Ò™ÈÜ¦€;»ÿ\0‰¥Éæ¹ÛŸßÊÇË-MµğìOÂµáğÌ\0}Á@¬ş\"ÖoNQœ­Va«]¬gçŞ½\n8¸Xÿ\0J»Š0Ÿ¥\0y”~º˜æRÇñ«qøPo½2=V®G¤/uı(ÍÂqcîÔëáHXÁü+ÒãÒŸ»V’¿İ />´›ïÄ?*†ãáŒËû¨Ào¥zÒiJ?†¤\ZnŞ@ †¯şáy¬ÛjŸ•[ô$Vê*Çöl~ñGå@:ÛhsÛßFOáZöÖ¶ü	\"ÁúW´M¢Ø7ŞEü«ÿ\0ÃòäÛ Ú€8E±¶TÈ\n+>ãËVÄI“í]Dş»2|€í­]/Âéæ<Ÿq@}›{rÀDŒ­{\\Oƒ2kÔíôûHmŒô«A#ÇÊ\0 ?²øyjpÓ(ÍmÁá;; <´ÕÓl\'¡¤0Ö€1>È±à\"ÊŸ³µ¬a	É¨˜)ş\Z\0Èû>æäSÍ ÇJÒ®zR´cµ\0bµ™Ïß²²ÖÆÌv  ÇJ\0ÅhœS0àóœVËDj‰ (ˆ(È5)´ÇJ‰á+Ò€¨=é6P¹qÒ’&r~j\0‘Ğ5@ĞÔÅñG˜(¿“M1àâ®\r4Ç“š\0¨bÍBñ\n¼ÉŠŒ®h9¢æ˜Ğ©íZ\r*1:ĞcÛú\n a[F!éQ´#Ò€1Y])Œ5¬ñ/qU$ˆ‚€*ïÏZpØzÓÍ£7 UY¡t \rGÉQa÷úUS~`\'5]õFŸåyŞ9ÆjœÒåH–+Ÿæ-Š¹’Ç×š\0Éİä?6jÜzbu5|Àİ£ËnÆ€*‹4N‚šÖ±¿¢­W9¨¼(.ãG‚AĞVsh\n2PWJF8ëJJ\0áï4»¸¿ÕŠ£W6dMzÛ‰}*\'±ƒtı(”·Ô@ÂºÕÑ$N2£>™òÔYzÂäÄN(d¸\n1j¹Iå9æ¨;«i·H	\0Ö¤Z–ÀLPGjßòĞU˜¬Ğ‘OŠò9ÍOšâ-Ÿ#ĞK\ZíàŠÎ’RëNòæ¾CÅJ–/ÕÁ4JWóz­iqOË\nÖKdÆ\nÓö$yÁÅ\0d1Pá*mæˆ|†µ^u$…ëUäIxZ\0ÇûTñ·ÌI«–ú¦Î\rZM4±ùÆjËiqÀ\\\Z\0ªo•Ï$r#u45#^¸¬Û˜İîÎhd`ıÃHÈäóXp]ÜBß2’*újøÊ‘@6GáMñßâ¦ÂGŞÌÒ˜‚Š—|dd0ªòL€h’2+>`[îÕ¦…Üñšš+Oï\n\0Åû4’`Ôé¥“Ö·ÖŞ4i®1ĞP!°hşíƒÍl»¨¦Iì(;a¢­ù-éE\0{!·†<£5†¾o¦Ú¼×¦i²\0%ÜG½vÚ6ŒmHfĞBÂ\'P\'PÙõ—ªxOKÕæwjÑ‘3ŒQ†ƒ@Oâ?‚vú‚³[¨_ ¯ñÁëí.F6ñ³a_bC9ÆÖéDÖ¶s‚\'‰[>¢€>»Ğ¯ôòDğ0Ú‹QÜ8oJûK[øu§kHş\\(	•äZçÀÉm\'ymAÇ`(Éü‘/5U×vs]…÷‚õ-?!âm£Ú¹{ÛImÜ‰Â€3d±š„ÆGAZq…ÛóŠ†lõc4SÔTO?tUÑ\'æPè«Ò€(,dº«ËväV‘]İªš\0©f?õ|\ZĞµÖµ+†P=\rF#Å#Gš\0ît?‹wúk ¸‘Ÿ¦½OBø×g|‹Ø\nORkæól$TL‡16Óí@gXk:F®$É“Û5¬ÚtG›|6kâı/Äz–á£ÈõèøÑi:%Ñcã&€=öçOxÊÖá œTz7Äİ3VU2*’=kfH´ÍPnµ™I>ôÌ«2¾Cf¯ÛêÆÜá…h?‡š1º<0ªéî§¸ \rënÀrlÇsk\"ä0ÍyÛØºr¬EBnn­ÏÊÄŠ\0ô™%AÊr*»_1áEqÖzü©…›8­ˆµ›`Ü3@\Z21—‰W ÕÖéI(3W#¿à|˜¦»ä(›ŸÂP‚HPEcŞøB\"	HÀü+¶3çŒæ¡šnÅ\0yeÿ\0†\'‡&+ŠÈ_éoÌàW¬Ífn³Ö³¦ğànYü(„ƒÆ·a‚H¥@ï]—…¼[] š`	>µRÿ\0Â‘ÉÙVúWuá+Û„Ğ³\0x ªôÛ¸ïmU `ùªø6òÃ¼÷á†µ4*İ18ãšõ+èÖñ7%\0s§*J¹,&2EUc“Š\0ƒ$\ZRø!AP½\0&ê7Si	Å\0;4ğø\\TY¡[&€_ç\"”üÒ¨É>FÍMdtË@ï†ÓË‰k¨\rX:<;\"Z×İ@šp|\n¯ºÔ1lsIæTE¨\r@ï¥İPî¥\r@šh|ÔlüPZ\0‘Ÿm4JM5åÁ€q6\"#Ú¸~ó*È+¦Ôî„P·=«Ï/îüùØ{Ğ(¾ñ&¶ôˆ<Ù\"²¡ˆ»€;×a¤YĞ1â€6¬ğ¨¯\"ãš¯*Õ’Gj\0™î	æ Riû 	@´¤Ş Úİ.à>ñ äQšhÛ×4É?tĞÙ±Ò£2‘×Š‹ÌqLyÇñ?\Z\0ŸÍ½C$Á{Ö}Åô0uqùÖuÇˆl¡æI@ühpÍš¦5Ç^xóL¶÷Ãó®zïâ¥Œd„Æ€=9¥ f¢kÈ—™Æ¼Vóâë±+#µrš·ÄmNè0·İÏ¥\0}u¯éöùİ:Æ²î|e§CeIú×Êš·âKÇ%<Ì­V¶o4€İwÍ\0}/sñİòØV\rçÄÙ‘¯-Ó˜´9÷Ív6R’	 3xæúàşíZª>·©İç–Zèí4Xxò£V­4Ñ«Fğ ­uK³ş±¿:±‡/$ÿ\0[#~uèiª­\r?Ñq@z¾cÇ5z\nD\0İ\'é]äZwµ\\\Zp\0q@4^€c÷cò«KáèGH‡å]ŠØc «	e«@\\~<°?\n›şTş®ÍmGLT«kí@Bøm£9:i¯éší…¨=E<X!ê(“¶¶ãæJ¿1 \nŞşÌB8é^”Imcn•*Øú\n˜Y4GjtwN6ĞE²ÚzTÂÛ¶*âº[Š›¨ \ne§BjÄ’ƒ÷*±Yf;qÅ\0Dí·îóUØË!à\ZÓŠÌ©ù…ZHQGJ\0ÇŠÁ¥ûÕm,.5 P»Q‘ƒÍ\0@°F½TS^ÏEğ«8ÖOJ\0Ï’ÅXqUÍ‹/zÔ(E/—‘@;\Z:i”ŠÔkpj»Ûô \nBPxj\\FióZ’>QUşÎãÖ€&Ø½ª3¥Gó¯ZzË´\0Â„”¸éşz÷£\"N”QëL)š˜ÅL*GˆTM9«9æ”¨Å\0Ph¸¨d·…h²ĞT&&=E\0f=®jjW½k¥Da=Å\0fa’ç1ŠÑû8=ª)-×° \n^`n´ı€ÒIlÀüµ%CÒ€%1ŸJ¢§‰È0§,‘·S@Z#)6zÕğ##­A1Eï@ä‹pùFj«Ä«÷ªI¯V BsY²I5Ãp\r\0K5Ğˆ£5Aå{“€µ©\\fAVE¤Qt€9õÒ<Ã¹êÂèñ¨ÈQš×1óÇJB¦€1Í¢û§£ftã­l˜wS>È:‘@F=F*d#š»%²°ùES{7í@ØLhq÷x¦ˆŞ>¹§ ˆ<óJÀôÅJ’Ö¤Z€+(#½#üİªÉˆ”\0P1¤#Œš¡4qÖ€*½´r}äšD}ÕµxaŒRy{h›¹ğù`|³ŠËm\nx›%‰Û•¦UºŠ\0ãÀšĞ|¨N*Ì:‘o–DÅtßfd¡m9s€\0`Oc<\n¬—­€ø­kïïi¬ÄĞ&¶l©<PË¥ÊœÔñÚÉğdTq\\\\Àv•$\n|ºãÄ¸dı(Rû~òâ«Ír€|§š¨uQtø<UËk¥;‹P{C-ËpHj\r¨ËœÖºY„»4ÖŠxÎX|´mQxò³øSŞ|Ê¬ÜêööªD¸È®WUÖŞíÊÙäj\0›T0Â§Ëgë\\×Û.m±dŒÖ…y¨J\ZRØ&»M7Ã–öˆªP?¦Û\\L™“\"¯­“«s]/ØÓşY(Å4Â½æ€2#M¸È©	ô«ÍnAUŞÔ”Ty4á¶œÖ®¼Ğ!a@”ÏAJ±ŸJ™~^¢œ%Ú€\"ÛşÍ?¾”P¬ù0Ä~E4‡ §ÈÍ96çš\0de»Ôèw\Zc:ç”`cœPÙB*X¡GsTæºHFXƒQï=vÅÅ\0EªëÙ ù\'8¬İ;Å‡Q˜E\"dç½]}îØ™y§²ğåµœbš€-\\hVºŒ9–$ö®#]øQa|¢EÜ}«Ñı»S¥>\'òşÿ\04ó?ˆ~İZ+›t;}…yõï†/4ìù‘·Õö´ñ¥ÏË\")Sí\\î±àÛ\rE×\'Ú€>2pCmu#ğ¦´IŒ×Ğ> ø6eŞö‰ôÀ¯/Ö¾ßéÛãbµ\0q ıÚ…“šÑ¹³–ÕŠ¼L1íUŠç¨Å\0@†Z°¨)L~ÔLç¡SYôëWL`i†í@\Z\"¼ãŠÀmQƒZ‡§j‹Êã­\0R†[‹Vù%`}t:gu],©G`=ë ;²EÜ-\0z÷‡ş2Î»Rüñß5èÚ_Ä\rT\0Jèû×ÊFÙËd’*hä¹µ`öò0Ç½\0}ˆËk}ëGSŸzÂ¼ÓnUÕÈ¯Ğş$j:qTwb£Ô×¥è¿mä\n·„dúĞÔös©9R*g2òfºKé\Zª€5ifC8ßŠAéŠ\0äb¾¹³f¬Eâ)K.qZWúSFEs×Vá	Ê‘@]–£o0aºµáŠŞnâ¼»Î’ıÙ9­]fâ7@“ödŒe0j2ø…s6+U\0KZqëp\\uàÎp*…ÜJ¥6Š²	˜~éºÔcLœ¶òr(\"È>éLcö¯TÑnÅ²äõÆ.˜­†qÈ­í.ãÉÄkÀ¹w\0 šÅš=¬kpIæŠ©s\0Á8 ‚x¨˜Tî¸b1Me \nûi†¦+La@\ZE8jy¦7ĞÜr+SA¶/ $V_ßº¿AÀ$PWfDN^««mß0Ğ­Ônª¾i£Ì4d¾)•\\Éšnê\0µæS„•P=.ÿ\0z\0µæLg¨œÒ–Í\0IËR»lRI¨ÌÁ$Ö6§ªˆã`PWˆ5>J\\ÀF‘‹Sïn\rÄÄç<ÕÛ<Ğ(î“i½a]uºª(1Y–0$’h	¢ïÈ£ñ ÊÊ)ûÇjÉ“Vµ€e¥_Î³.|ickœºœ{ĞV%Åãœ×ŸOñCO‡=\r`ßüUBE¸8í@¼.qÕ‡çP\\êvöêZicŞ¼ïÇúœäı›pÍs\ZÆ³âMEDÒĞĞ·~?Ñìò$8÷¬ßŠºRƒöyŸ­|«¨h)s,Ï/—œMZÓín-˜}¬Hq×4ï7ÿ\0È€“\\¶£ñGSŸ?gİX\ZjØÎ\0`û×Mk£Y0vš\0çÇ\ZåË~ğ¸áª_Şñ3¸Ï½uRh)>ºƒôø¼#pÇåSùPú,—elŸz®ŞšS•v5é6ş©ÅmÚÛGn\0‘FhÉí¼	t¸È$Võ„Í¾<èóõé±@åWË“ƒ\n£ğ Z×I²PÄ™úUÉ4{	£*b@>•}tyncTÑxjè>_;h’¸ğ\\gì£Ÿj«‚¯íÛtA±^Ÿk§ı”Œ®kfâÛ†Uå6ñjZxÁF8ö­{-w`Åúí>õßË¬œ²­cê\ZµÔb\\j\0f¨Y\\à3[bÊ9Tˆ5Æÿ\0Âîµ,^ˆêzX`Ä\n\0ê\"ÓÊEIöC•gâ•,êA®†ÏT·œ¹E\01-võ:Û©íZq¬2®U‡çHaU<s@VÉG8§}•}*öß—\0S6 \n¿dñkŠ¶´ÓÇS@Ìt¥0qÍ9î–.5ZK–¹@xÑG8ªò<`iÁ$óR­€l ‰`y	ÙœUvÓ®	ÈÎ+§[uQN Œ\n\0çà·x¿ÖUáq(À«R\"·Z«-š¸ù:Ğ–á¥\rP6r\'JOŞ\'­\0_ \n“w\"©›†iëwØĞ¬¸¦“R#‡E8ÄàĞ ŠBqAŒƒOÙÅ\0BZšy©ŒTİ˜ ÊàgPİªv¦€+=¸=ª¶tçµ4¡4—%™ÎE@Èñô­¢˜àÓ\Z#‘@;gæ©ÖDaÍM- ?vªIjãîĞÛT÷¤1zU=²§\\ÓÖé”üÂ€\'#oQQ»ƒO[„~´ò‰\'İ \nø‘¢«NÚC@DT-İš¾pj\'\\\0Wù{ŠŠHÕº\n±åââ«\\Ş[Ú©,ëÇ½\0U{bù*¬ĞGl¤ÈÀ~5¨ø¾U–!–ö®F÷U¿ÔØ¬!€4·ªx†;\\ˆ›8ô¬¸<J×‡Î)úO†¥¹p×ÙÁõ®¯ş;îñ»FÂK{ŒF}ër Ç®zo\rİBÄÚ’A$—zpıé\'ÖIÇÉUÌ<üÕÏ[x©UÂÈ¦¶bÖ`¸QĞf€&òÇji‹5f?.EÜ¬(*;s@JbšFx«%3Ú›å`ô \n¦-œÔdÔUæ#šŒÀ\r\0S0«õ–KÚ¯yXéHbc@Mf{T&ZÛã¨¤(§µ\0bît§õ­VµVíU¤°$ñ@+¯zvºPÖ)†&J\0_\'o\"›†4¢B8aOÚ€åš_.¥\rH#İÒ€+í^ô»V>ÏëH\"9â€ @íÔT† zŠ”£(éJŠ[­\0Q6q±ù”Uy´H\'j”â©Š\0å&ğÂ!,‚«¾<÷yÍvF9ªs: ÉÁ SÎ»¶ˆ<VV£â;²j¦»	ÊÜª½j¬~I[{­\0pvúeÖ¯&fÜ®¿Iğ­µ¢3­tiqÛ®#QškÛJ{PÖ;eıÒÊƒlÓJ6æ3\'J\0ŒÆmÆ:Ó<Ç>µcÎY>øæ¼ñÒ€+ùTÖªà”  ãî1IöaéWÌc<\n<¯j\0Î6`ÓN\riùGÒ“Ëj\0ÌşÎZ+KËj(Ó<˜ÀÂ°j«%“ıáœW[øªîÎQ¿.3]âÕ¾ˆ,£a<PÓÜ-¯ŞäŠÍšêkÃˆrµª¶p^É»Ì=³Z#FHcİæ€9èlgs™‰\"µí­cAòŒ\Zxßídâ¬˜Ã.G€\r|Švr3L‹*~s‘V>_Â€#Ø\n_/w&Ÿ¹sÀ äûP6gHqÀ>ôç)n†Gjóê×9û$gµ\0zX¹n‡—y¥Yjg/>ÕÌxJúõÊı­XzïcÇòŒ5\0yî»ğ§NÔ´¡µyO‰>İDYíAÀô¯¤Ò)ññOdV”nñ¥áCIsæDäjÇ.c;e]§Ş¾İÕ<+§jÑ°xWq•å¾#ø#Û<–À/~(ç\"wâÀG æ»á–¡¦FÄ/µq×\Zuõ\"h›ÔP\"üã†2>jrİ m®0iÌâCò(=ãŒÔDn<qV8^Ù¦“ÀÅ\05—jóPnÈ Tî„\nˆ/¶(«Â¤)VÓ•ÎjéQQ>\0Io«^Ù`‘†=ë­Ñ¾(jZs(¹‘™G©®È¨.fŒE\0}£|`²¼\n—XÏ½uöÚ¶“¬ Ù\"ÕòÉ´fÁúÔö~.Ô´¹I[h>´õãx^)?y†ÕŸqáÉä)Åxç‡>5\\Z[—-õ5ê\Z\'ÅÛ\rK;*“ë@¶³ï\Zí¥ƒıY5×Áu¦êê\Z)×\'¶j;­#`&ÜyŸJ\0À³Õg¶Àbk¤Ó¼BÎÉÒ±ŸG›sÄWğ«ö­ÆÎh­î9W¨j‹óË­´År¤Š³Åò–<Ğsix	ÀlÖ|Åæ¸-2ëìî\ZI3]u®«ªpÍ\0:æ#­dË¹‘Ån²†ÍW%q€´”=©bŸ90ôZ­öœõ\0¥I¦¸Âã½\rt«LIŒ®6ŒŒĞ­>ò\rÃŠítõXcF+M‡\0µ¸@Lùâ€İÍUÍ5§eè3@¸¦yÙ5U.Y+R™Tx 	üİœh[¥SûlIş±€ZmvÒæP?\Z\0×İ·­1¥\'¥ssøªÑAÄ ş5wãè-‰ÚÀĞyç9¦µôPŒÉ äÚÅ`ŠË\Zä×­|H¿»,¶û†}(İ5ŸÚÛ«™sõ®ÿ\0Å©3œJú×ŠÏ©k7ò’ÅğkBÂÎúFiaš\0ôø¼QG.CUÔø…œ×c 4¥w¶s]=Ÿ„a`(4\0ûˆêB]V¾ÿ\0Tì?\Zé-ü+n˜ıØ­+m< Á˜µ«ùĞ¾Ôg9™˜ƒï^›˜‘ôZ²¶Àq¶€<Şnÿ\0\\	5§ƒm—šï×8â¬%ô *[¦6Æ?*½ƒ\Zc?*ë–Ëıš‘l½¨˜şÂŠHÊºµSoéó‚\Z“í]ÊÙàt©Ï\' P–Ş|0–³]¿JËojv«^Şˆñô\'ÙÖç‰€<fÎêmí\"şø®ŸNñ‘B}kº›Ã–RŞDŸjçµ?\0¬ùkS³é@\0Ô-g\\)RMFt£vs\ZÖğÍş—&á¹À5¯eâI´ü,°ŸÊ€\'œø«hB£5§kâ›i”X!=ªãj·÷r&€)F\"€|ªN·‘tb*O²5ÀÂ/µ]¼7/™æn8ô –H¤áW5Y´inNbÊÖœv¦ÛªnÅ[KõŒ`®Ú\0Ä]xd$Š·lëmò´y?JÕĞ¿ßqPÜ\\Ã\"@ùï@Gu\\’£K;‰µPŸKèf2TTPiSÛ6d%¨½Ö|ù1à•ŞÔ#mğ¹Øf»ä1”éVÓQ‡‘‚š\0à±©égç,ÀV…—‹Ìd-Ìd}k¡¾Õ4äBeds\\F³Ùd³„gÔ\n\0í­<Ceu€$PÇµ^7Ğ/F¼ƒIğö§5ÿ\0˜,y®â-*ê7±4½-şï¸*©3J~\\ŠlbÆô­®â@Z;cÿ\0-y5i E*o69)~L|¼Ğ%@è)Ã4¬è)›±Ö€\ZXæšA4ş(Í\0FcİIåìæ¤$ö¤9#š\0ˆäÔf0zÔØÅ4Š\0®`CÔT2Y«r¼UÂ)»·J\0Í{iSîšŒ<ÑıìÖ¡ã­Fê­Ú€*%è*a*·CMkUaP5‹Åó ½z\ZB1Ú³şÓ$GI©ã¿€ã)>Ô›CT†HœpÃ4˜SĞĞe1Q±ÁàU‚´Â\0ê(ç­!\"¤)EFÊE\00LØ\rK·ÖŒb€+´J¿xUy ú\nºè^£l9 É,ªÔ[$€äs[/“À“ƒ—Ph½+Ã\nwœ²J³:@8±¯.|“@\ZK°rXU+íZÖÉIg\\úf°¥{ÂNĞq\\³¯-ÿ\0*ş^h«Ô¼gæ“²’O¥s²ÚêÚ¤›†ğ†µ|;el¦õ@nù¯D¶:o’\"¹Å\0pzW…“*oFO½u0h¶ÀUÍhKd²äÄj”–Æ\0K¿NÔ\0é Fˆb¨OÛşgNÙ¨î5iì‰	÷¦Ek-éİ,›Aí@>¿\"åsTÌo¨>f\Zè Òíâûà1«\ra/î†(\n?\rY:äº¨İøfN~ÌHÕĞ›I 9-ÅA6¯öa´Ë=–¡b	fm¢›‰šÑ¶Ì¤Öäš¯Û>Rœj€xrã¹€ Ùx’œdbµRxe¬©<$ \\Ây¬©´»ûi7!b¢€:ÿ\0(ÁÍBÑ2™®Lë·VG÷Šx­+?¤˜.\r\0n„0F*#Sê)‘j°\\t`*Ò<L>W\r@•t¨|‚Í‘WŒ`ıÚh%zŠ\0¦ÃÊê)FXf­²,Ÿz£1Àé@ÊL6áºÕ¿*(Ğ±!ê)d½…hùdR@\rhÃ ¦ˆd_ZÚØjiˆPA.A4«s´òµ«ä/qšc@p€)¬«\'^)ÿ\0(û¦úa#*qT¥?e\'st bÔñQM*B Ö\\Ú¤²ü‘©¤·‚y˜AÅ\0K%Ñ™¶¢ÓàÓd•·H~_JÖµ´·Uù±º­lP~CÅ\0f¦™\Z€*qAVYj‹ËlĞv\\â“‚0Â­ªcï\n0ODÛÆÜâ£{0İhˆÀ¥ÛŠ\0Ç:w9¨¤€â·ÏjD·\rÖ€0Ò7jCÁéZ’À«Lû0j\0¤’ ê)ÁT¶sV~È5YìäW,ùTõ p§îŒĞ©‘µ›¨kVö¸vªœ>0ˆñ(@†Ù»QY?ğ•Úÿ\0ÏAE\0t#H·_¾ Ÿ¥G6š˜ıÇËô®šçNP	ÍeN\'åš\0Ì.¬ßpr@­ËO¼X[\0õ¬¦–w?*ñQKc%Èù†Ú\0ìíµÛ+¿”•İWÆèEy¸ÓŞÉ¼ÀçzĞµñƒZ™ Piöv4À­»iéTtÿ\0Ú\\¼ŒšØ•ã¸‹}¹\"€+ÈñÂ¹cÍfÍª‚vÇIs§İÌÇ®ÚK},DA—­\0GåÜ^ü­¦§‡Ãğ\'2(cZ\nájŠr“Ş€\" 0>‚§\n:æ›²œG\0O‚xÁ !ÇZˆ–\rƒ@(\0õÅ#»œŠ_/rç5NãT·±üÓÈP·66—qââ%>¤Šå5o‡š>ª¬ª¨ÕuñCİİ¼k™â´ìíîe˜HŒØ #ñ7À¯+t¶KüW•k>Ôô‚ÌĞ¶Áß÷\0ùfMÜwª7ş±Öbh§…}¨à—g¶?¾R?\nAp²ıÊú‹Åß-îUÍ’û\nñ}{á±¥3´1Ú€8&%9~•“¯ğšMWNÔ´öe»‰ÔjÅ7aN0s@\Z’\\ŞªKsïTšãwJ¯$¤uÍ\0Y{zÔ–zTJ­\'\"¦Xİˆ |G‚M8æ_¼µ¡›0É\'ÙÀ8\"€2…®Ó”ëR#]BÀÆå1é[)fª7\ny‰ù‡4&—ã=WJe+3=ëÓ¼3ñ®æßh»±ë^RĞ®xQŠ<¥wŠ\0ú·Fø£¤êÈ¿idl×_ew¦ê\Zİ•‰÷¯ˆWÏ÷Ç3.;]F‹ñRÒBHì½\0}u=£¨>Råk\"ä*ƒæğkÌ<;ñ¯xT¾8ó]Õ¯Œ4maT4ª½è¦X÷œÉV\"»ò¹LŸ­Hú7ƒu¬€ƒÓ–/MnrÇ\"€.Aâ9¢89\"µ-¼Jq!Åc}€cS³TsœPV—¶÷=H¨§‚&û„W,c–ò1«P]Ê¸ŞM\0jÿ\0f´½+VÃNX@Ş+*\rL¨Î*9µÙCa(³X ^p*9u[tÎ\\~uÂÏª]K÷sYWSİ¸?3P¡OâkKu,Ò\0½f?Ä=8’E${×”ê0ß\\gÚkxnâÜÉ4ëßV0LÖßîY\nåí´ùW\\‘ïZ°éVÒ˜Ğ‚ø¾ëSùb\'4ñi{|~gaøÒYhÂÔï¶\0ÖÍ¼ÒÀÃzĞrø^á†ZVüê|*ìæ&»;K´\0Õ ¶‰(ÊĞ–Íá5Ï+šÅe£ğ¯R“IÜxÑÂõZ\0á Ñ P’?*Ò‡AQ…@?\nê	ùE\\ŠÀÄ1Š\0åağû@rµ~(§‡§ÓEjsÊÕä°F¨ ~ÒOùëÅkÅsåš²ú:8àbššl¶‡0äĞ±ZzŠ°¶ ö¢‘Ö\n¿Ìc†ë@ÒÇĞU…´ÇjÑ…‘ÀÛŠ°-Áæ€3RØwõ¶_JÒòTS|¡Ú€+uÇJU¶ «a)~ïJ\0€DU¤òÁû£cp=hÀ(jAŞ¦Ÿ’:ŠLh7Ü4a¿\n£s¡Ú]Z%R}«XMuÏµ\0qwşYrĞI´ú\nÃ>¿Òßteœ\nôõ$qÔR­ÁP~¢€8_İYÄDßÑZx¦ÊeiŸJ¹{¡Û^ƒ¹@\'Ú¹­OÀñ•-m!\rí@\'öÅ´ü@Cš‚kI.¹´\ZâbÒµ=0æ ÌjÚøšòÛv„í@\Zÿ\0ØR’æ¥Š,ø¾™‹ìœ+`ÔW¾(·?ñí†4¨·ÏÌ‹´S%ñ„C÷²\0Ş•Ç_jºşRİ ªö~»¿=Û2ƒ@\Z—‹Påmvzb±ûKP“8eV®¶ÏÂÖŠ¥Îâ=kv8 …ª=¨Œ´ğ„×8iå>üÖı—…í­pX5°>èÅ)\'½\0\"A+ˆĞ{R–ªÓCÒ3J\0C?ğŠ‚M9_¡ÅYV¤v8â€3ŸOhşëTFIá<kL1Ç4ƒ\rÁ€)G¨9âEÅN·0¿Şl\Z’KuaÓ6Ÿ¹·)9©å‚ŠB Vhk˜Æ9À§-Ó‡Í\0]$RnÏ\n]EÑ˜~ua|¹caŸ­\0Fi\rIå’x Ôd`àĞ\r!¯â1Ö˜H\'èZ£1úÔØ\"šy ¶IœûÔ¾Xï@QÚ€!hÕ¿„Uy,ƒô«ŒJö¨Ì„œb€3ÁâåšfébûÙ­\\•ëLt@ \n	}\Z§IÒAÉ¦Éd¹Èªíjãîf€/‚½¨À5ICÆ>jz]¢Ÿš€\'d¨È§‰ÒAòšR™ÈÅ\0G¸v¤8#šd—ÆHÍP–óÌâ\Z\0·$é5FëQ2\r±šjÚÜMËçn\r9#9<š\0È6“]˜‘V`ÑÑ9‘³ZÛBt(nô_ìÑ Â 5Ö6Ó®×yWoNiYCx4ËİøF)Éh›iö¬{]Ø’av`+»Û´ğiw0Ê\r\0y¼Ú¶¥câ ²×^êOôæ)Ïzô‰¬`œÑ¯>Õ‡àÛkJaµ\02Æm:UJ³Uó¤¤£t-a\\¬»Ó˜µ±fÁ¤\Z®§cÃ«`PK%“@§yéY7\Z¤–¬BÖ\\Ş+šR`Eji÷— y„dúĞcªOsÁSŠ±m§Gts9ÇÖ·#Ó-Üf-µÚa_¸q@\r\\F¦µƒÅÊp)Û¤´9ÈRëÄ\0¨2heºkõ†©Ë¯C‚›Aj¨dšúLBšÔµğì~j\0Ê6ÑêgæŒûTéàÈw­Á§,C÷b£t¹CßÎ\\ømíÉòœÕ&†úÈf<°®¦Kä„~û­R“TIr°&ïÂ€9±âK›gÄÊEkYøšøàÕÄĞ¢ÔNéÔ.jI<j«˜ŸŸj\0³\rÕœÀ0Æ¬ˆ‘†Tä}kšŸÃw0Ü±À¨$¸Ôl$h ¯Ê¥!Œö®f×Ä.ÇœŠÖ‡ÄVÉ/Z\0¿±‰ÁRı¦‡Rµ¸LÆEXlƒ*E\0QzRˆ}jùŒgãÉ›¥\0V1c·²EÉ#5Î¥œ¬<š¦-gº|œâ€	ïäs¶!‘Q¦“-éİ&EmÙé‰AÍ^eÙÄcŠ\0Å‹G>PH©^Ô…\\VŸ&Ò{PX¾ì†\"-äAÜÖÉ‰{Ó~‚€2ƒ:uå¹Åh˜úŠìô \nâDz_,7\"šöe~íDÂXÎ\0 U\0¨D®ÍO/ñPàR)ŞddŠ‘Šœêh³Ä\\Ó‚,kó\ZuÍÌvîœ€+”Õ<F“û+t \rËëè-cŞî+ŒÕ<g$å Q¶>›«\Z÷P¸¾c¬@úÑk¤OrBºşïÖ€(ÉÏ6øÊÇµkCáÉ¯aÌÊc8®“Hğå½˜„;ú\ZŞù\0Û Š\0ócàÇÉıá¢½#d¢Š\0ÖŠ[›Q9³\rî•q;wÓntyõ@Lµ™\'…ØåI 	®6|[Š¥wewŒÄ§zÚ²9”j¦¹jé±”@sX]?ğ*6ğüÌ¤fº»ˆZó&ß½fO¢^zœPé°ÛÆÜŠ­ˆ.ìåØ›Š\nØ—E¹Ï9©Hˆ.%_š€\'Ó|d[:×Om}i~¹k“E„`Ôikqhs8İ?wÍUic1v®zÇ\\º†@³¶º85‹Yp%\"€#FİÛ\'–Hâ®l‚q˜~RXä‡=Å\0DV@Üt©&¸†8şr7V}Ö¦bóYßgõó’ 	§Ô]›l=*#£Hf\\óZ–zBÄ““Z*x(Ÿ´ğd0HÒZÙGj€\0)áß“æn¦€ìJr)»§/\'(FŞ 6²XÛ^ÄEÄHsíNØî¸^i”;_Š\0á|Cğ£J×7~é>Õã)ı—{ãØWÓ­w\rƒ*ŒúšS\"Í÷Y]hóãÄ¿\nµ]\ZF\"\'*¥r£Nks¶ê&zŠıÕ|1aªÆVx”“í^gâ?¶7Êïm\Zƒì(ãAf§ıXÅN,öŒ×¬ø§à¶£§ÈíjŒU}yÎ££ê\Zid–ù{â€3ƒˆø\"´mÎ*±ºÚØ™\nıiZî8#4;K´`TFPzÕg¸	*°g‘ğ¹ Ï7e§ÂŒç\'8©,´ç‚ÀÖôvy\"€1^ÕÜTbÔ¯ZÛ«•ÅV¸CÔP$öÎQˆúTÖšå’>GNjÚƒüB¡˜(=(°Ğ>+jzs¨Ø õ5êšÆÛ9Â%ñïšùÊPŒ9UíŞˆ~´öŞ•âıWQäÈ½jËg«¾)c_\riŞ\"Ôô‰•+€=ëÑ|;ñšúÅ”_9t÷4ô6 @Èª±jğ¯Ë2\ZäôO‹Ú^¨UnŠŒú×¡ißØzÜa¢–<Ÿz\0KY ºLD9«¥¤V¶£f{V˜ˆû´Í=“…i’»r8®šKl˜ªûJ¶ \n¶Ú$\'bŒÕ·ğİ³¯Ê£ò«ÆÙ9£Â®Ë\\øUOŸ¥fMágƒæ\nkÓ h›–ÅO(µ‘p@4äöö“£mŒ:ÕädBÂó]Äº2Ìsn¸ª²xldLš\0çà´Iğ`â¯GÖÃE\\:<¶ç÷ R#´<N3@Ã}‚/5©o\nİÂ WµœaS\rSÅg\"|Ñ>\0XşÏòúR­‘nH¨¾Ó,DÖ•­ül°Á £´•e-=ªì^[tÅYdq@#·ïU¥‰00*O³š’8Àë@›(äUeÒ9ZÓ+éJ2(ZKÜÎ Ô\Z6Øàæ¶I•YÅ!ÜG47^f2qWu¬ÙlåTa. ?1$P¾=(ÛëYÑêN×ao¨ÎÑ@\0Tk ~†ŸC@:Ò`E.Üõ¦1ÙÀ É)9=i—§Àë@\n\n1I“Ú²/R3PËx‹Ò€\'Á=M¢’+2KÆo»P“<¼dŠ\0Ó{¸q†\0Ö&¡im{ú\n´¶üg5n(\"Œ|Â€8É|çÄH«_ëòk±óTF)B¬£÷´h!µ#?*Õù\0\0*)­#o»U›/*hT2È3ša\0\ZÈo>3Á8:j@\0¬9 \rGJ2j´wOâÅLşöhLàæšÌ)¤–Ğ„u `ÓÄŠi¸^ô\0´\0ò*,àñNaÇËL\0!Ëš\0y,ÃŠDOïTSj–öêrÃ5Ïßø²(ÉA ‚i‚œ1¬}SZ²´Œî#ur\"¸¸b\"Î*‹i÷\Z™Ì™æ€,j\Z¼ó†’Ğ£+†ºø¥w¤Şù[®+Ólt†Ø«ŒäW‘üNğ¬v]…äœĞ}¤|TO)^äõ®»NñÍ†£® ŸzùûMÓ’ÿ\0JB‡æÅ>+[İ<æn=èéË{¸¯Ù\"àûÕ™!T#	¯›ì<c©X8ÍÇ½vZgÅ=¡Vìå½èÖ¤Y1ÇJb}êçt¿Ùß(Ôï[‰yot3«Ï½\0O&Oİ¨ÆE<Øæ‘Ô§=h\0VïS_gn´Ñ(\'SÊ©\'œ»Òçgj2[¥\05†)ªÛ{SÚ29&™çÅß\"€ğ4§=A5¼(2ÇšŠëT;¶ÅÒ©~öäóš\0‚êçÊ\'ÉÍg¾¡zN6ÚèaÒÔàÉVÅœ	ÁQ@í˜iØyù­¸mmã\\®3S=ŒXıÖªk*ô\'dÈÇåN”ï)”nj¢&hzŠ’=H±Ã(Ã{ÔeAéO	%;\0ô4VíHTçš”ät¦’s@òóÖ‚€u§dÓH-@\rã ¦œ©©DÓŠn\0Ä™Ã(5^êÆŞè|Ê9ö©š\nM›h»ğ¥¬¹*k&oÍÍ±#é]Î6ĞÚ€<ÿ\0ş&–=w`Tø¾k_–u$×¡Ës®\nÉºğ½É&E€9kmqµ6øS]e:‡v\\šÏ›Âf\"~ËÀíYÓéº¥£f7m¢€:Ét¨¢ÿ\0QƒôªşDªØ¹ø5»»!ş’b’o¬Ÿ¹Xˆsß­y¨›¿Ígÿ\0ÂHnÄ^µ%’Ç©İ°çÖ¶“@±wBÊM\0dC¦ı´†›€kF=ÚÌX&¤kiPâ>•\"Dñ©ioÖ€*=´ â,Ğ±Ïİ!¨çñ$vŒSfãTßR›Qû€¨4\0ëÏ­®T®MRŠéµGıòaµjZhğHsw‚kE´ÈQqn\0¨6\rÚ0İÇ4Ùü1dêq÷«@i÷9ùX…ª÷—ñi‰™¤‡½\0aËá‹ÀH²bV¡­^ør]—Oœ{Õ½[â4¨‚åúq\\ì:f¡â©·Ş+`ôÑé6ª6‚Zµ£5éÚÀ…5c@ğ-¶2¯5Ğ>™nƒ÷J•g¦Ç€Ç©­x£1Æ*»YÊ¿pñL1LI NAéBfª‰>ğ©RùW‚(]‹œšVÀSDÊÃ4ıê{Ğ8É©c¾^ï»Mòyí@ŒSLtğ­š]§½\0BR\n°ù…N#)ÏVKE5Y¬TšÒØig˜l@éÖ£û3òGQÒµ„|óÒ–P7)Aõ 9ñ\r£u.ÒË®{PÑçµµ-\0bø¯m[ÏÖQ»éTI·Ú|Õ}(À4Û{ï´î»VÛõÚÅ~ Š Wu7†í§$Æ€¥bİøHîı×—c$¹,­N¹[¹Ÿåj™´Ëeù	ª¬/-NYIÅ\0/Øo¼:)?µ®‡ğÊŠ\0ô7Æ1OòKˆ½n£ÇvÇ ¥sz§ƒç2Z¶Ã×ŠÉŠKí¶Î¢€;i­–AµÖ²î<2®|ÈÎ\rAcâ_´‘ö‘²·à;¥f“¯4Òé­¤[zÌSŒK…5j[UuÃ &²çÑCÑ´¨ğG8ÌX5JM)XóÅf½İÖ™Äj\\T¶ÚÃÜŸßå	 ÜXA;«*{¡GŞ®›ìñ~GÎjğÊd IçóÎÕÖªKatNèÉ®ÆM)aÎÔõ¨N\"€0¬/îìy™\"ºKGpfÀ>õYâŠA‡P\rg\\éŒÜÃÆh¨†ÊÎôoÜ	§Imöaû¥â¸¸î.4ÆûäŠÓ·ñ’.Ö€6Ògc†â¦áqQYjVWÀàWÚÕd¹;¨ÁQŠ\\ûQöy#0â”0PƒNòüÎƒQ3ã¯ ¸Ô\"¶MÁ¹ j\Zªè±n”Öü%	¨çÊ85®$ñB4¨´ŸIiôŸ¨iz¤K[Jß®Â––±¼bÇŞ·´Ë$²\\˜š·­ò®(\Z óP*œgŠ½œj6À=(ŒÚ|#÷è¹ËëŸ4b6n|Wm°8¨|·Gã¥\0|Óâ¿Ùí%.ökŒú\nñŸ|ÔôvwX”{Wßr…İóU\rGE³Ô­ÙeNGq@›’X\\[Ha¸ˆ¦;‘Vô»HşĞ`ó_exà®™¬+´©!ô¯$×şİè®d´Bø9àP–qÇ*J«7İ WA/‡õ+a²XXíYsÚ´ó_Â€0Ú#¸œTrH:b´CåŒŠ©$#4L.NqPË\n““WÊàcÂ9 é!8•°V‹GÔP´h2Xƒ•	·Tå—5¨ñQÉÁPYŠe;í˜§Ğ×A øËXÑ\\;•_z ÉéL\0(äf€=›ÃŸ%´‘ô—ú×³x{âö—«ªy²,dúšø©­×Ì*xî/a5¼¬€z\Z\0ı²ºÓuˆ‚áØÖuö‹<nZºûWÅŞø›«è2&éİ”ZöÏ\n~ĞÁÕ#¾çÔš\0öXVkxó**4¹{‡Ú¨EG£|CÑ5Ä_2TRİ³]ešiÓ.ëVF\'ĞĞds2ç$T¢) l¶H­sŠ~Eùi“©óh¶Zª)ÚÃmmCym0äŒ×\'*Ä[®Ú’¬oš\0ë&´†uù1øVTúbr3T—U–Í°ÇŠÔƒ]DËhçJhÈ¸÷ª«ñŸ¾qé]šŒW\'`õ$z:8ßœæ€0ÒõPbTÉõ©Ò(çÑ‚ŸJµu¤–lªOa-· Ÿ¥\0O¯ëœUÈµYàŠË[Ÿ|t¨¦×m-‡ï˜-\0uj\"O½Å[#ıÒ\rp‰â;9Î ”¡­+[é˜‰j\0ë\0Å±áÕx”b¯GğHÍ\0ZÀ4¸¦«åNh9 R¯5$ÓÂĞomò€j«XàeM^##­5AÖ€2\\Mã4‰¨IŞ¶J®2ÀUI’İ½3@¶ ³}î*Öônr+¼æÛôªqv£\0\Z\0é¤º!ÁBmAØü‚±ãiİ¿yœVÍ™@óHÍ\0VyNNEM£·Ş­2÷qK¸\r\0WØ\'QR¸ÂŒ\ZVcLÜ3Í\0>0ˆÒº©¨˜û”Xš€\r¸4¥³Şƒ´÷¦íô4\0ìZvi™\"š~´\0ó~µ–Q·AÍ<w¤ÉÎs@¤ÓäRJ1¡İ5¹ù‰5ª$=éŒºŠ\0©¬CbEÀõ«Fı¡Ö‰:íQƒT~Àa<µ\0kFCóšIfŠ]ÀükŸÔn®­\"&İKb¹Õ5éÌsE=è³¿ñVÏ¶6\rX:‡Š™”ˆÍq!–ãO ÆKæ«è·{&.>´ºnï/Ÿå-ƒW Ğd˜”šrÜÇf£ÉPÆ®ÛßÜO@¬´X£ræ¶aÓ¢A• b±¦½¸…>E$ÕXõÙHĞÍvc;2+”ø¡OC/·$ã¿ãªñäÓ59f¾²š0„§Š\0ğ\n¹K‡´\'OJê03\\¥­İŠf…Uœâ½t[Ã˜\"$0ô sìLÇrT®´ä;£8® x~ìä´e\n¡s¥jñlÃé@³Z]ÙÃ!÷«6¾/Ô´ÖˆõĞÚh“ó4d~Zÿ\0Â÷,HH3øP®—ñ`¡UŸõ®ëLñõ•ğ]ò¯>õã3xBEBe]\\­ı¦¯§\\bË{.{P×0_Xİ 1Ê¤ŸzyŒç(r+À<\'«_ZÂ$Ô¥dÀÎ	®ş,-¬Â›j\0öÈƒ÷œU›ô‹ıYÍrzŠÓW‰ZgÙšß´†€\nÈñ :Œ²œ\0i~É-ÏREiGd±ıÕ¥#hàb€*A¦¤k‰95imãAòâ“v{Ó÷ |»H#“Í\0švÜ÷Á 2úÓ|Òx\">ñ¡Šö ÍºIË\n‚[o»ÅLIÏµ&	ï@šÑ£)ÍE¾Xúæµã¯4ªÃîĞ¼ÇŞ«	s¯$f™%˜j¨ö‡*x \r UºsA\\V_™4=5,wîxqŠ\0»¸çPN)©qõ#5\'\r@[¥ „¦¥Ç¥8 Ì^ôÖ„ãŠSA$t \næ6›MO“ÜR½è2Œæ™å‰¸qSN”˜+Ò€*M¢ÚÊ˜£šÈºğ¥‘¢Œoõ®‘˜õÅ9cÀäĞ7†nT•ÅT	©iÍó38è\'æ¢h¡¼¨Šÿ\0„ÊKEÄÑ=EAÿ\0	(Ö_j¿”=+ª¾ğıµò#>Õƒ/€Dd¼´ûP…†™ep••š´[J…ú0…rri×úqÄeˆèuİF×ïFÍj\0èÍœÊzS%¼û\nnœíÖ°&ñÔ)Ç´×+âKÏLa\n¡ã8 ƒYøŒ–êÑ[Íí\\]OÄ·ˆ`Œk{Cø{çH³ÜÙçšô[*ÛNˆ*F j\0ã´?CnV[Å}ë°†ÒÚÌo\\{U–9û½)˜õ Şd£f\0Ô¼œĞ9h1†ëJU›œRd(6¶CQ$=ªæİİé¥H4AìÈ)¨R/J×ÙÅ0àuœ³<c‘R%ğc†«f4“µC-‚°Êğh\0óĞ¥Òªı‰—½0«ÇÒ€/g=(ÁªêUèµ,W¼~ğ`Ğå±J£óÕ©êAæ€ÔTxòúóšqŠiQ“h ™;€¥dix&Ÿ’:P3ŸJ\0z‘\Zmj6ô¬2=é›N9 òƒ}îEC%½³pè	úU¥ LòÔ¶h—ömŸüò•£òQ@‘‹Œæ¡–Öƒó 5$`ãæ¥)Ï‘}á¸æCå|¹ô®rhu/É›MÎ‡­wË¿…JN çÖ€9]7Å —ß+¹®ªÚx/ŠÄ¿ğŒdÉ\r×ŠÀš-GEÜn((¼’ÕW>b‚+:}9Éhx>Õ—¥ø­x]D}ë¨¶º†äµaƒï@ãE}¦¶T¢´m5¤›	ppÕ«9b10MfM¢Cq—‡† \r$T™xÁ_Z­s !\0\"¹Û´ÔìqŒTúvªÍ…¸>ô\0ë»uå‡±g¸¹ŒíE$Wl–PÜ®íÂ—û:Ü€8İŞ®*	<:³ò\rw·:2uŒb³%´xO€9Òf±lÆíÅkZk·6x\r’ií‡–1Iè(RÇÄ‘Şa$À5±äÅ\"nF5ÁÍf-è>ÕY|CujÁNHÕ_­ÆJÆ8¬ÈtÉî%ÿ\0HÈZŸMñ<s\'û×Kİ­ä{c*Ğuµ¤VGä­%—Ì†Ïi0Ñv 	U6šy“=ª%—wZ•Bš\0\'¥.Ş2jUØ1ùé@<›:RÅ#ÊRıœ¹æ¢¹½N\\1š\0K‰míãf™€a\\>¥âéb¹1ÁÊgµX×~Óª-23éXxRùNùÁ4-Ï‰&kÂIrzWg¢Nº­š›Ø$w¦xUC	.ç]JÅ¤Abâ€1uOØ^ä,(	ö®^ø;oxŒcP3é^·H-CNXmÆhäü3½Òde¶Œ²zâ¸[½\"[9¥}Í>ov\nO\ZœúŠãõÿ\0…ºv¤¬Ñ¢†>‚€>:–.>Pj·RãÍ{¶¿ğjîíh„¨ôæº·‚¯´Öo27ãÚ€8É!t\'*¹$ElÉm4d‰c`µWh£<ƒ@¦%<Ó5ÇzKcÕj¯’Êy \n†*‰¢â¯2T.´H¥0\n8«,´Švö YıáFÆ‹ÓíR™2Ô÷RËÅ\0^Óõ»Û +‡{]÷†~1jÚ{(wvUõ5ævğ¶îGª\rŸ æ€>šğÇÇ¤œ¤wÌc“^±¥x·L×£_*UÜÃÖ¾		’]Û˜s]^‘ãİi‚GÈ÷ ¸\'Ğüø÷£ŒvÁ¬·‚öÌâ X\nùÛÃ¿õ$eKÖ>Xõ5ê^øÙ§\\²­Û/>´ÜÃ—>Ô­§G³÷mÍGaâ#YŒ$ŒïZ)\n9ÌR)Ş€3İ­×pëKˆÚÜìlâ´&›ånEdÜX@ÏÖ€7l¼A\rÆõ­/Ü]c\Zâ¼¨aæ3Í=59a8Bx ¢}\Z9y®KÄKÅ!\\ƒíW×Är Ä™­F;¦ıçZ\0àôß‹2ÎO5ÑÀ³XãÉ…u­§Á0 U{›! Ønâ¤|¦ÉsTw\Z`êù¨¦€şë8 \rXîî-ıMXƒ[¶ËÁ¬˜õ¤ZOó)ÃPMÔR±ªVô®eÇÌMN:•Ì|ĞHYP|ÆªÍ|©÷y¬TÔfÚÙ­x£¾zĞoy,ÿ\0*ƒK”’¹5§¼iÊ€jCì(´6¢Ï5/“ê¢ŸŸïQÁ \nòÚFÃ€gË¦³}ÓŠ×eãŠˆî‡ä\\Â{â¦MCÉâJÕ,[†Ti°ÍËph8õ(¥ã5eBKŞ³fÓy1TÛípŸ—8¾ßºûœÔfV~b²aÔ]ïA­¯¢—Ğ\Z\0›Ë^ÇšBvÒü½TÒcwZ\07æŒĞW(„ÔñN)¤ŒĞE£4\0oÙÈ¤\n%;˜Ò€ƒLe+ÂĞÉŒ\r¬¡ªœú\\ä„U?J´ ZœX?	@íï…¡¸^@jçî| mÁhÚ½îH=j$œ:ñ@Ta¹³›÷ŠH¸­DÖÌ(ÏÒ»›*Úë$¨Íe\\xfP9 Ë=r	¸ûÖ »ÇîÕs\\í÷…ç¶%âÎ+,}ºÕ¹\r@äMBŒT­qå)AÈ®6ß^–,	­85èØ4ĞãUM?P†åc\0³dñ^ƒ¥ê‘İé6Æ(ÕkñÔ	©Yy±à„ª_\rüQ$¶³càf€=5ŒE ÙŒ,jGÒ±ÛY‰¤rN\ZÍ¿ÖÚ4/o Ú=è§šâÖŞ2Y\Zæ®u°%\"ÔŠãµB¥£Ÿ%½«“X¿Ô¥Æ˜­‚h´Ö5»@„İa\rqW\'·ŞVÎ/1»q[Úg€u-d¬š‘`‡­wZ_Âİ&­€\\uÍ\0y=–™«x…Â¬MDöè\ZÂ+EQ-ó3¯5İÇ¦G¥(KX×jVy/([Û&Ø\0tÅgO§êzhÍæºåÕ-àÿ\0ƒœS&ñ6@ æ€8Ø<ac [õ ZéôïØŞ(0\rT/t­eˆ>•œ¾{vİ\Z\0í£‘.4\n\Z°Ğü¹\\öÚÎœ1â‚’ÏÄ—–®àlw ëæSŒS‚±äô¬<cg ğŞµ­5(nñ±×i÷ 	Ë+qIå÷÷65Ùé@\nTšnÍ´ï71c@E%:Š\0iœşê<À8 Ú§ªŠ†[d~€T„ƒ@ö \n\r`ÀåI¤Äñõ´C°4æmü@bñüÕ<w¨ßz¥{D~µiëØĞ…’9>á¥éÒ¨½³Åş¨šA,±ıìĞòIê*2ºšoGF©–â&êhAå…Æy ‘Ú-d\ZM»zPIji&¤É¤#\"€!e-B iç=©<¶j\0˜û´İìM6FX~ñªZ´qª2İ¨IŞ\\Ü(Ç½aêÖ”¶K}*&[«ãÎB\Z·k£BŸ1å½èš—ÃM«8ijı+^ÏÂ°Ø Úƒ#¾+£Œy+ŒPÎÄçµ\0fî’Õpƒ¥Cöé|Ù­fÚÃæÛÆİ¨Ü¦>j—Ìú\Z®ÖŠF­GöIS¦hàŒ†œŠ¡ºXÏ9©ì½@7p*6\'½F·ËŞ¦Y£~¸ ‚š”„=¦ô n£ƒOòøÍ!\\PdÒ“š“4d\Z\0fsÖª¢Bö£h ü¤ôÆ²^zTÛ3M ¯J\0®ÖJŸtÔ-§İ«¹4uí@ÅçSÀ8§­Ï1æ¯c]­Ğœ´\0©p¦Ÿ¿wJ¬ÖÄ}Ú¡â€.€G4`µS3È½h[²½E\0[0š<¼u¨–øµ(™_½\0.Ïz(ÊúÑ@ iàmëH€ùœğ*GLö dì)Y}ş´ŞŞÔädĞeãû§ŠxXnÙ”Â‰b-¦•#\n9ë@÷ş¶¹ÉŒ\0{b¹{½7UĞä2DÌbšô‘€iZ%¹M·eô4ÉèŞ6IC~‡=2k­xnT=¬Š3Û5…¨ø^Ö`ZÕ¿µsÏa©é’˜ í@€ß:ì˜nµBãH†E&!†¬4L!ºŒç¦Mtö—ö÷j\Z9@>™ 	`¾±|©%hØkQŒ-ÂüŞõ®TMò¸È=êÎ‡ƒtcĞÅºŠár\0¨¦š\00À5sWºUå»æ;})mo$‚Ü©>æ€.]ªKŸ)0k\"m&öC˜‰ºûIm\'QĞ\Z¸cU»À%…À;e¥:\\,?z5ÙMl’ÿ\0\rQ—H8,h““K…rb5	ŠêÔï…ˆ­éíŞ\"~SPáHıá\0PZ‰$·`.²k¨´Ö-/Ôšãî ¶ ÀšÄº¸šÔ“lO”êof¤nÁúT&\'\\à\Zó;Å÷–¬Û˜Wg¦ø¶Å\\) \r%-»š‘æH“%†ju’Úê<Æã$V¡¥ÜÈÿ\0º$¯µ\0UÔ<JĞ±%%\0Š‚ÏL¼ÔMtÇaç§a£D¸k´ËZÔ2ˆØşèí@[éé£‘S4»¾B¢œ“oíJè£ôå\0\0qNhTÆ	 ·?0 ’Ã¥\0°¶FİH#*iÛ°9 ğçü7ğóNP`ü£Ö«Í¨A`~g\r@‚…ePAö¬MCÂÚv¨Í‰r}«Aõ¥O3€*K9’è‘åºÿ\0Â+IÑÚİ\0\'§ã$øYw`îñFÄA_\\Ì­ƒÈ¦Ë§ZİÄVâ ßQ@ŞiwVLVHjÍ™xù—i¯¶µŸ‡:f¤²}«È¼Sğ:Df’Õxë€(ç‚ƒ‘×y¬|;ÔtÂO’Äjäîìg·ÊÍ\\zŠ\0Çhù¦« m~jQäPW’KU¸à`*àÓYØZ1XìAº€)Ú@Áu`ŒŠš+oAOòw \nƒÔÉáhÃåÓwv \n^P P^HH13õ«‚Rí@\ZZ?Œ5m4ƒÎ{×¤xãİ†Õ¼rØõ5ä~^¢kdc–ö/…ş/iÚÊ(–EV>¦»7šÓTŒ<	Ï¡¯‚àšîÍ´”¦=\rtºWÄ}kHeßpì£Ş€>ÈşËeä6áNÙU¾e¯ğÇÇÃòGyÉîMz®ñ+KÕö+JˆÍï@d–PmŞã5sÀ‡ŒW­®,®âêû‡­W›MòØ˜× ÷ %ˆÃšµgâˆn\nâ±\'ğË^°wlÚ­C¤¤\nWw 9!¼\0œS.-bUùp+6\0Ğ®Å$Œ~õ\0Uº²YIã5Gì»ÔR\rt6¥GúÎjá·‚Qòš\0ä˜Ï\0É<Pšš“¶A“[·ZCKœ+6]D	Û“@i\"ïB¦™¥ˆü­šÎ‘.M©µ$w~ôn \rx5¦ˆ 5©«ØÇ¹ãuë \ZU„(&7 µ]\\divÕÇ­õÄ\r€K\nĞƒ[eÇ˜(x‚)»ñÖªÃªÅ7`~A åOjc°2•Ó=F(ÓIR0Àb¥1.>õ@F¨map9¬é´Ù˜I®SÒšXŠ\0ÃÜZŸŞdV¡ÔüÎ£x¤rŸŞÔi©\'0ñ@Çp¯Õ…N\0aÁÍbKa4G(Æš—³[œ0&€6ÊÒ’³ÓZ†«‰,r.àÃ\'µ\0IE \'°Í<õ\0€â˜Á‰È§iË(h£¦\Z›÷NRÌ¯Ò£ÁNO4\0¹f9~”ç•æ™æİëé@E=iÌàqŞ€K8¦°“@CJ0ãŠ‚]6ÚAó(ÏÒ¥’p¢·$b€9ûßG6L@\nçõ\n\\\"“xô®ıçXGßJ]MOİš\0òë•¸X^ÖPyæ¹í/EşÀº’å²Cœ×­İé±ßÊ˜cíU¿á7k‰NE\0y¹ãx­_ÊMQ°°Ö|C kIYacÓ5èzÏÂ¨\'rÁ2Õ\r‹uáÅÛ8¨ÆƒğºU“SÛ©®¾iö*>ÅVÕ…iã{›RxN\"º+OZÜ®]Âz\0”Guh»@ùê‚\"r0{Ñ/ˆíHØ_5JeûXÌIÔ¤uˆOŞ\"¨İj«1ÛëT×ÃÓÊÛ‹*äzBÚòÇqö;]¦çÏ4&€\"9xj2[|¢2WéVc»K™Gõ \nå³AœTğkN$©åº´„Î¯YWWQÜ-Óò \r–ºaó²â±µ8´÷R\n©ojÏ:UìÇ*åG¥O—$87j\0ç§ğçÚÜ›@Tö¤ÿ\0„wX±]ñ»m³]¤7)˜5y/£lŸtĞCâÛÄêÇĞiş5Š|$«´ûÖåÍ†—\"áI5ËjZ¼¡¾Ä\0=±@tv·JdQŸz˜„ş¼¡t½^Öl£¾ÌÖµ¶µ}§cÏV|P~TöÚæm|p¬vÍß­l[k—˜\"UöÍ\0]4Òñ§îF!Í4©8 lÏJM„\nvI¦³²vÍ\0\npy§³Õ\n¶ã’)äûPİ©@nôõaCœ\r\01³Q˜ÃjUMıé¬¸<\Z\0¬öŠzT\rdßÂk@!4à\nõ 2n\"|dàU¨¯Ê¬y£å…FĞDÿ\0Ã@\nš„OÆ1O,®2\rRšÀ/*qY÷\rj¤‡É¨t,@¬ûİQmòšç_Sº¸bHnÎƒr3õ ‹¹/Ûhf´-´xãù®95rŞ;X×åÀ5;2ŸâÜ((ãX¸P6Ğê)ÖœNO `PJü´¦Û¸éR;zP#4\0€¨ëA+éF(Ph¸È¥úÓŠqÅFSE\0£u[#ô Àê)L˜é@^ÄgŠ¬då5t94íçÖ€2JO	ä“RG¨ù|:äÕöşõ0ÛDİV€\"ùéR	w¨ŞÀò*»YÊ¼ƒ@¶ƒĞÓJ8ªJ%‹®MH/L}W4?–Ô¸5êúŒTë,müB€\Z	àÃø©I^Ç4Â3Ú€•¦J8hÈ +MÚ;ô¤TÁäĞ‘éHBµ=€=*=‡9 1/VäTmjĞTİ¹5 o\\P{éçøMDmeN†´rsÁÍG=Üp.f!~´GËšŠoöíˆ\'3¯çE\0v%™›Š•?+u¢6%Î:;WyK R8ëQ¤lI/Å8ìYÌ§ô«uËˆÑ†hPuæ˜ÊÛªi hy¡~îM\0F¤)ÃT \r=Ã\"£Û3@C°õÍHŞTË¶D˜\"\"(6÷Ã¶·ªV4\nç½r×ÚöŠL¶îÌ8ß Úw)æ#¤ƒ(o­\0pšWŒ¥I7èS5ÚÚjV÷h2Ï½ej^µÔÔ°6ö®^]\'SĞ¤?cÜè(Ñ¶á¸óTå±†ã*T\\µ‡‹g·\"=DõÍuVZ¥êßZ\0È¼Òf³ıäHôënhX$ê\ZèŠœ|àª6Ïş¬\0hÊ^ÛÌ —\0š$¸5Ê6êæ¯tËˆò`&«ZµÜş‘¢€5nï\ZRUcı*”úL×‘ü¹\\ÖåÕ“€«QUJå\0Û@s\'‡® êÄÓ>Ç°bEÍz;ÚÇ(9“u¥#@CÚÃİQ¸³mû ;~•×\\h®s´VtÖ-l	s@QêWÖf WE¤xä‚#¹cKs;d³îa…hNÚ€=r×QµÔ£XjWÓ•†Tæ¼AumFÅÇÙË+¨Ñ<mv¥Eæ@÷ @0ù<Fİİêµ¯ˆìopûÖ¤1Ã*æñ \n¾Xn1Lp#«3Fñ\\£9É ƒ¸Ô‚%=j7u…rM`ê:Ù‡;\r\01Ö×KÓ[ìÇ÷¾ÕÉøsÌÖã3_ÊWŒÖºÙ.µûË–Êú\Z¶4ËDA³…oA@š­ÅÔr¥µš–¦Ev¾Ó¥¢Ë;|ì:\Z±c¦Cmn­2«SVœ	@tô\0ö˜šBê1NÚ!\09¦´jß2š\0ˆ–+R\"¬¼\\.G½98Å,€°éŠ\0ËÔ|?a|…Z9ö¯=ñÁ‹\rP3FŠ„ûWª…!i¡·$â€>Jñ?ÁyôÆv´Œ¾=yõß‡o,¬Ğ•#Ú¾ôšÂGï#õ®WZøy¦êÁœÆŠçÚ€>)Hš7Äƒe‚à×¿x‡àÁ;ŞÕ?!^c«|9Ô´÷lFØÔÆ«2©\0Q\Z8É5rêÆêÉ¶Éö¦FÌ8aŠ\0ªë“È¥òÜŠ¶ğïÒ§SaÜsJSi“<Ó6PR”Ò•d¥!LP6Ş ’õ­ëj\"¾Ô™åˆÎPm5<:ı«·™†¬´HG=jS*3Š\0ì|?ñcTÑÙMÄÎÀzš÷?|uµÔBE~À“_+I\ZÌ…¥@¤²³º¹™KfßŸá Ğ½;S´Ö\"YL#8­˜Èã×€ü\Zµñ¡Œ_	|u¯£cPè¹ûØæ€2š\'Ï• nâ¶KéMd  Ãnı…=ÅZJEEp¶(±\\àÔ¬±°Ëâ¹»½`[±U\\’àí\\ĞIs¶ÂxÍ`Ïn$\'Ë]ÕnÖÚk²“¶µ¡±[r03@œ–¥j=¯ 1&»ymÒdÚ@Ÿ&ƒ,¼š\0ä?´ä¶“l‘ä\ZÓF‚î<±\nMI}¥É#|±ñô¬Él^.äP“nñ6amÕau˜@\ZËK‹‹sò‚Â¬®ªbu€6muâNÙEkÇwëÃ\0Mr\"x.àÓÄ3CóFÄŠ\0ê^\'(Ù`íÆ9®r-nhÙ­(5tdhÛCJ²nàÑÌsõ\"Ñ.2¦€\"‘p>Zl{»œSÁÚ~jG%¹J\00s†æ†·†AóšO7æëQ·Î~S@çÒ£o¹Š£-œÖŸ2}«a/½9ˆ‘š\0ÄƒY–6Û*`VÄ°L¹,¨d¶Š~\nUeÒD4Ns@\ZEÁ?/\"!Ş¹5Ï™®àl%EY‡Tq&E\0hØİjRr˜ëPGsƒ,ÜÔáĞñÍ\01cÈçŠ\\(÷¦¸pÜğ)Û’1—<Ğ€=…!ügJ}V4ÈJ¡%Ô×s84¯4ğ[.U5•q­I!+ÔPÙI#æV5§œq€	 Øíî.N_ \Z»œ±`±Üj×˜Ã€¸áƒÉ<ĞFŠŠJéÓŠ‡{€(27q@Şß=2k8$ùCPÒ†$`t Ë½Êè(>¸®gRø~òeí¥+ì\rvûFiÄ°èr(È.4=GK“xİ ZÑÓ¼csnDw•ÜŠô‡‰#QT/<5ex§äU\'Ú€+éş)²¼P²Ê½i³uÜ“ük½ğÒ^ÚRµcÏ¦êÚvDEØ\n\0ïn/ã…p‘‡¬K˜./Û÷YŒJåíuFÖ_ôèÛf{ŠëtßÙ0q\nhªxzé~gµ]·\rb~tÍtº¥È&ñ©§µŠUÏË@ ½Y\08ÅXc«Ífİùvù~jÈ–æñ›‚E\0nÌ°D	ÈÍ`^ß±buíŠŒÁ+fPÀV••¤Óıáë@g\"î;°jÕšËn{šê’êP£ß°¥Ï @ínmÜaÔCÚZ\\ûµ4Étô·$î¬kËé-ıŸ,hÅç† »È\n#÷®[QğÌš^d¶¸,G`kUu›ù›¬ªkFŞİg™‹ØĞŠµ[&Ùå3\0zâº}/Æ†ev6ù®Š-*Õ¾üK\\UMCÁ–×\0¼$)>”j=bÂEÈ˜nôÍX†å\'ÿ\0Wó\náçğuÌ^)ïU%Õµ\rãi`(Ò¼¬‘Šaç­yõŸ%y@¹W½uŞ\'°¸\nŒĞÎÅõ£jÿ\0z™ÅµÂåsïJöùûš\0CşÉ¥(@É5W„ŒÔ ³.M\049œK7jÆ‡æ\"ª^j±ÀÓ@÷àbNQº¾‚v8-Ym}uzÛQHCŞ¬A ;ò± \nÍ¨\\Ü6ÔS´÷«Ph†b%™¿ZqE¨Û°T›Ãr=¨ºÙÛÄ>àâšğ£ğƒa“}Şh5ôù	Ê±I­½Z¶Kt¤R¿Æ3@¿l‘z©©ã¿ÏŞ«Ò[Ç\'aP6š§‘@\n.\"n§šxpztª’iûNCT[¦åŠ\0Ó\n\r!LV`¼‘:ƒSÇzß4ix<ô§’\rF³ÄüÍ8íè6(ïS¡¤x±@•©6Ò¨ÇZu\03miôP0£Ìè%‰4ye4\0ÒUºŠi…:ã5\'”ÇNh³Ú«ôªíbËÈzĞ\nO^(òÇs@™’.œÑöù‚•£ò¯Qš•$è¢€ K…¾qS©‹³T/d¡ÅBl]9V4{ÌQÂóCFq‘YågN€šAwp‡æSŠ\0¼)äR“‘Š¬·ãø…H·1§\0ÿ\0/¾h3œQ]_Á{·=ëŠ×¾ Ah­-óĞU«êöz,òJ7Ó5äÚ÷®5™ZõÀ\"©´\Z¯‹.>RŞS\Zít‡ë¦ªË2†z\0óS¤ëw&4Wº@ ãÚŠ\0Ú×ü]gáÕ)q÷ëˆ×¾!ŞÉa$ÚX8Ç®›QĞl<mœìºàš†ßÀ	køèÄü;ñ\'Ä:†¥4¬¼’wz-ö½iyö‹­æ\"s^‘§øEÓayÄJ.1‘Çzå¯5¥Òïš+ÈwC8 šÛÅ&ü¤[Nî†ºeFû0cÜV…6uš©&3ZÍªÅFÁ@£/Ğ9ÈëUâñ„²ùI*nôÍh„‰Wyqƒ@)\'­)Ø>õ2CÎc9Ôí ¦OZ\0p!OÆÁ9ªÀ©€PóÇ\\1;]_qIŠp \n\Z‡‡ìµ—\\úW/¨èÚa2i¥ŠJî§¨©ÆFÇ\0¯½\0p\ZgŠ¯-¥jŠÛG×ei«ÙÜ 0°Üh½Ğ¬¯”³(\rô®Z÷Ã—VÍºÀ4İ(VPÃ5¶qÎ0êk†‡]¼Ó0—*Í·­tz_‹-o@I0ï@^h¢\"^sUmï¯m$ÄÀùBº–‰g]Ñ8`}*j¯•xúPëP0ù>µ+jv¬8 šÊÔt—&Ó\"±ÓO¸³|Í¸Š\0ßº¾,¹¬§³º¾9u V••í°\0H0}ërŞh$_İ• \n4£\'­fIáójß0$W¥º7n•^K8çp3@z¶ˆÜ•U¸²N\0\0ûWqu¡|±X÷\Z+Ç’E\0rb{sº&lÕë\r~úÉÀbÅE[š! â¨\\:`ñ@Î™âûk…	r@ozİâŞé?pëŸ­xŒä’~ÏÔ[k\Z¥‹\r¬Ä\n\0õbÊëÄIÕÉÉo sö€jö‹ãœ…KñŸ­uÜiº²åJ‚h…3Km‡!*ÅÄqMæJÜ×E{á¦ošÜ‚¾ÕÏ_hÒÁ’Tš\0»>±stË¹ùtÉgo¾sóÍpvÓMløÚGÖ­Mw$ŒŸ—½\0nj\Z¼Ú”¸²Îí[:BN±ÿ\0¤k×T³°·ıØCVtíBkÙ³»jPO´gå N¥S}V(0™ÕjûBîû¢€%Á=:R°XĞ»\0¬íCUÀ¸1ö¬I®¯5\"DhZO[	¼•åºV”‰”0ïXºg‡cÍ¹áúäÖÈ¸†Ü„Yï@1ÚP\ZÎ¹Ğ­¯ÃyÑ\'>Õ¡Ì3ÁjXÑüÃ”ç:ÿ\0Ãäsk¿é^Aâ?…¶ÛÚŞ3Øõ;¨ˆä\nd‘Cr6ÊŠsí@\r\\øzûMr.#lj£\"Œá”ƒ_iêŞÓu5lÆ¹>Õæ~!ø4ŒXÚ\'Ó€>w0n\\­Bé·­z>³ğ³T°£F+ô®:÷D»°88ö qş”ÙgZ´CúÔL¤Ÿ˜f€*cwJiÖ¬|û¶ÇÂ­AáíCR AŒûP,ëPoËmT\'>ÕéºÁ­WQ‘L¨ÁO¨¯Wğ÷ÀX`–7¾@W¾E\0|í¤x\'Sñ‹´N¥}\'ğËà¥¶\nO©FpEz¦àİ/DU(+ßºX\0À \nÖ¶–ÖJ#·‰TØU•@	4×­(884\0¤úP@4˜çÚ›$©Ë\Z\0vÑTïncØS<Öv£ª8$AúV}´	84ö<„•~ËFp@­[{%Ú7jâF±ğ´˜€P8©ˆ=©Œç £\r@\'€sHÎ¨2ÄU9µ(âéÉ ¤àVuÜVªÙ—F[éî[÷9œ,e¹½Í\0R½òäm5ú\\ÎÙ”µÙZé‘ÁÉÕ™ EÁ€8)­ÿ\0GÎú©ıô/‰Ø+¹—K…¿Õš²î´)_>”ŸıœÉ‰°£òÃIºùjBIÁÍR&æ3¶0@ \r)\'òjå–´È@Ÿ8¬a¨­’n»#ZÈ»ñŞ–²ygh4é1êV÷\nFiŞaŒáH ×ZkÜ€ö²ì\rmYê³™À ¯†Z€Ÿİ¬ˆuèˆÚãš¿\rÒL>G€-d¨æ¢ß¹ª@œÓH\0ğ(B(à{Ó	=¨ï@b®0TUG´\"­dwâ«Ü^CR	 \nói„¦a5÷7\Zt„ÈI®É¬;’°Q}†}CıhàĞ-ãJìaóÔ+}=û~ì¦¯§…-î”|õ7ö3À?Ñ¸ ÙéA€iÛš½öxá8@\rc:_B~bqV`ÔÖ0ÊI \r2ªGLS*$¼I9­YM¯Ò€\Z<I°v©¼®â›·i ÑlštÂ¥u5’€\ZŠÁ¤*TñÒÂ•(ù†q@ˆıiÁqRcÚ´\\ö¦ùäÔûiŞ]\0D /½#Æ’}ä}*.åĞUÎ…i~¥eE…`ŞøØäÀp{b»1i¬¬”åWÚ«¦dÙ VKx‹\\²;nğ+Û€YF=ÅSºğõ•æ|Ô^}¨„Ñ¼Aiskî$÷®²ÆâÊp<‚™¬GÀq;“iÇÒ¹û¯jú[n·fÀ H6á×¸ªshğÉ’\rpÖšş¥fqvVÏÄù.¤9ã4¿uhmPzV$ÚôÖùD¯Yİ>¡‚ò­ï[pøzÖ@ğÔÊÚŞÜŞH<ĞBÖä\Z|`¶{Ö“é°F6Â¸?J¥6Ÿ<Gty ?Ùp•à-W:j)ù:ÓC\\D¹‘°*´¾%‚ÈâA¸Ğo ºUÄY\0UdÖ’ì¹$š˜kgSâßåÍ\"h\"fßtw@\'ñ8œì·^MFšdº‰İr£i­øGíÍºá©dµ¹¶\\»@§ÁºsÇ—À5™sà´KY1Ïµt¼„áÁ«#T‚Ä~õ”}hÎ\'±Öì_÷[öŠ±iâ«­4íF:æº=kÆÖ0ÄÛv9ö¯*Õï¥ñí´l7d\n\0õ;ØjXU`HëZxšÌGµ1º¼ËÂ¾½³o6bØoZí£ğ®>fÎh\0in¯äÌí&´mô’à}¨óM‚,:T©¨¹lH\r\0iGvé¶5¾sôÇ\n^#S,Šı l0ùª 0ŞÕ` õ¦:\n\0RØéLó\Z—iirZ\0&†\\õ¤ßéA%¨¤`Óƒ” g­< êhæ€õ>™ \n­mõ¡{9Å^òèĞSX²sZ­,w`÷®…S4²\0İ…\0`A<±Şf®E\0ùªËÚ«õöZ5\0EÒIÒ¦P¡¦>–WıWA<]3@|£M+Š¦³Ì¿x\Z°—cøÅ\0<©â›“éSîVÈÅ&÷ pOZR»F{Ô¥=*\"ŒOJ\0afô¦áZ˜û\n0}(!=iAy`(ïL”€0(\02x¤g*pjhĞ¯4×*[‘@FqPHœ«\rmàSnn`°2M\0@,¢ºBbj—pE”€å½©nu	uÙjÒ§²Ğ†Cİr}è™];PÔ±»aé\\N½à+ö»2®â:×»,Bİ\0ˆQµ%âUğ +ğ½ÌÚ*OOjí#ñ…«æV¬ú-•À;”dÖTşµsò\n\0›şİ?ĞQYÿ\0ğ†ÅE\0iêŞ\Z¿±“ÍÒä+çh5{Dñ‹Ûâ×PL?MÄWY#ıaÜ¾••ªøvÛR¡@ê(òÉ\ráWIA\rÛ5Éøÿ\0ìZVò½¿&8Àª76:–‰&b,ê*ı¾§«‹ZAö¨Ë<1­Şê—N¶ñ<1ƒÇjí®®nüŸ!U™Èë]¾›áİ !6ŠÇÒ´¡Ò­­_tÑ†=¸ Ó<#­ÿ\0hµÛHáÎ3O×¼g¬YÜ%œpÈBñšöİ‘îÊ(	ô¨›FÓ.Ÿ|Ö¨_×…àË»BÁíJ±ë¢òpNOá6ÊÕj\Z&+Ö€ v§…æ–ÚzÓñŠ\0nÚP´üR@ÀïN\n1Ó4¦=Üç	vqŒĞzt¥Á<v5 Äƒ=)<½½è¤úmœê|èÃ1ö®[Wğd™tâS¿Ú(ÁäTa”æ6šÖ§áù|»•yq]n›ã{ğ«0ŸzÛ¸±³»R%…Kø®cQğX“/hv¼PSÌs¨pÀúS¦¶Yù‰šóß;Qğû}Ö\nŞÒ|h—D%àòÏ½\0Z»ÑDç|¤Õmw¥6XWYğN»­Ü1ö4Æ>iÙ2gŞ€2muŒ€²ñZ+w¼Áš­u ¬À˜ÎÓ\\Õö‘{o\'îÙŠĞO.£´üƒpªWor¥BøU=2v·Àº_®k¢‚{9q³ JOÍvÛ¹¨%ğ³Ä¹nkĞDkŒ§Jã\rÃP˜>å¿ÜÇáA¶‰3^‰s¦E2| f°î´\\…É *}6)ypj¸v<ÂäcŞº™´ÉS$)ÅgO\ZÇŸ;Š\0“Jñ¬ö€Gu–íÍv:İ†¤ƒÍÚ	õ¯8¹kf(¬™fº·Ë[1Àô Y½Ñmn	kr?\næµ\rx›äBErzo59‚Ì¬T\Zô\r;ÆV×h«r ë@É´(Gš¤T¯tğE‹s¥v¦ÆËT1²‚kóÃRAŸ,™£Ü—uÛgë[7ºùÛäY¯\'ŒŠËµğıÄ“ô*3]m‡‡¡·åš€0ôİæéşÑxÅ—®\rt°YÇ!´/Z¹Ê\nãIñ(èhÎüwñipIgj¸˜ğ¯1Ò¼s©I;G9bIâ½#Æ>ŠæğÜ`9Îq\\½§…X]‰LQß»áNòçPf!3Ş½:}N@pXû×–_j6ú{‰¶*¦™ª\\j²…´c´ìkp%PØÈ4ğUú\Zçü9¬ÇzGV^\rtaò(2òoìÜÒ±b8¦ª‘ËP$´·»R&Œ0÷ƒ¨øIÔßäûWKÃp´‹9 Öş\n[Şm\0LúV·ÀGY3+df¾Ï½!b=èËtÏƒZu²>5fÕ×iŞÒtğ6[¡#Úº0Ä”›rM\0G\r¤ cUú\n—q#)ÔÖQÔœ@\n¹i-Ú©\\ë6V€ù³¨ÇlÖ\rßm•¶pçÚ€:°¤\nBÜóÅrv)¸¸o–\"GÒ¶ ½–è|ÈV€.Mv#k*o:å¾\\â´Ö×-V4A€\0fZéc¬£5¦¤k…ãÈùhÈQóœ\n\0QÔİ¤“Å@÷ÆYÓêR¹Û’(VIãŒd‘š¡>ª0Dcš¯¬×¹\"­Á¦*òô”ò\\Ü¶ \Z¹m¥³s1Ík¬1 áE8ğ8 bµŠò¨ÍJ¤t”.:ÓHÚx 8$qMEÁæœi\nŞ€ÈëL;¤ã ¦=Ì0çsÕ›q¬•ÊÂ3@\'µ„ŒÈEajBŒˆTö©<Ë«¶ä\r\\¶ÒrÁ¦æ€8;ÿ\0\\êq3é^i­xğÎDjÀç­},`HFxªòéö÷ æ0×àŞğµş“¶Yİ™Gl× Zj1ÉÇM¤WKs¡í$¨ÊúV5Ş–ÙÛ{}ñ@o)ùXQÉÌgtHö5š4‘|şa’;é­Ü¯c«Mmp	­Xµxå#<f°Rî9‡ïT-\0Dç8Í\0u©4.2\\\n†{Èâû¬\Z¹ˆ.Ôf68¦ÚK2H<òH÷ \rÙïä»T\nAõ¢ßH™ÏïÉ5wN¸´\0nÀ>µ«º9î˜\Z\0¥—;rjpâ>qøUíåsJeãn(\0<ÎMHéÆ½\r& Ú! ù¹ª’iĞ¾FÎMhm+ÔS¿\n\0Á}HIu<zUsq5±ÁRq] f\'2(6ñH>dm©–ÀqŠÑIâ‘~ğÍ2m-îUt©mşdb}¨YcVû¦œmN:Ö*Oq$\Z±®ã‡¢\"÷…;`?wŠŠÈ¥åØ\n¶¡Xf3‘@ì£eM¶ŒP;)àSñFÚ\0n)qNÙK¶€\Z8æ—ƒÖ•—ŠñÍ\03`íIåÆ¥*J6{Ğh¬­œñI;+|¬¹â‡vsKÇq@%Ñ¬î”ïŒdûW-«ü<·»böêû\ZîH§Ör¼u \"¸ğŞ­¢ÈìÊ:V´ÿ\0_YÌL@õêEuÄªëT®t+• Â½@ +?[İæa	õ­VÖìã&erGL×=ªxË“hÛ>•Ê^xSTÓÛx‘äµ\0v7³Ë~ßèÀ•>”–ŞûPİr¿szwˆîô’x	Ç|W[aã+{ ì\"Í\0C7†ZÌfĞàŠ}´óÛ\r“‚k ƒQ²œ\r“\'Ş’é¬R2ó2¨úĞP¿ü©Š±ö»që™U}‰®WÄ>,±²F[FVjóyµ_]¹Ûn]PÔéZß‹ì4ôa	Waé^W¬êúˆ§+d® ÕÕé>º¹t{âX¹®ûOğšªÂ%${P•øÀ·²&¥¹—¯5èúg†ôë$!]ãÚº<#\rˆ»\ni¶òy \nŠ6|¡p£§¼Ÿ¥XfcC(\"#èã5ÚÂü…«CósNìZ\0Ì“M9Ü‡Yáš.™­ ×<SÄ`ıáš\0ÂK¹Pá«)~`Ö™´‰ÿ\0„TO¦Fİ84\nJ¯ju[½Um5Óîš‹dñzĞ’;SZ2;Uxîäï\n²—Ñ¸ùø m>”¡I«\nñÉ÷NiŞ^z\n\0¯å)à`b¤*Gj]´ÚPµ&ÊrÇ@ªgŠÔû6ŒÒn&€+ù$PŠ³ŒÑ¶€*°lÒ…ïUŸ/u@4TÁv¨Í”l8ÕÓ:Sv0è(&m:UåIÅSh§Œ÷®’F¨ü¥cÈ 8î$O¼\rL/ü¬1Z­mtUw°I~U4Y$Œ÷*”5é\rİlÔ-ĞôÉ mo»J \n™~µMoå‡ªfŸëNãÊ(èI}¸â¬ÉQ¦÷ \ZŠçQ³µæp\Z¹ë«ÙµÛjI_j\0·y«¤!’>OjÇ‚ÊçS˜›Œ„=3Zš~„Ä‰.»zÖØ\nì‰vã½\0g[i1X€PjÁıªb\Z/¼sJ>~Ø \n§ àô¤ÙVzˆ¥\0CåZBz\Z¡õ¦z\0nö¢—>ÔPH\r($ŠAÖ–€ş\\«‰7Ö°õ_A¨#<dFİ±[Bœ6Iæ€<ñ#Ô´ş]Í5ÔiÚü7À-ËmozÛxåJÌƒmsz¯†G2X¯ÓƒÆDJUÁWŸÃ}©i.Ğm€×Y§xÖş5B@z\0ÒAÏSOÎO4ï)vnF5s»+\09ª3Öš®£­?!ºP[”§8¤*W“BËÎ(qëO\n;Š\\RĞcÒ”-(¥ \'#(Åõ¥ ­§Šn(#(“ÃÀÛ$@ƒê+ŸÕ|!Äm%±ı±]a·è…JrçŠ\0òÔ—WĞn¶ w@k¬Ó|enÁSPù$÷®–x­îAVE\'é\\î§àËK¢f\r¶NÀPGÔwh\ZİÁŞ¥\0t•A¯5’\rkI—ı3D+VÇÆ>NR7½\0t÷zlWpšÄ»Òç±;í‰jÜÓõ;]EA·qùÕ·Rx\00 zËY–-Ø*­kÃ©ÚÜ`+óIu¦Ar¿½k\ZïBk|µ“h¢y£‰wnªsjP×&¸ÿ\03RŠm·A¼¼Öí’ÙN«æ6Ş€æòIAòcÈúVLš$ú–w©\\×k\r¤1.WjõKk`@ÆG¥\0p2ø6HZ€é?dûë‘]„ÚÈ™HUæ²\'·º¼?\"œ\Z\0æî#´ŞŠ\rd\\ˆ90¾tÅu·Q—U/øD6¶ã(’\"Ôôù’\\¨<WqáÏK0TÔzªú* Ã(âªMio=ûP§Zë1:†=«D®ì2\rxs^Ihû­™‰µ¤øÚş7	rË´êåéQHkMñMµĞÄ‚kj+¨g \nRiÂwİ\'>ÔİNÕ`°o³Ä…ô­PœûT&BeØFV€>vÖ´­OÄ:±·™Y#\r^á&›aä7$ŒWZ4ËVº.#PßJ»\"&8PFá¤ÒgyPçq­ÜNÜJnXPòJLî<R	;\Zx\0Ğl9\'QÍ!éA`£&€´æÀëB¸o»I#\")2\08`ô¦Èé\n–à\næuYØ#Gn—¶+¾ñ&³¬Jc¶WØx CÕ¼g§i±¶f\r í^k­|Q¾¹-o¦£6î¬Ù|>¼ÕK~Ì7uÍvšWÃí?O*ì¡ÜzŠ\0ò«?]×eÿ\0J2\"±®ûCøp!-Ì¤Ÿzô¬­á\0GŒz\n°:P-*ŞÎ0¨Š}ñVö*ıÕ’I’?¼j¤º¤IÀ94xtæ –XÓï5f½ìóB\r\"YÍ1ıîhËê2#æ¨IwsrÛ6µ©\ZMXXãQ€\0dÁ£—;İÍiÅk+ Ôá@éKœP\0AŠ2i	ïÚ”ô \0\nZo5—	ùÍ\0JG4eºVeÖ¬ˆ1Éª{sqò 84³.¡@åÆk*çX”’-”šlZKÎwLH­[}>+qĞ\Z\0çíl.o&ß1 \ZÛ‡J!–Ã\Z¾6º\0£õ F¨£@§•¥qJï@\rÂ´ÆøjB Ñ°\n\0ˆïÒ<QÉÆÑMê8~ñ—qª8·äĞ·ºu¹ÈÀW3wq¹ë¼Ö²ÚİŞ·ï2Ö¶#-ËP\Z¶Î˜6\n£qe%“n‹\Zô“aƒ@JãDÆ2h‹²Ô®IÛ</½i±µ•rH\rW.4™@ &Ò±çÒ	$œĞ«hÒ¶!z9î,“ŠÏI§¶8Œ\Z¶—L~k@¶ºÑuaZ_ÛHx`\rr¿l·—å^\r;ì¿<O@  ÊiFå<+ƒP¼·l•³o®¡\0MÖ€6g¥\n¹ûÕV=NÙ±‚2jÉa(3@#*óÚ€iAÀæ€õâ—hÇÍÍ5¥*äõ xQÇ**“é±ÈOAZi»px [­ ¢\Z«\råÕŸÉ‚EtÜƒQ<7Fh>\rP6<ãŠº—?İaUn4¤¼UÒå„æ2hxa¹^iÇ\\øîÜô;E[ƒWRpıhPŞš†;˜å+\n—µ\0\0œĞEÑõ \0\nu7h£š\06óœÓ±H=éh›)JñN¢€\"PE8¦{Ğ[Ò€Øë@\n	y¦•I8eê)Û \Z\0Ï»Ñ,îİ‚}«–Õü³«5£í>ÕÛÈË\Z–s€+û]D-şf -¹Ó5_¹eg`+›¾ñ.­¨\\}‹ªçì-Î¦}Ê}ªÄ^	°8‘Ğy‡”æşğS_:Ëw!lö5éúW…í4ô]±©#Ú†ÒZÈ£¥	uuÃƒŠ\0×h‚Œ*€*2»†:Ôj©ŒKS­Ìrÿ\0ª4”²x¦¸Y;Õ¡	a—#\n/İë@Ú)©^Õsiş!Å#qĞP .rx¦ù`\Z½É¥êİhˆ()íW| 8yTGa FIëW<ª9 \nş[q‘@U<«ŸêÆ¥7\nü¥\0Q{E~Â«É¤¬‡9À­<m´—7i±»uë@²Ø\\Eÿ\0ß5Q¹ñ\ni. všÎÖ<x4:8İ\'jã/{ùšûlSÒ€=2ÇÅzuÈÜò(_­jG¨ØÊr².ÓÓšù×ÄÑ]-¾íÈc^x¬]Çû¾Ëq#	SÔĞÕª‰\'(A¥L-™y?v¼\ZÇâUÕ 98Öi-®\0Šå€>ôé.¿6¥(ˆgŠÇ°ñ¦•22.ãï[6Ú­Ïú§SŸz\0<¯QG–*ÃÂÌ2„\ZŒBê~j\0ˆ¦	«;€+ÎiÛ@ê*À^(À&€*ù{JcÂE\\b›ş²€*¬`i†/›Š¶Ğí¨ñ“Ö€!!GÉ¦˜Æ>aV|¤í÷ê)˜[¡yÈ\n(«Z©ä¨ÛY:³[ÅÚ¢¿×Úw0Ù‚{qE†‡=Ëy—$óÏ4Ç¾“}©ÜdÛšètËIt€¦ï­vQ[CeŒÕwˆNÙ+Å\0f½ïœ£pÙREqÀšm=qTŸM+÷4säR2VcEuã8¥K©ıvq@ÈÁæ‘€4‹{ƒÁ§å¡_­ QS˜óÒÇ´Õ¢Ÿ´Q@»hRí \n\0fÚ6¯~µ&)\0ŒĞs×îÓ¼Ñİ5#¯áOÏÍ\02k85\"áG5Çj>Úv—OÈ¦+¸yW( O¹vâ€8+-vóLG|¨®ÇOÔmõ4)>´Û½\"Úô1cí\\İç‡o,œÉbåPvÙ´H>PriSGÖ¸ûOMe ŠñNGuÚ~¥ògÌ=³@«oàÓÄy¢Hö6W‘J_rc4\0™¥¦D¸\'5%\0 zĞ-\06—\nZ\0(íJiÊ3@TÏ4¬	ãµ&J¿µHî`ph!O˜ià	9=E\"Æ{(èx ’¬6È£¬=SÂ¶WêX.Ú¶Š3v§¢ìûÜP—^hš®•.í<¿–¦µ´Ï½®Ø¯–I®æI­ö‘#¦;æ¹=b2`şB+H}(zÏVµÔĞlp§ÜÕğÑÂ™Ü1õ¯º³Õ µõ^Ø¦A¯êöòîƒ•ÏS@­}}hPùÊ®KS7ÿ\0zİ±Vôy Ô”}¢P¡5ÔA¤YÆD\rï@fÓëñùu·¡Kö–ÿ\0;»æ»¦¶ƒnÖA¥fİh±º–¶[Ú€&‹I´áƒWR8`^01\\¬©}`„äš£o¬ÜË/—(+ÏS@¬—pó`Ö=åü<ª\'\'Ú’+¸PŞnsÛ5£o¥Â£÷‹“@•ÆŸuy“#=+*OŞ-6H¯OX’!ò(§Y 6‡F…$N}ÅLÚ$9Pw3X@ıT&Ò[^”ÅÉ¢´?4ŒSíµ+=€}Ä\nê¾ÄÈ>aQI§Ã(;“\'é@Øø¶6\0KÅlÃ¬ZÎ7)®^#“åüµ-ŒÖDì“?\0vbú%Ÿ;†+J+˜¦+kÈ®õ+ÈŸŒkOK×®âÌFé‚2	 ÒÇ\\Å·Š[:šŸşÈ×ªP@±äÔ `W+\'‹×*Ô_ğ“É!ùTĞ^HîE5™å‡ç\\‹ßİß|±µ,Z}ùùÎ(£’â8Tíæ¹}hß_–e†}+bÚİÎÙ5§	ÈÁé¾3H&ÔI/×šëlô;+\0<¸ÆGµioÉ`A=äQu`M\0OÈ`\0R;ªŒ¹¬ÖÖAá5ù×gŒ€hM¯£QÇ5FmEóòKêG˜sW’Ò,r¼ĞOï®³Ö¬Zé#9ŸšÓXÒ!òŒR«né@áû¢sšR@4ÖºP³Í\0Í\0q†¤a@9ÇĞ¤ixãfŸ>®‹œš\0Ó8“ÅA-Ôp¯Xí{5×É ôø4¹ò<æ$\Z\0&Õœ¶\Z‡d÷µ±„*åÉ©Ò4‹îPE®CfnkM-â€\nœ6i­\0&r>ZP	5.8â“€hö¦í=ÍD^¬(Ã=éÆqœVeæ¬±±óTZâ{ß– U½hZçPŠÔ|Ç&²gÔå»;m-¶‘)?éDµjÅc8Ø¸4‰›u)ÌäàÖ¥¶™#$dÕñ‘HM\05]GÊ£¥Û–Í&ĞGiª¬­’x 	w\no˜3ŠnéI´çƒ@Æáó\0j	,á“ïNóR%œVEŞ¸)äôÍ\0\Z–‘”Z®ÊòÛmÀİZñÛŞŞÁˆSZVúZ(ÿ\0I\0r—‘4{­Ô†ª6ÓİÃ.Ù3²½´Ø6á\nËºĞÌ¹ÙÅ\0fZİ#ê\ZŠ4†å²§,ÚI‘w\ZËkiÕñTP«Ø²ŒÄÿ\0­IõÅ®@¬°÷6ã,ûªHõ`Çd©×½\0t¶ÚâI€İkM.¢pÂ¹mb$=³O‘n!ÿ\0VIØ\r§sJzW/k©MıækEuÈÎàĞ¨\Zx51Ì †©IéŠ\0v)¥A<Ó»Rh{qIøRÑ@x•ÁgÜiQ°&.\Z´  fKÈc\'=½üÖøæºîâ©Í`’E\02\rZ):\Z¸²£ô\"²æÒ8Ì<\Z¯åÏgÉÉÅ\0o‘éHIk=i\"šÒ‚ş)ÇP(ÒœŠZ@Aû¤RĞEPA¥A¤bª2ÄïY—ú²@ƒj\0ÑvH†Xâ³îµ¨`1¬ayq~Û@ Uû\r¾ëæúĞ$¼¿|¦Df´¬tx”n˜e«V8c„aOÀ#Š\0hD…0ª\0¥\r¸dt¤ÛÇÍÒœ¤@×¨¨Ş¼*^´Ü\Z\0¥6™¡Àæ²ßL¹„“	8®‹s@Àº»·8›$UÛ}Z3ÃkZKxäûê\rT›K…Çî×€%Šæ9ÇP)åºXòiWsS<û‹O¾	Å\0lùdQ½EfÅ¯vt«ñ^Á8ä@`”›jQå‘ÃQ³Ò€!+íM ÅXÛš0~n”[aq–§$+Üì{Övµâ+M##È¬q÷s^m©øÆÿ\0ÄÒ¬­ãé»¥\0v~\"ñ¦˜\Z8pòâ¼âşûUñÛÌ¥-ı	¦:Ç¦s~ßj”ûæ­iúV¡âGöz´÷í@ÚÙ¢¼éŸz¿¦øCTÕ&ë‹|äjí4ï\nÙi(²^(’à:Ø[‰¯\0Š5Ùã¥\0fE¡i1X½¼1©f\\t¯Ÿ<à;¿j§Q·R!c“Šúa¬¢°_1ˆcéYZîš¾1±–Ø¦8À8 Ó!¶×-£\n@š©j^{{¥krÜÔİgF¿øy­˜İXÂíÁì+·³+yf“.$,2q@¤¶×°B}ÀzÕ­#ÅZ¶œàÌÎ@>µÒÇàw\'J‚k$ã`Í\0oé_¤@«qŸÆ»m3â%•Ú5€¯}6åPŠ©6—qú’Ãñ £í5«üäAøÕüÄãäp\ZùnGWÓ¥[>ß­t¶¯l6ı ±Å\0{ÿ\0”vğsLA†æ¼×Iø±èP3]^›ã+Ò7HªO½\0t…øF#æĞ¸Ş’½:OŞpœĞ;Œ‡ƒlWqR–èYÎ+Ô<@ÅŒVÿ\01éÅ\0h^êVÖK_ÌK%ö»>Ø²°Õ»]}FQ-É;sœ\Zê-¬â³ˆ$\n ›ÖÉfZ¾¥‘°ªv‹sòiWœPi£ÉËR»>Nµ<«¾˜ƒËê(ª#n9§ÁàTÏór¼S7c­\0V‘XöªÏf’}ñWÈ&£e4‘u¥!\\ÁÃVÙnaêI®·ZMŸß º–>\Zµò·ß öñ8åj´šr·İ }®\Z)¿Ù&Š\0ésFi( ÍzÒRâ€€iqOÅ\0E°R„µLŠ6Ğ@c¥)%†‘Rm£m\0eêZ%¾¡DŒ	zäfÑ¯´2^\'fÁé^…Êr£š\nE?úğ	ô4Çé^+°ŠõJöÉ®®	-î”42ŸzËÕ¼3â}«”ò5-\\¦æA@Šb1ôædõ®wJñt2â;¶Úı9®)æ0ÑA c9¥õâ“;šWädñ@\n‹Ïµ$Š;\ZU_j6.zĞ\ZœPãŠtùi¾Yİ“Ò€\Z¸=iL[ºTS^[[ÿ\0­p+2ïÄQ/Çy \r^Y¸¨ŞêÚ¿\"ƒõ®jM^úç„BÒ›‹s¨2W+í@\Z·zúBO”7Ö{ë÷CjDF}«B×@X€óï­iGeCˆÆ~”Ê¶™y}üesWtï›g\r;ï®(QòŒS7¾q@›kxÔ)ŒÂªİh–W‘0òT1èqZ>ja,‡åé@wàÛÛ	ÍÅœ§`9À4ûO_émåÜÄÌ¾¤W¢)Ş0ãŠ«w¦[]ÆÈÑ.O|P;Ävwñ6EGô&¶\"duÌlW¨øãfÒbç©Á«êz9òäFeèÑ¥~ñAy¢Ár™…B7¨¬İ7ÅÖ—*íÂIï]3Ç<{­Ø0 ]­o4·%X²Š¿e®3³.=ël3\"U©\\éQÉÂ\0¹ QŞA/İqšŸ‚8®jm\"k3¾-L]ZîÔ~õÑí@8NzÒ<©ùÎr§ÅaÎÅûÕ2Éw|¹Á\nhnk‹v_¼3Y7{	.ê’Û™ŠÑ‡OHz€Ôºâàğ¥iÑøvYŸ|¯Ç¥t¡#À??İé@Ğèvˆ£Ì‰XûÓ¤Ñ,Ø|±*şxæ”5\0cÈ*ğÔMØWAH\Z\0ç…â$\n½o¡ÛÃŒ 5¬N:Õiob‡ï\Z\0tv°Å÷#ğ©•~ñÀ¬¹õ•8ß1¨„³İ˜š\0Ôk˜cçpÍgÜê„dF3HšS9ØÕÈôè×¯4ÎKwy3Š@§Ãk4ŒÌq]JÁ~U–Èı8 -- T\0š¸#TûƒvŞ_9¦Ípñğ£4k­\0b©%öïx«QÌ’ıÃš\0ûÒ\0J	ÀÉéU¤¿‚/¼ã4g¦´Šƒ“Y3ê¬ÔÕQ%Ôíó\0kI~‹ÜU)uG•xõ¥K2Œ¹Å_†Ê8×Ğ?Ø®.K\r[·Ñ„dêÖU\n0(4\nA_uFj`r)¬03Ö…$hÙuâ›·Ş(¤b”}*9n#‡ıcT.uPŸê¹ \r&`£š…®â\\å€¬VÔ..œT©¦Isó;@Oª³1HÇãUE½ÅËd1\0Ö¬:dqMZXÄcå™o¤Á—šÒáûŠ§9¥+Ş€põ¤Æz\Zg—»œÓPqÍ\0;¥\ZbÙÍ;ˆÆXàPñÚƒÒ¨\\êÅœ75•.¯s+m…I¹%ì1¹€5™q©´ÙXGµ^-.[â\Zf+ZÖúlp¨q@ÑÙ\\Ü>YÓZ¶ÚLQàÈ µh*ª(£$Ğ\0ª¨0 C.êMô¿v€R)ÔĞI¥æ€#uF8qš©w¦$àù`)«¬£«vª³êpBÜzP$º,‘ä·Ì+*ò8ãÊzÜ›VšVÛeM:-\'íƒ|Ãi J=:âÙ¼Õ”•=³WSZ’\0ã-]HÑQWäV}Ş–vFá@!¾çÀZ{X$0¸/éTeÓ¥‘´TQ´ù’BÍé@#7VÇŒàV„\ZËÅÃòk*-VsÄ‘ü¾¸«qÜYËË°\ré@ÖÚ¼sŞµufAû¶\rô®VK\'º·8Ô‘5Æ˜6±-@w;x¥Á V%¦¶¤bSƒZQê0IÀqš\0µ:ĞX\nhÄ€92‡â€=(\'Š\n^PÍ5Â±Ã®iØÛÒ—¨æ€*OaË€ \ZÌ—G’2Z&â¶ŠÜTƒ§4ÎË‹VÚA5~ÛUß Å_’Ş&Ë:ŠÉÔ\ZÙˆØ \rOµAŒ™\0üj½Î«1’Œ‡jânc¼šCä3RZX_	L¨ëš\0ÔŸR»Ô²‘¡AëV´ı\n@CÜ¶ìö5nÖşÚU•B0ïŠÒ†îø‰Á ;XabŠ›8ëHsHFê\0wœtƒ\"œzĞG4 b‚p8 zĞÑE\0QE\0QE\0„â˜ĞÇ\'ŞPiäf“š\0©6›ƒå@\re\\hÒç÷LEt(9ë@ÊµÍ·ÊrqVÓXuÂ²~5®c‰ÎÔ2XÄßÂ(	5‹[X·ªt&¸moâJ2ÛLImnø‡ÁçU…„s8è\rqšg€eÑnÍÛ8©Î4Ïİi÷—ßë3âÎíŒj3ãØÿ\0³´xÕeû»Ö·|_§Şø!PÀ€cŠãôO/†fóä;Û9É ãÂŞHízÔŞh<íc]oü$V¸°U¶Er÷CRM¾iOlÕ‹}*3tòãôÕÃt“7q +×š[¯Y@<¸\n†éT!Óá¸ËoÖ›ÿ\04nŞcKïÖ€.Y]¥ûæi~SÛ5»Õ¥’â9ë\\àğ÷ÙÆ!“§½[±Ò$r|æ8ñD´ñ.•,N«òœWƒxsÄ3xgT’ÃRRc-…Í}7”!Š;å{×	ãÏ†6š•«ßéàyÉÏ…& f\nÖ±nF@ªÖMë>Ø®ŸáÂÚ˜[NÔ€û@;Fêôğµ”\n]•HÔã\r¬]F0mˆ¸ªrêÒÈÃlg>˜¯`»Ó,®•*OÒ›càKPŞtè uÅ\0y	º¹“´$zí¬­L4ƒ˜0~•ô¶:t#É†cÓ8ªMà«k¦ódU:ĞÎ‚ÏP@ZÖİĞVmÇˆõM.AöğãÖ¾ˆ×5-ÃöÍ\rªÇ-Î1´sÍy¼¾›Æw&[ÛqonsŒq@àêº©XÓ{¨ï^‡qñx~1öş|×&§¡ü:¶hìÙ$™Ey±­ê>>Ô6YÆÁIã€=â?ˆöş\"aR„Ğ×e¢XÙ”´‹+z×“x\'áMÔVË-Ó2>3]Tú~«¡7ú!yTP©*\r£ËùEBÓ:6İµçş1ÕmÈûLL uâ·,|yhøD+{Ğ]å—š˜:`UkMvÒøb\'ûÕÕ	·ä æ€ fÇznìö©^İ‰Í Pƒæ ‰ö¨NIéVXnû´.Z\0­’£¥4üU·\nÂ òñÒ€\"0ãšM õ«9Ü1LÙ@ö{Q·ce7e\0AƒEO²Š\0³¶´üQŠ\0fÚÓöšP=h»iàRâŠ\0(¤æœ ¢—i£i çµ3bç-ÃSÈ`8¥XÃ¿Z\0XÜç”Ùâá\n:‚|PCg¥H\0@VµàÕy<û#‡ëY¶Ú¾¡£H#º\råƒŠô@OËÈª÷ºE½úâu•\0VÒõË]EG–Ã½i¸ãæ<W•x®AáY–$ñÏ•¢üm·„˜õ4cŠ\0ö°	t¨¤’(Fda^aÅ{}j_+N\'¥oXÛj:ˆ!m†€7nüCYX¹5™6³yp¶SÍiÁ [ªƒ?-ZVö0[ó\ZŠ\0åbÒîïÏúQeÍkÚxfŞÜ†\'q÷­ÜAHÀ@ÇoJT~Tş…¦ƒN(\0É4˜=èç4à}h\0Ş¹ö¤Ø\r) `“Op)œñ@\nÇzPaÅ.75&İ¿v€\01œò*½Í½â•‘Ÿ\\Uôl‘Ö€8cÀ±¾f´r¯×±a—[Ñ£´B½K\'šŠHæ2“  ûP)¥øÖ/r¯]EüËº}kÿ\0ÁÖsx†×®b}+XÓ$-dÍå-\0zSç°ÍC5¬w1•‘@ü+ˆÓ¼jÖ‡ËÔTî×[a­[jh>¦€1îü,±ÉæÛòzÑ\rõÕ–#tùGµu áy9¨¥¶qó­\0PµÖ#pœ\ZÑI–UÌd\ZÌºÑŒÃÁ¬Æ[ÛÆJĞO‚GÍJ¤cŠÁ·×v\\Z±ßÀÑy€o¯Z	­cÍ¯Â2±òÕI®®n›÷Y\0Ğì·kI<U)5XHÄGæª±ØÜÉÄ¤í5r-Î{Ğ6»¹˜ü€âŸ-ÇúòFkf8!òŠ“4™±Ü§q«ñÆ«Ø\ny”£§4\0dP)vùhHÍ&ÑLwbX(Ë0â€zRrEPŸX†GSY³jsÎqn4§|‘(Ë+#í†Å¹$ÔÑZ\\Ü‘ö‚qZPipÅƒŒš\0É7—’/ÌVFæLÈÄWL`B1Š§qfTf´\0ëM>8TtcW6ª\0ü«…Ô<óŠµizd;_­\0hG¥\'\0ÒœRù \'=)¹4£Ú’IV5%ˆ \rëKÅdO­ÄËQ–ªí5ÌßêóÍ\0kË}}ª„ÚÀpE¿& ‹K–sşN+F\r*Ts@os|Ù— UËm3n7óZà/@)”vÑÇÑFjBvô™9§c4\0fŒŠ0)6úPãÒ{ô¥ÈêµÅävÊYÈ\"€\' ö¦I:B3!ÅcM­ø·«.îÏÎN\r\0hÜk1/rk:[«ËÖıĞ;kFÛF‰W2rkBİv â€1íôc.\ZàœÖ­½”VãåP\n±šZ\0oNƒ¹õ¤-éIæ€1KH1Úh™lûS°OZÕXY—ZÔPåW“@\Zlëäâ¨\\ê‘Â85–ÓÜ_İdV-ô—sş‘š\0­6£utq\0;iÖº9¸}Ó“[ZÅl¸QS€\"€+Áe¸Â€~µ6õt ·4lš\0\\†éKÜR(©yï@ÍoãdİhHx¹oJÛ\n	Í/­\0r§ÌSk&d\\há_r±\ré]¥Ş§\r¸*ü×?,‚òR`SÍ\0P†îöÈaA+VcÕEÁÅÀÁ««¦Üºò8ªwºI‚\"äÔ9K …™À?ZÊ\n×8·“8>µÁø†MP;}›xQ\\ÇÄ©<!+L’}èé8u)-”	îkJ×X¶o½*äû×É-ãíÇ—*<;)D\'±®…´ÏéĞ$óÌä“Í\0}N’G0Ê0o¥;kæ-\'ãqĞ\'º¬™šõÿ\0øò?B²Ã¤f€;üƒI¼g›µÂ“óTÒj6ñ.öa@ª­ÍôvÃæ5‹u¬IpJÚgğ¦[é×W\'uÎvĞnõiî$ÙnÊ-´‰®<Äó[–út0(ÀÉ«˜Ú0¢€*ÛØÅl£åÔî Œ>Ôí¹ëJN\0cŞè©?*pMQN¸²æ\"Mt£Ş–€9ÄÕna“ƒŠÓ‹U†UÍVf²Š¾µJM\"8Áh3š\0ÑtqÁ§à•ÏÉkyÊŠt:œ–§\0š\0Şôµ±¸Çy$WPTŠ\0}Q@Q@Q@„âÔ\0¦“p£ƒHT\Z\0‹h-•<Ñ–\'æ©B90&€)¿/İ R•Àùiª™9n´öPL0È£ğ¬{ß	Ú]«g­ò™4lÇJ\0óK¯Ïi)k\\ãÚ¨İè÷›yÜ¯[9¨d³†\\îAÍ\0xÜw—:küÅ¸­«oÉ \nÄŠîn<7eséÉö¬+ïÆ2m…\0Ak®Ä27Z×]Z9TÈ\0×%?„î×$gŠÍq{§1V@ BXâ*rü·½,-ÉŠSº6õ®\nË]™›äÓ5¯ˆ9º=(“ñ¦‘y¢j£WÓƒƒd…®¯Â>.—Äöâ9Û895¢5›ze0]„w¯0Ö¬¯<«	ì‹Vlñ@Ş,íôáæ9Õf¼ùŒp÷¬Íõ|G¦$ÒL ÈÍWÖ|m§è=´{Œ`cÖ€6Ş;=#=ôƒ=ù®Ä^9ºÔä6~ƒÆEdÛÚë~)§¼‘£²\'8\'TZÏˆ´O[±´d{ 9úĞö¶²\'Rñ4ø“ïmc\\¯~,CoXh¨6Ÿ”®YñÖ¯ã{¿³@²*ÀÅzWÃï‚âqÖ³–Ÿš€<¯OğV»â›Õº”ÊÑHrsšú+ÀÓ¼5k—‘©˜â½LĞ,t¸XT*8©nt¸®zŒ}(ö÷Öóü±`\n—h/‚ŠËô¬‰4©-ù¶&¡/}\\â€4ït{[ĞUãQ‘ØW\'ªü=µdia}¤Vëëñiğ—»<ÖŞ.şÖ”Ãf0Å^E£ÈRÍ™±éZšG‰µX“7Jüz×m§h\"B$»ÚsÏ5¨ú”«‚ƒğ ^ÓÇj¤-ÎEoÚøÊø0ëTï¼e:“Á®nëÁ÷–¤›2ÜtÅ\0zl3>´æD=Íyc>½§°¹AÖ­§ÓM*·¹-Ş€=É#šM¢°´ßÙj63[MØİ‹ùĞùÍ;mNÈ\0àƒLT-Ò€\"#4›jVŒ­FN\r\0&Ú)ø¢€J(Å-\0c4¸¥€bŠ1@\rÅ<t¤Å-\0QE\0QE\0QE\06Y|¨Ëc5ÍŞks	\nF¦º}¡Á2*§Û–ÜPf€8»¿¿ˆı ­QáÊæxcí^Œ›bùc\\\n”Z\0ñ…øf½k«d;ÈÙè¾,Š%[iÓf8É®ÆXã™vÊõÎj¾†ìµ7=Å\0tÏ\rÂGVÈìiäcÕæ¦MGÃ3üû¥@k©Ò<W¡9·¡ \ræ°Tâ¤è¼óQàJ‰²=(bœ5\0.y§Ğ\0ÆhÈ=(\0¢Š(\0¢Šu\06Šu\0Ú)ÔPh§Q@)h¢€ô¨Ûæ0OZ–ŒP;ªxVËPF(€H{×)7†õŒ–®Û`kÓ8_jk¢Ê0ã+é@}aãY­EyÙ5×éÚí¶ ¿+ªŸBi·¾±ºRJ¯ê+’¿ğ}å«l¥!G8€=	HnP‚)5aÆkÍmü[{¢°†ê&udŠë´¯ÚêhH¨Ş™ w:43d¨Åsº†‡}Ÿ+ĞWh¬®¹FzŠã\rÈ \'NòíÜ˜É>¦º«9-™sÕ4ùl ™OÈõ¬k\"x˜´,@ô ‹pìA¤Á<×.šÅœª’)+µ¿£Š¿8Éí@úic¥*°q•9`´\0Õ}Æ•›ª9%‰GÌà~5›u­#è[r‘ó*¼·±ÃÜ\ZÅû\\÷ç\n¥JºDÇØš\0–}[w¯>µI£½ºo”\rm[XE\ZÊ	«jŠœ(€0­´3¸4ç5«¤0cjóV0}i	ÉÅ\08cQÍ\"´3Ô\0ìÓKR(=M)Å\0¡×¢KHÑ²4ç¹Š?¾àV]Ş¶#È„n>Ô§;\0˜¬µ–²î;€¦£Üß·u§Msfoš€)·‹Dß»Š2÷¥ŠÚòø‡ŞBÙ­xô;DäF7zÕ„´1Fp(¤\ZL1\0Ò®ç­£E(Å#°‰2üâ¢ş7èhËÚ”t¦¬¨İ§ĞxñAlS])ØÆ3@\0`iÇ§’Ä€îp+&ë\\Ç7Ğ¹a%˜\n§q«G@äÖH–æôî\0Õ¨4bÇt§4V[û‹–Ä@RA§\\\\°ûA%kj8¡\n3Sç@ Ò¡ƒ•uUPa@¸4…O­\0)4\n@¸¥=h7àĞy¥À¦í÷â€qÚ—ğ*	®â„Ì2+\"}q¤b‘/ã@,qŒ–fÜêÊ¹ŒšÎÒêí²Ì@5§m¥,xó~c@}Íëì\\€jÜ\Z-™ù­u‚8¹E\0Ô™,=((mãqÆ*MÙ<R4â(\0 ´n£PMI€(84{R‘I£“@\0ã¥)õ\'B÷SŠÑIRúVPÖ&¾;#B¢€6®/â·xXóê²İŸ. úÓ£Ñ%‘ÃÊùµkÁe mQ»Ö€1 Òdœƒq“Zöút6Ãå^jŞqĞQœõâ€p\nd¤Ã\0jN;SHÉë@ú‡­î£a\Z\0H¯ñïÀ7ñNö^½±_A.GZvhâË‡zçÃk‚öJåÖµçÅıNksa=«—Æ	Û_XŞiv—êVê¹Ëİ|>ğÒÈe’Ö5  ¦ğ5ßˆ5A¨\\†D-»½»Âzı¯‡l£²-ÏŒfº½Â)q\'•¥.ÔÏğŠv™àh¬\"yçõ\"€7´ˆ\Zş1s»ny4íBÒè?JÑmnöè<–Úƒµ9õ‡‰ÂH›‡­\0_Ò¯!±÷Éó{×Ak«CuÂàV$+i{20Bj)-|€M£îúP\\®˜~tüúW×h7>x«ğkŞ_Ë-\0o™0qŠ^ÕK{ønŞ«;w©â€Š2\0b—\0€æhÅ4å}èÄã­VÂó/5g¯Z	À Y4Lbâ«˜.íÏH®€>{R•÷…\0bG¬4J¤Õ¨5˜æ cjKdê‚©M¤¯ü² \r!*8ÈqùÒ‘‘Á®}ôû˜ğäÚœš¤ÉÃ©â€7@`jJÊ‡XVÀn\r^ê)(R3F@¡JŸºsNÅ\0  Ò0\'¥)tï@\0àsKE\0QE\0QE\0R\ZZ(©Àæ“m( H…½*¤ÚM­ÂŸ60IïW³M\'w€8ıCÁ‹+–µùkóÁ³Æ„¾MzB†^§4¬Æ€<bm:çNmğ#dU-mîµ‹ÊwÅ{cÙ[9ÃÄáYú‘,ì1@¢&»¦Üx¦d…:×Tú%¾•GZœLzàœÕİjÆQtÉb¥¹á€¬kÏkZ¤Ÿh‘ÙàP;âß‹4bğçÊ£Œ-s>ğ&±ã[ñ5úÉ±NsWl|>‡ªn`2(nâ½ËÂŞ*Ó¬ #Ààc¦(ü\"°Ñ#GòÔÊ;â»6¶¹³…V#ò/aW-µ»;±òJ¼ûÕÔ1Ê>V(57@)È«0ë\nÇ9«²YE ?(¨\\YÁiw \Z\0Ò£¨báEfjZåµ¤de]a\\v©w<†;&8Î8¦éº-àO{—^¸4b]&I¿±“Òµ,¼Šf$õ«¶zÌp\nÇ°:VÊ^DFã çµ\0bom‰Z‘uf·ûêMna\'\0õ–0KÕ\0VƒVK‘…ùMZ[¨ÕxàVuİ„6ê\\8¸½VæîêS\r›í‘@^±ªZ\"²\r²ô®&®³qæ¼d+*æ™¤İÚ²Ëz\ZA×šìlõhB…Ç?ÃÙm¡ÿ\0D%H«;ìšÖŒI,ì£Ş½N+Øå<8<0N¸‘CPœZøÖæÌµFÄZŞÓüsot@`>µµuáË¸vù*	ïŠåõ?Ao¼.# qÍ\0uPê¶÷5y÷«NRR<³šğé†©evE³´ŠjÜƒÅú™i¡cj\0õ!è¯+ÿ\0…¹8ãìçj(Õ©E;m §(Íi@Å\0£´Pb–Š\\PQKŠ1@	E)”\0QE\0™ Ó±ô\n1@bAàRãpô§ÑŠ\0„©úb2ƒiôh½Å¤JDÑ«çÔWªø4£5Í“íaÎÑ]À\\Rã=hÎ¬µËí%‚\\«Íušˆ,ï‘A	=*Õö•o|…dU÷ÅrZ‡„ÅŒö.IàPmË}ÎTÓÂâ¼úÏÅ7v¯”„^æ»-;ZµÔ43ÜP…¸qH:â€\nu!âŒš\0Z)3ëK@fŠ\0(¢Š\0(¢Š\0(¢“\0ÆMç9Å!,‡š–Š\0„ÄXîÎ)ã¦ÖäSˆ @×ú-¦ …^%ÉïŠä/¼%£¬¤#àW ã˜õæ€<ŞÛ\\ÔôÃåÊŒTw®£OñU¥Â¸,•¯s§Át…dyïŠåuC–šŞB$ê\0 Â’tİdSñëÍyÛ5­Lc=kLñ½«€—Í²J\0é.ícvl=ë\ZMKr^7\'Ú·-o!½Œ=»Z±Œõæ€9¡¨]Y®\n@|LîÛm5ÔK\nJ\n²Œ}+*}İØ°Àj\0©³êc*äV¶±¬ÃÖcÇw§·ú2’µ$\ZóFÁnÁ€7’ã*øSÃUk}BœymÖ­c¸é@QF)zQœu É¥$~4 ç¥E,ÑÂ7H@€$jGuŒeÎdÜëIŒ[‘Yşmíãa@j‘UZ³§Ô§©`j{m}éO5¥\r¬p\04Œš\\×Ã|®W5~×G¿óıkGqÅH …HşâN\ršÖ‘YOJ\0R¾ô½ºÑŠ1@Oœ…sÖ³Î”c£dÖ¦Ó)’Nœâ€1Õ\'øÎ+Nˆ_ŞqTo5x‘H‹–¬Å¹»ºbH»s©CûÜÖdÚÌÏ‘ä\Ztz!¸]Ó±£û4Ömò&å\ZYİ_6d%A­48ãÁî4ø5HĞba´Õè®cœ~ìæ€\"UpJáFGJB3@ŞsM,sÒ8£é@\rÜsN´ÓÂ”°A–8 Rdô¬ë½Q!Î\re¾¥qtÛ`m\0l\\êpÀÌ3Y2êóÌq’)ĞèÍrCÎH­{k­Wå\0Ğ,vsŞÊH­+m&8pHÖ°Åé@ªª8¤ØIÎiy&”PrGn4¹õ¥È íÏ&”Ò—­1ŠÆ71â€$¦±\n2Ç²®õ¨¢;b95Aîî¯´©s«EU[šÉšúæáñ;Oz³o¡ù‡|äæ¶ ´İ@U€2môS 3dÆµa²†ò Ï­N¥ĞrO©^G4ìúSX·j\0rœõ ®hšB[<t ƒHS-œÓê®#€eÍ\0MPKsÊàV%Ş·!r¶àš…,®5™ÉPhÍÖºÛÊÚÃÔUO±\\j.˜¨5³g¤Cj?¼}êòÆ±”b€(YéQÚ·Ìj{›Hî—i\0U¹9Í!Nr(\nm§	ÈªW:_Ëş¯\'é]gAÍ4ª·`hÏ\'ÒæİË˜ÅN“>ŸQŒ¤Wgs§År0F+*}EŸ,n ›]hÜF|ôØiÅ-îC\0igÒ%Éf]«Tá?+Ôy-%‡æ…‰¦]VæÛ‡²ıì\'©+VàÕâq¶ğ\0M\0m[ëâBœV´7±Jf¹…·¶Ÿ›v4oqoó)8 ¼0a•æ‘I\'æÊC¬Í$Ö…¾¼€´ü ĞïZMµZ=B	‡îØÔë–ä(ÍÇAHÔæÈST“Ú€Kš3KÖ€àğy¨e´ŠU#hÍK´u¥v ™tec•8ª²ióC÷	®†Üf€9¥¸ºµ<Õr\r]ığÅkNê*¬údSû}(É©Û¿ü´\0Ôë,r}Ö²$ĞyÍVhní¸\'ÒŠ+œMNê,	AÀ«Ğkp°Ä‡€5h¨bºo¸Ù©ìñ@¢š3KÍ\0-#Ri;e¨ô„Ò+«ô¤fPpzĞŒÒ“·¥\0HNhT–ëM*AÎx¦Ü\\Gl…¤ b¹{ßK,¦+0On(kRÖ`²‰¶°2öÎ4×¾ ;0Ñ¦zÕÛ=¯\\OxNzà×I´vè5Ô•¦è±YÆê‡sZŠ±‘·`ô©YwRíÅ\0fÜh¶W9İ’}«˜Ôş[Ş9xF}«·àæœG½\0y-ç†µ+åµvp=) ×udnÃ¿ëEõP~¢ ¸ÓíîP¬±)Ïµ\0yû|C{h·Ì¸nâ ‡ÅQø‚P.À}ë£¿ğ•îO>ÕÌŞxM8™,‰ÈéŠ\0íô&Ö$1!5¬Ğ«|»\0ZòTÔ5½)¶•r¢µ-¼=¹nRz\0íî4ˆ\\ü€ª¿ØN92;U};ÆzeèJšßî	Óz¸Ûõ V–êÏåE,µZïÅ‰aóÖzTÚÆ¸#ÌvÀ;ôâ±ìü4u©<ûì¯|P4Õ\'ñÆ×c\Z]n—£[Ø.î$oZDğå½¬¹àŠ®b»¿w–€7•U!b¨Í£#SŒÕí)àÇšõ­}jŞpïš€(6•,\0²1§[ Ü© VâÈ®…›kˆñ_‹[LsŠ†cÇ¥¨x¤i­²\\XM¨Ë®ÍòHB\Z¥¢i7~\'—ÎÔADÏq]•¯‡môäÛnrÂ€\r#A¶·PÓ*ÈŞõr÷F´»]†İ0{â³eû\\2| â¦\Z¤ğ€f€*ŸéÄ“å§>ÔU¯øJ­ÇóE\0nÑE\0áEŠ\0(¢Š\0)Â›N\0QE\0\ZLRÑ@	Š1KE\0 ¥¢Š\0(¢Š\0(¢Š\0)8â–ƒí@\'“NŞ¿tóAÖ€€rh\'Sğí¶¢å\0šåî4½‹Ø–1µßO›!VR’ƒ@v•âà’o§5×ÛİEtâ`A÷¬[ÂÖ÷q—µ]²ûW0¥áÉs.æŒ\Z\0ô¼g­&võ¬-Äğj*â7÷­´‘%)€0Ô…‚œRãİ¡hÃšZh qN Š( Š( Š( Š( Š( Š( ™åÛZ}4·8 Mw”‘AÚ¹=OÀ¶“±–,«ûWaK@oö-_GÏÙK–´,|h!\";Õ;‡»gE‘\n¸È5‰yá›Ä hí¯o¨.a`3êjæÅÎs\\ß†u6-§»†ªÛø’÷I“eò³àĞ¤ŒÈâ¨]i÷$–&³ôÛj‡oŸs[«$o÷YOĞĞ;.=³fÔœRÅ¨\\Ù.A WKPOkã÷«š\0¥·£\r9õhcåØ\Z«{£#¡ƒkW9.{jûî	dô †]Mî8´«KÛ“‰IÚhÒõxp†<7©®Š9ã‘AV\0fYè‘Àw7&µ‘Aù¾é¤U#­\0\r»<RëNßÍ:€Í‘Ö‚ø£¯Z\0M¡úĞ#¥#J‘X\nÏŸYŠ,É \rG$â šú(zœšÂ“Q¸º}°‚©aÒ®$!¦\'€,Ë«g\"*¬R{ÃófµbÓáŒ\rÃš´‘¢}ÑŠ\0È·ÑTÉÖµ\"†8\n—š0\r\0 `iH`ŒÒmô ¶:Ğ*9z\Z-ìÍ·Ü<UÖÉû´TsÍ\05œD75WşÑBÛEZdW?JÎ½X BTÔ ¼g4Ù®crÌ+‰»Õo7•€6)l’úîP\'İ´ĞEq¬â\Z¤%¼¹lí­;]*8ğXUô#(€2!ÒL£÷õ£oe\r ùL“O ´\0dQÖŒ@#µ\0/jh@iH&Ô\0gi‚iqëPKq%†hcïÒ˜óG\nåˆ‘{®¢©Œš İê\'r’Ğ•Î»å\"å«8›ëÃ‘†´¬ô8£¦šµÂŒ\n\0Ä´ĞÕ°ó}êÙ‚İ \\(å}ı8§ôäĞ6{P	z“Ì§PÏj3š	Å4üİ(ØšX“Å\"©zS^â8ó¹€ 	#šd³$YØb±¯õÕL¤+–õŸ½ö¢w1!\r\0h^kBO’×;ªœV×—m™³ƒZÖZ<VàjÒQ€(:×IŠ3š¼¢ À§õëAzP\0:ĞA4zÓ¨\0Å#\Z]Ô`PE(\0R1Ú*\'‘cÙÀÇj\0’zqPMw¢“)‰{â1¸Å’İ3PA§İj|Äì=¨[½`Ş9ùj(ô\'”ù‡¿5³k¦ÛÛ\0\nüÕi\0é@iòE6äV5Î‹æ¶öWtWpÃ\nc[ÆF\nŠ\0óó¶ÿ\0ñíœŠrjWQœ\\¶»)ô¸Ø~è\0k.}\r›%Ç™¥fßëÍO–;}CÜTw:\\0dì9CìÓÌØ´Êb€5³Ú¨ò›8©£Ô®£^sXÍwqd19-Š±iâ(d;$ô \rÛM}s¶zÓS†Còšç>ÏÑÜ„-Bñ4/ˆÛ4Ù«¬ƒ*E!\rk‘KË˜=qW-ü@T( gĞ\0íT-õxfÀÈ¯	ôa@\nwv¥ï@ ô¥ 8=hàt J\0ÇZ\03G”dQÅ\0C-¬S˜\n¡6…e“ƒZ¼)˜ ğh¬nm¹„œ\n`¿º¿zÑ]îÄTOm£æPh:i\\€F+F+¨ä0ªsé|‘ƒY’i—qÑ±Å\0t ƒĞæ™ \'ÕÏG{=ŸúÜœUë}m\'ùHÁ \r4Œ ùi¸Üõ¤åñ\nYfŠ%.Ì8÷ ÚA;UíbE*§-Ú±u\rrYä1[Ïiš,³H%½É÷ \nò}·W—åÜ#5½¦èpÚª»Œ¿zÒ†Ş;dÄK€)Á÷ƒ(Û€;E:¡S†Ãrjj\0(¢Š\0(¢Š\0(¢Š\0a~p(ÈÇÌ)ØšLƒ@æ²·º:)ü+ÿ\0ÁV7À†\0í]&ÑÚšªÛ¹é@]ğòKW-§3qÓ‰¨i‘”Ì+^Ú_¥A46÷?,ÈÔP‡èZåÍ¥Ø“VV s^¥§øÓLºE„•fóÂZuÚÑŸjä¯şH¬NšJj\0ô{ÈnÆc‘:´\0Çc^1>™â\r·r£Ş®iÿ\0æ°aülHàæ€=FâÆ;wf²¥Ñ!³\r0p1ÍgÚxşÊêà w¬–ÕçñÑÒ\\&yÁ \nºÎ½}#›}?w§İD˜È\'ÖnsÍvzV‡oh¡§¥õ­YlÒ^\r´FÛQµ·ˆGn¡@ô«‘Mùò2j´ÚDEsÁ¬öÓn£qµÚ\0Şp%Æ1PÍeÉ²@0kê[»DdŠ-üQQŸ´ğG­\0Z>³$“ŞŠ¨|qb	ÒÑO\'„Ğ\0(¦ÓO4%ÁO(\0§\nJ(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(6F\'ƒK£ŸE\05My§Q@*WîÔWpŞ&Û„õ«P«xQÑÌºqØ8ZÇW»²aêp½MwÇ‘ÍgŞi°Ü©0÷Å\06ÇU‚åéT7¡5 FW‘\\§á»«&3ÛH}p\r\ZWŠî-Ü[Ş¡\0dŠ\0ï\0ÉÍ:«ZßCv¡¢pI«\rÔ\0´R´…j\0uã­0œÓy“Ú€%¢£İ°`riÃ-@¢“\"“ïP¨¦àcæ…88 QA¢€\noñt “J9 ¤&–Š\0LäR\0)ÔPsk>ëI²¼Ï›’{â´i0(ŒÔ<Å·iÍåjÌiu-‡İ&+Ñ×ÛÃ/Æê(’Ó<`ÎÁ.“g¹®JÖáYWÙ¬ÍKÃ^äö®^ãÃ7Ö\rº)Xï@ˆŒ­÷9´²F²®×çÖ~%¼±qèvƒŒ‘]U—ˆ­.y’…z\0±q¤Á\"Ÿ)µf>—uÜvÕ¿ÌSªpßJ€G<Ğ:š”öç¤â¯Ûjé1ÄŸ-^h\"q‚ƒš¡>²ÆvĞŠÉıÖŸõé\\Ìğİiç(Kb²®üS{ÌD\\Pm-ÄQ]…dİk}V»éYöQ>ª¥r¤ÖÍ‘¿-‡ œ\\ŞIPjä\Z.pe9­Ÿ%1…P´åùF(¼1AÑFjÎ{\nB¹ç4E\0!\\œšp€–¤åhıE4)Í\nI¥$w ³`Ò‘¸TrÏë\nÍ»ÖD\\CóP¦äï°Z©s©ÅvÆ¹ù$¼¿|€TUûMÎ\ZfÏÖ€\"›Yšäì‰÷¥ƒM¸¸`Ò±ÅnÇij¢äwÅL\0\0b€)Ã¦A\ZÈ	«)qıÕ¤¤c@\ru,8¬ùÌ‘ŒšÑŠB‹üC4™ Ê~u«ÑÜ¤£ïK%´r\0Õ?ìÆ¹[€41‘ÁÍ(\\S\"VEÃv¨.u;{`w¸€.tÕYnâ·ïúW=uâ&wÙoóÇ,:d× K#›µ\0Mq­»’§ãUã±¹½mÎÄ[Vºtp¹A5pN\0€2m´HãlËóV’@\"â!R¹Í;é@	×Š`CzT”„úP\0Š\\Rf˜$mØÇ\0ò£Ò‚8â—ÜTR\\ÅúÖ@Ánµ—[©,àb²ïµ°ŠVÛæ>Õ•­Ö¤ÄÊJ© \r;p6V“íT’BNr«ÜÖ¥†‹©Üÿ\07Ö¼óâÇÄø|dŞNF íJ°\0]ÜGæ»š•üM¦[±Ì˜ö5ò¾¯â¿Üû)x&½+Ãz`„ñéÀçsb€=æi³nQ~¦®Ãi9ÄÇ!ö9¯˜<d<bğõùšCÓkW9¤ø—ÅşÅŞ¢’µ¸=NzPÙ…ºP£jóÍy·ÃŠVŞ1…c,Ã‚+Ñä>PÏ\\Ğ²—ÆŞ*@8Ôõ¡åH†\\â€o4*F2ìdŞëk\".Mc‹‹­BL\0Bš\0Ö¾Ö…¾DCÌ\'Ò³RÍMÃäªÕ«a£,$<øsèkY#XÆBj\0Í´Ñ …GšŸÖ´1Âp*J(¸ò9§t¦n;½©ÀƒĞĞ\0i®{S³H[=(H§‘´ĞŞ´Ùg™( IiŸ}EejÁm0­Q_ë›‰ÓæúU;M>æúMÓ’¡ \nPÄ×2*n“éh”‡é]µ„Vé€ š˜ÃuA@Ú\\õlR™ö™m8|¹®ÖãMIGÉÅfM¢„É#u\0aÅ®†ù$‹ô«kµĞÎà¤Ô76l8÷ÅW\ZK°Ü$+íš\0¶ö%9ò}*Mw/»²¦¹¸ÓÏÉ™1Wluæº.ãÙîE\0l[kÅ>W­X5HåÆâ±Vn7#ŒÕ9a•›gÙ‰ãnãN#pà×±On»Î}*H¼Cqlt%}h«¦+6ÛU·¸@]Â·¥^Icaò°\"€pxĞ„´ìgiqï@	ÅÚ){P\0:RÒtĞÄš\0Š[8æûÂ©Ë¤F1ü¾õ~{„·MÎq\\Î©â&ba´äŸJ\0­ª\\¾›Ÿ-÷ŸA\\ÿ\0ö£}.\n0L×M¥èÒ]¸šóyÁ®•l-£V%…\0sº:Á\rÊ€Ş¦ºU¹ƒ\0+®=*…Ö³gË;k2}\"âÔG-@2°qÇ\"‚Ÿİâ¹(u{»f\nèq[vºÂJ£ÌùM\0h(Áç­IUÒöj°&§í@E„PäQLÛÏZ	 â€E0SJ½\0:™øSè m4ÇúBë@\r´\'\"œ0:S¨›¸Å\n¬½ø¥ÛÍ1Ü©ãš\0IáŠávÌ¡‡½`j^ÓnQœÂ¡€ÏJß¼ëÁ¬¿kéN×.Hë@3â˜í4‰Œ1Ì\"µ‰$úh\Z|ÆmÜğs\\ç‹´äñã¶—w¹³Ğ\ZêşÚÚxk÷!œxÍ\0tŞ;½¸…ˆñ]V™ãÛkÜ	±ïš¾4íV‹kîî+\nÿ\0áÊ²³ZÉ´ûP_§gr—p¹ôÍ]8™G–Á€ï^7uáÍ[GmğHî@<s¬è¨UávÎ(×5[È- \"@ã¥y†µwåö‡Ò¹kŸ‰ÂiÛkŸá5{Dx–í¤Ø„úĞsG6ã‚zÑ^°ÓB.e^´PgºŠ@)@ 4šp´¸ Šu.)1@\n)\rf€\n(Í ii óN Š( Š( Š( Š( Š( Š( Š( Š( ›§ŠuFÒm8=hÎŒ8V.§áø/T´J½«Y”±ç¥(`¼/Z\0àŞÿ\0F“÷;™Emé¾\'À[Ãµë¢’™H‘AÍsú§…¡™L–ù{PA\rÄw	º&)Çåu¯:[KB›n1]N“â{kğ¨N$ïš\0Ü^zÒ9Àìä\ZiuCÏZ\0] šQÏÒ º¹\0\ZV\n©®wÅ,‡DÓxœ<\Z\0éä’8GïúÓÂ„aù×€èŸ/¼S\"$˜\nxæ©øÇº¶‡©Gou-(èŞæcAçæZäü)âQ¡¥ÍşU±“š½§xÃOÔ®­©&AÅ\0t\0œS©ª{\Zq È¥¦í§PEPEPEPŒRç\0zÓºSr\r\0 ,M+…#ç\0Š8â˜	#\r@®´kkµ9@	ïŠço|2[Hsè+²“qÍ\0yê¦©¥3(«öŞ,š\'ğ£­vm\ZH¤:ƒøVU×‡¬î²š\0}¦¿gyòkPFTä\ZâµÉd»ôÂsX±ëZÆ—.Û°Å M ¾ ÕK2Úë–EÏÒ²4¿[]ª¤¼?½t¼r¨hØ}\r\0cÍ§Él?Ñò\0ô¨şæÙ± 8®ˆçê*­b¸8 \nVÚÄrq!Å^Kˆ¤û¬*„Ú,x&3ƒYïgslr¹À —·™9®~\r]ã`’ƒ[ßÅ\"ç8 Tpj•Æ¥(I`k!õIn‰€Ğä÷‘[ıö¬ËPKÅ¹Éª±i×7Mş“œVµ¶“\r¹rhì·WûÌ¨­+]!P\'?ZÒ9(åÎ9 $qÆ0ªáRjaÚ\r;9P¨¢Š\0(<ÑE\05ËHo½I$©ËYWÚÀ@D\\š\0ÕgHÇÌqT®uXa)ËVŸwzØ\\â´l´mãuÑ9 \nòj·s’±)Úi¿ØOóNÄWA¤pŒ*Š~˜ t³_›*ÜMmÛòŠØ|ãŠg”9ĞxnËğÕkÆj1lªr*VùTí \0g§r:VUÅÌ1<âo«#ğô§×­7R$©(Êšd÷q[Œ¹\0õ zÓf¹Š™…}¬ù¶Û9¨¢µ»½#ÎÈJ\0µu®äíµùT×:‘l¨5­m¢ÁnCujÑ\np P]¦‡¾	;½iˆÕ P™ç5\rÍÒ[|ÎÃ*œ×Šüqøp¾%Ó<è›.¼â½UñD_êí²^³,áÔµIÚ”›së@<x[Æ¾±:zÙïÆvÓ†¤<a}›Ù^Ô9çWÑÓ|4Ò/2÷)cè*—ü*-[tciöãRhºo†]Ápn\\s‚sY^2øš|C¡6“mf¸ÚZ÷I~ÙI(W;“Ş§¶ø=áûi–s\\sÊñ@ğÁ:æ™¨Û¥u…›8\"¾°‘‘PH—$öz- †ÑEa­İæ«.ÔÈZ\0İ¿Ö£·`95šf¹¿õ\0ÕÛM\r0\Zäå½ë^há`i¢gæ˜æ¶!¶Š…QRœö¥Û@\0\'4´Q@Q@,	ÅBœ“A@{Ñ‚ßxñ@\rbXñCºÀ™sU/uHlÔ‚Ajç¦½¹Ô¥Ä@í \r™õ˜»ç¬‰Ş§&Ddõ­_£aç\'ulÃ[ E\0\n\0Î°Ğã´Ã1ÜŞõª¡@Â€*9Ÿ»ÒÈ÷ ÉÏ4»E5ƒOÅ\0!ÈéKÔr)9æ£üÏöh^”a”U)t¤nTâ´7g8ëH	,x )t|r1÷¬[Û,6%PƒÚº-G[ŠŞ7Hşi;V¤wZ¬¤Üš\0£äE\næ9	4‰uú¤,µuqøzİTnÉ5^ãM0ñ\nƒ@Öú“HÓÆÀ*Á½µŸä@>µZïO‘ß7 …¤¶ñ§îs¾€&:KæDäLĞ.®m~Q“Y²\\_Û·Ë•zÏXƒ»5\0hÛkN¸ó3[jğJ9l\ZÁ’8.†èH\0ÕìÉîÿ\0Z\0ì•Ò^Pæ+’æâÓ®H«6úñY?}÷h¡%·qÒ¨^ëv¶yVŸÒ¹ıWÅGÌÚwâŸ¦èƒTÅÅÛ\\PoqyªÍ…Ê\'­lØøvr®ÿ\03w­(-£³Œ$KÅLÛ1Ò€í‰p£¡>nM+(#&„#Pî9Å/^¢“o4ƒ9 e¶‚n\nŒı*„ú\"·1œV¯–3š^A uôù­¾h‰,(şê/õÀ×DH‘QIwæ¥\0gÃ­ÄxàÖ„WqN>FëT%Ğ¡l•àÖ|¶W6Ùò	 “o¡ æ¹EÕnímÀ8­›M^9ToàĞ‘]Ô¶š’¬ƒåaNÇ©Í\0:Š( ôæ–ŒŠ\0`\0)ÌqÒ“…4d9 $c&cªÚŒ¢vrÁ@ÍyµâıZWË²bÖÛ¹Å\0{:a¾e5âï\rX5¶ı™Í/†5u¾¶Pì7ãœš±âMIô­9ç‡–€(ÄWÁ\'À7O+HdÜ}kŸñ7‡õoH.4âè:üµÑ%Æ³ãm`Fèânr+ÛtmÛL±Š\Z—ÛódPÎz_ˆu¯D«9‘™xç5î\0ñTŞ$°ón\rõ¡ªø\'LÕ›3Æ9ö«ºVƒe @VÛäA×<P“ÆŸ1_zóïßéØk{h‘¦<p*×‰üb9³Ó2Ó	WÃ>k©î©’çœ\Z\0óû?„2k·k¸Ê)9¶¥ğ-ö† iá°½Å{4H°*Ç€¢’rÛ€{Ğ‰ìñ\0àyœQ^×²ß¼kŸ¥6)@¢Š\0\\Š\\æ›J(h4Q@	ŠM´ê(»hÛN¢€\ZE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0SYM:Š\0nNÔÖœµ%\0ÓœR¯NiMZòÆØÊL ƒ\\­ÿ\0…L,_NÊ¿µvuÎx Û[¼Ñeòõ\0Î+¨ÓµËmO\0§Ş¬Üé–·£ı\"0Íë\\¦­áùìI–ÀÎ\0Gñ/OÔïôèÆˆä:õÚkÌcÒ5{İ9ìõ]ìäcšôÍ#ÄsZ?“~¤œ×Un4ûĞ$7\Z\0ù¯DøIâ+ç¸Ó™Ñæ½OEøw¿dŞ#]ì½È¯TE EEwŸF8&€9Û)`:l‹\Zã­øÁ–ºC}¡é$×)®øOU³™¯,ålœOğ·/…ßÙ5˜\0pXŠ\0ôğà6Z{6LÖeÖ­d°™é¸àkøÔ+X‹ÜP^2iÕÃCñ\"ÉïVÚVXÜœ`šìâ¹XVPÃaÍ\0Mš*5)>ã©ú\ZC!SÓ4-Ãó`Óè\0¢Š(ÍE-\0Rc=ih ÛJ(¢€\ni@zÓ¨ ¥T»ÓmïF\'@jİÈßøA-c•nÕöºÎ’Û™˜Æ+Ñ©’Ä“.Ù0 :ÇÆ‰\"»C»ÖºkMFŞõÇ\"ŒöÍgj>´ºRb@¯\\ÿ\0‡µ=0™-¤mƒ €=(zĞ@`C+Î´ÏİX‘Ülİ¹®ÂÃ]¶¼,ê‡Ğš\0±6›äíù«*ïI¸Áû9 VürÇ/ú·\rô4ó“ÓŠ\0à¾ÃyÈ7D´Yæº+;›H±å.ÓŞµŞ(äSæ\0ÕB}-$„m ñÎ’†/¹y­.­*ÄŠ–ÓW’#¶e?\0tt†ªÛßÅ8ûÀ\Z´[îh\nô˜şí;Ò1Ú3Š\0^‚€j	®£…I,3éYW\ZŞğR%ä÷ \r™\'H”–aùÖMÆ½%#R[Ö²ÖÎöîMÅˆSÚ¶mt˜QGš¹oZ\0Êqux~R@«öZ69¸æµ£\"û‚¤nœPQ[EÜP*^iNy§š\0h\rzSé…ñÚŒ–éÅ\0;Œ\0iM7~ãŒPÏ=)\0=é\0ÛË*‹ø`\\—úP²Áƒ÷ƒŠÎ»[Kd$cwÖ³ou¹n3º}EGk£ÜÜ‘$ìq†€(\\ŞŞI![=À{Uë\r6öãí‰ÖºìàµEùoZ²¤°xN&Ş1_›Ö®+Æ0ªE)t*;Ö,ñµ‘2¼¼Ù \rÒ*)n¢…IycŞ¸}OÇm	0ÁãÓ\"©YÁ¨k²	\Z£4Ğßø¥K4VÊIõ–šªÛ‰`†·ì<?mo\ZùªûšØ4‰vÆ\0‡gá›X”=Âî“Ş·\"#@‘€RõàÒ`/$àP:“ÀéJHrN*½ÍüVèI`O¥s÷z¤×ÍåÛ©\0÷ \r‹b(ÎJÈîëPÏÙò¢¥°Ğä,$º9±­Øí#‹Râ€1,ti$¼ÉúÖÕµ”6¿ê—fšÙí@]İh^(Å\n1š\0i“šx9˜—\0Ğ<ô§f‘½49<b€$Îh¨Ò³¾1Xz¸yK~Oµ\0mÜ^Gn¹fa]k\\±KP\n©mgw¨Ò’ö­û-*+Pµ\0cA¢Ïráî‰\"·í,a¶Q±FjÈaœÅ/\0´˜ÏZZ(2<t§Ïzu\0Íù8£8ç4ÒsÀÑnÉ<PÁ§N”ÂèŸ|íúÖ©­a¶9oQ@\Z·W±Y¡f`O¦kœ¹ÔîoäÙj£±Ó®ï&\rrIL÷®¢-”l@ï@öZüIuË{Öäéá@ğI>Ôú\0n}©p=)h f¶q‰5Bm&ùd0kPŠAŠ\0æçÒ\' çîÖ\\º\\QœÈ™5Ü~•ÛBÿ\0y Òd8·-[Ëa½Û v®ÊâÆ,ô\rr—¨öóeOš‚€<E—+·ÜÕÏé†O(H€Ÿz¥®ÚBÔ­¤F91×ä#ğŞ¯§Ã%Ê»–hÜ °´|Ø¦V=zÕè/ç³!;|áà½Äfì$«#Fëè­î;›5ûXØäw \rû}r2£ÌëW­õî:+›m>6bÑÈôšÖ×\n¤Ã‘Š\0ìAV\Z¥qj—VÒbL+z×]GA¿­\0mš5^¸æû¬*Àç¡ Á£9¥Áõ¥ à´¡@éAéÅ4)\0îhÇ¨€\Zu\0VÆƒ™&³î4aÿ\0,8­vô¡AÌ›+ûvÈcŠ±°öØ\nMoÁªòØÁ0;Ph5˜fö«é*8Ê°5…q¡0% 8¬ækËç,\0v4„â¹ûO„•0k^+Ø¦^X\n\0°<šP t¤VV)˜ÊÀçµ\0q_-u+:XôÂÁˆãâÖZ÷…ìç\ZÜ/,„ğHÍ}>Uep\rcê^ÒµE\"òÙ_ğ  ğ•Ş¥«Û« ñ çÒº	|HtÑ³_pÑ´k½şÁµÒôÖ‡LˆF1Ú¼wÇ>Ô5±åD9ê(Ô|#ªè·ÿ\06©¸õÅur(?Zòß…»ğÌ^eãÆ½\'PÔmôØ^iäU*24\0ùgK8\ZK‡\ng“^w®ø–ëVÚi›¹8Èª\Z®¯âÛñ!Šî¼=á¸4«uó4ç’M\0excÁ«n¢ëQ§<ó]¦ÕT\nƒ\0RÅğ>í;\0Ñ8¥ã—b€\"ò†h©qE\0>Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š(Í\00¨İ×š\rò¸È÷¡€İ‘Ö“–àĞ]ömy’Š«›¼Òï4Æ/nX…ì+¹U\0ç48R>eİ@†âÉŞ¦À8$Šéí¯ ¾@`YÚ£aDl}+”{-C@›}Î€Ğ¡¸[	õ¯ø™ã4	vvÁds‚ÀW¡é^,LG~v7Nj¦½à];Å?¿;NzPxbÅµkd½¹¾#%WE¨A£Z2ZF.$#°ÍiXü5`F“AĞ[ö>¶µ<¤KÆ€<7Oğ^«âo­üŠöñ†Î:WkãojŞ\ZÒÖÚÆ\'ªã W®$0Ã…Š%_ ¨îôÛ[ä)s\nH¨ ›ü	ã¯Şj.á!nà×Ò´ö¨ó1æ©ÙøkM²}ğ[\"·ûµ¨T…Ô\0¸ÏCN¦¨Å:€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nBqKHHï@O¡æšÀ8\"P÷£oqFr>n(•Ægrî”1îsWş›q{YJ@k±@<\Zp$œ”çQİjZ\ZP+_OñŸÁn×ÊÏ¨®®Kxd’5lúŠÂÔ¼\'oy¹£ÄmÛ­m¨Z\\`E*³Ù«¸â¼ÂãEÔ´yüËBÎ­K]¡RR€zĞrU[ï`Õyôø¦S…\0ÕKOX\\€Q¸ö­Ea\"‚‡ Ğ#èn¤´rcªšêÑñ‚ÀWGƒµÚÇ¢€2¸°¯ïşSïU_Äk)ÛÍŸJ»¨hQßgµŠ4\'Óß1ø ±ÙOxÛÜ§µi[iQÅ‚ÀTmõ9\"!%]¢µ\"ÔmäÀÍ\0Y\0&ŒR‘¸Swå9à0y \nAäÓèÏ¥0“@\n[)ôáŠ(\0ùM(éMÙïUî/á·ss@w\'Š£u©Ál§kãµfÜêÒÌJ@	¡µÑ$™Ä³1çµ\02Mnæí¼¸ĞëŠšßD–ãLçÆ¶íì!Ff¬ãŠ\0©o§AŒ -ëVCà\nv*9dºR\0 	\rÔf¡šê+aûÖ\n+Sñ,p)[C¹ë¥­K¶edŒ÷ \r­OÅSl³g¸¬…†ûY“ç,¨k¡Ó¼5\r¢ƒ!Ş}ëf8c„b5€0,¼\'k\rpÛŞ´†š±à[|‹íZ\rÈçŠc–P6t ‚#\ZáiòH#nWšş(Sæo›Ò°¯µ9îÁŠ\0phZmrÊƒ(İéY:Ä×²Ø§¸¬uğÅÌ¾l’0ïŠÛ´¶“MP¡7c½\0>[…3{\ZÕ·±ŠĞ°ëQA|ì~aj¼æE\0?pÇõ¦ˆğsOÖ€ÒÑA \'š ´¸É¡‰@Ï·¥9NG4İ£«U+½V`@`Z€.I\"D3#b±ïµÕ€‘n7jÊ¾º¹ÔˆX3Š¿¥h˜P÷<Ÿz\0£ş™ª¿Í”SZÖ:@CKó\ZÖXãŒmUğ£É€BÆv¢àT„dSA$r)Àš\0@\0¥#=)¥rzÒıÚ\0uQ@#ÒÔ7QZ¦é›h 	zzÕ;½R+d;X«&û[yr–œƒPØéÜÉæ\\ƒØĞgº¹ÔØ¬jTzÕë\r\0DD“Íï[[Ço£#Ú¬O^\0*¢Æ0ƒ¸ç&Á¦œw éÒ–˜IÏ)ô\0QE\0†‘ŠqäTL<³(Àg“Ò©ŞjpY©,Ã5Ÿ©ëŠ Çlrİ8¬«].ãT“uÁ!s@ºÔ.µ–ò­ÁUõ­¤èßeOô¯ŞëZ–1XÄ5úÕ¡–Ği4ëwF«ô©øN\rF\"µtJIëK(‰¶ğÍ–‡Ú+7®Ú‚K.Ø•_%kº*¬ß2ƒQÏj“FU@Sí@)†]8å$2cµL¾\"œ\0†ç¹q£y`°ùey3*ğá}q@Åsgr3pUúÒ½”2ÿ\0Ç«ƒôªzD2®|Âè*„	y§ÉşYÔPÁK«N™À«kr(\nùª°ë[“mêí©RK;ƒû²2hf\r]\rç~;¨¥û¬+—›N”®èOEeºµ›<Pu·œŠRO¥s¶zã`	zV¬Z¤2c€.æŒÒ#«Œ©Í) äçŠ}0dRäĞ\0W4÷¤äšwAÍ\0\'#Ş£1Ç.C ?…KÀ Ğ|úL2rŠÖ}Æ‹*Äæ·ö‘Í&ìœ\Z\0å–{ËÆb´­u­øgÖµÌhz¨?…QºÒb¹éòP„½·o¸ã5:¸qÇJæ®´imëv-Ii}woş¹H€:Và`ŒŠˆ[BçqŒgéT­õt‘¾sY> ñ••…»G¡§<\0(ş±â}*†ğ8Á¯ükyó3G?.“£Şø’ì\\]äBNFkÒl4¸4ø• PE\0SĞ´}\ZPƒxêØ­\Z˜X±Å.İƒ4\0¹\0ã½-5S\'u?\0”RâŒPQKŠ(h¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(ÅPmÍ-Pm¥¢Š\0LÔÉ%]AÖ”\r8€zP3ªøFd„íqÏ…Ú¦‡&Ó¸Â\rzâ§™=´WhVUP.›â›{œ$§kÖú°‘C)È>•Êj¾\\yš~Uë.ÓW½Ğå	~Pš\\zV]»o~™BûÖ’Ã!³@\'šns÷iO#šP\0é@\0¥¤Î:ÒĞEPEPEPEPEPEPHFih ŠÈÅ-\0ÅŒ\'J~(¢€¶E\0Œ õ\0ş™¡[j÷ªè+RšÀš\0àïü%£ÓÙ‰öª°j\ZÎšvÎ`¯FhÅE=¬WK‰T\Z\0æ¬<co—y]­ì‹º&ñ¬Kß	YÊ Ãö®nïFÕôç-fÍåŠ\0ô‚p)µp–.{#ÔQ‹õÓXk¶úŠşé‚çÔĞÉì¢¸È Y²èŞWÍ9­‘´•?Z0ûÔÎy×ğ6\0;h[ëQ`$Ü=i:‰01TgÑ pYF€.Es¿tŠ˜Œ×-%ä/˜ÉÀ5q5ƒcúP\'¸sŠ¯u\r§úÓ\\ÕÏŠcºm–Ã\rSÙiÒê=Ó´%Öµ$òl´Ï4C¦Kpw]k[évöÄ^E\\uÜ1Ú€)A§Å\05uH\0Å\n¡×‘\"€ühAL’E‰K9\0\nÄÔ<K²²Çó7µsos©jÓbÂ2h¢¿ñJ¦;c™k	ŸRÔ_kn\nk_NğÒÅ‰n9“¯5ĞCD£h ;Ã1Ç‰.[Ş·Ñ#‰BÆ cĞRHÌNœ‰ÏZ\0AH5×1À2äV%ö»œ¥¸9 \r{«èm‡ïXVÖ±,¤­˜$TX\\ê2nŸ;MoÚiPÛ(ÀÉ kK	îÛuÆFkrßNŠß\0MZN\0Åç¥\0.@¦8R9Ÿ´Svó@ı•	Î*DF;Sé½(™Lk•ëTáÔ°O›Z\r\ZÈ9¨\ZÂ&9 	b¹I¾á©zMc\\XN›bE-¼òÚsvÙ \rrOj‚âò;e&B2+.ë_M¥ cYöö—W²n¸\'a ½×&ÌvÀàÓìty.™tO>µ³m¤ÛÀÆZ¯…^ÚÊ+Q„­R`Ph\0+š@¸§Q@\rŞ3Šu1GZD4\0ğhjBÀQŒhßJk¸K9ÀZîú;D%ˆ&¹Ë›û‹÷)vš\0Õ¼×¡JBrõ©w«I‹œˆûUı?Ãà%ÆIë[É\nF¡U@€3ìth­”ddÖp\0Å:šA4\0¼f“úRâ†;E\0\0b‘—u5X±5&q@\rû¢1\'”¬À.j4bç+Ò€$İÎ)2Aç¥Èœ±±5-hG”‹“í@\ZWº”6JLÏa\\ÕÅõæ¡.ØòÍz}Æ§/™u™âº{[­Š\0ËÓ´%P$¸åıëmcP¨\0¦³?-\0”j\0ZZE;†ih\0¦íiÔP{qFZ_º)AÍ\00dzSdU“åÚ)û¹ÁªWúŒ6(K»ZóL¶\ZY®y¯<É|»%İÛ¥2âîïT¸Ø›¼²k£Ò4XìÔ;¹ 	´·eßz6Šªm¢ş=	İ]åÅ¼w)¶Q‘Ysi0€E¨ùè™P¿µ?8ÊU¸µËYFÛ…ùªI4›ÍäËÌuÙY(Ã§ï(Á‚ÕÅ±5±–Ìd±5•siyß`Ä\n–ÃZ–ÓåÔÁz\0½©sasŠØ¶Ö\n®n\rPöš€Å²„cHtÆ_šW”ĞÛj0İ«oÎ­¡¸©ã•ı µ5¾§=¶<âM\0uÇ=¨ÿ\0z²mõØ¤Ànµ¥ñÎ¹?:\0”\n7\nO`i6Päæ”Œıh˜9 ”î´ĞàœSe“Ë#èÌê\rGsF&2€M,iæÊ@\0gšóïx¢K¹\r’OŠ\0_ëV±†·Óe<q\\Æ™à«íJëíWeÈÎ@5Öx_Áß0ºÔ.yæ»ÔD¢€¥\0s6o>•ÂÉ„Q×«³\0Z»%ºÜgÍUôH°L#\r@\Z\\Ç/*EHË¸W)5•ô|¢p*kkû›sş‘’(¤^½)Àæ³mõˆnaàÖ‚:ºÀĞè¢šI\0ê)›è ÑE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEdPH§ZUÓsš~h¬Ã84¤… ®Mx ‡,~^*­æ™mz¤N:ÕÀ;(@eï†g¶f’ÉŠ¨ì*MfëO”%È$Ô×o°ç“‘éToôˆ/c#`\rë@†±ğÂ°\rõ«»ìƒÅp÷:Ö‘\'nÅ‡\\\n»aâ§R\"»M¸ã&€:ñïKU­¯à¹PcpIíVh\0¢Š(\0¢Š3Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0(¢Š\0F8ˆr9§\ZO¥\0V=8©;RgÚ€\ZŠGŞ4ö\rÈ4˜Íq@w¾±»¼Cu`Oákˆ‰6,PJíM!ÉP%ö£¤KûıÒ[v>1†á‚Ì¾Yõ5ÑIeÃ÷±«}k›Õ¼ÙcjDgÚ€:(/-æPb•[>õc½y‰Òu=]Èí\"ŠÖÓüc2È±]Ç´2E\0v’\rÇ¨.4Ø.¬‹œÓ`Õ­.™r{f­}ì2Š\0æäğ´qË¾Š°%›MP¤¿õëQÉl	”=è.l7¼ÖŒw°ºn.«õ5©ÉcoÙwúWj7:­ÔåmÏj\0ôGÄpY#Ä‡Ú¹ç»½Öä\" È¦³´+„`ÚŠ–õŞYIfªAQ…\0céŞØÁï>sï]°[ŒB¡qS†2§4Ğ¿…\0;>´¿JäTÿ\0Xp+>ïWH|ôvk”€eÈ—u­)aäûV|’Üj€¥A«öz„†”çÖ€3Õ./äù²Ö­¦GtƒsV’Ã\Z®#P)«+dœĞĞ*|¨0)Ã¯Z¥5P©ÎhÛyæÒšÔ£§4\0Òrh*iOŠiÔ\0ñÇZBsÀ¥S¸f›€™,p(6Ô4‚%ËœUK­N(ÚC\ZÄŸR¸¾>Z!\0ñš\0Ò¼ÖÒDx-X¦;­VNáMhYh\'p’sœóƒ[©p(¨™a¡Å\0a¹ªíÀò†*Ï,Cuæ€2ã¸•XTËª&í­Å\\1¡ãmQ¸ÒÄ¤”84v7Wùƒf¥¬X`šÚLJÖ¬,Xs@ÓsšR@ÓQ”ô<ĞƒœÒä·JS€9éY×º¬vËˆÈf ²Ë+™¬-GY-ò[ò}ª„ÒİêràªkgNÑ–\0\Za¹½è.ÚÆâÿ\0æœœVí¢ƒjàŒ(Â\r´ƒÍ\0*¶E²q@”£¯J\0o9§Ò\nS@	º´}hèyé@\n\0Œ7t œô¤y%Ë\0.Ş0İ*­ÕäV‘–3éšÌÔõ  ÇË{VeÕü›§$)ìh×÷\Zœ› FqšÓÓ´A\rwó7½iZXEj€*\rŞµlĞ##]¨\0ãÍ4®zR@€´‡1@lö¥#(\0QKH)h\0 ô£4PAìiY‚O\0TSO ™)®gPÖä’C°,:q@\Z\Z¬ª\nD~jÆLºÕ¦ó%$ «úvó‘,ÿ\0­t1¢Â¡c \nöšt6¨ (ÜZ·´çÚ“a\'4¹ÁÅ\06T,¿)Á¦Ä6Œcš—1@ ·xªÓiK“°n©ör\rKĞP\rÆ6’Ø™=’C‘sóô®Ã$œ\nâ‰¸‘AúĞ\nöÉû ò,_k¶9šS\"úfº»½!\'ÉÂf°.l\r“şòMşÔñ€„zœU˜ŞŞüeØ)=ª$R®Ã\0úâ¨Ï¤1>dSlöÍ\0jIb#æ›éP»Œår Uu‹5¶Ì£Öµ Õ£¿_ß/•@Úën˜WäŠÇn>uªÉ bcpÍUotÓtXø \rKO[\\¶Ó…­¸î¡”@}³^o?†Ş^6*k:ŞçQÓ.å(Õdº€6ŠÓ4ÛËØlmüÛ†\0Ş¾xñg5]ğ]¨,‘ZZ7ÄOøXEiæùrÍ\0vzçˆîu‰¾‡ŒŠÜğÇ…’Ù÷«ºSÏ5wÃ>·Ò­Ô¸HGS]NF8”\0Ó€¡S€)T‚>j6{Q\"†Sƒ@¼.GZg–H¢§P°¨ª×1ÏÔUœæÆ€0î4L\rÖü5Tug÷²ÕÔTnˆÿ\0}s@üZìˆ@t5©o«C0ùÈZšK%_¸¬{Ï¼™0>Ú\0ÛûU¿üõOÎŠäÿ\0á¼ÿ\0ÍùÑ@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@5›:Ó©¤äĞ8q‰ïYZ‡ ½É@½«\\Ü\nUë@öšD›¡,Êµ©¦x ûä#ÖºgD”aÔ\ZçuŸ¥Ğ/ÊŞÔ½\rÔwK˜0©K*}ãÍpV§QÑŸicº+]zÖáUf8’€6DŒ[”ò7LFY#\"§|ÀPºQÔSCz•‰ÆV€E5I#šu\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0&Nh<ô4ÓœÒçoZ\0F‰aÔ7Ö²¯ü=mz!õµÆ;Sf8è(‚¼ğÅÕƒ—´‘˜ÔØ|E©éØK˜Ï–:’+º¹º†Î=Ó0¸íT‹W­ì,xÎ(ì4qûEÂ¤£¨ÍRŸÄ·\Z³ÓèÏq\\Ÿ	îï&3¼¤óŠè4›Kÿ\0	!tÈ ’ËÃ3]°–êB9äWQk¦ÛÚÆF¤ø¬=?ÅöŒ¡nÇ­ø/c»P``s@	5œs.…¬ÆÑÚ2ÌŒx­À8æ”ûP6·—¶òm\nJŠ–GhŸ¿;Z·X¢ıà?*ÃÕ<5¦wç@j2k-¶vÖ¥°1ÏÖ¨ÛiSiCã8«‘ê@Š\0×âEœ	læªCªÛÌ@Væ®+( •<sNÛš1”æ€qH[)HÍE\0\0ç­=¨4Æİ»”\0àÃ8ïHFO#ŠI#‡æv‡y®”Ço“@ĞÛ)ËÖ\rÖ­=Ñ)\08¦¥…Åì¥\'mnZé°ÚÀ&€2l´™emÓ“Ï­oCi* Ï®*n æ€\n(¢€\n@6ÒÔn(ç‘M\0ƒJƒšFnÂ€‚ÿ\0 \0Ewi»„JK\0 ‡˜¤V=ıÉÓrìx§Şk°Ä\nBrõ™ö{`âpDf€2î<[wq!;Å^ÒàûC‡¹oÀÖİŸ‡í­c´ëŠ|š`Nbâ€.ÅH D¢¤Ï­W´£áªÃş”\0¹4»¨šá¡$Fï@ı)	4½¸¨÷0<Š\0“pi»hÛM;·\0DI?{NyV%Ì‡¨êêTÇnrÔrëQ†Ñô¬9o®u\'Ø€…ªöÚ]ÍäÛæÎÜ×Uicª\0\0Î(*ËA\në,Ç\'ĞÖò¢ Â€)A¥ Š( Š( Š( šc­6BWîÑ—,q@\nWÒ©_jpÙÄÄ°Ş³õMt[“<·µbÃauªÜ‰%È4,’Ï¬Éò’5¹¥èÉl¡¥›Ş®YéÑZ°Õ²}(\0\0…â€(¤VÉ QE\0SZMc@®(Æî´¹ÂÔjù4\0âBôëHw&•ö¨,Ç\0V¯âVGt§(Î¯®Åb…#lËéXv÷zœşmÀ!O#4ºV‡-üßi¿\'®pk¯DHU\0\0\n\0tø¼ »@>µ™s nbÈç•¶	§qÍ\0rÍfÖàƒ|U	ìŒùãËÕÛ¶ÃÃ\0\n©>ŸÀàc4ÄGaögİ¥ßÓ5u5[È\0Ävzâµ$Ñ>ÌÆH>fôª³—\'ëŠ\05;Iø™ğŞ•;ÁéşÉ¬¹´{Vù·õföÅój-\03[ğm¾¯g*\\Ä¡Šœq^K£|;»ğî·$ö íİ{rk\r\ZnÔ*hoìnOú2©cë@½—ˆu;>Ò­µ}k©Ó|aor Ü>Öû­9nc\"EP\rs—~…ŒLC{P{m«Úİÿ\0«\Z¸ª:ƒÅyVŸmwep\n–Ú\rz\r†«’«1ÃP°<ÓI#¥69Òa˜È©#Š\0j±=ixÍúQ´ô\0¢ƒÏj:})h\0Æ)¬Ät£$š•Xâ€æJ*?¶ÃıáE\0Y¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¦N;S¨ í¥4Ï=*Ji€ˆ^´àr)6ç­.=(9íÒá\nÈ¹Ëÿ\0©İ%¶Cv®œtæ–€8ï5\r\\]nh«¡Ó¼IĞÈRkVîÆÔÛ:†®GQğ¤É)’È•Qé@¢””R>”¹Ú9®*ÏV¹ÒHK X\nèìµ¨/†	õ \r0r8¥¦®ùNE;4\0QH4f€ŠBqJh\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢ŠBp(h¤\rš°3Ö€œÑ·=i¯4q®]‚sX\Z‰RR¼ûPÕÍäVi™l×=}âa\"˜íİê+1­¯u·İ’¨k¢Ó<=¬`Ì»€9ÈôİSS`nyD×E¦hv–X*3\'|ÖÚ¨E\n£\0Rykœãš\0b– ÅGsi\râm™A©66zñR f÷ÁÖ’åàjÁ»Óu}7›BÛz&1Ò†PêCƒ@}§ø®âÈíÔU‰µÔi%´Ô#`§ÜÔ÷:\r•Ğ>dC\'½qú—ƒ®­¥i4Æ*=¨¿Ú’?CJFÅùkÍ­5-OGôÍÎtv>1Šå‚È›© •äTéğÜ¬øo •AITç¶jl†ès@ÓhëM¾sP»€àçÑt¦2#ıá@ñjÆ2PsZPŞÅ7B¨®tøeè>jÉ›I¹ˆ–‰\0tG‘òšGZÀ¶Ô&¶;e±VÄÆ	q·ë@\ZìB“YWºÜp«Ë{Vlú“êÇe£céV,4Vİvw\Z\0¤#¼Ô_rä!­«M\ZUZA—ïZD®Ø€Ÿ×ƒ@\r@ª0‚®NM;TaXO\0ğàğ)Ê0)¥@u¡N4\0ú)¡³JM\0- 9¥Ï­  w4:šcº\'ÌÄVMæ²£1Ä2M\0^»Ôa´9×;sww¨I‹|„4[é—Óo˜™®’ÒÆ;TG4“aáô’ã%«r8Ä@*ŠszR´\0œgŞ“æÍ;æ‚}(\0Í5<v¥Ö”‚zP9í“­R6óÄÜf¶#­+`y èï\Z!ûÊ™/ãâ¤{d“¨ª²X,gp;@ ªKtéPİßGh‡qª\ZÒ@¦$›±şËs}7™!;\r\0Mq{6 Åa\n»§hY?\'Ş®XÅon `­êz@ @Œ\n8=h †phH9âIøÒæ€\n(¦–Á QFx¤€Š3µŸ{ªÃf9!¥\0X»ºÖ\"ò\\åÆ±-ãí³ƒéUæ:Äù\\ˆóÒ·´İ;5†Z€3ì43+y·|Ÿzßİ À/Ó¥Aë@¹=iIšZnÜh¡òqO\0\n6Ò“;zĞ¨£4„â€“ŒŠh9>Ô\0}î;TsI²bC{¨ÅcbA>•ÉÜŞ\\ësìƒ*¹ 	µ-VæöS¦y8È«ÚG‡„X–ë™:óW´,â\r(İ\'­ks@\r\0(Úƒô¨İÂ¦Ç¥5ã÷ºĞ©àRÓUH¥ÚsÖ€£4Ö\rü4üP}¨ª´Ê0ãŠpÍ5ŸiÅ\0gÏ£Bù(9¬Û½2è&-Åt¹ÀÍgj:¼VQ’/ØP:ñÀc1j ª§.üéÄ¯¥hiöªİ™§S´Ö¥ÎŠñŒÙğh:»´1dq5»%ÂJŸ=Y×©û_Î+>æ;9IQ×¤‰\rÚæ£5^ksô¬q¥^Fûà›júf¯Ã«Éf6\\¡“Ş€—w0	œVœZ»B–©®¡Ş0¡	õ©Í”R¯ß€5mµ˜\'8Î\r__H®:k) oÜƒOŠîæ×BHØgµ\0óŠÅ¶×Qn^kBØdRÅÂıM\0XwX”³p+›ÕµRùHOµ\ZÖ¸‡0[Ìxâ«èú4²H&¸ÎÓë@ÇíÄ“óQ^€,¡bŠ( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( Š( º–éJH‚HéM)»“@.ô¸/îA“\\Õÿ\0‡§„“hÅGµv mÒŞ£4ÆØx‚{×Jxş#]U¥ü(\nH¤úf«j\Z,è~P­ë\\Äš=æ“6ø™E\0w\r\' ñNû¢¹«/!/Ò8æ·à½†åAÁ 	ÁÏZ\"“=\0³Å(¦ìç\"•[\'\0ê(¢€\n(¢€\n(¢€ô ÒE \0…M SNÍ!\'µ\0;¥ Á¤Î—àV]öµ¢ŒzPœ…eÎÑXšˆ#±F|ÃX×\Z¥ö¦Û\"R÷«º‡áîãï@RM}­?î÷\"šÚÒ|4 ÃİüçŞ·!µ†ÕvÄ€\Z™In¼Pâ\\B¡~”àÄ64»€éK´š\0uQ@Q@Q@7yäS©‰8Å\0C5½À>lJÙö¬=CÂ°Ê	µÚºCŠBÄt 7›AÔôÉ<ä•™GlÕ«_İÙ°[ˆŞ™\"»ÃµÆ$PG½Q¼Òm¯c*bQø 4ïZ_ İ\"£zZÈé ÊÃÚ¸‹¯´f¶”‚;\n‚-OSÒ¾O-W¾(½eÁÎhÎş1Á®sOñ$sŒŞŸ-½+n\rJŞqû—Ğ¦Ú>e±5?‹şc;t\0äÑÀĞ/i£É£|éób®.¼ûö¼{}ës`#\rÏÖ«\\iñN8P¦€¸¤PwŒÔù÷NkŸŸL–ÌL~”±_ÜZñ\"œP@N‘éT-õD—ø«Ë\"H>S@®)¬	äT€b˜X†Æ8 C‘ÒšÄ§=jQÅE-Äq]…\0o\0“Š§}©¥ªáH-Y·Ú´Ş]°$Jm¶›-É>yõ ÷:ƒ™Z6Z0Œ‡›“ZvöÑÛ UQšœÃÒ€Q@AN¤´\0QE\0gš(Ç4P\0N)¹=éHÍdP”‡ ds@]¹ÏJÍ¿Õc¶c;ŸÒ€-ÍwHK0R+óQŸPo*Ü=E$vÓê²n“*¹­ë=>+UÀ\0·­\0dØè¤ÓŒŸzİ¢&Õ\0qRtéI·š\0Î—Oy•8¨Ls@q’kUÜº3F‹óh>+æS†«ÑÌ$Ø«)ñÁåP„Ò–ÁÅ;#²†Îh~œÑÁ¨…Ìg€ÜÔsÍ\0 lÓ]•ys´TwWqÚ!.@5ÌßjSêåÛ·ÔPİS]Ùºo™JÃFñüë’vpjö•¢¬x’çæozÜiÚƒ€#¶²Ù@AŠ°iÔ¢€F)Ù¦³Bò3@¢Š(\0¤8ïKMeÏ4\0›NsJ\r0;ÀS™Ö%ËœP\0éõ“«j‹kHÎ^«jzñŒ”·ä8ªZ~.£(–ç8Îy \nöV—:¤Û¦ÎÏJê­tØmTyjzÔ±Eª@*V\0ªHàÓ©«Í:€\n(¢€\n(¢€\n(¢€ÍØRàc-F‚OJÀÖµ¡\ZùV‡s8 	µ]v;0V2ºb±,tùõ[¯´Î9Á©´­KÉ>ÓzO\\à×Yi„Œ€xà@±([”c¼P^4aÀ5J}.	Ø€7­^4 `P56p	d”àvÍWb-¾Y Ş}q]S1¥!†9GÎ€“í@T°¥Ó~ï÷Y¨e¶¹ÓÈxä2Jê.´$™·FvÕ²–Ôò<À(1<A\"€\'„êE^·¹´¿L4€JáEâùoO|VhĞİ¼Èæ9ôÍ\0m}‘\"İY—úuÓRC=©ŸÚwv\'!’­Gª}¬¶~ì÷ ½?O{y¼ÉÏ™Šêà×Œ®Ğ8ªI- bpäÒO§ïBã\0Pè¿ƒ÷‚ŠãŒ$y¿­ßQE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0RŠZB3@áF})6ŠP1@	Í5¾nA©( kßAxK}Öö®vêÒûJr`ÜbZîé’Ä³##ŒƒÖ€9+Ä±¾#˜à÷Ít©\"ÏhÎA¬ïÃ´½®CšÅIu-\"_Şî1@ĞÊğiÀÈ¬}?_‚ğ*·ï[\0‚>Rö ¢¶(\r\0-w¤Ïa@EŞšZ€HŞ‚ŒÔ71Û!y`{ĞÀb©_jpÙ).Gƒ}â_´1ŠÈİ3U-´›İAóx[a PñÎ ş^š	^ø«z‡Úçİ±İÔƒ[Zv‰m§Ä¹cÔšÒ\0œPk{8mP*(úâ¦\'–œT\Z\0À ÁôëJ„wqNÈ§P\0âœ(\n-\0QE\0QE\0QE\0„ûRÑ@Û»­;¥¢€#9Ï=(É•! PëÍC,ÍÃF§ß=ÏßxVŞè–VØ}«ºÒu\r5óg¹€¯AÍ >·ñMí›ÔU•EtÖ%±»\nğÆ¬j\Z®£Ÿ99öÌ^x=­Xµ9í@Â2¸Ü§ Ò±ãŠó“u«é-›Æ1[Z-ä.W ¨(<‘šdĞG2í`*;[ø.Ô4N>™«8€3dÒ‘W÷gšÏ˜][“$WEÒ‘•\\`ŒĞ%®¬êqp­4¾ŠNTñL›M†^£—©iÓGnE™9 wú´qFDM—¬ˆ–ëP|¾B“YZuâ\\n»ÜTõÖÚê0B¢<`ĞÖzlp\0Xjş@1LIeÜ¦¤\\Ğp\r1™·qÒœË“O\n\0E9õ¥¦€sN Š( \0ÓG&”ô¤áFXâ€U§¹ÌxNûWH~TäÖb%Î ıÄg­\0%æ±=ËìA\"§Ó´f”ù·dîô5«g¦CgÊ“Ö®Ğ5B \0Rã)İ( rM9ºqKE\01xëG|Šy¤À 4ŞM;–€\ZTc¶Á”àóSÓ$‘aœ€(/ìR+SXš¿Š_K&>I­-KYg]˜Ët¬ûO\rÿ\0h¿›¨Œçš\0Í±Ô¦×dò»m£Ì`3b¢ƒD·±P-—¡o–=è@È%¸§‚1òÒ¸È¨ŒéÁ 	‡Nh&‘$WSNÅ\0DP±æ¤QA`)AÍ\0SKvÚ9 S9À¡I<öª·šŒVŠw»PóÎ–±—\\­ş®×Ò­‰ëÚ£¸šïV˜¬yòó[zf‰\r¢‡q™(¦£t’çüÖôj±¨X€\0S›Ğô§\"€8 °“Ö”uéN*	 ŒŒPCdñÒŸHª¥-\0QE\0R¥&ñŒĞ¨\'\0“ĞTm2¢b\0Êê\ZÜ×W,úPšÎºòÈm¬2ÍĞâ¤Ñ4Cş¾ï—<àÔúN†<¼Êy9­î\0ã@\r#h>”Ÿ^´ğsAPNh\0ÆzÒd\nu4 &€\0Ò)İ)Í\0éFÑGJ\0i\0ïN¨æ BÒ@îíáò™˜Årçl×%\"by©µ-]ïeò-³ƒÇ¡¤éj¢i¹cÍ\0S{k˜~ì{‡Ò³Z§‹¿×t¤8ÈéT\'Ñí®»Œ@“éÉ\02Z9lWâÏŞèá¡ÁÀâ½bÿ\0Ghâ\"Ï9¯=Õü.¥9kåÈúP•·Äë²Äüıh¯E´ÌsÏÒŠ\0÷\Z(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\n(¢€\nJ( ÁÁëQÜ[Gr»f\0Šs¬§¿J\0æ¯¼8Á‹Xü§Ú²ãÖ§Ñ&ß1?Zî‡A^eã~oF}h¿ÓõÔb½\r^ÀÍøKş=é]! ê)\0Å(éE\01²OÂ$,İ©ıêßø÷¥\0sºŸŠâ‰Œğı*„Wú£ng>Q÷®[UûWş^•áïøó_  ±Ğ-­@b™“ÖµxQ€1N¦µ\0\"iô\n(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¢Š(\0¤<)OJA@\r³O¢Š\0¯qiÒí¸PÂ°uÚÌ„Ú¦Çö®‘©W¥\0yßö©¥±u‘¼±ïRÛxĞXKåŞöæ»-[ş<ßé^#®öîŸÅ@Ï¦ëêj]\ri{W\rà‘û”®ğP4œŸ¥8ô¤^”\0Ç…†QTåÒ¢c¹\r_ïK@2Øİ©ıË¢…ÔÌ1Î:Öéèk”Ö>ûPİ¶¯ÁzÕÜA+‘Ñ¿ÖŠìîŠ\0Pİ©iƒïSè\0¢Š()æF]º\nÀ¹Õšíü¸;V¶«ÿ\0\\–Ÿÿ\0ƒıê\0Ş³ÑË÷æ¶b…!]±Œ\ntê×éJ(h¢Š\0(¢Š\0(¢Š\0(¢ƒÒ€šZjõ§\Z\0«ut-\"i¤û¢¹©o¥×%Å©!ÁÅlkÿ\0ò—é\\÷‚øwúĞG§é	†”eëO!\0©ÔÉ;PZu\'ğŠZ\0F<U)íZlâ®5*ô gZIÀ§Ãª€püÔÚ—İ?JÀë\Z\0ê¢™f.1Ttï¹WÏJ\0i-‘KÇšU¡~õ\0ejÚ²Ø¦ZÂ†Ò}fA.ã°S¼W÷…iøWş<Í\0jYYGk\nîõ`‘»´áÔÔm÷¨\0Úwdô©GN)îÒ”\0QE\0QE\0QE\0éPO2ÚBÒ?ASµŸ®È>_¥\0sw7ókU›¹Ç½¥è±Ú(yeîk˜ğ¯\ZÇ­wô\0™“ït¡¨Z\0LO)\r(é@Q@Q@h¤ïK@Ë\'”Œç ®CQÕT¸ò-Î0pq]U÷üzKô®Gÿ\0³ÿ\0½@^•¡­º‰%zÛ mÃt¡>âı(»@\nGİéO\'iWîÓZ€3MxÒQ‡\0ÓÅ4P`ƒû‚Š³E\0ÿÙ','image/jpeg'),(85,NULL,NULL),(86,NULL,NULL),(87,NULL,NULL);
/*!40000 ALTER TABLE `imagen_publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informatica`
--

DROP TABLE IF EXISTS `informatica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `informatica` (
  `informatica_id` int(11) NOT NULL AUTO_INCREMENT,
  `curriculum_id` int(11) NOT NULL,
  `software` varchar(45) NOT NULL,
  `nivel` enum('basico','usuario','experto') NOT NULL,
  PRIMARY KEY (`informatica_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informatica`
--

LOCK TABLES `informatica` WRITE;
/*!40000 ALTER TABLE `informatica` DISABLE KEYS */;
INSERT INTO `informatica` VALUES (2,3,'Microsoft Word','usuario');
/*!40000 ALTER TABLE `informatica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `listar_admins`
--

DROP TABLE IF EXISTS `listar_admins`;
/*!50001 DROP VIEW IF EXISTS `listar_admins`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_admins` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `sexo`,
 1 AS `fecha_nacimiento`,
 1 AS `correo`,
 1 AS `ultima_sesion`,
 1 AS `activo`,
 1 AS `clave`,
 1 AS `imagen`,
 1 AS `usuario_id`,
 1 AS `persona_id`,
 1 AS `admin_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_becas`
--

DROP TABLE IF EXISTS `listar_becas`;
/*!50001 DROP VIEW IF EXISTS `listar_becas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_becas` AS SELECT 
 1 AS `usuario_id`,
 1 AS `publicacion_id`,
 1 AS `descripcion`,
 1 AS `fecha_alta`,
 1 AS `fecha_publicacion`,
 1 AS `visible`,
 1 AS `beca_id`,
 1 AS `programa_academico`,
 1 AS `url`,
 1 AS `imagen_publicacion_id`,
 1 AS `imagen`,
 1 AS `tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_cursos`
--

DROP TABLE IF EXISTS `listar_cursos`;
/*!50001 DROP VIEW IF EXISTS `listar_cursos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_cursos` AS SELECT 
 1 AS `publicacion_id`,
 1 AS `usuario_id`,
 1 AS `descripcion`,
 1 AS `fecha_alta`,
 1 AS `fecha_publicacion`,
 1 AS `visible`,
 1 AS `curso_id`,
 1 AS `nombre_curso`,
 1 AS `costo`,
 1 AS `duracion`,
 1 AS `libre`,
 1 AS `inicio`,
 1 AS `imagen_publicacion_id`,
 1 AS `imagen`,
 1 AS `tipo`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_drafts`
--

DROP TABLE IF EXISTS `listar_drafts`;
/*!50001 DROP VIEW IF EXISTS `listar_drafts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_drafts` AS SELECT 
 1 AS `mensaje_id`,
 1 AS `usuario_id`,
 1 AS `asunto`,
 1 AS `mensaje`,
 1 AS `curr_adjuntado`,
 1 AS `fecha_creacion`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_egresados`
--

DROP TABLE IF EXISTS `listar_egresados`;
/*!50001 DROP VIEW IF EXISTS `listar_egresados`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_egresados` AS SELECT 
 1 AS `imagen`,
 1 AS `correo`,
 1 AS `clave`,
 1 AS `ultima_sesion`,
 1 AS `activo`,
 1 AS `carnet`,
 1 AS `cedula`,
 1 AS `titulado`,
 1 AS `trabaja`,
 1 AS `fecha_egresado`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `sexo`,
 1 AS `fecha_nacimiento`,
 1 AS `nombre_carrera`,
 1 AS `telefono`,
 1 AS `celular`,
 1 AS `direccion`,
 1 AS `departamento`,
 1 AS `municipio`,
 1 AS `persona_id`,
 1 AS `contacto_id`,
 1 AS `usuario_id`,
 1 AS `egresado_id`,
 1 AS `municipio_id`,
 1 AS `carrera_id`,
 1 AS `carrera`,
 1 AS `departamento_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_empresas`
--

DROP TABLE IF EXISTS `listar_empresas`;
/*!50001 DROP VIEW IF EXISTS `listar_empresas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_empresas` AS SELECT 
 1 AS `nombre_empresa`,
 1 AS `ruc`,
 1 AS `sociedad`,
 1 AS `mision`,
 1 AS `ocupacion`,
 1 AS `vision`,
 1 AS `sitio_web`,
 1 AS `imagen`,
 1 AS `correo`,
 1 AS `clave`,
 1 AS `autenticada`,
 1 AS `telefono`,
 1 AS `celular`,
 1 AS `direccion`,
 1 AS `municipio`,
 1 AS `departamento`,
 1 AS `activo`,
 1 AS `ultima_sesion`,
 1 AS `empresa_id`,
 1 AS `contacto_id`,
 1 AS `usuario_id`,
 1 AS `sociedad_id`,
 1 AS `departamento_id`,
 1 AS `municipio_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_fichas`
--

DROP TABLE IF EXISTS `listar_fichas`;
/*!50001 DROP VIEW IF EXISTS `listar_fichas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_fichas` AS SELECT 
 1 AS `publicacion_id`,
 1 AS `descripcion`,
 1 AS `fecha_alta`,
 1 AS `fecha_publicacion`,
 1 AS `visible`,
 1 AS `imagen_publicacion_id`,
 1 AS `imagen`,
 1 AS `tipo`,
 1 AS `usuario_id`,
 1 AS `ficha_id`,
 1 AS `cargo`,
 1 AS `ubicacion`,
 1 AS `cantidad`,
 1 AS `jefe`,
 1 AS `a_cargo`,
 1 AS `finalidad`,
 1 AS `funciones`,
 1 AS `requisitos`,
 1 AS `experiencia`,
 1 AS `competencia`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_inbox`
--

DROP TABLE IF EXISTS `listar_inbox`;
/*!50001 DROP VIEW IF EXISTS `listar_inbox`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_inbox` AS SELECT 
 1 AS `usuario_id`,
 1 AS `mensaje_id`,
 1 AS `asunto`,
 1 AS `mensaje`,
 1 AS `fecha_envio`,
 1 AS `curr_adjuntado`,
 1 AS `remitente`,
 1 AS `remitente_id`,
 1 AS `visto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_publicadores`
--

DROP TABLE IF EXISTS `listar_publicadores`;
/*!50001 DROP VIEW IF EXISTS `listar_publicadores`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_publicadores` AS SELECT 
 1 AS `publicador_id`,
 1 AS `persona_id`,
 1 AS `usuario_id`,
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `sexo`,
 1 AS `fecha_nacimiento`,
 1 AS `correo`,
 1 AS `clave`,
 1 AS `imagen`,
 1 AS `ultima_sesion`,
 1 AS `activo`,
 1 AS `cargo_id`,
 1 AS `cargo`,
 1 AS `area`,
 1 AS `area_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `listar_sent`
--

DROP TABLE IF EXISTS `listar_sent`;
/*!50001 DROP VIEW IF EXISTS `listar_sent`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `listar_sent` AS SELECT 
 1 AS `usuario_id`,
 1 AS `mensaje_id`,
 1 AS `asunto`,
 1 AS `mensaje`,
 1 AS `fecha_envio`,
 1 AS `curr_adjuntado`,
 1 AS `destinatario`,
 1 AS `destinatario_id`,
 1 AS `visto`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mensaje`
--

DROP TABLE IF EXISTS `mensaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje` (
  `mensaje_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `asunto` tinytext NOT NULL,
  `mensaje` mediumtext NOT NULL,
  `fecha_envio` date DEFAULT NULL,
  `cadena` tinyint(1) NOT NULL DEFAULT '0',
  `curr_adjuntado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mensaje_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
INSERT INTO `mensaje` VALUES (1,33,'Un asunto','mensaje de<br />\nvarias <br />\nlineas','2016-01-13',0,0),(2,33,'Prueba de mensaje 123456','un mensjae 1235','2016-01-14',0,0),(3,33,'NUEVO CURSO PUBLICADO','La Universidad Nacional de IngenierÃ­a ha publicado un nuevo Curso, puedes obtener mas informaciÃ³n sobre el en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/publicaciones/Curso>Cursos</a>','2016-01-14',0,0),(4,34,'Alguien ha aplicado al puesto Ofertado','Miguel Angel Castillo Cornejo ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/curriculum/ver/34\'>Curriculo</a>','2016-01-18',0,0),(5,35,'NUEVA BECA PUBLICADA','La Universidad Nacional de IngenierÃ­a ha publicado una nueva Beca puedes obtener mas informaciÃ³n sobre ella en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/publicaciones/Becas\'>Becas</a>','2016-03-28',0,0),(6,42,'asdsadad','asdsadasds','2016-04-17',0,0),(7,33,'NUEVO FICHA OCUPACIONAL PUBLICADA','La Universidad Nacional de IngenierÃ­a ha publicado una nueva Ficha Ocupacional, puedes obtener mas informaciÃ³n sobre ella en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/publicaciones/BolsaDeTrabajo\'>Fichas Ocupacionales</a>','2016-04-17',0,0),(8,34,'Alguien ha aplicado al puesto Ofertado','Miguel Angel Castillo Cornejo ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/curriculum/ver/34\'>Curriculo</a>','2016-04-17',0,0),(9,44,'Alguien ha aplicado al puesto Ofertado','Miguel Angel Castillo Cornejo ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/curriculum/ver/44\'>Curriculo</a>','2016-04-17',0,0);
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_borrador`
--

DROP TABLE IF EXISTS `mensaje_borrador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje_borrador` (
  `mensaje_borrador_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `mensaje_id` int(11) NOT NULL,
  `fecha_creacion` date NOT NULL,
  PRIMARY KEY (`mensaje_borrador_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_borrador`
--

LOCK TABLES `mensaje_borrador` WRITE;
/*!40000 ALTER TABLE `mensaje_borrador` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje_borrador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mensaje_eliminado`
--

DROP TABLE IF EXISTS `mensaje_eliminado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mensaje_eliminado` (
  `mensaje_eliminado_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `mensaje_id` int(11) NOT NULL,
  `eliminado` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`mensaje_eliminado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mensaje_eliminado`
--

LOCK TABLES `mensaje_eliminado` WRITE;
/*!40000 ALTER TABLE `mensaje_eliminado` DISABLE KEYS */;
INSERT INTO `mensaje_eliminado` VALUES (1,33,1,0),(2,34,1,0),(3,33,2,0),(4,34,2,0),(5,34,3,0),(6,36,3,0),(7,32,4,0),(8,34,5,0),(9,36,5,0),(10,37,5,0),(11,42,6,0),(12,34,6,0),(13,34,7,0),(14,36,7,0),(15,33,8,0),(16,33,9,0);
/*!40000 ALTER TABLE `mensaje_eliminado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `municipio`
--

DROP TABLE IF EXISTS `municipio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `municipio` (
  `municipio_id` int(11) NOT NULL AUTO_INCREMENT,
  `municipio` varchar(60) NOT NULL,
  `departamento_id` int(11) NOT NULL,
  PRIMARY KEY (`municipio_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `municipio`
--

LOCK TABLES `municipio` WRITE;
/*!40000 ALTER TABLE `municipio` DISABLE KEYS */;
INSERT INTO `municipio` VALUES (1,'Ocotal',1),(2,'Mozonte',1),(3,'Dipilto',1),(4,'Jalapa',1),(5,'San Fernando',1),(6,'EstelÃ­',2),(7,'Condega',2),(8,'La Trinidad',2),(10,'Sebaco',3),(11,'Somoto',4),(12,'Santa MarÃ­a',1),(13,'Macuelizo',1),(14,'Murra',1),(15,'Wiwili',1),(16,'El JÃ­caro',1),(17,'Ciudad Antigua',1),(18,'Quilali',1),(19,'Tuestepe',6),(20,'San JosÃ© de los Remates',6),(21,'Santa LucÃ­a',6),(22,'Boaco',6),(23,'Camoapa',6),(24,'San Lorenzo',6),(25,'San Marcos',7),(26,'Diriamba',7),(27,'Dolores',7),(28,'Jinotepe',7),(29,'El Rosario',7),(30,'La Paz',7),(31,'Santa Teresa',7),(32,'La Conquista',7),(33,'El Viejo',8),(34,'Puerto MorazÃ¡n',8),(35,'Somotillo',8),(36,'Santo TomÃ¡s del Norte',8),(37,'Cinco Pinos',8),(38,'San Pedro del Norte',8),(39,'San Francisco del Norte',8),(40,'Corinto',8),(41,'Villanueva',8),(42,'Chinandega',8),(43,'Posoltega',8),(44,'Chichigalpa',8),(45,'El Realejo',8),(46,'Comalapa',9),(47,'Juigalpa',9),(48,'La Libertad',9),(49,'Santo Domingo',9),(50,'San Pedro de Lovago',9),(51,'Santo TomÃ¡s',9),(52,'El Rama',9),(53,'Villa Sandino',9),(54,'Acoyapa',9),(55,'Cuapa',9),(56,'El Coral',9),(57,'Mueye los Bueyes',9),(58,'Nueva Guinea',9),(59,'El Ayote',9),(60,'Pueblo Nuevo',2),(61,'San Juan de Limay',2),(62,'San NicolÃ¡s',2),(63,'Granada',10),(64,'Diriomo',10),(65,'DiriÃ¡',10),(66,'Nandaime',10),(67,'La Concordia',11),(68,'San SebastÃ­an de YalÃ­',11),(69,'San Rafael del Norte',11),(70,'Jinotega',11),(71,'Santa MarÃ­a de Pantasma',11),(72,'CuÃ¡ Bocay',11),(73,'WiwilÃ­',11),(74,'Achuapa',12),(75,'El Sauce',12),(76,'Santa Rosa del PeÃ±on',12),(77,'El Jicaral',12),(78,'Larreynaga-Malpaisillo',12),(79,'Telica',12),(80,'Quezalguaque',12),(81,'LeÃ³n',12),(82,'La Paz Centro',12),(83,'Nagarote',12),(84,'San JosÃ© de Cusmapa',4),(85,'Las Sabanas',4),(86,'San Lucas',4),(87,'San Juan del RÃ­o Coco',4),(88,'Totogalpa',4),(89,'Yalaguina',4),(90,'Palacaguina',4),(91,'Telpaneca',4),(92,'San Fransico Libre',13),(93,'Tipitapa',13),(94,'Managua',13),(95,'San Rafael del Sur',13),(96,'Villa Carlos Fonseca',13),(97,'El Crucero',13),(98,'Mateare',13),(99,'Ciudad Sandino',13),(100,'Ticuantepe',13),(101,'Tisma',14),(102,'Masaya',14),(103,'NindirÃ­',14),(104,'La ConcepciÃ³n',14),(105,'Masatepe',14),(106,'Nandasmo',14),(107,'Niquinohomo',14),(108,'Catarina',14),(109,'San Juan de Oriente',14),(110,'Matagalpa',3),(111,'San Isidro',3),(112,'Ciudad DarÃ­o',3),(113,'Terrabona',3),(114,'San Dionisio',3),(115,'Esquipulas',3),(116,'Muy-Muy',3),(117,'San RamÃ³n',3),(118,'MatiguÃ¡s',3),(119,'RÃ­o Blanco',3),(120,'Rancho Grande',3),(121,'Tuma la Dalia',3),(122,'Waslala',15),(123,'Waspan',15),(124,'Puerto Cabezas',15),(125,'Prinzapolka',15),(126,'Bonanza',15),(127,'Siuna',15),(128,'Rosita',15),(129,'Bocana de Paiwas',5),(130,'La Cruz de RÃ­o Grande',5),(131,'Kukra Hill',5),(132,'Laguna de Perlas',5),(133,'Bluefields',5),(134,'Corn Island',5),(135,'El Tortuguero',5),(136,'Desembocadura RÃ­o Grande',5),(137,'Morrito',16),(138,'El Almendro',16),(139,'San Miguelito',16),(140,'San Carlos',16),(141,'El Castillo',16),(142,'San Juan del Norte',16),(143,'Tola',17),(144,'BelÃ©n',17),(145,'PotosÃ­',17),(146,'Buenos Aires',17),(147,'San Jorge',17),(148,'Rivas',17),(149,'San Juan del Sur',17),(150,'Cardenas',17),(151,'Moyogalpa',17),(152,'Altagracia',17),(153,'Sin asignar',18);
/*!40000 ALTER TABLE `municipio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persona` (
  `persona_id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `sexo` char(1) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  PRIMARY KEY (`persona_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
INSERT INTO `persona` VALUES (28,'Administrador','Administrador','M','2016-04-17'),(29,'Miguel Angel','Castillo Cornejo','M','1992-02-18'),(30,'Jose Manuel','Poveda','M','1985-12-14'),(31,'Rene Mauricio','Cruz Hernandez','M','2016-01-13'),(32,'Alfredo Heberto','Martinez AcuÃ±a','M','2016-01-13'),(33,'Sergio','Diaz','M','1985-01-13'),(34,'Leonel','Martinez','M','2016-01-14'),(35,'Jorshua Alberto','Arauz Cantarero','M','1993-03-02'),(36,'Eynar Josue','Lanuza','M','1994-12-09'),(37,'Miguel Angel','Castillo Cornejo','M','1992-03-09'),(38,'Eynar Josue','Lanuza','M','1994-12-09');
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pregunta` (
  `pregunta_id` int(11) NOT NULL AUTO_INCREMENT,
  `encuesta_id` int(11) NOT NULL,
  `pregunta` varchar(300) NOT NULL,
  `texto_ayuda` varchar(100) DEFAULT NULL,
  `categoria_id` int(11) NOT NULL,
  PRIMARY KEY (`pregunta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacidad`
--

DROP TABLE IF EXISTS `privacidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privacidad` (
  `privacidad_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) DEFAULT NULL,
  `foto_perfil` enum('publica','empresas','privada') NOT NULL DEFAULT 'empresas',
  `info_contacto` enum('publica','empresas','privada') NOT NULL DEFAULT 'empresas',
  `info_ubicacion` enum('publica','empresas','privada') NOT NULL DEFAULT 'empresas',
  `info_curriculum` enum('publica','empresas','privada') NOT NULL DEFAULT 'empresas',
  `info_adicional` enum('publica','empresas','privada') NOT NULL DEFAULT 'empresas',
  PRIMARY KEY (`privacidad_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privacidad`
--

LOCK TABLES `privacidad` WRITE;
/*!40000 ALTER TABLE `privacidad` DISABLE KEYS */;
INSERT INTO `privacidad` VALUES (11,34,'publica','publica','empresas','publica','empresas'),(12,36,'empresas','empresas','empresas','empresas','empresas'),(13,37,'empresas','empresas','empresas','empresas','empresas'),(14,41,'empresas','empresas','empresas','empresas','empresas'),(15,43,'empresas','empresas','empresas','empresas','empresas'),(16,44,'empresas','publica','publica','publica','empresas'),(17,45,'empresas','empresas','empresas','empresas','empresas');
/*!40000 ALTER TABLE `privacidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion`
--

DROP TABLE IF EXISTS `publicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacion` (
  `publicacion_id` int(11) NOT NULL AUTO_INCREMENT,
  `usuario_id` int(11) NOT NULL,
  `imagen_publicacion_id` int(11) NOT NULL,
  `descripcion` mediumtext NOT NULL,
  `fecha_publicacion` date NOT NULL,
  `fecha_alta` date NOT NULL,
  `visible` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`publicacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` VALUES (75,32,82,'La empresa Empresa SA esta solicitando urgentemente un jefe de proyecto graduado de la universidad nacional de ingeniera con experiencia de 2 aÃ±os mÃ­nimo o cargos, mandar curriculum vitae a la siguiente direcciÃ³n de correo electrÃ³nico: correo@dominio.com.','2016-01-12','2016-01-30',1),(76,32,83,'La empresa Drew State SA esta solicitando un tÃ©cnico en redes o estudios similares para cargo fijo interesados mandar el curriculum a la direccion: administracion@embaconel.com.','2016-01-12','2016-01-30',1),(77,32,84,'La alcaldÃ­a municipal de EstelÃ­ solicita a ingeniero civil o estudios similares para la administraciÃ³n de obras municipales. Se solicita inmediatamente, interesados mandar cv a la siguiente direcciÃ³n de correo electrÃ³nico se pondrÃ¡ en contacto con la persona seleccionada.','2016-01-12','2016-01-22',1),(78,33,85,'descripcion de la publicacion','2016-01-14','2016-01-31',1),(79,35,86,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','2016-03-28','2016-03-30',1),(80,33,87,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','2016-04-17','2016-04-27',1);
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicacion_carrera`
--

DROP TABLE IF EXISTS `publicacion_carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicacion_carrera` (
  `publicacion_carrera_id` int(11) NOT NULL AUTO_INCREMENT,
  `publicacion_id` int(11) NOT NULL,
  `carrera_id` int(11) NOT NULL,
  `filtro` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`publicacion_carrera_id`)
) ENGINE=InnoDB AUTO_INCREMENT=358 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicacion_carrera`
--

LOCK TABLES `publicacion_carrera` WRITE;
/*!40000 ALTER TABLE `publicacion_carrera` DISABLE KEYS */;
INSERT INTO `publicacion_carrera` VALUES (4,16,1,1),(5,16,2,1),(6,16,3,1),(7,16,4,1),(8,17,1,0),(9,17,2,1),(10,17,3,0),(11,17,4,1),(12,18,1,0),(13,18,2,1),(14,18,3,0),(15,18,4,1),(16,2,1,1),(17,2,2,0),(18,2,3,1),(19,2,4,0),(20,6,1,0),(21,6,2,1),(22,6,3,0),(23,6,4,1),(24,8,1,1),(25,8,2,0),(26,8,3,1),(27,8,4,0),(28,9,1,0),(29,9,2,1),(30,9,3,0),(31,9,4,1),(32,10,1,1),(33,10,2,0),(34,10,3,1),(35,10,4,0),(36,11,1,1),(37,11,2,0),(38,11,3,1),(39,11,4,0),(40,12,1,1),(41,12,2,0),(42,12,3,1),(43,12,4,0),(44,16,1,0),(45,16,2,0),(46,16,3,0),(47,16,4,0),(48,17,1,0),(49,17,2,1),(50,17,3,0),(51,17,4,1),(52,18,1,0),(53,18,2,1),(54,18,3,0),(55,18,4,1),(56,19,1,1),(57,19,2,0),(58,19,3,1),(59,19,4,0),(60,20,1,1),(61,20,2,0),(62,20,3,1),(63,20,4,0),(64,21,1,0),(65,21,2,1),(66,21,3,0),(67,21,4,0),(68,22,1,0),(69,22,2,1),(70,22,3,1),(71,22,4,0),(72,23,1,1),(73,23,2,0),(74,23,3,1),(75,23,4,0),(76,24,1,1),(77,24,2,0),(78,24,3,1),(79,24,4,0),(80,25,1,0),(81,25,2,1),(82,25,3,1),(83,25,4,0),(84,26,1,0),(85,26,2,1),(86,26,3,1),(87,26,4,0),(88,27,1,1),(89,27,2,0),(90,27,3,1),(91,27,4,1),(92,28,1,0),(93,28,2,1),(94,28,3,1),(95,28,4,0),(96,29,1,1),(97,29,2,0),(98,29,3,0),(99,29,4,0),(100,30,1,1),(101,30,2,0),(102,30,3,1),(103,30,4,0),(104,31,1,0),(105,31,2,1),(106,31,3,0),(107,31,4,1),(108,32,1,0),(109,32,2,1),(110,32,3,1),(111,32,4,0),(112,33,1,1),(113,33,2,1),(114,33,3,0),(115,33,4,0),(116,34,1,0),(117,34,2,0),(118,34,3,1),(119,34,4,1),(120,35,1,1),(121,35,2,1),(122,35,3,1),(123,35,4,1),(124,35,1,1),(125,35,2,1),(126,35,3,1),(127,35,4,1),(128,36,1,1),(129,36,2,0),(130,36,3,1),(131,36,4,0),(132,37,1,0),(133,37,2,1),(134,37,3,1),(135,37,4,0),(136,38,1,1),(137,38,2,1),(138,38,3,0),(139,38,4,0),(140,39,1,0),(141,39,2,1),(142,39,3,1),(143,39,4,0),(144,40,1,1),(145,40,2,0),(146,40,3,1),(147,40,4,0),(148,41,1,1),(149,41,2,0),(150,41,3,0),(151,41,4,0),(152,42,1,0),(153,42,2,1),(154,42,3,0),(155,42,4,0),(156,43,1,1),(157,43,2,0),(158,43,3,0),(159,43,4,1),(160,44,1,0),(161,44,2,1),(162,44,3,0),(163,44,4,0),(164,45,1,1),(165,45,2,1),(166,45,3,0),(167,45,4,0),(168,46,1,0),(169,46,2,1),(170,46,3,1),(171,46,4,0),(172,48,1,1),(173,48,2,1),(174,48,3,1),(175,48,4,0),(176,49,1,1),(177,49,2,1),(178,49,3,0),(179,49,4,0),(180,50,1,0),(181,50,2,1),(182,50,3,0),(183,50,4,0),(184,51,1,0),(185,51,2,1),(186,51,3,1),(187,51,4,0),(188,52,1,0),(189,52,2,1),(190,52,3,0),(191,52,4,0),(192,52,5,0),(193,53,1,1),(194,53,2,1),(195,53,3,0),(196,53,4,0),(197,53,5,1),(198,48,5,0),(199,54,1,0),(200,54,2,0),(201,54,3,1),(202,54,4,1),(203,54,5,0),(204,55,1,0),(205,55,2,0),(206,55,3,1),(207,55,4,1),(208,55,5,0),(209,56,1,0),(210,56,2,0),(211,56,3,1),(212,56,4,1),(213,56,5,0),(214,57,1,0),(215,57,2,0),(216,57,3,1),(217,57,4,1),(218,57,5,0),(219,58,1,0),(220,58,2,0),(221,58,3,1),(222,58,4,1),(223,58,5,0),(224,59,1,0),(225,59,2,0),(226,59,3,1),(227,59,4,1),(228,59,5,0),(229,60,1,0),(230,60,2,0),(231,60,3,1),(232,60,4,1),(233,60,5,0),(234,61,1,0),(235,61,2,0),(236,61,3,1),(237,61,4,1),(238,61,5,0),(239,62,1,0),(240,62,2,0),(241,62,3,1),(242,62,4,1),(243,62,5,0),(244,63,1,1),(245,63,2,1),(246,63,3,0),(247,63,4,0),(248,63,5,0),(249,64,1,0),(250,64,2,0),(251,64,3,0),(252,64,4,0),(253,64,5,0),(254,66,1,0),(255,66,2,0),(256,66,3,0),(257,66,4,0),(258,66,5,0),(259,67,1,0),(260,67,2,0),(261,67,3,0),(262,67,4,0),(263,67,5,0),(264,68,1,0),(265,68,2,0),(266,68,3,0),(267,68,4,0),(268,68,5,0),(269,69,1,0),(270,69,2,0),(271,69,3,0),(272,69,4,0),(273,69,5,0),(274,70,1,0),(275,70,2,1),(276,70,3,1),(277,70,4,0),(278,70,5,0),(279,71,1,0),(280,71,2,1),(281,71,3,0),(282,71,4,0),(283,71,5,0),(284,51,5,1),(285,72,1,0),(286,72,2,1),(287,72,3,0),(288,72,4,0),(289,72,5,0),(290,73,1,0),(291,73,2,1),(292,73,3,0),(293,73,4,0),(294,73,5,0),(295,71,1,0),(296,71,2,1),(297,71,3,0),(298,71,4,0),(299,71,5,0),(300,71,1,0),(301,71,2,1),(302,71,3,0),(303,71,4,0),(304,71,5,0),(305,71,13,0),(306,71,14,0),(307,72,1,0),(308,72,2,1),(309,72,3,0),(310,72,4,0),(311,72,5,0),(312,72,13,0),(313,72,14,0),(314,73,1,0),(315,73,2,1),(316,73,3,0),(317,73,4,0),(318,73,5,0),(319,73,13,0),(320,73,14,0),(321,74,1,1),(322,74,2,0),(323,74,3,0),(324,74,4,0),(325,74,5,0),(326,74,13,0),(327,74,14,0),(328,75,1,0),(329,75,2,1),(330,75,3,1),(331,75,4,0),(332,75,5,0),(333,76,1,0),(334,76,2,1),(335,76,3,0),(336,76,4,0),(337,76,5,0),(338,77,1,1),(339,77,2,0),(340,77,3,0),(341,77,4,0),(342,77,5,0),(343,78,1,0),(344,78,2,1),(345,78,3,0),(346,78,4,0),(347,78,5,0),(348,79,1,1),(349,79,2,1),(350,79,3,0),(351,79,4,0),(352,79,5,0),(353,80,1,0),(354,80,2,1),(355,80,3,0),(356,80,4,0),(357,80,5,0);
/*!40000 ALTER TABLE `publicacion_carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publicador`
--

DROP TABLE IF EXISTS `publicador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `publicador` (
  `publicador_id` int(11) NOT NULL AUTO_INCREMENT,
  `persona_id` int(11) NOT NULL,
  `cargo_id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`publicador_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publicador`
--

LOCK TABLES `publicador` WRITE;
/*!40000 ALTER TABLE `publicador` DISABLE KEYS */;
INSERT INTO `publicador` VALUES (3,4,1,4),(4,16,1,19),(5,30,26,35),(6,33,26,38),(7,34,26,39);
/*!40000 ALTER TABLE `publicador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta`
--

DROP TABLE IF EXISTS `respuesta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta` (
  `respuesta_id` int(11) NOT NULL AUTO_INCREMENT,
  `resultado_id` int(11) NOT NULL,
  `pregunta_id` int(11) NOT NULL,
  PRIMARY KEY (`respuesta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta`
--

LOCK TABLES `respuesta` WRITE;
/*!40000 ALTER TABLE `respuesta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_abierta`
--

DROP TABLE IF EXISTS `respuesta_abierta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_abierta` (
  `respuesta_abierta_id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta_id` int(11) NOT NULL,
  `respuesta` tinytext NOT NULL,
  PRIMARY KEY (`respuesta_abierta_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_abierta`
--

LOCK TABLES `respuesta_abierta` WRITE;
/*!40000 ALTER TABLE `respuesta_abierta` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_abierta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_cerrada`
--

DROP TABLE IF EXISTS `respuesta_cerrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_cerrada` (
  `respuesta_cerrada_id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta_id` int(11) NOT NULL,
  `valor` tinyint(1) NOT NULL,
  PRIMARY KEY (`respuesta_cerrada_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_cerrada`
--

LOCK TABLES `respuesta_cerrada` WRITE;
/*!40000 ALTER TABLE `respuesta_cerrada` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_cerrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_seleccionada`
--

DROP TABLE IF EXISTS `respuesta_seleccionada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_seleccionada` (
  `respuesta_seleccionada_id` int(11) NOT NULL AUTO_INCREMENT,
  `respuesta_id` int(11) NOT NULL,
  `respuesta_sugerida_id` int(11) NOT NULL,
  PRIMARY KEY (`respuesta_seleccionada_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_seleccionada`
--

LOCK TABLES `respuesta_seleccionada` WRITE;
/*!40000 ALTER TABLE `respuesta_seleccionada` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_seleccionada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respuesta_sugerida`
--

DROP TABLE IF EXISTS `respuesta_sugerida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `respuesta_sugerida` (
  `respuesta_sugerida_id` int(11) NOT NULL AUTO_INCREMENT,
  `pregunta_id` int(11) NOT NULL,
  `opcion` varchar(100) NOT NULL,
  PRIMARY KEY (`respuesta_sugerida_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respuesta_sugerida`
--

LOCK TABLES `respuesta_sugerida` WRITE;
/*!40000 ALTER TABLE `respuesta_sugerida` DISABLE KEYS */;
/*!40000 ALTER TABLE `respuesta_sugerida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resultado`
--

DROP TABLE IF EXISTS `resultado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resultado` (
  `resultado_id` int(11) NOT NULL AUTO_INCREMENT,
  `encuesta_id` int(11) NOT NULL,
  `egresado_id` int(11) NOT NULL,
  PRIMARY KEY (`resultado_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resultado`
--

LOCK TABLES `resultado` WRITE;
/*!40000 ALTER TABLE `resultado` DISABLE KEYS */;
/*!40000 ALTER TABLE `resultado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sociedad`
--

DROP TABLE IF EXISTS `sociedad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sociedad` (
  `sociedad_id` int(11) NOT NULL AUTO_INCREMENT,
  `sociedad` varchar(40) NOT NULL,
  PRIMARY KEY (`sociedad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sociedad`
--

LOCK TABLES `sociedad` WRITE;
/*!40000 ALTER TABLE `sociedad` DISABLE KEYS */;
/*!40000 ALTER TABLE `sociedad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `titulo`
--

DROP TABLE IF EXISTS `titulo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `titulo` (
  `titulo_id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`titulo_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `titulo`
--

LOCK TABLES `titulo` WRITE;
/*!40000 ALTER TABLE `titulo` DISABLE KEYS */;
INSERT INTO `titulo` VALUES (1,'Titulo de ingeniero de sistemas'),(2,'Titulo de ingeniero civil');
/*!40000 ALTER TABLE `titulo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `usuario_id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(45) DEFAULT NULL,
  `clave` varchar(100) DEFAULT NULL,
  `ultima_sesion` datetime DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '0',
  `imagen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`usuario_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (32,'mikedosce1992@yahoo.es','QXJkuRPSBACf+txAHcpbKLDhYA+nYYg8s6Wj22U6DpE=','2016-04-17 00:00:00',1,'profile_image_32.png'),(33,'scseuninorte@gmail.com','QXJkuRPSBACf+txAHcpbKLDhYA+nYYg8s6Wj22U6DpE=','2016-04-17 00:00:00',1,'default/male.jpg'),(35,'jm_poveda@gmail.com','QXJkuRPSBACf+txAHcpbKLDhYA+nYYg8s6Wj22U6DpE=','2016-04-17 00:00:00',1,'default/male.jpg'),(36,'reneblackr@gmail.com','QXJkuRPSBACf+txAHcpbKLDhYA+nYYg8s6Wj22U6DpE=','2016-03-19 00:00:00',1,'default/male.jpg'),(38,'sergiod@gmail.com','J6n6AkTgp4m7Ijoq7cTUFGQtYZ8C2YNi++KN/8QWHtk=','2016-01-13 00:00:00',1,'default/male.jpg'),(39,'leonel_martinez@gmail.com','QXJkuRPSBACf+txAHcpbKLDhYA+nYYg8s6Wj22U6DpE=',NULL,1,'default/male.jpg');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'scse'
--

--
-- Dumping routines for database 'scse'
--
/*!50003 DROP FUNCTION IF EXISTS `detectar_usuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `detectar_usuario`(idusuario int) RETURNS double
BEGIN
	
    if(exists(select * from egresado where egresado.usuario_id = idusuario)) then
		
        #REGRESA EL NOMBRE DE EL EGRESADO
        return (select (nombre, " ", apellido),imagen as nombre from registro_egresados where usuario_id = idusuario);
        
	elseif(exists(select * from empresa where empresa.usuario_ud = usuario_id)) then
		
        #REGRESA EL NOMBRE DE LA EMPRESA
		return (select nombre_empresa as nombre,imagen from registro_empresas where usuario_id = idusuario);
	
    elseif(exists(select * from registro_publicadores where publicador.usuario_ud = usuario_id)) then
		
         #REGRESA EL NOMBRE DE EL PUBLICADOR
		return  (select (nombre, " ", apellido) as nombre,imagen from registro_publicadores where usuario_id = idusuario);
	
    elseif(exists(select * from admin where admin.usuario_ud = usuario_id)) then
		
         #REGRESA EL NOMBRE DE EL ADMINISTRADOR
        return "";
    else
		return null;
    end if;
    
RETURN 1;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `actualizar_sesion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `actualizar_sesion`(pusuario_id int)
BEGIN
	update usuario set ultima_sesion = now() where usuario.usuario_id=pusuario_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `eliminar_ficha` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `eliminar_ficha`(p_ficha_id int)
BEGIN
DECLARE id int;

	set id = (select publicacion_id from publicacion,ficha where ficha.publicacion_id=publicacion.publiacion_id);
	
    delete from ficha where ficha_id = p_ficha_id;
    delete from publicacion where publicacion_id = id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insertar_mensaje` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insertar_mensaje`(p_remitente int,p_destinatario int,p_asunto varchar(60),p_mensaje tinytext,p_borrador bit)
BEGIN
	insert into mensaje(remitente,destinatario,asunto,mensaje,borrador,visto,fecha_envio)
    values
    (p_remitente,p_destinatario,p_asunto,p_mensaje,p_borrador,FALSE,curdate());
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `listar_admins`
--

/*!50001 DROP VIEW IF EXISTS `listar_admins`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_admins` AS select `persona`.`nombre` AS `nombre`,`persona`.`apellido` AS `apellido`,`persona`.`sexo` AS `sexo`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`usuario`.`correo` AS `correo`,`usuario`.`ultima_sesion` AS `ultima_sesion`,`usuario`.`activo` AS `activo`,`usuario`.`clave` AS `clave`,`usuario`.`imagen` AS `imagen`,`usuario`.`usuario_id` AS `usuario_id`,`persona`.`persona_id` AS `persona_id`,`admin`.`admin_id` AS `admin_id` from ((`usuario` join `persona`) join `admin`) where ((`usuario`.`usuario_id` = `admin`.`usuario_id`) and (`persona`.`persona_id` = `admin`.`persona_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_becas`
--

/*!50001 DROP VIEW IF EXISTS `listar_becas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_becas` AS select `publicacion`.`usuario_id` AS `usuario_id`,`publicacion`.`publicacion_id` AS `publicacion_id`,`publicacion`.`descripcion` AS `descripcion`,`publicacion`.`fecha_alta` AS `fecha_alta`,`publicacion`.`fecha_publicacion` AS `fecha_publicacion`,`publicacion`.`visible` AS `visible`,`beca`.`beca_id` AS `beca_id`,`beca`.`programa_academico` AS `programa_academico`,`beca`.`url` AS `url`,`imagen_publicacion`.`imagen_publicacion_id` AS `imagen_publicacion_id`,`imagen_publicacion`.`imagen` AS `imagen`,`imagen_publicacion`.`tipo` AS `tipo` from ((`publicacion` join `imagen_publicacion`) join `beca`) where ((`publicacion`.`publicacion_id` = `beca`.`publicacion_id`) and (`imagen_publicacion`.`imagen_publicacion_id` = `publicacion`.`imagen_publicacion_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_cursos`
--

/*!50001 DROP VIEW IF EXISTS `listar_cursos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_cursos` AS select distinct `publicacion`.`publicacion_id` AS `publicacion_id`,`publicacion`.`usuario_id` AS `usuario_id`,`publicacion`.`descripcion` AS `descripcion`,`publicacion`.`fecha_alta` AS `fecha_alta`,`publicacion`.`fecha_publicacion` AS `fecha_publicacion`,`publicacion`.`visible` AS `visible`,`curso`.`curso_id` AS `curso_id`,`curso`.`nombre_curso` AS `nombre_curso`,`curso`.`costo` AS `costo`,`curso`.`duracion` AS `duracion`,`curso`.`libre` AS `libre`,`curso`.`inicio` AS `inicio`,`publicacion`.`imagen_publicacion_id` AS `imagen_publicacion_id`,`imagen_publicacion`.`imagen` AS `imagen`,`imagen_publicacion`.`tipo` AS `tipo` from ((`publicacion` join `curso`) join `imagen_publicacion`) where ((`publicacion`.`publicacion_id` = `curso`.`publicacion_id`) and (`imagen_publicacion`.`imagen_publicacion_id` = `publicacion`.`imagen_publicacion_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_drafts`
--

/*!50001 DROP VIEW IF EXISTS `listar_drafts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_drafts` AS select `mensaje`.`mensaje_id` AS `mensaje_id`,`mensaje`.`usuario_id` AS `usuario_id`,`mensaje`.`asunto` AS `asunto`,`mensaje`.`mensaje` AS `mensaje`,`mensaje`.`curr_adjuntado` AS `curr_adjuntado`,date_format(`mensaje_borrador`.`fecha_creacion`,'%d/%m/%Y') AS `fecha_creacion` from (`mensaje` join `mensaje_borrador`) where (`mensaje`.`mensaje_id` = `mensaje_borrador`.`mensaje_id`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_egresados`
--

/*!50001 DROP VIEW IF EXISTS `listar_egresados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_egresados` AS select `usuario`.`imagen` AS `imagen`,`usuario`.`correo` AS `correo`,`usuario`.`clave` AS `clave`,`usuario`.`ultima_sesion` AS `ultima_sesion`,`usuario`.`activo` AS `activo`,`egresado`.`carnet` AS `carnet`,`egresado`.`cedula` AS `cedula`,`egresado`.`titulado` AS `titulado`,`egresado`.`trabaja` AS `trabaja`,`egresado`.`fecha_egresado` AS `fecha_egresado`,`persona`.`nombre` AS `nombre`,`persona`.`apellido` AS `apellido`,`persona`.`sexo` AS `sexo`,`persona`.`fecha_nacimiento` AS `fecha_nacimiento`,`carrera`.`nombre_carrera` AS `nombre_carrera`,`contacto`.`telefono` AS `telefono`,`contacto`.`celular` AS `celular`,`contacto`.`direccion` AS `direccion`,`departamento`.`departamento` AS `departamento`,`municipio`.`municipio` AS `municipio`,`persona`.`persona_id` AS `persona_id`,`contacto`.`contacto_id` AS `contacto_id`,`usuario`.`usuario_id` AS `usuario_id`,`egresado`.`egresado_id` AS `egresado_id`,`municipio`.`municipio_id` AS `municipio_id`,`carrera`.`carrera_id` AS `carrera_id`,`carrera`.`nombre_carrera` AS `carrera`,`departamento`.`departamento_id` AS `departamento_id` from ((((((`egresado` join `usuario`) join `persona`) join `contacto`) join `municipio`) join `departamento`) join `carrera`) where ((`egresado`.`usuario_id` = `usuario`.`usuario_id`) and (`egresado`.`persona_id` = `persona`.`persona_id`) and (`egresado`.`contacto_id` = `contacto`.`contacto_id`) and (`departamento`.`departamento_id` = `municipio`.`departamento_id`) and (`municipio`.`municipio_id` = `contacto`.`municipio_id`) and (`carrera`.`carrera_id` = `egresado`.`carrera_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_empresas`
--

/*!50001 DROP VIEW IF EXISTS `listar_empresas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_empresas` AS select `empresa`.`nombre_empresa` AS `nombre_empresa`,`empresa`.`ruc` AS `ruc`,`sociedad`.`sociedad` AS `sociedad`,`empresa`.`mision` AS `mision`,`empresa`.`ocupacion` AS `ocupacion`,`empresa`.`vision` AS `vision`,`empresa`.`sitio_web` AS `sitio_web`,`usuario`.`imagen` AS `imagen`,`usuario`.`correo` AS `correo`,`usuario`.`clave` AS `clave`,`empresa`.`autenticada` AS `autenticada`,`contacto`.`telefono` AS `telefono`,`contacto`.`celular` AS `celular`,`contacto`.`direccion` AS `direccion`,`municipio`.`municipio` AS `municipio`,`departamento`.`departamento` AS `departamento`,`usuario`.`activo` AS `activo`,`usuario`.`ultima_sesion` AS `ultima_sesion`,`empresa`.`empresa_id` AS `empresa_id`,`contacto`.`contacto_id` AS `contacto_id`,`usuario`.`usuario_id` AS `usuario_id`,`sociedad`.`sociedad_id` AS `sociedad_id`,`departamento`.`departamento_id` AS `departamento_id`,`municipio`.`municipio_id` AS `municipio_id` from ((((`departamento` join `municipio`) join `contacto`) join `usuario`) join (`empresa` left join `sociedad` on((`sociedad`.`sociedad_id` = `empresa`.`sociedad_id`)))) where ((`empresa`.`contacto_id` = `contacto`.`contacto_id`) and (`contacto`.`municipio_id` = `municipio`.`municipio_id`) and (`departamento`.`departamento_id` = `municipio`.`departamento_id`) and (`usuario`.`usuario_id` = `empresa`.`usuario_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_fichas`
--

/*!50001 DROP VIEW IF EXISTS `listar_fichas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_fichas` AS select `publicacion`.`publicacion_id` AS `publicacion_id`,`publicacion`.`descripcion` AS `descripcion`,`publicacion`.`fecha_alta` AS `fecha_alta`,`publicacion`.`fecha_publicacion` AS `fecha_publicacion`,`publicacion`.`visible` AS `visible`,`imagen_publicacion`.`imagen_publicacion_id` AS `imagen_publicacion_id`,`imagen_publicacion`.`imagen` AS `imagen`,`imagen_publicacion`.`tipo` AS `tipo`,`usuario`.`usuario_id` AS `usuario_id`,`ficha`.`ficha_id` AS `ficha_id`,`ficha`.`cargo` AS `cargo`,`ficha`.`ubicacion` AS `ubicacion`,`ficha`.`cantidad` AS `cantidad`,`ficha`.`jefe` AS `jefe`,`ficha`.`a_cargo` AS `a_cargo`,`ficha`.`finalidad` AS `finalidad`,`ficha`.`funciones` AS `funciones`,`ficha`.`requisitos` AS `requisitos`,`ficha`.`experiencia` AS `experiencia`,`ficha`.`competencia` AS `competencia` from (((`usuario` join `publicacion`) join `ficha`) join `imagen_publicacion`) where ((`usuario`.`usuario_id` = `publicacion`.`usuario_id`) and (`ficha`.`publicacion_id` = `publicacion`.`publicacion_id`) and (`publicacion`.`imagen_publicacion_id` = `imagen_publicacion`.`imagen_publicacion_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_inbox`
--

/*!50001 DROP VIEW IF EXISTS `listar_inbox`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_inbox` AS select `destino_mensaje`.`usuario_id` AS `usuario_id`,`mensaje`.`mensaje_id` AS `mensaje_id`,`mensaje`.`asunto` AS `asunto`,`mensaje`.`mensaje` AS `mensaje`,date_format(`mensaje`.`fecha_envio`,'%d/%m/%Y') AS `fecha_envio`,`mensaje`.`curr_adjuntado` AS `curr_adjuntado`,`rem`.`correo` AS `remitente`,`rem`.`usuario_id` AS `remitente_id`,`destino_mensaje`.`visto` AS `visto` from (((`mensaje` join `usuario` `rem` on((`rem`.`usuario_id` = `mensaje`.`usuario_id`))) join `destino_mensaje`) join `mensaje_eliminado`) where ((`mensaje`.`cadena` = 0) and (`mensaje`.`mensaje_id` = `destino_mensaje`.`mensaje_id`) and (`mensaje_eliminado`.`mensaje_id` = `mensaje`.`mensaje_id`) and (`mensaje_eliminado`.`usuario_id` = `destino_mensaje`.`usuario_id`) and (`mensaje_eliminado`.`eliminado` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_publicadores`
--

/*!50001 DROP VIEW IF EXISTS `listar_publicadores`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_publicadores` AS select `publicador`.`publicador_id` AS `publicador_id`,`persona`.`persona_id` AS `persona_id`,`usuario`.`usuario_id` AS `usuario_id`,`persona`.`nombre` AS `nombre`,`persona`.`apellido` AS `apellido`,`persona`.`sexo` AS `sexo`,date_format(`persona`.`fecha_nacimiento`,'%d/%m/%Y') AS `fecha_nacimiento`,`usuario`.`correo` AS `correo`,`usuario`.`clave` AS `clave`,`usuario`.`imagen` AS `imagen`,`usuario`.`ultima_sesion` AS `ultima_sesion`,`usuario`.`activo` AS `activo`,`cargo`.`cargo_id` AS `cargo_id`,`cargo`.`cargo` AS `cargo`,`area`.`area` AS `area`,`area`.`area_id` AS `area_id` from ((((`publicador` join `persona`) join `area`) join `cargo`) join `usuario`) where ((`publicador`.`persona_id` = `persona`.`persona_id`) and (`publicador`.`usuario_id` = `usuario`.`usuario_id`) and (`cargo`.`area_id` = `area`.`area_id`) and (`publicador`.`cargo_id` = `cargo`.`cargo_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listar_sent`
--

/*!50001 DROP VIEW IF EXISTS `listar_sent`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listar_sent` AS select `mensaje`.`usuario_id` AS `usuario_id`,`mensaje`.`mensaje_id` AS `mensaje_id`,`mensaje`.`asunto` AS `asunto`,`mensaje`.`mensaje` AS `mensaje`,date_format(`mensaje`.`fecha_envio`,'%d/%m/%Y') AS `fecha_envio`,`mensaje`.`curr_adjuntado` AS `curr_adjuntado`,`dest`.`correo` AS `destinatario`,`dest`.`usuario_id` AS `destinatario_id`,`destino_mensaje`.`visto` AS `visto` from ((`mensaje` join (`destino_mensaje` join `usuario` `dest` on((`dest`.`usuario_id` = `destino_mensaje`.`usuario_id`)))) join `mensaje_eliminado`) where ((`mensaje`.`mensaje_id` = `destino_mensaje`.`mensaje_id`) and (`mensaje`.`cadena` = 0) and (`mensaje`.`mensaje_id` = `mensaje_eliminado`.`mensaje_id`) and (`mensaje_eliminado`.`usuario_id` = `mensaje`.`usuario_id`) and (`mensaje_eliminado`.`eliminado` = 0)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-04-17 23:41:00
