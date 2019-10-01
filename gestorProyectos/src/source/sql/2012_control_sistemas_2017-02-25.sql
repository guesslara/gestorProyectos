# ************************************************************
# Sequel Pro SQL dump
# Versión 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.5.48)
# Base de datos: 2012_control_sistemas
# Tiempo de Generación: 2017-02-25 06:13:51 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Volcado de tabla bitacora
# ------------------------------------------------------------

DROP TABLE IF EXISTS `bitacora`;

CREATE TABLE `bitacora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) NOT NULL,
  `accion_realizada` longtext NOT NULL,
  `responsable_bitacora` varchar(200) NOT NULL,
  `fecha_bitacora` date NOT NULL,
  `hora_bitacora` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=latin1;

LOCK TABLES `bitacora` WRITE;
/*!40000 ALTER TABLE `bitacora` DISABLE KEYS */;

INSERT INTO `bitacora` (`id`, `id_proyecto`, `accion_realizada`, `responsable_bitacora`, `fecha_bitacora`, `hora_bitacora`)
VALUES
	(15,24,'PROYECTO CREADO','1','2012-10-31','14:55:32'),
	(16,24,'HITO CREADO','1','2012-10-31','14:56:16'),
	(17,24,'TAREA INICIADA','1','2012-10-31','14:57:10'),
	(20,24,'TAREA INICIADA','1','2012-11-02','09:44:49'),
	(24,24,'TAREA FINALIZADA','1','2012-11-05','10:32:43'),
	(25,25,'PROYECTO CREADO','1','2012-11-09','14:38:59'),
	(26,26,'PROYECTO CREADO','1','2012-11-15','09:56:12'),
	(27,26,'HITO CREADO','1','2012-11-15','09:59:52'),
	(28,26,'TAREA INICIADA','1','2012-11-15','10:03:17'),
	(29,26,'TAREA FINALIZADA','1','2016-11-01','05:10:09');

/*!40000 ALTER TABLE `bitacora` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cambiossistema
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cambiossistema`;

CREATE TABLE `cambiossistema` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(200) NOT NULL,
  `fecha` datetime NOT NULL,
  `status` varchar(10) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `cambiossistema` WRITE;
/*!40000 ALTER TABLE `cambiossistema` DISABLE KEYS */;

INSERT INTO `cambiossistema` (`id`, `titulo`, `fecha`, `status`, `descripcion`)
VALUES
	(1,'dgfsdf','2012-05-11 11:26:14','Terminada','fs');

/*!40000 ALTER TABLE `cambiossistema` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_asignacion
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_asignacion`;

CREATE TABLE `cat_asignacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_equipo` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `usuariodominio` varchar(100) NOT NULL,
  `passdominio` varchar(100) NOT NULL,
  `passadmon` varchar(100) NOT NULL,
  `direccionip` varchar(20) NOT NULL,
  `fechaasig` date NOT NULL,
  `proximomantto` date NOT NULL,
  `observaciones` text NOT NULL,
  `backup` text NOT NULL,
  `modificaciones` text NOT NULL,
  `horaCaptura` time NOT NULL,
  `ubicacion` text NOT NULL,
  `id_proc` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_asignacion` WRITE;
/*!40000 ALTER TABLE `cat_asignacion` DISABLE KEYS */;

INSERT INTO `cat_asignacion` (`id`, `id_equipo`, `id_usuario`, `usuariodominio`, `passdominio`, `passadmon`, `direccionip`, `fechaasig`, `proximomantto`, `observaciones`, `backup`, `modificaciones`, `horaCaptura`, `ubicacion`, `id_proc`)
VALUES
	(1,203,741,'','','','','2013-02-21','0000-00-00','Observaciones','','','07:23:13','Ubicacion',28);

/*!40000 ALTER TABLE `cat_asignacion` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_equipos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_equipos`;

CREATE TABLE `cat_equipos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nocontrol` varchar(50) NOT NULL,
  `id_infra` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `id_modelo` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `caracteristicas` text NOT NULL,
  `fechacaptura` date NOT NULL,
  `fechamantto` date NOT NULL,
  `fechabaja` date NOT NULL,
  `observaciones` text NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `ubicacionreal` varchar(50) NOT NULL DEFAULT 'Sistemas',
  `estado` varchar(10) NOT NULL DEFAULT 'ok',
  `asignada` smallint(2) NOT NULL DEFAULT '0',
  `causa` text NOT NULL,
  `modificaciones` text NOT NULL,
  `horaCaptura` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=206 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_equipos` WRITE;
/*!40000 ALTER TABLE `cat_equipos` DISABLE KEYS */;

