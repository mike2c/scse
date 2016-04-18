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
INSERT INTO `carrera` VALUES (1,'Ingeniería civil'),(2,'Ingeniería de sistemas'),(3,'Ingenieria industrial'),(4,'Ingeniería agroindustrial'),(5,'Ingeniería mecánica');
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
INSERT INTO `categoria` VALUES (1,'abierta'),(2,'cerrada'),(3,'selección única'),(4,'selección múltiple');
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
INSERT INTO `departamento` VALUES (1,'Nueva Segovia'),(2,'Estelí'),(3,'Matagalpa'),(4,'Madriz'),(5,'Región autónoma del Atlántico Sur'),(6,'Boaco'),(7,'Carazo'),(8,'Chinandega'),(9,'Chontales'),(10,'Granada'),(11,'Jinotega'),(12,'León'),(13,'Managua'),(14,'Masaya'),(15,'Región Autónoma del Atlántico Norte'),(16,'Río San Juan'),(17,'Rivas'),(18,'Sin asignar');
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
INSERT INTO `ficha` VALUES (1,48,'Programador web','Produccion','3','3','Jorge Andres','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.\r\nLorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.\r\n','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.<br />\r\n','1. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi,<br />\r\n2. vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti.<br />\r\n3.  accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.<br />\r\n','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi, vel! Nesciunt voluptates autem quam ipsa alias, fugiat eaque! Aut corrupti accusamus iste ratione laboriosam dolorum porro, nam cumque ea molestiae.<br />\r\n'),(2,53,'Ingeniero de Software','Informatica','2','2','Jefe de proyectos','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?\r\n','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?','Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?Lorem ipsum dolor sit amet, consectetur adipisicing elit. Enim veniam ipsam aspernatur nostrum et deserunt quos, id quae quam voluptates cupiditate ducimus fuga, alias similique dolorum eaque ex corrupti minima?'),(3,54,'Prueba de ficha ocupacional','informatica','1','1','Ingeniero de software','Programadores\r\nTesters\r\nDiseñadores\r\nAnalistas','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','1234567890123'),(4,55,'Prueba de ficha ocupacional','informatica','1','2','Ingeniero de software','Programadores\r\nTesters\r\nDiseñadores','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','responsable'),(5,56,'Prueba de ficha ocupacional','informatica','1','2','Ingeniero de software','Programadores\r\nTesters\r\nDiseñadores','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','responsable'),(7,58,'Prueba de ficha ocupacional','informatica','1','2','Ingeniero de software','Programadores\r\nTesters\r\nDiseñadores','Administrar los proyectos de software','asdadsadsas','Uso de herramientas case','responsable'),(12,63,'Contador','Contabilidad','1','1','Administracion','Caja','','Recibe y clasifica todos los documentos, debidamente enumerados que le sean asignados (comprobante de ingreso, cheques nulos, cheques pagados, cuentas por cobrar y otros).<br />\r\nExamina y analiza la información que contienen los documentos que le sean asignados.<br />\r\nCodifica las cuentas de acuerdo a la información y a los lineamientos establecidos.<br />\r\nPrepara los estados financieros y balances de ganancias y pérdidas.<br />\r\nContabiliza las nóminas de pagos del personal de la Institución.<br />\r\nRevisa y conforma cheques, órdenes de compra, solicitudes de pago, entre otros.<br />\r\nPrepara proyecciones, cuadros y análisis sobre los aspectos contables.<br />\r\nDesarrolla sistemas contables necesarios para la Institución.<br />\r\nElabora comprobantes de los movimientos contables.<br />\r\nAnaliza los diversos movimientos de los registros contables.<br />\r\nCorrige los registros contables.<br />\r\nElabora los asientos contables, de acuerdo al manual de procedimientos de la unidad de registro, en la documentación asignada.<br />\r\nVerifica la exactitud de los registros contables en el comprobante de diario procesado con el programa de contabilidad.<br />\r\nRealiza recapitulación o chequeo de la historia de las personas naturales o jurídicas con cheques nulos.<br />\r\nChequea los códigos de las cuentas, contrastándolos con los que recibe de la Unidad de Presupuesto.<br />\r\nEmite cheques correspondientes a pagos de proveedores y servicios de personal, etc.<br />\r\nLleva el control de cuentas por pagar.<br />\r\nLleva el control bancario de los ingresos de la Institución que entran por caja.<br />\r\nRealiza transferencias bancarias.<br />\r\nElabora órdenes de pago para la reposición de caja chica de las dependencias.<br />\r\nTranscribe y accesa información operando el microcomputador.<br />\r\nCumple con las normas y procedimientos en materia de seguridad integral, establecidos por la organización.<br />\r\nMantiene en orden equipo y sitio de trabajo reportando cualquier anomalía.<br />\r\nElabora informes periódicos de las actividades realizadas.<br />\r\nRealiza cualquier otra tarea afín que le sea asignada.','',''),(13,71,'Ingeniero de Software','Sistemas','1','3','Jefe de Sistemas','Programadores de Software','Supervisar y llevar el control del proyecto','gestionar los distintas etapas del desarrollo del software<br />\r\n','Ingeniero de software','Responsable<br />\r\nAlta Capacidad de Analisis'),(14,75,'Jefe de proyecto','Administracion','1','1','Gerente','Analistas Funcionales\r\nAnalistas de aplicaciones\r\nProgramadores','Ejecutar los proyectos informáticos asignados por el Director de Proyecto, dirigiendo y coordinando el proyecto de desarrollo y mantenimiento de aplicaciones, supervisando las funciones y recursos de análisis funcional, orgánico y programación, asegurando la adecuada explotación de las aplicaciones.','Control y seguimiento de plazos, indicadores económicos y de calidad.<br />\r\nSupervisar y coordinar el desarrollo completo de aplicaciones y administrar la introducción de los sistemas de gestión.<br />\r\nControlar las aplicaciones en explotación, minimizando las consecuencias.<br />\r\nAnalizar y recoger nuevas técnicas y herramientas del mercado estudiando su viabilidad y necesidad. Posibilidad de contratar recursos externos.<br />\r\nControl y Gestión del Desarrollo del Proyecto Informático.','Capaz de dominar todas las etapas de la vida de un proyecto (análisis de concepción, análisis técnico, programación, pruebas, documentación y formación de usuarios).',''),(15,76,'Técnico de redes','Area de redes','1','2 años','Jefe de redes','','Dirigir, planificar y coordinar la gestión de la infraestructura de redes y comunicaciones','• Gestión de grandes redes corporativas y/o operadores de telecomunicaciones, redes de acceso, redes de transmisión de voz, datos, imágenes, conmutación, gestión de tráfico, así como de todos los aspectos de las redes WAN y las estrategias ligadas a Internet<br />\r\n• Poner en marcha las redes tanto a nivel material como logístico.<br />\r\n• Desarrollar y mantener dichas redes. Elección de los elementos HW y SW para la optimización de los servicios de redes de comunicaciones.<br />\r\n• Gestionar las relaciones con los proveedores y negociar los contratos.<br />\r\n• Seguimiento de los presupuestos, los costes y las inversiones.<br />\r\n• Mantenimiento y evolución de los sistemas de gestión de las Telecomunicaciones.<br />\r\n• Enmarcar los participantes internos y externos en los proyectos de Telecomunicaciones.<br />\r\n• Escoger y gestionar los contratos con los operadores.','Gerente de la fiabilidad, de la coherencia y de la evolución de la arquitectura de la Red y de las Telecomunicaciones utilizadas por los Sistemas Informáticos de la Empresa.',''),(16,77,'Director de Obras Municipales','Dirección de Obras Municipales','1','5 años','Alcalde','Responsable de Obras\r\nSupervisor de Proyectos y Secretaria','Garantizar la ejecución de los proyectos de inversiones<br />\r\nurbanos y rurales, de acuerdo a una planificación y orientaciones<br />\r\nsuperiores.','Planifica, organiza, dirige y controla las actividades realizadas en las diferentes<br />\r\náreas bajo su responsabilidad.<br />\r\nElabora plan anual de inversiones en consideración a los fondos propios disponibles<br />\r\ny a recursos de cooperación externa y transferencias.<br />\r\nCoordina con las fuentes de financiamiento los proyectos a realizar.<br />\r\nSupervisa la ejecución de los planes de trabajo de áreas y proyectos bajo su<br />\r\nresponsabilidad.<br />\r\nDa seguimiento, controla y supervisa los proyectos en ejecución.<br />\r\nSupervisa el proceso de formulación, diseño y ejecución de proyectos.<br />\r\nMantiene estrecha coordinación con instancias homólogas.<br />\r\nDa seguimiento y control al plan de explotación de los equipos pesados.<br />\r\nEstablece coordinación con la dirección de finanzas de la Alcaldía para definir<br />\r\nla disposición de fondos para ejecución de proyectos.<br />\r\nRealiza avalúos de obras para garantizar la adecuada contratación de los diferentes<br />\r\nproyectos a ejecutarse.','Nivel académico: Ingeniero Civil<br />\r\nOtros estudios: Administración de Proyectos<br />\r\nExperiencia laboral: Cinco años en cargos similares',''),(17,80,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','1','1','EEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE');
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
INSERT INTO `imagen_publicacion` VALUES (82,NULL,NULL),(83,NULL,NULL),(84,'����\0JFIF\0\0`\0`\0\0��\0C\0\n\r	\n\n\r\r\Z\Z\Z��\0C\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z\Z��\0*�\"\0��\0\0\0\0\0\0\0\0\0\0\0	\n��\0�\0\0\0}\0!1AQa\"q2���#B��R��$3br�	\n\Z%&\'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz���������������������������������������������������������������������������\0\0\0\0\0\0\0\0	\n��\0�\0\0w\0!1AQaq\"2�B����	#3R�br�\n$4�%�\Z&\'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz��������������������������������������������������������������������������\0\0\0?\0��^*��5���oʐ��c�X��@�ZC��o�*��x��I��t>�-�P<�V��p?�~T�ep?�~T^�&��$�\0���\0*_���\0<���4�MI�I���ʓ���\0�6����<ԇm\'�?��oʓ���6��r)2(�&�Ϳ*2���\0=)Fh	\"u��T|�\0���T\0�PM3s�\0�3�Q��\0�*\0����C��l��4\0�\n������NE�<���$S���i�7�M\0�(cL���iCr��X�w\Z]������h\0�i銏q��H���@f�ph����;P��4��U���=X�\Z\0����n�U��V��.�^5����J�|@<�W5�F��z�A��ۆ�@�ku���DPA�����m�6(rݾQWa媕��E_�_��,:�)�4�8�x��Ar�4��Шob�U�><&(UNi	5dGF�\0�#���U�/�@�z���O��n�\0E����`���ոZ���Bp(�sE05=Fhh�Y^�]YA�\0(�V���E\0MX^:�(�R��D�b!�\0*U�J8\n\0p�N�\n�FE\04S��mJ��@�*x�^��\0���J\0nrx��r\"^MU��X3��eMv�D�g�\0�6�!j���9��X��v�-�����\0a[i��rⵡ�b�\r�f��a(��ր Xv�/Jp�Ցъ~�\0�\"��I�A)�h����殀)�A���5V}.�������P�x\Z�~Q\\��\0ÑZ5�+�� ��\n�>e�>u���ݣ����e��8*�W����gr}���P�	T�P���{�05�i�!CZW�IE�+\no�;�Om��\\aI������pk�]Z��6*�^Ony�\0uw��RN+\n���& )���́�Z��s@�z<��b�Q��\rt-}ǵ/�b���k�N\Z���9�Z��}�P7����\0@%>SNUcު��y���ky����:Ԩ�ۭPK���b��n�~ph�O5.Īh繩Շ�\0<�zP�����\0�qHNh1�V:\0�fjUZ�GJT(�\\A|T-&ڏ�ɠ	��6�iӂ�\0C��#��b�\0E��Cjn)��#=��� �����@Mc��l�]����=E\0s?caڏ�7a]9�_AL�\"/j\0�~��4��]#Z��*���\n\0���]�U�Ӝ�ç8��A��N6n��\n2���@v�&�:�v�@��\0j ���{P�җuGȢ�$�h� ���\0�)���K��\0�mH�JjE\0мӂ��ɧ��v�l5cfhT�6S���F�\0��[�j�eH#s@	\'\rQˠ�\\���	����o�M��b��>i�\0�U�ڻ�^[�XB���\Z��+m&�\nʹ���\nO���}�� ���?*\0�7P�Q�Z�6�ҹ�jvY-��_iIW�Q*�7��ۡ�bS�j\0��K[�s�cʢ,Gߍ�*�&�ᶏv\"\\�j��\ri���E�\0|�&E�K��W���yK�W3�F�3�@J$c��ć�����)խ	�9�+\Z��Z��w��j\0���N�R��{X���\'\r~T\0�\00Ӕ�9��:�ߕy��t���g��fS���F�E\0J�{P�W%��$P�8\Z�$ ӄ�`���2�@��&�n�E��9�	7QQ�@��>��\0<W�7�t��⿕v�UU\0p��zwh�����a_ʻ�(R4^�P����⿕D����\0,W��\0�4�]\0y��q���b��B~ؓ��ҽǊ6\Z\0�V�ec�\0<��Q��/��?*�톚S4�?�l����1���\0�1�W���Q��+�����@�����֌T�P�\"o����\0,��L�\0�Wm�\0<��^�!�g���]�?Տʓ�]����{�S|�\0���,�})��Lg�?J�]��M�@5�\0\n�?�ʘ�\0\n���g1�I���g�j�\0s����r�\0s��o1/�1��\0xq�^����F�xOҽ�گ�F��J\0���s���\0°�\0c��p�2�Q�d���\0�b?��S��\\�^�m�җ��{P�����J�_�ώ��w��R�8��E\0|�7�� �\Z̸��>�}s�F�~Q\\�����<9tj_�&��z,�b��-F-�<�i2�r�,VHH�5�$�\n�GLRr����-7P��d���yC�⤅�a�p(Ѡ��ⴭ��\n��c���!�&�:���N��o|%��i���t��X��U���X��m\0h�i�*r�L��! �@\r��n)�<�6��Jb�G@l�eY\n<�\Z\0����ivf�U�\0(�R���f:��^>�:�(@*P8���R��$u`T\n6���\09jx�*2\n\0�\Zz�\"�J\0�\n�G���4\0�^)��,c\"�y1ɠ���Y�����f�u�dN�^�Ů[/ހ\"�%�q��lt��­Y��n��W7v\0�\0\\\'�04��ަP;�\0laH�S�`|��3ӊz�4\Z�G4���ྴ\0����J(=����ԋ\0D�şj�#��\\[�4�\0� `b��\0�aiJcdG�_(Pl��Uyt��}��V��SJ�9��G\"�.�$��D�\0y\rǇ�\'j\Z�ֳ\n�^�&���3Y�\Z$NN<�+wN�U��x��Sw���Z̟I�	�h��8�j�_1�Ud�u<���<��\rt��Vkw��V:�0T�\Z\0�kK��^m\"33KN:\Z�ȇ��\0cM��;rj�Z�F~鮹g�3Ry��� �J%�}�5/�I�1]>�V�\0����NU��$�S�\n�:\\m�X\Z���Q��)��f���d\nj��0\'*h794�0h!�U�.{��R*\0�i�L���(=)�>�\0�jTZtqn\\Ԋ�v�	8��9�$cڬ��((��\Z@�4\0�3J��8�U\rJ���\0@-�jA\0�S��@������`�iD9�\nOl�ڠm=[�jy4y4��X��U:i���\0��a��{TM��5�=��Sڀ9�S�T�}+n]00�E@t��8��=�/j��8�@��E4@�O\nGj\0*P8��\"��4\0��TqQ-J��):Q���\0/Z1@�\0й��*\\\n`��\0)4�R�AZ\0@�=*DE =�@�\0)j�zR�=(ǥ\0I�ÊL���}i�}hT����$�j5��N<���t5 �X|�~U\\`v�=(�Ci0��j\n�6��L>x�0��:PD�Ѯ>Σ�{υ�M�;\"Q�W_�ӊP�?��<���œR1�V��,LI�m�p8�i|�n��.��>�,��k���Y�Y��78���>V��4�mg �� ����-�ͻ�{U\'�58kw�ھޗD�%6�ϵf���*rH�A�j\0����?<$~�#\'�LW׷�\nt�vƣ>��_|�����O���Jip:\Z�ۿ�˴�G��/�\n]@�&�<�N=jT���]�,Ԡ\'d,\nƸ�F�m��w��\'��U��Fu��ʊ\0�=����y~�y~�Wa�%Z���1�+l�1Ս�l�\n�)<����e\0W)M����M�_ˣ˫(�@�b�˫%i6�}�Rl�Ai\nPFJnʶR�R�+��1V��Yh�Jnڝ�4ҼP%i�j]�ҴZO/w5&�Q�\0Wh�L�V��h�@l��E\0�\0]��)Ú�G�\0C��e�����x�]�*s@5���Vg���5�n+E!�\0@c����i�<)\0ƀ\Z���pf�m\0f�Lg\"�[����n�EQ�.hsNԎFMtֺ�`9�<�c	�;L��4��J$^�b����[��x�kZj��d�i��Ұ����U5�\0E�jU^)��A@�mLV�m\03�T�i\n�Ah�J��\0�*eL�j�5i�\Z��GJ��)�y�	� �#Z���@5*�c��E\0J��Zb�ր$QS�*%��ht��0p*U#�ؼ�.�vňSV5�,\rgک��&����WM���RYڤHj����LR�ɡFj^�\0*�59�\0��\0S���ҁOU��J�N	@*�S�*T�s@�N4���Z\0�-.ڗm�����K�1@m�eO����O5\'����)0M\00ĸ�͸=�}���(=���@�rI�El\0�sQ��Ҁ9۝7\n+\Z��%��]ߔj\'�<@xt��ޔ�h�ڻ��ѹ��S�JS�P\Zޢ�n1[��8�S�Nd�\n\0ʓ+�UI����A��*�ZTG�@4�r�w5Y��˻�k�ێ-�*8Q@���dn\r[V���8V��Q&p��.by2#������M��nܚ�%ү$l�qN�L��䖠��&�q��V���(*���05����\0`\\�R�*�is��&�E�\"?x\n�Mm/P(�ʇ��A��+�kY��W}7?&(�\\�U�q�V���_\0T\r��\05\0�Jl����:\Z�I� �����TQ��j�J��\01x�)�AT�\"�@f�Rl��\Z�O�KOQ�@�eM���+���U6�v�\0�b��j�=��@Dx�AA�V���y�)T��e���\Z<�\0�kNqQ���ml���ڀ0Z��6�>��|��Q���a\"���+m�=��ٟJ\0� Ӑ��W��})�f{\n\0�\Zx9����j_,�\04)5(P38�d��(4̚x�u��4�\0(���\nQIJ(�8SGJp�QJ\0����\06�Piq�\0)�Ѷ�\n\03Fh��4á���\0A+���M7ni6�@)�s֜Z6?:�T �i�wu�	<�64*\n�q��L�:~U1Lw�m���G�y�\0FOʊ���\"�Fګ��_�\0Z�I�5[�A)E��\0��\nCC���@�B���ڴ�t	���X4�:��^�}��!��n�g�G�i\0┛)>�)>�(�qHE1������M�0ܭ\'�V����i�i}�P�B��qK��Hn��c�f��˧y��J1@\r+I�=i\ZQQ��\'����@��2���g�F�\0�>�^���ߊ�;��@�\\��n5�^@�g�Þ�BI\0�\r���T�\0b��i��Lr��*�\n7U��u��YJ��@2���j�\r5�#�\0͒,�R`l�$��UY-��\0Գc\"�������5��\03��@gNG4�hZ�p�o�h�^;�fA���@׃�ڀ;֬F8��ȳ *j�-��@�HJ�e��S�4\0��\"�8��۞�\0�9�즨�\0�T��\n*P��y�i�S�hQ*uSTT��\0\n*U�֦Q@(��h���	S�YAU^*�C�h⠹��N�3�VE����(��s&:��c�A\"�i���,3]$+�&Ҹ�E����)sJ;\0���Tk�S(�ZxΕ\"���=E\"�5`/\0�)�f�T�(\0�����@�Ԋ��qE<��\nA�H8%\0EN�J4�()W�K�4�:\0n�Hp*]�yy�v�(\0���x��ǥ\0F\0=�6���Z�R��\0T�MFПJ��\r�\0d��{G\"�����4`�b�0\Z�������Һ�F\"�Q@�E�\rD���5��Zm<:�(��CE68�v��4���U�d(�@�R�A��|��ԁۡ��d\'�E%�=[V����(	�[=*3g\"��5����H-���iE�G��1��涞�H����Pq�G�:Ո�+6]1�ʊ��\'O��\0�6�L8\"�ͤD�1Y��1�$Ք��9c@�)N�Z�]�hG��z����0�U�cOL���a���Pˤ�eh(6i�f������F�ױ�m�c�o�ԡH<�\0�S�H)�@\n.�x\0is@��\\zS��q��`��zR�PI���O��+��	��d(<�T\n\0��ڐ��O���_fi\0��;iv�3n=)�H���h����zUw��j�1�a�zPY�\'�����\na�����3��֫�P���J\0����\n���Ҁ!��L&�䷥\0!�Q����c�\08t�\n`4�(��RP\n\\f�h��4��P\0)qJ=@�\0G�1R��q@―&)q@�(�jM�m��� �HF ��\'�#\"�� Ƞ���p��T�X��<4ٜSM���\"�m���\Z>�ݫlړڕm����W��[�@������W��V�=)�g��o!��\Z�~��G����j<���m�K�a�@�KQ�m��zQ�a�@/g�3��k�6�ғ�Ҁ9�n�֓��]���e���5CVٶ�f��O!�D\r[_f��6����gj��7�g�j\0��;Pm�l��փ�����ңkR{V����\r��\0`���<�[f�ڙ�oj\0��Q���{Q�oj\0�XI<�͸=�L��Q�Z\0�6\n�E4�Q�ձ�cK�\Z\0��ȈuQ@�b?�+o���A�\0aˢDÅ�w�(B�p\"栖�X(ˮ4֌�*����^�}�	����p(�Tml3ȭ#^�߳��\nb�6�-�k�Ձ(6��P�,��0*�V��˕�*��4df�>γŒ9�\0Y�5�0�k���e\0�\\\n�</�{V����aX�f�db�E��;� 5���@��36A�_J\0j�x�*P(�*U�0Pq�)�h�=E\0=V��P� \0�_J�5�U��h\0OU�������j�j�5#\n\0�<�sX�3M�z�{.	�ӡ�$���@H��M�v ��\0�FjE��i�P���qN�\0 :\n�\n�(\0�J�HL�@juSsS��\Z5 \\\nLT��\02�f��P\0J��EZ�\n\0a�sN�9V�-H�r�;m\00-;m.�]�\0��ԛ4/4�\0�EE-(�\ZW���3F�\0@��iB�����m�J�o59ZiZ\0�ǚU.)�(�D)�P\'a�:�c���t�\n�ôt��H~��]QW28����gL�ɸ��Rk4��o���j��j\0L�h�\0j�����%R�N=�m��O@���k���ˡ������l���~��֥BO�pq�I���\nҴ�Ɵ)��:�3ޞ��X���O�%>��\r�r�\0�l��)zJaB:TbN9�G��@�j���2X�J�S���{�35�]��䴙O˞+��ސ�G�(���b=����4G���oIa袪ͦ�1@.��~aS����Vd�qQ�U&��#�q@�c~�SK� �\"^�G��]�W�.43Z�c4�SzT��Q���^�x$b�2LL:��+\\�,�w龔�\nz��+�2�)�K%\0.�NU���U��	��i�4�&i��@�K��9�@�	RK��\"�Fʛmh�l����!�M1՝�l�\n�*x�b�l��\0V�!V��EM\0@Ђ*#n*��K��3��S�d�L&�3Z�=�3h}+XG��֏ڀ1����Z��Fa\'�\0e+J+D�{Tmjq@U�<)�\0g#�#�\0n�ZO,�pC@	OA�K���\0��m\0Ӆ\07mj@)1@�F�}^)6Ը�m\03m�1K��\"�h���(�|��G�}*�ڗˠ\n>_�!�U��\'���)y\"�$U�\'ښc�\0T�E\'�V�S6�\0����՜R�*�4�UX#�LPUUO�1@Z,Ryuofh�����˫�]\'��@L\\�yUx��M���J#�ו�Hb��\n�5���X)I�XŚi�����@D~��1V|�j<�j\0���Q�-�Z_�/��@�Sԛ�Z-�D��\"��I�U�+4Ƈڀ!Ƞ`Ԇ*A(�A4�\ZӊsN	�\07��\0�L�O�@0d�篭G<W_<|\Zý�9�9�\0�*;V��8\'��Ƀ�\0@b��O�M��\0Gc�����Qm�F��\0ky+\"p+6{WF$\n�ms�\r^�ī@v�/�����d�<ֻN@�FLf�;H.�Z��q\\����kr��H:���\\T;�S��,��@�D��4\0�\Zr�ҏ�B�he��)T�r(\0Q�S��Jfڞ�\08!�\"S�~)ьPN��;sڞ��Gp�b4�z�|\n���*7J�e�&�k��M��}�@��)�=W�\0r+u�֑zS���?���\0���E��52�\0r���c�5E>�5:�*0=iÊ\0x����p��)�-N�ڀ�jM��=x�#=(=���=V�Z�m .0(=�ྔR��\0B����4m��ON�@\rU�P)�iv�m��N�y�l��6}�YQ�ܔ��A/ڀ�%r:S�J<�ݱG��;ǭ\0F\'���2���⏉ZO����\\Z���?�xa$zK�n�M\0}/�x�KҔ�ɣ\0�^e��BҷEk*�85��2��tc����Fk����۬�\'��R[��\0��_�U�dh�a#g���P���Ÿ����^\r���}*4{�՜z��+	�:B���>?٠�����+Պ��\'P�s��t�٢f��3ɓ�&����p� �(k�s�������Pg������ޏo��������L	�5�����J{� Ӑ.Nk��zr�\0yt�\rš�N*Ht[�.#q^����F?�?*\0�#K��j�{�ޮ�[!!�U�M�����_Ҥ{S��L.� P�x�N=MU�Zz1h�\0Ҙ�j4j�d�ր\Z,P���Ӑ�mu%SSnS@2iJ�Ui4��G�0��B�N��x���r��l�~��]����V=V�\"7���8�Zh��J�&�9�������dI��\"��4y#?.j-�t&�:f�B>\\TmdH�R�����(Ǚ@���N�֝�o(��q���a@�a�Eh5���Q5���@��;4�k\"��U��\0;�M*0��c�@\r�h�޴.s�H�\Z�i�sJ-(�������Nh�R��s֜\0£SDu6�F�\0�(�ڴ�l���M�M��m\0W0�RyҬ�m\0S0�ҏ#ڭ�ړI���Q�����h�J\0�6�ңkf��r���Oj\0�00��[?jO+=��a֜kM���^�ڀ)n��T���TF;Pn��O,�a�\0?����s�<5\0.�(�K���\0n�)٢�<�\n]��\"�\0C��.*ϗMh�SJf�ytl�\0V1�f<\Z�����\0Qۊ6ՆJhZ\0��ݕkfE&�\0����ge(\\S�O+J�#�K��	O	@�Rl�;)\nPR��2*��B��\nF:M�l�F+l��S�Fh-�m�vѶ�\"�K���F�\0�m1���)@B��2U����\0�R�R���\0UٚP���v�P( ��S��)�\n�\rd� �e^\re]���G��f:�[Wkɬ�X-8-H��#HɑS���@�cjԵ�\0`��,YUe�@ �*�Im�⠶��5��8����U�K��sSMn�L�\r\0tvׁ�ɫ��z��1Mi�^g�H�f�!�#��W�4��B���[rӐ�@c�\0桉����\'U�U�Z�1��� �Zb��2(�j���f�q�Tu�\r\0eYG�Mϭt�G�\0�-s7�]:�J\0b�5:�(��q@)�i�qJ\0\n*@�(�H(\0QS(�(�R�$QO��P�Nh�(@�b�)�2hcZ���F�R��\0�R�4i�1@\nH�H��ր\nq�R@\r\"��3O	�\0b\n�-8&i\Z���(�h�O�=h�PG��M�+2�74�OAO(��YNzז�C�ͥ�^�TK����u�x�N����w2�<�����\"H4i�����?�l�<k��e����`m5����{ּ[}ު����f�9i�/|G�ڂfWld^����g��xnu�r����<�[G���fX�P9�zLI.�B(��xGᮅ�4[��G]��@+��B��RK�3OT!q@�;�\rE�o-V��I/<�\0�n���#OH�׊�\"� �:��F(�ݵa��hL�$b�a�WVԂȞ��A��}+_�`pE/؇�\0a��v���#��D,�zҘb\0��Q�8Z�%�����|�A��Z���C�M(v_�+��g銪�l��9՜\n�nkV]1�H�ri�>�\01_wz�]��:NV������hlUD�T�L�̠���犑_�T�Pt��Y����A��@�OQ@}Ο��V|�Aa��&�7��1��\r����K{np��}&���R�MN~Z\0���(;�Z�ı��W�F�� b�nt�����G�Ar8#�x��C���/� <Vc�nc<��\0�d��\rW6·�Y�Z�\Z݇T��Ph�_j]�U�-_���\0� �L֑��F�g�\0UV�r*Shå4۰�@Ƞ�Q���9ph�j]���o��\0 Z]��3O�\"�Fʛb�!�Fʛb�+��ٚ��4�q@��O/l&i8�\n�i�jϗI��*��-Y���^)��f\Zi��*��1�_J�c��\0RkqQ�q�W��ޚS�\0�{^���$V��4� h,�E3V�[砨ͱ��\n4U�\0��J(��4���N�\0�EA�0Zp\\�c4Ú�R���*y�U\\)Lٓ�\0��f��1Z~UF�P\r�ld�G�@�\n6\n��Q�PF\\RV�,����E<-?˥�@mm�M����\n�@�dȩ�f��PC*6J�R�d�\ne)1��c���\Z*o.��(*mM�����Zv�LP\n�Sq���Z\0��4����m\0B˓M�S�e\0A���>�6P9W�ɻ^��*�k&�q�\0�n�&�e�R�`��q�\0D)�QNQ@�.�r�J@�Uw\\��J���\n!J�\"�,�`1���S��IÏ��K\0Z��kI��dPT��K�\Z�,Y�R�E\0Z���{k���U�\Z�\r�Q@�W@3S����]�Q�j�.E\0j�-[Ny�����(��h�O�V���sV��@U��T	�O@\n\rR�rb����z�-\0U�b��k��X\ZP��t$s@�_.�T�P/S����/4\0�*@)�R�\0U\\Ԫ��*�\0z�?�N���J\0=i�֘��Q�\0HH��*�\0�(�8\n\0U��M�\08Q�4�R�\0����S��g<P�9�P\08\n(4\0��&��\\)\noq��CHѾ��Z\0f�X�z7�����$kܚK�!��{�.���_+|r������2\\Hi���ǻ�Mi���|��%��<A�3Yal�Ȓ?NjmB־*x�2ʒ79ɯ��~�Zw���.�Pʹ�P����#��:�\r�\n��\0N��{D��@���h-�F��\r�����`�0[�j�ʓ��\0FW\'4�8��F1@\rl��G��S���(\'̇�)�qҧ�)�\r�\0���Ct��lӚ��Ơ\n�;`�*QlA�V���F\0\r��i�A�\0�Y���ʰ���V��k`��z��?�opI���nu����>��d�x%Ϗ/f�5a���܆v��.<cf�P?\Z�\'�-�%%�����n7�V4�\'*VGj\0���D�G�����nc�?�yU��ΥՍW�o$��d�z��Zx����Z_���oּ���z)F�{k��	��5g��ԫ��ך�a�\'�\\YM\0t�|��T�����r;՘����4�دܦ�ҟmt��V����P1.O5`�����\n�Lc84tHA�q��Y�2���7��(X��Q�=���8I�\0�Su�9��\r\0Q{=Ơ},8�[\0\nxE\"�9y�U?�U[E\\�ش\nj�V��h[���T����l�x����G5Nkd9�h\Z�S�0֭�����Y�D��Y��,\'��\0u��t52��z���$��Z�j��\0�\07j(�UH��������9�\n�٩�U��+c��U�1@���8�?)����Ѻ\n��Ő�R\0G��lť\"u�1����6���\Z�Z�v�c_Z�$�\0��c9�\0M\"�8�rP1J.3K�\0(\"���\03h��*M�m��\n>�I��V��SvԻh�@�����m�\n���y�Ei�(����V�sA��*�7�lǚo�@\n*וE\0y�C�]�l�G�@v�r��]1@b��>�B�)�y�)6b�#�5���A\\�M���~�`�&�\0��������Ѷ�+��<�����%)�*�)6�a8�+R⒀#�Le�\"��(\r�1��t��O�R`Pr�ҕ`�cPr�ݵ1��@m�+SL\"�#�)�\Zi4��4�\0QHM%\0:�M��(H����ִ�=k.���+�ɬ�5�u޳f�i�\nm*��O�*5�P\0�Q�4�)�PmȨ��9���]7��\n�!��+b��k!ϖ1M�R�\Z�:퀮�,A�����|�֊��ր3d�9�\n5��*��c4^�[�w���\\��`�Ըh�Pso0|sZ�7k���5�m{���\0߉��m�����5z6��\0_��T��UH�J�wJ\0���^�ڱ���r�#ҿ��A���t�����o�\0H��U��Ҁ-</4���\0@�Ԋ�O�Z�\"��E\08\n����O�z�����9���qR��\n�\n�T�P�p��P\0)�R\nz��K�P)h\0��(TsO�\"�iؠ⒝M�����LGX#g���ɩU,�\ns_=|z����%���y�����Z5��v�0�*v��A�5?�:�nY\ZW��^�5����C�Hp�3��z��\0�o�M;��D�Я�6���4\'��6\n�໽�<��9�d�����m�zR��/���\"a�@b\r�/�R� m~�Ә�rҕ/�\0Jp���\0�m8\nqPx��T�DX�(��$v�;����M®�)e�Z\0�-�(1֦P��yX\0=k:�V�\0L�Z��\0�?a�\"x���G�;�x��HFX�]��ׅ�����B��ח�?�\\�f�BT�Zd�s�Z���7�;呰O�t����8�fl�߻��.B�7�\0۷\n�Q�@a;�R��aӥ[\\\\ņ�\0�N�Y0�+Wb�+�������E\\u��˵�\\I2�?*��U�n�*�q@����n#���뷴���\\�hl�,����=K��I��������sV�֤Nx�6�@j�H�}�\"7\"����\r4f��W��`y��e隽��a\'V]����������kJ��}�@�+۷9�O��5�uh�)\"������q@�A�R	=�.9��jq-\0i���(��5����@��p|UE��%�~a4��@��R\0�\08�~��c\rNY�����\0�-����x~��֔��@�ƚ@;Ef�g*��8N�ZH���4�fd=��\Z�@g5~kd��6�U��کi&Uǽ\0n[_�ӆ`�\ry��M�s����\0j����#M�� N��z\0�m!��Ӂ)�W�Z_�K���2�ϭz���3��\"����C��J�j�v��	�����4d|³5�5�TsL�5O���a��[����ER��P���?4�y�4\0�QL�;4\0�)�P��6��\0��dPb��L�Z\0n(�N��W�.�M���jm��(\r�T�(�6�h�jJ(=�c%5���S�M\"�E;����b�\Z�)�)Sq@⒤\"��\0��ZLS�Rb��LS��\0!�N�4��J��[�\0EM4�M4\0ʍ�\rJi�(��\r�R�aj\0k\ni�?9�P\r0�&�<PI�ұ�4��\nm�4����i3F�\0�T.i帪�=\0A+pk.���[�Ywh>���Ɏj���Y�ր#��nq@)���R��LcI���\0CP�#5!<T�4\0��5T��\Z\0C�WA�j(�k�nEF�44ޅ2:T3&�1Y�F�$�9��]7\'4�$mS{~s��#��ZH�<PH-qZ�W�Y�R�AUX2t����L\rlD�\0��O��݆�]���,�h��p�T۰Eg@F܃S��84��)npК���S���\0R�b����#��D�������M�\n\0�ޫlp�Q~�j�r��%��枔���RG@�))@�J��J��\0B1H8�\0���<j\r0/9��\\P��T�P��h��\nP�Ӏ���\nv1@�S<t�Q@���\0\0f� �\0��h��lS�Q\Zmm�\0���z�&w\0t4���.ʫ��0�L�3�R�OZ\0�>+x����щB�T��~t��\\��ψ�i�I�3���?~#��mZX-e%�\0�A�;�}{R�P��t9\r�(�?f_����z��o���+_W\\ R#���`U�,-�+�lP(\n�F;n�\0���R�֖�\0�zӇb�PR\nm(�dS�R�4�3SGje�(��\\�ȫ��-�Xf��5����L�`�K�\n\0�9Q��\\ǉ�]g����^;f���?�7���<Μ\Z���5�&e`�x�=+�Ƭ��X�=2\r|������Iu!*NpMi�\0g��-9�O�;�+��(\Z,G�jѴ��x��N�9�`y��5ep7u��.�]�́\\Z��V���������̬�g\"�Fv���y폈6\nƺ{-m$��@\Z����4�.@��<��;��#�S�)8��4�D��R�-�V��\\S��=\07S�Y bFN+����ox�f��M\rq~!�0��(�ӯhF8�[Yo��^}��@��ƻx�ܪV�7|��6��9�k6���j�o@\Z��L��Ҳ�~�z�\rH��Zb�b~EiB��n�8=)��<D�䊤�Q�^�p����K	���<NF:�e�i+}e��m��R�`\n\0��	�֝����Yi <欬�`P����\\V\\r�j���\0]��2>:�z�>h��\' �F��9�i���Jwʼ�\0]�H�<Й�\"�,DC�v�s�/����^њK�YTt�@T�U���p�z����6��Z�2�:f�Y���L��,��.Bg\0�^\r�x�Z�E��.dr�M\0}U�?�b�՝-\\{`׈��\05�q�,��1U|�_T�IGԕ��rk޼1�<��X���r(��g��Oﶿֶ�ρ~!��^���\\��Ѽ��\"��d�]E��f\0�\n��@������7n��G�O�xvEhd`���Εg���_���^�uM-Ufv`+��<`�h�?�`#�U�\0��J\0�5��\0$�xo��pW�3���T�=�\r�4���b��5�]L֯������%>E���f�1��pOZ����P˧�oJ��:\Z\0������5��\"T�r��(�4�#�\rSeM\0*��f*-��R+��\0/�)��րRӁ�\0)�Q@��R1@�Pi\r>�\n\0���P��mI�P{h�I�Mb(�Rb��i��0Ԕ�ր�(�\0�6��8��c�\0-���\ZǚL�!�֙���ni��($�\0M4��N\r0�\0��X�M2\niph\0&��!4��\0Mf��)����-�s0�Y�\0?~)��2�j2�ր%-Lg����P�饪2����!zazap)��\0JZ�}Fd��&/���?ZV�Uf�s@�/�g�ԓKך͚Nx4ĕ�,��.��|�@y��f����\0[H_��\\z�3�@�}A����Ų*��q<T�f���/M2Lf�\0<�*���~�ޡ|���;Z�T�Y�j�l,��4��z�g{|M\0zsmv:Sd��ZG�$�����H�<��\0eIS�,�+^E�U��@��Z}���2OnX�9Nh�n��i:��\n�x��*y�#��H ��}g8YM\0w\"P�2ɑ�ɶ�IG�j�7=x�~Emi��0+v��\\��h4҆�XS�S����`�0hh�<b����hh^��)��p�	�QQ 5:��\"�\nq�@*�EL�LN���=(�)�s@�Pb��\np\0�i�f�-8)����pSN��T�qI�xP��x�sO\0��<�l�bJ��As��@������_/����3XY˂r85�^<�#д	�g\n�N9���_�� ��~$�=��~?:\0Oxb��^(DuiG${��ïC��mae(9�\'�h�t#��Q��y�2+��\"�`��(�/���M<�ۥ��7^(���;�P�P9�ӕNh\0�NT�!88���b��\"�[�S��*������@	?���y5�_�(Z�vr�k(߂85����:RZ�J<����u/_x�񥻑�1�hO\\��|O�<�H�	�&��j�X�$Qk\Zzz���{���.��pj�pdUK5`�j/�0��$�ʍ՟q�z\n�E��R\0ޠ:M9�<UsG�Wn�F�@���ѿa@�F3���qJ�~SZ3���1�PkI!<�@\ZpjRF&�Ŭ0�d�	fb�L�����n������� ��k�b=N+v�Y+��@�8��}HMEi�D�d��Y�F��@����c�k�t��6%��^f�L��v���{Pe��*�f�m�ÀkZ)�\0iB�v#�g�®���t�;W�����qW�l�\0�\r[�MP��[��\0lC6��\rek�B�H��*ݼ���jG��d��@7p^�vV�b���\0h�\r� �q0\\��Ф¬�����՘�q�\0َ^j�N^���`3V��z�\0��K6��U�e��`k��v��kS�m<3�=���\\�k㿋ߴ=Ƨ<�z<�(����=����g�G-��(�2�_x��N���/q �~P\rq�W��\"�+;I$�x�^���}ƭ,WZ�dG��\0p��s����<蝢cԊ����ݞ�\"��Eg��Ez�<a�Y����+���h��PN���]:�U01�+f\0\0�J�o-�*�@N;P1Z��N�p��x�V�£4�M���J�n�S�ȩ��am�R�uQ�5`/58E\"�2�xZ��\rl�`T�l�g�K�d�T`�>���چ�)����8��2�q]��ԎEF�:7A@c\0:�b���H�u��z�i���z�,m�1�DҪw�������\'4ͥ�y���J�} x�����PJ���ִ�>MD	�%&��4�3�\0?4��)y���j?��juD��E&�E\0y���\0R\ZM�P�L�F�\0}0��u4�\03II�L��ɤe���ƀ��7v(/Q4�4#�j6#�Dd�����hV�ր��\\�;�K5\0Xij&�T[Ң%�(����5[-�J7�@�֢o�0����\'�M\0;֢�Q���\0t�n��4\0�0=*&�4���\rD�/d4\0���7>�Ǝ~њ�����?�\0H��Q3�!�s�\0,�0���f*\0w�;���m.�,�T����y�\0w����K����*>�q�\0<��@g� ���r܄?�0�W_�j\0��<�)�9�N�t��*�M��*\0ĕ��Y�\r��]xf��\rU�·l>�Ryy�T��Mt��B��5�\n�e�\Z�9�(�h��n�\0�z?��?����P0�Gzw����<{�Ƥo�/H��c(�i�_z�o�/��oʢo\nޏ�fߕ\0e	I=i\\�k@�f�t��*��5�\0<��̏Z7{���C?�򦷆5�oʀ(3ޘH�����ߩ�&����GX���>�nj�hw��m�T\'G��Ϳ*\0��o(pk��u�&ԑ��:E��*[k�iATn\r\0z�pGp���g�1X���D�\Z�VU�-\0`O��x��t�	��MV{U~��KjW�@7B���Y6�j�>��<P,5�5�Xj�(\0�����*KI%�q���.A�#���穬�\rK*\Z�������ӧY�g���no�q>ձ���]������5e\rR��X���B�S�W��2(�T�Tju4\0�sNAF)�(U^*d\Z��\0<\nv�P8�@\r�x��*����PE\0�iT��\0ʹ�)�y�4\0�S��\0k�)	A;�\0�>��j���w2��~C�\0������--������0\r|�������Q\\L�԰$��T>+��O����Fr>������$�t�n�@ �@������x �B��t��E\0���`P\n4�(���?Q�\0j�vvҁ�?f�P\0\"݃W��*�Qƿ(�j>�P\0�ޯ,���\rX�2!pk��~����n�@5���O�=ZB�@޴���Z�ĺ��;3)cޛ\n.��ګĪ������b���\0O �w��I505\0_�+I8�6����y�	O�D<\Z\0}���\0Z�LI&��g�}��U������QY�i������!��A�\n\0��R(�S2��]�Β�%Ecϥ�xZ\0ˆ�ӡ5d�<�M6KcQP��P�~a��tڣ5�ą�WO��(��`�Z���j�p��X�@�]��Y�7~�\0kBzb� �+2գ�P�=\\��S��]�Pʿ0>�����J���J�S�\0�]��бe<W�j���vё����6V�+�� hE�F����+.Oqfܡ��XP�6<��V����:yL�3�Q�x����l�Z��A X:���t�.�p�y5��?���\'�%����`���\0�_�מ\"���O��pH�׆Y��kW����Hܑ�W��f�o�2�#rG5���o�P��E�j�\r�0(����*�C[�$��¾���H4�4UE�>�:�6��4�`WAkncnH��[��Ei*�F�T�h���֚�R��@����Z�z���O���@(�\0��-H�\0�9ȫHv�\Z�7�(\n���@C�Ҟ���*��Li�h�nFeu��ow�Yu�Fep�\01��Ny����\n�s�i�*I�r=��>\"Z�dF��:�%�\0��^4y�y������5�u�yI�ƀ=q�?��:�!���^5\'���<9��3�[��!���%J0$Z��z��5���+���:F�m�\'�s�\0��1���L�̨��p�o���1�]�������$P^&Sң,k}b��2���=��Px\'<ԜSeB�� ƀ,�ijz�����\0��o��	��/���@޴.�7SJ\0=�۩j3�JR~^(٤��\ZR�\08ZGa��yc�H���P�x��D֛X�L��Am���(:-9��kV����f�l��qZ���9��F�z�<2��n�f�X�\0��\0�r1�S�b����ъ\0������Js�[\'#�&M\0e�\0a���I����N}i	>�����ED�������FM\0c�B:��\r\n��mƓ4���o�\0<��G�%���ZT�{��-��\0�c��Ƶ�\0�c�Ƙh��-�����V���~Uh�\nis@��l?����m�\0<�X-Mɠ��n����Q�[pՏʬ��F�4���\0V?*����<��T�S\n���{q�\0,�0�۟�f?*��EFx�͕����4���f?*{9�u�@0Z�\0�1�SL���~T�_zf�@\n ��\0�c��/P?�8FM8B;�&+V�G�M6���\0,G�V��G�\0T\Z}�?���\0gY�b��M��qLPL�?��*K��\0�+�U���(>�b�a_ʫM�X���*�/֩�ӭ\0d\\iV|�%��6].ӴK�V���2W#4�>�l�1�RE��c�2sP0�ހl`^aP*�J��棇+�R0�h�y4)�u�KhV\0����=ha��\0Tx��\"�Ob�eEh�sA�\0�X�#�hCq�c�)�&�ȁA�	l�k{��k���3F���F|��ki��BBv�H�}�q�t��� sɭh����N�TU�*�nx�4\"n*�\Z�	��)&jT����h�9���dlՄ�@��9z�kR�Z\0xԂ��Z\0p���-<PB�-8-\0&iivӣL����u�ң#��\0T��OA_:~�>9��ҥ����R85�<�,V�;a\r~z~�^*{�~[%|��:��xD��~-���\0{��_��C��\"�!k��?�=�]Ι�#\"��C��� �)OJ{Fh���E�\n����Ҁ�iCQ@\n���d�Jy�1&M\0Oɦ�M�tg����Eq�5�iZUó\0�N9�����#��$�9�|�gifv���5�x�Z��:��#����}�.1ڀ@>jv�H�d)�j¾�f<z��婱E�g�M\ne�N�`\n�z�0\n�4(�J\r4\ZP9�	�� Z\0�)\n�h�į5B0����,b�L��j�\Z\0�>~\r=��\"��*�z�uƒ�t�>����)���P1o��#\"�\"���h0���P�7�g�hy�[��(^\nЃ���g\'�n9�jЀ�*�C��@\Zpt~!T\"�\n�	�.�9�d\\���\Z���	\n8�?_ӗR�Xc\'m5S�֭�\'V�b�>i�mƝ~�jw�qr@U�_��o��	.��������,�����`��+�����I.���J�85��A�e)���j]R�K���ؼ�s�����]����<*�@\"�;߁�h�MJ,��u�~`KhˍF0+�61����P1�z��(��@Y���y�kQcA�OT�jX��h0�:%8%H����@�(��	9z�i�b�%�j�0*T����	Ԫj��t���	7�<T�1ҢM�e�Of�|�\0�I�ڬ�\Z@�� UuMf�C��WP�t�x�\0��&K4����(�uoYX#u�=������L̰1Ǳ�>��n/$2I#s�5\Z~nhf�\\��$��ϽU�䕲�MD�=*ub(\0�\0�N�ڂI�P�����1(�pj$lv�䓑�\0K���3HѬ�i��`Ӄb�2�4����ֺ�֟/��(������7��p�(�:��9ڎ�\0�z����s_8��|�Ԝ\n��-�ܱ���sB���֨Km��3MԖ`���˚\0�o�➍V�,�+1ˣ�P��Up�P��M$b�^�^�M&7S�K��)\\t��E7y�5��&i��z��\n�n��%yAIm+p*զ��0�5�X�@,(�Lf`H���Ԏ=�kf$\\UR_%\n�\0c\\�-�Q\n��S#jm�6\0_�⭯J�\0��h(\Z@)�M��M�PZ�Njm\0����RKMc�\0.h�74f��i>�f���M)��@�*3O<���i4�=)�P�ijR)����ԅsI��\"�!�BR�t\\�i\n\Z��Q�\0R��(�֮�@SLx�\n�<PV�#m�\0E�k\n�e4�\0Wǥ)⟲��\00u�cN�1���T�<U�j��(:�5�+sZw#�eJ9�\n�75�i�py�s�\0[G��櫡��\'<�l��sA�@(S��������ju摓4I�UfRkE��ҥ\0P�f�f�m����@\Z�^��H�X�{�>0k�c��Z��u����@�\0��O���t�agPV�.�\r\0l�`qS�՛٫q�@���G�A,m�U�5I[�Fs@�L�jt�	@�TT@ԫ@��b�M<��J�\0 Zs���8\nV�����L0�U��B��@��u��9;N�_��>���`�\r6?Z����֗M���\r���^�x�6�_��ր>���<,�?�-�)��A�^�T����bxG\Zw�-P.A]\\Z\0s�8���<)��4\0��R��\"�):����W&�d��b�Cud��8�\nw�)m8�|��Ƨs[��׎\r{g�hi�t�i��|O�ɭ��b�1��Ѥ&F��Ҙ�)�z �V�,h�Q�*h���B�MK}�EQ���0i��8�qG@b^L)����Zp�N����ST�P�*�*:��S�VS�XC@��T�\njU404�<�`Ӕ�@*���_�gݞhK&�\n߷�\n�l����\0շ�Z���&�t�{qҀ4��ZV�g�:V���\0��U�5R!���h�=��*�#Ү �U�S�=j�nߨ�\"��\\i^��	C�~^��]�յy��%Cf�V~>h�W�m� �T5�A���3Z*��#��^���ޭ*L{�x�������tā\\��y/Gcl�̃y�W��oOk�Ё�@���܀XWu��FP�,���j$�\0�������ND�t��ce(�혩6ӂdPB�2i�]H��@�ɩw|���ѐ�GJ\0V���ޜ�{�\0��ջkR�|�ך\0KxY�_���{�^2�����.�`�dx��\Z,Moj��N\rx��^kWM%ñBsր5��^x����>���02rj��E>�<HG$�@���L��\0����d526M\0JO�\0�Q@��* MH�2�uB��[4\0�f���ɧ�9Iq�@��� \n�	t���H�ĠF��J��\\�@>�+Tv�U����s�+�VkY�29�Q𮭹Y���qT�-\0��[ͼ\r_�1$t�rh�Se��\0�]ԅ�/�0�M\0X-M�6����\0���\0�fqMX�V�T��|��8���K���\0b��L�ȭ�]`dV�V*\0�+FF\0�*Y���(�\'�(E�&�+��Te�W/}9���Vޭ?�UMs�����D�\Z�nE*s֬��P��U��LE�P\0F{�;���\0SN�t��\Z�ڒ��(����J\0m!�b��Ph�Q@\r�R�6�f�jB)�P(\"�E\0G�i�5�6Ѷ��(�M�՝��h�<�6T��(�i�6�y�PA�f���N�⤢��B��M&�!+LaS�G��!�1�S��U���5RU�7�����YR���8�k.�\0h.o�P����DF;P\0�(��*����;9�\n=iq�@3P�6�)\'ңnz�\0\"9�jڨj���W-��h�?j�%�OJ�T�*\'���(KlUy\"��������3�\0�x��*nP�V��\n�!�\0Ke�=��k��5�0���D�ҟkr��ؠd�p�\n���f�^u���,�]����(*��E&{Օzǆb����H=(�j�f�׎�j#�@��J�!����\0<\Z�MD:ԋ@)���D�4�qҀ\'�*$�Ҁ\n�:��%��B���)B�O�6�؟�\0�3���|�-�� �f���S�����<�S I�������[0���z�}�yQ$�9<���,��\0S@��b���E��@9S@�\0��\0*\n\Z�)q�\0n3ҥ�rhA�Rę�	�`T��Q1�AV��kS��͓�S@<|{�ح�(ߒ�k�;=P<�W<�wu�.�,E�+Ƞ���E:��S���wc�X^4�k~�RYZ\0�,KqZ&V��:I�ԉF8�8��V#^hU�b�P�NhX��6`P��M��V6�\0E�@��\0��D�)�$^�2��i�ր,)���)�@�R%D)�@f�s�j�5ZS@�0��o�+���·���(fߵk[���A[Vå\0h�:V���Y���j\0я���j�#�W�v.*�}*�}*�=(\\s�O�6<c�H���[�Zp�t+��g1+�c[�\0?n�<(�����ˑ�YN�AC_�B����w\ZbǜP&���0D8�n��h���ו�V6�2Fy����G�ڀ7,��@\"��I\Z�X�\0��͊��8y���v�b�\"�/4\0�S�i�juZ\0�R��ҧX�v� \nsO1���\0t���f����k�N\0���b�m��Ǚ�pj�\0�|m�lZ8�y�����}Jmj��$r��8�\02�Q�Z�y�X��y5*�p�\n:t�	�m�H�D�s�@�h`wsNZ�je�@Z�>�\\\Z�(Rh�Ӂ�	E8T`Ӂ�\0;uH���=h�\Z�\01����/J\0F��i\Z �A��JE\0r׶F)c���jm®p3Zz�\"H��pyRg�\0{F�|\'�9ɮ�њ��	�uVn+�#1T�\0\\�=(�����>wSQ��80�;\0��K��LC8��� b�k�\0�ֽ�����0\0S�ӣ��ma\0���T$ո�\0s@�#V�@�&�X&\0���hn~).$C�Z�?�j��os�S@�7iH�z`LT0�X��c�\0j/5f5���T�=hA���Ҁ}hh�\0ӳ@\r��(������i�P1La�IHh=�m��@�HV��#4ZiZ��iZ\0�mjP��h�m��Ѷ�!�@ԄsHE\07b������K�iSH�JE5��SȤ�\00�M��(�\n\0��4�JO�Ҁ!�K劓�i�^!Ue�f�H*���\0�2\0:�)TUɁ5FPq@�\0�d܁�Z��Nk>{f4�Ċ���Uִ�ҢkI=(���Oj_��{T��OJ\0�0�����i��Z\0R�����F��P��k���`���0�U\'�\"�ZT���z��S�l�\Zλ�9�3�(@+�Ա�\n�9�\0te�p*��c7jԳ���[`��I�7b�.,���H7/J�t�pr(�6�EA$����J\\�\n˗K+�4�I�@ᐚ�t=�U��:M;vAZ�.��ܼP�i:�WAr��@�\0����{\'\'�}#YܠHh��b@��C-`�v�� �0�\r�f�Wc�ucE �^�/R!���dj\0��樣5!9�	�J�*t�S��Jx�\0��LvC#�£�>]���\Z\0����/L�5��������\0e=`��3m�TWȟ�Y�<z�����ܟ�U�����cA@�xwNj ;S�ɔ�|I�\0n�R�a��b��)p(�0j� b��Ҧ@TPn�\"��u�\r�Ó��]Fm�\\O�&�i�p����N��k�D0F��u�;�<�Ƴf�2?�17���9��\rX�ɢP@��&\'�@\Z����5�g� \\�B*ݴ��9�E��dPM^\\v�&�S)�Mo��j�d��N8�RI棷�IZ�O\"�LsOH����\0�i�i�i�hqO�p\0�)�9�\nx(�)�L^���	/AH){P	����P8�\'���mW��d�\"�+e\0ҵ^��l1Y��ҵ�ץ\0hD:V��Q��хzP�W�W�R��_�P�֬�ҡ��O�$F�W��J�����f?��@��|��f���%luj��!�|���� u4��;/:X����f#�8�^E���zF�v�s��lJ1@D�vqR�t☠ӊӶ�OU�vP��m9R�\"	S�\\t�,u8\0-\0F\nB3Ҕӕh%�y�^̶6�����X\\F\Z��+�:GF? ��Ѩ_H�,Dy8�q6�`��]�čJ)�6���j���\rր\'N��AQFs�L�\"�N��(�R�i֤�2��5*�\0O�p5i%�.i���\0H\rH��jd�	�[N���[�p(d&�(�dT�(�E��%��+�)�fja	�\n�5�Cr�=�״i��u$���>\\�ר�Z�|*��W�(ۑ�(�,�(� ��+�1R�v5:@GZ\0���t����v����R�iʴ�q@�ZP�8��I��-@\r��m�<�\\t��S�t�=R���3T����@\n�\0w�c_Zi��bBhU�`���1M9�u�\0��4���S�Q�i���K@a�iۖ�A�+�I�n7P\09�C)@E�1JZ3�c���N��1HZ?�\0M��)|�GY4�ۯ��_΀e.ڈ�ێ���Hڥ��\0�����O�4�j�&�h��j�uU�Cj���:\0��v�X��{X�޵x�׳\n\0ߢ��<e\0銁�k�(�<�M�k�o\Z��V��睫@�L���¼�O��\0uMD|Wt��Ҳ�}�LgA�B������+SN��I�Z�=,���D�1/�y��ԟ�ji�T��P��GW_΢:����^{�}M����J����\0w��[�*�-��¸��G�7�橓���j\0�[����D�#��a\'���&�����@\Z\r�{`1��|W<R\'���,N*��,dP\'�J�UY<H���lc�ե�}���6�d�T�O�H��}�mb���q��A�\0,��@r%��\0��T�7�ʽ-4KE�\0�c�I����@]�[���\r:��)��Կ�� �\r6�G�@d�-�tSS\r쎆�,Yƽ���2��\r���CP��{��\rz�۟J��>���N�5RO	��\r��y��*���v�r�I�֛���s^�q�J�Н���x~0�Z0xr0w(�$LU�N\0J-+�Q��!�*܉w\nl�ۇJ\0����ԁ�8�3���P�V�\r��4Ieq�H\\�n��sh�<U9,NxV�␜�,���B�0ٞ+rE�Wh�@�j[+k���V����\"���4L2h�a��9�+y�Er:~��\0c]\n�*h�C������k&���?Z\0���`�֩�B����������#5(�@�N��1LNja�@\0�f����91��V�䊎�<�9��?3~?.�\0�?�����?���V�:���	��	�\0��\0־���9�%��(�0i���\ZBۘӔf���iqK���b�-(���T�AS��ɠ\r^\\6����H��\'�$/�\rv:�n��k����\0\r?���m�u���ƯF�:��8�} �\0h��41�YFH�\\i���+^�OH�\Z\0奲t\'���d<���\0����T���@�u[f��h��ѸSpPt�6�56��o�k	 \0��C3��o!��4��J��5mF�Ep�:�W\nƺKMUd�\r��?�W�A\'9�x}h�f�I�m�W\"�ҁR�G���x\0�K�R\nq���,	�K!�@��\0jX����raئ@���0\0iڧ�-��P�^i@���H�8A�ۯJҌp(��W�Z�n:V�c�\0�jx�U�W4\0�Uu#Ϋo�PF����\r���>2b[�U��=?�ݾ���uݬ ڀ:�:{-�LGj��S���홇L���Ew�6�@Q��?mh���jM��\0n�z���\0�i\0,p*AO�P�z����H�q�)B�;\n\0���,Q����x�W]2�I��\Z�..CL�Lp�ּC�O�E�ᶅ����ꗏ�j\r*rM\r��:�XG�2:�Џ���4\0�0*u��]�5(�$Zp��@S�M�\0�R%F�\"��\ZwN��h&�ii�i���T�j jD�I�*�|�8�U�G4n%8�\0S\"�S*�q��\r�^d\'snqD����0�)�v^�ʈǓ\\��l�j������\0�TE>��ʏR4�Wy����պ��S.��\0A�;E.1I��\0h|T�٨v�ԡJ�\0V�;R��@<ՙ���W+�]���J\0��3I�կ;+�Y�U�y5_�ML@\Z��_��m\'U�V�-ҍ����7�@���?��j6�z��\0,�;O�yS�E8i����}��\Zw�8i���\nm|݅W�P�t�4�H�r�\0v�9��Ru�\rgͬ� ʃ]\\�p��Q�OQ�1�P\'\'�/�\Z�\Z�����:#�\0,��NM6Տʀ93�j�j�MWS?uZ�\r2�c�(t�b�Ŀ�\0y9�՟�8��\0��_�װ\r\Z��~U\"�/H��@<4�ZN�I���1�w���ŌKǔ?*x��\0��Ɠ�\Z���j�<~�]���1�<[���K�;�8g5:|<����s\0�(�\0�(���Ě��\0�W�yT�.�<�<	\Z�W4��X{��픃�Oz\0�#�E���~Um<f�c�ua3N�}���\0�Z��!�S��vk�%����?�F(	t;E��R.�j?���cɣ��Z\0�\ZU�<F?*�X@�#�h�\"���j\0�-b~T�fN�]�}(ٞ��(�u��#^��I�j\0��5;���`{S�\0\n\0�!���EZ�M(��;�WҬ��җg�\0T0�JO zU�����\n�d�4��>NqF	��\0R�KS�)�ހ)Ȃ�<~ՠ隅����#B�0k^h�T\'\\P,�pk6X���c�t��h;�\nc�4�8�\r+s�V�V|-�U�bh�DY�Ypx�!�4���bkb��@\"*zWG-� �Y�����Zfڴ�3M)@TF�<uE�@\0�L����1ԛO�PHe��]����;V;�� 4m�h��.�B0kb&���O��6�v\Zv�%P3@,NM[C����ե�q��m��Z�DƧV�hi�E@�R��M\0J�+H>hd_�M\"�r*Xs������\0�^ɢ��rc�;���?�t�_[(9!|��W�\"�[K�`���y���37�a��>�+�S׊l�Ɲ��@����Z\0(�sJ)h�\nY�؉����]��\Z�9[��s��5�2/7ÒD��O�r}�;�P}�E�H�@ީM^U?�5}!�� �k�\0?���\0��\\� 1*Ҍ`P�\n��r)��U�a@��#u?-b�h�I WR	�h��E\0y���	�Q�g����K�Pp+�G(IQ@� >e<Ո/^9�5��7�*=�<�Cg���	���VITnj��FA�ἒ>�\0�(�\0T�VV<���Z��]5�����4�b�\n���\0)�)<\n\0P(n<qQ�p(	M$)�����&M\0k�E��n�+.�pm[���\rd�V��U-�`V�\n3@ N�~5��/J��V�V�k�U-�hF2(D^*Ÿ��qR��h.N�5�m�\\~5�z�CTtѺ���|�����?��_�\"�����d�k�5Ko���dg@��kA�m�>Q[�9��l^N��AWP�\0b�R�@	�1KJ(@��M\"�\0\0���x����̘_�f�\\��+JG؄���{��\'rz@/����H�6��	nP�y�9;���޴o5�w˚�#`�\'T�{\n��6\0�Q���ޝm\0��\0)A�� �ԃ�\0�i���:�$��� ��H*5���	ғLSJM\09M<j%5 42ԩP�L�r!����j�C�^�b�/D�U�Z��ZA@\0\\\n܌*]�-6!�9-F-�\Z[�:����\'5+@R_��j+O��\0��S��&�[kR)�I,\n�Q�ȃ�@-�����ւK���ᇙL��jr���f��V�K�氡�IO����D���^�C���sl�&By4�ܵ��J�^����a�rۉ�Y����<�hgK�嵝F~\\ת�בj��o�xS9���z�Ct���g�\0z�ك�Q��z�h�bVL*��J�ހ0>̓Ҕ[sҷ�zS~�=( [{SŨ��_�{Q�oj\0��0��\0;V�ٽ�\Z�ڀ1d�����)^��5��A-�GJ\0���/j�C�o�i�J���=(\"�*�K�Ex���\0J��R�����5d@(���ﳊ�!\'�(?�� V��(�E\0P\n_ U����\0P�=\'��C��yCҀ3͸���8���JO+ڀ)aN�=]��@��Hc�F:B�[e!�5Y���@|�(1\n�c�����v����^]&�\0�b��\\1�LtTF)|�S��vPc4�]X)�(���K�9JM��<��e7m\0W1�Fʜ�RdP;qK�ZvE&3�\0F����hH��:\0�8Ȫ/n��2qTezPl�\08����Z�d���2�x�)�Z�95��4b\"8�H�U4**�H�8bx�b�W�S�\0+t���Z�H�F�\Z\0ʸ�#��<�8=kVNR�Y[&�+�����ݫ��/���h7� ��c �j���ހ2#�)Dg0�\Z�8�$E\0Qu+�U�� q�J�m5V�\">�\0w�f���k���r5�֗R@rI��H�w���G1��W���Yv�$���XI6�3@\Z��֦V�8��ȥjX����x\'�Mk!�|UU�54\'iǭ\0|��X�q����A�X��uO2�mKt8�@��<;���Y$)5��������f����B0~��u�g�8�\\��,���A� S�@u�\nZ\0\0�H)h���U�;m�d���1���[vd\'ޛ�Fo,f�����W��}j���GV�1@��\0Ok?�q���U��ۺ�s�/�����U����,��yk�@Z0�l�@9��Ӛ�~c@D�@�Ji�h�jL�j�Lր��� ���.H����\"9*9�~�G1��� S�t��I����[89�B�z�]w�g%EbϦ4g�@��~�8�=BXH���FpE4>8���[<5�Y_�0#&��*j���$�@��I5#(^��Zk���k���n�@��Ú�t�8�R6R�N���,kR�.�F�7[�p�(J�!�[6���F�.k�\'�.�GҴ���ۧJҁh�K�UȐUx֮Ľ(�)�U�V�xj1@��*T@��5�!��\0�|�eC�D��=���`�=�(����Z�}?�x�]�!X���?c���Z�<��I/��L�\0�S�S�v��>T�T��4\0b�R�@�P1J)E\0(Zx�Zx\0��b��V�A����9վ�a/͆��z��g�_?�Xֿ�D�{P�\\ܵ�Ԓ9�*���-a����E\0H�\'&���*5 �\0��8R-:�\nx4�K@�8\n`�N�)�)����~ZicC\Zm\0H��^j4�^�:\n�\Z����:P�W�h@��B:V�@��^��Hץ_�q@E*�^GzR9�h��\"���ΌeFkg^NEd���\0n4Q�(�`��SQ,�u����eW?0�}�9\r=���F�x4\0=�Q�g�j_5��6���n=() 򳚣x�k���m&����0���\Z�W5v��W4�ޣ[���]8�`O��D�=��\Z���U��q]��:W�xT6Wil׿i�#���\0R	�@B{U�1�(�USڞ\"�Y�Bb�*�^Ԇ���_�/�@�F�V�E�a����=�+6h0x��xr8�<G�(\'˩c���=)�0�P�n�yER����c�;eXD���\0A���>�6P(�VsN��@vQ��l���(�Ni�*�(��[mjr��m\0BR�����\0BR��)�P\n�m�)����RR�ZiZ���\Z\0�b�L�Ҁb��h��S���Gs@\r4�iY׹���?��4m����^D?�P�E!\0������h?:��8\0Ϙ(���;\Z�&�n?�U)|A\n�(Jf5NL�d\\x�!�B��|[\Zta@��flw�v����X�1��W4�=j-�z�p�����$�t��	�\0zx��\n�]D�XW�����R7�fn�h�WP�NK���{q�b��볷�0��\Z\0�����*���yKj\r�f������\0zmǈ�^C\n̹�TL0�\r��3U��ܵ\0w��b�d�]�j�j�9��H*kcA�#� \'���5�qҠ�&N��ѵ�k�tc .{V���eʌ�0��r*���]���sd���!�J�\0}���T�PR=*����4��y�3����G���]͕�ܠ;��x�H`m�[zG��T��(�U��\r^������^+�x$�А(��@\ZH��s6�Ȫ��[\r�PO�lWV���Ew,�\0*�#�72xK��C?�������(E|!�Co��/\"M�e�q�@zxz�j���$���3���z�j~�Q&��;פ����\nsN��Ju\0(���\0g5GT�\0�V�Uժz���6=(���WR�q�Y��e`x9�1H9�@��mu\rȋ�_.�5����5�U�#S���p�W˞1ћO���m]�Ϡ$�VU6�dK���>c@\"�OۚX����\0p(\"�Ѱ�PE<P�\0�\'�X������Rh�*�ZK�<T���Y��n�EN`��m	$^�@cȪ7�08砕��{���hx$����f�nGJ\0����Q���!X�4��^X��Y�\0z+O�&G�@2ƙi�D9�W-��t�vq+~�,T,�q[v�{P�t�V��|�F�>�n�^(�	Z�V�O�_�P�֯D�Z5��P�ץZ�b��cb1@#�RH�)�:b�n��(܌���v�\'\\�)�#{\n\0�~$_�*��k?��XA)k����o�8cl���v^�&�	ٸr(qQ#���(�QE\08R�ANZ\0z��N��~�TSHP`\n\0�<K����vc����I�>���I$�q������!}��|���,���@J\0��:�0�*p(ʴ�(��S�H��\0)@�R�\np�Ҋ\0x�\n`�g�\0V4��iT��R��T�@#�p������/��+B�R�\nЀb�- �W�^*�c�_���\\S�⇦�����Y�.V��d�������*���E\0Ng���w�\\b��b�.������f����)��-ִ`�lry�xx�o��)|s���&�Mr���1d5FV��d�\nf�!d��JnM���ϖ�A�9�����FA�5�O��Մy9 W�Ӧ\\2��W�a���]����H��:5������j@��h<QRm��@R�M���\0Utt����Z�Nx��\0Ñ9���W������m���V��i(Go�.�jj��/�(������w\"���(s��i7ć%��Q�����@�i�Oj��ۯ�΢}V�ua���wri�Eg��j�\\~uZM~�s�΀4�OjA�V+���G��V��V�х\0t,\r �r�x�?�\n�/��~�َE���&���<n�\Z\0��\"���1Յy���SК��+�L�\0z���z���Q�<0�):��~��Y���4�rj�\'�ΪI�ۯ�μ�]VῈ�V�����Uoہ���U��0���>dǫ���o�\0��<[�\'�1��թ\\����O\Z0�j��4��+���FsP�\rҀ:g�������5��������7ē�;�V�]�n�k,����>�e�{��3��-����(ޔ͌N\0���s�f�k�OW5;ZJ��f�Sڀ(O4�>���V�ҥn���t�ʽ~jΙFz�_�\0���\ZkxFF�(�r��Db���v��=EX���Z�8%�\rL����H�����h�^�GA@b�6~U��5�����`��U�(��?Ҁ<�4�?pԟ�� }�^��$�?Ң��P>X�J\0��M����S&�#����[;�~X�Jh��:F*\0Ï���R2:��iy��kF[�t���M�J�;Gj�t�*(�����e8pj�xq�z�Wk$wi���`R�q������9�l�T���\0gͦ+g�͟I�Հ\Z���0�\Zm��q�2TW{%�OJ�5��6�<�ڸ8e&�����t`��)t�v�v�^�h�ѯ��]C1�z^����1��0�Zv⤶�Kgg�=݃(lՔ��r�\Z��RknC�hb6Q_?��^:����cˠݜW�Eq�*���\"�t��y1������Ja��d�q�k��.��j�?@i��Gq&c�Ix�:��:U�j:M��$�	�\0k����*��R(aKL�4\0�;�7�}�}*u���q��ǵ\0y^�/�zW8楷�泼N�D����ޣ�\0鬮A��k��\'�x^+O\nr9\'��/�r\rI�[���*��4��dh��jp��O�/��2����cp������2-\0(��R���m�qI�\0�W��i�jHր%AS)�5�v1@#<ԋ�����7����Eb�\Zz�l�k�_�f��K����\0�vl,*Ōy�Q��w5��ۗ �@-�>X��(��+:���Y���\0�m#�ٶ���Eҵ��0G�ⴭ���.�Xf1V��1-\\�<�\0�\n�*�/J��V�y�	��J*�aE\0K����@^s�D�p�\0W��ԗ[Y$n>SN�3,��k�����s\"�	�%�7�$�.���B�l@p0+�,]��U��~�\0�O�{\n\0�Q�԰����*E458t�N\0�OZ�\Zz���MӨ\0��R����ɬ�ja�p��\nh忏~$/y�F����{\rkj�cZ�Σ�N��\Z�b��/4�v:�K�&�#�C�ח�r�r��ذ����#df�ֹ�Mr2�1�H5��E\0h*�K�ޢ�`���h�^)7ڞ���/z\0�sN�(�PN)1K@h��\0H��F*<b�-D:U�FqUa^���r�U薠�8z4�	�^��`qQĜT������4�Ҟ�,D�7�d9�������)��)yTP�A����d�8�E\0c��⳦V���g��\0djH�jg��G�\0[�NkY:UX��Z\n8��G�5��w���d\Z��W�(34�)�9�0��|�	����FPM\0UH�kc�w�a���j�#wݢ�����	�>�Ү͔L9ȫ�W/���w� �+��\0)qH�h�NFhqF(��Q�(�\"��2\rM���E\0cܧZ�qɭk�\"��Ṡ��9�1ɨdp�I�-KWX�\0�Nڼq!%��?���zWs�K3aI�T��d��@mǌ�����񔧣\Z�Y7�)�\"�7��m�/j�����\0����*�Fs�M\0i�\\��\Z�����#��E��E4<��\Z\0��7��1��=X�u\n���Y��Ip@��=X�u9a��k@h�������&#$\Z\0�٥�8�\0�ɮ�|;#���<�\0�YF9�@ѩ<f���BÚ���\0p�XsHx�\rv7^T�*�i	�P3�O���JW�5�����\r�*�ӭW���8��M�s�Mw���\0��E��袀81cpx�y���rH85߈aaEHСtP�2�H5�8nk�{pˀ��.�#�Tq@�ZA�\r�j=\r�b�F�0_��Lm&��4�4��)�en=+E�k��M���=s@���z�Hb�\0����m���]A���۲�6����+��@���Sb�/\\P*�D�(kGo���ŧZ/aS�kd@7�u���RŦ݃��h+�\n�^1�\n\0��N�\'��*�z\\Ǫ�Pd��(�lP:4Y�ԫ��y��\\(���#<����u�\0�G���ny�:SM\0�\Z9�S�B�tQZ�zN)\r�~��4x���ki1t~U�o���#�(<�Qt~U�Q�\0tU�5S�P��+�9W��Q��(���M)��\0\\��j�*3�����=��N�@b�v�\Z��<Vq�q��M�u�\rB�5,5s�u6z��k~�~j\0�u���a�XSc��T�9�\n�7��MF�t(\'4�RzPD�\0t���^k�ޥ`�P�h�\"�-ݗ\0ց�OZ�ہҀ��jh�f���-�=I^��¾<x,��jv)�C����\r�Դ��_/��[�i��Mż������<5y7�_<7���~3ӭ\0}r$�>���L�.��ūYC5���Z*�(A5 ���L\n\0�v�b�ݰ=�!;�E l�\n\0�A��\\z�/cxqֻ߈�l�� ��,.B�7�\0v��^`5�����k�����<V��ێs@��_	��_~+�2�Q_J\\A�f�0��WŞ�G�f*J��\0�*P����*eL�\Z\0hRl�+��S�f� �K�Հ����\n�je��E�i�J���K��	�z��*�5+��*~	��I!�@\r,��wW\'��	����j��R3�sc|�s�h��(��\Z~Vv���H�Ev�6~\\`P�V�#�݂.\0�V����{{r9�	-���kx�U{x��Hc�(xc������U����%hC�W�#Z.(T^�aW�F�sVPt�	#:��*a@\n0�7m\rH�A^S�	@���C�W��L׍��B��q^����o�sr�aOZ��|I�/$���\Z\0��վ\'Bz��I�\0�8ǰ�\Z�Sl���eј5�A@���f�)�*�`��U+�\0��\r0Ӂ��z��5=(u�Ji�JN(6<�%���g�σ�����-^{�j�C��OQ@��n���0H,k!�t\"�&M>9�w e�2���fJ\n\0�\"�Z���u�I$\n�m%��4��x&�-uI �I������:�/�|��5x�#$W��*p�r����hԢ��@0E<�x��^��k��֖@9�\r�ҝ���n�T�C\r\0-.8��\0�\0Jr�i6ӗ�Ҁ\'E�ę�#�U�#�\'�1��\0�U�Lb�D����W�^*�*x�(���\0X�T��B�������q�Q^��BEL�&�uy�R(���jޕ�ST��2Mnxzͮ/נ4�G�\Z��Ҋ�#��{Q@`�\"�J����ls@$�=�\"����F�4\0��޵a[��h�@� �=u��oݎ\ra\\�&�(��+-=W�qZ\0`\\�&܌U�_����͊j��_��P<y����Y�e���5�Cּ��鷼T\'׼D��V�\0HF�@�^��\0:�(��E\0�b�ڂh�\n7C�cO��5�p8�[� (��/�� \Z⧻i�9�mnrf*Ma�ɠ\0q�֥�O���\Z,b3�\0�]���ƨ���\0�<6�V�����H�� DQ�T��\n\0�G�\0\"�����Q��r)L�P?�`���shV���rj2��&�8MkIHe�k�Z\Z%�,��\n��(�ۖk��Ԛ��(��[Bz*�jv���W36�Y�Z���±;��7��\0\0��q�Z�3aں+MB�\\\0/<���ߖ�Vʹʙ\\\Zy�����I ��4�Ns]��aN[F�(\r��W�|Ve��+�KE=j_����}�zP,�]�QI�(�!`3ҥ#ҵ�5\0���3@~Ƣ���*�zTeX�MlpqQ�D}[5+��q�Wh��I�\n���VhK�s7�>�݊�+cV�^�#�J�_@x�%�z\0�?��0��Ѷ�A�\0�ּ�=;�9�[z|�\"�\rFI˚a�w=M3Ou�+b8A��@#Y��S�������zT�G�\0f,2��n��!9�N�\0f֝�I�Z\"#�K�J\0��$��6�W���G���@\n7�0�޵��c�M�)���Te	�Z���7����Гڢh\rn}��}�ڀ9�-��@�ǰ����v�Ο�@��	�O[3�]��(��\0`��\0��Տj�[5�f;E���\'�<i�=+�[e�����\0sGL\'�7�(�q]ZZ��Hm�(�KW����\r�U���{Ui�@?(��qO\rR���H��P* qR�b����h�����*R��\"z�3�К�ߊ�X�k�t�4c ��n�*Ǹ��(�=���9�,�C��\r�jm���]��>`@��O���H���.�\r����h�KE��\"�s@�R�PE[6�Y�H����b\',�������H��@�S�@^2��f���_>�f��s_M�����Ԍ���όt�՝�as@�.���,.�`f�($�֍��@�=(���10l՟h��k6I��t��0\0��4��|��M\0x��I��::�3P��1k��e�e��M\n�ּ���m>c�@Ҁ$#�I��1P�ޜ��\0�R�T�:�c�6R*�	G�@��4�*g!Mg\\�)rhy&HW,y�wV�8*���z�;��	.ߜ�\0�H���t\Zv�eeb)�~�A���5�\0�\0Gmd#QZ�FF1LH�5�k8Ƞ	-�5�l���[�\0U�c�X\"����P@��\Zt�	b��ĝ*(��ĜPЩ�h���*�-\0J��E�F*��V��R��v�@���J�\Z/��zTQ�l�U���#|�P˟����L�m>7�<`\Z��\Z��@af���a�S�3j����&�~�7�6����C�>���̕���דhW|�ʇ �^��>�ր:e;Z�-���*�l6��iƣSN=(�֧J�\rL��,�#r)�i�x�OZ򏌷�!sڽa�׋�b��8�\0x�9#5n5�Ch��\rN��\Z�k+a���{����Z��I➤�\0\0qZ�J�ǹ���ש��V}֐���0�T�)3�]���6���-Ό�d�����&�Gta�U$���RF���@\Z��ā�<WCi�p75q�UO�;\'�4�j1��U�tu�O5�v�����kv�\\*F��\0vQ�:�뷽a��	69�h%I1�\0]�sҮ�6���]�2�r���b���b�D��-D�W`\\Uh�\'u�P�.sJ���~c@\r��\\�6_����P��rr%4\0���+�����[��@d�F+ּ/e�@�����|�����$SH��kPdP�A4�hu9�^*%8�7�P;Ŭ;�����vsYK��4\Z�iJ@N��\Z�\n\0�(Z\0���Q���VO\n��\'&�.�v����`d��:L�m�gھi�&�q�_A�B���I�\0t)s�.ihJZ(��(����)1��\0W��� ִ���{����ĭ�cֱ�R�[~&&$W3���@O��7>��(�%\"����.Oz��e�\n�P�ˑHn\n����C8&�\'�A<�f�Bd�*��\0���u^�\Z���B�G�h��~��<�(�85gQ��d\'5�spFph+�±�e;���Ӧ>a��\'\0b��\0����X���\r��UR��i��1@��x�nXݹ�^�i2Mq�������O\"����F�Er�/�\0z�@9�S�o�eE2���2Eh�\0a�2��T���V�������v���5�b�0�=(��i�e>��S�S6P_ٰ9y V��\Zo����%}*,�ⵍ��0E\0d,q�*°u�nC^��}�s�ٔ�@`m�1�&����o�y4���\\,�.�VE�\0&�r(5�Y�1���Gfc���I��U4�\r��a`$t�p�Y�Cl��\0g-��<�qҵM�1�O�/�\0��ҝ�j��Ҥ���1n=)\r����ľ� ����}��R���WG�X�j>̞��}��Կa������Mhtϋj_�{VэED�\0/J\0�kM�EF�Jѓ��U�\0(=��l\n�)��V>�\0��Մ5S<�R��@�^95]��[40|ӹ5����d4ҙ�Sn��@\Z {UIa�Z�B�@,��A���hG5J[l1\"�#F���7�Jts��@���*H��I��0q�J��P���1�CVA�a֠wZ�_h��c����C;י�����\0�i���^��E��}nb�A�@\Z�oaQ��u��;��*���r�L:l��g��N��:�\0�m��Z��cCt���G�h�pz����jf�y�x�G���͂jN��>[�v�}����J��+Rx�Dk;��HL�<L��fq@\r���k��u\"J�<W�m�ո/�0�s@�gq�{[\\ߊ|#\r�M4\n7c<St�ID`f�[�0�܃@5��N����`���g��ר�*��+ϵ\r�͘�;GJ\0�	�P��n��d�{��\\�(�8��Bɬ��}+�/5Yg�	�\rK�t�k���i��5v�\\?͞kj�ER\"�(X��Xf�{\r)c\0�W,tŉkEn\0�@�n�\0\n����t��\0qW��1@\r�q�j�B*��0+B��GW ���6$>�z\'�\0K|���Tp�5z4�]*�K�)��XT�\0�5�VUj��V�(X֤<S\"$}�L�\rå\0�������V��x�z\0hʂà�S]�3M�=+oW��,L�FH�4������K�ɭ�jq�3�5����?��NTe��k��Ko��I���s_|�q>��6�g`m��=��F�o4[vv���sҥ�jE|m�\'��;�N0M}w��+ƞY��\0�%�\Z��mf)�wJ�X�>�}M8�1�qR��Z�MW��ր,�4�ҡV�9�\0!�k�~2F|���p�����7E�Ҁ<Z��1V��QāTm��\02:���Ji�22i�\0pQN(\0R�\n\0c��uV[�*�i�y�\0sw�0%V���%�\'h5�d0j	,��P�<L���DXWuu���TV\r��IPh(=)�a�ԯg$\'�i�6pE\0Mor��kv�Xt 15��W\"�q@ޟ�+��Ke|�.T���IA�5�e�Ko�	�R�pح8@�M���uV:�I��@,dSF7\Z�o<n\"�����E��j\"��\0-V�PXP�<�=V�\\�,k�6M,�5�ĿJ�%§9�\r��Ip���,![�8�CZ�^A�v�, �c�\0�a��Π��h�3f�D�C�]��%/O^j�j�7\0P�������\r\02L��m��Z�Ȭۡɠ�9��@��P\0��p@�Q�\"�\"�(��9CZ�O��~v����׊6�^���*��V���h+�\r �@��(\0��(\04��M1���/rsZS5fܜ�<��rMqA���C�Dc�c^o+\0ƀ54{�.�y�^�aq�@�ڼ^�]�*}���;����\0t^n)�6*�����ր-����RI��U��x4���\0��^M`���W.f����\'4�s.	���ɫ�G�5� ɠ\n�j6�NR�R�!ZV\0�R����[\"�����Y	5#&j!\r\0{\'��F�Q$n�ע.��k�jriwhI f��Ú�jvh��@�\r�d斣i��y������S|�O���<�O��c�P�(���G�*J(���*��9�3^��d^+�\'Z��n\"9�<�,��Mo�(#�\\�b6�S~G�\0v�T�*���\Z����\Z���]�2	h��.��Pmp(��\0f����:PEP\0j\'5)�P�4=j���N{�y;�g5ZCS�U��\n���Y�̕\\�h֜��G4�@�T���e�P��i�j\0٩���)�N��e�(<�r��5t�Eހ3���b#�lI*���@crjt��xCb���Z\0��:ɚ��MJ��ր4��T�02k1\'�f��W�%��S��*h�\'9�>b��3�gC�Z��=3U�!�T@�<PA���S3_����k�1�ZjDˌ����$s�4ѯ8��h��V�Q�=k黻D���~x���&��y`S���mg�v��ao���Oiu��gK\r�M�X�Oӯ��kV�Z��0,��zN�<,Lֽ���S9�\0z����Y�u�hH-5H���_;�-�3��+���Iu�$�P����3�}��uMS�f�V�I|Y!\0Lr*S��\\.&�I>��-a<���`�Jѳ�.$��oʽYƗ+��%�V퍄¿�\0y�dL��R-)�}��W�=�*��d�´��e\"��5i-�uS]�,�c��e��	�z�_o$SС�\n\0�a�Z�<\Zzǚ�(��0G���EP��~�\0Iuv8��D���Pƕn$�G\Z���\0HT(��4�R�U�c\n9�\0.\rg��I�ӽX�f\'N���2u����;�Z���i$�0����Zt4��^�#ǭ��ֶo�ph��y����7z�ݦ��C�f�N=�7�w�Ҳ�nl��P���d��x����-�f��S.�ڳ4?��%�s�]���R���kP��w|tV@��e�:��_��iPM�;Fq\\o��\0�I�ض��Ǚ�nʊ���d�΢�>�Jmm�5\0}��\\	�!��k)��5r:U��Cͻe�+��@@ ��m�X\r�e�/#���q@A���WW���.��Mڪ��d(c\"������z�5�|I��E�8�\0|�j�51EL�y3:�1F�h!��OZy����9��4���+@\09�4(���\02�q�P��r�)�FhOJ\0̹�c�8�nt-����mR$�q@{&�$}T�A5�iQ�8Fo\r��V�989�j�L��&�$g�5Y�$���@;��k^��H���lYR2*�8j\0��u�M��އ�Pk�XI�z/�h��_2�)�>t�6I8�iNM]�S)E\0>A�~�t��^�՝j-#@��Uާ�>��)��	�E�c�uk�BFy�9%]�5����Y`�����Ec�C����:Uv<�^~h�3@���oJ�̦<��!�ԑ��U��H�\r�J�jݻ�*���@j2���K�\ZS@�SҜG�\0a\n���B�;k��yz��	8�&\\�j������A��>���F��R��m̵���Ԫ(�QE\0��A��\0c51��Y\r@��\0C1����W%j�pz�)�m[k˧l9ֽO^���^U�|�\rۚ\0lm�E>������ט��]��g�������#�PG(�A�/�@��[DY��s�8�����?\\<v�^i=���4�z��!�Q�Ɂ�X���d�Կl��2%mĚ�㚹0��a@�Fs���M��#eSsRc�&�\0c�Vbs�XaQ�@�F^���޷�:�#��>u��gJ�:}�>����l�����\"���𾦺���@��E\0:�L�K@����(�4��(�S���◱����9�X��PG� ��C��΄�[�� �c���iW�H�&��l�Z�M��\0\'�\0w���⡶�K\"�h7{R斊\0L��E\0QHh\0=*�MB�\"cU���A!�h�Uy*��Y{�g	�ګ�@�ɢ�E\0=zԢ��*���CQ�H�*�Ry��E\0J\r;5��\0�a\'=)�\0��5ZH�WMD���W�3n�vQ��VҀ xUw�#���j�D�\0b�(�5\n���n������J\0H��Vc�d�5�5��P�<G4�$�x�HT0��r��jd���4�	S�^���m�a&��֦[Ո�S@����֩�1jv�J�lQmv���<Ռ�*h�5_��[1�JɛGG8���W�j�Lwq�U���L0�{��\\�|��\Z~�Gg*.\n~��Of;�j#d��\0qpY����*_�(�����ײ�>���\0rmdO��}�b��a��X{P4�\'�JSj㡮��H\n��ڀ2b�Aޭ(u�jр��݄Pk$��5j6f�j%Oj�Wev3V�\n��*�>x�\0[EnE���\"�4\"AV�5R*��E\0_��(��U���R�ɤX�W-��8�	m�\\����i����MM�܎(�E�䊞Y#�R�PzI�KXZG *��o�_Jo��n\r\0C�G�\0]�vRg��������s1�AG�f3�1bNy���P�:\n\0n�w��*ɐF1Scp��FCq@Y[|o�V��y�v���V$9jV@y�\0��+�6����߰eq�k�/����5?��Hq�+����G+�ݵ���Yj1��2���G����O�d�:\0�c^�m!\0�=\r|��/7��a�h�Tn�Uk�>|D�V���Qm�(�4�8㚸�CX�(`g ��i1��\0i���U1!,3ҭnM�i�-D�*��b>\r]�NE\0\\\0qX-�\Zt�8��9�/�Ė�������U#�qֺOi�\rJG�k��c�\0A���0/5`q�~��k)�[)\n�B�RV�A��(\n)씛M\07eH�R��X��P�g�N��~�e#�eM]�r9E�\\H������C6��;kY\"�(�4��h��J���,M�\rz`�~e�E!���<�c�`m5n+y�\n��vɢ���+B�BP�)�@���qr@d8�Wq��X.֑kv�MH����oAU\0PvQZ���p��Q$;���˙� T\Z\0��]�5�j�\"ᛞkc\\�R5`���\r=��K#dP�ɢ��sQ@@��p)I\0TN��iqQy��E#f����-��\n��|Ry�-\0lؾ�S�/��˺LV���(�i\r9�cI@	��LS�Rb�\ZE1�JG�1�\0W�q�3E���Q�کeRET�>U�7�\0}\'���i񷰭:�7���}�t\rҀ�nM!|P\0�f��f�����J��Q#�wz\0d�T�n��ez�<�P.�7B�J�g䝾�����}+�|A����v��u��8�޺�	M��(����j0� �6E\0a��?2��Ҽ�:-¡��V�\"[6}+�. ƨ�?�@���,�������hh��V���U���(1�j&Z�Sj7Z\0�V�V��M+@젮*m��\n��-Ze��8�\n�Ҫ�d��QW@��T����7֌n�H�x潄���͚%����f��\0A���89�4��N��\Z\0Z)��u\0QE\0QE\0QE\0#J\0��OJ\0N\\��,8.������\"kW��@i܊X$1��It�T�=�20P���By�n����!s]�gr�EPEPHii\r\0 ��8S\\�v�U��[z�(��R3U�qV�����\n�*����«H(�b�z�P�J��j i�ր\'��Z�h����Q@�L�(���h�\Z��jJi������$�c���SrM\0R�v�)�M��K\"n�\Z:\0ٴU����������N3�m�*��@���g��%�y�u�l�tN[<g�\0�\Z�t�W�ˮ+��N� UIm���i�t隉�Q��+�h�M[�9������4�H\\�����n�qWc��8(��|�P\\ۤ�p��Zv��-���=��H�ZcFj\0�6��L�7�n�Pi�d��m���k�[��zSZ�zP:֞�Zں7��P�@{P5%����f}+�k<��}�zP2,�(6����Q��{P=�OX�0�>�j_�{PXS�Y�E_[j�;j\0d\0�U���X�0:U�x0zP�~(�R��^�(\0�,⭦\0�65�HO���R���K��`Um[\\�ҡf�� t�x��|m6�+�h�/��\r|Ga�Zٱ�#�^Tн�in����V��Γͺ%�ޝ/$*\n\0��am������=�ܱ��a ɠ	��mMXA�jc`\Z\0�E�R1S.��PyA\\��d`��T�����Sw�s@�����\r�Z�Ҧ�n��b�@9���D��\'J�iw�e;�q�o��R��GקCw�\r1ھr`a!�2�J�|3�٬�R�=�\0{bM�-V��\\���/��q��[�6�P��X������Y�^hj&ȧ�ې��R�n*����\0�\ZN7H�^uj>�j����ն��^-���c3�h2HF��6�z�Ú6�l1Q5N�Q�P&�jB�ѳ4�����^�L��8�\"��L��@\ZU�J\"���T\0蒭��Q�Y	�\0|b�\0T)�L����N����&��`PZ��G��¡FG5Z� \0�`��,(�Y��Q�y��s@#�jM`j�i3�b�on�cl�`W����g�Oϱ�_���fX_�{L�ݿ�\\�����$�j�1*�\n���kI�����z(�-�B�B��@y\0�Z�+\n�Ij�ɹ�\0]��S\r��T�~*6�l�\r�\"�y���<ȁ��i�g��@�o�S�@rBA�BWr~\rV\"�\Z\r)��\0��I��x�0�ϐm�O�_zϸȑO�\0{߀�v��J���q?�Ζ�ڻ��ۊ��R��Y��\0{�@�`R;�gz\0Y%��&E5Wg���Tg�H����\0e_���ڼ���$�^�|~�y��[���@�|��E�W�p���7�孯\rˋ����g�_qOS�����4�T��P}U��p�q^S�����^��1�J�4�M���?��=R�v鑯|VTɲC���v��JʸB�@gNx��1W%]�j���\0�ni�qR�H�h=)�i\n�Df�d5c�8�\n�:�H�8����D�0GZ�/�����@���y���<\r�}��P�s@�>Q����&�\\w�|�\0��-1_vi�\0QE\0QE\0QE\0Rb��\0J�T�/��(�8׭�	��z�c�s]w�m��|WT�\0O�]��u��k��$[�⼪8���w�ϙ\n�=(p��\nSҀ\n)������@EF�5)��v�$�.3U��+���U��Ue�@��y5e�@�+����0�b��h�9G4 5\"�F=h@sJ)�b�8��Ҙ)�\0(��Q@�3IE\0ޑ��KHh&Z��jb*21@�l9��(E5�5E@\Z�����WM�r��X�:R�N��:Ҋ�U\'��Ȭhu7S�5�o�!r(��,������F+�K�g��9R�9����0���+V[\":\n�%��\0�}�)�wi�jU�\0@��R;U��(=(�$v���&0H�یq@.\r.�iZ):��0�|��T��&�@\r�0��U�ޝ䆠��\'���T�҈P@���}�ڵvښ@�(�Z��V�Z����\0��g�U���#�AVQ�PGњ��1J�	�����_��xaE\0tsO��+��y�#ğ`�G�؍�2+���.o�,@�5�<�9�Ė>�sX�\r��9�#\'ֳ�`\r��T�9�H�N(�JYP�H���zG�\nѯ���V<��p)EN�8�*Z̸�\r�Z�ʚȹ_�\Z\0|\r��99�`N*��\0�DzҀ�FG�Nn)�\0��=*�Р�VZ��\0 *\0T-�r�i��\\�4����p=��4G8X�`��/?0��3I%�PӚv�\r�Wև����_9�2��eWs��^����\\g�@���x�Hd���/��PbaZq\\2aE\0nK\Z�e[�ך����!i#^+� \'f�5N�\0e�#4�2�mܣ\nn+���v�ErjT�E\0Po�7nj����P�Jh��ڛ�`��i�*\0��R�M<CҀ#X�S�U*E�N��<U�ךzǚ�#\0����F�P�@\n�5\"��\0T�[��k XdP{{rHȭ�KL\0H���\0+F8\0Z\0l����0)��A�Gj���?�5V��H�K<�������[h�<q�gǭ\0W񯉓N�q�93^	��ϩܙ�Rj֫�\\kWm$�Ly�Tp(h�R��]�|��T6�j�`\0/��E\0u&J�G�W3Tm-\0,��BZ���y1@����S^Z��hŴ�\\�s޽CI�Ͱ_�y&�H�Z��K���\0Mt�cUXqW�W��(,dP��ZLP�n)���\0�\rS�N3�W��������=��.k��?d�\0E�<�4+�Vv��⫼����ZF���Vy3�\0J��I#f��P��Yd���H�Rf4B��5�)?9�F�<כx���9��-j�/��>��������v�Z\0���S�R���ɛt�S��h\0�*ѰoJ�t�H�Q��V�줆ҹ�iR\r�@�\0{#Ұfr$#�o��P}+*D�4�7=j����q��T��`SH�)��HE:�\0f)qO=i1�\0��D��Y+Q��\nL��d���Ԏ*��� �����7z.��$\n��N+�~�HU��Sni�Z\0(��\0(��\0(��\0(��\0(��@ڵ����kΚ��^�:��pZ�E����I Vׇ.ϛ���ʕ9���6\\�P����R����j�h\0�u3?=>�\n(��\ni�\r\0@�]�ˊ���Y[j�\'Z\0��P�Ւ3Q��\n�i��1�H�\0E��V��U\0N��PS���)E\08S�4S�J\0P(�(��b��\0B))��@\r\"�EII�\0��0�9��TL��XQ4+֧hȦm4]�@�09��dsP��@w�\Z��џ��q�б.\0tP�))���	�Q\\|�/��LK��<�\0�d��*��|YPkM��B-r�#4!V�&�Z���MЊ��G@��P��=*ѳ���܊\0r���9�VUr��	J�����ֵ\"�[��h7�z�C���$X�T}�d���(����-�ɹ�����x@���\n\"\'���J�]R��2�|Sa~e��g-�S��W�\"�ۯ[\0|���x�C�(���ymo��VF���k(���1��\r��?1���\'��\0X�:=s�7E�p}+��y�դ�b��2B�\Z\0˕D|�j�99�W�U���-�\0J��T��5z8Nګrph�2��*ی\n���i�\"�)�\"���b�$|��\\\Z\0�F�\\�/Z��VTܽ\0On�1Ze�J��,*\"*v�Z�#j��a�Ug<�2*�V�t��r�&�-U���#5}��ȪI�@�%s���{7\r)�2W�Ep�5\0v�\Z�ܶl�+�W��.��Uˍ�Z��r��a�\\i�\n����-.��\0Fզ�ػ��|?�\nH�p=��4O�j�*�]�ހ4o-��B+�ִ�nI^�d\0o*k>��o�$��J�I�HC�+gU�\r���Y�vpE\0Tm�A���\rҚV�+��8E��0���#�R����OH�h4�U\'�Z��=��69=(>8Y�UȬ��Z����~+01�\0P����Z���c5f`;U��=��S$g5,p�9��*h�Lc5Vf�w�ڣ�7S��B��\0��y��\'%�o���\r\0t�8��h�[��q�\r|�y��kWo%˒��5N�Q��\'i�rrz\ZHف��� ��(��dS(�Oi��	��y1T���ޫ=�OZ\0��=�϶{�@�jc5F^��@\n�TN��;T/&(\0v#�B�i\ZL�c7����^�૯: �s��韽v>\0����{��\\�%�X��~;V���r;�IL�h<`qM�Hy�M�IO\"��\0c(*sU�\\��٫G��%/�@ρ�t�Es�^m����l�\0���.F)����ހ	d�V2sI+�ƀ#�E�j7z�����Ni8�$z�3�@���+��N������מ���s@�#H\0ܧֲKdV����)��S�l@�J$|*_\'ҒI9��d\0}+\Z�PPUޫ����lzWgz�Y�I�*\0�؛u�g�Ve���V��ͥ���θj\0�8�Rj��j���!�4�SH��S��`R��%#(>i�K�k-\0WeZh�U�Z�� �O���ʿ�����f0t5�Ɓvl�9�Z��L�ϱ��E\0\\��9�PEPEPEPEPEP\\�`��]w�V.�o��⧵�r�:�6ረ��P�i2y��V�C�axzm����=E\0&�u\'zZ\0(��\0(=(�����e�N�\n\0�\"�U�jԢ���\n��J��S��eh\"�͠T�sL+@l��h�E(Zv�v�\0f�N\n.�pZ\0h��R�@\r�.)ؤ�b�(\0�&-\0�(�)������y�(&�jB)�P$��.j�J���+2b�eȫ,�/_`�*r�Z\0��\rD`�	�%j7$p(�4���j�Z��Ԛ�T��TM\0nE�����_O��k�1�T\09�4߮�f�qN:��w�m�zQ4�������\'PIyh��\n��>��<�rƀ;��Z�V�Y�@v�\\O�)<�QL�Òhz��@J��z�Ƴ�VEըw�5S쨭�\0_�_���~u3O;|�ߝ&�T⦶S�\0���}�I�\n�o�(�t�a�K��##�j���ED��3��g�CV��5V4ɠ	���u�7V�\\%e\\�\0-��*�F6�ku�3V�dP	���:��<�zǴP-f8�����*�.M\0X�p)��Tai�q@�T�nj�@�⪹欹�7ޠ��5S�V85\"��4̈́5�	y9���$T1�9�	1�����<�x�(h(�8��Z��\nB�Z\0���Ԗ^&��.���}j�Dy���~��>��\r�$7�3�rkҭu[{�f�H>��O-���a�]/��!_h� �B��\0}?yf����~�CC��g�_�u�����c��Qa�H%`h�m5�c�i?������:62����h�\Z\\��\n�4�xWX�%z�Se�@�zi\'��_�Iq[kf=*u�=�\"=;oj���Ru�	\Z��\0S�ߞ�d[�p*���dS�L}Fh\"!�j�ΪB�2I�Q�0O�r��\0�l4Dm�)a�@L��)gpW%�Xi��2.�=k�<]��[I�N\ry&��˝^Fy% �@���\0�Wr<vnv7\Z����3��5���0�f��j��\'�	���$�O�J�+���r\0v�-׋el�&�=JK����ΫK�D���y�&�rA\'�W�	4�7\Z����Y5�\rrց�\0�5��n4{�EW�χ�\0�2�Tm%W.i�&;��%V��(�DϾ�ɊkI�P�9�ɠ����w�k���MaHi�|���#���,�{Ta�V{��i�$�\0iӣ*s��p&�*\Zm)<Ss@\nx�\'4�����J�O�R�d�l�����������\r�ܳ�Ҁ\Z�ɨ$zd�rj��@w�F͊���3�P�\n�����ޣg�	UIZ�+��+�s@�oּ�į��_�^w�G˜Pt6���kq�Z�7K��LI1})�%E��i�Jc6:�KɀWϥpp]���u��s�b��y�ܱ�b$�\0\0}Y������誓�	��RO7D���(�1�\0e�֪H9����I(SH�)��m�m<Q@�HV�����R␂h�-F¬}*9�@\01���������.r@������z����$	�(���E\0QE\0QE\0QE\0QE\0QA��9�z�~e�\n�NE6E��@gr<��{�y��U�mwm�ީ�S�����3t�zW���(��?(�\0;�E\0QE\0PzQHzP\Z�aRSM\0W�T,*̣����+�ɦ���h�9��h��jLQ��#�NN�iB����~(�\03��R�ҵ&)q@m�mK�j(-����G�\0B)1N\"�@	�i��\Z\0��i#S���c\n��f�!\"�Ê��0�\0��FV�5�\n�q�<�J�!`@��Q�`PR	�hO�Z\"�`h��b�ۊ��j&S@;)�@GJ��#�M(1@:����^��P��x�����\Z���kJ8w���X�h��/5jԎ)�^x������\0��Ҽ��S���M+R�I�\0��jF��9���\0̛�M�`��Ԁh�}ڠ�nl���R(�\0W�hS�I.;U}ؠ	��;aj�c�)e��\0P��\'�땪Ӓ�qW`A�\0��\n���9�!�Pd�T-R��n�\0��UX��fC�U~�\0$敟jӐ�sUn���\"s��U�V�OSK#`q@&�� T�Q��եU@j6r�Jq��̸���\0pj�����܎�\\�3@��6*�E��n�猻pi�g���@�i��{y\n�Z�|9�J�JeYݝG�y䅤l���*&0	��4_�6w���7�v�g�4��3:���y�ۢ���՘5�B�|�\rǽ\0}ҷ�l�1�)ϽN�؏���k�>%j�$fw {֬����ހ>�h�,px��(z�|s\'�-u\0�j�ߵ��7P����d�~4�/��^�F=��;��?V�#8�a]|k�/�A,�>����\0�4{$%�Pc���5�\0�z^�b�d#��ŗ~,�5C����j�����v|��\0��ߴ+]���m� דk��bR�V`}랏G2�=_��1�\0�ג��䚎i�6�,��M)p*�:|k��4�Kg�N��ا&�q�dע5�@p��k����_9�m1;�i�������8�t�U��%��`4��d-)��3�\0ŇN1�T�\\);s[�r�m����h���讳���(��ͦ3��U��n�\0��=�UzS�0=��oJ��P���@�u�Y\\J��j�I�T�nLG���^�?d�<WCp��g�y��us$�=�էO���7I��f_�5h\0&��L�75����D��W�^���޸���N����Wf��K$����sր&/PJ�Tm\'�B�d���fJc���\0=�WpjI\Z��?B�@#j�z\\�k����מk/�S�@��S[~\\�\r`�t�_�4�+�AQ\\K��3��ZV�\0ej�|=�Φ�ާ����lF��^z��F�\0}C�9��!�᫷#��\\��ۯ?MT�p+���5\0cL9��j���T�y�@�=jLS��S�Ѷ��1O�F�\0hb�zP${Tr*�Z�)�\0gܧC^����)�MpӮc5�૳�8ɠj���Ȏ���}\0QE\0QE\0QE\0QE\0QE\0�=\r-&h��D�n��e�Et&��-\\�k�9�\r=\ZP�(=�S�C�^c�LV�~��V��$�P�2(^(��\n(��M�\Zm\0֧SZ�!za�\r4�\0��a3.i�h��T�h�@�ъ��!Z\0��T�h�@�Rm�m\0GEI���?R�\0�B)�z��@�4�Ԙ�#Ҁ\"\"��ԤSH���!����\0a�\Z��m\00�i�qL4	�0�#ңa�\0DE5�K�c\n\0�S0��P\Z�jCLj\0���H�Ȧ@�c.;T̴�(\\�*�B*�S\nf�+�P��5�\"�Ve̘�\0Q-�b���h��~)��\0tk�\\�b��*�.(�S\rIMa@�Lj��Lz\0��B�Wݰ��t��\0���R03LC�N��1@�♻4��4�0(�!5M_sT�?�EC��v����*�&�:d�+B�bMZ^5#�JM\0&*1\'4�9�P���ء؊�G�e������)� �5H�q@�W\Z�j�O��ϵP����=)�bÊD�`;�\0H�w�.�:�)�@�\rg�|��΀4f��x��&y�eͪF3��g�x��,��#ހ7�v\rD���:��P&p±�|nv\Z\0�6�QՅS��5���y�ǋ�~#&��ׯg����V��,?:�7�����^p^�s�j�,�q���o��\0Vk:��s&� ���֥���|�+6�q6p��&�n�y�������d�ah���i9#��=��J���}*�v�;P��ʯã���?*�>ʽ�9my�@+�<(�Q�ڶE��)�J��@�ڏJ��(Ұ�ґUߚ\0�\"���zP�1뚵\Zc�\0B-��im���YTt�̠X�A�������\\�0ƀ(I=)��wj�Ku���A�!���\Zp�v��(�v���c��;�����]��(�%I5*�Z�e��k�XV]���L�|��QԊ�]�W��|P�$�Rk:�����ʰ�v{�x��2�Ʋ���8A��~u�W�&�.�����M���LPЗ1���L�{�ߎm�,���	{]u���~�b���\0xY�d���~�1�.��z������Ȝ�k�is[j0L�@������>���@\Z!�V��\Z�o���H4�����Yɧ��(���������#��Z�O�\Z\0$��U�L�<�&�f\0�sQ����2�P���$��-\0>Ij�ĜS���\\O@��،מ�r�c]��6#5��>�\0BόW]��3\\n7:��1�hW=�y����R��ܷ�Nh���2�RD-��-zl�y��y��@��r�tE3�W��`�k�~��C��{M�_��@�MR�sW�䚩\"�b)��H�Ҽ��1N���S�Ѷ�\Zh�O�A����G��h�5�8�\n,�R*mO�_�ۚG5g˹���\0{��/�g{U����ǝa���\0(��\0(��\0(��\0(��\0(��\0)���g���,�$�W�x���^xf��P�2E�z��5�\n}+�m$h_�zF���S�@\Z�R�ih\0��(\04�u&()�N��@�O+M<Pq�B���g\0ݴ��?�P�!�PE\0E���%�6ԔP{h�O�(�\03m&*B��f�E&)�@\r<S	��⣠&�iM6��H�\ZCҀi�S�%\06�M<�L#4\0�i�ҜF)�(�Ƨ\ZkPLqQ�jF��\0a�*C֘�0ԄTF�\Z��֤�i���t�\Z��P3?����O.ڪg��М�BǊ�$�[�A�@c� qQ�T��x�O+Q��@&��sw�]�(�ĸ��q5j㞕L���!$��#�4��\0G���+;�LhRZ�1��95Zy��\Z\0��b�.3T����q@$�#�����E1�w8�	7�O8\\�yn�A�\n͟S������\\j\'�q\\���9>`��\Z��QE��\r\0u�̣�T{�My�玀��k��r��=FK�rªI��D	.��y4�*��!r3T$���\'�<����x���?:ȼ��+�0�;�-ܿy��.�,�{&�:[�v\Z���es1>Y4���c�\n���uJ\0�\'׵	O�[��$��9fnk�O��ʱ��r(�].�^X�����ٮ�tA�=tr��\0r��E_�EU��]:ؑ�*x����Ŧ��\0\r[�NV�\Z��;T�\n���2���<�ނ�b�N�h,J��1�#�j$cҝ�!�@�>�*&*Ǖ�CA�\n\0D\0u�E��t��;Nj�jO!�\0o<�zTY,x��vv�j�Ͱr(t�wZ�b	�*�wjx�W#��s@\n�*@�L�=\r.=�L@�ytd�vs@�<s5\\�7`��w^������A\'�J�}hz;�{ե���,�{��q�@�j�V\'�}h�\ZO���~`kJ��4�bg�n[ȇ�\n��q��E\0y�@dc�Ko�vp��J\n���o��j�ڀ<�?��I���o�A,�\0R��w�О���P����&�!_ʱ��Ý���W���\nPp�\n��mŋ�����ឤ�D�JH�V�ma�J\n�N�\Z}�d�f�=*x�(e�k6q����>\0�EuZ\0��y<SY0h\'�\0`�����S;ԑ\r�(���dC5zIMeؾ��N�P�\'5IP�*\'��&i}�&�ޫ����^(Y&�@�P���4�P+�|�|�4��m���1u�����;nbkk]��\rsŲ(͢y��ֻ[E��%�DZ@}밋��\'w8�Wr�U����J�*@��I���PYۉ1�R_?��kJ�b�b�=�Wkcu\Zg5����4a�W��B4���}	���L������j���N�r*���)�3mL��7\0�R�K�v(���;b��B)�R@�FFZ�\"���\0�*��DbT���L��\"�@h�<\"���ҺJ�|&�l{W]@Q@Q@Q@Q@Q@\'zZN��x��=Ҽ�x$פ������945��/ֽ#Go�/Ҽ���>�^���ܯҀ7����Ҙ�v��(h��\0(=(����\ZZC@\r4��f�@\r��JE%\0R�@���b�E\06�\\Q�\0JP3F)h1M\"�M=h��&�Q��\0��M)4�h�0�N&�M\0!4�N4�h\0�&�4�h\r4�Ri�\0S	�.sH�\0�sLn��Lc@4�i�Ơ�kR�I���������	槨�Pt�8�\nk�y���jbت7RP�95X�t����\01��M�7nZ�@\0���-�\0* �\0#Ji��#�W�|P��R�L��..�gL]1\'4i�j��Y�O�S{нH���t�8��uH׫Ψ�k������6x���rW>+�\"p�󬫯�������+�U6�%���3�����d�e�����\0��5kh��z̹�u�Y`��Ȯ5{�����l�^��nh��<{m����� S������X��N���\0ؽ����cM�^�I��\Z1�V�:D`��M翜�sH�WR��&��t�� ���&8Q@Z#?�f?\r#���4�VSM�(�_ ��U��>��5�1��p���&�\0��4zP^�]P���b��.�j�l�v��{R?j\0���N[�+S츦�e�Q,�֞m�[��c=h��GaM6�գ���j\0��9�j�򁨚0\r\0g�ʞ)ʧ�Xl)�Xv�d/Zi�W\'҆B�*6�vRz\0�q� ʩ�d�Y��\'��&�/�[�\Z�3	�t�\n���K���^�JD9`*ț�^@�l͎�e`�1ڡ�)�H�_��	\0<�3�����j��VJ�L�;P\r+�zE� �jV���Lt2^�Ԃ�T+i��1��\0][�5&�j�;�JU���@\Z�\02�h��;\'-R�AGZ\0���R��SU���8n��.y�֊��ފ\0ꥶ�8X3D{�3Ǻu�e���5���Ͻ\0Go�4X�i��1��1Y�i� ��l���@H��O�E)�wz�����+�2�\r\0t&@:�\0�u���5h���@�Dg\"�g�A���t4��fPC��)	�%L��,��P���+�9F�\0�:`��z����+YRDP���Ok�\n�͓V`!phj#�8��j�� u�7@u4i��z�����q���\ZS�@^oz����Wi3ޠbT�(і���֪��*\'��7�d���69��\\sֹ�Z�\0`*\r\0c��e95]�F�	[��Z��s���\0t:5��+w��Ia��|�T��[\'-2�ƀ!<����j�ψla<Ο�c�x�J�;��4:is�+^��Ds��Z��6�\0;$C��9��X�����Xk��em�`׵�Q�u�]��W×��k�����P�˝�O�\0{m�m��j���u�d��)�4�T��5G\"�Ҁ\Z)ؠQ@\n.)����JJ3E\0!�KN���>j�8���N�P�3��}�&�D{Wo\\���w�\0QE\0QE\0QE\0QE\0Ph��R�H:�\0��Y�\0b��&��\0�|�;W���\Z\0u���EѿԯҼ���zעh�qs���*AҡV��:Tƀ�@ih\0����@!��PE!��\n(4�\0uRs@	A�A��E����J	�\0�ZL�\Zi4\0�a>�d�qڀ\Zi���FZ��Tf�M%\0!4�JsM���Q�\0CM4��I�@	L&�͊��@�7JyS����\0i�N(}j&R;�\0i�y��Zks@5l�\\�Q3\Z\0��\n���4���3\0:�����Q��;����@&�\0�Y�3g<�K���j��-��\0ZߓO\rT��X\nw�\"^�΀/��4���<�彸�U����6v��\"�ƀ:ט��&P9,+���\'Z�\"6��1}�9�0���@�q�D�����߈!�9u���n�u}.Hf�ֱ.<G�\\��7�@�u��d�\\~u�w�x��a�׏4��ۚXt�˃���\0z\r��D\0�5��x��RD[��\Zg#����)�V�0&�F�1�sJ������ٮ�/D�������@J���~b�n����g�Wr=!��\0q��m	����S���uɦm9\"�-��9d�#Q��S.���]R[�qS-�~��a�e�)�\'�Eu�B���\0�\r\r\0�A�Tv���)�.zP24���\0�2v����M0��(�0�R*�Vف=)��A�\0d���8Dj�kLt@E\0W\nY�R�\"�!�\0A�{S~�W\0�ZB}(���6�z���4����֠t[ҵ|�{Sd�(�(+��u�����.ьUb��Pv�K�����R���J\0��̧��-�+GҞ�\0D��u�B(�A�7<�@;c�kdn�`m�(�@�X�t��i��s[Esғnѓ@&�UTl�G��BOjF�r(�2�>�4��\'��{(�j�����\n�����*��\'��U1\\)�8�o9Tj�D�A����q\Z�\0*�g�J�\"u�k�����(�Q���\0<-Z[|����%E\0f%��\"�	*w���:Ug��J\0g�-�j(�#k�&�.F=��<q�X`4���Y2\r������cm\0z���?~����M�v�~�s��_6��ceN*�ws���1\\{���-o1Hj��~߻�xf���HXz��D�[�\0��Q%���\"�F���kZ�\Zn���W\'ޥ{H�f,�@-�6����M�XW9sa �AT�n!n��=Ή��j��c���Ey8�j�\Z����h�c��:�g�#��/c���0���%�\',(���Q����m��n[�p*��m�Y�@f���\\{���������M׊-��%{�X�ej�^��8���]��{R����1�\0�������^�@������\Z����I�N+����y2�V�>�}Z���_β/�e���럭|�u�#Q��7>��/�u+��3���گ�Kd\'ːƹkψQJNX\Z��]�����jH畛�@��>E$�Q?ĳv�󅍙y�kb�E\0v�n���>���5iA1��>�B\r=d�uteo�OP�^�9%e�Z�nu�s\'̕�\0:���(����U{���\"�(�-��NG��~5�i�K73�k���Kn�𫉠�1�J\0�d�򑶧5��\0�ϊrw%T��Z�0H?x�&�/�i�k�M�\n\0���k9ʃX.�\\�xcP\Z��NHAQ�ǵ�FJ��ӟ�M^3@�Jz�PEPEPMf��cu��Z�A��G��*h��3�^���o�Hk�T�E\0IE�\0QFh��(��(��E�\0 9���)I�4�x�L!���v�-�$�����!��~��@ڪ+�t��:�kѬj�Ҁ5T��\'��~�K@��`8��RI�(\0�4�J\0(���Z)3F�\0ZCM&��\0���N)q@�&�����N)��n�3P��O����\0�i��n�!j\0v}i�i7Ss@E7<��\0\Zm���\0ji�K���@i��f�q@c������T%��	�j��I����;\Z\0Vf=�2�S���>��6(�J�A$��Vuƥd�p?\Zƻ��9\r0�\0o�y�������^��O�$ο�r���;p�\\��4��\\�����\Z�Q��(����K�6����s��P��\'l��z\0�\"�Ķ�g2�ι��[�q(�����W��>cs�BCwu�CϽ\0zľ>�2I`ߍg\\�F�epp�dbE[�æC�\0m�|A����.<g~��W��ү�J��J9�8ۍWT�m���f�k�\\�1�k�WJ�x�O��p��\0yO�5�?>MO���������?J��Б��(�cЋc)ZV�J����i��T��J��8�?G���lC���p���4}L�οxP\n�:-XM ����i#\\r(�]/��S&�Tt��F��O�(X�/�O�l�x�Mڀ1��}(6>մ�H��Ci��߳ڶ�\0�M���\'����\0è��\0�)�P�h��\0e/�J�OZ����	�aҀ\Zc�4�)�e�X�LB��9�y�����\0�5(\'�L\"���\0V1Jc@[�Z+�#�\0g�,\r4D}+Oj��U�g�<�Fj3*E�;\nϼ�c� ��77W����4�I�D~U#5d��7��)������T�P���\r�<Z�\Z�;Ї/�[�Q�^�\Z/jkj�\Z\'�E%=(?���,��\"���B�Ƶ\Z<Teh+� ӂ�W�.i�Nh�lS��R�\r1�#�@\r�e&���ր�� oZ]��(����m�T�n�ytM�#n�UW�<V��i60�0e�۰�E����҂;�R��Q@���e&�{��\0+�kh���˦!�(�.}*�6��Z�I��*��L�w4hY���Kȸ�4P�*3�S<\n��ا�ɠ愸犀ّ���v��e2h<F��]N�r�ڮ1=1M�P��7�Dl�����I��{	X��Q��$����T�8�t�|{it�.X}Mvw�^��\\�z�hy����+cL�����q�@P��	]�E1���x�xօ�B�)�.��~���O������>�\0�0+pqT\'���c]zIg�\0�H��ӟL;~\\\Z\0�+�>����}~f�`��!ċ�³/4h���P�\\\\ޮw3V\\��HO���׾�X���Z��r�!ؼP�_	���wĤ�nOo�E�7�����䷚|3Fp2�͟\rMspU#;s�^��\0G�2+F��1B8�g�@:��N�ߔ��©��wa�8�W��xj6������uǖ3����[Q�Z��Lsc��$�c�+��w:c~���\0b.�)*�Vb�2����K�tp��q�+�����e\0�\0�m��֕����e�G���9� b�\0E�y�\"\rN>_ҵ��:�9Q]$Zr��kN��oj\0��@Bg���B�\0?J�>���$�*\0y�ǀv��X�15����$W���W��Kt����;O�W�t��0k�����\n��\r1��T^zK, �P�q�WpFkB�Jv�O�(��斀E�PQJM%\0�R�a4\00�L?tԒ7�D���PO����k��9��^Mw��(��E!�@�@\0�KE\0QE\0QE\0QE\0t���ӊsJ�iv��J\0�<U(i\n��x��}���汊�(GB���H�E������Wil�@�\r村Q��)��	�A�Fih����4�JJ\0vsHN)3M�n�4�\r\0)jL�sM&�M!8�n�-@�!<Te饸��\\\nf�BE\0<�4�p*=�;�Y��\Z\0��zSI���4�4!q�7�`��F��@ȣ\"�H�sҀ%\'�)�,��L�hbi��@��~uL���΀,���KU$��,�:ι�%��wH��\0l3M,}k����a\0!\\q�\\����;\r\0zs8x�Π�P��#��kĵO����rs^w�����<�P�w~*ӭ��2�{�?�|FҬԷ���|�}�?LO�e��Yn��}�/(������%>L��5��?���@�ח�hf����֬�~l�4�\'�d���X7^\'��I%�V�h8E��Vc��|�(��MR痑����4����k�a�%������ko	���`��7��S�I�v�\Z�ʽ�xR�c�t����(�mt�����[�1<$y���hS�����M�����P��m&��nZ��@��e�>	�3�0Z�l�/,J2\r\0dE�M���kph΍Ҵ����eh��C-�V�C���V��ȩU� ��G@����S�/���@�ÊAc�\"�<�Hc>��lG�i�b���ly~���n\n\0�6��͓�������}��:�aWS�V�sڢx�zPh�a;է�=��\"�v�N;R<D*�hcҚx��=�A����-Ґ�:��@����TM�j���c(�\n�nMD���Wvg�1���\0�{V�*&��dV�I��w$q@!�u���Z���J�i\0�@3��ƪ�jV���a���&��\\]���ؠ��ӾE�5����`�MZ���1x\'�]�ծ�6��-���\r9�c�\"�G����c T2��P��C�*������5}�C��j�6���:�D�~y��P�;�ʓ]\0�Q�(��h�������X9��g���Eg�\r�*��	�ա~	�%�o���8���4Ig$c�D���R4���\\۟�88�\0�~�x��a�G��\"����t\"�+y~�yD��aTw�|�h��QP�pMh�\'��lAҀ3Şi�[�?(�@��H�z�9:\n���a�(��Q@�/~���*�٧Z��G� \0��)Ozq��iz�DXn\r+n^�y�9��]�@5¨���N_�.hU�O5v+t^z�N鿹Enm_AE\0y��PӁeF {Ws�\\����{W�w:e��4a��\\����N�նĠ�j\0�ɤR�ۃN(Xu⽷�����hO�yN��\rSK����j\0�0\ZB\nՆ�{o��W�Q����h�}4�ъ�����.��Q�z����G\"��b1�*G�S�\0d������J�m���=�NE\n2Rx�S�\0j�5��򸑈����M�񾹯+0m75�1�@O��:�5p��5��q�	��U�޾J�{���ǽt�W�=OKu+��)Ю���U}\Zf\')�W=�o����	�^����H֔�4\'ހ8�t=���ҫ�?w��v���s���Yw�!	�GҀ<�lGGOҜ�|dp�5ּ��Ҫ�j�\\P<�\Z�:R���n��0������@��Yv��?*V�e��*.~��5�n0�T$I)�(��Ὃ1(�\rd�^{Q�`x��L��r	��s��\"�<b�ӛ��Z�ڲHBΘ=�^�����d�VU����R`@��-YL>]�����\\�j����/8\r����	ǭ\0]K&s���y l 8��ı,����Vd^0Ep%��7�f#��Ք�P����i�Yݠ�U\r[�Kg9I��]�-�z��:�KҼ���R�+����g\nP���P6����\"H��pm�\0�˂i������h�����4I@5�iI�c+@�������|\n\0�<$���q���`�b�\n\0���x����/J\0p<ӳP����	sFj-�n�	sFj-�n�	sHNG���\0��k/S�ʅ�{V���ɮg^��n���\'S��r�ީ�˨���R}�[[r�ր:�>U5�G�\n��-����\0ZS�)�)�Ҟ�\0�isL�4\0��4��P���&i����I��[�j\0qjiz���-�\0���I���cK@���\ZZa��,�0�;�s)>��p:�P��i���Sk���0�Fu|ҁ����i�JMcO��E��/�Y�2���)�h�,}i�wmد;���y�A�n��\\�H�M\0{;J�2Ҩ�j��յ�ޙx���<i�ܓ�X3jZ�������W~9��BYԏ�`�|N�\0�x��JV�\0H,V�!ҙ�ܦ�;��\0����۟����-M���O�µ���\0}�@��\"�oNQ��Va�]�g�޽\n8�X�\0J��0��\0y�~���R��q�Po�2=V�G�/u�(��qc����H�X��+��Ґ��V��ݠ/>����?*��ᝌ����o�z�iJ?��\Zn�@�����y�ۏj��[�$V�*��l~�G�@:�hs��FO�Z�ֶ�	\"��W�M��7�E���\0���۠ڀ8E��T�\n+>��V�I��]D��2|��]/���<�q@}�{r�D��{\\O�2�k����Hm���A#��\0�?��yjp�(�m��;; <���l\'��0ր1>ȱ�\"ʟ����a	���)�\Z\0��>��S͠�J��zR�c�\0b���߲����v���J\0�h�S0��V�Dj��(��(�5)��J��+Ҁ�=�6�P�qҒ&r~j\0��5@����G�(��M1��\r4Ǔ�\0�b�B�\n�Ɋ��h9��Щ�Z\r*1:�c��\n��a[F!�Q�#Ҁ1Y])�5��/qU$���*��Zp�z�ͣ7 UY�t�\rG�Qa��US~`\'5]�F��y�9�j���H��+��-����ך\0Ɏ��?6j�zbu5|����nƀ*�4N��ֱ���W9���(.�G�A�Vsh\n2PWJF8�JJ\0��4������W6dMzۉ}*\'��t�(���@º��$N2�>����Yz���N(d�\n1j�I�9�;�i�H	\0֤Z��LPGj���U����O��9́O��-�#�K\Z���ΒR��N�松C�J�/��4JW�z�iqO�\n�Kd�\n��$y��\0d1P�*m�|��^u$��U�IxZ\0��T��I�����\rZM4���j�iq�\\\Z\0�o��$r#u45#^��ۘ���hd`��H���Xp]�B�2�*�j�ʑ@6G�M�����G��Ҙ���|dd0��L�h�2�+>`[�զ���+O�\n\0��4�`�饓ַ��4i�1�P!�h����l����I�(;a���-�E\0{�!��<�5��o�ڼ��i�\0%�G�v�6�mHf�B�\'P\'P����xOK��wjё3�Q��@O�?�v���[�_������.F6�a_bC9���Dֶs�\'�[>��>�Я��D�0ڋQ�8oJ�K[�u�kH�\\(	��Z���m\'ymA�`(���/5U�vs]����-?!�m�ڹ{�Im܉�3d����GAZq���l�c4�S�TO?tU�\'�P�Ҁ(,d���v�V�]ݪ��\0�f?�|\Zеֵ+�P=\rF#�#G�\0�t?�w�k �����OB��g|��\nORk��l$TL��16��@gXk:F�$ɓ�5��tG�|6k��/�z��ᣝ�����i:%�c�&�=��Ox���� �Tz7��3VU2*�=kfH��Pn��I>�̫2�Cf������h?��1�<0�����\r�n�rl�sk\"�0�y�غr�EBnn���Ċ\0��%A�r*�_1�Eq�z����8����`�3@\Z21��W ����I(3W#���|����(���P�HPEc��B\"	H��+�3�桚n�\0ye�\0�\'�&+��_�o���W��fn��ֳ���nY�(��Ʒa�H�@�]���[] �`	>�R�\0��V�Wu�+��г\0x���۸�mU�`���6����ᆵ4*��18��+���7%\0s��*J�,&2EUc��\0�$\ZR�!AP�\0&�7Si	�\0;4��\\TY�[&�_�\"��Ҩ�>F�Md�t�@��ˉk�\r�X:<;\"Z��@�p|\n����1lsI�TE�\r@��P�\r@��h|�l�P�Z\0��m4JM5����q6\"#ڸ�~�*�+���P�=��/����{�(��&��<�\"�����;�a�Y�1�6���\"㚯*ՒGj\0��	�Ri���	@���ޠ�ݍ.�>��Q�h��4�?t�ٱң2�׊��qLy��?\Z\0���C$�{�}��0uq��uǈl��I@�hp͚��5�^x�L����z�⥌d��ƀ=9� f�kȗ�ƼV���+#�r���mN�0��ϥ\0}u�����:�Ʋ�|e�Ce�I��ʚ���K�%<��V�o4��w�\0}/s����V\r�����-����9��v6R��	�3x�����Z�>����Z��4Xx�V�4��F��uK����:��/$�\0[#~u�i���\r?�q@z�c��5z\nD\0�\'�]�Zw�\\\Zp\0q@4^�c�c�K��GH��]��c��	e��@\\~��<�?\n��T���mGLT�k�@B�m�9:i��텨=E<X!�(�����J�1��\n���B8�^�Imcn�*��\n�Y4G�jtwN6�E��zT�۶*�[����\ne�B�jĒ��*�Yf;q�\0D���U��!�\Zӊ̩��ZHQGJ\0Ǌ����m,.5�P�Q���\0@�F�TS^�E�8�OJ\0ϒ�XqU͋/z�(E/��@;\Z:i���kpj����\nBPxj\\Fi�Z�>QU���ր&ؽ�3�G�Zzˎ�\0����z��\"N�Q�L)���L*G�TM9�9攨�\0Ph��d��h��T&&=E\0f=�jjW�k��Da=�\0fa���1���8=�)-װ�\n^`n����Il���%CҀ%1�J�����0�,��S@Z#�)6z��##�A1E�@�p�Fj�ī��I�V BsY�I5�p\r\0K5Ј�5A�{�����\\fAVE�Qt�9��<ù�����Q��1��JB��1�͢���ft�l�wS>�:�@F=F*d#��%���ES{7�@؍Lhq�x���>����<�J���J�֤Z�+(#�#�ݪɈ�\0P1�#����4�qր*��r}��D}��xa�Ry{h����`|���m\nx�%�ە�U��\0����|�N*�:�o�D�t�f�d�m9s�\0`Oc<\n�������k��i���&�l�<P˥ʜ�����dTq\\\\�v�$\n|��ĸd�(R�~���r�|���uQt�<U�k�;�P{C-�pHj\r�˜ֺY��4֊x�X|��mQx��S�|�������D�ȮWU������j\0�T0§ːg�\\��.�m�d�֍��y�J\ZR�&�M7Ö���P?��\\L��\"����s]/���Y(�4½�2#M�ȩ	���nAU�Ԟ�Ty4ᶜ֮��!a@��AJ��J�~^��%ڀ\"���?���P��0�~E4� ���96�\0de���w\Zc:��`c�P�B�*X�GsT�HFX�Q�=v��\0E��٠�\'8��;ŇQ�E\"d�]}�ؙy���嵜�b���-\\hV��9�$��#]�Qa|�E�}����S�>\'���\04�?�~�Z+�t;}�y��/4����������\")S�\\���\rE�\'ڀ>2pCmu#�I���> �6e������/־����b�\0q��څ��ѹ��Պ�L1�U���\0@�Z��)L~�L�SY��WL`�i��@\Z\"�㊍��mQ�Z��j���\0R�[�V�%`}�t:g�u],��G`=��;�E�-\0z���2λR���5��_�\rT\0J����F��d�*h乵`��0ǽ\0}��k}�GS�z¼�nU��ȯ��$j:qTwb��ץ�m�\n��d����s�9R*g2�f�K�\Z��5ifC8��A�\0�b���f�E�)K.qZW�SFEs�V�	ʑ@]��o0a����n⼻Β��9�]f�7@��d�e0j2��s6�+U\0KZq�p\\u���p*��J�6��	�~��cL���r(\"�>�Lc��T�n�Ų���.���qȭ�.���k��w\0 �Ś=�kpI抩s\0�8��x��T�b1Me�\n�i��+La@\ZE8jy�7��r+SA�/ $V_���A�$PWfDN^��m�0���n��i��4d�)�\\ɚn�\0��S��P=.�\0z\0��Lg��Җ�\0I�R�lRI���$�6����`PW�5>J\\�F��S�n\r���<��<�(�i��a]u��(1Y�0$�h	���ȣ���)��jɓV��e�_γ.|ick���{�V%��ןO�CO�=\r`��U�BE�8�@�.qՇ�P\\�v��Zic޼�������p�s\ZƳ�MED��з~?���$�8��ߊ�R��y��|��h)�s,�/���MZ��n-�}�Hq�4�7�\0Ȁ�\\���GS�?g�X\Zj��\0�`��Mk�Y0v�\0��\Z��~��_��3�ϽuRh)>�����#p��S�P�,��el�z���S�v5�6����m��Gn\0�Fh��	t��$V���;<����@�W˓�\n��Z�I�Pę�U�4{	�*b@>�}tyncT�xj�>_;h���\\g죟j�����tA�^�k�����kf�ۆU�6�jZx�F8��{-w`���>�������c�\Z��b\\j\0f��Y\\�3[b�9T�5��\0��,^��zX`�\n\0�\"�ʞEI�C���g�,�A���T���E\01-v�:۩�Zq�2�U��HaU<s@V�G8�}�}*�ߗ\0S6�\n�d�k������S@�t�0q�9�.5ZK��@x�G8��<`�i�$��R��l��`y	ٜUvӮ	��+�[uQ�N �\n\0��x��U�q(��R\"�Z�-���:����\rP6r\'JO�\'�\0_ \n��w\"���i�w������R#�E8��� �BqA��O��\0BZ�y��Tݘ���gPݪv��+=�=��t�4�4�%��E@��������\Z#�@;g��Da�M-�?v�Ij����T��1zU=��\\����\'#oQQ��O[�~��\'ݠ\n����N�C@DT-ݚ�pj\'\\�\0W�{��Hպ\n����\\�[ک,�ǽ\0U{b�*��Gl���~5����U�!���F�U��ج!�4��x�;\\��8���<J���)�O���p�������;��F�K{�F}�r ��zo\r�B�ڒA$�zp��\'�I��U�<���[x�U�Ȧ�b�`�Q�f�&��ji�5f?.Eܬ(*;s@Jb�Fx�%3ڛ�`��\n�-��d��U�#���\r\0S0���KگyX�Hbc@Mf{T&Z�㨤(��\0b�t���V�V�U��$�@+�zv�P�)�&J\0_\'o\"��4�B8aOڀ�_.�\rH#�Ҁ+�^���V>��H\"9� @��T� z���(�J�[�\0Q6q���Uy�H\'j�➩�\0�&��!,����<�y�v�F9�s: ���Sλ��<VV��;�j��	�܍��j�~I[{�\0pv�e֯&f���I𭵢3��tiqۮ#Q�k�J{P�;e�ҏʃl�J�6�3\'J\0��m�:�<��>�c�Y>�捼�Ҁ+�T֏��������1I�a�W�c<\n<�j\0�6`�N�\ri�Gғ�j\0���Z+K�j(�<��°j�%���W�[����Q�.3]���վ�,�a<P��-���͚�kÈr���p^ɻ�=�Z#FHc��9�lgs��\"��cA�\Zx��d⬘�.G�\r|�vr3L�*~s�V>_#�\n_/w&��s����P6g�Hq��>��)n�Gj��׍9�$g�\0zX��n��y�Yjg/>��xJ�����X�z�c��5\0y��N�����yO�>�DY�A�����)��OdV�n���CIs�D�j�.c;e]�޾��<+�jѰxWq��#�#�<��/~(�\"w��G 滝ᖡ�F�/�q�\Zu��\"h��P\"���2>jrݠm�0i��C�(=���Dn<qV8^٦���\05�j�Pn� T�\n�/�(�¤�)�Vӕ�j�QQ>\0Io�^ِ`��=�Ѿ(jZs(���G����.f��E\0}�|`��\n�XϽu�ڶ�� �\"��ɴf����~.Դ��I[h>���x^)?y�՟q���)�x�>5\\Z[�-�5�\Z\'��\rK;*��@����\Z���Y5��u���\Z)�\'�j;�#`&�y�J\0���g��bk�ӼB��ұ�G��s�W�����h���9W�j��˭��r�����<�six	�l֞|��-2���\ZI3]u���p�\0:�#�d˹��n���W�%q���=�b�90�Z����\0�I����\rt�LI��6����>�\rÊ�t�XcF+M�\0���@L����U�5�e�3@��y�5U.Y�+R�Tx�	�ݜ�h[�S�lI���Zmv��P?\Z\0�ݷ�1�\'�ss���AĠ�5�w��-����y�9���P�� �ڏ�`��\Z���|H��,���}(�5��۫�s���\0ũ3�J�׊ϩk7���kB���Fia�\0���QG.CU�����c�4�w�s]=��a`(4\0����B]V��\0T�?\Z�-�+n��ح+m< �������о�g9����^����Z���q��<�n�\0\\	5��m�����8�%���*[�6�?*��\Zc?*�����l����Hʺ�So��\Z��]���t��\' P��|0��]�J�ojv�^ވ��\'����<f��m�\"����N��B}k��ÖR�D�j�?\0��kS��@\0�-g\\)RMFt�vs\Z�����&��5�e�I��,��ʀ\'����hB�5�k�i�X!=��j��r&�)F\"�|�N��tb*O�5��/�]�7/��n8���H��W5Y�inNb�֜v�۪n�[K��`��\0�]xd$��l�m�y?J�п�qP�\\Ð\"@��@Gu\\���K;���P�K��f2TTPiS�6d%���|�1������#m��f��1��V�Q����\0౩�g�,�V����d-�d}k���4�Beds\\F��d��g�\n\0�<Ceu�$Pǵ^7�/F��I���5�\0�,y��-*�7�4�-��*�3J~\\�lb�����@Z;c�\0-y5i E*o69)~L|��%@�)�4��)��ր\ZX�A4�(�\0Fc�I���$��9#�\0���f0z���4�\0�`C�T2Y�r�U�)��J\0�{iS<���֡�F�ڀ*%�*a*�CMkUa�P5�����z\ZB1ڳ��$GI����)>ԛCT�H�p�4�S��e1Q���U���\0�(�!\"�)�EF�E\00�L�\rK�֌b�+�J�xUy ��\n��^�l9��,��[$��s[/�����Ph�+�\nw��J�:@8��.|�@\ZK�rXU+�Z��Ig\\�f��{�N�q\\��-�\0*�^h�Լg���O�s���ڤ�����|;el���@n��D�:o�\"��\0pzW��*oFO�u0h��U�hKd���j���\0K�N�\0� F�b�O��gN٨�5i�	��Ek-��,�A�@>�\"�sT�o�>f\Z������1�\ra/�(\n?\rY:䁺���fN~�H�ЛI 9-�A6��a���=��b	fm����Ѷ̤�䚯�>R�j�xr㹀��x��db�Rxe��<$ \\�y�����i7!b��:�\0(��B�2���L�VG��x�+?��.\r\0n�0F*#S�)�j�\\t`*�<L>W\r@�t�|�͑W�`��h%z�\0����)FXf��,�z�1��@�L6�տ*�(��!�)�d��h�dR@\rhà��d_Z��ji�PA.�A4�s���/q�c@�p�)��\'^)�\0(����a#*qT�?e\'st�b��QM*B �\\ڤ�������y�A�\0K%љ�����d��H~_Jֵ��U����lP~C�\0f��\Z�*qA�VYj��l�v\\Ⓜ0­�c�\n0OD����{0�h���ۊ\0�:w9������jD�\rր0�7jC��Z���L�0j\0�� �)�T�sV~�5Y��W,�T��p��Щ�����kV��v��>0��(@�ٻQY?���\0�AE\0t#H�_����G6���������NP	�eN\'��\0́.��pr@��O�X[�\0����w?*�QKc%����\0���+����W��Ey���ɼ��zе�Z� Pi�v4���i�Tt�\0�\\���ؕ㸋}�\"�+��¹c�fͪ�v�Is���Ǯ�K},DA��\0G��^��������\'2(cZ\n�j�r�ހ\"� �0>��\n:曲�G\0O�x��!�Z��\r�@(\0��#���_/r�5N�T������P�66�q��%>���5o��>�����u�C�ݼk������e�H�ؠ#�7��+t�K��W�k>���ж���\0�fM�w�7���bh��}���g�?�R?\nAp�������-�U͒�\n�}{���3�1ڀ8&%9~����MWNԴ�e���j�7aN0s@\Z�\\ުKs�T��wJ�$�u�\0Y{�z���zTJ�\'\"�X݈�|G�M8�_����0�\'��8\"�2��Ӕ�R#]B���1�[)f�7\ny���4&��=WJe+3�=�Ӽ3���h���^RЮxQ�<�w�\0��F����ȿid��l�_ew��\Zݕ����Wρ��3.;]F��R�BH��\0}u=��>R�k\"�*���k�<;�xT�8�]կ�4maT4����X��ɁV\"��L��H�7�u�����/Mnr�\"�.A�9�89\"�-�J�q!�c}�cS�Ts�PV���=H���&��W,c��1�P]ʸ�M\0j�\0f��+V�NX@�+*\rL��*9��Ca(��X�^p*9u[t�\\~u�Ϫ]K�sYWSݸ?3P�O�kKu,�\0�f?�=8�E${ה�0�\\g�kxn���4��V0L���Y�\n���W\\��Z��Vҏ������S�b\'4�i{|~ga��Yh���\0�ͼ���z�r�^�ZV��|*��&�;K��\0ՠ��(�����5�+���e��R�I�x���Z\0�ѠP�?*҇A�Q�@?\n��	�E\\���1�\0�a��@r�~(�����Ejs���F��~�O���k�s����:8�b��l��0���Zz��� ����\n��c��@���U���jх��ۊ�-��3R�w��_J��TS|�ڀ+u�JU���a)~�J\0�DU�����cp=h�(jAަ��:�Lh7�4a�\n�s��]Z%R}�XMuϵ\0qw�Yr�I��\n�>���te�\n��$q�R���P~��8_�Y�D��Zx��ei�J�{��^��@\'ڹ�O��-m!\r�@\'�Ŵ�@C��kI.��\Z�bҵ=0� �j�����v��@\Z�\0�R�楊,�����+`�W�(�?��4���̋�S%��C��\0ޕ�_j���R����~���=�2�@\Z��P�mvzb��KP�8eV����֊���=kv8 ��=������8i�>������pX5�>��)\'�\0\"A+��{R���C�3J\0C?���M9_��YV�v8�3�Oh��TFI�<kL1�4�\r��)G�9�E�N�0��l\Z�Kua��6���)9���B�Vhk��9��-���\0]$Rn�\n]Eј~ua|�ca��\0Fi\rI�x �d`��\r!���1֘H\'�Z�1���\"�y���I��ԾX�@Qڀ!hտ�Uy,����J��̄�b�3�����f�b�٭\\��Lt@�\n	}�\Z�I�Aɦ�d�Ȫ�j��f�/����5IC�>jz]����\'d�ȧ��A�R���\0G�v�8#�d��H�P����\Z\0�$�5F�Q2\r��j��M��n\r9#9<�\0�6�]��V`��9��Z�Bt(n�_��  5�6Ӯ�yWoNiYCx4���F)�h�i��{�]ؒav`+�۴�iw0�\r\0y�ڶ�c⠲�^�O��)�z�`�ѯ>Շ��k�Ja�\02�m:UJ�U󤤣t-�a\\���Ә��f��\Z��cë`PK%�@�y�Y7\Z���B�\\�+�R`Eji���y�d��c�Os�S��m�Gts9�ַ#�-�f-��a_�q@\r\\F�����p)ۤ�9�R��\0�2he�k���˯C��Aj�d��LB�Ե���~j\0�6��g��T���w���,C�b�t�C��\\�m����&���f<���K�~��R�TIr�&�9��K�g��EkY�������Т�N��.jI<j����j\0�\r՜�0Ƭ���T�}k���w0ܱ��$��l$h����!���f��.���և�VɁ/Z\0����R����R��L�EX�l�*E\0QzR�}j��g����\0V1c��E�#5Υ��<��-g�|��	��s�!�Q��-��&Em��A�^e��c�\0ŋG�>PH�^��\\V��&�{PX��\"�-�A��ɉ{�~��2�:u��h�������\n�Dz_,7\"��e~�D�X�\0�U\0�D��O/�P�R)�dd�����h��\\ӂ,k�\Zu��v+��<F��+t�\r���-c��+��<g$�Q�>��\Z�P��c�@��k�OrB���ր(��6��ǵkC�ɯa��c8��H�彘�;�\Z��\0� �\0�c����ᢽ#d��\0֊[�Q9�\r�q;w�nty�@L��\'����I�	�6|[��wew�ħz��9�j��j鱔@sX]?�*6��̤f���Z�&߽fO�^z�P���܊��.��؛�\nؗE��9�H�.%_��\'�|d[:�Om}i~�k��E���`�ikqhs8ݝ?w�Uic1v�z�\\��@���85�Yp%\"�#F��\'�H�l�q�~RX�=�\0DV@�t�&��8�r7V}֦b�Y�g����	��]�l=*#�Hf\\�Z�zB���Z*x(���d0H�Z�Gj�\0)����n���Jr)��/\'(Fޠ6�X�^�E�Hs�N��^i�;_�\0�|C�J�7~�>��)���{��Wӭw\r�*���S\"��Y]h��Ŀ\n�]\ZF\"\'*�r�Nks��&z���|1a��Vx���^g�?��7��m\Z��(�Af��X�N,��׬��ඣ���j�U}yΣ��\Zid��{�3���\"��m�*���ؙ\n�iZ�8#4;K�`TFPz�g�	*�g���7e��\'8�,�琂���vy\"�1^��TbԯZ����V�C�P$��Q��T֚���>GNjڃ�B��(=(��>+jzs��ؠ�5���9�%����P�9U�ވ�~��ޕ��WQ�ȁ��j�g��)�c_\ri�\"���+�=��|;��Ŕ_9t�4�6�@Ȫ�j��2\Z��O��^�Un���סi��z�a��<�z\0KY��LD9����V����f{V������=��i��r8��Kl���J��\n��$\'b�շ�ݳ�ʣ���9�®�\\�UO��fM�g��\nkӠh���O(��p@4�����m�:��dB��]ĺ2�sn���xldL�\0��I�`�G�ÞE\\:<��� �R#�<N3@�}�/5�o\n� W��aS\rS�g\"|�>\0X����R��nH���,D֕��l������e-=��^[t�Ydq@#��U��00*O���8��@�(��Ue�9Z�+�J2(ZK�� �\Z6���I�Y�!�G47^f2qWu��l�Ta. ?1$P�=(��Y��N�ao���@\0Tk ~���C@:�`E.���1����)9=i����@\n\n�1I�ڐ�/R3P�x�Ҁ\'�=M��+2K�o�P�<�d�\0�{�q�\0�&�im{��\n���g5n(\"�|8�|��H��_��k��TF)B�����h!�#?*Վ�\0\0*)�#o�U��/*hT2�3�a\0\Z�o>3�8:j@\0�9�\rGJ2j�wO��L��hL���)��Єu�`�Ċi�^�\0�\0�*,��Na��L\0!˚\0y,ÊDO�TSj���r�5����(�A��i��1�}SZ����#ur�\"��b\"�*�i�\Z�̙�,j\Z��Н��+����w���[�+�lt�ث��W��N�v]���}�|TO)^����N�͆�����z��MӒ�\0JB���>+[�<�n=���{���\"��ՙ!T#	���<c�X8�ǽvZg�=�V���֤Y1�Jb}��t���(��[�yot3�Ͻ\0O&Oݨ�E<��ԧ=h\0V�S_gn��(\'Sʩ\'����gj2[�\05�)��{S�29&����\"��4�=A5�(2ǚ��T;��ҩ~���\0����\'��g��zN6��a����VŜ	�Q@�i�y���mm�\\�3S=�X����k*�\'d���N��)�nj�&hz��=H�Î(�{�eA�O	%;\0�4V�HT皔�t��s@��ւ�u�d�H-@\r㠦���Dӊn\0ę�(5^����|�9���\nM�h��𥬹*k&o�ͱ#�]�6�ڀ<�\0�&�=w`T��k_�u$ס�s�\nɺ��&E�9kmq�6�S]��e:�v\\�ϛ�f\"~���Y�麥�f7m��:�t���\0Q����D����5��!��b�o���X�s��y����g�\0�Hn��^�%�ǩݰ�ֶ�@��wB�M\0dC������kF=��X&�kiP�>�\"D�ioր*=���,б��!���$v�Sf�T�R�Q���4\0����T�MR��G��a�jZh�Hsw�kE��Qqn\0�6\r�0��4��1d�q��@i�9�X�����i�����\0a���H�bV��^�r]�O�{ս[�4�����q\\�:f�⩷�+`����6�6�Z��5����5c@�-��2�5�>�n��J�g�ǀǩ�x��1�*�Yʿp�L1L�I�NA�Bf��>�R�W�(]���V�SD��4��{�8ɩc�^�M�y�@�SLt�]��\0BR�\n���N#)�VKE5Y�T���ig�l@�֣�3�GQҵ�|�ҖP7)A��9�\r��u.�ˮ{P�絵-\0b��m�[��Q��TI��|�}(�4�{��V۞���~ ��Wu7��$ƀ�b��H����c$�,�N�[���j���e�	��/-NYI�\0/�o�:)?����ʊ\0��7�1O�K���n��v� �sz���2Z��׊ɊK���΢�;i��A�ֲ�<2�|��\rAc�_��������;�f��4��魍��[z�S�K�5j[Uuà&���Cѝ���G8�X5JM)X��f��֙�j\\T���ܟ��	��XA;�*{�Gޮ���~G�j�ʎd�I���Տ֪KatN�ɮ�M)a����N�\"�0�/��y�\"�KGp�f�>�Y�A�P\rg\\����h�����o�	�Im�a��⸸�.4���ӷ�.ր6�gc���qQYjVW��W��d�;���Q�\\�Q�y#0�0P�N����Q3����\"�M���j\Z��n���%	���85�$�B4���Ii����iz��K[J߁�����b�޷��$�\\������(\Z �P*�g����j6�=(��|#�����4�b6n��|Wm�8�|�G�\0|����%.�k��\n�|��vwX��{W�r���U\rGE�ԭ�e�NGq@��X\\[Ha���;�V��H��`�_ex�ங�+��!��$����d�B�9�P�q�*J�7� WA/��+a�XX�Ysڴ�_0�#��TrH:b��C匊�$#4L.NqP�\n��W��c�9��!8��V�G�P��h2X��	�T�5��Q��PY�e;혧��A���X�\\;�_z���L\0(�f�=�ß%�����׳x{�����y�,d�������*x�/a�5���z\Z\0����u�����u��<nZ��W������2&�ݔZ��\n~���#��Ԛ\0�XVkx�**4�{�ڨEG�|C�5�_2TRݳ]e�i�.�VF\'��ds2�$T�) l�H�s�~E�i���h�Z�)��mmCym0��\'*�[�ڒ�o�\0�&��u�1�VT�br3T�U�ͰǊԃ]�D�h�Jh�ȸ����q�]��W\'`��$z:8ߜ�0��PbT����(�т�J�u��l�Oa-� ��\0O��UȵY���[��|t���m-��-\0uj\"O��[#��\rp��;9� ���+[���j\0�\0����x�b�G�H�\0Z�4����Nh9�R�5$���om�j�X�eM^##�5Aր2\\M�4��I��J�2�UI�ݽ3@���}�*��nr+���������qv�\0\Z\0餺�!�BmA�����iݿy�V͙�@�H�\0VyNNEM��ޭ2�qK�\r\0W��\'QR��\ZVcL�3�\0>0�Һ������X��\r�4��ރ�����4\0�Zvi�\"�~�\0�~��Q�A�<w���s@���RJ1��5���5�$=���\0��CbE���F��։:�Q�T~�a<�\0kFC�If�]��k��n��\"&�Kb��5��sE=����V϶6\rX:������q�!��O �K�跍{&.>��n�/��-�W��d���r��f��PƮ���O���@��X�r�aӢA� b�����>E$�X��H��vc;2+�����OC/�$��㪍���59f���0����\0�\n�K��\'OJ�03\\���ݏ�f�U��t[��\"$0��s�L�r�T���;�8��x~��e\n�s�j�l��@�Z]��!��6�/Դ������h��4d~Z�\0��,HH3�P���`�U����L����]�>��3xBEBe]�\\�����\\b�{.{P�0_X� 1ʤ�zy��(r+�<\'�_Z�$ԥd��	���,-���j\0�ȃ��U���Y�rz��W�Zgٚߴ��\n��:���\0i~�-�REiGd����#h�b�*A��k�95im�A��v{���|��H#��\0�v����2��|�x\"�>���ͺI�\n�[o��LIϵ&	�@�ѣ)�E�X���4�������ޫ	s�$f�%�j���*x�\r U�sA\\V_�4=5,w�xq�\0���PN)�q�#5\'\r@[� ����ǥ8��^�ք㊐SA$t�\n�6�MO��R���2��剸qS�N��+Ҁ*M������Ⱥ���o�������9c���7�nT��T	�i��38�\'�h������\0��KE��=EA�\0	(�_j��=+������#>Ճ/�Dd���P���ep����[J��0�rri��q�e��u�F��F͏j\0�͜�zS%��\nn��ְ&�Ԑ)Ǵ�+�K�La�\n��8��Y�����[��\\�]Oķ�`�k{C�{�H�ܝ���[*�N�*F��j\0�?CnV[�}밆���o\\{U�9��)����d�f\0Լ���9h1��JU��Rd�(6�CQ$=�����H4A��)�R/J���0�u��<c�R%�c��f4��C-����h\0�О�Ҫ����0��Ҁ/g=(���U�,W�~�`��J��թ�A��Tx���q�iQ��h �;��dix&��:P3�J\0z�\Zmj6��2=�N9��}�EC%��p�	�U� L�Զh��m������Q@����桖���5$`��)��}��C�|���rhu/ɛM·�w˿�JN��ր9]7Š���+����x/��Ŀ��d�\r׊��-GE�n((���W>b�+:}9�hx>՗���x]D}먶����a��@�E}��T��m5��	ppի9b10MfM�Cq����\r$T�x�_Z�s !\0\"�۴��q�T�v�ͅ�>�\0�u��g����E$Wl�Pܮ��:��8�ޮ*	<:��\rw�:2u�b�%�xO�9�f�l���kZk�6x\r�i���1I�(R�đ�a$�5���\"nF5��f-��>�Y|Cuj�NH�_��J�8��t��%�\0H�Z�M�<s\'��Kݭ�{c*�u��VG��%����i0�v�	U6�y�=�%�wZ�B�\0\'�.�2jU�1��@<�:R�#�R���梹��N\\1�\0K�m��f��a\\>���b�1��g�X�~Ӫ-23�X�xR�N��4-ω&�k�IrzWg�N����؁$w��xUC	.�]J��Ab�1uO�^�,(	��^�;ox�cP3�^�H-CNXm�h��3��de���z�[�\"[9��}�>�ov\nO\Z������\0��v��Ѣ�>��>:�.>Pj�R��{���j��h���溷����o27�ڀ8�!t\'�*�$�El�m4d�c`�Wh�<�@�%<�5�zKc�j���y�\n�*���2T.�H�0\n8�,��v��Y��FƋ��R�2��R��\0^���� +�{]��~1j�{(wvU�5�v��G��\r� �>���Ǥ��w�c�^��x�Lף_*U��־	�	�]ۘs]^���i�G����\'������v������� X\n��ÿ�$eK�>X�5�^�٧\\���/>����>���G��m�Ga�#Y�$��Z)\n9�R)ހ3ݭ�p�K����l�&���nEd�X@�ր7l�A\r���/�]c\Z⼨a�3�=59a8Bx��}\Z9y�K�K�!\\��W��r�ę�F;���Z\0����2�O5���X���u���0�U{�!��n��|���sTw\Z`�������8�\rX��-�MX�[�������ZO�)�PM�R���V��e��MN:��|�HYP|ƪ�|��y�TԞf�٭x��z�oy,�\0*�K���5��iʀjC�(�6��5/�ꢟ��Q��\n��FÀg˦�}ӊ�e㊈���\\�{�MC��J�,[�Ti���ph8�(��5eBK޳f�y1T��p��8�ߺ���fV~b�a�]�A�����\Z\0��^ǚBv���T�cwZ\07搌�W�(���N)���E�4\0o�Ȥ\n%;�Ҁ�Le+��Ɍ\r�����\\�U?J��Z�X?	@��^@j��| m�hڽ�H=j$�:�@Ta�����H��D��(�һ��*��$��e\\xfP9��=r	���֠�����s\\����%��+,}�չ\r�@�M�B�T�q�)AȮ6�^�,	�85�؏4��UM?P��c\0�d�^�����6�(Վk���	�Yy����_\r�Q$���c�f�=5��E���,jGұ�Y��rN\ZͿ��4/o �=������2Y\Z�u�%\"Ԋ�B���%����X�ԥƘ��h��5�@��a\rqW�\'��V�/1�q[�g�u-d���`��wZ_��&��\\u�\0y=���x�¬MD��\Z�+EQ-�3�5�ǦG�(KX׏jVy�/�([�&�\0t�gO��zh͞����-��\0���S&�6@��8�<ac [� Z�����(0\rT/t�e�>���{v�\Z\0�.4\n\Z����\\��Μ1ₒ�ė���lw���S�S�����<cg �޵�5(n��i��	�+qI����6��5��@\nT�nʹ�7�1c@E%:��\0i���<�8�ڧ���[d~�T��@��\n\r`��I�����C�4�m�@b���<w��z�{D~�i�����9>��Ҩ������A,�����I�*2����oGF���&�hA��y��ڏ-d\ZM�zPIji&�ɤ#\"�!e-B�i�=�<�j\0�����M6FX~�Z�q��2ݨI�\\�(ǽa�֍���K}*&[���B\Z�k�B�1�����M�8ij�+^�°ؠڃ#�+��y+�P���\0f��p��C��|٭f�����ݨ�ܦ>j�̍�\Z�֊F�G�IS�h�������X�9�쏽@7p*6\'�F��ަY�~������=���n��O���!\\Pdғ��4d\Z\0fs֐����B��h����Ʋ�^zT�3M �J\0��J�t�-�ݫ�4u�@��S�8���1�c]�М��\0�p���wJ���}ڏ��.�G4`�S3Ƚh[��E\0[0�<�u����(�_�\0.�z(���@�i�m�H����*GL��d�)Y}������d�e����xXnٔb-���#\n9�@����Ɍ\0{b�{�7U��2D�b�����iZ%�M�e�4���6IC~�=2k��xnT=��3�5���^�`Z���s�a������@��:�n�B�H�E&!��4L!���Mt����j\Z9@>��	`��|�%h�kQ�-�����TM��=�·�tc�ź��r�\0���\00�5sW�U��;})mo$��ܩ>�.]�K�)0k\"m&�C����Im\'Q�\Z�cU��%��;e�:\\,?z5�Ml��\0\rQ�H8,h��K�rb5	�������\"~SP�H��\0PZ�$�`.�k���-/��� ���ĺ��ԓlO��of�n���T&\'\\�\Z�;����ۘWg����\\)�\r%-����H�%�ju���<��$V�����\0�$��\0U�<Jб�%%�\0���L��Mt�a��a�D�k��Z�2�����@[�����S4��B���o�J裞��\0\0qNhT�	��?0����\0���F�H#*i۰9����7��NP`��֫ͨA`~g\r@��ePA��MC��v�͉r}�A��O3�*K9����\0�+I���\0\'��$�Yw`��F�A_\\̎��Ȧ˧Z��V� �Q@�iwVLVH�j͙x��i�����:f���}�ȼS�:Df��x�(炃��y�|;�t�O��j���g���\\z�\0�h��� m~jQ��PW�KU��`*��Y�Z1X�A��)�@�u`���+oAO�w�\n����h���wv�\n^P P^HH13���R��@\ZZ?�5m4��{פx�݆ռr��5�~^�kdc��/��/i��(�EV>��7��T�<	ϡ�����́���=\rt�W�}kHe�p�ހ>���e�6�N��U�e������Gy��Mz���+K��+J���@d�Pm��5s���W��,������W�M�ؘ� ��%�Ú�g�n\n�\'��^�wlڭC��\nWw��9!�\0�S.-bU�p+6\0Ю�$�~�\0U��YI�5G��R\rt6�G��j᷂Q�\0��\0�<P����A�[�ZCK�+6]D	ۓ@i\"�B�������Α.M���$w~�n�\rx5��� 5������u덠\ZU�(&7��]\\div��ǭ��\r�K\nЃ[eǘ(x�)��֪ê�7`~A��Ojc�2��=F(�IR0�b�1.>�@F�ma�p9����I�SҚX�\0��Z��d�V���Σx�r���i�\'0�@�p�ՅN\0a��bKa4G(ƚ��[�0&�6�Ғ��Z���,r.��\'�\0IE \'��<�\0����ȧi�(h��\Z��NR�̯ң�NO4\0�f9~�������@E=i��qހK8���@CJ0㊂]6�A�(�ҥ�p���$b�9��G6L@\n��\n\\\"�x����XG�J]MOݚ\0�땸X^�Py��/E�����C�׭���ʘc�U��7k�NE\0y��x�_ʍMQ���|C kIYac�5�z�¨\'r�2�\r��u���8�ƃ�U�S۩��i�*>�VՅi�{�RxN\"�+OZܮ]�z\0�Guh�@��\"r0{�/��H�_5Je�X�I���u�O�\"��j�1��T����ۋ*�zB���q�;]���4&�\"9xj2[|�2W�Vc�K��G��\n�A�T�kN$�庴�ίYWWQ�-��\r���a�Ⱶ8��R\n�oj�:U��*�G�O�$87j\0����ܛ@T���\0�wX�]�m�]�7)�5y/�l�t��C������i�5�|$�����͆�\"�I5�jZ����\0=�@tv�JdQ�z�����t�^�l���ֵ��}�c�V|P~T���m|p�v�߭l[k��\"U��\0]4���F!�4�8�l�JM�\nvI���v�\0\npy���\n��)��Pݩ@n��aC��\r\01�Q��jUM�鬸<\Z\0���zT\rd��k@!4�\n��2n\"|d�U����y��F�D�\0�@\n��O�1O,�2\rR��/*qY�\rj����t,@���Qm���_S��bHn���r3����/�hf�-�x���95r�;X���5;2���((�X�P6��)֜NO�`PJ���۸�R;�zP#4\0���A+�F(Ph�ȥ�ӊq�FSE\0�u[#� ��)L��@^�g���d�5t94��ր2JO	�RG��|:�����0�D�V�\"���R	w����*�Yʼ�@����J8�J%��MH/L}W4?�Ը5���T�,m�B�\Z	����I^�4�3ڀ��J8hȠ+M�;��T�����HB�=�=*=�9�1/V�Tmj��Tݹ5 o\\P{���MDmeN��rs��G=�p.f!~�G˚�o��\'3��E\0v%�����?+u�6%�:;WyK�R8�Q�lI/�8�Y̧��uˈцhPu��۪i�hy�~�M\0F�)�T���\r=�\"�۞3@C���H�T˶D�\"\"��(6�ö��V4\n�r����L���8� �w)�#��(o�\0p�W��I7�S5��jV�h2Ͻej^��԰6��^]\'SФ?c��(э���T屆�*T\\���g�\"=D��uVZ�����Z\0ȼ�f���H��nhX$�\Z芜|��6���\0h�^�̠�\0�$��5�6��tˈ�`&�Z�������5n�\ZRUc�*��Lב��\\��Փ��QUJ�\0�@s\'�� ���>ǰbE�z;��(9�u�#�@C���Q��m��;~��\\h�s�Vt�-l	�s@Q�W�f WE�x�#��cKs;d��a��hNڀ=r�Q�ԣXjWӕ�T�AumF����+��<mv�E�@��@0�<F��굯��o�p�֤1�*��\n�Xn1Lp#�3F�\\�9ɠ��Ԃ%=j7u�rM`�:ه;\r\01��K�[�������s���3_�W�ֺ�.��˖��\Z�4�DA��oA@����r������Ev�Ӎ���;|�:\Z�c�Cmn�2�SV�	@t�\0���B�1N�!\09��j�2�\0��+R\"��\\.G�98�,���\0��|?a|�Z9��=���\rP3F���W��!i��$�>J�?�y��v���=y�߇o,�Е#ھ���G�#��WZ�y����Ɗ�ڀ>)H�7ăe��׿x���;��?!^c�|9Դ�lF��ƫ2�\0Q\Z8�5r���ɶ���F�8a�\0��ȥ�܊���ҧSa�sJSi�<�6PR�ҕd�!LP6�ޠ����j\"�����Pm5<:���������HG=jS*3�\0�|?�cT��M���z��?|u��BE~���_+I\Z̅�@������Kfߟ�н;S��\"YL#8����׀�\Z����_	|u��cP����2�\'�� n�K�Md���n��=�ZJEEp�(�\\�Ԭ���⹻�`[�U\\���\\�Is��x�`�n$\'�]�n��k������[r03@�����j=� 1&�ym�d�@�&��,��\0�?�䶓l��\Z�F��<�\nMI}��#|�����l^.�P�n�6am�au�@\Z�K��s�¬��bu�6mu�N�Ek�w��\0Mr\"x.���3C�FĊ\0�^\'(�`��9�r-nh��(5t�d�h�CJ�n���s�\"��.2��\"�p>Zl{��S��~jG%�J\00s�憷�A��O7��Q��~S@�ңo���-�֟2}�a/�9���\0ăY�6�*`V��L�,�d��~\n�Ue�D4Ns@\ZE�?/\"�!޹5ϙ��l%EY�T�q&E\0h��jRr��PGs�,������\01c��\\(���p��)ے1�<��=�!�gJ}V4�J�%��s84�4�[.U�5�q�I!+�P�I#�V5��q�	����.N_ \Z���`��jטÀ���<�F���J�ӊ�{�(27q@��=2k8$��CP҆$`t�˽��(>��gR�~�e�+�\rv�Fiİ�r(�.4=GK�x� Z�ӼcsnDw�܊��#QT/<5ex��U\'ڀ+��)��P����i�uܓ�k����^�R�cϦ��vDE�\n\0�n/�p���K�./��Y�J��u�F�_���f{��t��0q\nh�xz�~g��]�\rb~t�t����&񩧵�U��@ �Y\08�Xc��f��v�~jȖ���E\0n̰D	��`^߱b�u튌�+fP�V��������@g\"�;�j՚�n{���P�߰�� @�nm�a�C�Z\\��4�t��$�k��-��,h�� ��\n#��[Q�̚^d��,G`kUu�����kF��g������[&��3\0z�}/Ɔev6���-*վ�K�\\UMC���\0�$)>�j=b�EȘn��X��\'�\0W�\n���u�^)��U%յ\r�i`(Ҽ���a�y���%y@�W�u�\'��\n������j�\0z�ŵ��s�J�����\0C�ɥ(@�5W��Ԡ�.M\049�K7jƇ�\"�^j���@��bNQ���v8-Ym}uz�QHCެA�;��\nͨ\\�6�S���Ph�b%��ZqE�۰T��r=�����>�����a�}�h5��	ʱI��Z�Kt�R��3@�l�z����ޫ�[�\'aP6���@\n.\"n��xpzt��i�NCT[����\0�\n\r!LV`��:�S�z�4ix<���\rF����8��6�(�S��x�@��6Ҩ�Zu\03mi�P0���%�4ye�4\0�U��i�:�5\'��Nh�ګ���b��z�\nO^(��s@��.��������Q���$袀 K��qS���T/d��Bl]9V4{�Q��CFq�Y�gN��Awp��S�\0�)�R��������H�1�\0�\0/�h3��Q]_�{�=�׾ Ah�-��U���z,�J7�5�����5�Z��\"��\Z��.>R�S\Z�t�릪�2�z\0�S��w&4W�@��ڊ\0���]g��)q��׾!��a$�X8���Q�l<m��������	k�����;�\'�:��4���wz-��iy����\"s^���E�ay�J.1��z�5���+�wC�8����&��[NeF�0c�V�6�u��&3Zͪ�F�@�/�9��U�����I*n��h��Wyq�@)\'�)�>�2C�c9��OZ\0p!O��9����P���\\1;]_qI�p�\n\Z����\\�W/���a2i���J�����F�\0��\0p\Zg��-�j��G�ei��ܠ0��h�Ь���(\r��Z�×Vͺ��4�(VP�5�q�0�k��]��0�*ͷ�tz_�-o@I0��@^h�\"^sUm�m$���B���g]�8`}*j���x�P�P0��>�+jv�8 ���t�&�\"��O��|͸�\0ߺ�,�������9u V���\0H0}�r�h$_ݕ�\n4�\'�fI��j�0$W��7n�^K8�p3@z����U���N\0\0�Wqu�|�X�\Z+ǒE\0rb{s�&l��\r~���b�E[�! �\\:`�@Ι��k�	r@ozݎ���?p럭x��~ϐ�[k\Z��\r��\n\0�b���I���o s��j��㜅K�u�i���J�h�3Km�!*ŝ�qM�J��E{�o�܂���_h���T�\0�>�st���t�go�s��pv�Ml��G֭Mw$����\0nj\Z�ڔ����[:BN��\0��k�T�����CVt�Bkٳ�jPO�g�N�S}V(0��j�B����%�=:R�Xл�\0��CU���1��I��5\"DhZO[	���V���0�X�g�c͹����ȸ�܄Y��@1�P\ZιЭ��y�\'>ա�3�jX��Þ��:�\0��sk��^A�?�����3���;���\nd�Cr6ʊs�@\r\\�z�Mr.#lj�\"�ᔃ_i���u5lƹ>��~!�4�X�\'��>w0n\\�B鷭z>��T��F+��:�D��8�8��q���gZ�C���L���f�*cwJi�֬|���­A��CR A��P,��Po�mT\'>����WQ�L��O��W���X`�7�@W�E\0|�x\'S���N��}\'��ॶ�\nO�F�pEz����/DU�(+��X\0��\nֶ��J#��T�U�@	4׭(884\0��P@4��ڛ$��\Z\0v�T�nc�S<�v��8$A�V}�	84�<���~�F�p@�[{%�7j�F����P8��=��砣\r@\'�sHΨ2�U9�(��ɠ��Vu�V�ٗF[��[�9�,e���\0R���m5��\\�ٔ��Z���ՙ �E��8)��\0G�����/��+��K��Տ���)_>����ɉ����I��j�BI��R&�3�0@�\r)\'��j喴�@�8�a���n�#�ZȻ�ޖ�ygh4�1�V�\nFi�a��H מZk�܀���\rmY������Z��ݬ�u��㚿\r�L>G�-d��߹�@��H\0�(B(�{�	=��@b�0TUG���\"�dw��^CR	�\n�i��a5��7\Zt��I�ɬ;��Q}�}C�h��-�J�a��+}=�~쐦���-�|�7�3�?Ѹ���A�iۚ��x�8@\rc:_B~bqV`��0�I�\r2�GLS*$�I9�YM�Ҁ\Z<I�v���⛷i��l�t�¥u5��\Z���*T�ҝ�(��q@��i�qRcڍ�\\������i�]\0D�/�#ƒ}�}*.���U΅i~�eE�`�����p{b�1i����W���d� VKx�\\�;n�+ۀYF=�S�����|�^}��ѼAisk�$������p<����G�q;�i�ҹ��j�[n�f��H6�א��sh�ɒ\rp֚��fqv�V����.�9�4�uhmP�zV$����D�Y�>����[p�z�@�������H<�B��\Z|`�{֓�F6¸?J�6�<Gty�?�p��-W:j)�:�C\\D���*��%���A��o �U�Y\0Ud֍��$��kgS����\"h\"f�tw@\'�8��^MF�d���r�i���G�ͺ�d���\\�@���sǗ�5�s഍KY1ϵt�����#T��~��}h�\'���_�[���i⫭4��F:�=k��0��v9��*�����l7d\n\0�;�jXU`H�Zx��G�1���¾��o6b�oZ��>f�h\0in����&�m���}��M�,:T���lH\r\0iGv�5�s��\n^#S,���l0�� 0��`���:\n\0R��L�\Z�iirZ\0&�\\����A%��`Ӄ���g�< �h捀�>���\n�m��{9�^���SX�sZ�,w`���S4�\0݅\0`A<��f�E\0���ګ��Z5\0E�IҦP��>�W�WA<]3@|�M+���̿x\Z��c��\0<�⛓�S�V��&��pOZR�F{ԥ=*\"�OJ\0af���Z��\n0}(!=iAy`(�L��0(\02x�g*pjhЯ4�*[�@FqPH��\rm�Snn`��2�M\0@,��Bbj�pE��彩nu	u�jҧ�ІC�r}��];P���a�\\N��+��2��:׻,B�\0�Q�%�U�+���*OOj�#��V��-��;�d�T��s�\n\0���?�QY�\0���E\0i��\Z������+�h5{D����PL?M�WY#�aܾ����v�R�@��(��\r�WIA\r�5���\0�ZV�򽿝&8��76:��&b,�*�����ZA����<1���N��<1��j�n��!U���]���� !6��Ҵ�ҭ�_tц=���<#��\0h��H��3O׼g�Y�%�p�B��ݑ��(	���F�.�|֨_���˻�B��J���pNO�6��j\Z&+ր�v����z��\0n�P��R�@��N\n1�4�=��	vq��zt��<v5 ă=)<�����m��|��1��[W�d��t�S��(��T�a��6�֧��|��yq]n��{�0�z۸���R%�K��cQ�X�/hv�PS�s�p��S��Y�����;Q��}֐\n��|h�D%��Ͻ\0Z��D�|��mw�6XWY�N���1�4�>i�2gހ2mu����Z+w����u������\\���{o\'�ي�O.����p�Wor�B�U=2v���_�k��{9q��JO�v۹�%�Ĺnk�Dk��J��\r�P�>�����A��3^�s�E2|�f��\\�ɠ*}6)y�pj�v<��c޺���S$)�gO\Zǟ;�\0�J���Gu���v:݆����	��8�kf(��f���[1���Y��mn	kr?\n�\rx��BErzo�59�̬T\Z�\r;�V�h�r��@ɴ(G��T�t�E�s��v���T�1��k��RA�,����u�g�[7����Y�\'��˵��ē�*3]m�������0������xŗ�\rt�Y�!�/Z��\n�I�(�h��w�ipIgj����1Ҽs�I;G9bI�#�>����`9�q\\���X]�LQ���N��Pf!3޽:}N@pX�ז_j6�{��*���\\j����c���kp%P��4�U�\Z��9��z�GV^\rta�(2�o��ұb8����P$���R&�0����I����WK�p��9���\n[�m\0L�V��GY3+df��Ͻ!b=��tσZu��>5f��i��t�6[�#ں0Ğ��rM\0G\r��cU�\n�q#�)��QԜ@\n��i-ک\\�6V�����l�\rߎm��p�ڀ:��\nB���rv�)��o�\"GҶ����|�V�.Mv#k*o:�\\���-V4A�\0fZ�c��5���k����h�Q�\n\0Q��ݤ��@���Y��R���(VI�d���>�0Dc�����\"���*����\\ܶ \Z�m��s1�k�1��E8�8�b����J�t�.:�H�x�8$qME��i\nހ���L;�㠦=�0�s�՛q����3@\'����EajB��T��<˫��\r\\��r���8;�\0\\�q3��^i�x��Dj��},`HFx����� �0�������YݙGlנZj1��M�WKs��$���V5ޖ��{}�@o)�XQ��gtH�5�4�|�a�;魎��c�Mm�p	�X�x�#<f�R�9��T-\0D�8�\0u�4.2\\\n�{����\Z��.�f68��K2H<�H��\r���T\nA���H����5wN��\0n�>���9�\Z\0��;rjp�>q�U���sJe�n(\0<�MH���\r&��! ����iоF�Mhm+�S�\n\0�}HIu<zUsq5��Rq] f\'2(6�H>d�m���q��I�~��2m-�Ut�m�db}�YcV���mN:�*Oq$\Z����\"��;`?w��ȥ��\n��Xf3�@�eM��P;)�S�F�\0n)qN�K��\Z8旃֕����\03`�I�ƥ*J6{�h����I;+|���vsK�q@%Ѭ��d�W-��<��b���\Z�H��r�u�\"��ޭ�����:V��\0_Y�L@��EuĪ�T�t+� �@�+?[��a	��V���&erGL�=�x˓h�>��^xST��x���\0v7��~����>����P�r��szw����x	�|W[a�+{��\"�\0C7�Z�f���}���\r��k��Q��\r�\'ޒ�R2�2���P�������q�U}��W�>,��F[FVj�y�_]��n]P���Zߋ�4�a	Wa�^W������+d������>��t{�X���O𝞚��%${P�����&����5��g���$!]�ں<#\r��\ni��y�\n�6|�p�����XfcC�(\"#��5�����C�sN�Z\0̓M9܇Y�.�����<S�`��\0�K�Pၫ)~`֙���\0�TO�F�84\nJ��ju�[�Um5�d�z���;SZ2;Ux���\n��Ѹ���m>��I�\n���Ni�^z\n\0��)�`b�*Gj]��P�&�r�@�g���6��n&�+�$P���Ѷ�*�l҅�U�/u@4T�v�͔l8��:Sv0�(&m:U�I�Sh������F���cȠ8�$O�\rL/��1Z�mtUw�I~U4Y$��*�5�\r�l�-��ɠmo�J \n�~�Mo凪f��N��(�I}���Q�� \Z��Q����p\Z��ٵ�jI_j\0�y��!�>Ojǂ��S����=3Z�~�ĉ.�z�؍\n�v�\0g[i1X�Pj���b\Z/�sJ>~ؠ\n� ����V�z��\0C�ZBz\Z�����z\0n���>�PH\r($�A֖��\\��7ְ�_A�#<dFݱ[B�6�I�<�#Դ�]�5�i��7�-�moz�x�J̃msz��G2X�Ӄ�DJU�W��}�i.�m��Y�x���5B@z\0�A�SO�O4�)vnF5s�+\09�3֚���?!�P[���8�*W�B��(q�O\n;�\\R�cҔ-(��\'#(���������n(#�(����$@��+��|!�m%���]a��Jr�\0�ԗW�n��w@k��|en�SP�$���x��AVE\'�\\���K�f\r�N�PG�wh\Z��ޥ\0t�A�5�\rkI��3D+V��>NR7�\0t�zlWp�Ļ��;�j���;]EA�q�շRx\00�z�Y�-�*�ké��`+�Iu�Ar��k\Z�Bk|��h�y��wn�sjP�&��\03R�m�A�����N��6ހ��IA�c��VL�$��w�\\�k\r�1.Wj�Kk`@�G�\0p2�6H�Z��?d��]��șHU�\'���?\"�\Z\0��#�ފ\rd\\�90�t�u��Q�U/�D6��(�\"����\\�<Wq��K0T��z��* �(�Mio=�P�Z�1:�=�D��2�\rxs^Ih���������7	r�����Q�HkM�M��č�kj+�g���\nRi�w�\'>��N�`�o�����P��T&Be�FV�>vִ�O�:���Y#\r^��&�a�7$�WZ4�V�.#P�J�\"&8PF���gyP�q��N�JnXP�JL�<R	;\Zx\0�l9\'Q�!�A`�&�����B�o�I#\")2\08`����\n���\n�u�Y�#Gn��+���&��Jc�W�x�Cռg�i��f\r �^k�|Q��-o��6���|>��K~�7u�v�W��?O*��z�\0�?]�e�\0J2\"���C�p!-̤�z����\0G�z\n�:P-*��0��}�V�*���I�?�j���I�94xt栖X��5f���B\r\"Y�1��h��2#�Iwsr�6����\Z�MXX�Q�\0d���;��i�k+����@�K�P\0A�2i	�ڔ��\0\nZo5�	��\0JG4e�Ve֬�1ɪ{sq�84�.�@��k*�X��-��lZK�wLH�[}>+q�\Z\0��l.o&�1 \ZۇJ�!��\Z�6��\0���F��@���qJ�@\r���jB�Ѱ\n\0���<Q���M��8~��q�8�����u���W3wq��ֲ��޷�2֝��#-�P\Z���6\n�qe%�n��\Z��a�@J�D��2h��ԮI�</�i���rH\rW.4�@ &ұ�ҝ	$���hҶ!z�9�,���I��8�\Z��L~k�@���ua�Z_�Hx`\rr�l���^\r;쎿<O@� �iF�<�+��P��l��o��\0Mր6g�\n���V=Nٱ�2j�a(3@#*�ڀiA����h���5��*���xQ�**���OAZi�px�[� �\Z�\r�՟ɂEt��Q<7Fh>\rP6<㊺��?�aUn4���U���2hxa�^iǁ\\�����;E[�WRp�hPޝ��;��+\n��\0\0��E���\0\nu7h��\06�ӱH=�h�)J�N��\"PE8�{�[Ҁ��@\n	y��I8e�)ہ�\Z\0ϻ�,���}������5��>����\Z�s�+�]D-�f�-��5_�eg`+���.��\\}�����-Φ}�}��^	�8��y������S_:�w!l�5��W��4�]��#چ�Z���	uuÃ�\0�h��*�*2��:�j��KS��r�\0�4��x��Y;ա	a�#�\n/��@�)�^�si�!�#q�P .rx��`\Z�ɥ��h���()�W|�8yTGa�FI�W<�9�\n�[q�@U<�����7\n��\0Q{E~«ɤ��9��<m��7i��u�@��\\E�\0�5Q��\ni.�v���<x4:8�\'j�/�{���lSҀ=2��zu���(_�jG���r�.�Ӛ����]-���c^x�]����q#	S��ժ�\'(A�L-�y?v�\Z��Uՠ98�i-�\0��>��.�6�(�g�ǰ�22.��[6ڍ����S�z\0<�QG�*���2�\Z�B�~j\0���	�;�+�i�@�*�^(�&�*�{�Jc�E\\b����*�`�i�/������ր!!Gɦ��>aV|����)�[�y�\n(�Z���Y:�[��ڢ���w0ق{qE��=�y�$��4Ǿ�}��dۚ�t�It���vQ[Ce��w�N�+�\0f�p�REq���m=qT�M+�4s�R2VcEu�8�K��vq@��摀4�{�����_� QS��Ґǎ�բ��Q@�hR�\n\0f�6�~�&)\0��s��Ӽ��5#��O��\02k85\"�G5�j>��v�O��+�yW(�O�v�8+-v�L�G|���O�m�4)>�۽\"��1c�\\��o,��b�PvٴH>Pri�SGָ�OMe ��NG�u�~��g�=�@�o���y�H�6W�J_rc4\0���D�\'5%\0�z�-\06�\nZ\0(�Ji�3@T�4�	�&J��H�`ph!O�i�	9=E\"�{�(�x���6ȣ�=S¶W�X.ڶ�3v�����P�^h���.�<��������د��I��I���#�;�=b2`�B+H}(z�V���lp������1����� ����^ئA�����S@�}}hP���KS�7�\0�z�ݱV�y Ԕ}�P�5�A�Y�D\r�@f����u��K���\0;�滦��n�A��f�h����[ڀ&�I�ᐃWR8`^01\\��}`�䚣o���/�(+�S@��p��`�=��<�\'\'ڒ+�P�ns�5�o�£���@�Ɵuy�#=+*O�-6H�OX�!�(�Y�6�F�$N}�L�$9Pw3X@�T&�[^��ɢ�?4�S�+�=�}�\n���>aQI��(;�\'�@���6\0K�lìZ�7)�^#�����-��D�?�\0vb�%�;�+J+��+kȮ�+ȟ�kOK׮��F�2	 �ǁ\\ŷ�[:����תP@��Ԡ`W+\'��*�_��!�T�^H�E5���\\����|��,Z}����(���8T��}h�_�e�}+b����5�	���3H&�I/ך�l�;+\0<��G�io�`A=�Qu`M\0O�`\0R;������A�5��g��hM��Q�5FmE��K��G�sW��,r��O﮳֬Z�#9���X�!�R�n�@�����s�R@4��P���\0�\0q���a@9�Ф�ix�f�>�����\0�8��A-�p�X�{5�� ���4��<�$\Z\0&՜�\Z�d�����*�ɩ�4��PE��CfnkM-�\n�6i�\0&r>ZP	5.8��h���=�D^�(�=��q�Ve欱��TZ�{ߖ U�hZ�P��|�&�g��;m�-��)?�D�j�c8ظ4��u)���֥��#$d��HM\05]Gʣ�ۖ�&�Gi����x�	w\no�3�n�I��@���\0j	,��N�R%�VE޸)���\0\Z���Z����m��Z������SZV�Z(�\0I�\0r��4{�Ԇ�6���.�3����6�\n˺�̹��\0fZ�#�\Z�4�岧,��I�w\Z�ki��TP�ز���\0�I�Ů@���6�,��H�`�d�׽\0t���I��kM.��p¹mb�$=�O�n!�\0VI�\r��sJzW/k�M��kEu�����\Zx51̠��I�\0v)�A<ӻRh{qI�R�@x��g�iQ�&.\Z�� �fK�c\'=��������`��E\02\rZ)�:\Z����\"���8�<\Z���g���\0o��HIk=i��\"�҂�)�P(Ҝ�Z@A��R�EPA�A�b�2��Y���@��j\0�vH�X�`1�ayq~�@ U�\r�����$��|�Df��tx�n�e�V8c�aO�#�\0hD�0�\0�\r�dt����Ҝ��@ר���*^��\Z\0�6�����L���	8��s@����8�$U�}Z3ÎkZKx���\rT�K�����%��9�P)��X�iWsS<��O�	�\0l�dQ��Efůvt��^�8�@`��jQ��Q�Ҁ!+�M ��Xۚ0~n�[aq��$+��{�v��+M##Ȭq�s^m����\0�����黥\0v~\"񝦘\Z8p�����U��̥-�	�:Ǧs~�j���i�V��G�z���@�ف���z���CT�&��|�j�4�\n�i(�^(��:�[��\0�5��\0fE�i1X��1�f\\t��<�;�j�Q�R!c���a���_1�c�YZ1��ئ8�8��!��-�\n@���j^{{�kr���gF��y���X����+��+yf�.$,2q@��װB}�zխ#�Z�����@>����w\'J�k$�`�\0o�_�@�q�ƻm3�%�ڏ5��}6�P��6�q������5���A������p\Z�nGWӥ[>߭t��l6����\0{�\0�v�sLA���I���P3]^��+�7H�O�\0t��F#�иޒ�:O�p��;���lW�qR���Y�+��<@ŌV�\01��\0h^�V�K�_�K%��>ز�ջ]}FQ-�;s�\Z�-�Ⳉ$\n�����fZ�����v�s�iW�Pi���R�>N�<������(�#n9���T��r�S7c�\0V�X���f�}�W�&�e4�u�!\\��V�na�I���ZM�����>\Z������8�j��r���}�\Z)��&�\0�sFi(��z�R���iqO�\0E�R��L�6�@c�)%��Rm�m\0e�Z%��D�	z�fѯ�2^\'f��^��r��\nE?��	�4��^+����J�ɮ�	-�42�z�ռ3�}���5-\\��A@�b1��d��wJ�t2�;���9��)�0ѐA�c9���;�W�d�@\n�ϵ$�;\ZU_j6.z�\Z�P���t�i�YݓҀ\Z�=iL[�TS^[[�\0�p+2��Q/�y�\r�^Y������\"���jM^��Bқ�s�2W+�@\Z�z�BO�7�{��CjDF}�B�@X���iGeC��~�ʶ�y}�esWt��g\r;ﮐ(Q�S7�q@�kx�)�ª�h�W�0�T1�qZ>ja,���@w���	�Ŝ�`9�4�O_�m���̾�W�)�0㊫w�[]���.O|P;�vw�6EG�&�\"du�lW���f��b�����z9��Fe�ѥ�~�A�y��r��B7���7�֗*��I�]3�<{��0�]�o4�%X���e�3�.=�l3\"U�\\�Q��\0��Q�A/�q���8�jm\"k3�-L]Z��~���@8Nz�<���r��a����2�w|��\nhnk�v_�3Y7{	.�ۙ�чOHz�������i��vY�|�ǥt�#�??��@��v��̉X�Ӥ�,�|�*�x�5\0c��*��M�WAH\Z\0���$\n�o��Ì�5�N:�iob��\Z\0tv���#��~������8�1������\0�k�c�p�g��dF3H�S9�����ׯ4�Kwy3��@��k4��q]J��~U���8�-- T\0��#T��v�_9��p��4k�\0b�%��x�Q̒�Ú\0���\0J	���U���/��4g�����Y3���Q%���\0kI~��U)uG���x���K2���_��8��?خ.�K\r[�фd��U\n0(4\nA_uFj`r)�03օ$�h�u⛷ޞ(�b�}*9n#��cT.uP�깠\r&`�����\\倬V�..�T��Is�;@O��1H��UE���d1\0֬:dq��MZX�c��o����Ҏ����9�+ހp���z\Zg���ӎPq�\0;�\Zb��;��X�P�ڃҨ\\�Ŝ75�.�s+m�I�%�1��5�q���XG�^-.[�\Zf+Z��lp�q@��\\�>Y��Z��LQ�Ƞ�h*�(�$�\0��0�C.�M���v�R)��I��#uF8q��w�$��`)����v���pB�zP$�,���+*�8���zܛV�V�eM:-\'�|�i�J=:�ټՔ�=�WSZ�\0�-]H�QW�V}ޖvF�@!����Z�{X$�0�/�Teӥ��TQ���B��@#7Vǌ�V�\Z����k*-Vsđ����q�Y�˰\r�@�ڼs��uf�A��\r��VK\'��8ԑ5Ƙ6�-@w;x�� V%���bS�ZQ�0I�q�\0��:�X\nhĀ92��=(\'�\n^P�5±îi��җ��*Oaˀ�\Z̗G�2Z&ⶊ��T��4�ˋV�A5~�U߁ �_��&�:���\Z����\rO�A��\0�j�Ϋ1���j�nc��C�3RZX_	L��\0ԟR�Բ��A�V��\n@Cܶ��5n���U�B0�҆�����;Xab��8�HsHF�\0w��t�\"�z�G4�b�p8�z��E\0QE\0QE\0����\'�Pi�f��\0�6���@\re\\h���LEt�(9�@ʵͷ�rqV�Xu²~5�c���2X���(	5�[X��t&�mo�J2�LImn����U��s8�\rq�g�e�n��8��4��i����3���j3���\0��x�e��ַ|_����!P��c����O/�f��;�9ɠ���H�z��h<�c]o�$V��U��Er�CRM�iOlՋ}*3t�����t�7�q +ך[�Y@<�\n��T!�ḏˎo֛�\04n�cK�ր.Y]���i~S�5�ե��9�\\�����!���[��$r|�8��D��.�,�N��W�xs�3xgT��RRc-��}7�!�;�{�	�φ6������y���&�f\nֱnF@��M�>خ���ژ[NԀ�@;F���\n]�H��\r�]F0m���r����lg>��`��,��*Oқc�KP�t�u�\0y	����$z�L4��0~���:t#Ɇc�8�M�k��d�U:�΂�P@Z�ݏ�Vmǈ�M.A����־��5-���\r��-�1�s�y����w&[�qons�q@�꺩X�{��^�q�x~1��|�&���:�h��$�Ey����>>�6Y��I��=�?���\"aR���e�Xٔ��+zדx\'�M�V�-�2>3]T�~��7�!yTP�*\r���EB�:6ݵ��1�m��LL�u�,|yh�D+{�]���:`UkMv��b\'���	�� � f�zn���^݉� P�����NI�VXn��.Z\0����4��U�\n ��Ҁ\"0�M���9�1L�@�{Q�ce7e\0A�EO��\0�����Q�\0f����P=h�i�R�\0(�����i�i��3b�-�S�`8�X��Z\0X�瞔���\n:�|PCg�H\0@V���y<�#��Y�ھ��H#�\r僊�@O�Ȫ��E���u�\0V���]EG���i���<W�x�A�Y�$�����m����4c�\0��	t���(Fda^a�{}j_+N\'�oX�j:�!m��7n�CYX�5�6�yp�S�i��[��?-ZV�0[�\Z�\0�b�����Qe�k�xf�܆\'q���AH�@�oJT~T����N(\0�4�=��4�}h\0�����\r)�`�Op)���@\n�zPa�.75&ݿv�\01��*�͝�║�\\U���l�ր8�c���f�r���a�[���B�K\'��H�2�  �P)���/r�]E��˺}k�\0��sx�׮b}+X�$-d��-\0zS��C5�w1��@�+�Ӽjև��T��[a�[jh>��1��,�����z�\r�Ֆ#t�G�u �y9����q�\0P��#p�\Z�I�U�d\Z̺ѐ�����[��J�O�G�J�c����v\\Z����y��o�Z	�cͯ�2���I��n��Y\0��kI<U)5XH�G檱���Ĥ�5r-�{�6�������-���Fkf8!�4���ܧq��ƫ�\ny���4\0dP)v�hH�&�Lwb�X(�0�zRrEP�X�GSY�js�qn4�|�(ː+#�Ź$��Z\\ܑ��qZPipŃ��\0�7��/�VF�L��WL`B1���qfTf�\0�M>8TtcW6��\0����<�izd;_�\0hG�\'\0Ҟ�R��\'=)�4�ڒIV5%��\r�K�dO���Q���5�����\0k�}}����pE�&��K�s��N+F\r*Ts@os|ٗ U�m3n7�Z�/@)�v���FjBv��9�c4\0f��0)6�P�Ҏ{������v�Y�\"�\' ��I:B3!�cM����.���N\r\0h�k1/rk:[�����;kF�F�W2rkB�v��1��c.\Z��֭��V��P\n��Z\0oN����-�I��1KH1ڎh�l�S�OZ�X�Y�Z�P�W�@\Zl���\\��85���_�dV-��s���\0�6�utq\0;iֺ9�}ӓ[�Z�l�QS�\"�+�e�~�6�t��4l�\0\\��K��R(�y�@�o�d�hHx�oJ�\n	�/�\0r���Sk&d\\h�_r�\r�]�ާ\r�*��?,��R`S�\0P����aA+Vc�E�������ܺ�8�w�I�\"��9K ���?Z�\n�8��8>����MP;}�xQ\\�ĩ<!+L�}��8u)-�	�kJ�X�o�*����-��Ǘ*<;)D\'�������$�����\0}N�G0�0o�;k�-\'�q�\'�������\0��?B�Ý�f�;��I�g���T�j6�.�a@����v��5�u�IpJ�g�[��W\'u�v�n�i�$�n�-���<��[��t0(�ɫ��0��*���l���>���JN\0c��?*pMQ�N���\"Mt�ޖ�9��na���ӋU�U�Vf����JM\"8�h3�\0юtq������ky��t:���\0�\0�������y$WPT�\0}Q@Q@Q@���\0��p��HT\Z\0�h-�<і\'�B90&��)�/� R���i��9n��PL0ȣ�{�	�]�g��4l�J\0�K��i)k\\�ڨ����y��[9�d��\\�A�\0x�w�:k�Ÿ��o� \nĊ�n<7es�����+��2m�\0Ak��27Z�]Z9T�\0�%?���$g��q{�1V@�BX�*r���,-ɊS�6��\n�]����5��9�=(��y�j�WӃ�d����>.����9�895�5�ze0]�w�0֬�<�	��Vl�@�,����9�f����p����|G�$�L����W�|m��=�{�`cր6�;=#=�=���^9���6~��Ed���~)������\'8\'TZψ�O[��d{�9�����\'R�4���mc\\��~,CoXh�6���Y�֯�{��@�*��zW���qֳ����<�O�V��պ���Hrs��+�Ӽ5k�����L�,t�XT*�8�nt��z�}(������`\n�h/������4�-��&�/}\\�4�t{[�U�Q��W\'��=�dia}�V���i�<��.�֔�f0�^E��R͙��Z�G��X�7J�z�m�h\"B$��s�5�������^��j�-�Eo�����0�T�e:���n������2�t�\0zl�3>��D=�yc>����A֭���M*��-ހ=�#�M�����j6�3[�M�������;mN�\0��LT-Ҁ\"#4�jV��FN\r\0&�)���J(�-\0c4���b��1@\r�<t��-\0QE\0QE\0QE\06Y|��c5��ks	\nF��}��2*�ۖ�Pf�8����� �Q�����x�c�^��b�c\\\n�Z\0��f��k�d;���,�%[i�f8ɮ�X�v���j����7=�\0t�\r�GV��i�c���MG�3���@k��<W��9���\r��T���Q�J��=�(b�5\0.y��\0�h�=(\0��(\0��u\06�u\0�)�Ph�Q@)h������0OZ��P;�xV�PF(�H{�)7������`k�8_jk��0�+�@}a�Y�Ey�5�����+��Bi����RJ��+���}�l�!G8�=	HnP�)5�a�k�m�[{����&ud�봯��hH�ޙ�w:43d��s���}�+�Wh���Fz��\rȠ\'N�����>���9-�s�4�l �O���k�\"x��,@���p�A��<�.��Ŝ��)+������8��@�ic�*�q�9`�\0�}ƕ��9%�G��~5�u�#�[r��*�����\Z��\\��\n�J�D�ؚ\0�}[w�>�I���o��\rm[XE\Z��	�j��(�0��3�4�5��0cj�V0}i	��\08cQ�\"��3�\0��KR(=M)�\0���KHѲ4繊?��V]޶#Ȅn>��;\0�������;����߷u�Msfo��)��D߻�2��������B�٭x�;D�F7zՄ�1Fp(�\ZL1\0Ү��E(�#��2�⢎�7�h�ڔt������x�AlS])��3@\0`iǧ�Ā�p+&�\\�7��a%�\n�q�G@��H����\0ը4b�t�4V[����@�RA�\\\\��A%kj8�\n3S�@�ҡ��uUPa@�4�O�\0)4\n@��=h7��y������qڗ�*	���2+\"}q�b�/�@�,q���f��ʹ��Ύ����@5�m�,x�~c@�}���\\�j�\Z-���u�8�E\0ԙ,=((m�q�*M�<R4�(\0 �n�PMI�(84{R�I���@\0�)�\'B�S��IR�VP�&�;#B��6�/�xX��ݟ. �ӣ�%�����k�e mQ�ր1��d��q�Z��t6��^j�q�Q���p\nd���\0jN;SH��@�����a\Z\0H����7�N�^��_A.GZvh���z��k��J�ֵ���Nksa=���	�_X�iv��V�����|>���e��5�����5߈5A�\\�D-����z���l���-όf���)q\'��.����v��h�\"y��\"�7��\Z�1s�ny4�B��?J�mn��<�ڃ�9����H���\0_ү!�����{�Ak�Cu��V$+i{20Bj)-|�M���P\\���~t��W�h7>x��k�_�-\0o�0q�^�K{�n��;w���2\0b�\0��h�4�}���V����/5g�Z	��Y4Lb⫘.��H��>{R���\0bG�4J�ը5�� cjKdꂩM�����\r!*8�q�ґ���}�����ڜ���é�7@`jJʇXV�n\r^��)(R3F@�J��sN�\0  �0\'�)t�@\0�sKE\0QE\0QE\0R\ZZ(����m(�H��*��M�60I�W�M\'w�8�C��+���k���Ƅ�MzB�^�4���<bm:�Nm�#dU-m�w�{c�[9���Y��,�1@�&���x�d��:�T�%���GZ�Lz����j�Qt�b��ာk�kZ���h���P;�ߋ4b��ʣ�-s>�&��[�5�ɱ�NsWl|>��n`2(n����*Ӭ��#��c�(�\"��#G���;�6����V#�/aW-��;��J����1�>V(57@)ȫ0�\n�9��YE ?(�\\Y�iw \Z\0���b�EfjZ嵤de]�a\\v�w<�;&8�8��-��O{�^�4b]&I���ҵ,��f$���z�p\nǰ:V�^DF� �\0bom��Z�uf���Mna\'\0��0K�\0V�VK���MZ[��x�Vu݄6�\\8���V���S\r��@^��Z\"�\r���&��q�d+*晤�ڲ�z\ZAך�l�hB��?��m��\0D%H�;�֌I,�޽N+��<8�<0N��CP�Z���̏�F�Z���sot@`>��u���v�*	���?Ao�.# q�\0uP��5y��NRR<���醩evE���j܃����i�c�j\0�!�+�\0��8���j(թE;m��(�i@�\0��Pb��\\PQK�1@	E)�\0QE\0� ӱ��\n1@bA�R�p��ъ\0����b�2�i�h�ŤJDѫ��W��4�5͓�a��]�\\R�=hά���%�\\��u��,�A�	=*���o|�dU��rZ���Ō�.I�Pm�}�T������7v���^�-;Z�Ԑ43�P��qH:�\nu!⌚\0Z)3�K@f�\0(��\0(��\0(��\0�M�9�!,����\0��X��)���S���@��-���^%���/�%���#�W�����<��\\����ʌTw��O�U����,���s��t�d�y��uC���B$�\0���t�dS���y��5�Lc=kL񽫀�ͲJ\0�.�c�vl=�\ZMKr^7\'ڷ-o!��=�Z����9��]Y�\n@|L��m5�K\nJ\n��}+*}�ذ�j\0���c*�V�������c�w���2��$\Z�F�n��7��*�S�Uk}B�ym֭c��@QF)zQ�u�ɥ$~4��E,��7H@�$jGu�e�d��I�[�Y�m��a�@j�UZ��ԧ�`j{m}�O5�\r�p\04��\\��|�W5~�G����kGq�H��H��N\r�֑YOJ\0R����ъ1@O��sֳΔc�d֦Ӟ)�N����1�\'���+N�_�qTo5x�H���Ź��bH�s�C���d��ϑ�\Ztz!�]ӱ��4�m�&�\ZY�_6d%A�48����4�5H�ba���c�~���\"UpJ�FGJB3@�sM,sҞ8��@\r�sN��Ӟ�A�8�Rd���Q!�\re��qt�`m\0l\\�p��3Y2���q�)���rC�H�{k�W�\0�,vs��H�+m&8pH֐����@��8��I�iy&�PrGn4���Ƞ��&�җ�1��71�$��\n2������;b95A����s�EU[�ɚ����;Oz�o���|�� ���@U�2m�S 3d�Ƶa���ϭN��rO��^G4��SX�j\0r����h�B[<t��HS-����#�e�\0MPKs��V%޷!r����,�5��Ph�ֺ��ڍ��UO�\\j.��5�g�Cj?�}��Ʊ��b�(Y�Q���j{�H�i\0U��9�!Nr(\nm�	ȪW:_���\'�]gA�4��`h�\'���˘�N�>�Q��Wgs��r0F+*}E�,n��]h�F|��i�-�C\0ig�%�f]�T��?+��y-%�慉�]V�ۇ���\'�+V���q��\0M\0m[��B�V�7�Jf������v4�oqo�)8��0a��I\'��C��$օ���������ZM�Z=B	������(��AH����ST�ڀK�3Kր��y�e��U#h�K�u�v��tec�8��i�C�	�����f�9����<�r\r]����kN�*��dS�}(ɩۿ��\0��,r}��$�y��Vhn�\'ҁ�+�MN�,	A���kp�ć�5h�b��o�٩��@��3K�\0-#Ri;e���+���fPpz��ғ��\0�HNhT��M*A�x��\\Gl�� b�{�K,�+0On(kR�`����2��4׾ ;0Ѧz��=�\\OxNz��I�v�5����Y���sZ����`��YwR��\0f�h�W9��}����[�9xF}����G�\0y-熵+�vp=) �u�dnÿ�E�P~������P��)ϵ\0y�|C{h�̸n⠇�Q��P�.�}룿���O>���xM8�,���\0��&�$1!5�Ы|�\0Z�T�5�)��r��-�=�nRz\0��4�\\�����N92;U};�ze�J�ߎ�	�z����V����E,�Z�ŉa��zT�Ƹ#�v�;����4u�<��|P4�\'���c\Z]n��[�.�$oZD�彬����b���w��7�U!�b�ͣ#S���)�ǚ��}j�p(6�,\0�1�[�ܩ V�Ȯ��k��_�[Ls��c���x�i��\\XM�ˮ��HB\Z��i7~\'���AD�q]���m���nr\r#A��P�*���r�F��]��0{�e�\\2|��\Z���f�*��ē�>�U��J���E\0n�E\0�E�\0(��\0)N\0QE\0\ZLR�@	�1KE\0 ���\0(��\0(��\0)8▃�@\'�N޿t�Aր�rh\'S���\0���4��ؖ1���O�!VR��@v����o�5���Et��`A��[���q��]��W0���s.�\Z\0��g�&v��-��j*�7����%)�0ԅ��R�ݡ�h��Zh qN��(��(��(��(��(��(���ۏZ}4�8�Mw��Aڹ=O�����,��Wa�K@o�-_G��K��,|h!\";�;��gE�\n��5�y��� h펯o�.a`3�j���s\\߆u6-��������I�e�������]i�$�&���j�o�s[�$o�YO��;.�=�fԜRŨ\\ِ.A WKPOk����\0����\r9�hc��\Z�{�#��kW9.�{j��	d���]M�8��Kۓ�I�h��xp�<7���9�AV�\0fY��w7&��A���U#�\0\r�<R�N��:���ւ���Z\0M���#�#J��X\nϟY�,�ɠ\rG$⠚�(z��Q��}���aҮ$!�\'�,˫g\"*�R{��f�b��\rÚ���}ъ\0ȷ�T�ֵ\"�8\n��0\r\0 `iH`��m���:��*9�z\Z-�ͷ�<U����Ts�\05�D75W��B�EZdW?JνX BT�����g4ٮc�r�+���o7��6)l���P\'ݴ�Eq��\Z�%��l�;]*8�XU�#(�2!�L����oe\r��L�O �\0dQ֌@#�\0/jh@iH&��\0gi�iq�PKq%�hc�Ҙ�G\n��{���������\'r���λ�\"�8��Ñ�����8����\n\0Ĵ�հ�}�ق� \\(�}�8����6{P	z�̧P�j3�	�4��(��X��\"�zS^�8󹀠	#�d�$Y�b����L�+������w1!\r\0h^kBO��;��Vחm���Z�Z<V�j�Q�(:�I�3��������AzP\0:�A4zӨ\0�#\Z]�`PE(\0R1�*\'�c���j\0��zqPMw��)�{�1����3PA��j|��=�[�`�9��j(�\'����5�k���\0\n��i\0�@i�E6�V5΋��WtWp�\nc[�F\n�\0����\0�휊rjWQ�\\��)���~�\0k.}\r�%���f���O�;}C�Tw:\\0d�9C���ش�b�5��ڨ�8��Ԯ�^s�X�wqd19-��i�(d;$���\r�M}s�zӏS�C��>��܄-B�4/��4٫��*E!\r�k�K˘=qW-�@T�(��g�\0�T-�xf���	�a@\nwv��@ ���8=h�t��J\0�Z\03G�dQ�\0C-�S�\n�6�e��Z�)� �h�nm���\n`����z�]��TOm��Ph:i\\�F+F+��0�s��|��Y�i�q�ѱ�\0t���� \'���G{=��ܜU�}m\'�H��\r4� �i�������\nYf�%.�8���A;�U�bE*�-ڱu\rrY�1[�i�,�H%����\n�}�W���#5���pڪ���z҆�;d�K�)����(ۀ;E:�S��rjj\0(��\0(��\0(��\0a~p(���)��L�@沷�:)�+�\0�V7��\0�]&�ښ�۹�@]��KW-�3q���i����+^�_�A46�?,��P��Z�ͥؓVV s^����L�E��f��Zuڝ��j��H�N�J�j\0�{�n�c�:�\0�c^1>��\r�r�ޮi�\0�a�lH��=F��;�wf���!�\r0p1�g�x���� w�����ю�\\&y��\n�ν}#�}?w��D��\'�ns�vzV�oh�����Yl�^\r�F�Q���Gn�@���M��2j��DEs����n�q���\0�p%�1P�eɲ@0k�[�Dd�-�QQ���G�\0Z>�$�ފ�|qb	���O\'��\0(��O4%�O(\0�\nJ(\0��(\0��(\0��(\0��(\0��(\0��(\0��(6F\'�K���E\05My�Q@*W��Wp�&ۄ��P�xQ�̺q�8Z�W��a�p�MwǑ�g�i�ܩ0��\06�U���T7�5�FW�\\�ừ&3�H}p\r\ZW��-�[ޡ\0d�\0�\0��:�Z�Cv��pI�\r��\0�R����j\0u�0��y�ڀ%��ݰ`ri�-@��\"��P���c�88�QA��\no�t��J9��&��\0L�R\0)�Ps�k>�I��ϛ�{�i0(��<ŷi��j�iu-��&+я���/��(��<`��.�g���J��YW�٬�K�^���^��7�\r�)X��@����9��F�����~%��q�v���]U���.y��z\0�q��\"�)�f>�u܎v�տ�S�p�J��G<�:�������j�1ğ-^h\"q����>���v��������\\���i�(Kb���S{�D\\Pm-�Q]�d�k}V��Y�Q>���r��͞��-���\\�IPj�\Z.pe9��%1�P���F(�1A�Fj�{\nB��4E\0!\\��p����h�E4)�\nI�$w��`ґ�Tr��\nͻ�D\\C�P���Z�s��v�ƹ�$��|�TU�M�\Zf�ր\"�Y������M��`ұ�n�ij��w�L\0\0b�)æA\Z��	�)q����c�@\ru,8��̑����B��C4���~u��ܤ��K%�r\0�?���[�41���(\\S\"VE�v�.u;{`w��.t�Yn���W=u�&w�o��,:d� K#��\0Mq������U㱹�m��[V�tp��A5pN\0�2m�H�l��V�@\"�!�R��;�@	׊`C�zT���P\0�\\Rf�$m��\0�҂8��TR\\���@�n��[�,�b�ﵰ�V��>Օ�֤��J��\r;�p6V��T��BNr��֥�����\07ּ�����|d�NF��J�\0]�G掻���M�[��̘�5������)��x&�+�z`�����sb�=�i��nQ~���i9��!�9��<d<�b����C�kW9������ޢ���=NzP���P�j��y���V�1�c,Â+��>P�\\�����*@8����H�\\�o4�*F2�d��k\".Mc���BL\0B�\0־օ�DC�\'ҳR�M��իa�,$<�s�kY#X�B�j\0ʹѠ�G���ִ1�p*J(��9�t�n;������\0i�{S�H[=(H�����޴�g��(�Ii�}Eej�m0�Q_뛉����U;M>��MӒ��\nP��2*n��h����]���V造���uA@�\\�lR���m8|����MIG��fM���#u\0aŮ��$���k�����76l8��W\ZK��$+�\0��%9��}�*Mw/�������ə1Wlu�.���E\0l[k�>W�X5H����Vn7#��9a��gى�n��N#p���On���}*H�Cqlt%}h����+6�U��@]·�^Ica�\"�pxЄ��g�iq�@	�ڎ){P\0:R�t�Ě\0�[8��©ˤF1���~{��M�q\\Ω�&ba��J\0��\\���-��A\\�\0���}.\n0L�M���]���y���l-�V%�\0s�:�\rʀަ�U��\0+�=*�֎�g�;k2}\"��G-@2�q�\"����(u{�f\n�q[v��J���M\0h(��IU��j�&��@E�P�QL��Z	 �E0�SJ�\0:��S�m4��B�@\r��\'\"�0:S����\n������1ܩ�\0I��v̡��`j^�nQ�¡��J������k�N�.H�@3��4��1�\"���$�h\Z|�m��s\\狴��㶗w���\Z����xk�!�x�\0t�;�������]V���k�	�4�V�k��+\n�\0�ʲ�Zɴ�P_�gr�p���]8�G����^7u��[Gm�H�@<s��U�v�(�5[�- \"@�y��w���ҹk���i�k��5{Dx���؄��sG6�z�^���B.e^��Pg��@)@�4�p�����u.)1@\n)\rf�\n(��ii��N��(��(��(��(��(��(��(��(�����uF�m8=h��8V.���/T�J��Y���(`�/Z\0����\0F��;�Em�\'��[õ뢒�H�A�s�����L��{PA\r�w	�&)��u�:[�KB�n1]N��{k�N$�\0�^z�9���\ZiuC�Z\0]��Q�Ҡ���\0\ZV\n��wŞ,�D�x�<\Z\0��8G�����a�׀�/�S\"$�\nx���Ǻ���Gou-�(���cA��Z��)�Q����U�����x�OԮ���&A�\0t\0�S��{\Zq�ȥ��PEPEPEP�R�\0zӺSr\r\0 ,M+�#�\0�8�	#\r@��kk�9@	��o|2[Hs�+��q�\0yꦩ��3(���,�\'���vm\ZH�:��VUׇ���\0}��gy��kPFT�\Z��d���sX��ZƗ.۰��M ���K�2��E�Ҳ4�[]���?�t�r�h�}\r\0cͧ�l?��\0����ٱ 8����*�b�8�\nV��rq!�^K����*��,x&3�Y�gslr������9�~\r]�`��[��\"�8�Tpj�ƥ(I`k!�In������[���ˍPKŹɪ�i�7M���V���\r�rh�W��̨�+]!P\'?Z�9(��9�$q�0��Rja�\r;9P���\0(<�E\05��Ho�I$��YW��@D\\�\0�gH��qT�uXa)�V�wz�\\�l�m�u�9�\n�j�s��)�i��O�N�WA�p�*��~��t�_�*�Mm���|�g��9�xn���k�j1l�r*V�T�\0g�r:VU�̐1<�o�#���׭7R$�(ʚd�q[��\0� �z�f����}�����9�����#��J\0�u�����T�:�l�5�m��nCuj�\np�P]���	;��i���P��5\r��[|��*�׊�q�p�%�<�.��U�D_��^�,�ԵIڔ�s�@<x[���:z���vӆ�<a}��^�9�W��|4�/2�)c�*��*-[tci��Rh�o�]�pn\\s�sY^2��|C�6�mf��Z�I~�I(W;�ާ��=��i�s\\s��@��:晨ۥu��8\"����PH�$�z-���Ea���.��Z\0ݿ֣�`95�f���\0��M\r0\Z���^h�`�i�g��!���QR����@\0\'4�Q@Q@,	�B��A@{т�x�@\rbX�C���sU/uHlԂAj禽�ԥ�@�\r����笉ާ&Dd��_�a�\'ul�[�E\0\n\0ΰ���1�����@*9��ҝ�����4�E5�O�\0!��K�r)9����h^�a�U)t�nT�7g8�H	,x�)t|r1��[�,6%P�ں-G[��7H�i;V�wZ����\0��E\n�9	4�u��,�uq�z�Tn�5^�M0�\n�@���H���*�����@>�Z�O��7 �����s��&:K�D�L�.�m~Q�Y�\\_۷˝�z�X��5\0h�kN��3[j�J9l\Z��8.��H\0�����\0Z\0��^P�+����ӮH�6��Y?}�h�%�qҨ^�v�yV�ҹ�W�G��w⟦�T���\\Poqy�ͅ�\'�l��vr��\03w�(-���$K�Lێ1Ҁ�p��>nM+(#&�#P�9�/^��o4�9�e��n\n��*��\"�1�V��3�^A�u����h�,(���/���DH�QIw��\0gí�x��քWqN>F�T%Сl���|�W6��	��o���E�n�m�8��M^9To���]�������aNǩ�\0:�(���斐��\0`\0�)�qғ�4d9�$c&�c��ڌ�vr�@�y���ZW˲b�۹�\0{:a�e5���\rX5����/�5u��P�7㜚��MI��9燖�(�W�\'�7O+Hd�}k��7��oH.4��:���%Ƴ�m`F��nr+�tm�L��\Z���dP�z_�u�D�9��x�5�\0�T�$��n�\r�����\'L՛3�9���V�e�@V��A�<P�Ə�1_z�����k{h��<p*׉�b9��2�	W�>k��\Z\0��?�2k�k��)9���-���i᰽�{4H�*����rۀ{����\0�y�Q^ײ߼k��6)@��\0\\�\\�J(h4Q@	�M��(�h�N��\Z�E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0SYM:�\0nN�֏���%\0ӜR�NiMZ����L��\\��\0�L,_Nʿ�vu�x��[��e��\0�+�ӵ�mO\0�ެ�閷��\"0��\\�����I����\0G�/O����ƈ�:��k�c�5{�9��]��c���#�sZ?�~����Un4��$7\Z\0��D�I�+�ә��OE�w�d�#]�ȯTE�EEw�F8&�9�)`:l�\Z������C}��$�)��OU���,�l�O�/���5�\0pX�\0���6Z{6L�e֭d����k��+X���P^2i��C�\"��V�VXܜ`��⹎XVP�a�\0M�*5�)>��\ZC!S�4-��`��\0��(�E-\0Rc=ih��J(��\ni@zӨ��T��m�F\'@j����A-c�nՎ��Βۙ��+ѩ�ē.�0�:�Ɖ\"�C�ֺkMF���\"���gj>��Rb@�\\��\0��=0�-�m���=(z�@`C+δ��X��lݹ���]���,�К\0�6�����*�I���9 V�r�/��\r�4�ӊ\0��y�7D�Y�+;�H��.�޵�(�S�\0�B}-$�m��Β�/�y�.�*Ċ��W�#�e?�\0tt�����8��\Z�[�h\n�����;�1�3�\0^��j	���I,3�YW\Z��R%���\r�\'H��a��Mƽ%#R[ֲ����MňSڶmt�QG��oZ\0�qux~R@��Z69�浣�\"���n�PQ[E�P*^i�Ny��\0h\r�zS��ڌ���\0;�\0iM7~�P�=)\0=�\0��*��`\\��P������λ[Kd$cwֳou�n3�}EGk��ܑ$�q���(\\��I![=�{U�\r6���ֺ��E�oZ���xN&�1_�֮+�0�E)t*;�,�2��٠\r�*)n��Iyc޸}O�m	0���\"�Y��k�	�\Z�4����K4V�I������ۉ`���<?mo\Z����؎4�v�\0�g�X�=��޷\"�#@��R���`/$�P:���JH�rN*���V�I`O�s�z����۩\0��\r��b(��JȞ��P��򢥰��,$�9����#�R�1,ti$����յ�6��f���@]�h^(�\n1�\0i��x9��\0�<��f���49<b�$�h����1Xz��yK~O�\0m�^Gn�f�a]k\\�KP\n�mgw�Ғ���-*+P�\0cA��r��\"��,a�Q�Fj�a��/\0���ZZ(2<t��zu\0��8�8�4�s��n�<P���N���|�����a�9oQ@\Z�W�Y�f`O�k����o��j��Ӯ�&\rrIL���-�l@�@�Z�Iu�{����@�I>��\0n}�p=)h�f��q�5Bm&�d0kP�A�\0���\' ���\\�\\Q�ș5ܞ~��B�\0y��d8�-[�a�� v����,�\rr����eO����<E�+�����O(H��z��ڝBԭ�F91��#�ޯ��%ʻ��hܠ���|ئV=z��/�!;|���f�$�#F���;�5�X��w�\r�}r2���W���:+�m>6b������\n�Ñ�\0�AV\Z�qj�V�bL�+z�]GA��\0m�5^����*�硠���9��������@�A��4)\0�hǨ�\Zu\0V����&��4a�\0,8�v��A̛+�v�c�����\nMo������0;�Ph5�f���*8ʰ5�q�0%�8��k��,\0v4���O��0k^+ئ^X\n\0�<�P�t�VV)����\0q_-u+�:X�������Z�����\Z�/,��H�}>Uep\rc�^ҵE\"��_� �ޥ��� � �Һ	|Htѳ_p��k������ևL�F1ڼw�>�5��D9�(�|#���\06�����ur(?Z�߅���^e��ƽ\'P�m��^i�U*24\0�gK8\ZK�\ng�^w����V��i��8Ȫ\Z������!��=�4�u�4�M\0exc��n��Q�<�]��T\n�\0R��>�;\0ѐ8���b�\"�h�qE\0>�(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(�\00��ך\r�����ݑ֓���]��my�������4�/nX��+�U\0�48R>e�@����ަ�8$����@`�Yڎ��aDl}+�{-C@��}΀���[	�����4	vv�ds��W��^,�LG~v7Nj���];�?�;NzP�xbŵkd���#%WE�A�Z2ZF.$#��iX�5`F�A�[�>���<�K�ƀ<7O�^��o������:Wk�oj�\Z����\'��� W�$0Å�%_�����[�)s\nH����	��j�.�!n�������1���kM�}�[\"����T��\0��CN���:�\n(��\n(��\n(��\n(��\n(��\n(��\nBqKHH�@O���8\"P��oqFr>n(�Əgr�1�sW��q{YJ�@k��@<\Zp$���Q�jZ\ZP+_O��n��Ϩ��Kxd�5l���Լ\'oy���m��m�Z\\`E*�٫�����EԴy��B��K]�RR�z�rU[�`�y���S�\0�KOX\\�Q���Ea\"�� �#�n��rc������WG�������2������S�U_�k)�͟J��hQ�g���4\'��1�����Ox�ܐ��i[iQł�Tm�9\"!%]��\"�m���\0Y\0&�R��Sw�9�0y�\nA���ϥ0�@\n[)���(\0�M(�M��U�/�ss@w\'��u��l�k�f����J@	���$�ĳ1�\02Mn��Ё늚�D��L�ƶ��!�Ff���\0�o�A��-�VC�\nv*9d��R\0�	\r�f���+a��\n+S�,p)[C����K�ed���\r�O�Sl�g�����Y��,�k�Ӽ5\r��!�}�f8c�b5�0,�\'k\rp��޴����[|��Z\r��c�P6t��#\Z�i�H#nW��(S�o�Ұ��9���\0phZmr��(��Y:�׍�����u���̾l�0�۴��MP�7c�\0>[�3�{\Zշ�����QA|�~a�j���E\0?p�����sOր��A�\'�����ɡ�@Ϸ�9NG4ݣ�U+�V`@`Z�.I\"D3#b��Հ�n7jʾ��ԈX3���h�P�<�z\0�����͔SZ�:@CK�\Z�X�mU���B�v��T�dSA$r)��\0@\0�#=)�rz���\0uQ@#��7QZ��h�	zz�;�R+d;X�&�[yr���P�����\\���g���جjTz��\r\0DD����[[�o�#ڞ�O^\0*��0���&����w��Җ�I�)�\0QE\0����q�TL<��(�g�ҩ�jpY�,�5��늠�lr�8��].�T�u�!s@��.����U�����eO����Z�1X�5�ա��i4�wF�����N\rF\"��tJI�K�(���͖��+7�ڂK.ؕ_%k�*��2�Q�j�FU@S�@)�]8�$2c�L�\"�\0����q�y`���ey3*��}q@�sgr3pU�ҽ�2�\0ǫ���zD2�|�*�	y����Y�P�K�N����kr(\n����[�m��RK;���2hf\r]\r�~;����+��N���OEe���<Pu���RO�s�z�`	zV�Z�2c�.��#����)���}0dR��\0W4���wA�\0\'#ޣ1�.C�?�K���|�L2r��}Ƌ*�����&�\Z\0�{��b��u��gֵ�hz�?�Q��b���P���o��5:�q�J殴im�v-Ii}wo��H�:V�`���[B�q�g�T��t��s�Y> 񕕅�G��<\0(���}*��8���ky�3G?�.������\\]�BNFk�l4�4�� PE\0Sд}\ZP�x�ح�\Z�X��.݃4\0�\0�-5S\'u?\0�R�PQK�(h��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(�Pm�-Pm���\0L���%]A֔\r8�zP3��F�d��q��ڦ�&Ӹ�\rz��=�WhVUP.��{�$�k����C)�>��j�\\y�~U�.�W���	~�P��\\zV]��o~�B�֒�!�@\'�ns�iO#�P\0�@\0���:��EPEPEPEPEPEPHFih����-\0Ō\'J~(����E\0���\0���[j���+R���\0���%��ى���j\ZΚv�`�Fh�E=�WK�T\Z\0�<co��y]����&�K�	Y� ���n�F���-f��\0�p)�p�.{#�Q���Xk���������좸� Y���W�9������?Z0���y��6\0;h[�Q`$�=i:�01TgѠpYF�.Es�t����-%��/���5q5�c�P\'�s��u\r���\\�ϊc�m��\rS�i��=��%ֵ$�l��4C�Kpw]k[�v��^E\\u�1ڀ)A��\05uH\0�\n�ב\"���hAL�E�K9\0\n��<K����7�sos�j�b�2h���J�;c�k	�R�_kn\nk_N��ŉn9��5�CD�h�;�1ǉ.[޷�#�BƠc�RH�N����Z\0AH5�1�2�V%�����9�\r{��m��XVֱ,���$TX\\�2n�;Mo�iP�(�ɠkK	��u�Fkr�N��\0MZN\0��\0.@�8R9��Sv�@��	�*DF;S�(�Lk��T�԰O�Z\r\Z�9�\Z�&9�	b�I��zMc\\XN��bE-���sv٠\rrOj���;e&B2+.�_M� cY���W�n�\'a���&��v����ty.��tO>��m����Z��^��+Q��R`Ph\0+�@��Q@\r�3�u1�GZD4\0�hjB�Q��h�Jk��K9�Z��;D%�&�˛���)v�\0ռס�JBr���w�I����U�?��%�I�[�\nF�U@�3�th��dd֐p\0�:�A4\0�f��R�;E\0\0b��u5X�5&q@\r���1\'����.j4b�+Ҁ$��)2A�Ȝ��5-hG����@\ZW��6JL��a\\����.���z}Ƨ/�u���{[��\0�Ӵ%P$����mcP�\0��?-\0�j\0�ZZE;�ih\0��i�P{qFZ_�)A�\00d�zSdU���)����W��6(K�Z�L��\ZY�y�<�|�%�ۥ2���T�؛��k��4X��;��	��e�z6��m���=	�]�żw)�Q�Ysi0�E�����P��?8�U���YFۅ��I4�����u�Y(ç�(���ű5���d�5�siy�`�\n��Z�����z\0��sas�ض�\n�n\rP���Ų�cHt�_�W����j0��oέ����� �5��=�<�M\0u�=��\0z�m�ؤ�n���ι?:\0�\n7\nO`i6P�攌�h�9�������Se��#���\rGsF&2�M,�i��@\0g���x�K�\r���O�\0_�V���ӎe<q\\ƙ��J��We��@5�x_��0��.y��D����\0s6o>��ɄQ���\0Z�%��g�U�H�L#\r@\Z\\�/*EH˸W)5��|�p*kk��s���(�^�)��m��na�ւ:���袚I\0�)���E\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QEdPH�ZU�s�~h��84����Mx��,~^*��mz�N��:��;(@e�g�f�Ɋ��*Mf�O�%�$��o�瓑�To�/c#`\r�@���°\r�����p�:֑\'�nŇ\\\n�a�R\"�M��&�:��KU���PcpI�Vh\0��(\0��3�\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0(��\0F8�r9�\ZO�\0V=8�;Rgڀ\Z�G�4��\r�4��q@w����Cu`O�k��6,PJ�M!�P�%���K���[v>1��̾Y�5�Ie����}k�ռ�cjDgڀ:(/-�Pb�[>�c�y��u=]��\"����c2ȱ]Ǵ2E\0v�\r��.4�.�����`խ.�r{f�}�2�\0���q˾��%�MP����Q�l	�=�.l7�֌w��n.��5���co�w�W�j7:���m�j\0�G�pY#ćڹ绽��\" Ȧ��+�`ڊ���YIf�AQ�\0c�����>s�]�[�B�qS�2�4п�\0;>��J��T�\0Xp+>�WH|�vk��e��u�)a��V|��j���A��z����ր3�./���֭��Gt�sV��\Z�#P)�+d���*|�0)ïZ�5P��h�y�Қԣ�4\0�rh*iO�i���\0��ZBs��S�f���,p(6�4�%˜UK�N(�C\ZğR��>Z!\0�\0Ҽ��Dx-X�;�VN�MhYh\'p�s��[�p(��a��\0a������*�,Cu�2㸕XT˪&��\\1��mQ��Ĥ�84v7W��f��X`��LJ֬,Xs@�s�R@�Q��<�����JS�9�Y׺�vˈ�f���+��-GY-�[�}�����r��kgNі\0\Za���.����\0朜V힝���j��(�\r����\0*�E�q@���J\0o9��\nS@	����}h�y�@\n\0�7t����y%ː\0.�0�*���V��3��������{Ve������$)�h��\Z�� Fq��ӴA\rw�7�iZXEj�*\r޵l�#�#]�\0��4�zR��@���1@l��#�(\0Q��KH)h\0���4PA�iY�O\0TSO �)�gP��C�,:q@\Z\Z���\nD~jƏL�զ�%$ ��v��,�\0�t1�¡c�\n��t6��(�Z���ړa\'4���\06T,�)���6�c��1@ �x��i�K��n��r\rK�P\rƏ6���=�C�s����$�\n�≸�A��\n���� �,_k�9�S\"�f���!\'��f�.l\r���M������z�U����e�)=�$R��\0��Ϥ1>dSl��\0jIb#���P���r�Uu��5�ֵ̣�գ�_�/�@��n�W䊞�n>u���bcp�Uot�tX��\rKO[\\�Ӆ���@}�^o?��^6*k:��Q�.�(�d��6��4���lm�ۆ\0޾x�g�5]�]�,�ZZ7�O�XEi��r�\0vz��u����������ǅ�����S�5w�>�ҭԸHGS]NF8�\0Ӏ�S�)T�>j6{Q\"�S�@�.GZg�H���P����1��U��ƀ0�4L\r��5Tug����Tn��\0}s@�Z�@t5�o�C0��Z�K%_��{���0>�\0��U���OΊ��\0���\0����@�Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@Q@5�:ө���8q��YZ�����@��\\��\nU�@��D��,ʵ��x���#ֺgD�a�\Z�u���/����\r�wK�0�K*}��pV�Qџic�+]z��Uf8��6D�[���7LFY#\"�|�P�Q�SCz���V�E5I#�u\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0&Nh<�4Ӝ��oZ\0F�a�7ֲ��=mz!���;Sf8�(����Ճ������|E���K�ϖ:�+�����=�0��T�W���,x�(�4q�E¤���R�ķ\Z����q\\�	��&3�����4�K�\0	�!tȠ���3]���B9�WQk����F����=?����nǭ�/c�P``s@	5�s.�����2̌x��8��P6����m\nJ��Gh��;Z�X���?*��<5�w�@j2k-�v֥���1�֨�iSiC�8���@�\0׎�E�	l�C���@V�+(��<sNۚ1���qH[)H�E\0\0�=�4�ݻ��\0��8�HFO#��I#��v�y���o�@��)��\r֭=�)\08����쁥\'mnZ�ځ�&�2l��emӓϭoCi*�Ϯ*n���\n(��\n@6��n�(�M\0�J��Fn��\0�\0Ewi��JK�\0����V=���r�x��k��\nBr���{�`�pDf�2�<[wq!�;�^���C��o��ݟ��c��|�`Nb�.�H�D��ϭW����Î��\0�4������$F�@�)	4����0<�\0�pi��h۞M;�\0DI?{�NyV%̇����T�nr�r�Q����9o�u\'؀����]�������Uic�\0\0�(*�A\n�,�\'���)A���(��(��(��c�6BW�я�,q@\nWҩ_jp��İ���Mt[�<��b�au�܉%ȏ4,�Ϭ��5����l���ޮY��Z�ղ}(\0\0��(�VɠQE\0SZ�Mc@�(���j�4\0�B��Hw&���,�\0V���VGt��(ί��b�#l��Xv�z��m�!O#4�V�-��i�\'�pk�DHU\0\0\n\0�t����@>��s�nb����	�q�\0r�f���|U	�����۶��\0\n�>���c4�Ga�g����5u5[�\0�vz�$�>��H>f����\'��\0�5;I���ޕ;�����ɬ��{V���f���j-\03[�m��g*\\ġ��q^K�|;���$� �ݐ{rk\r\Zn�*ho�nO�2�c�@���u;>ҭ�}k��|aor��>���9nc\"EP\rs�~��LC{P{m����\0��\Z��:��yV�mwep\n��\rz\r����1�P�<�I#�69�a�ȩ#�\0j�=ix��Q��\0���j:})h\0�)��t�$��X��J*?����E\0Y��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��N;S����4�=*Ji��^��r)6�.=(9���\n����\0��%�Cv��t斀8�5\r\\]nh��ӼI��RkV����:��GQ��)�ȕQ�@���R>���9�*�V��HK�X\n�쵨/�	��\r0r8����NE;4\0QH4f��BqJh\0��(\0��(\0��(\0��(\0��(\0��(\0��Bp(h�\r��3ր�ѷ=i�4q�]��sX\Z��RR��P���Vi�l�=}�a\"����+1��u�ݒ�k��<=�`̻��9���SS`nyD�E�hv�X*3\'|�ڨE\n�\0Ryk��\0b���Gsi\r�m�A�66z�R�f��֒��j���u}7�B�z&1҆P�C�@}�������U���i�%�Ԏ#`����:\r��>dC\'�q������i4�*=��ڒ?CJF��kͭ5-OG���tv>1��ț����T�����o �AIT�jl��s@�h�M�sP�����t�2#��@�j�2PsZP��7B��t�e�>jɛI�����\0tG��GZ���&�;e�V��	q��@\Z�B��YW��p��{Vl����e�c�V,4V�vw\Z\0�#��_r�!��M\ZUZA��ZD��؀�׃@\r@�0���NM;TaX�O\0���)�0)�@u�N4\0�)��JM\0- 9�ϭ �w4:�c�\'��VM沣1�2M\0^��a�9�;sww�I�|�4[��o�������;TG4�a����%�r8�@*�szR���\0�gޓ��;�}(\0�5�<v�֔�zP9���R6���f�#�+`�y���\Z!�ʙ/��{d����X,gp;@��Kt�P��Gh�q�\Z�@�$����s}7�!;\r\0Mq{6��a\n��h�Y?\'ޮX�on�`��z@�@�\n8=h ���phH9�I���\n(����QFx���3���{��f9!��\0X����\"�\\�Ʊ-���U�:��\\��ҷ��;5�Z�3�43+y�|�zߍ� �/ӥA�@�=iI�Znܞh��qO\0\n6�ғ;z���4�����h9>�\0}�;TsI�bC{��cbA>����\\�s�*��	�-V��S�y8ȫ�G��X��:�W��,�\r(�\'�ks@\r\0(ڃ�����ǥ5������R�UH��sր�4�\r�4�P}�����0�p�5�i�\0gϣB�(9�۽2�&-�t���gj:�VQ�/�P:��c1j ��.��į�hi���ݙ�S�֥Ί���h:���1dq5�%�J�=Y���_�+>�;9IQ���\r���5^k��s��q�^F���j�f�ë�f6\\��ހ�w0	�V�Z�B�����0�	��͔R���5m��\'8�\r__H�:k) o܃O����BH�g�\0�Ŷ�Q�n^kB�dR���M\0XwX��p+�յR�HO�\Zָ�0[��x���4�H&����@��ē�Q^�,�b�(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(��(����JH�H�M)��@.��/�A�\\��\0����h�G�v m�ޣ4��x�{�Jx�#]U��(\nH��f�j\Z,�~P��\\Ě=�6��E\0w\r\' �N����/!/�8�ཆ�A���	��Z�\"�=�\0��(���\"�[\'\0�(��\n(��\n(����ҞE \0�M SN�!\'�\0;� �����V]�����zP��e��X���#�F|�X�\Z����\"R��������@RM}�?��\"���|4 ����޷!���vĀ\Z�In�P�\\B�~���64���K��\0uQ@Q@Q@7�y�S���8�\0C5���>lJ���=C°�	�ںC�B�t�7�A���<䕙Glի_�ٰ[��ޙ\"�õ�$PG�Q��m�c*bQ���4�Z_ �\"�zZ�� ��ڸ���f���;\n�-OSҾO-�W�(�e��h��1��sO�$s�ޟ-�+n\rJ�q�����>e�5?��c;t\0�ю��/i�ɣ|��b�.����{}�s`#\r�֫\\i�N8P����Pw����Nk��L��L~��_�Z�\"�P@N��T-�D����\"H>S@�)�	�T�b�X��8�C�Қħ=jQ�E-�q]�\0o\0���}����H-Y�ڴ��]�$Jm��-�>y���:��Z6Z0����Zv��۠UQ����ҀQ@A�N��\0QE\0g�(�4P\0N)�=�H�dP��� ds@]��JͿ�c�c;�Ҁ-�wHK0R+�Q�Po*�=E$v��n�*���=>+U�\0��\0d�褐ӌ�z��&�\0qRt�I��\0ΗOy�8�Ls@q�kU܏�3F��h>+�S����$ث�)���P�Җ��;#���h~������g��ԁs�\0 l�]�ys�TwWq�!.@5��jS�����P�S]ٺo��J�F����v�pj����x���oz�iڃ�#����@A��i�Ԣ�F)٦��B�3@��(\0�8�KMe�4\0�NsJ\r0;�S��%˜P\0����j�kH�^�jz񌔷�8�Z~�.�(��8�y�\n�V�:�ۦ��J�t�mTyjzԱE�@*V\0�H�ө��:�\n(��\n(��\n(����R�c-F�OJ�ֵ�\Z�V�s�8�	�]v;0V2�b�,t��[����9����K�>�zO\\��Yi���x�@�(�[��c�P^4�a�5J}.	؀7�^4�`P56�p	d��v�Wb-�Y��}q]S1�!�9G΀��@T���~��Y�e����x�2J�.�$��Fv�����<�(1<A\"�\'���E^����L4�J��E��oO|Vh�ݼ��9��\0m}�\"�Y��u�RC=���wv\'!��G�}��~����?O{y��ϙ�������8�I-�bp��O��B�\0P迃����$y���QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0QE\0R�ZB3@�F})6�P1@	�5�nA�(�k�AxK}���v���Jr`�bZ��ĳ##��ր9�+ı�#����t�\"�h�A��ô��C��Iu-\"_��1@���i�Ȭ}?_��*��[\0�>R�����(\r\0-w��a@EޚZ�Hނ��71�!y`{��b�_jp�).G�}�_�1���3U-���A�x[a�P�Π�^�	^��z���ݱ�ԃ[Zv�m�ĹcԚ�\0�Pk{8mP*(��\'���T\Z\0�����J��wqNȧP\0�(\n-\0QE\0QE\0QE\0��R�@ۻ�;���#9�=(���!�P��C,��F��=��xV��V�}����u\r5�g���A��>��M��U�Et�%��\n�Ƭj\Z���99��^x=�X��9�@�2�ܧ ұ��u��-���1[Z�-�.W��(<��d�G2�`*;[�.�4N>��8�3dґW�g�Ϙ][�$WEґ�\\`��%���qp�4��NT�L�M�^���i�GnE�9�w��qFDM�����P|�B�YZu�\\n��T����0B�<`��zlp\0Xj�@1LIeܦ�\\�p\r1��qҜ˓O\n\0E9����sN��(�\0�G&����FX�U���xN�WH~T��b%Π��g�\0%�=��A\"�Ӵf���d��5�g�Cg��֮�5�B�\0R�)�(�rM9�qKE\01x�G|�y���4�M;��\ZTc�����S�$�a��(/�R+SX���_K&>I�-KYg]��t��O\r�\0h�����\0ͱԦ�d��m��`3b��D��P-��o�=�@�%���1�ҸȨ����	�Nh&�$WSN�\0DP��Q�A`)A�\0SKv�9�S9��I<�����V�w�P�Ζ����\\��������ڣ���V��y��[zf�\r��q�(���t�����j��X�\0S����\"�8���֔u�N*	���PCd�ҟH��-\0QE\0R��&���\'\0��Tm2�b\0��\Z��W,�P�κ��m�2����4C���<���N��<��y9��\0�@\r#h>��^��sAPNh\0�z�d\nu4�&�\0�)�)�\0�F�GJ\0i\0�N�� B�@�����r�l�%\"by��-]�e�-������j�i�c�\0S{k�~�{�ҳZ������t�8��T\'����@���\02Z9lW��������b�\0Gh�\"�9�=��.�9k���P�������h�E��s�Ҋ\0�\Z(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\n(��\nJ(����Q�[Gr�f\0�s���J\0毼8��X��ڲ�֧�&�1?Z�A^e�~oF}h����b�\r^���K�=�]!��)\0�(�E\01�O��$,ݩ������\0s���≌��*�W��ng>Q��[U�W�^�����_����-�@b��ֵxQ�1N��\0\"�i�\n(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0��(\0�<�)OJA@\r�O��\0�qi��P°u�̄ڦ�����W�\0y�����u����R�x�XK����-[�<��^#�����@Ϧ��j]\ri{W\r������P4���8��^�\0ǅ�QT�Ңc�\r_�K@2�ݩ�����́1�:���k��>�Pݶ��z��A+�ѿ֊��\0Pݩi��S�\0��()�F]�\n��՚���;V���\0�\\���\0���\0޳�ː��b�!]��\nt���J(h��\0(��\0(��\0(��Ҁ�Zj��\Z\0�ut-\"i�����o��%ũ!��lk�\0���\\���w��G��	��e�O!\0���;P�Zu\'��Z\0F<U)�Zl�5*��gZ�I��ê�p��ڗ�?J��\Z\0ꢙf.1Tt�W�J\0�i-�K�ǚU�~�\0ejڲئZ�}fA.�S�W��i�W�<�\0jYYGk\n��`�������m��\0�wd��GN)�Ҏ�\0QE\0QE\0QE\0��PO2�B�?AS����>_�\0sw7�kU�������(ye�k��\Z�ǭw�\0���t��Z\0LO)\r(�@Q@Q@h��K@�\'��砮CQ�T��-�0pq]U��zK��G�\0���\0�@^�����%z� m�t�>��(�@\nG��O\'�iW��Z�3Mx�Q�\0��4P`�����E\0��','image/jpeg'),(85,NULL,NULL),(86,NULL,NULL),(87,NULL,NULL);
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
INSERT INTO `mensaje` VALUES (1,33,'Un asunto','mensaje de<br />\nvarias <br />\nlineas','2016-01-13',0,0),(2,33,'Prueba de mensaje 123456','un mensjae 1235','2016-01-14',0,0),(3,33,'NUEVO CURSO PUBLICADO','La Universidad Nacional de Ingeniería ha publicado un nuevo Curso, puedes obtener mas información sobre el en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/publicaciones/Curso>Cursos</a>','2016-01-14',0,0),(4,34,'Alguien ha aplicado al puesto Ofertado','Miguel Angel Castillo Cornejo ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/curriculum/ver/34\'>Curriculo</a>','2016-01-18',0,0),(5,35,'NUEVA BECA PUBLICADA','La Universidad Nacional de Ingeniería ha publicado una nueva Beca puedes obtener mas información sobre ella en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/publicaciones/Becas\'>Becas</a>','2016-03-28',0,0),(6,42,'asdsadad','asdsadasds','2016-04-17',0,0),(7,33,'NUEVO FICHA OCUPACIONAL PUBLICADA','La Universidad Nacional de Ingeniería ha publicado una nueva Ficha Ocupacional, puedes obtener mas información sobre ella en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/publicaciones/BolsaDeTrabajo\'>Fichas Ocupacionales</a>','2016-04-17',0,0),(8,34,'Alguien ha aplicado al puesto Ofertado','Miguel Angel Castillo Cornejo ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/curriculum/ver/34\'>Curriculo</a>','2016-04-17',0,0),(9,44,'Alguien ha aplicado al puesto Ofertado','Miguel Angel Castillo Cornejo ha aplicado a tu Ficha Ocupacional, puedes ver su curriculo en el siguiente enlace: <a href=\'http://localhost/scse.norte.uni/curriculum/ver/44\'>Curriculo</a>','2016-04-17',0,0);
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
INSERT INTO `municipio` VALUES (1,'Ocotal',1),(2,'Mozonte',1),(3,'Dipilto',1),(4,'Jalapa',1),(5,'San Fernando',1),(6,'Estelí',2),(7,'Condega',2),(8,'La Trinidad',2),(10,'Sebaco',3),(11,'Somoto',4),(12,'Santa María',1),(13,'Macuelizo',1),(14,'Murra',1),(15,'Wiwili',1),(16,'El Jícaro',1),(17,'Ciudad Antigua',1),(18,'Quilali',1),(19,'Tuestepe',6),(20,'San José de los Remates',6),(21,'Santa Lucía',6),(22,'Boaco',6),(23,'Camoapa',6),(24,'San Lorenzo',6),(25,'San Marcos',7),(26,'Diriamba',7),(27,'Dolores',7),(28,'Jinotepe',7),(29,'El Rosario',7),(30,'La Paz',7),(31,'Santa Teresa',7),(32,'La Conquista',7),(33,'El Viejo',8),(34,'Puerto Morazán',8),(35,'Somotillo',8),(36,'Santo Tomás del Norte',8),(37,'Cinco Pinos',8),(38,'San Pedro del Norte',8),(39,'San Francisco del Norte',8),(40,'Corinto',8),(41,'Villanueva',8),(42,'Chinandega',8),(43,'Posoltega',8),(44,'Chichigalpa',8),(45,'El Realejo',8),(46,'Comalapa',9),(47,'Juigalpa',9),(48,'La Libertad',9),(49,'Santo Domingo',9),(50,'San Pedro de Lovago',9),(51,'Santo Tomás',9),(52,'El Rama',9),(53,'Villa Sandino',9),(54,'Acoyapa',9),(55,'Cuapa',9),(56,'El Coral',9),(57,'Mueye los Bueyes',9),(58,'Nueva Guinea',9),(59,'El Ayote',9),(60,'Pueblo Nuevo',2),(61,'San Juan de Limay',2),(62,'San Nicolás',2),(63,'Granada',10),(64,'Diriomo',10),(65,'Diriá',10),(66,'Nandaime',10),(67,'La Concordia',11),(68,'San Sebastían de Yalí',11),(69,'San Rafael del Norte',11),(70,'Jinotega',11),(71,'Santa María de Pantasma',11),(72,'Cuá Bocay',11),(73,'Wiwilí',11),(74,'Achuapa',12),(75,'El Sauce',12),(76,'Santa Rosa del Peñon',12),(77,'El Jicaral',12),(78,'Larreynaga-Malpaisillo',12),(79,'Telica',12),(80,'Quezalguaque',12),(81,'León',12),(82,'La Paz Centro',12),(83,'Nagarote',12),(84,'San José de Cusmapa',4),(85,'Las Sabanas',4),(86,'San Lucas',4),(87,'San Juan del Río Coco',4),(88,'Totogalpa',4),(89,'Yalaguina',4),(90,'Palacaguina',4),(91,'Telpaneca',4),(92,'San Fransico Libre',13),(93,'Tipitapa',13),(94,'Managua',13),(95,'San Rafael del Sur',13),(96,'Villa Carlos Fonseca',13),(97,'El Crucero',13),(98,'Mateare',13),(99,'Ciudad Sandino',13),(100,'Ticuantepe',13),(101,'Tisma',14),(102,'Masaya',14),(103,'Nindirí',14),(104,'La Concepción',14),(105,'Masatepe',14),(106,'Nandasmo',14),(107,'Niquinohomo',14),(108,'Catarina',14),(109,'San Juan de Oriente',14),(110,'Matagalpa',3),(111,'San Isidro',3),(112,'Ciudad Darío',3),(113,'Terrabona',3),(114,'San Dionisio',3),(115,'Esquipulas',3),(116,'Muy-Muy',3),(117,'San Ramón',3),(118,'Matiguás',3),(119,'Río Blanco',3),(120,'Rancho Grande',3),(121,'Tuma la Dalia',3),(122,'Waslala',15),(123,'Waspan',15),(124,'Puerto Cabezas',15),(125,'Prinzapolka',15),(126,'Bonanza',15),(127,'Siuna',15),(128,'Rosita',15),(129,'Bocana de Paiwas',5),(130,'La Cruz de Río Grande',5),(131,'Kukra Hill',5),(132,'Laguna de Perlas',5),(133,'Bluefields',5),(134,'Corn Island',5),(135,'El Tortuguero',5),(136,'Desembocadura Río Grande',5),(137,'Morrito',16),(138,'El Almendro',16),(139,'San Miguelito',16),(140,'San Carlos',16),(141,'El Castillo',16),(142,'San Juan del Norte',16),(143,'Tola',17),(144,'Belén',17),(145,'Potosí',17),(146,'Buenos Aires',17),(147,'San Jorge',17),(148,'Rivas',17),(149,'San Juan del Sur',17),(150,'Cardenas',17),(151,'Moyogalpa',17),(152,'Altagracia',17),(153,'Sin asignar',18);
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
INSERT INTO `persona` VALUES (28,'Administrador','Administrador','M','2016-04-17'),(29,'Miguel Angel','Castillo Cornejo','M','1992-02-18'),(30,'Jose Manuel','Poveda','M','1985-12-14'),(31,'Rene Mauricio','Cruz Hernandez','M','2016-01-13'),(32,'Alfredo Heberto','Martinez Acuña','M','2016-01-13'),(33,'Sergio','Diaz','M','1985-01-13'),(34,'Leonel','Martinez','M','2016-01-14'),(35,'Jorshua Alberto','Arauz Cantarero','M','1993-03-02'),(36,'Eynar Josue','Lanuza','M','1994-12-09'),(37,'Miguel Angel','Castillo Cornejo','M','1992-03-09'),(38,'Eynar Josue','Lanuza','M','1994-12-09');
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
INSERT INTO `publicacion` VALUES (75,32,82,'La empresa Empresa SA esta solicitando urgentemente un jefe de proyecto graduado de la universidad nacional de ingeniera con experiencia de 2 años mínimo o cargos, mandar curriculum vitae a la siguiente dirección de correo electrónico: correo@dominio.com.','2016-01-12','2016-01-30',1),(76,32,83,'La empresa Drew State SA esta solicitando un técnico en redes o estudios similares para cargo fijo interesados mandar el curriculum a la direccion: administracion@embaconel.com.','2016-01-12','2016-01-30',1),(77,32,84,'La alcaldía municipal de Estelí solicita a ingeniero civil o estudios similares para la administración de obras municipales. Se solicita inmediatamente, interesados mandar cv a la siguiente dirección de correo electrónico se pondrá en contacto con la persona seleccionada.','2016-01-12','2016-01-22',1),(78,33,85,'descripcion de la publicacion','2016-01-14','2016-01-31',1),(79,35,86,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','2016-03-28','2016-03-30',1),(80,33,87,'EEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE','2016-04-17','2016-04-27',1);
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