INSERT INTO `cat_equipos` (`id`, `nocontrol`, `id_infra`, `id_marca`, `serie`, `id_modelo`, `status`, `caracteristicas`, `fechacaptura`, `fechamantto`, `fechabaja`, `observaciones`, `cantidad`, `ubicacionreal`, `estado`, `asignada`, `causa`, `modificaciones`, `horaCaptura`)
VALUES
	(1,'CPU071100032',9,4,'MX12545415','40','1','DD:20\nRAM:320','0000-00-00','0000-00-00','0000-00-00','COSMETICA LIJADO',1,'Sistemas','ok',1,'N/A','||??NA??9??4??MX12545415??40??DD:20\nRAM:320??1??2011-05-17??2011-01-01??0000-00-00??COSMETICA LIJADO??1??Sistemas??ok??1??N/A?? 	||;','11:34:05'),
	(2,'CPU101000005',9,4,'mxj70209sr','61','1','HDD 40GB Memoria 512 Mb','0000-00-00','0000-00-00','0000-00-00','Mesa 1 Cable',1,'Sistemas','ok',1,'N/A','||??CPU101000005??9??4??mxj70209sr??61??HDD 40GB Memoria 512 Mb??1??2011-05-17??2011-01-03??0000-00-00??Mesa 1 Cable Asignar a Gustavo Orozco??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000005??9??4??mxj70209sr??61??HDD 40GB Memoria 512 Mb??1??0000-00-00??0000-00-00??0000-00-00??Mesa 1 Cable Asignar a CLAUDIA GARCIA??1??Sistemas??ok??1??N/A?? 	||;','11:35:43'),
	(3,'CPU101000016',9,4,'MXJ60101MB','50','1','RAM: 1G\nDD: 80','2011-05-17','2011-01-04','0000-00-00','CALIDAD LEXMARK \nMESA: 34',1,'Sistemas','ok',1,'N/A','','11:37:50'),
	(4,'CPU030900002',9,4,'MXJ430009Q','43','1','DD: 80\nRAM: 512','0000-00-00','0000-00-00','0000-00-00','BLUSENS NAVE 26',1,'Sistemas','ok',0,'N/A','||??CPU030900002??9??4??MXJ430009Q??43??DD: 80\nRAM: 512??1??2011-05-17??2011-01-05??0000-00-00??RAFAEL ZUÃ‘IGA\nMESA 42??1??Sistemas??ok??0??N/A?? 	||;','11:41:45'),
	(5,'CPU101000010',9,4,'MXJ70209YM','62','1','hdd 40 gb meoria 512 MB ','0000-00-00','0000-00-00','0000-00-00','sistemas ',1,'Sistemas','ok',1,'MAL FUNCIONAMIENTO 2','||??CPU101000010??9??4??MXJ70209YM??62??hdd 40 gb meoria 512 MB ??1??2011-05-17??2011-01-06??0000-00-00??Mesa 2 Maquina 2 Asignar a Gustavo orozco??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000010??9??4??MXJ70209YM??62??hdd 40 gb meoria 512 MB ??1??0000-00-00??0000-00-00??0000-00-00??Mesa 2 Maquina 2 Asignar a Gustavo orozco\n*************************\nPaty Pacheco??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000010??9??4??MXJ70209YM??62??hdd 40 gb meoria 512 MB ??1??0000-00-00??0000-00-00??0000-00-00??Mesa 2 Maquina 2 Asignar a CLAUDIA GARCIA??1??Sistemas??ok??1??N/A?? 	||;','11:43:49'),
	(6,'CPU101000004',9,4,'mxj70500bl','61','1','HDD 40GB Memoria 512 Mb','0000-00-00','0000-00-00','0000-00-00','empaque 1',1,'Sistemas','ok',1,'prueba','||??CPU101000004??9??4??mxj70500bl??61??HDD 40GB Memoria 512 Mb??1??2011-05-17??2011-01-07??0000-00-00??Mesa 1 Cable Asignar a Gustavo Orozco??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000004??9??4??mxj70500bl??61??HDD 40GB Memoria 512 Mb??1??0000-00-00??0000-00-00??0000-00-00??pretamo a angelica rios \nempaque??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000004??9??4??mxj70500bl??61??HDD 40GB Memoria 512 Mb??1??0000-00-00??0000-00-00??0000-00-00??angelica rios \nempaque??1??Sistemas??ok??1??N/A?? 	||;','11:44:48'),
	(7,'CPU101000003',9,4,'----','54','1','HDD 40 GB MEMORIA 512 mb','0000-00-00','0000-00-00','0000-00-00','MESA 3 MAQUINA 1',1,'Sistemas','ok',1,'N/A','||??CPU101000003??9??4??----??54??HDD 40 GB MEMORIA 512 mb??1??2011-05-17??2011-01-10??0000-00-00??mESA 3 MAQUINA 1 ASIGNAR A GUSTAVO OROZCO??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000003??9??4??----??54??HDD 40 GB MEMORIA 512 mb??1??0000-00-00??0000-00-00??0000-00-00??MESA 3 MAQUINA 1 ASIGNAR A CLAUDIA GARCIA??1??Sistemas??ok??1??N/A?? 	||;','11:45:09'),
	(8,'CPU031000012',9,4,'MX21760137','40','0','DD: 20\nRAM: 320','2011-05-17','2011-01-11','0000-00-00','CALIDAD COSMETICA\nLUIS\nCALIDAD2',1,'Sistemas','ok',1,'equipo descompuesto y obsoleto','','11:44:55'),
	(9,'CPU101000014',9,4,'MXJ70403NG','62','1','HDD 40 GB Memoria 512 MB','0000-00-00','0000-00-00','0000-00-00','monitores nave 26',1,'Sistemas','ok',1,'MAL FUNCIONAMIENTO 2','||??CPU101000014??9??4??MXJ70403NG??62??HDD 40 GB Memoria 512 MB??1??2011-05-17??2011-01-12??0000-00-00??Maquina 2 mesa 3 Asignara a Gustavo Orozco??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000014??9??4??MXJ70403NG??62??HDD 40 GB Memoria 512 MB??0??0000-00-00??0000-00-00??0000-00-00??Maquina 2 mesa 3 Asignar a CLAUDIA GARCIA??1??Sistemas??ok??1??MAL FUNCIONAMIENTO 2?? 	||;||??CPU101000014??9??4??MXJ70403NG??62??HDD 40 GB Memoria 512 MB??1??0000-00-00??0000-00-00??0000-00-00??MONITORES NAVE 26(Maquina 2 mesa 3 Asignar a CLAUDIA GARCIA)??1??Sistemas??ok??1??MAL FUNCIONAMIENTO 2?? 	||;','11:46:40'),
	(10,'CPU101000002',9,4,'mxj70209x3','61','0','HDD 40GB Memoria 512 Mb','0000-00-00','0000-00-00','0000-00-00','Mesa 1 Cable Asignar a CLAUDIA GARCIA',1,'Sistemas','ok',1,'MAL FUNCIONAMIENTO 2','||??CPU101000002??9??4??mxj70209x3??61??HDD 40GB Memoria 512 Mb??1??2011-05-17??2011-01-13??0000-00-00??Mesa 1 Cable Asignar a Gustavo Orozco??1??Sistemas??ok??1??N/A?? 	||;','11:49:10'),
	(11,'CPU031000003',9,6,'6X23JYGZE08A','44','0','DD: 20\nRAM: 320','0000-00-00','0000-00-00','0000-00-00','SANDBLAST\nCOSMETICA\nCOSMETICA2',1,'Sistemas','ok',1,'la maquina presenta fallas en la fuente que no se pueden reparar y no hay una fuente igaul para reemplazar','||??031000003??9??6??6X23JYGZE08A??44??DD: 20\nRAM: 320??1??2011-05-17??2011-01-14??0000-00-00??SANDBLAST\nCOSMETICA\nCOSMETICA2??1??Sistemas??ok??1??N/A?? 	||;','11:49:18'),
	(12,'CPU101000026',9,4,'mxj55103jz','50','1','pentium 4 3.20ghz\n512MB RAM','0000-00-00','0000-00-00','0000-00-00','Mesa 1 Calidad Cable ',1,'Sistemas','ok',1,'N/A','||??CPU101000026??9??4??mxj55103jz??50??pentium 4 3.20ghz\n512MB RAM??1??2011-05-17??2011-01-17??0000-00-00??Mesa 1 Cable Asignar a Rodrigo Wastenes??1??Sistemas??ok??1??N/A?? 	||;||??CPU101000026??9??4??mxj55103jz??50??pentium 4 3.20ghz\n512MB RAM??1??0000-00-00??0000-00-00??0000-00-00??Mesa 1 Calidad Cable Asignar a Claudia Garcia Mejia??1??Sistemas??ok??1??N/A?? 	||;','11:54:54'),
	(13,'CPU30900205',9,4,'MXJ512027Q','42','1','DD:40\nRAM:512','2011-05-17','2011-01-18','0000-00-00','SERVICIOSGENERALES\nURIEL GARCIA',1,'Sistemas','ok',1,'N/A','','11:54:07'),
	(14,'cpu101000023',9,4,'mxt734046k','61','0','amd athon 64 2.16ghz 512 ram','0000-00-00','0000-00-00','0000-00-00','',1,'Sistemas','ok',1,'REVISION','||??cpu101000023??9??4??mxt734046k??61??amd athon 64 2.16ghz 512 ram??1??2011-05-17??2011-01-19??0000-00-00??Mesa de control 1 Asignada a Rodrigo Wastenes.??1??Sistemas??ok??1??N/A?? 	||;||??cpu101000023??9??4??mxt734046k??61??amd athon 64 2.16ghz 512 ram??1??0000-00-00??0000-00-00??0000-00-00??Mesa de control 1 Asignada a JAIME NOVOA??1??Sistemas??ok??1??N/A?? 	||;','11:57:20'),
	(15,'NA',9,4,'MX21760177','40','0','DD: 20\nRAM:320','2011-05-17','2011-01-20','0000-00-00','COSMETICA 3\nVIRGEN',1,'Sistemas','ok',1,'resguardo','','11:58:32'),
	(16,'cpu101000024',9,4,'mxj734046n','61','1','amd athon 64 2.19ghz 512 Ram','0000-00-00','0000-00-00','0000-00-00','Mesa De control 1 Asignada a  JAIME NOVOA',1,'Sistemas','ok',1,'N/A','||??cpu101000024??9??4??mxj734046n??61??amd athon 64 2.19ghz 512 Ram??1??2011-05-17??2011-01-21??0000-00-00??Mesa De control 1 Asignada a Rodrigo Wastenes??1??Sistemas??ok??1??N/A?? 	||;','11:59:27'),
	(17,'CPU031000022',9,4,'MXJ62000N3','49','1','DD:40\nRAM:1G','0000-00-00','0000-00-00','0000-00-00','MESA: 29\nLEXMARK\nip:172.16.1.106 ',1,'Sistemas','ok',1,'N/A','||??CPU031000022??9??4??MXJ62000N3??49??DD:40\nRAM:1G??1??2011-05-17??2011-01-24??0000-00-00??MESA: 29\nLEXMARK\nPABLO OLVERA??1??Sistemas??ok??1??N/A?? 	||;||??CPU031000022??9??4??MXJ62000N3??49??DD:40\nRAM:1G??1??0000-00-00??0000-00-00??0000-00-00??MESA: 29\nLEXMARK\nPABLO OLVERA\n\nip:172.16.1.106 ??1??Sistemas??ok??1??N/A?? 	||;','12:01:21'),
	(18,'CPU081000004',9,4,'MXJ63702SP','52','1','DD:40\nRAM:512','0000-00-00','0000-00-00','0000-00-00','dante juarez \nsistemas',1,'Sistemas','ok',1,'CPU03120001','||??CPU081000004??9??4??MXJ63702SP??52??DD:40\nRAM:512??0??2011-05-17??2011-01-25??0000-00-00??MESA: 25\nLEXMARK\nOMAR TORRES??1??Sistemas??ok??1??CPU03120001?? 	||;','12:04:12'),
	(19,'CPU031000008',9,4,'MXJ710026S','61','1','HDD 40 GB Memoria 512 Athlon 64 AMD','2011-05-17','2011-01-26','0000-00-00','Asignar a Braulio Montero',1,'Sistemas','ok',1,'N/A','','12:07:37'),
	(20,'CPU081000003',9,4,'MXJ55103JF','50','1','RAM:512\nDD:80','0000-00-00','0000-00-00','0000-00-00','MONITORES NAVE 26',1,'Sistemas','ok',1,'CPU03120001','||??CPU081000003??9??4??MXJ55103JF??50??RAM:512\nDD:80??1??2011-05-17??2011-01-27??0000-00-00??MESA 24\nLEXMARK\nESTA MAQUINA NO TIENE USUARIO DEFINIDO\nES LA COMPU A LA QUE LE QUITARON LAS MEMORIAS ??1??Sistemas??ok??1??CPU03120001?? 	||;','12:09:39'),
	(21,'CPU30900206',9,4,'MXJ710025P','61','1','HDD 40 GB Memoria 512 MB Athlon 64 ','2011-05-17','2011-01-28','0000-00-00','Asignar a Braulio Montero',1,'Sistemas','ok',1,'N/A','','12:10:57'),
	(22,'CPU030900043',9,4,'MXJ45207LV','42','1','DD: 80\nRAM 1G','2011-05-17','2011-01-31','0000-00-00','ALEJANDRO MARTINEZ\nLEXMARK\nMESA: 26',1,'Sistemas','ok',1,'N/A','','12:13:39'),
	(23,'CPU031000001',9,4,'MXJ5500CM9','50','1','DD:80\nRAM:512','0000-00-00','0000-00-00','0000-00-00','ULISES COCOM\nNAVE 26',1,'Sistemas','ok',1,'mal funcionamiento 2','||??CPU031000001??9??4??MXJ5500CM9??50??DD:80\nRAM:512??0??2011-05-17??2011-02-01??0000-00-00??ULISES COCOM\nMESA 18\nPSG??1??Sistemas??ok??1??mal funcionamiento 2?? 	||;','12:21:17'),
	(24,'CPU090800109',9,6,'6021BKY7B407','47','0','DD: 40\nRAM:512','2011-05-17','2011-02-02','0000-00-00','MESA 17\nPSG\nADRIANA PANTOJA',1,'Sistemas','ok',1,'mal funcionamiento 2','','12:25:15'),
	(25,'CPU030900020',9,4,'MX12......','38','0','RAM: 320\nDD: 40','2011-05-17','2011-02-03','0000-00-00','MESA 15\nPSG\nHUGO CORTES',1,'Sistemas','ok',1,'mal funcionamiento 2','','12:32:35'),
	(26,'CPU030900081',9,7,'NA','56','0','DD: 40\nRAM: 256','2011-05-17','2011-02-04','0000-00-00','MESA 14\nPSG\nMAURICIO MELENDEZ\n',1,'Sistemas','ok',1,'mal funcionamiento 2','','12:37:02'),
	(27,'CPU071100035',9,6,'6y21jyhzj021','44','1','pentium 4 2.40ghz\n384 Ram\n40gb disco duro','0000-00-00','0000-00-00','0000-00-00','empaque',1,'Sistemas','ok',1,'N/A','||??cpu030900012??9??6??6y21jyhzj021??44??pentium 4 2.40ghz\n384 Ram\n40gb disco duro??1??2011-05-17??2011-02-07??0000-00-00??asignar a francisco marquez \nempaque??1??Sistemas??ok??1??N/A?? 	||;||??CPU071100035??9??6??6y21jyhzj021??44??pentium 4 2.40ghz\n384 Ram\n40gb disco duro??1??0000-00-00??0000-00-00??0000-00-00??asignar a francisco marquez \nempaque??1??Sistemas??ok??1??N/A?? 	||;','12:43:26'),
	(28,'cpu031000002',9,4,'MXJ7100265','44','0','HDD 40 GB RAM 512','0000-00-00','0000-00-00','0000-00-00','Asignar a calidad rodrigo JAIME NOVOA\n(recibo)',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpÃ¹031000002??9??4??MXJ7100265??44??HDD 40 GB RAM 512??1??2011-05-17??2011-02-08??0000-00-00??Asignar a calidad rodrigo wastenes??1??Sistemas??ok??0??N/A?? 	||;||??cpu031000002??9??4??MXJ7100265??44??HDD 40 GB RAM 512??1??0000-00-00??0000-00-00??0000-00-00??Asignar a calidad rodrigo wastenes??1??Sistemas??ok??1??N/A?? 	||;||??cpu031000002??9??4??MXJ7100265??44??HDD 40 GB RAM 512??1??0000-00-00??0000-00-00??0000-00-00??Asignar a calidad rodrigo wastenes\n***************\n(recibo)??1??Sistemas??ok??1??N/A?? 	||;','12:46:27'),
	(29,'CPU30900209',9,4,'MXJ52605NP','61','1','HDD 40 GB MEMORIA 512 MB','2011-05-17','2011-02-09','0000-00-00','Asignar a Laura olanda Empaque',1,'Sistemas','ok',1,'N/A','','12:49:10'),
	(30,'CPU030900089',9,4,'MXJ45207PD','42','0','DD: 1GB\nRAM: 320','2011-05-17','2011-02-10','0000-00-00','INVESTIGACIÃ“N Y DESARROLLO\nMESA 12\nRAFAEL CONTRERAS',1,'Sistemas','ok',1,'mal funcionamiento 2','','12:50:21'),
	(31,'cpu101000027',9,4,'MXJ5500CBK','50','1','Pentium 4 3.00ghz 512 MB Ram disco duro 40GB','0000-00-00','0000-00-00','0000-00-00','Asignada A Laura Olanda\nrecibo\nusr:empaque\npsswd:empaquehp',1,'Sistemas','ok',1,'N/A','||??cpu101000027??9??4??mxj5500cbk??50??Pentium 4 3.00ghz 512 MB Ram disco duro 40GB??1??2011-05-17??2011-02-11??0000-00-00??Asignada A Rodrigo Wastenes\nrecibo??1??Sistemas??ok??1??N/A?? 	||;','12:51:43'),
	(32,'LAP030900016',11,4,'CNU53927MW','59','1','DD: 120 G\nRAM: 1.5 G','0000-00-00','0000-00-00','0000-00-00','Bibiana Sanchez',1,'Sistemas','ok',1,'N/A','||??LAP030900016??11??4??CNU53927MW??59??DD: 120 G\r\nRAM: 1.5 G??1??2011-05-17??2011-02-14??0000-00-00??Sergio matute??1??Sistemas??ok??0??N/A?? 	||;','13:50:20'),
	(33,'CPU101000019',9,4,'MXJ5150415','52','1','DD: 40 G\r\nRAM: 512','2011-05-17','2011-02-15','0000-00-00','PATY PACHECO',1,'Sistemas','ok',1,'N/A','','13:50:20'),
	(34,'CPU031000010',9,4,'MXJ7280579','61','1','DD: 40 G\r\nRAM:1.5 G','2011-05-17','2011-02-16','0000-00-00','PATY PACHECO',1,'Sistemas','ok',1,'N/A','','13:50:20'),
	(35,'LAP101000003',11,4,'CNU6372C6D','69','1','DD: 40 G\nRAM: 768','0000-00-00','0000-00-00','0000-00-00','JOAQUIN RAMIREZ',1,'Sistemas','ok',1,'N/A','||??LAP101000003??11??4??CNU6372C6D??57??DD: 40 G\r\nRAM: 768??1??2011-05-17??2011-02-17??0000-00-00??JOAQUIN ??1??Sistemas??ok??0??N/A?? 	||;||??LAP101000003??11??4??CNU6372C6D??69??DD: 40 G\nRAM: 768??1??0000-00-00??0000-00-00??0000-00-00??JOAQUIN ??1??Sistemas??ok??1??N/A?? 	||;','13:50:20'),
	(36,'LAP071100005',11,4,'CLU5491FQQ','68','1','DD: 40 G\nRAM: 1 G','0000-00-00','0000-00-00','0000-00-00','MIGUEL ANGEL GARCIA',1,'Sistemas','ok',1,'N/A','||??NA??11??4??CLU5491FQQ??56??DD: 40 G\r\nRAM: 1 G??1??2011-05-17??2011-02-18??0000-00-00??MIGUEL ANGEL GARCIA??1??Sistemas??ok??0??N/A?? 	||;||??NA??11??4??CLU5491FQQ??68??DD: 40 G\nRAM: 1 G??1??0000-00-00??0000-00-00??0000-00-00??MIGUEL ANGEL GARCIA??1??Sistemas??ok??1??N/A?? 	||;||??NA??11??4??CLU5491FQQ??68??DD: 40 G\nRAM: 1 G??1??0000-00-00??0000-00-00??0000-00-00??MIGUEL ANGEL GARCIA??1??Sistemas??ok??1??N/A?? 	||;','13:50:20'),
	(37,'CPU30900320',9,4,'MXJ71406P4','57','1','DD: 40 G\r\nRAM: 512','2011-05-17','2011-02-21','0000-00-00','EVELYN ',1,'Sistemas','ok',1,'N/A','','13:50:20'),
	(38,'CPU030900034',9,4,'MXJ45207MP','56','1','DD: 40 G\nRAM: 512','0000-00-00','0000-00-00','0000-00-00','prestamo a la nueva area de nextel\nusr: dark',1,'Sistemas','ok',1,'N/A','||??CPU030900034??9??4??MXJ45207MP??56??DD: 40 G\r\nRAM: 512??1??2011-05-17??2011-02-22??0000-00-00??ALEJANDRA QUEZADA??1??Sistemas??ok??1??N/A?? 	||;||??CPU030900034??9??4??MXJ45207MP??56??DD: 40 G\nRAM: 512??1??0000-00-00??0000-00-00??0000-00-00??en espera de ser asignada??1??Sistemas??ok??1??N/A?? 	||;','13:50:20'),
	(39,'LAP071100006',11,4,'CNU6130M10','68','1','DD: 40 G\nRAM: 512','0000-00-00','0000-00-00','0000-00-00','ISRAEL AVALOS',1,'Sistemas','ok',1,'N/A','||??CPU031000019??11??4??CNU6130M10??68??DD: 40 G\nRAM: 512??1??2011-05-17??2011-02-23??0000-00-00??RODRIGO WASTENES??1??Sistemas??ok??1??N/A?? 	||;||??CPU031000019??11??4??CNU6130M10??68??DD: 40 G\nRAM: 512??1??0000-00-00??0000-00-00??0000-00-00??ISRAEL AVALOS??1??Sistemas??ok??1??N/A?? 	||;','14:15:42'),
	(40,'CPU030900025',9,4,'MX22150234','40','1','DD: 40 G\nRAM: 512 MB','0000-00-00','0000-00-00','0000-00-00','mercedes correa\ncalidad almacen',1,'Sistemas','ok',1,'N/A','||??CPU031000019??11??4??CNU6130M10??68??DD: 40 G\nRAM: 512??1??2011-05-17??2011-02-24??0000-00-00??RODRIGO WASTENES??1??Sistemas??ok??0??N/A?? 	||;||??CPU030900025??9??4??MX22150234??40??DD: 40 G\nRAM: 768 MB??1??0000-00-00??0000-00-00??0000-00-00??OLIMPIA IBARRA??1??Sistemas??ok??1??N/A?? 	||;','14:15:42'),
	(41,'LAP030900006',11,4,'CNU6270XLY','58','0','DD: 40 G\nRAM: 512 MB','2011-05-18','2011-02-24','0000-00-00','MARIO MARTINEZ',1,'Sistemas','ok',1,'la tarjeta dejo de funcionar','','10:39:27'),
	(42,'LAP071000001',11,4,'CNU6052CF0','58','1','DD: 40 G\nRAM 512 MB','2011-05-18','2011-02-25','0000-00-00','FELIPE MARQUEZ',1,'Sistemas','ok',1,'N/A','','10:40:49'),
	(43,'NA',9,4,'MXJ5010XZ','42','0','DD: 40 G\nRAM: 512','2011-05-24','2011-02-28','0000-00-00','PATY PACHECO',1,'Sistemas','ok',1,'resguardo','','17:54:06'),
	(44,'CPU031000026',9,4,'MXJ52203CB','56','1','512 RAM\n40 GB','2011-06-02','2011-03-01','0000-00-00','NOEMI CORDOBA',1,'Sistemas','ok',1,'N/A','','16:54:17'),
	(45,'LAP1108725',11,4,'CNU61126DW','58','0','RAM:512 MB\nDD: 40 GB ','0000-00-00','0000-00-00','0000-00-00','mario martinez',1,'Sistemas','ok',1,'NUMERO DE CONTROL INCORRECTO','||??LAPP1108725??11??4??CNU61126DW??58??RAM:512 MB\nDD: 40 GB ??1??2011-06-02??2011-03-02??0000-00-00??OLGA ESPARZA??1??Sistemas??ok??1??N/A?? 	||;','16:56:40'),
	(46,'cpu30900204',9,4,'mxj71700ys','54','1','512MB DE RAM\nDD 40GB','0000-00-00','0000-00-00','0000-00-00','Sistemas\nHECTOR GARCIA',1,'Sistemas','ok',1,'RESGUARDO','||??cpu30900204??9??4??mxj71700ys??54??512MB DE RAM\nDD 40GB??1??2011-06-02??2011-03-03??0000-00-00??Ubicacion: RH\nivonne gutierrez??1??Sistemas??ok??1??N/A?? 	||;||??cpu30900204??9??4??mxj71700ys??54??512MB DE RAM\nDD 40GB??1??0000-00-00??0000-00-00??0000-00-00??Almacen Sistemas??1??Sistemas??ok??1??N/A?? 	||;||??cpu30900204??9??4??mxj71700ys??54??512MB DE RAM\nDD 40GB??1??0000-00-00??0000-00-00??0000-00-00??Sistemas\nHector Garcia??1??Sistemas??ok??1??N/A?? 	||;||??cpu30900204??9??4??mxj71700ys??54??512MB DE RAM\nDD 40GB??0??0000-00-00??0000-00-00??0000-00-00??Sistemas\nJAIME NOVOA??1??Sistemas??ok??1??RESGUARDO?? 	||;','16:57:18'),
	(47,'cpu30900210',9,4,'mxj52605mq','37','1','Intel(r) pentium 4\n512 MB de ram\ndd 20gb','2011-06-02','2011-03-04','0000-00-00','Ubicacion: compras\nFederico Garcia ',1,'Sistemas','ok',1,'N/A','','17:00:59'),
	(48,'CPU030900006',9,8,'N/A','70','0','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','CAPTURA ALMACÃ‰N',1,'Sistemas','ok',1,'esta en revision por falla en fuente','||??CPU030900006??9??8??N/A??70??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-07??0000-00-00??BIBIANA SANCHEZ??1??Sistemas??ok??1??N/A?? 	||;||??CPU030900006??9??8??N/A??70??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??Alyn Baena\nbecaria\ncompras??1??Sistemas??ok??1??N/A?? 	||;||??CPU030900006??9??8??N/A??70??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??Alyn Baena\n(becaria)\ncompras??1??Sistemas??ok??1??N/A?? 	||;','16:59:34'),
	(49,'LAP081000001',11,6,'CNU6130LVP','68','1','RAM: 512 MB\nDD:40 GB','0000-00-00','0000-00-00','0000-00-00','javier trejo almacen',1,'Sistemas','ok',1,'N/A','||??LAP081000001??11??6??CNU6130LVP??68??RAM: 512 MB\nDD:20 GB??1??2011-06-02??2011-03-08??0000-00-00??VERONICA OLANDA??1??Sistemas??ok??1??N/A?? 	||;||??LAP081000001??11??6??CNU6130LVP??68??RAM: 512 MB\nDD:20 GB??1??0000-00-00??0000-00-00??0000-00-00??CIELO PUON??1??Sistemas??ok??1??N/A?? 	||;','17:02:53'),
	(50,'CPU101000017',9,4,'MXJ70403NF','54','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','GERARDO GONZALEZ PEREZ\nNEXTEL OFICINAS',1,'Sistemas','ok',1,'N/A','||??CPU101000017??9??4??MXJ70403NF??54??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-09??0000-00-00??GERARDO GONZALEZ PERAZ??1??Sistemas??ok??1??N/A?? 	||;','17:04:21'),
	(51,'LAP101000001',11,4,'CNU6141764','58','1','DD: 40 GB\nRAM: 1 GB','0000-00-00','0000-00-00','0000-00-00','NEXTEL',1,'Sistemas','ok',1,'N/A','||??LAP101000001??11??4??CNU6141764??58??DD: 40 GB\nRAM: 1 GB??1??2011-06-02??2011-03-10??0000-00-00??DANIEL GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;||??LAP101000001??11??4??CNU6141764??58??DD: 40 GB\nRAM: 1 GB??1??0000-00-00??0000-00-00??0000-00-00??ERIKA BRAVO??1??Sistemas??ok??1??N/A?? 	||;','17:05:53'),
	(52,'LAP071100007',11,4,'CNU6090YFP','71','1','1GB DE RAM\nDD 40GB','0000-00-00','0000-00-00','0000-00-00','Eunice Mendoza',1,'Sistemas','ok',1,'N/A','||??NA??11??4??CNU6090YFP??71??1GB DE RAM\nDD 40GB??1??2011-06-02??2011-03-11??0000-00-00??Eunice Mendoza??1??Sistemas??ok??1??N/A?? 	||;','17:02:40'),
	(53,'CPU030900076',9,6,'MXK54514XP','63','1','DD: 80GB\nRAM: 512 MB \n','0000-00-00','0000-00-00','0000-00-00','NEXTEL OFICINAS',1,'Sistemas','ok',1,'N/A','||??CPU3090076??9??6??MXK5451??63??DD: 80GB\nRAM: 512 MB Y 256 MB\n??1??2011-06-02??2011-03-14??0000-00-00??DANIEL GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;||??CPU03090076??9??6??MXK54514XP??63??DD: 80GB\nRAM: 512 MB \n??1??0000-00-00??0000-00-00??0000-00-00??GIOVANNA GONZALEZ\nNEXTEL OFICINAS??1??Sistemas??ok??1??N/A?? 	||;||??CPU030900076??9??6??MXK54514XP??63??DD: 80GB\nRAM: 512 MB \n??1??0000-00-00??0000-00-00??0000-00-00??GIOVANNA GONZALEZ\nNEXTEL OFICINAS??1??Sistemas??ok??1??N/A?? 	||;','17:07:16'),
	(54,'CPU090800052',9,4,'N/A','56','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','nueva area NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','||??CPU090800052??9??4??N/A??56??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-15??0000-00-00??TEST FINAL NEXTEL\nMIGUEL ANGEL MERCADO??1??Sistemas??ok??0??N/A?? 	||;||??CPU090800052??9??4??N/A??56??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??TEST FINAL NEXTEL GERARDO GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;','17:09:00'),
	(55,'cpu031000023',9,4,'mxj50605cm','72','1','dd 40gb\n512mb de ram','0000-00-00','0000-00-00','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','||??cpu031000023??9??4??mxj50605cm??72??dd 40gb\n512mb de ram??1??2011-06-02??2011-03-16??0000-00-00??ubicacion: test final omega??1??Sistemas??ok??0??N/A?? 	||;||??cpu031000023??9??4??mxj50605cm??72??dd 40gb\n512mb de ram??1??0000-00-00??0000-00-00??0000-00-00??ubicacion: test final nextel??1??Sistemas??ok??0??N/A?? 	||;','17:07:57'),
	(56,'CPU30900254',9,4,'MXJ527096L','37','1','RAM:512 MB\nDD: 40GB','0000-00-00','0000-00-00','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','||??CPU30900254??9??4??MXJ527096L??37??RAM:512 MB\nDD: 40GB??1??2011-06-02??2011-03-17??0000-00-00??TEST FINAL NEXTEL\nMIGUEL ANGEL MERCADO??1??Sistemas??ok??0??N/A?? 	||;','17:10:29'),
	(57,'CPU30900255',9,4,'MXJ527094K','37','1','DD: 40 GB\nRAM: 512 MB','0000-00-00','0000-00-00','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','||??CPU30900255??9??4??MXJ527094K??37??DD: 40 GB\nRAM: 512 MB??1??2011-06-02??2011-03-18??0000-00-00??TEST FINAL NEXTEL\nMIGUEL ANGEL MERCADO??1??Sistemas??ok??0??N/A?? 	||;','17:12:12'),
	(58,'cpu090800037',9,6,'NA','70','1','512 DE RAM \nDD 40GB','0000-00-00','0000-00-00','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ\n',1,'Sistemas','ok',1,'N/A','||??cpu090080037??9??6??NA??70??512 DE RAM \nDD 40GB??1??2011-06-02??2011-03-21??0000-00-00??Ubicacion: test final nextel \ngerardo gonzalez \n??1??Sistemas??ok??0??N/A?? 	||;||??cpu090080037??9??6??NA??70??512 DE RAM \nDD 40GB??1??0000-00-00??0000-00-00??0000-00-00??TEST FINAL NEXTEL GERARDO GONZALEZ\n??1??Sistemas??ok??1??N/A?? 	||;','17:12:40'),
	(59,'CPU030900082 ',9,6,'MXK54514XC','67','1','DD 40GB\n512MB DE RAM','0000-00-00','0000-00-00','0000-00-00','Ubicacion: MESA 28\nnextel\ngerardo gonzalez',1,'Sistemas','ok',1,'resguardo','||??NA??9??6??MXK54514XC??67??DD 40GB\n512MB DE RAM??1??2011-06-02??2011-03-15??0000-00-00??Ubicacion: test final nextel\ngerardo gonzalez??1??Sistemas??ok??1??resguardo?? 	||;','17:15:04'),
	(60,'CPU30900260',9,4,'MX15055261','40','1','RAM: 512 MB\nDD: 80 GB','2011-06-02','2011-03-16','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','','17:18:14'),
	(61,'CPU030900011',9,4,'MX11045182','41','0','RAM:512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','OMEGA \nEMMANUEL SANCHEZ',1,'Sistemas','ok',1,'mal funcionamiento 2','||??CPU030900011??9??4??MX11045182??41??RAM:512 MB\nDD: 40 GB??1??2011-06-02??2011-03-17??0000-00-00??OMEGA ARACELI MATA ??1??Sistemas??ok??1??N/A?? 	||;','17:19:08'),
	(62,'cpu030900041',9,4,'MX22334075','40','1','PENDIENTE','2011-06-02','2011-03-18','0000-00-00','Ubicacion: test final nextel \ngerardo gonzalez ',1,'Sistemas','ok',1,'N/A','','17:18:04'),
	(63,'CPU090800053',9,4,'mxj50605cq','43','1','512mb de ram\ndd 40gb','0000-00-00','0000-00-00','0000-00-00','Ubicacion captura \ngerardo gonzalez ',1,'Sistemas','ok',1,'N/A','||??cpu000800053??9??4??mxj50605cq??43??512mb de ram\ndd 40gb??1??2011-06-02??2011-03-21??0000-00-00??Ubicacion captura \ngerardo gonzalez ??1??Sistemas??ok??1??N/A?? 	||;||??CPU080900053??9??4??mxj50605cq??43??512mb de ram\ndd 40gb??1??0000-00-00??0000-00-00??0000-00-00??Ubicacion captura \ngerardo gonzalez ??1??Sistemas??ok??1??N/A?? 	||;','17:20:25'),
	(64,'CPU030900058',9,4,'MXJ52203CC','37','1','RAN: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','emmanuel sanchez \nomega',1,'Sistemas','ok',1,'N/A','||??CPU030900058??9??4??MXJ52203CC??37??RAN: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-22??0000-00-00??ROBERTO CARLOS??1??Sistemas??ok??1??N/A?? 	||;','17:21:03'),
	(65,'cpu090800051',9,6,'mxj430009r','43','0','dd 40gb\n512 de ram','2011-06-02','2011-03-23','0000-00-00','test final nextel \ngerardo gonzalez ',1,'Sistemas','ok',1,'CPU03120001','','17:24:24'),
	(66,'CPU030900075',9,4,'302albjv70k8','63','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','JAIME NOVOA\nOMEGA',1,'Sistemas','ok',1,'N/A','||??CPU030900075??9??4??N/A??63??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-24??0000-00-00??RODRIGO WASTENES??1??Sistemas??ok??0??N/A?? 	||;||??CPU030900075??9??4??302albjv70k8??63??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??RODRIGO WASTENES??1??Sistemas??ok??1??N/A?? 	||;','17:26:56'),
	(67,'cpu090800049',9,6,'NA','61','1','512MB DE RAM\nDD 40GB','2011-06-02','2011-03-25','0000-00-00','Ubicacion: test final nextel \ngerardo gonzalez ',1,'Sistemas','ok',1,'N/A','','17:27:36'),
	(68,'CPU030900029',9,4,'6131FXHZA478','56','0','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','JAIME NOVOA',1,'Sistemas','ok',1,'mal funcionamiento 2','||??CPU030900029??9??4??6131FXHZA478??56??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-28??0000-00-00??RODRIGO WASTENES??1??Sistemas??ok??1??N/A?? 	||;','17:28:37'),
	(69,'CPU090800072',9,4,'N/A','56','0','RAM: 320 MB\nDD: 20 GB','2011-06-02','2011-03-29','0000-00-00','FELIPE HERNANDEZ',1,'Sistemas','ok',1,'Es un equipo muy obsoleto para la operacion','','17:30:36'),
	(70,'CPU090800050',9,4,'MXJ43000C0','43','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','Gerardo Gonzalez\nnextel',1,'Sistemas','ok',1,'N/A','||??CPU090800050??9??4??MXJ43000C0??43??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-03-30??0000-00-00??ISRAEL AVALOS??1??Sistemas??ok??1??N/A?? 	||;||??CPU090800050??9??4??MXJ43000C0??43??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??ISRAEL AVALOS\n\nEsta computadora esta en la nave 26 ya que pertenece a la operacion de blusens??1??Sistemas??ok??1??N/A?? 	||;||??CPU090800050??9??4??MXJ43000C0??43??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??Olga Esparza\n\nEsta computadora esta a prestamo en lo que se revisa la laptop que pertenece a este usuario??1??Sistemas??ok??1??N/A?? 	||;','17:31:20'),
	(71,'CPU030900010',9,4,'MX11775280','41','1','RAM: 256 MB\nDD: 20 GB','2011-06-02','2011-03-31','0000-00-00','ARIEL GONZALEZ',1,'Sistemas','ok',1,'N/A','','17:32:00'),
	(72,'LAP030900049',11,4,'CNU5370SP2','56','1','RAM: 1 GB\nDD: 80 GB','0000-00-00','0000-00-00','0000-00-00','resgurdo sistemas',1,'Sistemas','ok',1,'N/A','||??LAP030900049??11??4??CNU5370SP2??56??RAM: 1 GB\nDD: 80 GB??1??2011-06-02??2011-04-01??0000-00-00??BELINDA DIAZ??1??Sistemas??ok??1??N/A?? 	||;||??LAP030900049??11??4??CNU5370SP2??56??RAM: 1 GB\nDD: 80 GB??1??0000-00-00??0000-00-00??0000-00-00??francisco aguillon \nalmacen??1??Sistemas??ok??1??N/A?? 	||;','17:32:44'),
	(73,'CPU030900003',9,4,'MXJ4290HMQ','72','1','RAM: 512 MB\nDD: 40 GB','2011-06-02','2011-04-04','0000-00-00','ELIZABETH GARCIA',1,'Sistemas','ok',1,'N/A','','17:33:34'),
	(74,'CPU030900031',9,4,'N/A','56','1','RAM: 512 MB\nDD: 40 GB','2011-06-02','2011-04-05','0000-00-00','ALEJANDRA GOMEZ',1,'Sistemas','ok',1,'N/A','','17:34:23'),
	(75,'cpu30900274',9,6,'mxj527094m','37','1','512mb de ram\ndd 80gb','2011-06-02','2011-04-06','0000-00-00','ubicacion: test final nextel\ngerardo gonzalez ',1,'Sistemas','ok',1,'N/A','','17:30:20'),
	(76,'N/A',9,4,'MXJ62707HP0','56','0','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','-----',1,'Sistemas','ok',1,'cambio de equipo por una maquina de nave 26','||??N/A??9??4??MXJ62707HP??56??RAM: 512 MB\nDD: 40 GB??0??2011-06-02??2011-04-07??0000-00-00??BIBIANA SANCHEZ??1??Sistemas??ok??1??cambio de equipo por una maquina de nave 26?? 	||;||??N/A??9??4??MXJ62707HP0??56??RAM: 512 MB\nDD: 40 GB??0??0000-00-00??0000-00-00??0000-00-00??BIBIANA SANCHEZ??1??Sistemas??ok??1??cambio de equipo por una maquina de nave 26?? 	||;','17:35:00'),
	(77,'CPU031000013',9,4,'MXJ342035V','72','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','',1,'Sistemas','ok',1,'N/A','||??CPU0310000013??9??4??MXJ342035V??72??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-04-08??0000-00-00??GIOVANA GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;||??CPU031000013??9??4??MXJ342035V??72??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??GIOVANNA GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;','17:38:17'),
	(78,'LAP030900002',11,4,'CNU53927TV','58','1','RAM: 1 GB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','lexmark',1,'Sistemas','ok',1,'N/A','||??LAP030900002??11??4??CNU53927TV??58??RAM: 1 GB\nDD: 40 GB??1??2011-06-02??2011-04-11??0000-00-00??RUBEN GALVAN??1??Sistemas??ok??1??N/A?? 	||;||??LAP030900002??11??4??CNU53927TV??58??RAM: 1 GB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??PRESTAMO ISRAEL AVALOS ??1??Sistemas??ok??1??N/A?? 	||;','17:39:10'),
	(79,'cpu30900215',9,6,'mxj527099l','37','1','512mb de ram\ndd 80gb','0000-00-00','0000-00-00','0000-00-00','ubicacion: test final nextel\ngerardo gonzalez',1,'Sistemas','ok',1,'N/A','||??cpu030900215??9??6??mxj527099l??37??512mb de ram\ndd 80gb??1??2011-06-02??2011-04-12??0000-00-00??ubicacion: test final nextel\ngerardo gonzalez??1??Sistemas??ok??1??N/A?? 	||;','17:38:15'),
	(80,'CPU071100025',9,4,'MXJ52203DK','43','1','RAM: 512 MB\nDD: 20 GB','0000-00-00','0000-00-00','0000-00-00','NEXTEL CAPTURA',1,'Sistemas','ok',1,'N/A','||??N/A??9??4??MXJ52203DK??43??RAM: 512 MB\nDD: 20 GB??1??2011-06-02??2011-04-13??0000-00-00??GERARDO GONZALEZ??1??Sistemas??ok??0??N/A?? 	||;||??N/A??9??4??MXJ52203DK??43??RAM: 512 MB\nDD: 20 GB??1??0000-00-00??0000-00-00??0000-00-00??TEST FINAL NEXTEL GERARDO GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;','17:39:57'),
	(81,'CPU090800042',9,4,'MXJ50605CC','72','1','RAM: 512 MB\nDD: 40 GB','2011-06-02','2011-04-14','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','','17:41:35'),
	(82,'cpu030900068',9,6,'mxj43166b9','72','1','1gb de ram \ndd 40gb','2011-06-02','2011-04-15','0000-00-00','ubicacion: omega \nEmmanuel sanchez ',1,'Sistemas','ok',1,'N/A','','17:40:19'),
	(83,'CPU090800040',9,6,'N/A','70','0','RAM: 248 MB\nDD: 20 GB','0000-00-00','0000-00-00','0000-00-00','OMEGA\nEMMANUEL SANCHEZ',1,'Sistemas','ok',1,'CPU03120001','||??CPU090800040??9??6??N/A??70??RAM: 248 MB\nDD: 20 GB??1??2011-06-02??2011-04-18??0000-00-00??TEST FINAL NEXTEL GERARDO GONZALEZ??1??Sistemas??ok??1??N/A?? 	||;','17:43:14'),
	(84,'CPU090800041',9,4,'MXJ50605CD','70','1','RAM: 512 MB\nDD: 40 GB','2011-06-02','2011-04-19','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'N/A','','17:44:22'),
	(85,'cpu030900071',9,4,'mxj41205h2','37','0','512mb de ram\n80gb dd','0000-00-00','0000-00-00','0000-00-00','ubicacion: oficina omega\nAraceli Mata ',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpu030900071??9??4??mxj41205h2??72??512mb de ram\n80gb dd??1??2011-06-02??2011-04-20??0000-00-00??ubicacion: omega\nroberto pacheco y emmanuel sanchez ??1??Sistemas??ok??0??N/A?? 	||;||??cpu030900071??9??4??mxj41205h2??43??512mb de ram\n80gb dd??1??0000-00-00??0000-00-00??0000-00-00??ubicacion: omega\nroberto pacheco y emmanuel sanchez ??1??Sistemas??ok??0??N/A?? 	||;||??cpu030900071??9??4??mxj41205h2??37??512mb de ram\n80gb dd??1??0000-00-00??0000-00-00??0000-00-00??ubicacion: omega\nroberto pacheco y emmanuel sanchez ??1??Sistemas??ok??1??N/A?? 	||;','17:43:41'),
	(86,'N/A',9,4,'MXJ62600JF','61','0','RAM: 512 MB\nDD: 80 GB','2011-06-02','2011-04-21','0000-00-00','TEST FINAL NEXTEL GERARDO GONZALEZ',1,'Sistemas','ok',1,'resguardo','','17:45:23'),
	(87,'cpu030900062',9,6,'6040FXHZC936','47','0','320MB DE RAM\nDD 40GB','0000-00-00','0000-00-00','0000-00-00','UBICACION: OMEGA \nROBERTO PACHECO Y EMMANUEL SANCHEZ',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpu030900062??9??6??NA??70??320MB DE RAM\nDD 40GB??1??2011-06-02??2011-04-22??0000-00-00??UBICACION: OMEGA \nROBERTO PACHECO Y EMMANUEL SANCHEZ??1??Sistemas??ok??0??N/A?? 	||;','17:46:02'),
	(88,'CPU030900073',9,4,'6X23JYGZE00L','66','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','OMEGA ROBERTO PACHECO Y\nMANUEL SANCHEZ',1,'Sistemas','ok',1,'N/A','||??CPU030900073??9??6??N/A??70??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-04-25??0000-00-00??OMEGA ROBERTO PACHECO Y\nMANUEL SANCHEZ??1??Sistemas??ok??0??N/A?? 	||;','17:47:28'),
	(89,'CPU030900060',9,4,'mx15055368','40','1','RAM: 512 MB\nDD: 40 GB','0000-00-00','0000-00-00','0000-00-00','Paola Gonzalez',1,'Sistemas','ok',1,'mal funcionamiento 2','||??CPU030900060??9??4??N/A??40??RAM: 512 MB\nDD: 40 GB??1??2011-06-02??2011-04-26??0000-00-00??OMEGA ROBERTO PACHECO Y MANUEL SANCHEZ??1??Sistemas??ok??0??N/A?? 	||;||??CPU030900060??9??4??mx15055368??40??RAM: 512 MB\nDD: 40 GB??1??0000-00-00??0000-00-00??0000-00-00??OMEGA ROBERTO PACHECO Y MANUEL SANCHEZ??1??Sistemas??ok??1??mal funcionamiento 2?? 	||;','17:49:08'),
	(90,'CPU030900057',9,6,'NA','47','0','320MB DE RAM\n20GB DD','0000-00-00','0000-00-00','0000-00-00','UBICACION:OMEGA \nROBERTO PACHECO Y EMMANUEL SANCHEZ ',1,'Sistemas','ok',1,'mal funcionamiento 2','||??CPU030900057??9??6??NA??70??320MB DE RAM\n20GB DD??1??2011-06-02??2011-04-27??0000-00-00??UBICACION:OMEGA \nROBERTO PACHECO Y EMMANUEL SANCHEZ ??1??Sistemas??ok??0??N/A?? 	||;','17:48:28'),
	(91,'CPU030900061',9,6,'MXJ43000CB','72','1','Pendiente','0000-00-00','0000-00-00','0000-00-00','NEXTEL',1,'Sistemas','ok',1,'N/A','||??CPU030900061??9??6??MXJ43000CB??72??Pendiente??1??2011-06-02??2011-04-28??0000-00-00??emanuel sanchez ??1??Sistemas??ok??1??N/A?? 	||;','17:50:50'),
	(92,'cpu090800045',9,6,'mxj451207qr','61','1','pentium 4\n512mb de ram \ndd 40gb','0000-00-00','0000-00-00','0000-00-00','ubicacion: almacen\n',1,'Sistemas','ok',1,'N/A','||??cpu090800045??9??6??mxj451207qr??61??pentium 4\n512mb de ram \ndd 40gb??1??2011-06-02??2011-04-29??0000-00-00??ubicacion: desensamble \ngerardo gonzalez ??1??Sistemas??ok??1??N/A?? 	||;||??cpu090800045??9??6??mxj451207qr??61??pentium 4\n512mb de ram \ndd 40gb??1??0000-00-00??0000-00-00??0000-00-00??ubicacion: almacen\ngerardo gonzalez ??1??Sistemas??ok??1??N/A?? 	||;','17:55:49'),
	(93,'cpu101000022',9,6,'MXJ5500C0Q','50','1','pentium 4 3ghz\n512mb de ram \n80gb dd','0000-00-00','0000-00-00','0000-00-00','NAVE 26 BLUSENS ',1,'Sistemas','ok',1,'MAL FUNCIONAMIENTO 2','||??cpu101000022??9??6??mxj5500c0q??50??pentium 4 3ghz\n512mb de ram \n80gb dd??1??2011-06-02??2011-05-02??0000-00-00??ubicacion: blusens nave 34??1??Sistemas??ok??0??N/A?? 	||;||??cpu101000022??9??6??mxj5500c0q??50??pentium 4 3ghz\n512mb de ram \n80gb dd??1??0000-00-00??0000-00-00??0000-00-00??ubicacion: blusens nave 34\nIsrael Avalos??1??Sistemas??ok??1??N/A?? 	||;||??cpu101000022??9??6??mxj5500c0q??50??pentium 4 3ghz\n512mb de ram \n80gb dd??1??0000-00-00??0000-00-00??0000-00-00??ubicacion: blusens nave 34\nIsrael Avalos\n***************************\nAhora esta en administracion??1??Sistemas??ok??1??N/A?? 	||;||??cpu101000022??9??6??mxj5500c0q??50??pentium 4 3ghz\n512mb de ram \n80gb dd??0??0000-00-00??0000-00-00??0000-00-00??ubicacion: blusens nave 34\nKarla Mora\n***************************\nAhora esta en oficinas??1??Sistemas??ok??1??MAL FUNCIONAMIENTO 2?? 	||;','18:02:13'),
	(94,'cpu031000005',9,6,'mxj64965790','41','0','256mb de ram\ndd 20gb','0000-00-00','0000-00-00','0000-00-00','ubicacion:recepcion nave 35\nariel gonzalez ',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpu03100005??9??6??mxj64965790??41??256mb de ram\ndd 20gb??1??2011-06-02??2011-05-02??0000-00-00??ubicacion:recepcion nave 34\nariel gonzalez ??1??Sistemas??ok??1??N/A?? 	||;||??cpu031000005??9??6??mxj64965790??41??256mb de ram\ndd 20gb??1??0000-00-00??0000-00-00??0000-00-00??ubicacion:recepcion nave 34\nariel gonzalez ??1??Sistemas??ok??1??N/A?? 	||;||??cpu031000005??9??6??mxj64965790??41??256mb de ram\ndd 20gb??1??0000-00-00??0000-00-00??0000-00-00??ubicacion:recepcion nave 34\nariel gonzalez ??1??Sistemas??ok??1??N/A?? 	||;','18:05:55'),
	(95,'CPU071100014',9,4,'mxj4220463','72','1','pentium 4\ndd 40gb \n512mb de ram','0000-00-00','0000-00-00','0000-00-00','ETIQUETA ANTERIOR  CPU030900047\nNAVE 26\n\nubicacion: INVESTIGACION Y DESARROLLO',1,'Sistemas','ok',1,'CPU03120001','||??cpu030900047??9??4??mxj4220463??72??pentium 4\ndd 40gb \n512mb de ram??1??2011-06-06??2011-05-03??0000-00-00??ubicacion: omega??1??Sistemas??ok??1??N/A?? 	||;||??CPU071100014??9??4??mxj4220463??72??pentium 4\ndd 40gb \n512mb de ram??0??0000-00-00??0000-00-00??0000-00-00??ETIQUETA ANTERIOR  CPU030900047\n\nubicacion: INVESTIGACION Y DESARROLLO??1??Sistemas??ok??1??CPU03120001?? 	||;','12:58:03'),
	(96,'cpu030900070',9,6,'6128FXIZA777','47','0','pendiente','0000-00-00','0000-00-00','0000-00-00','ubicacion: omega',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpu030900070??9??6??612fxjza751??47??pendiente??0??2011-06-06??2011-05-04??0000-00-00??ubicacion: omega??1??Sistemas??ok??1??mal funcionamiento 2?? 	||;','13:05:05'),
	(97,'cpu031000009',9,6,'6040fxhza851','47','0','pendiente','0000-00-00','0000-00-00','0000-00-00','ubicacion: omega',1,'Sistemas','ok',1,'N/A','||??cpu031000009??9??6??6040fxhza851??47??pendiente??1??2011-06-06??2011-05-05??0000-00-00??ubicacion: omega??1??Sistemas??ok??1??N/A?? 	||;','13:09:24'),
	(98,'cpu030900055',9,8,'s/n','70','0','armada','0000-00-00','0000-00-00','0000-00-00','ubicacion: sadblast\nLucia\nDD 40\nRam 256',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpu030900055??9??8??s/n??70??armada??1??2011-06-06??2011-05-06??0000-00-00??ubicacion: omega??1??Sistemas??ok??1??N/A?? 	||;','13:11:27'),
	(99,'n/a',9,4,'MXJ62606GD','39','0','pendiente','2011-06-06','2011-05-09','0000-00-00','ubicacion: omega',1,'Sistemas','ok',1,'resguardo','','13:15:12'),
	(100,'CPU101000028',9,4,'MX62606GM','39','0','RAM 512\nDD 80','2011-07-07','2011-05-10','0000-00-00','VERONICA OLANDA COMPRAS',1,'Sistemas','ok',1,'MAL FUNCIONAMIENTO 2','','13:00:12'),
	(101,'CPU071100012',9,4,'MX04145815','40','1','RAM: 512\nDD: 40','0000-00-00','0000-00-00','0000-00-00','ALMACEN\nrecibo',1,'Sistemas','ok',1,'mal funcionamiento 2','||??cpu030900056??9??4??MX04145815??40??RAM: 512\nDD: 40??0??2011-07-07??2011-05-11??0000-00-00??ALMACEN\nAntonio Maldonado??1??Sistemas??ok??1??mal funcionamiento 2?? 	||;||??CPU071100012??9??4??MX04145815??40??RAM: 512\nDD: 40??1??0000-00-00??0000-00-00??0000-00-00??ALMACEN\nAntonio Maldonado??1??Sistemas??ok??1??mal funcionamiento 2?? 	||;','14:19:30'),
	(106,'CPU071100002',9,4,'MXJ52605N4','42','1','DD 80\nRAM 512','0000-00-00','0000-00-00','0000-00-00','lexmark',1,'Sistemas','ok',1,'N/A','||??CPU071100002??9??4??MXJ52605N4??42??DD 80\nRAM 512??1??2011-07-13??2011-05-13??0000-00-00??ANTONIO MALDONADO\nALMACEN\nRECIBO ALMACEN??1??Sistemas??ok??1??N/A?? 	||;','14:36:50'),
	(105,'CPU071100001',9,4,'MXJ52605N5','42','0','dd 80\nram 512','0000-00-00','0000-00-00','0000-00-00','sistemas',1,'Sistemas','ok',1,'falla de tarjeta','||??CPU071100001??9??4??MXJ52605N5??42??dd 80\nram 512??1??2011-07-13??2011-05-12??0000-00-00??Francisco Aguillan jefe de Almacen??1??Sistemas??ok??1??N/A?? 	||;','11:58:12'),
	(107,'CPU031000028',9,4,'MXJ71405SN','61','1','RAM 512\nDD 80','0000-00-00','0000-00-00','0000-00-00','',1,'Sistemas','ok',1,'N/A','||??CPU031000028??9??4??MXJ71405SN??61??RAM 512\nDD 80??1??2011-07-15??2011-05-16??0000-00-00??Ubicacion: RH\nivonne gutierrez??1??Sistemas??ok??1??N/A?? 	||;||??CPU031000028??9??4??MXJ71405SN??61??RAM 512\nDD 80??1??0000-00-00??0000-00-00??0000-00-00??Ubicacion: Nueva area de nextel\nPrestamo??1??Sistemas??ok??1??N/A?? 	||;','10:54:22'),
	(108,'CPU030900023',9,4,'MX12925143','41','1','','0000-00-00','0000-00-00','0000-00-00','REPARACION',1,'Sistemas','ok',0,'N/A','||??CPU030900023??9??4??MX12925143??41????1??2011-08-01??2011-05-17??0000-00-00??UBICACION LIJADO\nRESPONSABLE FERNANDO ALARCON??1??Sistemas??ok??0??N/A?? 	||;','16:35:06'),
	(109,'CPU071100007',9,4,'MX21760177','40','0','','2011-08-01','2011-05-18','0000-00-00','UBICACION VIRGEN\nRESPONSABLE FERNANDO ALARCON',1,'Sistemas','ok',1,'CPU03120001','','16:36:42'),
	(110,'CPU030900083',9,6,'N/A','60','0','','2011-08-02','2011-05-19','0000-00-00','LEXMARK',1,'Sistemas','ok',1,'mal funcionamiento 2','','11:19:08'),
	(111,'CPU030900044',9,6,'6C19JKWH04X','56','0','','2011-08-02','2011-05-20','0000-00-00','LEXMARK',1,'Sistemas','ok',1,'falla de fuente','','11:20:30'),
	(112,'CPU030900022',9,6,'N/A','64','1','','2011-08-02','2011-05-23','0000-00-00','LEXMARK',1,'Sistemas','ok',0,'N/A','','11:21:24'),
	(113,'CPU081000005',9,4,'MXJ63900RL','39','0','RAM 512\nDD 40','2011-08-02','2011-05-24','0000-00-00','HP',1,'Sistemas','ok',1,'REVISION','','11:22:08'),
	(114,'CPU040800109',9,6,'N/A','60','0','DD 40\nRAM 384','2011-08-02','2011-05-25','0000-00-00','HP',1,'Sistemas','ok',0,'obsoleto','','11:23:09'),
	(115,'CPU071100008',9,4,'MXJ50605D0','37','1','DD 150\nRAM 256','2011-08-02','2011-05-26','0000-00-00','HP',1,'Sistemas','ok',1,'N/A','','11:23:56'),
	(116,'CPU030900037',9,4,'MX15035627','41','1','','0000-00-00','0000-00-00','0000-00-00','HP NAVE 26',1,'Sistemas','ok',0,'N/A','||??CPU030900037??9??4??MX15035627??41????1??2011-08-02??2011-05-27??0000-00-00??HP??1??Sistemas??ok??0??N/A?? 	||;','11:24:56'),
	(117,'CPU030900059',9,4,'MXJ45207PD','37','1','1 GB RAM\n80 DD','0000-00-00','0000-00-00','0000-00-00','UBICACION: DESARROLLO RAFAEL CONTRERAS NAVE 26',1,'Sistemas','ok',0,'N/A','||??CPU030900059??9??4??MXJ45207PD??37??1 GB RAM\n80 DD??1??2011-08-02??2011-05-30??0000-00-00??UBICACION: DESARROLLO RAFAEL CONTRERAS??1??Sistemas??ok??0??N/A?? 	||;','11:25:55'),
	(118,'CPU30900214',9,4,'MXJ71700Z2','61','1','DD 40\nRAM 512\nTARJETA INALAMBRICA','0000-00-00','0000-00-00','0000-00-00','nueva area de nextel\nreparacion',1,'Sistemas','ok',1,'N/A','||??CPU30900214??9??4??MXJ71700Z2??61????1??2011-08-02??2011-05-31??0000-00-00??UBICACION: DESARROLLO RAFAEL CONTRERAS??1??Sistemas??ok??0??N/A?? 	||;||??CPU30900214??9??4??MXJ71700Z2??61??DD 40\nRAM 512\nTARJETA INALAMBRICA??1??0000-00-00??0000-00-00??0000-00-00??UBICACION: DESARROLLO RAFAEL CONTRERAS??1??Sistemas??ok??1??N/A?? 	||;','11:28:54'),
	(119,'CPU031000021',9,4,'MXJ62000N1','39','1','','0000-00-00','0000-00-00','0000-00-00','lexmark',1,'Sistemas','ok',1,'N/A','||??CPU031000021??9??4??MXJ62000N1??39????1??2011-08-02??2011-06-01??0000-00-00??UBICACION: DESARROLLO RAFAEL CONTRERAS??1??Sistemas??ok??0??N/A?? 	||;','11:30:07'),
	(120,'CPU031000030',9,4,'MXJ7070336','55','1','1 GB RAM\n80 DD','0000-00-00','0000-00-00','0000-00-00','UBICACION: DESARROLLO RAFAEL CONTRERAS NAVE 26',1,'Sistemas','ok',0,'N/A','||??CPU031000030??9??4??MXJ7070336??55??1 GB RAM\n80 DD??1??2011-08-02??2011-06-02??0000-00-00??UBICACION: DESARROLLO RAFAEL CONTRERAS??1??Sistemas??ok??0??N/A?? 	||;','11:31:18'),
	(121,'CPU030900069',9,4,'MXJ422044Z','43','1','512 RAM \n40 DD','2011-08-02','2011-06-03','0000-00-00','UBICACION: DESARROLLO RAFAEL CONTRERAS',1,'Sistemas','ok',0,'N/A','','11:32:18'),
	(122,'CPU90800027',9,8,'ARMADA','','1','','2011-08-02','2011-06-06','0000-00-00','HP',1,'Sistemas','ok',0,'N/A','','11:33:12'),
	(123,'CPU101000025',9,4,'MXJ501014H','37','1','512 RAM\n40 DD','2011-08-02','2011-06-07','0000-00-00','CABLE RESPONSABLE BRAULIO',1,'Sistemas','ok',0,'N/A','','11:34:00'),
	(124,'CPU031000007',9,4,'MXJ3420393','43','1','','2011-08-02','2011-06-08','0000-00-00','HP VARIOS\nMARCO ANTONIO TARELO',1,'Sistemas','ok',1,'N/A','','11:34:53'),
	(125,'CPU101000027',9,4,'MXJ5500CBK','50','0','','2011-08-02','2011-06-09','0000-00-00','RECIBO',1,'Sistemas','ok',0,'numero repetido','','11:38:12'),
	(126,'RNX0001',13,9,'364VKGYDWJ','73','1','RADIO NEXTEL I776\nID 52*142810*X','2011-08-12','2011-06-10','0000-00-00','--',1,'Sistemas','ok',1,'N/A','','12:19:31'),
	(127,'CPU071100003',9,4,'MXJ501014X','42','1','DD 40\nRAM 512','2011-08-29','2011-06-13','0000-00-00','',1,'Sistemas','ok',0,'N/A','','16:58:01'),
	(128,'CPU071100005',9,4,'MXJ52605M3','42','0','DD 40\nRAM 512','0000-00-00','0000-00-00','0000-00-00','almacen \nYadira Gonzalez',1,'Sistemas','ok',1,'CPU03120001','||??CPU071100003??9??4??MXJ52605M3??42??DD 40\nRAM 512??1??2011-09-07??2011-06-14??0000-00-00??almacen \nYadira Gonzalez??1??Sistemas??ok??0??N/A?? 	||;','14:07:54'),
	(129,'IMP030900012',14,4,'CNFB052993','74','1','','2011-09-09','2011-06-14','0000-00-00','',1,'Sistemas','ok',0,'N/A','','13:21:05'),
	(130,'IMP30900220',14,4,'CN47QB71JK','75','1','MULTIFUNCIONAL \nINYECCION DE TINTA','2011-09-09','2011-06-15','0000-00-00','COMPRAS \nVERONICA OLANDA',1,'Sistemas','ok',0,'N/A','','17:57:19'),
	(131,'IMP071100001',14,4,'SN','76','1','LASER NEGRO','0000-00-00','0000-00-00','0000-00-00','ESTE EQIPO ESTA CONFIGURADO EN RED Y ES PARA USO GENERAL Y TENIA ESTA ETIQUETA IMP030900005\n',1,'Sistemas','ok',0,'N/A','||??IMP071100001??14??4??SN??76??LASER NEGRO??1??2011-09-09??2011-06-16??0000-00-00??ESTE EQIPO ESTA CONFIGURADO EN RED Y ES PARA USO GENERAL ??1??Sistemas??ok??0??N/A?? 	||;','17:59:23'),
	(132,'IMP071100002',14,4,'CNBC61Q0MV','77','1','LASER NEGRO','0000-00-00','0000-00-00','0000-00-00','PATY PACHECO\nFACTURACION\nOFICINAS Y TENIA ESTA ETIQUETA CPU081000018',1,'Sistemas','ok',0,'N/A','||??IMP071100002??14??4??CNBC61Q0MV??77??LASER NEGRO??1??2011-09-09??2011-06-17??0000-00-00??PATY PACHECO\nFACTURACION\nOFICINAS??1??Sistemas??ok??0??N/A?? 	||;','18:01:34'),
	(133,'CPU30900261',9,4,'MX04935459','41','1','RAM 256\nDD SIN','2011-09-30','2011-06-16','0000-00-00','ALMACEN SISTEMAS',1,'Sistemas','ok',0,'N/A','','17:06:16'),
	(134,'CPU071100010',9,4,'MXJ62606C1','42','1','DD 80\nRAM 760','0000-00-00','0000-00-00','0000-00-00','NOMINAS\nRRHH',1,'Sistemas','ok',1,'N/A','||??CPU071100010??9??4??MXJ62606C1??42??DD 80\nRAM 760??1??2011-10-04??2011-06-17??0000-00-00??NOMINAS\nIVONNE GUTIERREZ\nRRHH??1??Sistemas??ok??1??N/A?? 	||;||??CPU071100010??9??4??MXJ62606C1??42??DD 80\nRAM 760??1??0000-00-00??0000-00-00??0000-00-00??NOMINAS\nOLGA ESPARZA\nRRHH??1??Sistemas??ok??1??N/A?? 	||;','13:47:23'),
	(135,'CPU071100011',9,4,'MXJ62707HW','52','1','RAM 512\nDD 40','2011-10-12','2011-06-20','0000-00-00','EN RESGUARDO DE SISTEMAS',1,'Sistemas','ok',0,'N/A','','10:40:08'),
	(136,'CPU071000012',9,4,'SN','40','1','DD 40\nRAM 380','2011-10-17','2011-06-21','0000-00-00','ALMACEN\nMIGUEL ANGEL PEÃ‘A',1,'Sistemas','ok',0,'N/A','','16:49:38'),
	(137,'CPU071100013',9,4,'MXJ637039M','52','1','DD 80\nRAM 512','0000-00-00','0000-00-00','0000-00-00','CABLE \nMESA 5',1,'Sistemas','ok',1,'N/A','||??CPU071100013??9??4??MXJ637039M??52??DD 80\nRAM 512??1??2011-10-18??2011-06-22??0000-00-00??BRAULIO MONTERO\nCABLE \nMESA 5??1??Sistemas??ok??1??N/A?? 	||;','13:40:20'),
	(138,'cpu071100017',9,4,'mxj6270srw','52','1','RAM 512MB\n','0000-00-00','0000-00-00','0000-00-00','ALMACEN',1,'Sistemas','ok',1,'N/A','||??cpu071100017??9??4??mxj6270srw??52??RAM 512MB\n??1??2011-10-19??2011-06-23??0000-00-00??CALIDAD ALMACEN??1??Sistemas??ok??1??N/A?? 	||;','11:43:53'),
	(139,'CPU071100018',9,4,'MXJ62707H6','52','1','RAM 512MB','0000-00-00','0000-00-00','0000-00-00','almacen kits',1,'Sistemas','ok',1,'N/A','||??CPU071100018??9??4??MXJ62707H6??52??RAM 512MB??1??2011-10-19??2011-06-24??0000-00-00??CALIDAD ALMACEN 2??1??Sistemas??ok??1??N/A?? 	||;','12:00:51'),
	(140,'CPU071100015',9,4,'MX14235112','40','1','DD 40 GB\nRAM 380','0000-00-00','0000-00-00','0000-00-00','UBICACION  empaque sin conectar',1,'Sistemas','ok',1,'N/A','||??CPU071100015??9??4??MX14235112??40??DD 40 GB\nRAM 380??1??2011-10-19??2011-06-27??0000-00-00??UBICACION ROBOT\nETIQUETAS??1??Sistemas??ok??0??N/A?? 	||;','16:54:41'),
	(141,'CPU030900084',9,4,'MXJ52203C8','42','1','DD 40\nRAM512','0000-00-00','0000-00-00','0000-00-00','ALMACEN',1,'Sistemas','ok',1,'N/A','||??CPU030900084??9??4??MXJ52203C8??42??DD 40\nRAM512??1??2011-10-20??2011-06-28??0000-00-00??ALMACEN NEZTOR VELAZQUEZ\n??1??Sistemas??ok??1??N/A?? 	||;','13:53:51'),
	(142,'cpu071100024',9,4,'MX15055050','40','1','RAM 256\nDD 40','0000-00-00','0000-00-00','0000-00-00','DESPACHO\nALMACEN',1,'Sistemas','ok',1,'N/A','||??cpu071100024??9??4??MX15055050??40??RAM 256\nDD 40??1??2011-10-20??2011-06-29??0000-00-00??DESPACHO\nALMACEN??1??Sistemas??ok??0??N/A?? 	||;','14:00:22'),
	(143,'CPU030900052',9,4,'MXJ43401ZV','43','0','RAM 512\nDD40','0000-00-00','0000-00-00','0000-00-00','CIRILO ARELLANO \nALMACEN\n\nTIENE 2 NUMEROS DE SERIE EL DE EL CHASIS QUE ES EL QUE SE REGISTRO Y EL DE LA TAPA QUE ES MXJ43000BM',1,'Sistemas','ok',1,'revision','||??CPU030900052??9??4??MXJ43401ZV??43??RAM 512\nDD40??1??2011-10-20??2011-06-29??0000-00-00??TIENE 2 NUMEROS DE SERIE EL DE EL CHASIS QUE ES EL QUE SE REGISTRO Y EL DE LA TAPA QUE ES MXJ43000BM??1??Sistemas??ok??0??N/A?? 	||;','14:02:34'),
	(144,'CPU071100026',9,6,'6Y21JYHZJ00X','44','1','DD 40\nRAM256','2011-10-20','2011-06-29','0000-00-00','CALIDAD\nEMPAQUE NEXTEL',1,'Sistemas','ok',1,'N/A','','17:35:08'),
	(145,'CPU030900072',9,4,'MXJ41205MY','42','1','RAN 256\nDD40','0000-00-00','0000-00-00','0000-00-00','NEXTEL\nROBERTO PACHECO',1,'Sistemas','ok',1,'N/A','||??CPU030900072??9??4??MXJ41205MY??42??RAN 256\nDD40??1??2011-10-20??2011-06-30??0000-00-00??EMPAQUE NEXTEL\nROBERTO PACHECO??1??Sistemas??ok??1??N/A?? 	||;','17:37:26'),
	(146,'CPU071100009',9,4,'MXJ62707HP','52','1','RAN 512\nDD40','2011-10-20','2011-07-01','0000-00-00','EMPAQUE NEXTEL\nCALIDAD',1,'Sistemas','ok',1,'N/A','','17:39:44'),
	(147,'CPU031000014',9,4,'MXZ44201DN','78','0','RAM 256\nDD 40','2011-10-20','2011-07-04','0000-00-00','NEXTEL EMPAQUE\nCALIDAD',1,'Sistemas','ok',1,'mal funcionamiento 2','','17:41:34'),
	(148,'CPU071100029',9,4,'MXJ50107XV','52','1','RAM 512\nDD40','2011-10-20','2011-07-05','0000-00-00','OMEGA\nTEST',1,'Sistemas','ok',1,'N/A','','17:57:09'),
	(149,'CPU071100027',9,4,'MXJ62708SG','52','1','RAM 512\nDD 40','0000-00-00','0000-00-00','0000-00-00','OMEGA\nTEST',1,'Sistemas','ok',1,'N/A','||??CPU071100027??9??4??MXJ627085G??52??RAM 512\nDD 40??1??2011-10-20??2011-07-06??0000-00-00??OMEGA\nTEST??1??Sistemas??ok??1??N/A?? 	||;','17:59:24'),
	(150,'CPU071100028',9,4,'MXJ62608GD','52','1','RAM 512\nDD 40','2011-10-20','2011-07-07','0000-00-00','TEST OMEGA',1,'Sistemas','ok',1,'N/A','','18:01:00'),
	(151,'CPU071100030',9,4,'MXJ62508GT','52','1','RAM 512\nDD 40','2011-10-20','2011-07-08','0000-00-00','OMEGA TEST\n',1,'Sistemas','ok',1,'N/A','','18:02:46'),
	(152,'CPU071100031',9,4,'MXJ50107YC','52','1','RAM 512\nDD 40','2011-10-20','2011-07-11','0000-00-00','OMEGA TEST',1,'Sistemas','ok',1,'N/A','','18:03:59'),
	(153,'CPU071100033',9,4,'MXJ710025J','61','1','DD 80MB\nRAM: 1.5GB','2011-10-21','2011-07-12','0000-00-00','Sistemas \nGerardo Lara',1,'Sistemas','ok',1,'N/A','','12:37:47'),
	(154,'CPU071100023',9,4,'MXJ705009R','62','1','DD: 80GB\nRAM:512MB','2011-10-21','2011-07-13','0000-00-00','Sistemas\nAriel Gonzalez',1,'Sistemas','ok',0,'N/A','','12:41:03'),
	(155,'CPU071100022',9,4,'MXJ70209S7','61','1','DD 80GB\nRAM 512MB','0000-00-00','0000-00-00','0000-00-00','Angie \nLab Lexmark',1,'Sistemas','ok',1,'N/A','||??CPU071100022??9??4??MXJ70209S7??61??DD 80GB\nRAM 512MB??1??2011-10-31??2011-07-14??0000-00-00??Sistemas Uriel ??1??Sistemas??ok??0??N/A?? 	||;','10:16:19'),
	(156,'LAP1108125',11,4,'CNU61126DW','58','1','DD 40\nRAM 512','0000-00-00','0000-00-00','0000-00-00','mario martinez',1,'Sistemas','ok',1,'N/A','||??LAP1108125??11??4??CNU61126DW??58??DD 40\nRAM 512??1??2011-11-01??2011-07-15??0000-00-00??OLGA ESPARZA??1??Sistemas??ok??0??N/A?? 	||;','15:43:01'),
	(157,'LAP031000019',11,4,'CNU6130M1D','59','1','DD 40\nRAM 1GB','2011-11-01','2011-07-18','0000-00-00','JAIME NOVOA CALIDAD',1,'Sistemas','ok',1,'N/A','','17:57:08'),
	(158,'LAP081000002',11,4,'CNU61502l6','59','1','DD 80\nRAM 512','0000-00-00','0000-00-00','0000-00-00','prestamo Israel Avalos',1,'Sistemas','ok',1,'N/A','||??LAP081000002??11??4??CNU61502l6??59??DD 80\nRAM 512??1??2011-11-01??2011-07-19??0000-00-00??EUNICE MENDOZA NEXTEL??1??Sistemas??ok??1??N/A?? 	||;','18:00:43'),
	(159,'LAP030900003',11,4,'CNU61126CJ','68','1','Memoria RAM 512 Mb\nDisco Duro 40 Gb\ncon cargador','0000-00-00','0000-00-00','0000-00-00','YULIA PAKHOMOVA',1,'Sistemas','ok',1,'N/A','||??LAP030900003??11??4??CNU61126CJ??68??RAM 512\nDD 40??1??2011-11-01??2011-07-20??0000-00-00??YULIA PAKHOMOVA??1??Sistemas??ok??1??N/A?? 	||;','18:26:35'),
	(160,'RNX0002',13,9,'364VJEHBK9','79','1','IMEI:001701167478710<BR>\nSIM:000808869592360<BR>\nID:72*834094*8<BR>\n<BR>\nEste equipo no esta autorizado a llamadas Telefonicas ','0000-00-00','0000-00-00','0000-00-00','',1,'Sistemas','ok',1,'N/A','||??RNX0002??13??9??364VJEHBK9??79??IMEI:001701167478710\nSIM:000808869592360\nID:72*834094*8??1??2011-11-10??2011-07-21??0000-00-00????1??Sistemas??ok??1??N/A?? 	||;','10:37:36'),
	(161,'cpu071100019',9,4,'mxj52605n1','42','1','disco duro 80GB\nMemoria RAM 512MB','0000-00-00','0000-00-00','0000-00-00','NEXTEL\n',1,'Sistemas','ok',1,'N/A','||??cpu071100019??9??4??mxj52605n1??42??disco duro 80GB\nMemoria RAM 512MB??1??2011-11-30??2011-07-21??0000-00-00??NEXTEL\nEUNICE MENDOZA??1??Sistemas??ok??1??N/A?? 	||;','13:01:48'),
	(162,'RNXI0001',13,9,'364VJEL82C','79','1','imei: 001701179142710  |\nDirect talk:1522042322  |  Comunicacion Interna\n','0000-00-00','0000-00-00','0000-00-00','',1,'Sistemas','ok',1,'N/A','||??RNXI0001??13??9??364VJEL82C??79??imei: 001701179142710\nDirect talk:1522042322\n??1??2012-01-02??2011-07-22??0000-00-00????1??Sistemas??ok??1??N/A?? 	||;','12:40:05'),
	(163,'RNXI0002',13,9,'364THG1L0Q','79','1','imei:000510053968710\nDirect talk: 72828605','2012-01-02','2011-07-25','0000-00-00','',1,'Sistemas','ok',0,'N/A','','14:51:58'),
	(164,'RNXI0003',13,9,'364VJEH3XF','79','1','imei:001701166241710\nDirect talk: 522942403','2012-01-02','2011-07-26','0000-00-00','',1,'Sistemas','ok',1,'N/A','','14:51:58'),
	(165,'RNXI0004',13,9,'364VJS2ZLW','79','1','imei:001701927560710\nDirect talk: 521561625','2012-01-02','2011-07-27','0000-00-00','',1,'Sistemas','ok',1,'N/A','','14:51:58'),
	(166,'RNXI0005',13,9,'364VJGTQ9T','79','1','imei: 001701422714710\nDirect talk: 5226161215','2012-01-02','2011-07-28','0000-00-00','',1,'Sistemas','ok',0,'N/A','','14:51:58'),
	(167,'RNXI0006',13,9,'364VJA8T91','79','1','imei: 001701034350710\nDirect talk: 522177917','2012-01-02','2011-07-29','0000-00-00','',1,'Sistemas','ok',1,'N/A','','14:51:58'),
	(168,'RNXI0007',13,9,'364VJYHL4L','79','1','imei: 001701971643710\nDirect talk: 62127874','2012-01-02','2011-08-01','0000-00-00','',1,'Sistemas','ok',0,'N/A','','15:46:39'),
	(169,'RNXI0008',13,9,'364VJGCFJH','79','1','imei: 001701333384710\nDirect talk: 4771221078','2012-01-02','2011-08-02','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(170,'RNXI0009',13,9,'364THQ55B9','79','1','imei: 000510117528710\nDirect talk: 9211528766','2012-01-02','2011-08-03','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(171,'RNXI0010',13,9,'364THJ29T6','79','1','imei: 000510061493710\nDirect talk: 621523540','2012-01-02','2011-08-04','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(172,'RNXI0011',13,9,'364VJGYSC9','79','1','imei: 001701451251710\nDirect talk: 526605167','2012-01-02','2011-08-05','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(173,'RNXI0012',13,9,'364THE85MC','79','1','imei: 000510037489710\nDirect talk: 5541148620','2012-01-02','2011-08-08','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(174,'RNXI0013',13,9,'364VJGTSRQ','79','1','imei: 001701422651710\nDirect talk: 521996139','2012-01-02','2011-08-09','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(175,'RNXI0014',13,9,'364VJC8SZL','79','1','imei: 001701082785710\nDirect talk: 4424114995','2012-01-02','2011-08-10','0000-00-00','',1,'Sistemas','ok',1,'N/A','','15:46:39'),
	(176,'RNXI0015',13,9,'364VJC0XQG','79','1','imei: 001701058080710\nDirect talk: 5212130','2012-01-02','2011-08-11','0000-00-00','',1,'Sistemas','ok',0,'N/A','','15:46:39'),
	(177,'RNXI0016',13,9,'364VJEL6LC','79','1','imei: 001701178901710\nDirect talk: 3314785068','2012-01-02','2011-08-12','0000-00-00','',1,'Sistemas','ok',0,'N/A','','15:46:39'),
	(178,'RNXI0017',13,9,'364VJEMPY7','79','1','imei: 001701187703710  |\nDirect talk: 522297821  |  Solo comunicacion Interna.','0000-00-00','0000-00-00','0000-00-00','',1,'Sistemas','ok',1,'N/A','||??RNXI0017??13??9??364VJEMPY7??79??imei: 001701187703710\nDirect talk: 522297821??1??2012-01-02??2011-08-15??0000-00-00????1??Sistemas??ok??1??N/A?? 	||;||??RNXI0017??13??9??364VJEMPY7??79??imei: 001701187703710|\nDirect talk: 522297821|Solo comunicacion Interna.??1??0000-00-00??0000-00-00??0000-00-00????1??Sistemas??ok??1??N/A?? 	||;','15:46:39'),
	(179,'RNXI0018',13,9,'364VJCB836','79','1','imei: 001701086003710\nDirect talk: 622704101','2012-01-02','2011-08-16','0000-00-00','',1,'Sistemas','ok',0,'N/A','','15:46:39'),
	(180,'CPU071100004',9,4,'MXJ123','42','1','RAM 512\nDD 80','2012-02-24','2011-08-17','0000-00-00','CAPTURA NEXTEL\nUBICACION ALMACEN\nADRIANA ENSASTIGUE',1,'Sistemas','ok',0,'N/A','','17:53:06'),
	(181,'CPU03120001',11,10,'B1N0BC02807601H','80','1','Laptop Win 7','0000-00-00','0000-00-00','0000-00-00','montoto',1,'Sistemas','ok',1,'N/A','||??CPU03120001??11??10??V1N0BC02807601H??80??Laptop Win 7??1??2012-03-20??2011-08-18??0000-00-00????1??Sistemas??ok??1??N/A?? 	||;||??CPU03120001??11??10??B1N0BC02807601H??80??Laptop Win 7??1??0000-00-00??0000-00-00??0000-00-00????1??Sistemas??ok??1??N/A?? 	||;','16:37:00'),
	(182,'RNXE0019',13,9,'364PNA3NBR','81','1','id 52*142810*5','2012-03-21','2011-08-18','0000-00-00','nuevo, reeplazo por robop',1,'Sistemas','ok',0,'N/A','','19:38:44'),
	(183,'CPU071100034',9,6,'6Y28KN9ZD01S','44','1','RAM 384\nDD 40GB','2012-03-28','2011-08-19','0000-00-00','CALIDAD\nLUIS FLORES\nCALIDAD COSMETICA',1,'Sistemas','ok',1,'N/A','','15:16:17'),
	(184,'CPU101000015',9,4,'MXJ70403P0','61','0','RAM 512\nDD 80GB','2012-04-13','2011-08-22','0000-00-00','INVESTIGACIÃ“N Y DESARROLLO',1,'Sistemas','ok',1,'revision','','09:34:57'),
	(185,'CPU071100016',9,4,'MXJ50107XY','42','1','RAM 512\nDD 40','2012-04-19','2011-08-23','0000-00-00','Mesa 28 NEXTEL',1,'Sistemas','ok',1,'N/A','','13:03:59'),
	(186,'CPU071100020',9,4,'MXJ62606GF','42','1','RAM 512\nDD 40','2012-04-19','2011-08-24','0000-00-00','MESA 29 NEXTEL',1,'Sistemas','ok',1,'N/A','','14:37:35'),
	(187,'LAP031000032',11,4,'CNU6052BYP','58','1','RAM 512\nDD 40','2012-04-20','2011-08-25','0000-00-00','NORMA MOEDANO',1,'Sistemas','ok',1,'N/A','','17:46:00'),
	(188,'LAP030900012',11,11,'0N67057016678G01L0','82','1','RAM 2G\nDD 120','2012-04-20','2011-08-26','0000-00-00','DANIEL HOFFMAN',1,'Sistemas','ok',1,'N/A','','17:50:11'),
	(189,'CPU071100036',9,4,'MXJ501014K','42','1','512 RAM','2012-04-24','2011-08-29','0000-00-00','VIRIDIANA NAVE 26',1,'Sistemas','ok',1,'N/A','','12:58:27'),
	(190,'CPU071100037',9,4,'MXJ62606FK','39','1','512 RAM','2012-04-24','2011-08-30','0000-00-00','VIRIDIANA NAVE 26',1,'Sistemas','ok',1,'N/A','','13:01:57'),
	(191,'CPU071100039',9,4,'MXJ621078J','50','1','512 RAM\n40 GB DD','2012-04-24','2011-08-31','0000-00-00','CALIDAD NAVE 26',1,'Sistemas','ok',0,'N/A','','13:05:25'),
	(192,'CPU071100038',9,4,'MXJ52605MT','42','1','512 RAM','2012-04-24','2011-09-01','0000-00-00','CIRILO NAVE 26',1,'Sistemas','ok',1,'N/A','','13:10:17'),
	(193,'IMP071100005',14,4,'LASERJET','83','1','','2012-04-24','2011-09-02','0000-00-00','CIRILO NAVE 26',1,'Sistemas','ok',1,'N/A','','13:12:42'),
	(194,'CPU071100040',9,4,'MXL1401FD6','','1','','2012-04-24','2011-09-05','0000-00-00','VERONICA OLANDA NAVE 26',1,'Sistemas','ok',1,'N/A','','13:18:37'),
	(195,'IMP071100006',14,12,'49J094700363','84','1','ZEBRA','2012-04-24','2011-09-06','0000-00-00','NAVE 26',1,'Sistemas','ok',0,'N/A','','13:20:55'),
	(196,'CPU101000021',9,4,'MXJ70209YC','43','1','DD 40\nRAM 512','0000-00-00','0000-00-00','0000-00-00','LINEA NEXTEL',1,'Sistemas','ok',1,'N/A','||??CPU101000021??9??4??MXJ70209YC??43??DD 40\nRAM 512??1??2012-04-25??2011-09-07??0000-00-00??LINE NEXTEL??1??Sistemas??ok??1??N/A?? 	||;','14:05:00'),
	(197,'CPU30900203',9,4,'MXJ7180DDD','61','1','RAM 1G\nDD 40','2012-04-26','2011-09-08','0000-00-00','FIREWALL SISTEMAS',1,'Sistemas','ok',1,'N/A','','17:27:51'),
	(198,'CPU081000001',9,4,'MXJ5500CPS','50','1','RAM 1G\nDD 80','0000-00-00','0000-00-00','0000-00-00','SERVIDOR DE DOMINIO SISTEMAS  ',1,'Sistemas','ok',1,'N/A','||??CPU081000001??9??4??MXJ5500CPS??50??RAM 1G\nDD 80??1??2012-04-26??2011-09-09??0000-00-00??SERVIDOR DE DOMINIO SISTEMAS??1??Sistemas??ok??1??N/A?? 	||;','17:31:32'),
	(199,'CPU00000001',9,8,'0123456789','85','1','CARACTERISTICAS DEL EQUIPO','2012-05-11','2011-09-09','0000-00-00','OBSERVACIONES',1,'Sistemas','ok',0,'N/A','','10:41:21'),
	(200,'CPU00000001',9,8,'0123456789','85','1','CARACTERISTICAS DEL EQUIPO','2012-05-11','2011-09-12','0000-00-00','OBSERVACIONES',1,'Sistemas','ok',0,'N/A','','10:41:21'),
	(201,'000000000000009',14,10,'986532147','85','1','caracteristicas','2012-05-11','2011-09-13','0000-00-00','observaciones',1,'Sistemas','ok',0,'N/A','','15:34:32'),
	(202,'1',9,6,'1','47','1','1','2012-05-11','2011-09-14','0000-00-00','1',1,'Sistemas','ok',0,'N/A','','16:32:27'),
	(203,'3',9,10,'ds','85','1','sda','2012-05-11','2011-09-15','0000-00-00','asdas',1,'Sistemas','ok',0,'N/A','','17:17:11'),
	(204,'4',13,9,'sa','73','0','sasa','0000-00-00','0000-00-00','0000-00-00','sasas prueba prueba 3',1,'Sistemas','ok',0,'prueba','','17:28:43'),
	(205,'000000000009',9,8,'aaaa','85','0','aaa','0000-00-00','0000-00-00','0000-00-00','aaaaaaaaa htrhr greger fere tre mnb cde',1,'Sistemas','ok',0,'prueba de la Baja del Equipo','||??000000000009??9??8??aaaa??85??aaa??1??2012-05-14??2011-09-19??0000-00-00??aaaaaaaaa??1??Sistemas??ok??0??N/A?? 	||;||??000000000009??9??8??aaaa??85??aaa??1??0000-00-00??0000-00-00??0000-00-00??aaaaaaaaa htrhr??1??Sistemas??ok??0??N/A?? 	||;||??000000000009??9??8??aaaa??85??aaa??1??0000-00-00??0000-00-00??0000-00-00??aaaaaaaaa htrhr greger??1??Sistemas??ok??0??N/A?? 	||;','15:06:11');

/*!40000 ALTER TABLE `cat_equipos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_equipos_modificaciones
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_equipos_modificaciones`;

CREATE TABLE `cat_equipos_modificaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nocontrol` varchar(50) NOT NULL,
  `id_infra` int(11) NOT NULL,
  `id_marca` int(11) NOT NULL,
  `serie` varchar(50) NOT NULL,
  `id_modelo` varchar(30) NOT NULL,
  `status` varchar(10) NOT NULL,
  `caracteristicas` text NOT NULL,
  `fechacaptura` date NOT NULL,
  `fechamantto` date NOT NULL,
  `fechabaja` date NOT NULL,
  `observaciones` text NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '1',
  `ubicacionreal` varchar(50) NOT NULL DEFAULT 'Sistemas',
  `estado` varchar(10) NOT NULL DEFAULT 'ok',
  `asignada` smallint(2) NOT NULL DEFAULT '0',
  `causa` text NOT NULL,
  `modificaciones` text NOT NULL,
  `horaCaptura` time NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_equipos_modificaciones` WRITE;
/*!40000 ALTER TABLE `cat_equipos_modificaciones` DISABLE KEYS */;

INSERT INTO `cat_equipos_modificaciones` (`id`, `nocontrol`, `id_infra`, `id_marca`, `serie`, `id_modelo`, `status`, `caracteristicas`, `fechacaptura`, `fechamantto`, `fechabaja`, `observaciones`, `cantidad`, `ubicacionreal`, `estado`, `asignada`, `causa`, `modificaciones`, `horaCaptura`)
VALUES
	(1,'000000000009',9,8,'aaaa','85','1','aaa','0000-00-00','0000-00-00','0000-00-00','aaaaaaaaa htrhr greger fere',1,'Sistemas','ok',0,'N/A','','15:06:11'),
	(2,'000000000009',9,8,'aaaa','85','1','aaa','0000-00-00','0000-00-00','0000-00-00','aaaaaaaaa htrhr greger fere tre',1,'Sistemas','ok',0,'N/A','','15:06:11'),
	(3,'000000000009',9,8,'aaaa','85','1','aaa','0000-00-00','0000-00-00','0000-00-00','aaaaaaaaa htrhr greger fere tre mnb',1,'Sistemas','ok',0,'N/A','','15:06:11'),
	(4,'4',13,8,'sa','47','1','sasa','2012-05-11','2011-09-16','0000-00-00','sasas',1,'Sistemas','ok',0,'N/A','','17:28:43'),
	(5,'4',13,8,'sa','47','1','sasa','0000-00-00','0000-00-00','0000-00-00','sasas prueba',1,'Sistemas','ok',0,'N/A','','17:28:43'),
	(6,'4',13,8,'sa','47','1','sasa','0000-00-00','0000-00-00','0000-00-00','sasas prueba prueba 3',1,'Sistemas','ok',0,'N/A','','17:28:43'),
	(7,'CPU101000004',9,4,'mxj70500bl','61','1','HDD 40GB Memoria 512 Mb','0000-00-00','0000-00-00','0000-00-00','empaque',1,'Sistemas','ok',1,'prueba','','11:44:48');

/*!40000 ALTER TABLE `cat_equipos_modificaciones` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_infraestructuras
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_infraestructuras`;

CREATE TABLE `cat_infraestructuras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) NOT NULL,
  `obs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_infraestructuras` WRITE;
/*!40000 ALTER TABLE `cat_infraestructuras` DISABLE KEYS */;

INSERT INTO `cat_infraestructuras` (`id`, `nombre`, `obs`)
VALUES
	(12,'PRUEBA',''),
	(9,'CPU',''),
	(10,'MONITORES',''),
	(11,'LAPTOP',''),
	(13,'IDEN RADIO',''),
	(14,'IMPRESORA',''),
	(15,'PRUEBA 2',''),
	(16,'CONMUTADOR',''),
	(17,'SERVIDOR','');

/*!40000 ALTER TABLE `cat_infraestructuras` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_marcas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_marcas`;

CREATE TABLE `cat_marcas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `obs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_marcas` WRITE;
/*!40000 ALTER TABLE `cat_marcas` DISABLE KEYS */;

INSERT INTO `cat_marcas` (`id`, `nombre`, `obs`)
VALUES
	(7,'PRUEBA',''),
	(4,'HP',''),
	(5,'DESPRO',''),
	(6,'COMPAQ',''),
	(8,'ARMADA',''),
	(9,'MOTOROLA',''),
	(10,'ASUS',''),
	(11,'DELL',''),
	(12,'ZEBRA',''),
	(13,'BIC','');

/*!40000 ALTER TABLE `cat_marcas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_modelos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_modelos`;

CREATE TABLE `cat_modelos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `obs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_modelos` WRITE;
/*!40000 ALTER TABLE `cat_modelos` DISABLE KEYS */;

INSERT INTO `cat_modelos` (`id`, `nombre`, `obs`)
VALUES
	(63,'COMPAQ PRESARIO 6000',''),
	(37,'DC7100',''),
	(38,'TC7100',''),
	(39,'DC5100',''),
	(40,'VL420',''),
	(41,'VL400',''),
	(42,'DC7100 SFF',''),
	(43,'D530',''),
	(44,'COMPAQ EVO',''),
	(45,'DC7100CMT',''),
	(46,'MX43000C0',''),
	(47,'COMPAQ DESKPRO',''),
	(48,'DC5100MX',''),
	(49,'DC5100MT',''),
	(50,'DC7600',''),
	(51,'DESPRO',''),
	(52,'DC5100SFF',''),
	(53,'DC 67600',''),
	(54,'DC 5750SMC',''),
	(55,'DC 5700SFF',''),
	(56,'COMPAQ',''),
	(57,'COMPAQ',''),
	(58,'NC6220',''),
	(59,'NC6220',''),
	(60,'DESKPRO',''),
	(61,'DC5750',''),
	(62,'D5750',''),
	(64,'DESKPRO N',''),
	(65,'D530SFF',''),
	(66,'EVO',''),
	(67,'PRESARIO',''),
	(68,'NX6120',''),
	(69,'NX6325',''),
	(70,'N/A',''),
	(71,'NC6230',''),
	(72,'DC530',''),
	(73,'I776',''),
	(74,'LASERJET 1015',''),
	(75,'PSC 1315V',''),
	(76,'LASERJET 4050N',''),
	(77,'LASERJET 1022',''),
	(78,'PAVILION A610N',''),
	(79,'I880',''),
	(80,'K52F',''),
	(81,'I420',''),
	(82,'XPS M1330',''),
	(83,'P1606DN',''),
	(84,'TLP3844-Z',''),
	(85,'2309M','');

/*!40000 ALTER TABLE `cat_modelos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_procesos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_procesos`;

CREATE TABLE `cat_procesos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `obs` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_procesos` WRITE;
/*!40000 ALTER TABLE `cat_procesos` DISABLE KEYS */;

INSERT INTO `cat_procesos` (`id`, `nombre`, `obs`)
VALUES
	(28,'CALIDAD BLUSENS',''),
	(16,'NEXTEL',''),
	(17,'CABLEVISION',''),
	(18,'LEXMARK',''),
	(19,'COSMETICA',''),
	(20,'CALIDAD/COSMETICA',''),
	(21,'PSG',''),
	(22,'EMPAQUE',''),
	(23,'CALIDAD',''),
	(24,'MONITORES',''),
	(25,'OFICINAS',''),
	(26,'IMPRESORAS',''),
	(27,'INVESTIGACION',''),
	(29,'SERVICIOS GENERALES',''),
	(30,'SISTEMAS',''),
	(31,'CABLE',''),
	(32,'FACTURACION',''),
	(33,'COMPRAS',''),
	(34,'ATENCION A CLIENTES',''),
	(35,'OMEGA',''),
	(36,'RECURSOS HUMANOS',''),
	(37,'BLUSENS',''),
	(38,'VENTAS',''),
	(39,'ALMACEN',''),
	(40,'OPERACIONES',''),
	(41,'VIGILANCIA',''),
	(42,'CONTRALORIA REGIONAL',''),
	(43,'PROCESO 1','');

/*!40000 ALTER TABLE `cat_procesos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla cat_usuarios
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cat_usuarios`;

CREATE TABLE `cat_usuarios` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_alta` date NOT NULL,
  `activo` tinyint(1) NOT NULL,
  `grupo` varchar(50) NOT NULL,
  `nivel` int(11) NOT NULL,
  `usuario` varchar(50) NOT NULL,
  `nip` varchar(32) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `no_empleado` varchar(10) NOT NULL,
  `obs` varchar(200) NOT NULL,
  `img_profile` varchar(50) NOT NULL DEFAULT 'nobody.png',
  `sexo` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=153 DEFAULT CHARSET=latin1;

LOCK TABLES `cat_usuarios` WRITE;
/*!40000 ALTER TABLE `cat_usuarios` DISABLE KEYS */;

INSERT INTO `cat_usuarios` (`id`, `fecha_alta`, `activo`, `grupo`, `nivel`, `usuario`, `nip`, `nombre`, `apellidos`, `no_empleado`, `obs`, `img_profile`, `sexo`)
VALUES
	(1,'2010-05-07',1,'0',0,'Admin','9b431f87f02bbc74c5b62bb6c98910e8','Administrador','del Sistema','0364','Superusuario','nobody.png','--'),
	(2,'2010-05-07',1,'3',1,'Uriel','7b54274e78ab22f88c7d2578e34c1f18','Uriel','Garcia','543','Servicios Grals.','nobody.png','--'),
	(3,'2010-05-07',1,'2',1,'Ariel','9e3e3c979f45eae021572df2e45e59f6','Ariel','Gonzalez Hernandez','2286','IT Management','boss.jpg','--'),
	(4,'2010-05-07',0,'2',2,'Antonio','e61075a6246c4af38dc398cdcb8b0854','Antonio','Rodriguez Robles','2166','ToÃ±in','nobody.png','--'),
	(5,'2010-05-07',1,'2',2,'glara','f9d9bf1c3f529f611cddbf61be414e4f','Gerardo','Lara Perez','2441','Don lobo','nobody.png','--'),
	(6,'2010-05-07',0,'2',2,'Jose','e10adc3949ba59abbe56e057f20f883e','Jose G.','Ruiz Saenz','2465','---','nobody.png','--'),
	(7,'2010-05-07',0,'2',2,'Juan','7c50119153016e55df704b0a0bf4efe8','Juan A.','Garcia Gonzalez','2492','---','nobody.png','--'),
	(8,'2010-05-11',1,'3',2,'Cirilo','ad58d2e82c9afd66cccc0c42aa112695','Cirilo','Arellano','2205','---','nobody.png','--'),
	(9,'2010-05-12',1,'2',1,'uvelez','cf53f160eabec272d73444bc52ec9dcd','Uriel','Velez Herrera','2415','--','uriel.jpg','--'),
	(31,'2010-05-31',1,'3',2,'Joaquin','bd270b810fe354b449a7fb108dd9865f','Joaquin','Ramirez','2379','','nobody.png','--'),
	(11,'2010-05-13',0,'3',2,'Arturo','65deafcf3c1ad1751415736c4cc11f76','Arturo','de Uriarte','9630','Jefe de Jefes','nobody.png','--'),
	(12,'2010-05-26',0,'3',2,'Humberto','7b468597d316a10d9525f307eabf4b6d','Humberto','Galvan','2200','--','nobody.png','--'),
	(13,'2010-05-27',1,'3',2,'Eunice','908922ed2e9abc33db9c7e8e45de912e','Eunice','Mendoza','2046','Uni...','nobody.png','--'),
	(14,'2010-05-27',0,'3',2,'Justino','6832b61bcc30126b2cd70bce6f3b7791','Justino','Aleman','730','--','nobody.png','--'),
	(15,'2010-05-27',0,'3',2,'Luis','6d22c7b0b3d89dec46e184c20350c5a7','Luis Fernando','Sauza','738','--','nobody.png','--'),
	(16,'2010-05-27',0,'3',2,'Nahum','c34171c1b485661d697291632d9707fa','Nahum','Garcia','200634','--','nobody.png','--'),
	(17,'2010-05-31',1,'3',2,'Mario','d3cafc9d89add313fe9bc8fa7b4208f6','Mario','Martinez','2123','','nobody.png','--'),
	(18,'2010-05-31',0,'3',1,'Moises','6fd7474c8a7e5c8711e9000c3bf742d7','Moises','Osorio','2109','','nobody.png','--'),
	(19,'2010-05-31',1,'3',1,'Rafael','d9173bc98836daee7e0be4fbf65f60a6','Rafael','Contreras','2020','','nobody.png','--'),
	(20,'2010-05-31',1,'3',2,'Ulises','a9f4eeb8d314513e56ddec5480ca45d5','Ulises','Cocom','2018','','nobody.png','--'),
	(21,'2010-05-31',1,'3',2,'Miguel','4f22dca5da7867859aa36a87fdc529cd','Miguel Angel','Garcia','2142','','nobody.png','--'),
	(22,'2010-05-31',1,'3',2,'Elizabeth','cea05ad6f5b83044b7ac68816208b7c6','Elizabeth','Garcia','2359','','nobody.png','--'),
	(23,'2010-05-31',0,'3',2,'Olga','56aaed297bc4cd21f89634894fcd9fc0','Olga','Esparza','1500','','nobody.png','--'),
	(24,'2010-05-31',0,'3',2,'Javier','32c171ba4258a6022dfc57e48ffba281','Javier','Hernandez','2509','','nobody.png','--'),
	(25,'2010-05-31',0,'3',2,'Daniel','505599b651b352cd5d4a44f1aeb0f919','Daniel','Gonzalez','2114','','nobody.png','--'),
	(26,'2010-05-31',1,'3',2,'Patricia','1b6bdb99ae68ec3f6d8ffd5b4e837e30','Patricia','Pacheco','2240','','nobody.png','--'),
	(27,'2010-05-31',1,'3',2,'Belinda','3ac47df8bae4286fc246bdb81b6ab9aa','Belinda','Diaz','2314','','nobody.png','--'),
	(28,'2010-05-31',1,'3',2,'Norma','4bf0d59299dfd5094239d0aa855f1ab4','Norma','Moedano','2399','','nobody.png','--'),
	(29,'2010-05-31',0,'3',2,'Alberto','5b598931ce43b88622dbf30fa42fe7bb','Alberto','Montoto','2227','','nobody.png','--'),
	(30,'2010-05-31',1,'3',2,'Fernando','90a3a508c6ae985db435d4194b767bbe','Fernando','Alarcon','2117','','nobody.png','--'),
	(32,'2010-05-31',1,'3',2,'Bibiana','23c796ddcd868728df2d1e058062daf4','Bibiana','Sanchez','2310','','nobody.png','--'),
	(33,'2010-05-31',0,'3',2,'ArielG','76a215eada685f820f55641e593c7423','Ariel','Garcia','2518','','nobody.png','--'),
	(34,'2010-05-31',0,'3',2,'Alejandra','04153829d3fdae5a45ca142b2070cc80','Alejandra','Quezada','2198','','nobody.png','--'),
	(35,'2010-05-31',0,'3',2,'Clara','054ef4bbc3f2bebec34933abaca0d1fd','Clara','Sanchez','2184','','nobody.png','--'),
	(36,'2010-05-31',0,'3',2,'Rita','3240ad7677a5ff8e995414119e3303ed','Rita','MagaÃ±a','2243','','nobody.png','--'),
	(37,'2010-05-31',0,'3',2,'Eduardo','76e2b725f3843e14af466d34c9cb227d','Jose Eduardo','Leon Serrano','2501','','nobody.png','--'),
	(38,'2010-06-01',1,'3',2,'Roberto','29fe072c77851bd137724b589fbce9ad','Roberto','Pacheco Rodriguez','2397','','nobody.png','--'),
	(39,'2010-06-02',1,'3',2,'Alejandro','5cd64f43570f88b27f8a18b14575a9d5','Alejandro','Pacheco Munoz','2461','--','nobody.png','--'),
	(40,'2010-06-02',0,'3',2,'Ana','a715be276b9705e92ba298559fd001b4','Ana Leticia','Saucedo','2504','--','nobody.png','--'),
	(41,'2010-06-03',0,'3',2,'Samuel','a77b71c264f930f1b732742a019318cb','Samuel','Rebollar','200354','','nobody.png','--'),
	(42,'2010-06-03',0,'3',2,'Marco','6fd7474c8a7e5c8711e9000c3bf742d7','Marco','Osorio','943','','nobody.png','--'),
	(43,'2010-06-04',0,'3',2,'Elizabeth','11141215ce120d3aa245a1fea6ae1aab','Elizabeth','Gaymard Pena','3006','','nobody.png','--'),
	(44,'2010-06-04',0,'3',2,'Raul','674f8566758b81305396ebfe34aed3c4','Raul','Rodela Vera','3009','','nobody.png','--'),
	(45,'2010-06-04',0,'3',2,'Gustavo','7347ab3c90768e4fd7acb5cf49ba0ef9','Gustavo','Zumaran Cacho','3010','','nobody.png','--'),
	(46,'2010-06-04',0,'3',2,'Lorenzo','1497dece8e45870af0772168d17601e8','Lorenzo','Chavez Mijarez','3014','','nobody.png','--'),
	(47,'2010-06-04',0,'3',2,'Antonio','76a215eada685f820f55641e593c7423','Antonio','Garcia Avila','3015','','nobody.png','--'),
	(48,'2010-06-04',0,'3',2,'Carlos','03bc9135a2836f8623f43a92ae4b95ff','Carlos','Hernandez Cruz','200244','','nobody.png','M'),
	(49,'2010-06-04',0,'3',2,'Salvador','3f1ef12422ae3b3ee3fe86b4b836f1d8','Salvador','Fayad Herrera','867','','nobody.png','--'),
	(50,'2010-06-04',0,'3',2,'Donaciano','64d5c041d61b440fa25a70cb3ddd6e90','Donaciano','Barrenechea Escudero','2493','','nobody.png','--'),
	(51,'2010-06-04',0,'3',2,'Sergio','d19569332788d07c203dbdb4feb23dbf','Sergio','Matute Portillo','2498','','nobody.png','--'),
	(52,'2010-06-04',0,'3',2,'Gerardo','8a1cb1c4767a76ec5204183df50a7e16','Gerardo','Diaz Santana','2502','','nobody.png','--'),
	(53,'2010-06-04',0,'3',2,'Ricardo','779a3bf59529bce7d66cad20a34ad9bf','Ricardo','Roldan Rgz','2503','','nobody.png','--'),
	(54,'2010-06-04',0,'3',2,'Victor','52afa265b23407da8523708417e377a1','Victor','Jimenez Gtz','2506','','nobody.png','--'),
	(55,'2010-06-04',0,'3',2,'Filemon','73cd3279eb3e2a261e878d171d7e5960','Filemon','Ramirez Chavero','2507','','nobody.png','--'),
	(56,'2010-06-04',0,'3',2,'Ricardo','6c8f2f3f1fd87bab97781b36112bbd31','Ricardo','Carrillo Alvarez','2512','','nobody.png','--'),
	(57,'2010-06-04',0,'3',2,'Karla','9e016b7898b3952f1e3156d1ca0788a6','Karla','Patatuchi Vega','2513','','nobody.png','--'),
	(58,'2010-06-04',0,'3',2,'Javier','b63dde114b1d9872928a58454db41ed6','Javier','Mendez Gtz','2516','','nobody.png','--'),
	(59,'2010-06-04',0,'3',2,'Agustin','1ca5b29376049165f711e8bd89a36087','Agustin','Sanchez Glz','2519','','nobody.png','--'),
	(60,'2010-06-04',0,'3',2,'Rosa','94950b5c6ab76ae70e827e34a27250fd','Rosa','Cuenca Mora','2522','','nobody.png','--'),
	(61,'2010-06-04',0,'3',2,'Javier','bd270b810fe354b449a7fb108dd9865f','Javier','Ramirez Meneses','200560','','nobody.png','--'),
	(62,'2010-06-04',1,'3',2,'Janeth','ef15f4f6904d8373d5668136ec373b20','Janeth','Moguel Osorio','200624','','nobody.png','--'),
	(63,'2010-06-04',1,'3',2,'Fermin','0735bb1b19dc452accf8293889ea298d','Fermin','Bistrain Jimenez','2407','','nobody.png','--'),
	(64,'2010-06-04',0,'3',2,'Claudia','f9fce277febddda8834a0c462b01c509','Claudia Ibeth','Tejeda Tejas','2416','','nobody.png','--'),
	(65,'2010-06-10',1,'3',2,'Araceli','31b9a5efd8c374499f9113482ad31eaa','Araceli','Mata Vazquez','2327','','nobody.png','--'),
	(66,'2010-06-10',0,'3',2,'Alberto','b0b20d7f6bf6f877758be70fcc5f9279','Alberto Rafael','Aguilar Pineda','200592','','nobody.png','--'),
	(67,'2010-06-16',1,'3',2,'ROBERTO','0f0449c1476d8e209be79ce732a67a40','ROBERTO','FERNANDEZ ALONSO','2113','','nobody.png','--'),
	(68,'2010-06-16',1,'3',2,'NEZTOR','d7c0ab68afe4ba55450b55767f721e32','NEZTOR','VELAZQUEZ RODRIGUEZ','200344','','nobody.png','--'),
	(69,'2010-06-16',0,'3',2,'juan','068ab6c0235e8cec479b9f4bf0b42006','Juan','Abarca','761','','nobody.png','--'),
	(70,'2010-06-16',0,'3',2,'JOSE LUIS','b88b8759d6995e65c235d1049e9fb523','JOSE LUIS','ROMERO','2467','','nobody.png','--'),
	(71,'2010-06-23',0,'3',2,'ruben','0b1fb31443c6af833c5c3125a6d30fbf','Ruben','Bernaldez','2446','','nobody.png','--'),
	(72,'2010-06-29',0,'3',2,'Juan','e0d19269056a4c83397ad84a8423874a','Juan Carlos','Torres','2486','','nobody.png','--'),
	(73,'2010-06-30',0,'3',2,'Erick','07a881e63091b6be152791c1882e9a42','Erick','Castillo','0023','','nobody.png','--'),
	(74,'2010-07-09',0,'3',2,'Miguel','1b67775d3765f6131ebb02269db021f9','Miguel Angel','Velasquez','200866','','nobody.png','--'),
	(75,'2010-07-16',0,'3',2,'Ivonne','c49931740ae86dd7e14ebd236a1b371b','Ivonne','Gutierrez Cruz','2514','Miss Wamba','nobody.png','--'),
	(76,'2010-07-20',1,'3',2,'Francisco','2a4931cff9135382d781e754eeb34a47','Francisco','Marquez','0343','','nobody.png','--'),
	(77,'2010-07-20',1,'3',1,'Horacio','963637b67d53a22c7c97dc2f87500025','Horacio','Garcia Rios','2027','','nobody.png','--'),
	(78,'2010-07-21',1,'3',2,'Nohemi','8a4938756e983ffc28fae5f284fe2478','Nohemi','Cordova Rendon','2480','','nobody.png','--'),
	(79,'2010-07-30',1,'3',2,'Veronica','29c1dbc7b1565fa1a96fcb0c6e7a5d52','Veronica','Olanda','2150','','nobody.png','--'),
	(80,'2010-08-09',0,'3',2,'Jose Alberto','aee500ab46114cdb20beef20bfd947c7','Jose Alberto','Miranda Montoto','2330','','nobody.png','--'),
	(81,'2010-08-13',1,'3',2,'Joaquin','7a2994a0fd6e1621482fb7d2113beedd','Joaquin','Gomez Aquino','2030','','nobody.png','--'),
	(82,'2010-08-13',0,'3',2,'Jesus','41aa51e5343ea466f218c303cadd12ef','Jesus ','Pacheco Mejia','2104','','nobody.png','--'),
	(83,'2010-08-13',0,'3',2,'Oscar','aff4b588a7f3d187edadca85215abddd','Oscar','DOMINGUEZ QUIJADA','200375','','nobody.png','--'),
	(84,'2010-08-13',0,'3',2,'Salvador','b835ad3f620048a8c00348f1e14fa1e6','Salvador','Godines Diaz','2029','','nobody.png','--'),
	(85,'2010-08-17',0,'3',2,'coblea','5d7fde9ec87d4c55cdbd912e87d0cc73','Claudia','Oblea','200708','','nobody.png','--'),
	(86,'2010-08-17',1,'3',2,'iestrada','5880557a9981909f5f4a86aed8f584e3','Ignacio','Estrada','2232','','nobody.png','--'),
	(87,'2010-08-17',1,'3',2,'Yulia','298f7ea4b0338bab0ab3596a830136d7','Yulia','Pakhomova','2527','','nobody.png','--'),
	(88,'2010-08-19',0,'3',2,'Laura','f0fef7c8924b8ab100b216e8911c59cb','Laura','Olanda','0303','','nobody.png','--'),
	(89,'2010-08-23',0,'3',2,'Olimpia','1e4cf3e74fd039a7f9422adcf849f483','Olimpia','Ibarra','0040','','nobody.png','--'),
	(90,'2010-09-28',1,'3',2,'Braulio Eduardo','5053b0a6f50d23546feeb38164508464','Braulio Eduardo','Montero Carmona','2048','','nobody.png','--'),
	(91,'2010-10-22',1,'3',2,'Federico','0c766d337234790e623c5712f5b7b6c7','Federico','Garcia Moreno','2533','-','nobody.png','--'),
	(92,'2010-10-25',0,'3',2,'Miguel','ed146b49ccf1e8609c3974bda89d8467','Miguel Angel','Garcia Gutierrez','201000','','nobody.png','--'),
	(93,'2010-10-25',0,'3',2,'Erick','dfef4cc8196f5fc3bfef475a6f431d34','Erick Antonio','Torres Hdz','201061','','nobody.png','--'),
	(94,'2010-10-25',0,'3',2,'Jeremias','9a5f595f82a3b22a03bc01b03dc9d162','Jeremias Zurishaddai','PeÃ±a Ramirez','201073','','nobody.png','--'),
	(95,'2010-11-09',0,'3',2,'jmartinez','6be93f7a96fed60c477d30ae1de032fd','Julio','Martinez','2528','','nobody.png','--'),
	(96,'2010-11-10',1,'3',2,'Laura','f0fef7c8924b8ab100b216e8911c59cb','Laura','Olanda MuÃ±oz','303','','nobody.png','--'),
	(97,'2010-11-12',1,'3',2,'Roberto','dece5561c1ed8a4ad1992c0d742447b4','Roberto','Ramirez','2064','','nobody.png','--'),
	(98,'2010-11-22',0,'3',2,'Erika','cea05ad6f5b83044b7ac68816208b7c6','Erika','Garcia Morales','200990','','nobody.png','--'),
	(99,'2010-11-23',0,'3',2,'Rodrigo','9ec6700ff33305f0e59c9121ac0660a0','Rodrigo','Wastenes Marin','2536','','nobody.png','--'),
	(100,'2010-11-25',0,'3',2,'Mariana','e9360d2c0b1909464aa464bafc1cd61d','Mariana','Romero','201030','','nobody.png','--'),
	(101,'2010-12-13',0,'3',2,'Rodrigo','f38e4a30f40c42ecd011f242f3b24d98','Rodrigo','De Haro Montes','200948','','nobody.png','--'),
	(102,'2010-12-21',0,'3',2,'tmendoza','eec1bed2fae81eeb4592d029d193c09c','Tania','-','9999','','nobody.png','F'),
	(103,'2011-01-03',1,'3',2,'Israel','822620aca64cecdeff65fff626bae608','Israel','Avalos Tapia','2006','','nobody.png','--'),
	(104,'2011-01-24',1,'3',2,'amartinez','788a0f4f6bd1f739dcc55d6275d4541e','Alejandro','Martinez','2180','','nobody.png','--'),
	(105,'2011-02-17',1,'3',2,'Esly','1972b71d6648836ef92331c7ffe27ece','Esly Alejandra','Gomez Carrera','2540','','nobody.png','--'),
	(106,'2011-02-21',0,'3',2,'Gustavo','c57f57f768aac031eff1c31006edba52','Gustavo','Orozco','2093','','nobody.png','--'),
	(107,'2011-02-21',0,'3',2,'Alfredo','1bb99ff2ded3153589c8c37786716f71','Alfredo','Gonzalez Flores','000000','','nobody.png','--'),
	(108,'2011-02-28',1,'3',2,'Gabriel','78b1eb23daae28c92f3bc5c59486e5dc','Gabriel Emmanuel','Sanchez Rodriguez','2176','','nobody.png','--'),
	(109,'2011-03-08',1,'3',2,'Marco','b789e802501ab45dbb404bf3025d0322','Marco Antonio','Tarelo','2102','','nobody.png','--'),
	(111,'0000-00-00',0,'3',1,'Rafael','e10adc3949ba59abbe56e057f20f883e','Rafael','Zuñiga','2428','obs','nobody.png','M'),
	(112,'0000-00-00',1,'3',1,'adriana','e10adc3949ba59abbe56e057f20f883e','Adriana','Pantoja','1111','obs','nobody.png','F'),
	(120,'0000-00-00',0,'3',2,'francisco','e10adc3949ba59abbe56e057f20f883e','Francisco','Aguillon','2222','obs','nobody.png','M'),
	(121,'0000-00-00',0,'3',2,'amaldonado','47bce5c74f589f4867dbd57e9ca9f808','Antonio','Maldonado','1234','obs','nobody.png','M'),
	(110,'0000-00-00',1,'2',2,'Ely','ce810b398b4b1813bcceb6006986633e','ELizabeth','Ramos','201134','obs','nobody.png','F'),
	(113,'0000-00-00',1,'3',3,'fmarquez','6344e17f5ca136754ec4c725e1baf51f','Felipe','Marquez','1111','obs','nobody.png','M'),
	(114,'0000-00-00',0,'3',3,'ggonzalez','1e05c05243553ea07e7e03a1f17d9fef','Gerardo ','Gonzalez Perez','1111','obs','nobody.png','M'),
	(115,'0000-00-00',1,'3',3,'ggonzalez','1901768140228c1dc7829b72f27a6a50','Giovana ','Gonzalez','1111','obs','nobody.png','F'),
	(116,'0000-00-00',0,'3',3,'esanchez','3e61005a7a0e3ed80d8ceede62b2f83c','Emmanuel','Sanchez','1111','obs','nobody.png','M'),
	(117,'0000-00-00',0,'3',1,'rolvera','e10adc3949ba59abbe56e057f20f883e','Roberto Carlos','Olvera','1111','obs','nobody.png','M'),
	(118,'0000-00-00',0,'3',1,'agomez','e10adc3949ba59abbe56e057f20f883e','Alejandra','Gomez','1111','obs','nobody.png','F'),
	(119,'0000-00-00',0,'3',3,'ajmaldonado','e10adc3949ba59abbe56e057f20f883e','Antonio de Jesus','Maldonado','1234','obs','nobody.png','M'),
	(122,'0000-00-00',0,'3',2,'clgarcia','e10adc3949ba59abbe56e057f20f883e','Claudia','Garcia','4321','obs','nobody.png','F'),
	(123,'0000-00-00',1,'2',2,'hgarcia','2412573c623de89a57f8e1c2dccacf4e','Hector','Garcia','2445463','obs','nobody.png','M'),
	(124,'0000-00-00',1,'2',2,'clau','e10adc3949ba59abbe56e057f20f883e','Claudia','Ruiz','201135','obs','nobody.png','F'),
	(125,'0000-00-00',0,'3',1,'ygonzalez','6abfc81cc0aae71606dc0c806d742ad4','Yadira','Gonzalez','0000','obs','nobody.png','F'),
	(126,'0000-00-00',0,'3',1,'kmora','e10adc3949ba59abbe56e057f20f883e','Karla','Mora','0000','obs','nobody.png','F'),
	(127,'0000-00-00',1,'3',2,'mcorrea','ffba75099bb62de8ebd3487c7dfed629','Mercedes','Correa','1234','obs','nobody.png','F'),
	(128,'0000-00-00',1,'3',2,'mapeÃ±a','8a9ac71e5e2fc5487a62787111df9e91','Miguel Angel','PeÃ±a','1234','obs','nobody.png','M'),
	(129,'0000-00-00',1,'3',2,'masalinas','5eacbce87db548ef34455bb1596ca348','Magdalena','Salinas','1234','obs','nobody.png','F'),
	(130,'0000-00-00',1,'3',2,'jnovoa','afd87d42a9ea28e152bd56c2762ca702','Jaime','Novoa','1234','obs','nobody.png','M'),
	(131,'0000-00-00',1,'3',1,'cpuon','e10adc3949ba59abbe56e057f20f883e','Cielo','Puon','1234','obs','nobody.png','F'),
	(132,'0000-00-00',0,'3',6,'leoncio','9c0454a6c0048277b39320d79c0e2275','LEONCIO','RAMIREZ ARVIZU','900001','obs','nobody.png','F'),
	(133,'0000-00-00',1,'3',1,'aensastigue','e10adc3949ba59abbe56e057f20f883e','Adriana','Ensastigue','1234','obs','nobody.png','F'),
	(134,'0000-00-00',1,'3',1,'menriquez','6c44e5cd17f0019c64b042e4a745412a','Miguel','Enriquez','6541','obs','nobody.png','M'),
	(135,'0000-00-00',1,'3',1,'oherrera','3a715498b51a468e87e07820b3e72734','Osvaldo','Herrera','6547','obs','nobody.png','M'),
	(136,'0000-00-00',1,'3',1,'pgonzalez','4607e782c4d86fd5364d7e4508bb10d9','Paola','Gonzalez','9874','obs','nobody.png','F'),
	(137,'0000-00-00',1,'2',1,'drjuarez','e10adc3949ba59abbe56e057f20f883e','Dante Ricardo','Juarez','2567','obs','nobody.png','M'),
	(138,'0000-00-00',0,'3',6,'Eduardo','9e3e3c979f45eae021572df2e45e59f6','Eduardo','Leon','2501','obs','nobody.png','M'),
	(139,'0000-00-00',1,'3',2,'jtrejo','e10adc3949ba59abbe56e057f20f883e','Javier','Trejo','2572','obs','nobody.png','M'),
	(140,'0000-00-00',1,'3',2,'arios','e10adc3949ba59abbe56e057f20f883e','Angelica','Rios','4321','obs','nobody.png','F'),
	(141,'0000-00-00',1,'3',2,'avazquez','e10adc3949ba59abbe56e057f20f883e','Alejandra','Vazquez','4321','obs','nobody.png','F'),
	(142,'0000-00-00',1,'3',2,'golanda','e10adc3949ba59abbe56e057f20f883e','Gabriela','Olanda','4321','obs','nobody.png','F'),
	(143,'0000-00-00',1,'3',2,'dhoffman','e10adc3949ba59abbe56e057f20f883e','Daniel','Hoffman','9876','obs','nobody.png','M'),
	(144,'0000-00-00',1,'3',2,'mmercado','e10adc3949ba59abbe56e057f20f883e','Miguel Angel','Mercado','9512','obs','nobody.png','M'),
	(145,'0000-00-00',1,'3',2,'bmarquez','e10adc3949ba59abbe56e057f20f883e','Berenice','Marquez','9512','obs','nobody.png','F'),
	(146,'0000-00-00',1,'3',2,'aramos','e10adc3949ba59abbe56e057f20f883e','Alan','Ramos','9512','obs','nobody.png','M'),
	(147,'0000-00-00',1,'3',2,'rhernandez','e10adc3949ba59abbe56e057f20f883e','Rocio','Hernandez','9512','obs','nobody.png','F'),
	(148,'0000-00-00',1,'3',2,'mdejesus','c33367701511b4f6020ec61ded352059','Maycol','De Jesus','9512','obs','nobody.png','M'),
	(149,'0000-00-00',1,'3',2,'fcordova','e10adc3949ba59abbe56e057f20f883e','Federico','Cordova','9874','obs','nobody.png','M'),
	(150,'0000-00-00',1,'3',2,'eamado','e10adc3949ba59abbe56e057f20f883e','Edilberto','Amado','9632','obs','nobody.png','M'),
	(151,'0000-00-00',1,'3',2,'mrodriguez','e10adc3949ba59abbe56e057f20f883e','Marco','Rodriguez','8547','obs','nobody.png','M'),
	(152,'0000-00-00',1,'3',2,'vvargas','e10adc3949ba59abbe56e057f20f883e','Viridiana','Vargas','1234','obs','nobody.png','F');

/*!40000 ALTER TABLE `cat_usuarios` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla configuracionglobal
# ------------------------------------------------------------

DROP TABLE IF EXISTS `configuracionglobal`;

CREATE TABLE `configuracionglobal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombreConf` varchar(30) NOT NULL,
  `valor` varchar(10) NOT NULL,
  `descripcion` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `configuracionglobal` WRITE;
/*!40000 ALTER TABLE `configuracionglobal` DISABLE KEYS */;

INSERT INTO `configuracionglobal` (`id`, `nombreConf`, `valor`, `descripcion`)
VALUES
	(1,'sitio_desactivado','No','MANTENIMIENTO A LA BASE DE DATOS'),
	(2,'actualizaciones_nxt','No',''),
	(3,'act_nxt','Si','Nuevas Opciones en el listado de Proveedores<br><br>\nSe realizo la conexion con Cuentas por Pagar');

/*!40000 ALTER TABLE `configuracionglobal` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla detalle_lote
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalle_lote`;

CREATE TABLE `detalle_lote` (
  `id_detalleLote` int(10) NOT NULL AUTO_INCREMENT,
  `id_lote` int(10) NOT NULL,
  `#parte` varchar(10) NOT NULL,
  `serie` varchar(25) NOT NULL,
  `fecha_reg` date NOT NULL,
  `hora_reg` date NOT NULL,
  `observaciones` varchar(200) NOT NULL,
  PRIMARY KEY (`id_detalleLote`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla detalle_tarea
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalle_tarea`;

CREATE TABLE `detalle_tarea` (
  `id_detalle` int(15) NOT NULL AUTO_INCREMENT,
  `id_tarea` int(11) NOT NULL,
  `fecha_detalle` date NOT NULL,
  `hora_detalle` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `msj_detalle` text NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `detalle_tarea` WRITE;
/*!40000 ALTER TABLE `detalle_tarea` DISABLE KEYS */;

INSERT INTO `detalle_tarea` (`id_detalle`, `id_tarea`, `fecha_detalle`, `hora_detalle`, `id_usuario`, `msj_detalle`)
VALUES
	(7,0,'0000-00-00','00:00:00',0,'');

/*!40000 ALTER TABLE `detalle_tarea` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla detalle_tareaX1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalle_tareaX1`;

CREATE TABLE `detalle_tareaX1` (
  `id_detalle` int(15) NOT NULL AUTO_INCREMENT,
  `id_tarea` int(11) NOT NULL,
  `fecha_detalle` date NOT NULL,
  `hora_detalle` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `msj_detalle` text NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=latin1;

LOCK TABLES `detalle_tareaX1` WRITE;
/*!40000 ALTER TABLE `detalle_tareaX1` DISABLE KEYS */;

INSERT INTO `detalle_tareaX1` (`id_detalle`, `id_tarea`, `fecha_detalle`, `hora_detalle`, `id_usuario`, `msj_detalle`)
VALUES
	(1,1,'2011-04-05','13:47:31',9,'Se arrego el problema del coorporativo'),
	(2,1,'2011-04-05','13:48:44',9,'Se cambio el cable de red en el lugar de Miriam ya que se detecto que esa era la causa principal del fallo en la conexion en la computadora hacia la red local y eso provocaba que el usuario ya mencionado anteriormente no podia ingresar de forma correcta a el sitema integral ASPEL COI'),
	(3,2,'2011-04-06','12:24:50',1,'Urge esta extension'),
	(4,6,'2011-04-08','14:12:30',9,'Se hizo el respaldo correspondiete y se esta en espera de la compra del disco duro ya que esa es la causa de la falla'),
	(5,2,'2011-04-12','11:46:59',3,'tiene que estar hoy mismo la extension'),
	(6,3,'2011-04-12','11:47:24',3,'ya se efectuo????????????'),
	(7,8,'2011-04-12','11:49:10',3,'ya realizado envia la informacion a mi correo'),
	(8,11,'2011-04-12','11:50:27',3,'duplicado con el 7'),
	(9,7,'2011-04-12','11:50:58',3,'urgente se debe entregar a direccion y contraloria para el dia jueves'),
	(10,2,'2011-04-14','11:21:17',9,'se instalo la linea telefonica en el lugar de Joaquin Ramirez que quedo con la extension 129 y con el codigo: 98988, ademas de manadar el correo con la informacion correspondiente'),
	(11,6,'2011-04-14','12:11:27',9,'Se recibiÃ³ el disco el dÃ­a 13 de Abril y se mando la laptop funcionando y con el respaldo correspondiente el dÃ­a 14 de Abril con el Ing. Ariel GonzÃ¡lez '),
	(12,5,'2011-04-14','12:14:17',9,'Se entrego el formato que requeria la becaria Tania para poder dar seguimenro a su proyecto'),
	(13,4,'2011-04-18','09:28:02',9,'Se instalo el multifuncional perteneciente al area de compras y con eso se soluciona el problema de impresion de Veronica Olanda asi como de escanner del departamento de compras'),
	(14,12,'2011-04-25','16:50:55',9,'Se le entrego la computadora a Federico con el mantenimiento orrespondiente y se verifico que sus archivos estuvieran completos'),
	(15,17,'2011-04-26','12:31:31',3,'ya se coloco RC '),
	(16,18,'2011-04-26','12:32:01',3,'se conecto equipos mediante crosslink y puente para dar acceso a red'),
	(17,16,'2011-04-27','17:32:45',9,'Se le entregaron 4 discos duros a Miguuel Gracia'),
	(18,19,'2011-04-28','18:13:04',1,'realizado OK'),
	(19,10,'2011-05-02','18:10:16',9,'Se reviso la computadora y se le dio mantenimientopara resolver el problema'),
	(20,21,'2011-05-02','18:11:39',9,'Se entregaron los CPUÂ´S a Eunice Mendoza '),
	(21,20,'2011-05-02','18:12:57',9,'se retraso el cambio por posible remodelacion del area de sistemas y se esta en espera de nuevas indicaciones'),
	(22,9,'2011-05-05','13:24:44',102,'Se hizo el mantenimiento correspondiente y se entrego a su dueÃ±o'),
	(23,13,'2011-05-05','13:25:37',102,'se reviso y se dtermino qu ela falla proviene del conmutador'),
	(24,14,'2011-05-05','13:26:40',102,'Se hizo el mantenimiento corrspondiente y se reinstalo el controlador de la tarjeta de red'),
	(25,15,'2011-05-05','13:27:40',102,'se desarrollo el logo que se requeria y se entrego a el area de cosmetica'),
	(26,18,'2011-05-05','16:55:25',9,'Se puso un nuevo nodo de red en el area de empaque para que se pueda dar el control correspondiente en esa area'),
	(27,24,'2011-05-09','17:18:01',9,'Se  presto una maquina para que sigan trabajando en lo que se repara la maquina'),
	(28,26,'2011-05-20','10:48:12',9,'Se hizo el inventario y se envio por correo '),
	(29,25,'2011-05-20','10:48:43',9,'Se cambio la lap de Norma ya que presentba algunas fallas y se le asigno la que pertenecia a Eduardo'),
	(30,24,'2011-05-20','10:49:41',9,'Se cambio maquina por una con mayor capacidad'),
	(31,23,'2011-05-20','10:50:17',9,'Se hizo la auditoria correspondeiente y se mando el reporte '),
	(32,7,'2011-05-20','10:51:14',9,'Se instalaron las camaras en la ubicacion requerida'),
	(33,27,'2011-05-31','17:40:29',0,'Se reconecto el telefono de facturacion'),
	(34,7,'2011-06-21','09:52:31',9,'Se instalo el servidor de video en el area de almacen'),
	(35,28,'2011-07-19','10:07:24',110,'Se realizaron las modificaciones necesarias para poder diferenciar el listado de vales con el de requisiciones, asi como tambien la interfaz del vale se modifico de color para evitar confusiones  '),
	(36,28,'2011-07-19','10:13:36',5,'Por favor verifica tu coherencia al escribir.'),
	(37,28,'2011-07-19','10:16:42',110,'Lo siento acepto que me equivoque, no volvera a ocurrir.'),
	(38,31,'2011-07-19','10:37:40',110,'Se modifico el detalle para poder visualizar la cantidad modificada y el estado del vale '),
	(39,40,'2011-07-19','11:05:04',110,'Ya se subio al servidor las actualizacines del modulo de mantenimiento'),
	(40,39,'2011-07-19','11:11:02',110,'ya se subio el modulo de el buscador al servidor para el sistema de control de sistemas '),
	(41,38,'2011-07-19','11:12:00',110,'Se subio el modulo de Equipos al servidor para el sistema de control de sistemas  '),
	(42,36,'2011-07-19','11:13:40',110,'Se quito el buscador de la interfaz de requisiones de compras '),
	(43,35,'2011-07-19','11:15:09',110,'Se reviso el modulo de autorizaciones para quitar todas las consultas y la opcion de impresion '),
	(44,32,'2011-07-19','11:16:45',110,'Se realizo el formato ISO para poder imprimir el Vale Electronico'),
	(45,30,'2011-07-20','10:09:13',110,'ya se modifico el listado de usuarios activos '),
	(46,34,'2011-07-21','09:05:02',5,'Finalizado !!!!'),
	(47,42,'2011-07-21','16:11:45',110,'finalizado'),
	(48,41,'2011-07-25','12:22:05',5,'Tarea finalizada, se subio el modulo al servidor dando seguimiento a peticion de usuario.<strong>Finalizado!!!</strong>'),
	(49,3,'2011-08-08','12:54:19',3,'ya se efectuo el respaldo de las maquinas de paty????'),
	(50,44,'2011-08-08','14:58:06',0,'finalizado'),
	(51,44,'2011-08-08','14:58:58',0,'finalizar'),
	(52,44,'2011-08-08','14:59:24',0,'finalizado'),
	(53,43,'2011-08-08','15:00:21',110,'finalizado'),
	(54,41,'2011-08-08','15:01:01',110,'finalizado'),
	(55,33,'2011-09-08','16:46:28',5,'Finalizado se modifico el script para que no se repita el numero de folio'),
	(56,45,'2011-09-08','16:47:17',5,'falta revisar el nuevo proceso y adaptar a la interfaz de usuario'),
	(57,45,'2012-01-06','08:46:54',1,'script finalizado'),
	(58,47,'2012-02-20','12:19:59',9,'Se hizo el inventario correspondiente'),
	(59,22,'2012-02-20','12:20:28',9,'se dio seguimiento'),
	(60,29,'2012-02-20','12:21:06',9,'Se creo el formulario'),
	(61,37,'2012-02-20','13:07:39',0,'se reviso el funcionamiento'),
	(62,46,'2012-02-20','13:10:17',0,'se agrego el modulo'),
	(63,48,'2012-02-27','10:36:10',5,'realizando pruebas en la modificacion de la base de datos'),
	(64,49,'2012-02-27','10:36:36',5,'Realizada la modificacion en la base de datos y empezando a realizar pruebas en el sistema de prueba local'),
	(65,50,'2012-02-27','10:37:56',5,'Pendiente revision de este modulo en el sistema de nextel, puntos a considerar por parte de Ariel Gonzalez'),
	(66,53,'2012-03-21','19:16:59',3,'Esta tarea debe estar terminada el dia 23 demarzo'),
	(67,54,'2012-03-21','19:17:33',3,'Esta tarea debe estar terminada el 23 de marzo'),
	(68,55,'2012-03-21','19:18:20',3,'Esta tarea debe estar terminada el dia 23 de marzo'),
	(69,56,'2012-03-21','19:18:42',3,'Esta tarea debe estar terminada el dia 23 de marzo'),
	(70,57,'2012-03-21','19:19:09',3,'Esta tarea debe estar terminada el dia 23 de marzo'),
	(71,56,'2012-03-22','10:18:23',9,''),
	(72,53,'2012-03-22','13:29:40',9,'se conecto correctamente el access point que da red al cuarto limpio'),
	(73,57,'2012-03-22','15:03:01',9,'se dejo preparado el nodo para hacer el cambio'),
	(74,56,'2012-03-22','15:03:47',9,'Se mando el correo a Vernica Olanda para que cotice el cable para poner el nodo '),
	(75,55,'2012-03-22','15:04:56',9,'Se mando el correo a Vernica Olanda para que cotice el cable para poner el nodo '),
	(76,54,'2012-03-22','15:05:06',9,'Se mando el correo a Vernica Olanda para que cotice el cable para poder bajar la señal de video'),
	(77,57,'2012-03-27','18:08:24',9,'se coloco el nodo en el lugar indicado'),
	(78,55,'2012-04-16','12:34:59',9,'se echo a andar el checador con una tarjeta inalambrica'),
	(79,58,'2012-05-29','13:34:26',9,'ya esta'),
	(80,52,'2012-05-29','13:34:54',9,'ya esta'),
	(81,51,'2012-05-29','13:35:08',9,'ya esta'),
	(82,50,'2012-05-29','13:35:18',9,'ya esta'),
	(83,49,'2012-05-29','13:35:27',9,'ya esta'),
	(84,59,'2012-05-29','14:05:02',9,'AGH inicio tarea'),
	(85,59,'2012-05-29','14:06:19',9,'pendiente por tare num 58'),
	(86,59,'2012-05-30','15:06:40',1,'Cuenta creada'),
	(87,60,'2012-06-07','12:30:10',1,'fsdf'),
	(88,60,'2012-06-07','14:15:22',1,'fdsdf'),
	(89,60,'2012-06-07','14:38:13',1,'dfsdfsd'),
	(90,60,'2012-06-12','16:32:55',1,'dsadsa'),
	(91,60,'2012-06-12','16:33:29',1,'xxxxx'),
	(92,60,'2012-06-12','16:34:17',1,'<strong>Tarea Finalizada</strong>'),
	(93,61,'2012-06-12','16:35:04',1,'xxxxxxxxxxxxxx'),
	(94,61,'2012-06-12','16:38:05',1,'fsdfs'),
	(95,61,'2012-06-12','16:38:18',1,'dd');

/*!40000 ALTER TABLE `detalle_tareaX1` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla detalle_ticket
# ------------------------------------------------------------

DROP TABLE IF EXISTS `detalle_ticket`;

CREATE TABLE `detalle_ticket` (
  `id_detalle` int(15) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) NOT NULL,
  `fecha_detalle` date NOT NULL,
  `hora_detalle` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `msj_detalle` text NOT NULL,
  `usrCierre` int(11) NOT NULL,
  PRIMARY KEY (`id_detalle`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

LOCK TABLES `detalle_ticket` WRITE;
/*!40000 ALTER TABLE `detalle_ticket` DISABLE KEYS */;

INSERT INTO `detalle_ticket` (`id_detalle`, `id_ticket`, `fecha_detalle`, `hora_detalle`, `id_usuario`, `msj_detalle`, `usrCierre`)
VALUES
	(1,3514,'2012-05-07','11:00:22',1,'Primer seguimiento',0),
	(2,3514,'2012-05-07','11:00:36',1,'gfdhdfgdfgdf',0),
	(3,3514,'2012-05-07','11:00:40',1,'fgdfgdfgdfgd',0),
	(4,3514,'2012-05-07','11:01:17',1,'SOLUCION:<br>Observaciones<br>TICKET FINALIZADO',1),
	(5,3486,'2012-11-02','07:24:06',1,'Seguimiento a ticket',0),
	(6,3486,'2012-11-02','07:25:25',1,'Otro seguimiento',0),
	(7,3134,'2012-11-05','08:08:15',1,'Seguimiento de prueba',0);

/*!40000 ALTER TABLE `detalle_ticket` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla errores
# ------------------------------------------------------------

DROP TABLE IF EXISTS `errores`;

CREATE TABLE `errores` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `des` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla grupos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `grupos`;

CREATE TABLE `grupos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_hora_creacion` datetime NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `activo` smallint(1) NOT NULL DEFAULT '1',
  `opcFuncional` varchar(200) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

LOCK TABLES `grupos` WRITE;
/*!40000 ALTER TABLE `grupos` DISABLE KEYS */;

INSERT INTO `grupos` (`id`, `fecha_hora_creacion`, `nombre`, `activo`, `opcFuncional`)
VALUES
	(1,'2012-03-01 13:29:07','administrador',1,'1|2|3|4|5|6');

/*!40000 ALTER TABLE `grupos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla gruposmods
# ------------------------------------------------------------

DROP TABLE IF EXISTS `gruposmods`;

CREATE TABLE `gruposmods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `modulo` varchar(50) NOT NULL,
  `pertenece_a` varchar(50) NOT NULL,
  `numeroMenu` int(11) NOT NULL,
  `activo` smallint(1) NOT NULL DEFAULT '1',
  `ruta` text NOT NULL,
  `rutaimg` varchar(100) NOT NULL,
  `R` smallint(1) NOT NULL DEFAULT '0',
  `W` smallint(1) NOT NULL DEFAULT '0',
  `X` smallint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

LOCK TABLES `gruposmods` WRITE;
/*!40000 ALTER TABLE `gruposmods` DISABLE KEYS */;

INSERT INTO `gruposmods` (`id`, `modulo`, `pertenece_a`, `numeroMenu`, `activo`, `ruta`, `rutaimg`, `R`, `W`, `X`)
VALUES
	(1,'Admin','Menu',1000,1,'../modulos/mod_admon/index.php','../modulos/mod_admon/index.php',0,0,0),
	(2,'Tickets','Menu',2,1,'../modulos/mod_tickets/index.php','../modulos/mod_tickets/index.php',0,0,0),
	(3,'Inventario Equipos','Menu',2,1,'../modulos/mod_equipos/index.php','../modulos/mod_equipos/index.php',0,0,0),
	(4,'Tareas','Menu',3,1,'../modulos/mod_avisos/index.php','../modulos/mod_avisos/index.php',0,0,0),
	(5,'Proyectos','Menu',4,1,'../modulos/mod_proyectos/index.php','../modulos/mod_proyectos/index.php',0,0,0),
	(6,'Mantenimientos','Menu',5,1,'../modulos/mod_registroMantto/index.php','../modulos/mod_registroMantto/index.php',0,0,0);

/*!40000 ALTER TABLE `gruposmods` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla hitos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `hitos`;

CREATE TABLE `hitos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_proyecto` int(11) NOT NULL,
  `hito` longtext NOT NULL,
  `vencimiento` date NOT NULL,
  `observaciones` longtext NOT NULL,
  `fecha_inicio` date NOT NULL,
  `objetivo` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

LOCK TABLES `hitos` WRITE;
/*!40000 ALTER TABLE `hitos` DISABLE KEYS */;

INSERT INTO `hitos` (`id`, `id_proyecto`, `hito`, `vencimiento`, `observaciones`, `fecha_inicio`, `objetivo`)
VALUES
	(17,24,'ahora','2012-10-31','non','2012-08-01','prueba el hito'),
	(18,26,'Prueba de estres','2012-11-16','---','2012-11-15','Probar la opcion de los hitos en los proyectos');

/*!40000 ALTER TABLE `hitos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla proyectos
# ------------------------------------------------------------

DROP TABLE IF EXISTS `proyectos`;

CREATE TABLE `proyectos` (
  `HrsSemanal` decimal(10,2) NOT NULL,
  `HrsTotal` decimal(10,2) NOT NULL,
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripcion` text NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_vencimiento` date NOT NULL,
  `responsable` varchar(20) NOT NULL,
  `observaciones` longtext NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Nuevo',
  `totalHoras` time NOT NULL,
  `porcentaje` tinyint(4) NOT NULL DEFAULT '0',
  `hxdia` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;

LOCK TABLES `proyectos` WRITE;
/*!40000 ALTER TABLE `proyectos` DISABLE KEYS */;

INSERT INTO `proyectos` (`HrsSemanal`, `HrsTotal`, `id`, `nombre`, `descripcion`, `fecha_inicio`, `fecha_vencimiento`, `responsable`, `observaciones`, `status`, `totalHoras`, `porcentaje`, `hxdia`)
VALUES
	(0.00,0.00,24,'Prueba','este','2012-08-01','2013-02-01','3,1','non','Nuevo','838:59:59',0,''),
	(30.00,231.43,25,'Cuentas por Pagar','No lo se','2012-11-09','2013-01-02','1,3','En Teoria','Nuevo','838:59:59',0,'Lunes=6,Martes=6,Miercoles=6,Jueves=6,Viernes=6'),
	(0.00,0.00,26,'Prueba N','Prueba del modulo project','2012-11-15','2012-11-30','2,3','','Nuevo','360:00:00',0,'');

/*!40000 ALTER TABLE `proyectos` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla registro_mantto
# ------------------------------------------------------------

DROP TABLE IF EXISTS `registro_mantto`;

CREATE TABLE `registro_mantto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `no_control` varchar(35) NOT NULL,
  `fecha_programada` date NOT NULL,
  `fecha_real` date NOT NULL,
  `realizado` tinyint(2) NOT NULL DEFAULT '0',
  `observaciones` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=latin1;

LOCK TABLES `registro_mantto` WRITE;
/*!40000 ALTER TABLE `registro_mantto` DISABLE KEYS */;

INSERT INTO `registro_mantto` (`id`, `no_control`, `fecha_programada`, `fecha_real`, `realizado`, `observaciones`)
VALUES
	(1,'LAP030900003','2012-07-02','2012-07-02',1,'-'),
	(2,'CPU030900006','2012-07-03','2012-07-03',1,'-'),
	(3,'CPU051200002','2012-07-04','2012-07-04',1,'-'),
	(4,'CPU071100036','2012-07-05','2012-07-05',1,'-'),
	(5,'CPU051200001','2012-07-06','2012-07-06',1,'-'),
	(6,'CPU031000021','2012-07-09','2012-07-09',1,'-'),
	(7,'CPU030900043','2012-07-10','2012-07-10',1,'-'),
	(8,'CPU081000003','2012-07-11','2012-07-11',1,'-'),
	(9,'CPU071100002','2012-07-12','2012-07-12',1,'-'),
	(10,'CPU031000022','2012-07-13','2012-07-13',1,'-'),
	(11,'CPU051200010','2012-07-16','2012-07-16',1,'-'),
	(12,'CPU071100028','2012-07-17','2012-07-17',1,'-'),
	(13,'CPU030900075','2012-07-18','2012-07-18',1,'-'),
	(14,'CPU051200012','2012-07-19','2012-07-19',1,'-'),
	(15,'CPU101000021','2012-07-20','2012-07-20',1,'-'),
	(16,'CPU071100038','2012-07-23','2012-07-23',1,'-'),
	(17,'CPU071100039','2012-07-24','2012-07-24',1,'-'),
	(18,'CPU071100022','2012-07-25','2012-07-25',1,'-'),
	(19,'CPU101000022','2012-07-26','2012-07-26',1,'-'),
	(20,'CPU101000028','2012-07-27','2012-07-27',1,'-'),
	(21,'CPU071100034','2012-07-30','2012-08-01',1,'-'),
	(22,'CPU071100004','2012-07-31','2012-08-21',1,'-'),
	(23,'LAP030900003','2012-08-01','2012-08-01',1,'-'),
	(24,'LAP1108125','2012-08-02','2012-08-22',1,'-'),
	(25,'CPU071100037','2012-08-03','2012-08-21',1,'-'),
	(26,'CPU071100033','2012-08-06','2012-08-06',1,'-'),
	(27,'CPU071100031','2012-08-07','2012-08-07',1,'-'),
	(28,'CPU071100030','2012-08-08','2012-08-22',1,'-'),
	(29,'CPU071100027','2012-08-09','2012-08-22',1,'-'),
	(30,'CPU071100013','2012-08-10','2012-08-18',1,'-'),
	(31,'CPU071100010','2012-08-13','0000-00-00',0,'-'),
	(32,'CPU071100005','2012-08-14','2012-08-25',1,'-'),
	(33,'CPU031000030','2012-08-15','2012-09-11',1,'-'),
	(34,'CPU30900214','2012-08-16','2012-08-18',1,'-'),
	(35,'CPU030900059','2012-08-17','0000-00-00',0,'-'),
	(36,'CPU030900037','2012-08-20','2012-08-24',1,'-'),
	(37,'CPU071100008','2012-08-21','2012-08-24',1,'-'),
	(38,'CPU031000028','2012-08-22','2012-08-25',1,'-'),
	(39,'CPU071100016','2012-08-23','2012-09-08',1,'-'),
	(40,'CPU071100014','2012-08-24','2012-09-11',1,'-'),
	(41,'CPU071100020','2012-08-27','2012-09-08',1,'-'),
	(42,'CPU090800045','2012-08-28','0000-00-00',0,'-'),
	(43,'CPU030900061','2012-08-29','2012-09-03',1,'-'),
	(44,'CPU030900073','2012-08-30','2012-09-04',1,'-'),
	(45,'CPU090800041','2012-08-31','2012-09-05',1,'-'),
	(46,'CPU090800042','2012-09-03','2012-09-01',1,'-'),
	(47,'CPU071100025','2012-09-04','2012-09-07',1,'-'),
	(48,'CPU30900215','2012-09-05','2012-09-01',1,'-'),
	(49,'CPU30900274','2012-09-06','2012-09-01',1,'-'),
	(50,'CPU090800053','2012-09-07','2012-09-07',1,'-'),
	(51,'CPU030900031','2012-09-10','2012-09-04',1,'-'),
	(52,'CPU030900003','2012-09-11','0000-00-00',0,'-'),
	(53,'LAP030900049','2012-09-12','2012-09-14',1,'-'),
	(54,'CPU051200011','2012-09-13','2012-09-15',1,'-'),
	(55,'CPU090800049','2012-09-14','2012-09-14',1,'-'),
	(56,'CPU030900058','2012-09-17','2012-09-18',1,'-'),
	(57,'CPU30900260','2012-09-18','2012-09-21',1,'-'),
	(58,'CPU030900082','2012-09-19','2012-09-25',1,'-'),
	(59,'CPU090800037','2012-09-20','2012-09-22',1,'-'),
	(60,'CPU30900254','2012-09-21','2012-09-19',1,'-'),
	(61,'CPU031000023','2012-09-24','2012-09-25',1,'-'),
	(62,'CPU090800052','2012-09-25','2012-09-28',1,'-'),
	(63,'CPU030900076','2012-09-26','0000-00-00',0,'-'),
	(64,'LAP071100007','2012-09-27','0000-00-00',0,'-'),
	(65,'LAP101000001','2012-09-28','0000-00-00',0,'-'),
	(66,'CPU101000017','2012-10-01','2012-10-06',1,'-'),
	(67,'LAP081000001','2012-10-02','0000-00-00',0,'-'),
	(68,'CPU30900210','2012-10-03','2012-10-02',1,'-'),
	(69,'CPU30900204','2012-10-04','2012-10-04',1,'-'),
	(70,'CPU031000026','2012-10-05','2012-10-05',1,'-'),
	(71,'LAP071000001','2012-10-08','2012-08-25',1,'-'),
	(72,'CPU030900025','2012-10-09','2012-10-09',1,'-'),
	(73,'LAP071100006','2012-10-10','0000-00-00',0,'-'),
	(74,'CPU030900034','2012-10-11','0000-00-00',0,'-'),
	(75,'CPU30900320','2012-10-12','0000-00-00',0,'-'),
	(76,'LAP101000003','2012-10-15','0000-00-00',0,'-'),
	(77,'LAP030900016','2012-10-16','0000-00-00',0,'-'),
	(78,'CPU101000027','2012-10-17','0000-00-00',0,'-'),
	(79,'CPU051200009','2012-10-18','0000-00-00',0,'-'),
	(80,'CPU031000002','2012-10-19','0000-00-00',0,'-'),
	(81,'CPU071100035','2012-10-22','0000-00-00',0,'-'),
	(82,'CPU031000001','2012-10-23','0000-00-00',0,'-'),
	(83,'CPU30900206','2012-10-24','0000-00-00',0,'-'),
	(84,'CPU031000008','2012-10-25','2012-08-27',1,'-'),
	(85,'CPU101000014','2012-10-26','0000-00-00',0,'-'),
	(86,'CPU101000004','2012-10-29','0000-00-00',0,'-'),
	(87,'CPU101000010','2012-10-30','0000-00-00',0,'-'),
	(88,'CPU030900002','2012-10-31','0000-00-00',0,'-'),
	(89,'CPU071100019','2012-11-01','0000-00-00',0,'-'),
	(90,'CPU101000025','2012-11-02','0000-00-00',0,'-'),
	(91,'CPU031000014','2012-11-05','0000-00-00',0,'-'),
	(92,'CPU101000002','2012-11-06','0000-00-00',0,'-'),
	(93,'CPU071100040','2012-11-07','0000-00-00',0,'-'),
	(94,'CPU031000027','2012-11-08','0000-00-00',0,'-'),
	(95,'LAP071100001','2012-11-09','0000-00-00',0,'-'),
	(96,'CPU051200012','2012-11-12','0000-00-00',0,'-'),
	(97,'CPU030900055','2012-11-13','0000-00-00',0,'-'),
	(98,'CPU051200005','2012-11-14','0000-00-00',0,'-'),
	(99,'LAP031000032','2012-11-15','0000-00-00',0,'-'),
	(100,'LAP030900012','2012-11-16','0000-00-00',0,'-'),
	(101,'CPU30900205','2012-11-19','0000-00-00',0,'-'),
	(102,'CPU101000019','2012-11-20','0000-00-00',0,'-'),
	(103,'CPU031000010','2012-11-21','0000-00-00',0,'-'),
	(104,'IMP071100002','2012-11-22','0000-00-00',0,'-'),
	(105,'CPU101000023','2012-11-23','0000-00-00',0,'-'),
	(106,'IMP071100004','2012-11-26','0000-00-00',0,'-'),
	(107,'IMP071100001','2012-11-27','0000-00-00',0,'-'),
	(108,'SRV101000002','2012-11-28','0000-00-00',0,'-'),
	(109,'SRV101000003','2012-11-29','0000-00-00',0,'-'),
	(110,'SRV101000008','2012-11-30','0000-00-00',0,'-'),
	(111,'SRV101000004','2012-12-03','0000-00-00',0,'-'),
	(112,'SRV101000005','2012-12-04','0000-00-00',0,'-'),
	(113,'SRV101000006','2012-12-05','0000-00-00',0,'-'),
	(114,'SRV101000007','2012-12-06','0000-00-00',0,'-'),
	(115,'SRV101000009','2012-12-07','0000-00-00',0,'-'),
	(116,'SRV101000010','2012-12-10','0000-00-00',0,'-'),
	(117,'IMP071100008','2012-12-11','0000-00-00',0,'-'),
	(118,'IMP071100007','2012-12-12','0000-00-00',0,'-'),
	(119,'IMP061200108','2012-12-13','0000-00-00',0,'-'),
	(120,'CPU071100009','2012-08-01','0000-00-00',0,'-'),
	(121,'CPU030900072','2012-08-02','0000-00-00',0,'-'),
	(122,'CPU071100026','2012-08-03','0000-00-00',0,'-'),
	(123,'CPU030900084','2012-08-06','0000-00-00',0,'-'),
	(124,'CPU071100015','2012-08-07','0000-00-00',0,'-'),
	(125,'CPU071100018','2012-08-08','0000-00-00',0,'-'),
	(126,'CPU071100017','2012-08-09','0000-00-00',0,'-');

/*!40000 ALTER TABLE `registro_mantto` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tareas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tareas`;

CREATE TABLE `tareas` (
  `id_tarea` int(15) NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `prioridad` text NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `fecha_cierre` date NOT NULL,
  `hora_cierre` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Nuevo',
  `porcentaje` int(6) NOT NULL DEFAULT '0',
  `recordListingID` int(11) NOT NULL,
  `id_hito` int(11) NOT NULL,
  `objetivo` text NOT NULL,
  `responsable` varchar(15) NOT NULL,
  `evidencias` text NOT NULL,
  `observaciones` text NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=MyISAM AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

LOCK TABLES `tareas` WRITE;
/*!40000 ALTER TABLE `tareas` DISABLE KEYS */;

INSERT INTO `tareas` (`id_tarea`, `titulo`, `descripcion`, `prioridad`, `fecha_creacion`, `hora_creacion`, `fecha_cierre`, `hora_cierre`, `id_usuario`, `status`, `porcentaje`, `recordListingID`, `id_hito`, `objetivo`, `responsable`, `evidencias`, `observaciones`)
VALUES
	(16,'Tarea Uno','Descripcion de la tareea','','2012-11-15','10:03:17','2012-11-16','00:00:00',0,'FINALIZADA',0,1,18,'Objetivo de la tarea','2,3,4,','','Observaciones'),
	(14,'Otro Ultimo','asi','','2012-08-15','09:44:49','2012-10-02','00:00:00',0,'FINALIZADA',0,2,17,'ver la diferencia de status','3','sdf','la primera'),
	(13,'Por ultimo','non','','2012-08-01','14:57:10','2012-08-16','00:00:00',0,'Nueva',0,3,17,'Prueba la Tarea','3,1','non','todo al Dante');

/*!40000 ALTER TABLE `tareas` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tareas_1
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tareas_1`;

CREATE TABLE `tareas_1` (
  `id_tarea` int(15) NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `mensaje` text NOT NULL,
  `prioridad` text NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `fecha_cierre` date NOT NULL,
  `hora_cierre` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Nuevo',
  `porcentaje` int(6) NOT NULL DEFAULT '0',
  `id_hito` int(11) NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=MyISAM AUTO_INCREMENT=62 DEFAULT CHARSET=latin1;

LOCK TABLES `tareas_1` WRITE;
/*!40000 ALTER TABLE `tareas_1` DISABLE KEYS */;

INSERT INTO `tareas_1` (`id_tarea`, `titulo`, `mensaje`, `prioridad`, `fecha_creacion`, `hora_creacion`, `fecha_cierre`, `hora_cierre`, `id_usuario`, `status`, `porcentaje`, `id_hito`)
VALUES
	(1,'Soporte Tecnico Corporativo','Arreglar conector de red en la computadora de Miriam, la visita queda programada para el dia Lunes a las 9:30 a.m.','alta','2011-04-01','19:05:44','2011-04-05','13:54:07',3,'terminado',0,0),
	(2,'Linea Telefonica','Colocar extension telefonica en el area de oficinas para Joaquin Ramirez','alta','2011-04-05','13:05:11','2011-04-14','11:27:55',3,'terminado',0,0),
	(3,'Respaldo','Realizar el respaldo de la informacion correspondiente a el area de facturacion','alta','2011-04-05','13:20:34','2011-12-28','10:05:24',3,'terminado',0,0),
	(4,'Impresion','Dar solucion a el problema de impresion de la compradora Veronica Olanda','normal','2011-04-05','13:21:57','2011-04-18','09:29:27',3,'terminado',0,0),
	(5,'Formato','Buscar el formato de Mantenimiento correctivo para la becaria Tania','alta','2011-04-05','13:23:12','2011-04-14','12:15:04',3,'terminado',0,0),
	(6,'Respaldo Laptop Eduardo Leon','Realizar respaldo de la computadora de Eduardo Leon ademas de corregir el problema del arranque del Sistema Operativo, a las 10:00 a.m. hablara para pedir informacion acerca de su equipo','alta','2011-04-07','09:11:43','2011-04-14','12:14:06',3,'terminado',0,0),
	(7,'Camaras de video','Instalar servidor de video en almacen','normal','2011-04-07','12:07:51','2011-06-21','09:59:32',3,'terminado',0,0),
	(8,'camaras fotograficas','Hacer una investigacion Rapida sobre la existencia de camaras fotograficas en la planta, modelo capacidad y tipo de memoria externa que utiliza','alta','2011-04-07','12:08:16','2012-02-20','12:20:20',3,'terminado',0,0),
	(9,'computadora PSG','Revision de computadora del area de PSG perteneciente a Ricardo Tapia ya que no puede entrar al SISCO','normal','2011-04-11','08:39:32','2011-05-05','13:25:18',9,'terminado',0,0),
	(10,'Revisar maquina de cable','Revisar maquina dela rea de cable.','alta','2011-04-11','10:11:55','2011-05-02','18:10:41',9,'terminado',0,0),
	(11,'Video camaras almacen','Instalacion de las camaras de almacen1 servidor 8 camarasentre miercoles y jueves','alta','2011-04-12','11:43:30','2011-04-12','11:50:53',3,'terminado',0,0),
	(12,'Mantto Federico','Dar mantenimiento a la computadora de Federico Garcia del departamento de compras','normal','2011-04-14','12:15:11','2011-04-25','16:51:44',9,'terminado',0,0),
	(13,'linea nave ','Revisar la linea de telmex que se acaba de instalar en la nave 2','normal','2011-04-14','12:16:04','2011-05-05','13:26:33',9,'terminado',0,0),
	(14,'mantto cpu cable','revisar la computadora de cable ya que el controlador de red se desinstala sin razon aparente','normal','2011-04-14','12:16:55','2011-05-05','13:27:36',9,'terminado',0,0),
	(15,'logotipo','realizar el logotipo de notebook elite','normal','2011-04-14','12:18:41','2011-05-05','13:28:29',9,'terminado',0,0),
	(16,'Discos Duros','Asignar a Miguel Angel Garcia 3 discos duros con capacidad de 80 Gb','normal','2011-04-26','12:03:08','2011-04-27','17:33:27',1,'terminado',0,0),
	(17,'Req Compras','Requisicion de Compra de 2 Discos Duros','normal','2011-04-26','12:25:07','2011-04-26','12:31:51',3,'terminado',0,0),
	(18,'Implementacion Cable','Implementacion del control de Empaque en cable','normal','2011-04-26','12:26:18','2011-05-05','16:56:25',3,'terminado',0,0),
	(19,'Duplicar Almacen','Duplicar todo lo necesario para de SISCO para Otra instancia del ALMACEN','alta','2011-04-26','12:26:58','2011-07-27','17:16:04',3,'terminado',0,0),
	(20,'Extensiones Telefonicas','Compras cambia de lugar con Alejandra, Olimpia, Miguel.HOY 26 de Abril tiene que quedar el cambio de extensiones','alta','2011-04-26','12:28:22','2011-07-25','17:54:44',3,'terminado',0,0),
	(21,'CPU NEXTEL','Entregar los equipos de nextel a partir de las 12 hrs de HOY','alta','2011-04-26','12:30:16','2011-05-02','18:12:41',3,'terminado',0,0),
	(22,'CRM ALmacen Nextel','Dar seguimiento a CRM Nextel -Almacen','normal','2011-04-26','12:30:49','2012-02-20','12:20:44',3,'terminado',0,0),
	(23,'revision de sims','Ubicar las sims de los radios que han sido asignados','normal','2011-05-05','13:29:07','2011-05-20','10:50:48',102,'terminado',0,0),
	(24,'Falla maquina de blusens','Revisar la computadora de calidad de blusens que ya no prende debido a una falla en el sistema operativo','normal','2011-05-05','13:30:54','2011-05-20','10:50:13',102,'terminado',0,0),
	(25,'Laptop','Formatear y dejar en perfectas condiciones la laptop que pertnecia a Eduardo Leon para poder ser utilizada','normal','2011-05-05','13:34:57','2011-05-20','10:49:36',102,'terminado',0,0),
	(26,'Inventario Monitores','Hacer inventario de los monitores de la planta','normal','2011-05-09','17:18:48','2011-05-20','10:48:37',9,'terminado',0,0),
	(27,'telefono facturacion','Revisar la extension del area de facturacion','alta','2011-05-31','09:37:00','2011-05-31','17:41:26',9,'terminado',0,0),
	(28,'Listar Requisiciones y Vales','Terminar el Listado, diferenciando el color entre requisicione y vales ','normal','2011-07-19','10:03:32','2011-07-19','10:34:05',5,'terminado',0,0),
	(29,'Formulario para modificar las tareas','Formulario para modificar las tareas, para cuando los usuarios cometan errores ortogr','alta','2011-07-19','10:19:10','2012-02-20','12:21:21',5,'terminado',0,0),
	(30,'Grid Listado de Usuarios','En el grid del listado de <strong>Usuarios Activos</strong> colocar el nombre de los grupos, para que no aparezcan solo los id\'s de las tablas sino el nombre del grupo al que pertenecen.','alta','2011-07-19','10:20:15','2011-07-20','10:19:49',5,'terminado',0,0),
	(31,'Modificar el detalle de requisiciones y vales','Mostrar si la cantidad se modifico y si fue autorizada y acomodar de nuevo el listado. ','normal','2011-07-19','10:34:08','2011-07-19','10:47:14',5,'terminado',0,0),
	(32,'Impresion del Vale Electronico','Imprimir el Vale Electronico de acuerdo al formato ISO','alta','2011-07-19','10:47:45','2011-07-19','11:17:54',5,'terminado',0,0),
	(33,'Validaciones en Recibo de Proveedores','Validar que no se introduzca el mismo numero de contra recibo si este ya existe ','normal','2011-07-19','10:50:17','2011-09-08','16:47:07',5,'terminado',0,0),
	(34,'Colocar Buscador','Colocar un buscador en el modulo de RECIBO A PROVEEDORES','alta','2011-07-19','10:53:53','2011-07-21','09:05:22',5,'terminado',0,0),
	(35,'Modificacion del modulo de Autorizaciones','Quitar las consultas que aparecen en el modulo de autorizaciones y quitar la opcion de imprimir ','normal','2011-07-19','10:55:22','2011-07-19','11:16:31',5,'terminado',0,0),
	(36,'Buscador en el modulo de Requisiones de Compras','Quitar buscador en el modulo marcadores de requisiciones de compras ','normal','2011-07-19','10:57:40','2011-07-19','11:14:55',5,'terminado',0,0),
	(37,'Historial de Cotizaciones','Verificar el buen funcionamiento de la parte de Historial de Cotizaciones.','alta','2011-07-19','11:00:12','2012-02-20','13:08:14',5,'terminado',0,0),
	(38,'Modulo de Equipos','Subir al servidor el modulo de equipos al sistema de control de sistemas','normal','2011-07-19','11:01:13','2011-07-19','11:13:28',5,'terminado',0,0),
	(39,'Modulo de Busqueda','Subir al servidor el modulo de Busqueda al control de sistemas','normal','2011-07-19','11:02:09','2011-07-19','11:11:57',5,'terminado',0,0),
	(40,'Modulo de mantenimiento','Subir al servidor las actualizaciones del modulo de mantenimiento al sistema de control de sistemas. ','normal','2011-07-19','11:02:57','2011-07-19','11:06:35',5,'terminado',0,0),
	(41,'Actualizacion Urgente','Se solicita subir al servidor  el modulo de desarrollo al sistema de control del sistema que fue realizado desde el mes de abril y no se le dio ningun tipo de seguimiento. por favor ','alta','2011-07-19','11:07:17','2011-08-08','15:01:10',110,'terminado',0,0),
	(42,'Panel de creacion de usuarios','Al crear usuarios en el panel de administracion de compras, en el apartado Grupo 1 mostrar solo los que estan categorizados como areas, y en el grupo 2 los grupos creados para el funcionamiento de las aplicaciones','alta','2011-07-21','09:48:41','2011-07-21','16:11:57',5,'terminado',0,0),
	(43,'Listado de usuarios','Colocar una barra con las opciones siguientes: numero de registros, y colocar un buscador sobre el listado de los mismos usuarios','alta','2011-07-21','09:50:56','2011-08-08','15:00:51',5,'terminado',0,0),
	(44,'Paginador Listado Requisiciones','En el listado de requisiciones/vales verificar el funcionamiento del paginador para que se desplace entre los diferentes resultados.','alta','2011-07-21','09:52:20','2011-08-08','14:59:53',5,'terminado',0,0),
	(45,'Modificacion Script Sistema cable','Modificacion para cuando se realizan los envios y pueda aceptar envios de acuerdo a su clasificacion, para esto es necesario mandar como parametro el tipo de envio para poder hacer la validacion y se puedan introducir en el envio correcto','normal','2011-07-21','11:59:37','2012-02-20','13:07:34',5,'terminado',0,0),
	(46,'Modificacion Sistema','En el modulo de inventario de equipos agregar tambien el inventario de Radios, donde se pueda capturar los datos del radio asi como de la SIM, que se pueda hacer la Hoja de asignacion, asi como el directorio en automatico de acuerdo a la asignacion.','alta','2011-08-08','12:51:41','2012-02-20','13:12:32',3,'terminado',0,0),
	(47,'Modificacion al sistema','Agregar al inventario de equipos las camaras fotograficas junto con las demas opciones relacionadas.','alta','2011-08-08','12:55:06','2012-02-20','13:07:06',3,'terminado',0,0),
	(48,'Finalizacion de Envios Nextel','Finalizar las modificaciones al sistema para poder adaptar las capturas repetidas en el sistema.','alta','2012-02-27','10:31:59','2012-05-29','13:35:51',5,'terminado',0,0),
	(49,'Verificar Validacion al realizar Empaque','Modificar la validacion cuando se realiza en el empaque de nextel, para que se adapte a la nueva estructura.','alta','2012-02-27','10:33:12','2012-05-29','13:35:40',5,'terminado',0,0),
	(50,'Diseo de interfaz Nextel','Diseño de la interfaz de usuario para realizar el informe hacia nextel','alta','2012-02-27','10:34:46','2012-05-29','13:35:24',5,'terminado',0,0),
	(51,'Modificacion de Datos Cable','Realizar formulario de cambio de datos para que se puedan modificar los datos de los diferentes equipos, Dante se encuentra realizando esta tarea para poder liberarlo hacia los usuarios.','alta','2012-02-27','10:38:25','2012-05-29','13:35:14',5,'terminado',0,0),
	(52,'Modificacion de Sistema de Tickets Blusens','Inclusion de catalogos de productos para el sistema de Blusens callcenter','normal','2012-02-27','10:51:13','2012-05-29','13:35:04',5,'terminado',0,0),
	(53,'Red Lab CR','Red en Lab nave 26Inicio 22/03Fin     23/03','alta','2012-03-21','19:08:44','2012-03-22','13:35:40',3,'terminado',0,0),
	(54,'Video Vigilancia','Monitor de video de las cámaras nave 26  inicio 22/03  fin     23/03','alta','2012-03-21','19:11:06','2012-05-28','13:06:53',3,'terminado',0,0),
	(55,'Nodo de Red','Nodo de red para checador via WEB  inicio 22/03  fin     23/03','alta','2012-03-21','19:12:01','2012-04-16','12:35:26',3,'terminado',0,0),
	(56,'Nodo de Red','Nodo de Red para vigilancia  inicio  22/03  fin      23/03','alta','2012-03-21','19:13:07','2012-05-28','13:06:35',3,'terminado',0,0),
	(57,'Nodo Telefonico','Nodo para modem, preguntar a Rafael especificamente que es lo que se requiere.','alta','2012-03-21','19:13:57','2012-03-27','18:08:48',3,'terminado',0,0),
	(58,'Verificar Imei','id del equipo 119812','alta','2012-04-26','10:18:42','2012-05-29','13:34:40',1,'terminado',0,0),
	(59,'Cuenta FM','Revisar cuenta de FM para BD HP RyAcuenta de almacen URGENTE','alta','2012-05-28','12:56:40','2012-05-30','15:06:50',1,'terminado',0,0),
	(60,'Servidor de video','Mover el servidor de video del almacen a la oficina de norma.','normal','2012-05-30','16:12:57','2012-06-12','16:34:17',1,'terminado',99,0),
	(61,'xxxxxxxxx','xxxxxxxxxxxxxxxxxxx','normal','2012-06-12','16:34:52','0000-00-00','00:00:00',1,'Nuevo',11,0);

/*!40000 ALTER TABLE `tareas_1` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tareas_2
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tareas_2`;

CREATE TABLE `tareas_2` (
  `id_tarea` int(15) NOT NULL AUTO_INCREMENT,
  `titulo` text NOT NULL,
  `descripcion` text NOT NULL,
  `prioridad` text NOT NULL,
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `fecha_cierre` date NOT NULL,
  `hora_cierre` time NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `status` varchar(15) NOT NULL DEFAULT 'Nuevo',
  `porcentaje` int(6) NOT NULL DEFAULT '0',
  `id_hito` int(11) NOT NULL,
  `observacionesTareaHito` longtext NOT NULL,
  `fecha_vencimientoTarea` date NOT NULL,
  PRIMARY KEY (`id_tarea`)
) ENGINE=MyISAM AUTO_INCREMENT=65 DEFAULT CHARSET=latin1;

LOCK TABLES `tareas_2` WRITE;
/*!40000 ALTER TABLE `tareas_2` DISABLE KEYS */;

INSERT INTO `tareas_2` (`id_tarea`, `titulo`, `descripcion`, `prioridad`, `fecha_creacion`, `hora_creacion`, `fecha_cierre`, `hora_cierre`, `id_usuario`, `status`, `porcentaje`, `id_hito`, `observacionesTareaHito`, `fecha_vencimientoTarea`)
VALUES
	(1,'Soporte Tecnico Corporativo','Arreglar conector de red en la computadora de Miriam, la visita queda programada para el dia Lunes a las 9:30 a.m.','alta','2011-04-01','19:05:44','2011-04-05','13:54:07',3,'terminado',0,0,'','0000-00-00'),
	(2,'Linea Telefonica','Colocar extension telefonica en el area de oficinas para Joaquin Ramirez','alta','2011-04-05','13:05:11','2011-04-14','11:27:55',3,'terminado',0,0,'','0000-00-00'),
	(3,'Respaldo','Realizar el respaldo de la informacion correspondiente a el area de facturacion','alta','2011-04-05','13:20:34','2011-12-28','10:05:24',3,'terminado',0,0,'','0000-00-00'),
	(4,'Impresion','Dar solucion a el problema de impresion de la compradora Veronica Olanda','normal','2011-04-05','13:21:57','2011-04-18','09:29:27',3,'terminado',0,0,'','0000-00-00'),
	(5,'Formato','Buscar el formato de Mantenimiento correctivo para la becaria Tania','alta','2011-04-05','13:23:12','2011-04-14','12:15:04',3,'terminado',0,0,'','0000-00-00'),
	(6,'Respaldo Laptop Eduardo Leon','Realizar respaldo de la computadora de Eduardo Leon ademas de corregir el problema del arranque del Sistema Operativo, a las 10:00 a.m. hablara para pedir informacion acerca de su equipo','alta','2011-04-07','09:11:43','2011-04-14','12:14:06',3,'terminado',0,0,'','0000-00-00'),
	(7,'Camaras de video','Instalar servidor de video en almacen','normal','2011-04-07','12:07:51','2011-06-21','09:59:32',3,'terminado',0,0,'','0000-00-00'),
	(8,'camaras fotograficas','Hacer una investigacion Rapida sobre la existencia de camaras fotograficas en la planta, modelo capacidad y tipo de memoria externa que utiliza','alta','2011-04-07','12:08:16','2012-02-20','12:20:20',3,'terminado',0,0,'','0000-00-00'),
	(9,'computadora PSG','Revision de computadora del area de PSG perteneciente a Ricardo Tapia ya que no puede entrar al SISCO','normal','2011-04-11','08:39:32','2011-05-05','13:25:18',9,'terminado',0,0,'','0000-00-00'),
	(10,'Revisar maquina de cable','Revisar maquina dela rea de cable.','alta','2011-04-11','10:11:55','2011-05-02','18:10:41',9,'terminado',0,0,'','0000-00-00'),
	(11,'Video camaras almacen','Instalacion de las camaras de almacen1 servidor 8 camarasentre miercoles y jueves','alta','2011-04-12','11:43:30','2011-04-12','11:50:53',3,'terminado',0,0,'','0000-00-00'),
	(12,'Mantto Federico','Dar mantenimiento a la computadora de Federico Garcia del departamento de compras','normal','2011-04-14','12:15:11','2011-04-25','16:51:44',9,'terminado',0,0,'','0000-00-00'),
	(13,'linea nave ','Revisar la linea de telmex que se acaba de instalar en la nave 2','normal','2011-04-14','12:16:04','2011-05-05','13:26:33',9,'terminado',0,0,'','0000-00-00'),
	(14,'mantto cpu cable','revisar la computadora de cable ya que el controlador de red se desinstala sin razon aparente','normal','2011-04-14','12:16:55','2011-05-05','13:27:36',9,'terminado',0,0,'','0000-00-00'),
	(15,'logotipo','realizar el logotipo de notebook elite','normal','2011-04-14','12:18:41','2011-05-05','13:28:29',9,'terminado',0,0,'','0000-00-00'),
	(16,'Discos Duros','Asignar a Miguel Angel Garcia 3 discos duros con capacidad de 80 Gb','normal','2011-04-26','12:03:08','2011-04-27','17:33:27',1,'terminado',0,0,'','0000-00-00'),
	(17,'Req Compras','Requisicion de Compra de 2 Discos Duros','normal','2011-04-26','12:25:07','2011-04-26','12:31:51',3,'terminado',0,0,'','0000-00-00'),
	(18,'Implementacion Cable','Implementacion del control de Empaque en cable','normal','2011-04-26','12:26:18','2011-05-05','16:56:25',3,'terminado',0,0,'','0000-00-00'),
	(19,'Duplicar Almacen','Duplicar todo lo necesario para de SISCO para Otra instancia del ALMACEN','alta','2011-04-26','12:26:58','2011-07-27','17:16:04',3,'terminado',0,0,'','0000-00-00'),
	(20,'Extensiones Telefonicas','Compras cambia de lugar con Alejandra, Olimpia, Miguel.HOY 26 de Abril tiene que quedar el cambio de extensiones','alta','2011-04-26','12:28:22','2011-07-25','17:54:44',3,'terminado',0,0,'','0000-00-00'),
	(21,'CPU NEXTEL','Entregar los equipos de nextel a partir de las 12 hrs de HOY','alta','2011-04-26','12:30:16','2011-05-02','18:12:41',3,'terminado',0,0,'','0000-00-00'),
	(22,'CRM ALmacen Nextel','Dar seguimiento a CRM Nextel -Almacen','normal','2011-04-26','12:30:49','2012-02-20','12:20:44',3,'terminado',0,0,'','0000-00-00'),
	(23,'revision de sims','Ubicar las sims de los radios que han sido asignados','normal','2011-05-05','13:29:07','2011-05-20','10:50:48',102,'terminado',0,0,'','0000-00-00'),
	(24,'Falla maquina de blusens','Revisar la computadora de calidad de blusens que ya no prende debido a una falla en el sistema operativo','normal','2011-05-05','13:30:54','2011-05-20','10:50:13',102,'terminado',0,0,'','0000-00-00'),
	(25,'Laptop','Formatear y dejar en perfectas condiciones la laptop que pertnecia a Eduardo Leon para poder ser utilizada','normal','2011-05-05','13:34:57','2011-05-20','10:49:36',102,'terminado',0,0,'','0000-00-00'),
	(26,'Inventario Monitores','Hacer inventario de los monitores de la planta','normal','2011-05-09','17:18:48','2011-05-20','10:48:37',9,'terminado',0,0,'','0000-00-00'),
	(27,'telefono facturacion','Revisar la extension del area de facturacion','alta','2011-05-31','09:37:00','2011-05-31','17:41:26',9,'terminado',0,0,'','0000-00-00'),
	(28,'Listar Requisiciones y Vales','Terminar el Listado, diferenciando el color entre requisicione y vales ','normal','2011-07-19','10:03:32','2011-07-19','10:34:05',5,'terminado',0,0,'','0000-00-00'),
	(29,'Formulario para modificar las tareas','Formulario para modificar las tareas, para cuando los usuarios cometan errores ortogr','alta','2011-07-19','10:19:10','2012-02-20','12:21:21',5,'terminado',0,0,'','0000-00-00'),
	(30,'Grid Listado de Usuarios','En el grid del listado de <strong>Usuarios Activos</strong> colocar el nombre de los grupos, para que no aparezcan solo los id\'s de las tablas sino el nombre del grupo al que pertenecen.','alta','2011-07-19','10:20:15','2011-07-20','10:19:49',5,'terminado',0,0,'','0000-00-00'),
	(31,'Modificar el detalle de requisiciones y vales','Mostrar si la cantidad se modifico y si fue autorizada y acomodar de nuevo el listado. ','normal','2011-07-19','10:34:08','2011-07-19','10:47:14',5,'terminado',0,0,'','0000-00-00'),
	(32,'Impresion del Vale Electronico','Imprimir el Vale Electronico de acuerdo al formato ISO','alta','2011-07-19','10:47:45','2011-07-19','11:17:54',5,'terminado',0,0,'','0000-00-00'),
	(33,'Validaciones en Recibo de Proveedores','Validar que no se introduzca el mismo numero de contra recibo si este ya existe ','normal','2011-07-19','10:50:17','2011-09-08','16:47:07',5,'terminado',0,0,'','0000-00-00'),
	(34,'Colocar Buscador','Colocar un buscador en el modulo de RECIBO A PROVEEDORES','alta','2011-07-19','10:53:53','2011-07-21','09:05:22',5,'terminado',0,0,'','0000-00-00'),
	(35,'Modificacion del modulo de Autorizaciones','Quitar las consultas que aparecen en el modulo de autorizaciones y quitar la opcion de imprimir ','normal','2011-07-19','10:55:22','2011-07-19','11:16:31',5,'terminado',0,0,'','0000-00-00'),
	(36,'Buscador en el modulo de Requisiones de Compras','Quitar buscador en el modulo marcadores de requisiciones de compras ','normal','2011-07-19','10:57:40','2011-07-19','11:14:55',5,'terminado',0,0,'','0000-00-00'),
	(37,'Historial de Cotizaciones','Verificar el buen funcionamiento de la parte de Historial de Cotizaciones.','alta','2011-07-19','11:00:12','2012-02-20','13:08:14',5,'terminado',0,0,'','0000-00-00'),
	(38,'Modulo de Equipos','Subir al servidor el modulo de equipos al sistema de control de sistemas','normal','2011-07-19','11:01:13','2011-07-19','11:13:28',5,'terminado',0,0,'','0000-00-00'),
	(39,'Modulo de Busqueda','Subir al servidor el modulo de Busqueda al control de sistemas','normal','2011-07-19','11:02:09','2011-07-19','11:11:57',5,'terminado',0,0,'','0000-00-00'),
	(40,'Modulo de mantenimiento','Subir al servidor las actualizaciones del modulo de mantenimiento al sistema de control de sistemas. ','normal','2011-07-19','11:02:57','2011-07-19','11:06:35',5,'terminado',0,0,'','0000-00-00'),
	(41,'Actualizacion Urgente','Se solicita subir al servidor  el modulo de desarrollo al sistema de control del sistema que fue realizado desde el mes de abril y no se le dio ningun tipo de seguimiento. por favor ','alta','2011-07-19','11:07:17','2011-08-08','15:01:10',110,'terminado',0,0,'','0000-00-00'),
	(42,'Panel de creacion de usuarios','Al crear usuarios en el panel de administracion de compras, en el apartado Grupo 1 mostrar solo los que estan categorizados como areas, y en el grupo 2 los grupos creados para el funcionamiento de las aplicaciones','alta','2011-07-21','09:48:41','2011-07-21','16:11:57',5,'terminado',0,0,'','0000-00-00'),
	(43,'Listado de usuarios','Colocar una barra con las opciones siguientes: numero de registros, y colocar un buscador sobre el listado de los mismos usuarios','alta','2011-07-21','09:50:56','2011-08-08','15:00:51',5,'terminado',0,0,'','0000-00-00'),
	(44,'Paginador Listado Requisiciones','En el listado de requisiciones/vales verificar el funcionamiento del paginador para que se desplace entre los diferentes resultados.','alta','2011-07-21','09:52:20','2011-08-08','14:59:53',5,'terminado',0,0,'','0000-00-00'),
	(45,'Modificacion Script Sistema cable','Modificacion para cuando se realizan los envios y pueda aceptar envios de acuerdo a su clasificacion, para esto es necesario mandar como parametro el tipo de envio para poder hacer la validacion y se puedan introducir en el envio correcto','normal','2011-07-21','11:59:37','2012-02-20','13:07:34',5,'terminado',0,0,'','0000-00-00'),
	(46,'Modificacion Sistema','En el modulo de inventario de equipos agregar tambien el inventario de Radios, donde se pueda capturar los datos del radio asi como de la SIM, que se pueda hacer la Hoja de asignacion, asi como el directorio en automatico de acuerdo a la asignacion.','alta','2011-08-08','12:51:41','2012-02-20','13:12:32',3,'terminado',0,0,'','0000-00-00'),
	(47,'Modificacion al sistema','Agregar al inventario de equipos las camaras fotograficas junto con las demas opciones relacionadas.','alta','2011-08-08','12:55:06','2012-02-20','13:07:06',3,'terminado',0,0,'','0000-00-00'),
	(48,'Finalizacion de Envios Nextel','Finalizar las modificaciones al sistema para poder adaptar las capturas repetidas en el sistema.','alta','2012-02-27','10:31:59','2012-05-29','13:35:51',5,'terminado',0,0,'','0000-00-00'),
	(49,'Verificar Validacion al realizar Empaque','Modificar la validacion cuando se realiza en el empaque de nextel, para que se adapte a la nueva estructura.','alta','2012-02-27','10:33:12','2012-05-29','13:35:40',5,'terminado',0,0,'','0000-00-00'),
	(50,'Diseo de interfaz Nextel','Diseño de la interfaz de usuario para realizar el informe hacia nextel','alta','2012-02-27','10:34:46','2012-05-29','13:35:24',5,'terminado',0,0,'','0000-00-00'),
	(51,'Modificacion de Datos Cable','Realizar formulario de cambio de datos para que se puedan modificar los datos de los diferentes equipos, Dante se encuentra realizando esta tarea para poder liberarlo hacia los usuarios.','alta','2012-02-27','10:38:25','2012-05-29','13:35:14',5,'terminado',0,0,'','0000-00-00'),
	(52,'Modificacion de Sistema de Tickets Blusens','Inclusion de catalogos de productos para el sistema de Blusens callcenter','normal','2012-02-27','10:51:13','2012-05-29','13:35:04',5,'terminado',0,0,'','0000-00-00'),
	(53,'Red Lab CR','Red en Lab nave 26Inicio 22/03Fin     23/03','alta','2012-03-21','19:08:44','2012-03-22','13:35:40',3,'terminado',0,0,'','0000-00-00'),
	(54,'Video Vigilancia','Monitor de video de las cámaras nave 26  inicio 22/03  fin     23/03','alta','2012-03-21','19:11:06','2012-05-28','13:06:53',3,'terminado',0,0,'','0000-00-00'),
	(55,'Nodo de Red','Nodo de red para checador via WEB  inicio 22/03  fin     23/03','alta','2012-03-21','19:12:01','2012-04-16','12:35:26',3,'terminado',0,0,'','0000-00-00'),
	(56,'Nodo de Red','Nodo de Red para vigilancia  inicio  22/03  fin      23/03','alta','2012-03-21','19:13:07','2012-05-28','13:06:35',3,'terminado',0,0,'','0000-00-00'),
	(57,'Nodo Telefonico','Nodo para modem, preguntar a Rafael especificamente que es lo que se requiere.','alta','2012-03-21','19:13:57','2012-03-27','18:08:48',3,'terminado',0,0,'','0000-00-00'),
	(58,'Verificar Imei','id del equipo 119812','alta','2012-04-26','10:18:42','2012-05-29','13:34:40',1,'terminado',0,0,'','0000-00-00'),
	(59,'Cuenta FM','Revisar cuenta de FM para BD HP RyAcuenta de almacen URGENTE','alta','2012-05-28','12:56:40','2012-05-30','15:06:50',1,'terminado',0,0,'','0000-00-00'),
	(60,'Servidor de video','Mover el servidor de video del almacen a la oficina de norma.','normal','2012-05-30','16:12:57','2012-06-12','16:34:17',1,'terminado',99,0,'','0000-00-00'),
	(61,'xxxxxxxxx','xxxxxxxxxxxxxxxxxxx','normal','2012-06-12','16:34:52','0000-00-00','00:00:00',1,'Nuevo',11,0,'','0000-00-00'),
	(62,'Entrevista con los usuarios','Entrevistar a los usuarios del sistema de manera que se pueda conocer los requisitos y decisiones que se deben de manejar','','2012-07-09','17:19:58','0000-00-00','00:00:00',0,'Nueva',0,4,'Primera prueba del guardado de las tareas vinculadas a un hito','0000-00-00'),
	(63,'sda','asa','','2012-07-12','12:32:19','0000-00-00','00:00:00',0,'Nueva',0,5,'da','2012-07-12'),
	(64,'fdsd','fdsfsd','','2012-08-13','14:50:31','0000-00-00','00:00:00',0,'Nueva',0,7,'fsdfsdds','2012-08-23');

/*!40000 ALTER TABLE `tareas_2` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla tickets
# ------------------------------------------------------------

DROP TABLE IF EXISTS `tickets`;

CREATE TABLE `tickets` (
  `id` int(8) NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `hora` time NOT NULL,
  `usuario` int(11) NOT NULL,
  `asunto` varchar(150) NOT NULL,
  `status` varchar(10) NOT NULL DEFAULT 'Nuevo',
  `descripcion` text NOT NULL,
  `observaciones` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;

INSERT INTO `tickets` (`id`, `fecha`, `hora`, `usuario`, `asunto`, `status`, `descripcion`, `observaciones`)
VALUES
	(1,'2012-05-04','17:55:48',1,'asunto','Nuevo','descripcion','observaciones'),
	(2,'2012-05-04','18:10:14',1,'m','Nuevo','m','m'),
	(3,'2012-05-04','21:51:25',1,'a','Nuevo','a','a'),
	(4,'2012-05-04','21:52:25',1,'h','Nuevo','h','h'),
	(5,'2012-05-04','22:00:03',1,'p','Nuevo','p','p'),
	(6,'2012-05-04','22:00:33',1,'p','Nuevo','p','p'),
	(7,'2012-05-04','22:01:43',1,'u','Nuevo','u','u'),
	(8,'2012-05-04','22:05:32',1,'r','Nuevo','r','r'),
	(9,'2012-05-04','22:07:36',1,'j','Nuevo','j','j'),
	(10,'2012-05-04','22:13:07',1,'uy','Nuevo','u','yu'),
	(11,'2012-05-04','22:14:25',1,'ert','Nuevo','ert','ert'),
	(12,'2012-05-04','22:15:08',1,'poi','Nuevo','jkk','lkl');

/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;


# Volcado de tabla userautoriza
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userautoriza`;

CREATE TABLE `userautoriza` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `nip` varchar(32) NOT NULL,
  `monto` varchar(50) NOT NULL COMMENT 'Monto a Autorizar',
  `intentos` int(11) NOT NULL DEFAULT '0' COMMENT 'numIntentos',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



# Volcado de tabla userdbsistemas
# ------------------------------------------------------------

DROP TABLE IF EXISTS `userdbsistemas`;

CREATE TABLE `userdbsistemas` (
  `ID` smallint(6) unsigned NOT NULL AUTO_INCREMENT,
  `usuario` tinytext NOT NULL,
  `pass` tinytext NOT NULL,
  `nombre` varchar(35) NOT NULL,
  `apaterno` varchar(30) NOT NULL,
  `nivel_acceso` smallint(4) unsigned NOT NULL DEFAULT '0',
  `cambiarPass` int(11) NOT NULL DEFAULT '0',
  `directorio` varchar(100) NOT NULL DEFAULT 'Sin directorio',
  `sexo` char(3) NOT NULL,
  `tipo` varchar(50) NOT NULL,
  `nomina` int(11) NOT NULL,
  `grupo` varchar(20) NOT NULL,
  `grupo2` int(11) NOT NULL,
  `obs` varchar(1000) NOT NULL,
  `activo` smallint(1) NOT NULL DEFAULT '1',
  `fecha_creacion` date NOT NULL,
  `hora_creacion` time NOT NULL,
  `fecha_eliminacion` date NOT NULL,
  `hora_eliminacion` time NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

LOCK TABLES `userdbsistemas` WRITE;
/*!40000 ALTER TABLE `userdbsistemas` DISABLE KEYS */;

INSERT INTO `userdbsistemas` (`ID`, `usuario`, `pass`, `nombre`, `apaterno`, `nivel_acceso`, `cambiarPass`, `directorio`, `sexo`, `tipo`, `nomina`, `grupo`, `grupo2`, `obs`, `activo`, `fecha_creacion`, `hora_creacion`, `fecha_eliminacion`, `hora_eliminacion`)
VALUES
	(1,'Admin','0cc175b9c0f1b6a831c399e269772661','Administrador ','Sistema',0,1,'Sin directorio','M','',2441,'1',1,'',1,'0000-00-00','00:00:00','0000-00-00','00:00:00'),
	(2,'uvelez','e10adc3949ba59abbe56e057f20f883e','Uriel','Velez',1,0,'Sin directorio','M','',2415,'--',1,'',1,'0000-00-00','00:00:00','0000-00-00','00:00:00'),
	(3,'ariel','e10adc3949ba59abbe56e057f20f883e','Ariel','Gonzalez',1,0,'Sin directorio','M','',2286,'--',1,'',1,'0000-00-00','00:00:00','0000-00-00','00:00:00'),
	(4,'drjuarez','e10adc3949ba59abbe56e057f20f883e','Dante','Juarez',1,0,'Sin directorio','M','',0,'--',1,'',1,'0000-00-00','00:00:00','0000-00-00','00:00:00');

/*!40000 ALTER TABLE `userdbsistemas` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
