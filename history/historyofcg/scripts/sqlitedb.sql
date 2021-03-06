-- MySQL dump 10.13  Distrib 5.1.41, for debian-linux-gnu (i486)
--
-- Host: localhost    Database: historyofcg_prod
-- ------------------------------------------------------
-- Server version	5.1.41-3ubuntu12.10

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
-- Table structure for table `acos`
--

DROP TABLE IF EXISTS `acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT '',
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acos`
--

LOCK TABLES `acos` WRITE;
/*!40000 ALTER TABLE `acos` DISABLE KEYS */;

INSERT INTO `acos` VALUES (1,NULL,'',NULL,'controllers',1,108);
INSERT INTO `acos` VALUES (2,1,NULL,NULL,'About',2,7);
INSERT INTO `acos` VALUES (3,1,NULL,NULL,'Entries',8,27);
INSERT INTO `acos` VALUES (4,1,NULL,NULL,'Groups',28,41);
INSERT INTO `acos` VALUES (5,4,NULL,NULL,'index',29,30);
INSERT INTO `acos` VALUES (6,4,NULL,NULL,'view',31,32);
INSERT INTO `acos` VALUES (7,4,NULL,NULL,'add',33,34);
INSERT INTO `acos` VALUES (8,4,NULL,NULL,'edit',35,36);
INSERT INTO `acos` VALUES (9,4,NULL,NULL,'delete',37,38);
INSERT INTO `acos` VALUES (10,1,NULL,NULL,'Home',42,47);
INSERT INTO `acos` VALUES (11,10,NULL,NULL,'index',43,44);
INSERT INTO `acos` VALUES (12,1,NULL,NULL,'Sessions',48,55);
INSERT INTO `acos` VALUES (13,12,NULL,NULL,'create',49,50);
INSERT INTO `acos` VALUES (14,12,NULL,NULL,'destroy',51,52);
INSERT INTO `acos` VALUES (15,1,NULL,NULL,'Users',56,73);
INSERT INTO `acos` VALUES (16,15,NULL,NULL,'signup',57,58);
INSERT INTO `acos` VALUES (17,15,NULL,NULL,'index',59,60);
INSERT INTO `acos` VALUES (18,15,NULL,NULL,'view',61,62);
INSERT INTO `acos` VALUES (19,15,NULL,NULL,'add',63,64);
INSERT INTO `acos` VALUES (20,15,NULL,NULL,'edit',65,66);
INSERT INTO `acos` VALUES (21,15,NULL,NULL,'delete',67,68);
INSERT INTO `acos` VALUES (22,1,NULL,NULL,'AclExtras',74,75);
INSERT INTO `acos` VALUES (24,3,NULL,NULL,'view',9,10);
INSERT INTO `acos` VALUES (25,3,NULL,NULL,'add',11,12);
INSERT INTO `acos` VALUES (26,3,NULL,NULL,'edit',13,14);
INSERT INTO `acos` VALUES (27,15,NULL,NULL,'initDB',69,70);
INSERT INTO `acos` VALUES (28,1,NULL,NULL,'Tags',76,81);
INSERT INTO `acos` VALUES (29,28,NULL,NULL,'fetch',77,78);
INSERT INTO `acos` VALUES (30,3,NULL,NULL,'get',15,16);
INSERT INTO `acos` VALUES (31,3,NULL,NULL,'saveTags',17,18);
INSERT INTO `acos` VALUES (42,1,NULL,NULL,'Stories',82,91);
INSERT INTO `acos` VALUES (43,42,NULL,NULL,'get',83,84);
INSERT INTO `acos` VALUES (44,42,NULL,NULL,'add_or_edit',85,86);
INSERT INTO `acos` VALUES (51,3,NULL,NULL,'get_by_phrase',19,20);
INSERT INTO `acos` VALUES (52,1,NULL,NULL,'Connections',92,101);
INSERT INTO `acos` VALUES (53,52,NULL,NULL,'saveTags',93,94);
INSERT INTO `acos` VALUES (54,52,NULL,NULL,'add',95,96);
INSERT INTO `acos` VALUES (57,52,NULL,NULL,'delete',97,98);
INSERT INTO `acos` VALUES (58,42,NULL,NULL,'delete',87,88);
INSERT INTO `acos` VALUES (59,3,NULL,NULL,'not_found',21,22);
INSERT INTO `acos` VALUES (60,2,NULL,NULL,'index',3,4);
INSERT INTO `acos` VALUES (61,2,NULL,NULL,'create_slug',5,6);
INSERT INTO `acos` VALUES (62,52,NULL,NULL,'create_slug',99,100);
INSERT INTO `acos` VALUES (63,3,NULL,NULL,'not_published',23,24);
INSERT INTO `acos` VALUES (64,3,NULL,NULL,'create_slug',25,26);
INSERT INTO `acos` VALUES (65,4,NULL,NULL,'create_slug',39,40);
INSERT INTO `acos` VALUES (66,10,NULL,NULL,'create_slug',45,46);
INSERT INTO `acos` VALUES (67,1,NULL,NULL,'Search',102,107);
INSERT INTO `acos` VALUES (68,67,NULL,NULL,'index',103,104);
INSERT INTO `acos` VALUES (69,67,NULL,NULL,'create_slug',105,106);
INSERT INTO `acos` VALUES (70,12,NULL,NULL,'create_slug',53,54);
INSERT INTO `acos` VALUES (71,42,NULL,NULL,'create_slug',89,90);
INSERT INTO `acos` VALUES (72,28,NULL,NULL,'create_slug',79,80);
INSERT INTO `acos` VALUES (73,15,NULL,NULL,'create_slug',71,72);
/*!40000 ALTER TABLE `acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros`
--

DROP TABLE IF EXISTS `aros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aros` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT NULL,
  `model` varchar(255) DEFAULT '',
  `foreign_key` int(10) unsigned DEFAULT NULL,
  `alias` varchar(255) DEFAULT '',
  `lft` int(10) DEFAULT NULL,
  `rght` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aros`
--

LOCK TABLES `aros` WRITE;
/*!40000 ALTER TABLE `aros` DISABLE KEYS */;
INSERT INTO `aros` VALUES (1,NULL,'Group',1,'',1,2);
INSERT INTO `acos` VALUES (2,NULL,'Group',2,'',3,4);
/*!40000 ALTER TABLE `aros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aros_acos`
--

DROP TABLE IF EXISTS `aros_acos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aros_acos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `aro_id` int(10) unsigned NOT NULL,
  `aco_id` int(10) unsigned NOT NULL,
  `_create` char(2) NOT NULL DEFAULT '0',
  `_read` char(2) NOT NULL DEFAULT '0',
  `_update` char(2) NOT NULL DEFAULT '0',
  `_delete` char(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aros_acos`
--

LOCK TABLES `aros_acos` WRITE;
/*!40000 ALTER TABLE `aros_acos` DISABLE KEYS */;
INSERT INTO `aros_acos` VALUES (1,1,1,'1','1','1','1');
INSERT INTO `acos` VALUES (2,2,1,'1','1','1','1');
/*!40000 ALTER TABLE `aros_acos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `category` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `category` (`category`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (4,'event');
INSERT INTO `acos` VALUES (3,'organization');
INSERT INTO `acos` VALUES (1,'person');
INSERT INTO `acos` VALUES (2,'project');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id_1` int(11) unsigned NOT NULL,
  `entry_id_2` int(11) unsigned NOT NULL,
  `role` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id_1` (`entry_id_1`),
  KEY `entry_id_2` (`entry_id_2`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,2,3,NULL);
INSERT INTO `acos` VALUES (2,2,4,NULL);
INSERT INTO `acos` VALUES (3,5,6,NULL);
INSERT INTO `acos` VALUES (4,6,7,NULL);
INSERT INTO `acos` VALUES (5,7,8,NULL);
INSERT INTO `acos` VALUES (6,7,9,NULL);
INSERT INTO `acos` VALUES (7,9,10,NULL);
INSERT INTO `acos` VALUES (8,10,6,NULL);
INSERT INTO `acos` VALUES (12,14,2,NULL);
INSERT INTO `acos` VALUES (13,22,7,NULL);
INSERT INTO `acos` VALUES (14,22,6,NULL);
INSERT INTO `acos` VALUES (15,22,19,NULL);
INSERT INTO `acos` VALUES (16,22,21,NULL);
INSERT INTO `acos` VALUES (17,22,2,NULL);
INSERT INTO `acos` VALUES (18,2,23,NULL);
INSERT INTO `acos` VALUES (19,2,24,NULL);
INSERT INTO `acos` VALUES (20,25,26,NULL);
INSERT INTO `acos` VALUES (22,21,19,NULL);
INSERT INTO `acos` VALUES (23,29,30,NULL);
INSERT INTO `acos` VALUES (24,33,2,NULL);
INSERT INTO `acos` VALUES (25,34,33,NULL);
INSERT INTO `acos` VALUES (26,34,12,NULL);
INSERT INTO `acos` VALUES (27,34,1,NULL);
INSERT INTO `acos` VALUES (28,11,6,NULL);
INSERT INTO `acos` VALUES (29,2,27,NULL);
INSERT INTO `acos` VALUES (30,12,1,NULL);
INSERT INTO `acos` VALUES (31,12,33,NULL);
INSERT INTO `acos` VALUES (32,33,1,NULL);
INSERT INTO `acos` VALUES (33,36,33,NULL);
INSERT INTO `acos` VALUES (34,36,34,NULL);
INSERT INTO `acos` VALUES (35,36,12,NULL);
INSERT INTO `acos` VALUES (36,36,1,NULL);
INSERT INTO `acos` VALUES (37,4,19,NULL);
INSERT INTO `acos` VALUES (38,4,3,NULL);
INSERT INTO `acos` VALUES (39,33,38,NULL);
INSERT INTO `acos` VALUES (40,39,14,NULL);
INSERT INTO `acos` VALUES (41,40,41,NULL);
INSERT INTO `acos` VALUES (42,40,42,NULL);
INSERT INTO `acos` VALUES (43,43,37,NULL);
INSERT INTO `acos` VALUES (44,43,44,NULL);
INSERT INTO `acos` VALUES (45,45,46,NULL);
INSERT INTO `acos` VALUES (46,48,49,NULL);
INSERT INTO `acos` VALUES (47,48,50,NULL);
INSERT INTO `acos` VALUES (48,48,51,NULL);
INSERT INTO `acos` VALUES (49,52,53,NULL);
INSERT INTO `acos` VALUES (50,56,57,NULL);
INSERT INTO `acos` VALUES (51,58,59,NULL);
INSERT INTO `acos` VALUES (52,58,60,NULL);
INSERT INTO `acos` VALUES (53,58,61,NULL);
INSERT INTO `acos` VALUES (54,58,62,NULL);
INSERT INTO `acos` VALUES (55,63,52,NULL);
INSERT INTO `acos` VALUES (56,63,64,NULL);
INSERT INTO `acos` VALUES (57,65,67,NULL);
INSERT INTO `acos` VALUES (58,65,68,NULL);
INSERT INTO `acos` VALUES (59,65,60,NULL);
INSERT INTO `acos` VALUES (60,65,58,NULL);
INSERT INTO `acos` VALUES (61,69,70,NULL);
INSERT INTO `acos` VALUES (62,69,25,NULL);
INSERT INTO `acos` VALUES (63,69,71,NULL);
INSERT INTO `acos` VALUES (64,72,73,NULL);
INSERT INTO `acos` VALUES (65,72,74,NULL);
INSERT INTO `acos` VALUES (66,72,75,NULL);
INSERT INTO `acos` VALUES (67,72,76,NULL);
INSERT INTO `acos` VALUES (68,77,78,NULL);
INSERT INTO `acos` VALUES (69,77,79,NULL);
INSERT INTO `acos` VALUES (70,77,80,NULL);
INSERT INTO `acos` VALUES (71,81,80,NULL);
INSERT INTO `acos` VALUES (72,81,82,NULL);
INSERT INTO `acos` VALUES (73,77,83,NULL);
INSERT INTO `acos` VALUES (74,77,84,NULL);
INSERT INTO `acos` VALUES (75,77,85,NULL);
INSERT INTO `acos` VALUES (76,77,86,NULL);
INSERT INTO `acos` VALUES (77,77,87,NULL);
INSERT INTO `acos` VALUES (78,77,88,NULL);
INSERT INTO `acos` VALUES (79,77,89,NULL);
INSERT INTO `acos` VALUES (80,90,91,NULL);
INSERT INTO `acos` VALUES (81,90,92,NULL);
INSERT INTO `acos` VALUES (82,93,94,NULL);
INSERT INTO `acos` VALUES (83,95,96,NULL);
INSERT INTO `acos` VALUES (84,95,97,NULL);
INSERT INTO `acos` VALUES (85,98,67,NULL);
INSERT INTO `acos` VALUES (86,98,99,NULL);
INSERT INTO `acos` VALUES (87,98,100,NULL);
INSERT INTO `acos` VALUES (88,98,101,NULL);
INSERT INTO `acos` VALUES (89,98,102,NULL);
INSERT INTO `acos` VALUES (90,98,103,NULL);
INSERT INTO `acos` VALUES (91,104,94,NULL);
INSERT INTO `acos` VALUES (92,104,105,NULL);
INSERT INTO `acos` VALUES (93,104,106,NULL);
INSERT INTO `acos` VALUES (94,104,107,NULL);
INSERT INTO `acos` VALUES (95,104,91,NULL);
INSERT INTO `acos` VALUES (96,104,108,NULL);
INSERT INTO `acos` VALUES (97,104,109,NULL);
INSERT INTO `acos` VALUES (98,104,110,NULL);
INSERT INTO `acos` VALUES (99,104,111,NULL);
INSERT INTO `acos` VALUES (100,104,112,NULL);
INSERT INTO `acos` VALUES (101,113,2,NULL);
INSERT INTO `acos` VALUES (102,114,115,NULL);
INSERT INTO `acos` VALUES (103,114,116,NULL);
INSERT INTO `acos` VALUES (104,114,117,NULL);
INSERT INTO `acos` VALUES (105,114,118,NULL);
INSERT INTO `acos` VALUES (106,114,62,NULL);
INSERT INTO `acos` VALUES (107,119,120,NULL);
INSERT INTO `acos` VALUES (108,119,121,NULL);
INSERT INTO `acos` VALUES (110,122,123,NULL);
INSERT INTO `acos` VALUES (111,122,124,NULL);
INSERT INTO `acos` VALUES (112,125,57,NULL);
INSERT INTO `acos` VALUES (113,125,126,NULL);
INSERT INTO `acos` VALUES (114,127,128,NULL);
INSERT INTO `acos` VALUES (115,127,106,NULL);
INSERT INTO `acos` VALUES (116,127,129,NULL);
INSERT INTO `acos` VALUES (117,127,130,NULL);
INSERT INTO `acos` VALUES (118,127,131,NULL);
INSERT INTO `acos` VALUES (119,127,132,NULL);
INSERT INTO `acos` VALUES (120,127,133,NULL);
INSERT INTO `acos` VALUES (121,22,134,NULL);
INSERT INTO `acos` VALUES (122,135,94,NULL);
INSERT INTO `acos` VALUES (123,135,105,NULL);
INSERT INTO `acos` VALUES (124,135,136,NULL);
INSERT INTO `acos` VALUES (125,135,104,NULL);
INSERT INTO `acos` VALUES (126,137,138,NULL);
INSERT INTO `acos` VALUES (127,137,79,NULL);
INSERT INTO `acos` VALUES (128,139,141,NULL);
INSERT INTO `acos` VALUES (129,139,97,NULL);
INSERT INTO `acos` VALUES (130,139,142,NULL);
INSERT INTO `acos` VALUES (131,139,143,NULL);
INSERT INTO `acos` VALUES (132,144,145,NULL);
INSERT INTO `acos` VALUES (133,144,146,NULL);
INSERT INTO `acos` VALUES (134,147,77,NULL);
INSERT INTO `acos` VALUES (135,147,148,NULL);
INSERT INTO `acos` VALUES (136,148,149,NULL);
INSERT INTO `acos` VALUES (137,147,149,NULL);
INSERT INTO `acos` VALUES (138,150,151,NULL);
INSERT INTO `acos` VALUES (139,150,152,NULL);
INSERT INTO `acos` VALUES (140,153,154,NULL);
INSERT INTO `acos` VALUES (141,155,53,NULL);
INSERT INTO `acos` VALUES (142,155,156,NULL);
INSERT INTO `acos` VALUES (143,155,153,NULL);
INSERT INTO `acos` VALUES (144,155,157,NULL);
INSERT INTO `acos` VALUES (145,40,158,NULL);
INSERT INTO `acos` VALUES (146,155,159,NULL);
INSERT INTO `acos` VALUES (147,159,48,NULL);
INSERT INTO `acos` VALUES (148,160,155,NULL);
INSERT INTO `acos` VALUES (149,155,161,NULL);
INSERT INTO `acos` VALUES (150,155,162,NULL);
INSERT INTO `acos` VALUES (151,155,163,NULL);
INSERT INTO `acos` VALUES (152,155,164,NULL);
INSERT INTO `acos` VALUES (153,155,48,NULL);
INSERT INTO `acos` VALUES (154,155,165,NULL);
INSERT INTO `acos` VALUES (155,167,138,NULL);
INSERT INTO `acos` VALUES (156,168,67,NULL);
INSERT INTO `acos` VALUES (157,169,170,NULL);
INSERT INTO `acos` VALUES (158,171,172,NULL);
INSERT INTO `acos` VALUES (159,171,7,NULL);
INSERT INTO `acos` VALUES (160,171,173,NULL);
INSERT INTO `acos` VALUES (161,171,174,NULL);
INSERT INTO `acos` VALUES (162,175,22,NULL);
INSERT INTO `acos` VALUES (163,175,2,NULL);
INSERT INTO `acos` VALUES (164,175,40,NULL);
INSERT INTO `acos` VALUES (165,177,22,NULL);
INSERT INTO `acos` VALUES (166,177,2,NULL);
INSERT INTO `acos` VALUES (167,166,178,NULL);
INSERT INTO `acos` VALUES (168,166,179,NULL);
INSERT INTO `acos` VALUES (169,169,180,NULL);
INSERT INTO `acos` VALUES (170,169,181,NULL);
INSERT INTO `acos` VALUES (171,182,78,NULL);
INSERT INTO `acos` VALUES (172,182,88,NULL);
INSERT INTO `acos` VALUES (173,182,183,NULL);
INSERT INTO `acos` VALUES (174,182,77,NULL);
INSERT INTO `acos` VALUES (175,182,89,NULL);
INSERT INTO `acos` VALUES (176,184,182,NULL);
INSERT INTO `acos` VALUES (177,88,184,NULL);
INSERT INTO `acos` VALUES (178,185,186,NULL);
INSERT INTO `acos` VALUES (179,185,187,NULL);
INSERT INTO `acos` VALUES (180,185,127,NULL);
INSERT INTO `acos` VALUES (182,185,106,NULL);
INSERT INTO `acos` VALUES (183,185,188,NULL);
INSERT INTO `acos` VALUES (184,30,189,NULL);
INSERT INTO `acos` VALUES (185,30,190,NULL);
INSERT INTO `acos` VALUES (186,30,191,NULL);
INSERT INTO `acos` VALUES (187,30,192,NULL);
INSERT INTO `acos` VALUES (188,30,193,NULL);
INSERT INTO `acos` VALUES (189,30,194,NULL);
INSERT INTO `acos` VALUES (190,30,195,NULL);
INSERT INTO `acos` VALUES (191,6,196,NULL);
INSERT INTO `acos` VALUES (192,6,173,NULL);
INSERT INTO `acos` VALUES (193,6,70,NULL);
INSERT INTO `acos` VALUES (194,6,197,NULL);
INSERT INTO `acos` VALUES (195,6,198,NULL);
INSERT INTO `acos` VALUES (196,6,199,NULL);
INSERT INTO `acos` VALUES (197,6,200,NULL);
INSERT INTO `acos` VALUES (198,6,174,NULL);
INSERT INTO `acos` VALUES (199,201,92,NULL);
INSERT INTO `acos` VALUES (200,201,91,NULL);
INSERT INTO `acos` VALUES (201,202,203,NULL);
INSERT INTO `acos` VALUES (202,204,205,NULL);
INSERT INTO `acos` VALUES (203,204,206,NULL);
INSERT INTO `acos` VALUES (204,207,208,NULL);
INSERT INTO `acos` VALUES (205,207,209,NULL);
INSERT INTO `acos` VALUES (206,207,202,NULL);
INSERT INTO `acos` VALUES (207,207,210,NULL);
INSERT INTO `acos` VALUES (208,207,211,NULL);
INSERT INTO `acos` VALUES (209,207,206,NULL);
INSERT INTO `acos` VALUES (210,207,143,NULL);
INSERT INTO `acos` VALUES (211,207,212,NULL);
INSERT INTO `acos` VALUES (213,213,214,NULL);
INSERT INTO `acos` VALUES (214,213,162,NULL);
INSERT INTO `acos` VALUES (215,213,165,NULL);
INSERT INTO `acos` VALUES (216,213,215,NULL);
INSERT INTO `acos` VALUES (217,213,216,NULL);
INSERT INTO `acos` VALUES (218,213,217,NULL);
INSERT INTO `acos` VALUES (219,213,218,NULL);
INSERT INTO `acos` VALUES (220,213,219,NULL);
INSERT INTO `acos` VALUES (221,220,221,NULL);
INSERT INTO `acos` VALUES (222,220,203,NULL);
INSERT INTO `acos` VALUES (223,220,202,NULL);
INSERT INTO `acos` VALUES (224,188,222,NULL);
INSERT INTO `acos` VALUES (225,188,223,NULL);
INSERT INTO `acos` VALUES (226,224,64,NULL);
INSERT INTO `acos` VALUES (227,225,226,NULL);
INSERT INTO `acos` VALUES (228,123,228,NULL);
INSERT INTO `acos` VALUES (229,122,228,NULL);
INSERT INTO `acos` VALUES (230,229,92,NULL);
INSERT INTO `acos` VALUES (231,229,136,NULL);
INSERT INTO `acos` VALUES (232,229,230,NULL);
INSERT INTO `acos` VALUES (233,229,231,NULL);
INSERT INTO `acos` VALUES (234,229,232,NULL);
INSERT INTO `acos` VALUES (235,229,233,NULL);
INSERT INTO `acos` VALUES (236,234,236,NULL);
INSERT INTO `acos` VALUES (237,234,237,NULL);
INSERT INTO `acos` VALUES (238,124,203,NULL);
INSERT INTO `acos` VALUES (239,124,40,NULL);
INSERT INTO `acos` VALUES (240,239,183,NULL);
INSERT INTO `acos` VALUES (241,239,240,NULL);
INSERT INTO `acos` VALUES (242,240,241,NULL);
INSERT INTO `acos` VALUES (243,242,7,NULL);
INSERT INTO `acos` VALUES (244,242,243,NULL);
INSERT INTO `acos` VALUES (245,242,64,NULL);
INSERT INTO `acos` VALUES (246,242,26,NULL);
INSERT INTO `acos` VALUES (247,242,244,NULL);
INSERT INTO `acos` VALUES (248,242,245,NULL);
INSERT INTO `acos` VALUES (249,246,247,NULL);
INSERT INTO `acos` VALUES (250,246,248,NULL);
INSERT INTO `acos` VALUES (251,205,210,NULL);
INSERT INTO `acos` VALUES (252,205,250,NULL);
INSERT INTO `acos` VALUES (253,205,48,NULL);
INSERT INTO `acos` VALUES (254,203,251,NULL);
INSERT INTO `acos` VALUES (255,203,210,NULL);
INSERT INTO `acos` VALUES (256,203,92,NULL);
INSERT INTO `acos` VALUES (257,252,105,NULL);
INSERT INTO `acos` VALUES (258,252,94,NULL);
INSERT INTO `acos` VALUES (259,252,229,NULL);
INSERT INTO `acos` VALUES (260,252,253,NULL);
INSERT INTO `acos` VALUES (261,253,229,NULL);
INSERT INTO `acos` VALUES (262,253,136,NULL);
INSERT INTO `acos` VALUES (263,253,92,NULL);
INSERT INTO `acos` VALUES (264,254,255,NULL);
INSERT INTO `acos` VALUES (265,245,256,NULL);
INSERT INTO `acos` VALUES (266,245,257,NULL);
INSERT INTO `acos` VALUES (267,258,14,NULL);
INSERT INTO `acos` VALUES (268,259,260,NULL);
INSERT INTO `acos` VALUES (269,259,261,NULL);
INSERT INTO `acos` VALUES (270,259,262,NULL);
INSERT INTO `acos` VALUES (271,259,263,NULL);
INSERT INTO `acos` VALUES (272,259,264,NULL);
INSERT INTO `acos` VALUES (273,46,265,NULL);
INSERT INTO `acos` VALUES (274,265,266,NULL);
INSERT INTO `acos` VALUES (275,46,173,NULL);
INSERT INTO `acos` VALUES (276,267,268,NULL);
INSERT INTO `acos` VALUES (277,269,129,NULL);
INSERT INTO `acos` VALUES (278,269,97,NULL);
INSERT INTO `acos` VALUES (279,269,106,NULL);
INSERT INTO `acos` VALUES (280,269,73,NULL);
INSERT INTO `acos` VALUES (281,72,269,NULL);
INSERT INTO `acos` VALUES (282,270,7,NULL);
INSERT INTO `acos` VALUES (283,270,173,NULL);
INSERT INTO `acos` VALUES (284,270,271,NULL);
INSERT INTO `acos` VALUES (285,270,272,NULL);
INSERT INTO `acos` VALUES (286,173,273,NULL);
INSERT INTO `acos` VALUES (287,274,188,NULL);
INSERT INTO `acos` VALUES (288,274,275,NULL);
INSERT INTO `acos` VALUES (289,277,203,NULL);
INSERT INTO `acos` VALUES (290,278,279,NULL);
INSERT INTO `acos` VALUES (291,282,281,NULL);
INSERT INTO `acos` VALUES (292,283,284,NULL);
INSERT INTO `acos` VALUES (293,285,286,NULL);
INSERT INTO `acos` VALUES (294,287,288,NULL);
INSERT INTO `acos` VALUES (295,287,289,NULL);
INSERT INTO `acos` VALUES (296,289,288,NULL);
INSERT INTO `acos` VALUES (297,290,40,NULL);
INSERT INTO `acos` VALUES (298,291,280,NULL);
INSERT INTO `acos` VALUES (299,292,288,NULL);
INSERT INTO `acos` VALUES (300,292,287,NULL);
INSERT INTO `acos` VALUES (301,292,289,NULL);
INSERT INTO `acos` VALUES (302,293,294,NULL);
INSERT INTO `acos` VALUES (303,293,295,NULL);
INSERT INTO `acos` VALUES (304,296,286,NULL);
INSERT INTO `acos` VALUES (305,298,284,NULL);
INSERT INTO `acos` VALUES (306,298,286,NULL);
INSERT INTO `acos` VALUES (307,298,280,NULL);
INSERT INTO `acos` VALUES (308,299,45,NULL);
INSERT INTO `acos` VALUES (309,295,300,NULL);
INSERT INTO `acos` VALUES (310,301,302,NULL);
INSERT INTO `acos` VALUES (311,304,197,NULL);
INSERT INTO `acos` VALUES (312,306,307,NULL);
INSERT INTO `acos` VALUES (313,309,245,NULL);
INSERT INTO `acos` VALUES (314,309,196,NULL);
INSERT INTO `acos` VALUES (315,309,310,NULL);
INSERT INTO `acos` VALUES (316,309,242,NULL);
INSERT INTO `acos` VALUES (317,309,311,NULL);
INSERT INTO `acos` VALUES (318,310,311,NULL);
INSERT INTO `acos` VALUES (319,310,312,NULL);
INSERT INTO `acos` VALUES (320,312,313,NULL);
INSERT INTO `acos` VALUES (321,314,315,NULL);
INSERT INTO `acos` VALUES (322,317,6,NULL);
INSERT INTO `acos` VALUES (323,318,243,NULL);
INSERT INTO `acos` VALUES (324,318,242,NULL);
INSERT INTO `acos` VALUES (325,319,320,NULL);
INSERT INTO `acos` VALUES (326,320,321,NULL);
INSERT INTO `acos` VALUES (327,320,46,NULL);
INSERT INTO `acos` VALUES (328,320,242,NULL);
INSERT INTO `acos` VALUES (329,320,119,NULL);
INSERT INTO `acos` VALUES (330,322,166,NULL);
INSERT INTO `acos` VALUES (331,323,242,NULL);
INSERT INTO `acos` VALUES (332,323,318,NULL);
INSERT INTO `acos` VALUES (333,323,309,NULL);
INSERT INTO `acos` VALUES (334,324,325,NULL);
INSERT INTO `acos` VALUES (335,255,326,NULL);
INSERT INTO `acos` VALUES (336,326,46,NULL);
INSERT INTO `acos` VALUES (337,327,70,NULL);
INSERT INTO `acos` VALUES (338,327,197,NULL);
INSERT INTO `acos` VALUES (339,327,196,NULL);
INSERT INTO `acos` VALUES (340,327,7,NULL);
INSERT INTO `acos` VALUES (341,327,328,NULL);
INSERT INTO `acos` VALUES (342,327,329,NULL);
INSERT INTO `acos` VALUES (343,327,330,NULL);
INSERT INTO `acos` VALUES (344,331,197,NULL);
INSERT INTO `acos` VALUES (345,331,196,NULL);
INSERT INTO `acos` VALUES (346,331,6,NULL);
INSERT INTO `acos` VALUES (347,331,332,NULL);
INSERT INTO `acos` VALUES (348,332,161,NULL);
INSERT INTO `acos` VALUES (349,334,7,NULL);
INSERT INTO `acos` VALUES (350,334,242,NULL);
INSERT INTO `acos` VALUES (351,334,37,NULL);
INSERT INTO `acos` VALUES (352,105,335,NULL);
INSERT INTO `acos` VALUES (353,318,309,NULL);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL DEFAULT '',
  `category_id` int(11) unsigned NOT NULL,
  `description` varchar(1250) DEFAULT '',
  `user_id` int(11) unsigned NOT NULL,
  `date_1` datetime DEFAULT NULL,
  `date_2` datetime DEFAULT NULL,
  `location_id` int(11) unsigned DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `source_name` varchar(100) DEFAULT NULL,
  `source_url` varchar(300) DEFAULT NULL,
  `slug` varchar(200) NOT NULL,
  `homepage_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `category_id` (`category_id`),
  KEY `user_id` (`user_id`),
  KEY `location_id` (`location_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (1,'Stefano',1,'Stefano is a senior at Northeastern University.',1,'1989-12-13 00:00:00',NULL,NULL,1,'2012-03-26 23:01:18','2012-04-10 15:21:44',NULL,NULL,'stefano','');
INSERT INTO `acos` VALUES (2,'Terrence Masson',1,'I am full time academic faculty and Executive Professor of Creative Industries at Northeastern University in Boston. Previously I have also enjoyed two decades of fun in a wide variety of areas ... Iâ€™ve directed award winning short animated films, was the sole developer of the original South Park CG animation technique, built a pre-vis department for Douglas Trumbull, fed Boba Fett to the Sarlac and flew the Millennium Falcon for George Lucas ... among many other things.\r\n\r\nAs a member of the Producers Guild of America, \r\nVisual Effects Society and an ACM SIGGRAPH Pioneer I enjoy a worldwide collection of great friends.',2,'1966-09-20 00:00:00',NULL,NULL,1,'2012-03-27 14:35:26','2012-09-06 13:54:40',NULL,NULL,'terrence-masson','');
INSERT INTO `acos` VALUES (3,'Star Wars: Episode V - The Empire Strikes Back',2,'',2,NULL,NULL,NULL,1,'2012-03-27 15:21:59','2012-04-10 14:25:28',NULL,NULL,'star-wars-episode-v-the-empire-strikes-back','');
INSERT INTO `acos` VALUES (4,'Star Wars: Episode VI - Return of the Jedi ',2,'Star Wars Episode VI: Return of the Jedi (also known as Return of the Jedi) is a 1983 American epic space opera film directed by Richard Marquand and written by George Lucas and Lawrence Kasdan, with Lucas as executive producer. It is the third film in the Star Wars franchise and the first film to use THX technology. The film is set approximately one year after The Empire Strikes Back.[2] The evil Galactic Empire, with the help of the villainous Darth Vader, is building a second Death Star in order to crush the Rebel Alliance. Since Emperor Palpatine plans to personally oversee the final stages of its construction, the Rebel Fleet launches a full-scale attack on the Death Star in order to prevent its completion and kill Palpatine, effectively bringing an end to the Empire. Meanwhile, Luke Skywalker, a Rebel leader and Jedi Knight, struggles to bring Vader, who is his father and himself a fallen Jedi, back from the Dark Side of the Force.',2,'1983-05-25 00:00:00',NULL,NULL,1,'2012-03-27 15:23:14','2012-04-23 16:31:46',NULL,NULL,'star-wars-episode-vi-return-of-the-jedi','');
INSERT INTO `acos` VALUES (5,'Toy Story',2,'Toy Story is a 1995 American computer-animated comedy film released by Walt Disney Pictures. It is Pixar\'s first feature film as well as the first ever feature film to be made entirely with CGI. The film was directed by John Lasseter and featured the voices of Tom Hanks and Tim Allen. ',5,'1995-11-19 00:00:00',NULL,NULL,1,'2012-03-28 22:34:56','2012-03-28 22:37:21','Wikipedia','http://en.wikipedia.org/wiki/Toy_Story','toy-story',NULL);
INSERT INTO `acos` VALUES (6,'Pixar Animation Studios',3,'Pixar was formed in 1986 when Steven Jobs (of Apple and NeXT computer fame) purchased the Lucasfilm Computer Graphics Division from George Lucas. George had decided about a year before that he did not want to continue a hardware development effort in-house. He also did not at that time want to pursue computer-generated animation (as did the employees). He therefore agreed to allow Edwin Catmull, Alvy Ray Smith, and the rest of the employees of the Lucasfilm Computer Division to seek out investors so they could spin off into their own company. Many different options were explored over the course of that year. In the end, the negotiations went down to the very last minute with the outcome not always certain. The deal that was finally made called for $5 million dollars to purchase the division with an additional $5 million for immediate capital investment.\r\nFounding members included (in alphabetical order): Tony Apodaca, Loren Carpenter, Ed Catmull, Rob Cook, David DeFrancesco, Tom Duff, Craig Good, Ralph Guggenheim, Pat Hanrahan, Sam Lefler, Darwyn Peachey, Tom Porter, Eben Ostby, Bill Reeves, Alvy Ray Smith, and Rodney Stock.\r\n',5,'1986-01-01 00:00:00',NULL,NULL,1,'2012-03-28 22:38:32','2012-10-24 12:36:46',NULL,NULL,'pixar-animation-studios','');
INSERT INTO `acos` VALUES (7,'Edwin Catmull',1,'Edwin Earl Catmull, Ph.D. (born 1945) is a computer scientist and current president of Walt Disney Animation Studios and Pixar Animation Studios. As a computer scientist, Catmull has contributed to many important developments in computer graphics.',5,'1945-03-31 00:00:00',NULL,NULL,1,'2012-03-28 22:41:10','2012-03-29 08:05:16','Wikipedia','en.wikipedia.org/wiki/Edwin_Catmull','edwin-catmull',NULL);
INSERT INTO `acos` VALUES (8,'Walt Disney Animation Studios',3,'Walt Disney Animation Studios is an American animation studio headquartered in Burbank, California. The studio, founded in 1923 as the Disney Brothers Cartoon Studio by brothers Walt and Roy Disney, is the oldest subsidiary of The Walt Disney Company. It is responsible for creating the company\'s well-known animated feature films and short subjects.\r\n\r\nFrom 1926 to 1929 the studio was known as The Walt Disney Studio. In 1929 the company restructured and diversified under the name Walt Disney Productions, Ltd. The animation studio was then an integrated part of Walt Disney Productions which also included other divisions such as the live action film studio. In 1986 the company again restructured, creating The Walt Disney Company as a separate parent company, and making the animation studio an official subsidiary, called at the time Walt Disney Feature Animation. The division took on its current name in 2007.',5,'1929-01-01 00:00:00',NULL,NULL,1,'2012-03-28 22:45:54','2012-03-28 22:48:28',NULL,NULL,'walt-disney-animation-studios',NULL);
INSERT INTO `acos` VALUES (9,'Alexander Schure',1,'Alexander Schure (August 3, 1920 - October 29, 2009)[1] was an American academic. Schure founded the New York Institute of Technology (NYIT) in 1955. He also served as the Chancellor of Nova Southeastern University (NSU) from 1970 until 1985.[2]\r\n\r\nSchure is credited with saving Nova University, which was in deep financial trouble, after he became the school\'s chancellor in 1970.[2] The university is now called Nova Southeastern University, and is now the largest private university in Florida, with more than 28,000 students as of 2009.[2]',5,'1920-08-03 00:00:00','2009-10-29 00:00:00',NULL,1,'2012-03-29 08:05:08','2012-03-29 08:06:29','Wikipedia','http://en.wikipedia.org/wiki/Alexander_Schure','alexander-schure',NULL);
INSERT INTO `acos` VALUES (10,'New York Institute of Technology',3,'New York Institute of Technology (also known as NYIT) is a private, non-sectarian, co-educational research university in New York City. NYIT has five schools and two colleges, all with a strong emphasis on technology and applied scientific research. The university has two New York campuses, one in Old Westbury Long Island and one near Columbus Circle in Manhattan, as well as several global campuses and programs (e.g. Bahrain, Canada, China, Jordan, United Arab Emirates). NYIT offers a total of 90 undergraduate degree, graduate degree programs, and medical degree programs to 15,000 students in academic areas such as architecture and design; arts and sciences; education; engineering and computing sciences; health professions; management; and osteopathic medicine.',5,'1955-01-01 00:00:00',NULL,NULL,1,'2012-03-29 08:07:29','2012-03-29 08:08:39','Wikipedia','http://en.wikipedia.org/wiki/New_York_Institute_of_Technology','new-york-institute-of-technology',NULL);
INSERT INTO `acos` VALUES (11,'Monsters, Inc.',2,'Monsters generate their city\'s power by scaring children, but they are terribly afraid themselves of being contaminated by children, so when one enters Monstropolis, top scarer Sulley finds his world disrupted.',5,'2001-11-02 00:00:00',NULL,NULL,1,'2012-03-29 09:56:58','2012-04-17 14:14:14','IMDB','http://www.imdb.com/title/tt0198781/','monsters-inc','');
INSERT INTO `acos` VALUES (12,'Michelle',1,'Michelle is a graphic designer who proudly hails from the small farm town of Boxborough, Massachusetts. Apart from design, she likes photography, traveling, and reading Boston Metro horoscopes. She has worked in the fast-paced NYC fashion industry, in a hands-on local sign shop, and with a small group at a cozy design firm in Boston. Post-graduation, she plans to scrape up new experiences doing freelance projects while moving around the US. To contact her, please visit www.michellegayowski.com.',4,'1989-07-01 00:00:00',NULL,NULL,1,'2012-03-29 14:18:24','2012-04-17 14:23:18','capstone class 2012','www.historyofcg.com','michelle','www.michellegayowski.com');
INSERT INTO `acos` VALUES (13,'FOOBAR',2,'',2,NULL,NULL,NULL,0,'2012-04-03 14:08:04','2012-04-03 14:08:04',NULL,NULL,'foobar',NULL);
INSERT INTO `acos` VALUES (14,'SIGGRAPH 2010',4,'37th annual conference on computer graphics and interactive techniques, held in Los Angeles, CA.',2,'2010-07-25 00:00:00','2010-07-29 00:00:00',NULL,1,'2012-04-03 14:25:22','2012-10-27 16:59:54',NULL,NULL,'siggraph-2010','http://www.siggraph.org/s2010/');
INSERT INTO `acos` VALUES (19,'George Lucas',1,'George Walton Lucas, Jr. (born May 14, 1944) is an American film producer, screenwriter, director, and entrepreneur. He is the founder, chairman and chief executive of Lucasfilm.[3] He is best known as the creator of the space opera franchise Star Wars and the archaeologist-adventurer character Indiana Jones. Lucas is one of the American film industry\'s most financially successful directors/producers, with an estimated net worth of $3.2 billion as of 2011.',6,NULL,NULL,NULL,1,'2012-04-03 14:39:08','2012-04-03 14:39:08','Wikipedia','http://en.wikipedia.org/wiki/George_Lucas','george-lucas',NULL);
INSERT INTO `acos` VALUES (21,'Lucasfilm Limited',3,'Lucasfilm Limited is an American film production company founded by George Lucas in 1971, based in San Francisco, California. Lucas is the company\'s current chairman and CEO, and Micheline Chau is the president and COO.\r\nThe company is best known for producing the Star Wars films, and has also produced other box office hits, including the Indiana Jones franchise and American Graffiti. It has also been a leader in developing new film technology in special effects, sound, and computer animation, and because of their expertise its subsidiaries often help produce non-Lucasfilm pictures. Lucasfilm is set to move away from films and more into TV, due to rising budgets.[2]\r\nOn July 8, 2005, Lucasfilm\'s marketing, online, and licensing units moved into the new Letterman Digital Arts Center located in the Presidio in San Francisco. It shares the complex with Industrial Light & Magic and LucasArts. They are also best known for The Deep Note and THX.\r\nLucasfilm has collaborated with the Walt Disney Company and Walt Disney Imagineering numerous times to create rides and attractions centered on Star Wars and Indiana Jones for various Walt Disney Parks and Resort attractions worldwide.',6,NULL,NULL,NULL,1,'2012-04-03 14:40:01','2012-04-03 14:40:01','Wikipedia','http://en.wikipedia.org/wiki/Lucasfilm','lucasfilm-limited',NULL);
INSERT INTO `acos` VALUES (22,'Industrial Light & Magic',3,'Industrial Light & Magic (ILM) is an Academy Award-winning motion picture visual effects company that was founded in May 1975 by George Lucas and is owned by Lucasfilm. Lucas created the company when he discovered that the special effects department at 20th Century Fox was shut down after he was given the green light for his production of the film Star Wars. The studio originated in Van Nuys, California, later moved to San Rafael, and is now based at the Letterman Digital Arts Center in the Presidio of San Francisco. Lynwen Brennan who joined the company in 1999, currently serves as the ILM\'s President and General Manager.',6,NULL,NULL,NULL,1,'2012-04-03 14:47:16','2012-04-03 14:47:16','Wikipedia','http://en.wikipedia.org/wiki/Industrial_Light_%26_Magic','industrial-light-magic',NULL);
INSERT INTO `acos` VALUES (23,'The Trumbull Company',3,'',2,NULL,NULL,NULL,0,'2012-04-09 11:16:35','2012-04-09 11:16:35',NULL,NULL,'the-trumbull-company',NULL);
INSERT INTO `acos` VALUES (24,'Digital Fauxtography',3,'Terrence Masson\'s independent consulting company. ',2,'1993-01-01 00:00:00',NULL,NULL,1,'2012-04-10 14:24:42','2012-04-10 14:36:36',NULL,NULL,'digital-fauxtography','http://visualfx.com');
INSERT INTO `acos` VALUES (25,'New York Institute of Technology Computer Graphics Lab',3,'In 1974 Dr. Alexander Schure, a wealthy entrepreneur, began to assemble the Computer Graphics Laboratory (CGL) at the New York Institute of Technology. His vision was to create a feature length animated film, with the aid of the days most sophisticated computer graphics techniques. NYIT itself was founded by Dr. Schure, had grounds encompassing numerous estates situated in the beautiful wooded hillsides of Old Westbury New York. Some of these estates were owned by members of the Rockafeller family, who also happened to have a seat on the board of Evans & Sutherland. Because of the close association of E&S with the University of Utah, Dave Evans recommended to Alex to seek out Edwin Catmull to head the new CGL. Ed Catmull had just finished his Ph.D. at Utah and taken a job at a CAD/CAM company called Applicon. It was not a hard sell to get Ed to leave Applicon for NYIT however, so he and fellow Utah graduate Malcolm Blanchard packed their bags for New York. Alvy Ray Smith and David DiFrancesco (both fresh from Xerox PARC) joined the team a few months later in what was called the 3Gerry Mansion2. Alvy and David had heard of Dr. Schure9s plans from Martin Newell at Utah (whom Alex had just hired briefly as a consultant). Dr. Schure h',2,'1974-01-01 00:00:00','1986-01-01 00:00:00',NULL,1,'2012-04-10 15:01:58','2012-04-10 15:02:07','CG 101','www.cg101.com','new-york-institute-of-technology-computer-graphics-lab','');
INSERT INTO `acos` VALUES (26,'Lance Williams',1,'',2,NULL,NULL,NULL,0,'2012-04-10 15:10:29','2012-04-10 15:10:29',NULL,NULL,'lance-williams',NULL);
INSERT INTO `acos` VALUES (27,'Northeastern University',3,'www.historyofcg.com was developed at NU in the College of Arts, Media & Design\'s Creative Industries - Interactive Media Program.',2,'1898-01-01 00:00:00',NULL,NULL,1,'2012-04-13 09:06:52','2012-10-27 17:49:36',NULL,NULL,'northeastern-university','http://www.northeastern.edu/ci/');
INSERT INTO `acos` VALUES (28,'Star Wars: Episode VI - Return of the Jedi ',2,'',5,NULL,NULL,NULL,0,'2012-04-13 13:49:54','2012-04-13 13:49:54','','','star-wars-episode-vi-return-of-the-jedi-','');
INSERT INTO `acos` VALUES (29,'Homer 3D',2,'A large portion of \"Homer3D\" was three dimensional and computer animated. Supervising director David Silverman was aiming for something better than the computer animation used in the music video for \"Money for Nothing\" by Dire Straits.\r\nThe animation was provided by Pacific Data Images (PDI). The animators at PDI worked closely with the normal animators on The Simpsons and worked hard not to \"reinvent the character[s]\". The Simpsons animators storyboarded the segments and showed the PDI animators how they would have handled the scenes. \r\nWhile designing the 3D model of Bart, the animators did not know how they would show Bart\'s hair. However, they realized that there were vinyl Bart dolls in production and purchased one to use as a model. One of the most difficult parts for the PDI animators was to make Homer and Bart move properly without making them look robotic.\r\nOne of the key shots in the segment was where Homer steps into the 3D world and his design transitions into 3D. Bill Oakley considers the shot the \"money shot\" and had a difficult time communicating his idea to the animators.',5,'1995-10-29 00:00:00',NULL,NULL,1,'2012-04-13 14:40:18','2012-10-24 12:29:57','Wikipedia','http://en.wikipedia.org/wiki/Treehouse_of_Horror_VI','homer','');
INSERT INTO `acos` VALUES (30,'Pacific Data Images ( PDI )',3,'Incorporated in August 1980 by Carl Rosendahl, PDI originally began in a small office in Los Altos. Carl grew up in LA and graduated with a degree in Electrical Engineering from Stanford in 1979. Wanting to combine entertainment with his technical experience, computer graphics seemed a natural solution. Times being what they were (so early in the CG evolution), Carl formed his own company rather than seek employment at one of a very few established companies.\r\nRichard Chuang and Glenn Entiss made it a company of three in 1982. Later, after moving to a Sunnyvale industrial complex until 1984, PDI moved into another larger building owned by Carl\'s father. They remained there until moving to their present location in Palo Alto in 1997. PDI has grown from employing fewer than 20 people in about 1984 to employing more than 300 today.\r\n',5,'1980-08-01 00:00:00',NULL,NULL,1,'2012-04-13 14:46:08','2012-10-24 12:28:21',NULL,NULL,'pacific-data-images-','');
INSERT INTO `acos` VALUES (31,'Michelle',1,'fjnsndjshfjksdhjewjfe',4,'1989-07-01 00:00:00',NULL,NULL,0,'2012-04-13 14:51:07','2012-04-13 14:51:07','','','michelle','');
INSERT INTO `acos` VALUES (32,'Ultima Underworld: The Stygian Abyss',2,'Ultima Underworld: The Stygian Abyss is a first-person role-playing video game (RPG) developed by Blue Sky Productions (later Looking Glass Studios) and published by Origin Systems. Released in March 1992, the game is set in the fantasy world of the Ultima series, and takes place inside the Great Stygian Abyss: a large, underground cave system that contains the remnants of a failed utopian civilization. The player assumes the role of the Avatarâ€”the Ultima series\' protagonistâ€”and attempts to find and rescue a baron\'s kidnapped daughter.\r\nUltima Underworld has been cited as the first first-person perspective role-playing game with three-dimensional (3D) graphics, and it introduced many technological innovations, such as allowing the player to look up and down. Its design combines simulation elements with concepts from earlier CRPGs, including Wizardry and Dungeon Master; this led the game\'s designers to label it as a \"dungeon simulation\". As such, the game is non-linear and allows for emergent gameplay.',6,NULL,NULL,NULL,1,'2012-04-13 14:56:19','2012-04-13 14:56:19','Wikipedia','http://en.wikipedia.org/wiki/Ultima_Underworld:_The_Stygian_Abyss','ultima-underworld-the-stygian-abyss','');
INSERT INTO `acos` VALUES (33,'People Behind The Pixels',2,'Fall 2011 / Spring 2012',2,'2012-04-17 00:00:00',NULL,NULL,1,'2012-04-17 14:07:42','2012-04-17 14:08:13',NULL,NULL,'people-behind-the-pixels','historyofcg.com');
INSERT INTO `acos` VALUES (34,'Connie',1,'Connie is a designer, front-end developer, and a senior finishing up her time at Northeastern University. Currently working as the design lead in a growing Boston startup, she\'s also been part of the teams at The Boston Globe, Bionic Hippo, and various other ventures. Her portfolio can be found at www.connie.cc!',3,'1989-01-25 00:00:00',NULL,NULL,1,'2012-04-17 14:12:58','2012-04-17 14:31:41','People Behind the Pixel','http://historyofcg.com/about','connie','www.connie.cc');
INSERT INTO `acos` VALUES (35,'The Incredibles',2,'The Incredibles is a 2004 American computer-animated action comedy superhero film about a family of superheroes who are forced to hide their powers. It was written and directed by Brad Bird, a former director and executive consultant of The Simpsons, and was produced by Pixar and distributed by Walt Disney Pictures. The starring voices are Craig T. Nelson as Bob Parr, Holly Hunter as his wife Helen Parr; Sarah Vowell as their teenage daughter Violet; Spencer Fox as their young son Dash; Jason Lee as the supervillain Syndrome; Samuel L. Jackson as Frozone; and Elizabeth PeÃ±a as Syndrome\'s beautiful assistant, Mirage. Bob\'s yearning to help people draws the entire Parr family into a battle with the villain and his killer robot.\r\nThe film won the 2004 Annie Award for Best Animated Feature, along with two 2004 Academy Awards, Best Animated Feature and Best Sound Editing. It also received nominations for two other Academy Awards, won the Saturn Award for Best Animated Film, and became the first entirely animated film to win the prestigious Hugo Award for Best Dramatic Presentation. It was also nominated for Best Motion Picture â€“ Musical or Comedy at the 2004 Golden Globes.',6,'2004-01-01 00:00:00',NULL,NULL,1,'2012-04-17 14:20:42','2012-04-17 14:22:21','Wikipedia','http://en.wikipedia.org/wiki/Incredibles','the-incredibles','');
INSERT INTO `acos` VALUES (36,'James',1,'',4,NULL,NULL,NULL,1,'2012-04-17 14:29:29','2012-04-17 14:30:57',NULL,NULL,'james','');
INSERT INTO `acos` VALUES (37,'',4,'',2,'2012-04-17 00:00:00',NULL,NULL,0,'2012-04-17 14:30:33','2012-04-17 14:30:33','','','','oiuahefuhadf.com');
INSERT INTO `acos` VALUES (38,'Interactive Media Capstone 2012',2,'',5,NULL,NULL,NULL,0,'2012-04-24 10:50:31','2012-04-24 10:50:31',NULL,NULL,'interactive-media-capstone-2012',NULL);
INSERT INTO `acos` VALUES (39,'ACM',3,'Worlds oldest computing society',2,'1947-01-01 00:00:00',NULL,NULL,0,'2012-05-16 18:57:10','2012-05-16 18:57:10','','','acm','');
INSERT INTO `acos` VALUES (40,'Alias Research Inc.',3,'Alias Research Inc., of Toronto, Canada was founded in 1983 by Stephen Bingham, Susan McKenna, David Springer, and Nigel McGrath with the goal of creating software for computer animation for film and video production. Stephen was a television producer, a director for the National Film Theatre of Canada, and an advisor to the government on the use of computer graphics for the visual display of quantitative data. Susan worked as an independent producer in the industrial video and film area and had some experience in fund raising in the industry. Nigel ran a local business, McGrath & Associates that specialized in computer graphic slide production.  David was head of the CG lab at Sheridan College and would lead the software development.  The founders obtained a grant of $61K from National Research Council (NRC), borrowed equipment from McGrath & Associates, and Secured SRTC (Scientific Research Tax Credits) for some funded research work on anti-aliasing that would be needed for their own product, ALIAS/1.\r\n\r\nThe four principals were soon joined by employeeâ€™s five and six: Will Anielewicz (recently ex of Omnibus and currently at ILM) and Mike Sweeney on software development. It was Will and Mike who, unbeknownst to management, made',2,'1983-01-01 00:00:00',NULL,NULL,1,'2012-08-10 11:50:42','2012-08-10 11:51:35','CG101: A Computer Graphics Industry Reference','www.cg101.com','alias-research-inc','');
INSERT INTO `acos` VALUES (41,'Will Anielewicz ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 11:54:30','2012-08-10 11:54:30',NULL,NULL,'will-anielewicz-',NULL);
INSERT INTO `acos` VALUES (42,'Andrew Pearce',1,'',2,NULL,NULL,NULL,0,'2012-08-10 11:58:53','2012-08-10 11:58:53',NULL,NULL,'andrew-pearce',NULL);
INSERT INTO `acos` VALUES (43,'Amiga',2,'The Amiga was a color computer introduced by Commodore Computer in 1985 after beginning development as the Amiga Lorraine. Models included the 500, 1000, 3000, and 4000. Original software including Sculpt-3D, and Deluxe Paint II. ',2,'1985-01-01 00:00:00',NULL,NULL,1,'2012-08-10 14:27:39','2012-08-10 14:33:51','CG101: A Computer Graphics Industry Reference','www.cg101.com','amiga','');
INSERT INTO `acos` VALUES (44,'John Andrew Berton Jr.',1,'',2,NULL,NULL,NULL,0,'2012-08-10 14:32:16','2012-08-10 14:32:16',NULL,NULL,'john-andrew-berton-jr',NULL);
INSERT INTO `acos` VALUES (45,'Apple Computer Inc.',3,'Founded by Steven Jobs and Steven Wozniak in 1976, incorporated on Jan. 3rd of 1977. Apple began with the introduction of the Apple I, followed by the Apple II later in 1977 and the Apple III in 1980. While definitely not a computer graphics company, Apple did bring many of the GUI interface, desktop publishing graphics concepts to the masses over the years. ',2,'1976-04-01 00:00:00',NULL,NULL,1,'2012-08-10 14:38:46','2012-08-10 14:38:59',NULL,NULL,'apple-computer-inc','');
INSERT INTO `acos` VALUES (46,'Xerox PARC ( Palo Alto Research Center )',3,'The Xerox Palo Alto Research Center (PARC) opened on July 1, 1970, in Palo Alto, California, just outside the Stanford University campus.\r\n\r\nAlthough computer graphics was never a goal of PARC per se, Bob Taylor himself was very familiar with this new area of computer science research. He had overseen the Information Processing Techniques Office of ARPA (the Defense Department\'s Advanced Research Project Agency), which funded many early university graduate programs such as Dave Evans\' graduate program at the University of Utah back in 1965.\r\nThe person who brought CG research to PARC under Taylor was Dr. Richard Shoup of Carnegie Mellon University. Shoup had been at the short-lived Berkeley Computer Company (BCC) from 1968 to 1970 and was given a full year upon starting at PARC to explore what it was he wanted to do. What he ended up doing was developing SuperPaint. Along with artist Alvy Ray Smith, Shoup experimented, designed, and built the first digital paint system with a non-random access, 8-bit framebuffer.\r\n',2,'1970-01-01 00:00:00',NULL,NULL,1,'2012-08-10 14:40:58','2012-10-27 18:18:21',NULL,NULL,'xerox-parc','www.parc.com');
INSERT INTO `acos` VALUES (47,'Atari',3,'Video game manufacturer founded in 1972 by Nolan Bushnell (B.S. University of Utah 1969) and sold to Warner Inc. in 1976. With the introduction of Pong (also created by Nolan Bushnell), a simple ball and paddle style video game, Atari led the video game revolution of the late 70s and early 80s before falling on hard times. ',2,'1972-01-01 00:00:00',NULL,NULL,1,'2012-08-10 14:51:11','2012-08-10 14:51:19',NULL,NULL,'atari','www.atari.com');
INSERT INTO `acos` VALUES (48,'Blue Sky Studios',3,'Blue Sky was founded in May of 1987 by six people. (in alphabetical order) Alison Brown(Administration), David Brown(President), Michael Ferraro(Systems Architect), Carl Ludwig(VP of R&D), Dr. Eugene Troubetskoy(Chief Scientist), and Chris Wedge(vice president of creative Development). \r\nOther early key employees included Jan CarlÃ©e (Animation Director) and Tom Bisogno. \r\n',2,'1987-02-01 00:00:00',NULL,NULL,1,'2012-08-10 14:56:52','2012-08-10 15:00:16',NULL,NULL,'blue-sky-studios','http://blueskystudios.com');
INSERT INTO `acos` VALUES (49,'Dr. Eugene Troubetskoy',1,'',2,NULL,NULL,NULL,0,'2012-08-10 14:57:26','2012-08-10 14:57:26',NULL,NULL,'dr-eugene-troubetskoy',NULL);
INSERT INTO `acos` VALUES (50,'Carl Ludwig',1,'',2,NULL,NULL,NULL,0,'2012-08-10 14:57:55','2012-08-10 14:57:55',NULL,NULL,'carl-ludwig',NULL);
INSERT INTO `acos` VALUES (51,'Chris Wedge',1,'',2,NULL,NULL,NULL,0,'2012-08-10 14:58:30','2012-08-10 14:58:30',NULL,NULL,'chris-wedge',NULL);
INSERT INTO `acos` VALUES (52,'Bo Gehring Associates ',3,'Louis (Bo) Gehring began work at Magi in 1972, starting the Synthavision division with Bob Goldstein. While there, Bo created several CG tests for Steven Spielberg\'s Close Encounters of the Third Kind, before the idea was dropped in favor of Doug Trumbullâ€™s traditional miniature and practical effects approach.\r\nInstead of returning to NY and Magi, Bo stayed in LA and originally formed his company as Gehring Aviation in 1977. Based on his experience with computer controlled machine tools, he sought to capitalize on the new need for computer driven motion control cameras for visual effects work.',2,'1977-01-01 00:00:00',NULL,NULL,1,'2012-08-10 15:04:24','2012-08-10 15:04:34','CG101: A Computer Graphics Industry Reference','www.cg101.com','bo-gehring-associates-','');
INSERT INTO `acos` VALUES (53,'Bo Gehring',1,'',2,NULL,NULL,NULL,0,'2012-08-10 15:06:22','2012-08-10 15:06:22',NULL,NULL,'bo-gehring',NULL);
INSERT INTO `acos` VALUES (54,'Buf Campagne',3,'Pierre Buffin and Henry Seydoux founded B.S.C.A (Buffin Seydoux Computer Animation) in 1982.  In 1988, they finished a 6 minute 3D animation about insects living in a computer, The first \"long animation\" in France. Other early employees were Patrick Albert, Olivier Gilbert ,Georges Lagardere, Francois Blanchet, Christian Zumbiehl and Matthieu Schonholzer.',2,'1982-01-01 00:00:00',NULL,NULL,1,'2012-08-10 15:18:50','2012-08-10 15:19:01',NULL,NULL,'buf-campagne','www.buf.fr');
INSERT INTO `acos` VALUES (55,'Cambridge Animation',3,'Andrew Berend set up Cambridge Animation with partner Peter Florence in 1987 [ ADDITIONAL INFORMATION NEEDED ]',2,'1987-01-01 00:00:00',NULL,NULL,1,'2012-08-10 15:27:05','2012-08-10 15:27:14',NULL,NULL,'cambridge-animation','');
INSERT INTO `acos` VALUES (56,'Computer Creations',3,'Tom Klimek headed the company, located in the unlikely location of Southbend Indiana (Jim Lindner was NY sales rep, Gail Resnik was an employee.) Jim Lindner and Suazanne Gavril, former marketing executives at Xerox, later broke with Computer Creations and formed Fantastic Animation Machine in Manhattan. ',2,'1982-01-01 00:00:00','1987-01-01 00:00:00',NULL,1,'2012-08-10 15:29:23','2012-08-10 15:31:12',NULL,NULL,'computer-creations','');
INSERT INTO `acos` VALUES (57,'Jim Lindner',1,'',2,NULL,NULL,NULL,0,'2012-08-10 15:37:53','2012-08-10 15:37:53',NULL,NULL,'jim-lindner',NULL);
INSERT INTO `acos` VALUES (58,'Computer Film Company ',3,'Founded in 1984 by Andrew Berend, Mike Boudry, and Nick Pollock. Andrew come from a motion-control background and had previously formed Computer FX Ltd. and worked for the Moving Picture Company. Mike was the hardware guy, and Nick was software. Neil Harris joined in 1986 as a software programmer also.\r\n	The intent at CFC from the very beginning was full frame digital manipulation and compositing of live action footage. This was a unique charter among startup CG facilities, that is not to be primarily concerned with vector or raster computer generated imagery.\r\n',2,'1984-01-01 00:00:00',NULL,NULL,1,'2012-08-10 15:41:00','2012-08-10 15:47:29','CG101: A Computer Graphics Industry Reference','www.cg101.com','computer-film-company-','www.framestore-cfc.com');
INSERT INTO `acos` VALUES (59,'Mike Boudry',1,'',2,NULL,NULL,NULL,0,'2012-08-10 15:42:40','2012-08-10 15:42:40',NULL,NULL,'mike-boudry',NULL);
INSERT INTO `acos` VALUES (60,'Andrew Berend',1,'',2,NULL,NULL,NULL,0,'2012-08-10 15:43:30','2012-08-10 15:43:30',NULL,NULL,'andrew-berend',NULL);
INSERT INTO `acos` VALUES (61,'Nick Pollock',1,'',2,NULL,NULL,NULL,0,'2012-08-10 15:43:50','2012-08-10 15:43:50',NULL,NULL,'nick-pollock',NULL);
INSERT INTO `acos` VALUES (62,'Framestore',3,'',2,NULL,NULL,NULL,0,'2012-08-10 15:47:18','2012-08-10 15:47:18',NULL,NULL,'framestore',NULL);
INSERT INTO `acos` VALUES (63,'STAR (Scene Tracking Auto Registration)',2,'STAR (Scene Tracking Auto Registration) automatic scene-tracking â€œElectronic Rotoscopingâ€ system. Conceived by Bo and written by non-other than Jim Clark of SGI fame,(with the front end written by Bo himself) the technique was based upon discussions Bo had with others while at Magi as early as 1974. ',2,'1983-01-01 00:00:00',NULL,NULL,1,'2012-08-10 15:51:15','2012-08-10 15:54:59',NULL,NULL,'star-scene-tracking-auto-registration','');
INSERT INTO `acos` VALUES (64,'James ( Jim ) Clark',1,'Jim Clark, founder of Silicon Graphics, went on to found Netscape Communications Corporation with Marc Andreessen, the Web\'s first, most popular graphical browser. Netscape was acquired by AOL in November 1998 for $4.1 billion (yes, that\'s billion with a \"b\")',2,'1944-03-23 00:00:00',NULL,NULL,1,'2012-08-10 15:58:00','2012-10-25 10:31:16',NULL,NULL,'jim-clark','http://en.wikipedia.org/wiki/James_H._Clark');
INSERT INTO `acos` VALUES (65,'Computer FX Ltd. ',3,'Computer FX Ltd. (later called CFX Ltd, and today called CFX Associates.) was formed by Andrew Berend, Ian Chisholm and Craig Zerouni in 1982. They began by purchasing the first IMI (Interactive Machines Inc) vector display device, a real-time, monochrome, vector device which competed with E&S products. (PDI may have bought the second IMI, or possibly the other way around) This was the first real-time animation system in Europe. ',2,'1982-01-01 00:00:00',NULL,NULL,1,'2012-08-10 16:03:21','2012-08-10 16:07:40',NULL,NULL,'computer-fx-ltd-','');
INSERT INTO `acos` VALUES (66,'Computer FX Ltd. ',3,'Computer FX Ltd. (later called CFX Ltd, and today called CFX Associates.) was formed by Andrew Berend, Ian Chisholm and Craig Zerouni in 1982. They began by purchasing the first IMI (Interactive Machines Inc) vector display device, a real-time, monochrome, vector device which competed with E&S products. (PDI may have bought the second IMI, or possibly the other way around) This was the first real-time animation system in Europe. ',2,'1982-01-01 00:00:00',NULL,NULL,0,'2012-08-10 16:03:23','2012-08-10 16:03:23','','','computer-fx-ltd-','');
INSERT INTO `acos` VALUES (67,'Craig Zerouni',1,'',2,NULL,NULL,NULL,0,'2012-08-10 16:05:14','2012-08-10 16:05:14',NULL,NULL,'craig-zerouni',NULL);
INSERT INTO `acos` VALUES (68,'Ian Chisholm',1,'',2,NULL,NULL,NULL,0,'2012-08-10 16:05:31','2012-08-10 16:05:31',NULL,NULL,'ian-chisholm',NULL);
INSERT INTO `acos` VALUES (69,'Computer Graphics Laboratory Inc. ',3,'The commercial production company set up by the NYIT Computer Graphics Lab. The reason it was created was because NYIT would have jeopardized its non-taxable status if its computer graphics lab (as distinguished from CGL Inc.) had engaged in major commercial projects. ',2,'1981-01-01 00:00:00','1992-01-01 00:00:00',NULL,1,'2012-08-10 16:52:18','2012-08-10 16:54:12',NULL,NULL,'computer-graphics-laboratory-inc-','');
INSERT INTO `acos` VALUES (70,'Pat Hanrahan ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 16:52:59','2012-08-10 16:52:59',NULL,NULL,'pat-hanrahan-',NULL);
INSERT INTO `acos` VALUES (71,'Ken Wesley',1,'',2,NULL,NULL,NULL,0,'2012-08-10 16:53:54','2012-08-10 16:53:54',NULL,NULL,'ken-wesley',NULL);
INSERT INTO `acos` VALUES (72,'Computer Image Corporation ',3,'Based in Denver, CIC was the brainchild of Lee Harrison , and was in the business of making \"analog computer graphics\" in the early 1970s. These unique machines included Animac, CAESAR and Scanimate. Lee received the first ever Emmy for \"Technical Achievement\" in 1973 for his work. Lee Harrison passed away in 1998.',2,'1970-01-01 00:00:00',NULL,NULL,1,'2012-08-10 16:57:12','2012-08-10 16:57:20',NULL,NULL,'computer-image-corporation-','');
INSERT INTO `acos` VALUES (73,'Lee Harrison ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 16:57:50','2012-08-10 16:57:50',NULL,NULL,'lee-harrison-',NULL);
INSERT INTO `acos` VALUES (74,'Kirk Paulson',1,'',2,NULL,NULL,NULL,0,'2012-08-10 16:59:46','2012-08-10 16:59:46',NULL,NULL,'kirk-paulson',NULL);
INSERT INTO `acos` VALUES (75,'Phil Zimmerman',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:00:01','2012-08-10 17:00:01',NULL,NULL,'phil-zimmerman',NULL);
INSERT INTO `acos` VALUES (76,'Jim Johnson',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:00:26','2012-08-10 17:00:26',NULL,NULL,'jim-johnson',NULL);
INSERT INTO `acos` VALUES (77,'Cranston/Csuri Productions ',3,'Cranston-Csuri was founded in August of 1981 by Charles Csuri or Ohio State and investor Robert Kanuth of The Cranston Companies. Jim Kristoff (also a past Treasurer of Ohio State) came with Kanuth and served as president, while Wayne Carlson of Ohio State was VP and head of R&D. Michael Collery was Director of Animation, Don Stredney developed the medical imaging market and Dr. Tom Linehan devloped the educational market. Along with Shawn Ho (rendering), Paul Sidlo (Creative Director) and Bob Marshal, the first employees numbered about ten total.',2,'1991-08-01 00:00:00',NULL,NULL,1,'2012-08-10 17:02:33','2012-08-10 17:10:44',NULL,NULL,'cranston-csuri-productions-','');
INSERT INTO `acos` VALUES (78,'Charles Csuri',1,'',2,NULL,NULL,NULL,1,'2012-08-10 17:03:35','2012-08-11 14:00:40',NULL,NULL,'charles-csuri','http://www.csurivision.com');
INSERT INTO `acos` VALUES (79,'Jim Kristoff ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:05:23','2012-08-10 17:05:23',NULL,NULL,'jim-kristoff-',NULL);
INSERT INTO `acos` VALUES (80,'Paul Sidlo ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:08:23','2012-08-10 17:08:23',NULL,NULL,'paul-sidlo-',NULL);
INSERT INTO `acos` VALUES (81,'RezN8',3,'Founded by Paul Sidlo and Evan Ricks. Paul Sidlo was Creative Director for Cranston/Csuri Productions from 1982 to 1987.\r\nreZn8 has won countless awards for broadcast design and animation including three Emmys. Its unique dedication to original creative content has earned the company a unique and respected reputation. ',2,'1987-01-01 00:00:00',NULL,NULL,1,'2012-08-10 17:12:16','2012-10-24 14:21:45',NULL,NULL,'rezn8','www.rezn8.com');
INSERT INTO `acos` VALUES (82,'Evan Ricks',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:13:44','2012-08-10 17:13:44',NULL,NULL,'evan-ricks',NULL);
INSERT INTO `acos` VALUES (83,'Michael Collery',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:15:27','2012-08-10 17:15:27',NULL,NULL,'michael-collery',NULL);
INSERT INTO `acos` VALUES (84,'Jeff Light ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:16:10','2012-08-10 17:16:10',NULL,NULL,'jeff-light-',NULL);
INSERT INTO `acos` VALUES (85,'Dobbie Schiff ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:17:03','2012-08-10 17:17:03',NULL,NULL,'dobbie-schiff-',NULL);
INSERT INTO `acos` VALUES (86,'Thomas Linehan',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:40:07','2012-08-10 17:40:07',NULL,NULL,'thomas-linehan',NULL);
INSERT INTO `acos` VALUES (87,'Julian Gomez ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:40:35','2012-08-10 17:40:35',NULL,NULL,'julian-gomez-',NULL);
INSERT INTO `acos` VALUES (88,'Wayne Carlson ',1,'Wayne Carlson has been on the faculty at OSU since 1988 and is an Associate Professor in the Department of Industrial Design with joint appointments in Art, Art Education, and Computer and Information Science. He also is currently the Director of the ACCAD. ',2,'1949-01-01 00:00:00',NULL,NULL,1,'2012-08-10 17:41:10','2012-10-24 11:11:41',NULL,NULL,'wayne-carlson-','http://design.osu.edu/carlson/WEC.html');
INSERT INTO `acos` VALUES (89,'Scott Dyer ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:41:45','2012-08-10 17:41:45',NULL,NULL,'scott-dyer-',NULL);
INSERT INTO `acos` VALUES (90,'deGraf/Wahrman Inc.',3,'Formed as a partnership in October of 1987 and incorporated in 1988 by Brad deGraf and Michael Wahrman. Additional funding assistance by Tom McMahon (Symbolics Graphics Division). ',2,'1987-10-01 00:00:00',NULL,NULL,1,'2012-08-10 17:43:48','2012-08-10 17:46:40',NULL,NULL,'degraf-wahrman-inc','');
INSERT INTO `acos` VALUES (91,'Brad deGraf',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:44:16','2012-08-10 17:44:16',NULL,NULL,'brad-degraf',NULL);
INSERT INTO `acos` VALUES (92,'Michael Wahrman ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:44:43','2012-08-10 17:44:43',NULL,NULL,'michael-wahrman-',NULL);
INSERT INTO `acos` VALUES (93,'DemoGraFX',3,'Research and technology company formed by Gary Demos after leaving the Whitney/Demos bankruptcy. Began with contract work for various projects, including setting up the original Triple-I Digital Film Printer (DFP) at Pacific Title in 91, connecting it via HPPI to an SGI network. ',2,'1988-01-01 00:00:00',NULL,NULL,1,'2012-08-10 17:54:11','2012-08-10 17:56:21',NULL,NULL,'demografx','');
INSERT INTO `acos` VALUES (94,'Gary Demos',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:54:43','2012-08-10 17:54:43',NULL,NULL,'gary-demos',NULL);
INSERT INTO `acos` VALUES (95,'Digital Effects',3,'Founded by Judson Rosebush and Jeff Kleiser (Kleiser was Animation Director and President), along with Don Leitch, David Cox, Moses Weitzman, Jann Printz and Bob Hoffman (who was later at Omnibus and RGA). Digital Effects was one of four companies to create CG for the film TRON. They producing the opening title sequence where pieces of TRON fly in over a bright light source to form his body, and also did all the scenes involving the flying cuboid character â€œBitâ€ who could say yes or no.',2,'1978-01-01 00:00:00','1986-01-01 00:00:00',NULL,1,'2012-08-10 17:58:17','2012-08-10 17:59:55',NULL,NULL,'digital-effects','');
INSERT INTO `acos` VALUES (96,'Judson Rosebush ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:58:39','2012-08-10 17:58:39',NULL,NULL,'judson-rosebush-',NULL);
INSERT INTO `acos` VALUES (97,'Jeff Kleiser ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 17:59:00','2012-08-10 17:59:00',NULL,NULL,'jeff-kleiser-',NULL);
INSERT INTO `acos` VALUES (98,'Digital Pictures',3,'Digital Pictures was co-founded by Chris Briscoe and Paul Brown in 1980 as the UK\'s first specialist computer animation company. Liam Scanlan was the first employee, and Peter Florence and Steve Lowe soon joined as co-directors.',2,'1980-01-01 00:00:00',NULL,NULL,1,'2012-08-10 18:01:48','2012-08-10 18:07:07',NULL,NULL,'digital-pictures','');
INSERT INTO `acos` VALUES (99,'Kim Aldis',1,'',2,NULL,NULL,NULL,0,'2012-08-10 18:03:49','2012-08-10 18:03:49',NULL,NULL,'kim-aldis',NULL);
INSERT INTO `acos` VALUES (100,'Paul Brown ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 18:05:37','2012-08-10 18:05:37',NULL,NULL,'paul-brown-',NULL);
INSERT INTO `acos` VALUES (101,'Liam Scanlan ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 18:05:55','2012-08-10 18:05:55',NULL,NULL,'liam-scanlan-',NULL);
INSERT INTO `acos` VALUES (102,'Steve Lowe ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 18:06:26','2012-08-10 18:06:26',NULL,NULL,'steve-lowe-',NULL);
INSERT INTO `acos` VALUES (103,'Peter Florence ',1,'',2,NULL,NULL,NULL,0,'2012-08-10 18:06:50','2012-08-10 18:06:50',NULL,NULL,'peter-florence-',NULL);
INSERT INTO `acos` VALUES (104,'Digital Productions',3,'Digital Productions was formed in 1981 by Gary Demos and John Whitney Jr., having just left Triple-I right before the Tron work began production there. Elsa Granville was employee number three and the Director of Human Resources, Brad deGraf (Head of Production) and Larry Yaeger (Director/VP of Software) were hired very soon thereafter. Producers included Sherry McKenna and Nancy St.John. Jim Rapley and Art Durinski joined DP after having worked on Tron at Triple-I. ',2,'1981-01-01 00:00:00',NULL,NULL,1,'2012-08-10 19:03:35','2012-08-10 19:03:44',NULL,NULL,'digital-productions','');
INSERT INTO `acos` VALUES (105,'John Whitney Jr.',1,'',2,NULL,NULL,NULL,1,'2012-08-10 19:04:34','2012-10-29 15:11:26',NULL,NULL,'john-whitney-jr','');
INSERT INTO `acos` VALUES (106,'David Sieg ',1,'',2,NULL,NULL,NULL,1,'2012-08-10 19:06:41','2012-10-28 12:05:11',NULL,NULL,'david-sieg-','http://www.davesieg.com/');
INSERT INTO `acos` VALUES (107,'The Last Starfighter',2,'',2,NULL,NULL,NULL,0,'2012-08-10 19:11:43','2012-08-10 19:11:43',NULL,NULL,'the-last-starfighter',NULL);
INSERT INTO `acos` VALUES (108,'Paul Isaacs',1,'',2,NULL,NULL,NULL,0,'2012-08-10 19:12:53','2012-08-10 19:12:53',NULL,NULL,'paul-isaacs',NULL);
INSERT INTO `acos` VALUES (109,'Kevin Rafferty',1,'',2,NULL,NULL,NULL,0,'2012-08-10 19:17:25','2012-08-10 19:17:25',NULL,NULL,'kevin-rafferty',NULL);
INSERT INTO `acos` VALUES (110,'Dune',2,'',2,NULL,NULL,NULL,0,'2012-08-10 19:18:37','2012-08-10 19:18:37',NULL,NULL,'dune',NULL);
INSERT INTO `acos` VALUES (111,'Labyrinth',2,'',2,NULL,NULL,NULL,0,'2012-08-10 19:19:05','2012-08-10 19:19:05',NULL,NULL,'labyrinth',NULL);
INSERT INTO `acos` VALUES (112,'Emily Nagle Green',1,'',2,NULL,NULL,NULL,0,'2012-08-10 19:19:49','2012-08-10 19:19:49',NULL,NULL,'emily-nagle-green',NULL);
INSERT INTO `acos` VALUES (113,'CG101: A Computer Graphics Industry Reference',2,'CG101 is the only comprehensive resource guide written in plain language for all levels of computer graphics users. It is also the first and only detailed behind-the-scenes history about the people and companies that have formed today\'s industry. Hundreds of contributors and in-depth interviews give a never-before-seen look into the earliest years of CG right up to present day. In addition to the historical perspective, CG 101 includes detailed tips and tricks, demo reel guidelines and CG job descriptions to help those looking to get into the business. ',2,'2007-01-01 00:00:00',NULL,NULL,1,'2012-08-10 19:59:48','2012-08-10 20:08:04',NULL,NULL,'cg101-a-computer-graphics-industry-reference','www.cg101.com');
INSERT INTO `acos` VALUES (114,'Electric Image ',3,'Paul Docherty left his position as Head of Graphics at Londonâ€™s leading post house Molinare and set up Electric Image in 1983. The company was funded by private shareholders, a number of which were previously Pauls clients. Paul and his then Technical Director Stewart McEwan (who Paul had hired out of Molinare) spent two years producing real time video based animation for the television market on Dubner equipment. ',2,'1983-01-01 00:00:00',NULL,NULL,1,'2012-08-11 14:02:53','2012-08-11 14:23:35',NULL,NULL,'electric-image-','');
INSERT INTO `acos` VALUES (115,'Paul Docherty ',1,'',2,NULL,NULL,NULL,0,'2012-08-11 14:04:21','2012-08-11 14:04:21',NULL,NULL,'paul-docherty-',NULL);
INSERT INTO `acos` VALUES (116,'Stewart McEwan ',1,'',2,NULL,NULL,NULL,0,'2012-08-11 14:05:15','2012-08-11 14:05:15',NULL,NULL,'stewart-mcewan-',NULL);
INSERT INTO `acos` VALUES (117,'Simon Maddocks ',1,'',2,NULL,NULL,NULL,0,'2012-08-11 14:14:15','2012-08-11 14:14:15',NULL,NULL,'simon-maddocks-',NULL);
INSERT INTO `acos` VALUES (118,'David Benson',1,'',2,NULL,NULL,NULL,0,'2012-08-11 14:14:51','2012-08-11 14:14:51',NULL,NULL,'david-benson',NULL);
INSERT INTO `acos` VALUES (119,'Evans & Sutherland ',3,'Incorporated in 1968 by Dave Evans and Ivan Sutherland, E&S was the first computer graphics company ever formed. Based in Salt Lake City Utah, E&S produced vector graphics workstations initially for military flight simulator use, but later for many commercial companies as well such as Robert Abelâ€™s and Cranston/Csuri. ',2,'1968-01-01 00:00:00',NULL,NULL,1,'2012-08-11 14:28:53','2012-08-11 14:32:00',NULL,NULL,'evans-sutherland-','www.es.com');
INSERT INTO `acos` VALUES (120,'Dave Evans ',1,'',2,NULL,NULL,NULL,0,'2012-08-11 14:30:50','2012-08-11 14:30:50',NULL,NULL,'dave-evans-',NULL);
INSERT INTO `acos` VALUES (121,'Ivan Sutherland',1,'',2,NULL,NULL,NULL,0,'2012-08-11 14:31:12','2012-08-11 14:31:12',NULL,NULL,'ivan-sutherland',NULL);
INSERT INTO `acos` VALUES (122,'Ex Machina',3,'Ex Machina was created in 1989 with the merger of two French CG production companies: Sogitec and the production division of Thomson Digital Image (TDI). With the born of Ex Machina, TDI itself then continued only involved in developing the Explore Software. \r\nEx Machina has been involved in many different areas of CG production, both commercials and films including all formats ( Imax, 70/35mm, stereo, HVISION, etc.). Clients were mainly from Europe and Japan, with most of the large  format films, such as IMAX, being produced for North American clients.\r\n',2,'1989-01-01 00:00:00',NULL,NULL,1,'2012-08-11 15:48:46','2012-08-11 15:52:24',NULL,NULL,'ex-machina','');
INSERT INTO `acos` VALUES (123,'Sogitec',3,'The Ministere de la Culture, managed by Jack Lang, gave some funds to start new CG technologies in France. Sogitec is a big industrial group that acts mainly in the military field as part of Dassault Electronic. The Sogitec CG department was created in 1982â€“83 by Xavier Nicolas, Daniel Poiroux, and Alain Grach to try to create images using a customized version of a flight-simulator software. ',2,'1982-01-01 00:00:00','1989-01-01 00:00:00',NULL,1,'2012-08-11 15:49:27','2012-10-25 11:51:49',NULL,NULL,'sogitec','http://www.sogitec.com/');
INSERT INTO `acos` VALUES (124,'Thomson Digital Image ( TDI )',3,'The Institut national de l\'audiovisuel (INA) was interested in computer graphics and associated themselves with the French defense contractor Thompson CSF to create the Paris-based Thomson Digital Image. Managed by Pascal Bap and Jean Charles Hourcade, TDI developed the 3D animation software Explore and also did production work.',2,'1984-01-01 00:00:00','1989-01-01 00:00:00',NULL,1,'2012-08-11 15:49:49','2012-10-25 13:53:15',NULL,NULL,'thomson-digital-image','');
INSERT INTO `acos` VALUES (125,'Fantastic Animation Machine',3,'Jim Lindner and Suazanne Gavril, former marketing executives at Xerox, broke with Computer Creations, and formed Fantastic Animation Machine in Manhattan, making animations chiefly with a 32-bit Ridge microcomputer, on proprietary software (C & UNIX).',2,'1983-01-01 00:00:00','1992-01-01 00:00:00',NULL,1,'2012-08-11 15:56:31','2012-08-11 15:56:41',NULL,NULL,'fantastic-animation-machine','');
INSERT INTO `acos` VALUES (126,'Suzanne Gavril',1,'',2,NULL,NULL,NULL,0,'2012-08-11 15:58:22','2012-08-11 15:58:22',NULL,NULL,'suzanne-gavril',NULL);
INSERT INTO `acos` VALUES (127,'Image West',3,'Image West was based around analog video animation equipment such as the Scanimate, which manipulated video imagery and captured artwork. Cliff Brown was president and David Sieg was Chief Engineer. Animators included Peter Koczera, Ed Kramer, Russ Maehl and Roy Weinstock. Image West Art Directors were Sonny King, Henry Kline II and Gary McKinnon.',2,'1972-01-01 00:00:00','1985-01-01 00:00:00',NULL,1,'2012-08-16 14:19:24','2012-08-16 14:30:14',NULL,NULL,'image-west','');
INSERT INTO `acos` VALUES (128,'Cliff Brown',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:23:32','2012-08-16 14:23:32',NULL,NULL,'cliff-brown',NULL);
INSERT INTO `acos` VALUES (129,'Ed Kramer',1,'Ed Kramer has a B.S. in psychology from Duke University (1977) and an M.A. in film production from The University of Texas (1980). He was one of the last Scanimate animators, but he has been among the first to use many video tools for production including the ADO, Via Video, and Quantel paint systems, System IV, Bosch FGS-4000, Abekas, Wavefront, and digital videotape. He has worked for video facilities in Hollywood, New York, and Atlanta and for NASA in Houston. He has written about video animation and has chaired courses at SIGGRAPH. His film work includes the LUXOR project for Douglas Trumbull and as a Sequence Supervisor at Industrial Light & Magic for Clear and Present Danger, Jumanji, Twister, 101 Dalmatians, The Lost World, Deep Impact, and Star Wars: The Phantom Menace. He lives in Colorado with his wife, Kim, and daughter, Hannah.',2,'1955-04-30 00:00:00',NULL,NULL,1,'2012-08-16 14:24:18','2012-10-28 12:03:43',NULL,NULL,'ed-kramer','');
INSERT INTO `acos` VALUES (130,'Peter Koczera',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:24:44','2012-08-16 14:24:44',NULL,NULL,'peter-koczera',NULL);
INSERT INTO `acos` VALUES (131,'Roy Weinstock',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:25:13','2012-08-16 14:25:13',NULL,NULL,'roy-weinstock',NULL);
INSERT INTO `acos` VALUES (132,'Gary McKinnon',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:26:02','2012-08-16 14:26:02',NULL,NULL,'gary-mckinnon',NULL);
INSERT INTO `acos` VALUES (133,'Sonny King',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:26:23','2012-08-16 14:26:23',NULL,NULL,'sonny-king',NULL);
INSERT INTO `acos` VALUES (134,'Scott Ross',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:42:34','2012-08-16 14:42:34',NULL,NULL,'scott-ross',NULL);
INSERT INTO `acos` VALUES (135,'Information International Inc. ',3,'The company was originally founded to create image processing equipment and digital image scanners. Management (Al Fenaughty and Terry Taugner) brought John Whitney Jr and Gary Demos over from Evans & Sutherland to form a â€œmovie groupâ€ in an attempt to cut their losses after a major failed government contract bid. John Whitney Jr. had been initially introduced to Triple-I because his father (John Sr.) knew Triple-Iâ€™s founder Ed Fredkin. ',2,'1975-01-01 00:00:00','1982-01-01 00:00:00',NULL,1,'2012-08-16 14:49:28','2012-08-16 15:08:29',NULL,NULL,'information-international-inc-','');
INSERT INTO `acos` VALUES (136,'Craig Reynolds',1,'',2,NULL,NULL,NULL,0,'2012-08-16 14:55:28','2012-08-16 14:55:28',NULL,NULL,'craig-reynolds',NULL);
INSERT INTO `acos` VALUES (137,'Japan Computer Graphics Lab ',3,'In 1978, Mits Kaneko of MK Company obtained from MGM Studios the animation rights to Marjorie Keenan Rollings\' Pulitzer awarded \"The Yearling\". Mits Kaneko decided to use computer animation on the 52 episodes of 30 minute television series because of rapidly rising cost of animation artists and film recording process. After two year\'s development and artist training, in April of 1980, JCGL was established with Mits Kaneko, Toho Company(a movie distribution company), Kodansha (a book publishing company), Toppan (a printing company) and Telework (a television production company) .. 38 artists, 4 programmers and 3 hardware maintenance persons. ',2,'1980-01-01 00:00:00','1987-01-01 00:00:00',NULL,1,'2012-08-16 15:39:13','2012-08-16 15:41:28',NULL,NULL,'japan-computer-graphics-lab-','');
INSERT INTO `acos` VALUES (138,'Mits Kaneko',1,'',2,NULL,NULL,NULL,0,'2012-08-16 15:42:03','2012-08-16 15:42:03',NULL,NULL,'mits-kaneko',NULL);
INSERT INTO `acos` VALUES (139,'Kleiser Walczak Construction Company',3,'One of the first Wavefront based production companies, KWCC was founded in 1987 by Jeff Kleiser and Diana Walczak.\r\nJeff Kleiser went to Colgate University as a CG major using VISIONS, an early fortran code from Syracuse. He made several experimental films and a few commercials by outputting to a DEC Graphics display terminal and shooting 35mm film off the screen. He then moved from Dolphin Productions (1976-77) as a Scanimate operator, Digital Effects (1978-1986) as Animation Director and President, then to Omnibus as Director of the Motion Picture Special Effects Division in LA. \r\nDiana Walczak was a sculptor and CG enthusiast from Boston University who met Jeff while at SIGGRAPH 1985, and joined him at Omnibus for a Marvel Comics character test in 1986. Dianaâ€™s sculptures would be digitized into the computer a section at a time in order to have separate animatable pieces.\r\n',2,'1987-01-01 00:00:00','2004-01-01 00:00:00',NULL,1,'2012-08-16 16:11:00','2012-08-16 16:21:40',NULL,NULL,'kleiser-walczak-construction-company','http://www.synthespianstudios.net');
INSERT INTO `acos` VALUES (140,'Kleiser Walczak Construction Company',3,'One of the first Wavefront based production companies, KWCC was founded in 1987 by Jeff Kleiser and Diana Walczak.\r\nJeff Kleiser went to Colgate University as a CG major using VISIONS, an early fortran code from Syracuse. He made several experimental films and a few commercials by outputting to a DEC Graphics display terminal and shooting 35mm film off the screen. He then moved from Dolphin Productions (1976-77) as a Scanimate operator, Digital Effects (1978-1986) as Animation Director and President, then to Omnibus as Director of the Motion Picture Special Effects Division in LA. \r\nDiana Walczak was a sculptor and CG enthusiast from Boston University who met Jeff while at SIGGRAPH 1985, and joined him at Omnibus for a Marvel Comics character test in 1986. Dianaâ€™s sculptures would be digitized into the computer a section at a time in order to have separate animatable pieces.\r\n',2,'1987-01-01 00:00:00','2005-01-01 00:00:00',NULL,0,'2012-08-16 16:11:02','2012-08-16 16:11:02','','','kleiser-walczak-construction-company','');
INSERT INTO `acos` VALUES (141,'Diana Walczak',1,'',2,NULL,NULL,NULL,0,'2012-08-16 16:17:25','2012-08-16 16:17:25',NULL,NULL,'diana-walczak',NULL);
INSERT INTO `acos` VALUES (142,'Synthespian Studios',3,'',2,NULL,NULL,NULL,0,'2012-08-16 16:18:12','2012-08-16 16:18:12',NULL,NULL,'synthespian-studios',NULL);
INSERT INTO `acos` VALUES (143,'Frank Vitz',1,'',2,NULL,NULL,NULL,0,'2012-08-16 16:20:59','2012-08-16 16:20:59',NULL,NULL,'frank-vitz',NULL);
INSERT INTO `acos` VALUES (144,'Kroyer Films',3,'Kroyer Films was founded by Bill and Sue Kroyer in 1986, just before DOA went out of business. The company specialized in the use of 3D computer graphics, plotted out on paper as hidden surface line art to be colored and used along with traditionally created cel animation. Output was on an HP plotter, hooked up to an SGI 3130. (A mach',2,'1986-01-01 00:00:00',NULL,NULL,1,'2012-08-16 16:24:00','2012-08-17 14:39:00',NULL,NULL,'kroyer-films','');
INSERT INTO `acos` VALUES (145,'Bill Kroyer',1,'',2,NULL,NULL,NULL,0,'2012-08-16 16:24:38','2012-08-16 16:24:38',NULL,NULL,'bill-kroyer',NULL);
INSERT INTO `acos` VALUES (146,'Sue Kroyer',1,'',2,NULL,NULL,NULL,0,'2012-08-16 16:24:57','2012-08-16 16:24:57',NULL,NULL,'sue-kroyer',NULL);
INSERT INTO `acos` VALUES (147,'Lamb & Company',3,'Larry Lamb was President of Lamb & Company and its affiliated software company, LambSoft. A pioneer in the world of 3D animation and computer graphics production, he founded Lamb & Company in 1980 and has been at the forefront of innovation in technology development for computer animation and digital effects for advertising and broadcast for close to two decades. His contributions to the industry include both early adoption and testing of new software systems and the development of proprietary software code on a large scale. ',2,'1980-01-01 00:00:00','2001-01-01 00:00:00',NULL,1,'2012-08-17 14:45:16','2012-08-17 14:45:26','CG101: A Computer Graphics Industry Reference','www.cg101.com','lamb-company','www.lamb.com');
INSERT INTO `acos` VALUES (148,'LambSoft Inc.',3,'In 1997, Lamb & Company spun off LambSoft, a software technology development company whose goal is to productize motion editing and compositing software created as part of the company\'s long term efforts around blending motion capture with keyframe animation. ',2,'1997-01-01 00:00:00','2001-01-01 00:00:00',NULL,1,'2012-08-17 15:25:17','2012-08-17 15:26:18',NULL,NULL,'lambsoft-inc','');
INSERT INTO `acos` VALUES (149,'Larry Lamb',1,'',2,NULL,NULL,NULL,0,'2012-08-17 15:26:58','2012-08-17 15:26:58',NULL,NULL,'larry-lamb',NULL);
INSERT INTO `acos` VALUES (150,'Toyo Links',3,'Founded in 1982 as Toyo Links, and known since 1987 as simply Links, an Imagica Company. A short film called â€œBio-Sensorâ€ (created in 1984) was notable for itâ€™s use of innovative story telling. Art Durinski with his wife and Producing partner Mitchinko joined the company from Omnibus in 1986, staying for about a year and a half. Much of the work Links did was for Sony Corporation, including their international logo that served as inspiration for many later large companies. ( Art and Mitchinko would leave in 1988 to form their own consulting firm, the â€œDurinski Design Groupâ€ in LA )',2,'1982-01-01 00:00:00',NULL,NULL,1,'2012-08-17 15:30:32','2012-08-17 15:30:42',NULL,NULL,'toyo-links','');
INSERT INTO `acos` VALUES (151,'Art Durinski',1,'',2,NULL,NULL,NULL,0,'2012-08-17 15:31:51','2012-08-17 15:31:51',NULL,NULL,'art-durinski',NULL);
INSERT INTO `acos` VALUES (152,'Michiko Suzuki',1,'',2,NULL,NULL,NULL,0,'2012-08-17 15:36:57','2012-08-17 15:36:57',NULL,NULL,'michiko-suzuki',NULL);
INSERT INTO `acos` VALUES (153,'MAGI (Mathematics Application Group, Inc.) ',3,'Founded by three fellow scientists: Phil Mittelman (RPI), Leon Malin and ??? in 1966 as a spin off of United Nuclear Corporation. The original purpose of the companies was to carry out nuclear radiation penetration studies, in order to calculate shielding requirements and other such top secret government things. (The name MAGI was also a joking reference to the fact that it was founded by \"three wise men\".)',2,'1966-01-01 00:00:00',NULL,NULL,1,'2012-08-17 15:42:13','2012-08-17 15:42:22',NULL,NULL,'magi-mathematics-application-group-inc-','');
INSERT INTO `acos` VALUES (154,'Philip Mittelman',1,'Founder of Mathematics Application Group, Inc. (MAGI)',2,'1925-01-01 00:00:00','1999-12-23 00:00:00',NULL,1,'2012-08-17 15:47:47','2012-08-17 15:57:11',NULL,NULL,'philip-mittelman','');
INSERT INTO `acos` VALUES (155,'MAGI Synthavision',3,'Begun in 1972 by Robert Goldstein and Bo Gehring, SynthaVision was the software division of MAGI that was marketed commercially for a short time under the company name of Computer Visuals Inc. The original software (Fortran2 and Fortran4 running on an IBM 360/65) used by the MAGI scientists for tracing particle radiation needed to be only slightly modified to trace light rays instead and make â€¦ ta da!: computer graphics. (Well maybe not quite that easily.)',2,'1972-01-01 00:00:00',NULL,NULL,1,'2012-08-18 13:44:10','2012-08-18 13:44:19','CG101: A Computer Graphics Industry Reference','www.cg101.com','magi-synthavision','');
INSERT INTO `acos` VALUES (156,'Robert Goldstein',1,'',2,NULL,NULL,NULL,0,'2012-08-18 13:44:59','2012-08-18 13:44:59',NULL,NULL,'robert-goldstein',NULL);
INSERT INTO `acos` VALUES (157,'Carl Machover',1,'',2,NULL,NULL,NULL,0,'2012-08-18 13:48:39','2012-08-18 13:48:39',NULL,NULL,'carl-machover',NULL);
INSERT INTO `acos` VALUES (158,'Alain Chesnais',1,'',2,NULL,NULL,NULL,0,'2012-08-19 15:30:13','2012-08-19 15:30:13',NULL,NULL,'alain-chesnais',NULL);
INSERT INTO `acos` VALUES (159,'Eugene Troubetzkoy',1,'Dr. Troubetzkoy (A nuclear physicist) was the director of advanced projects at MAGI. He was previously a consulting physicist for the United Nuclear Corporation and a senior research associate in nuclear physics at Columbia University. ',2,NULL,NULL,NULL,1,'2012-08-20 17:00:51','2012-08-20 17:05:28',NULL,NULL,'eugene-troubetzkoy','');
INSERT INTO `acos` VALUES (160,'Tron',2,'Directed by Steven Lisberger\r\n[ INSERT ENTRY FROM CG101 ]',2,NULL,NULL,NULL,1,'2012-08-20 17:08:16','2012-08-20 17:10:49',NULL,NULL,'tron','');
INSERT INTO `acos` VALUES (161,'John Lasseter',1,'',2,NULL,NULL,NULL,0,'2012-08-21 15:51:51','2012-08-21 15:51:51',NULL,NULL,'john-lasseter',NULL);
INSERT INTO `acos` VALUES (162,'Ken Perlin',1,'',2,NULL,NULL,NULL,0,'2012-08-21 15:56:22','2012-08-21 15:56:22',NULL,NULL,'ken-perlin',NULL);
INSERT INTO `acos` VALUES (163,'Phil Mittelman',1,'',2,NULL,NULL,NULL,0,'2012-08-21 16:05:29','2012-08-21 16:05:29',NULL,NULL,'phil-mittelman',NULL);
INSERT INTO `acos` VALUES (164,'DAvid Brown',1,'',2,NULL,NULL,NULL,0,'2012-08-21 16:05:54','2012-08-21 16:05:54',NULL,NULL,'david-brown',NULL);
INSERT INTO `acos` VALUES (165,'Josh Pines',1,'',2,NULL,NULL,NULL,0,'2012-08-21 16:06:38','2012-08-21 16:06:38',NULL,NULL,'josh-pines',NULL);
INSERT INTO `acos` VALUES (166,'Mental Images',3,'Used Wavefront software as well as proprietary code that eventually became Mental Ray. Work for BMW and German television programming such as ARD and Bremen Television. Employees included John Berton (86-88) and Stefen Fangmeyer (88-90) both future Visual Effects Supervisors at ILM.\r\n',2,'1986-04-01 00:00:00',NULL,NULL,1,'2012-08-21 16:09:41','2012-08-21 16:10:05','CG101: A Computer Graphics Industry Reference','www.cg101.com','mental-images','http://www.mentalimages.com');
INSERT INTO `acos` VALUES (167,'Metrolight',3,'Ron Saks (formerly of Abelâ€™s) was hired by Cranston Csuri (CCI) in anticipation of opening an LA office. Richard â€œDocâ€ Baily was hired in LA first, followed by Paul Sidlo and a few more people. All the new hires went out to Ohio in the summer of 1986 to learn the custom CCI code. A bunch of people soon went back to LA to an office in the back of Abelâ€™s old building. These included Tim McGovern (Abel), Jon Townley, Steve Martino, Mark Steeves, Doc Baily, Neil Eskuri(Disney) and Al Dinoble(Cinesite), Larry Elin (Magi/Abel) and Steve Klevatt.  When CCI folded, Ron Saks remained in Ohio and took up a teaching job there. Jim Kristoff, Dobbie Schiff (Jim and Dobbie are married), several of their family members, and Mits Kaneko all contributed the original funding to then start MetroLight.\r\nOther key people who soon joined them included Con Pederson (Abel), Tom Hutchinson(ILM), Jim Hillen(Disney Feature Animation), John McLaughlin (SonyPictures ImageWorks), Gary Jackemuk, Jim Rygiel, Joe Letteri(ILM), Jeff Doud (Click 3X), Yung-Chen Sung, Rebecca Marie (Hammerhead), Scott Bendis (Interplay), Billy Kent, Patrice Dinhut, Kelley Ray (Sony), Mark Lasoff (Station X), Sean Schur (ILM).\r\n',2,'1987-01-01 00:00:00','2005-01-01 00:00:00',NULL,1,'2012-08-21 16:15:33','2012-08-21 16:31:05','CG101: A Computer Graphics Industry Reference','www.cg101.com','metrolight','');
INSERT INTO `acos` VALUES (168,'The Moving Picture Company (MPC)',3,'Then (and arguably still) the UK\'s leading video post house, MPC had a reputation as technology junkies. They had recently built a motion control rig under the direction Andrew Berend, a London Film School graduate. The computer that controlled the rig was built by Interactive Motion Control (IMC) (one of the partners at IMC was Bud Elam, who later won an Academy Award for Technical Achievement for motion control technology â€“ (his co-winner was Ray Feeney, who started RFX)',2,'1980-01-01 00:00:00',NULL,NULL,1,'2012-08-21 16:32:38','2012-08-21 16:32:40',NULL,NULL,'the-moving-picture-company-mpc','http://www.moving-picture.com');
INSERT INTO `acos` VALUES (169,'National Center For Supercomputing Applications (NCSA) ',3,'Founded in 1985 by Nancy St,John & Craig Upston (Co-Managers). Located at the University of Illinois at Urbana-Champaign. Pioneering Scientific Visualization software projects that created tools that scientists themselves could use. Stefen Fangmeier (ILM) was a TD',2,'1985-01-01 00:00:00',NULL,NULL,1,'2012-08-21 16:35:25','2012-08-21 16:35:45',NULL,NULL,'national-center-for-supercomputing-applications-ncsa-','http://www.ncsa.illinois.edu');
INSERT INTO `acos` VALUES (170,' Stefen Fangmeier',1,'',2,NULL,NULL,NULL,0,'2012-08-21 16:36:30','2012-08-21 16:36:30',NULL,NULL,'-stefen-fangmeier',NULL);
INSERT INTO `acos` VALUES (171,'New York Institute of Technology (NYIT)',3,'In 1974 Dr. Alexander Schure, a wealthy entrepreneur, began to assemble the Computer Graphics Laboratory (CGL) at the New York Institute of Technology. His vision was to create a feature length animated film, with the aid of the days most sophisticated computer graphics techniques. NYIT itself was founded by Dr. Schure, had grounds encompassing numerous estates situated in the beautiful wooded hillsides of Old Westbury New York. Some of these estates were owned by members of the Rockafeller family, who also happened to have a seat on the board of Evans & Sutherland. Because of the close association of E&S with the University of Utah, Dave Evans recommended to Alex to seek out Edwin Catmull to head the new CGL.',2,'1974-01-01 00:00:00',NULL,NULL,1,'2012-08-21 16:38:27','2012-08-21 16:38:29',NULL,NULL,'new-york-institute-of-technology-nyit','http://nyit.edu');
INSERT INTO `acos` VALUES (172,'Garland Stern',1,'',2,NULL,NULL,NULL,0,'2012-08-21 16:44:09','2012-08-21 16:44:09',NULL,NULL,'garland-stern',NULL);
INSERT INTO `acos` VALUES (173,'Alvy Ray Smith',1,'',2,'1943-09-08 00:00:00',NULL,NULL,1,'2012-08-21 16:44:38','2012-10-28 12:27:11',NULL,NULL,'alvy-ray-smith','http://alvyray.com/');
INSERT INTO `acos` VALUES (174,'David DiFrancesco',1,'',2,NULL,NULL,NULL,0,'2012-08-21 16:45:04','2012-08-21 16:45:04',NULL,NULL,'david-difrancesco',NULL);
INSERT INTO `acos` VALUES (175,'Steve \"Spaz\" Williams',1,'Lives in a bright red house. Has a bright red tractor. Likes guns and his dog named Hoyt.',2,'1900-01-01 00:00:00',NULL,NULL,1,'2012-08-29 09:24:49','2012-08-29 09:27:36',NULL,NULL,'steve-spaz-williams','');
INSERT INTO `acos` VALUES (176,'Steve \"Spaz\" Williams',1,'Lives in a bright red house. Has a bright red tractor. Likes guns.',2,NULL,NULL,NULL,0,'2012-08-29 09:24:50','2012-08-29 09:24:50','','','steve-spaz-williams','');
INSERT INTO `acos` VALUES (177,'The Spirit of Spawn',2,'Directed by Scott Leberecht. Behind the scenes at Industrial Light and Magic (ILM) with Steve \'Spaz\' Williams supervising visual effects work on Spawn in 1997. Special guest George Lucas. ',2,'1997-01-01 00:00:00',NULL,NULL,1,'2012-08-29 11:52:22','2012-08-29 11:55:26',NULL,NULL,'the-spirit-of-spawn','');
INSERT INTO `acos` VALUES (178,'Rolf Herken',1,'',2,NULL,NULL,NULL,0,'2012-10-24 09:59:57','2012-10-24 09:59:57',NULL,NULL,'rolf-herken',NULL);
INSERT INTO `acos` VALUES (179,'Gary Yost',1,'',2,NULL,NULL,NULL,0,'2012-10-24 10:18:19','2012-10-24 10:18:19',NULL,NULL,'gary-yost',NULL);
INSERT INTO `acos` VALUES (180,'Nancy St. John',1,'',2,NULL,NULL,NULL,0,'2012-10-24 10:25:47','2012-10-24 10:25:47',NULL,NULL,'nancy-st-john',NULL);
INSERT INTO `acos` VALUES (181,'Craig Upston',1,'',2,NULL,NULL,NULL,0,'2012-10-24 10:26:16','2012-10-24 10:26:16',NULL,NULL,'craig-upston',NULL);
INSERT INTO `acos` VALUES (182,'Ohio State University - Computer Graphics Research Group (CGRG)',3,'Beginning with a National Science Foundation grant for $100,000 in 1969, The Computer Graphics Research Group (CGRG) began working with a PDP 11/45 minicomputer and Vector General Display. The CGRG was truly multi-disciplined and included faculty and graduate students in art, industrial design, photography and cinema, computer and information science, and mathematics. Additional grants from the Air Force Office For Scientific Research and the Navy continued at the center until 1990. The CGRG projects specialized in computer animation languages, geometric and terrain modeling, motion control, and real-time playback systems.',2,'1969-01-01 00:00:00','1987-01-01 00:00:00',NULL,1,'2012-10-24 10:34:28','2012-10-24 11:05:40',NULL,NULL,'ohio-state-university-computer-graphics-research-group-cgrg','http://accad.osu.edu/');
INSERT INTO `acos` VALUES (183,'Tom DeFanti',1,'',2,NULL,NULL,NULL,0,'2012-10-24 10:53:10','2012-10-24 10:53:10',NULL,NULL,'tom-defanti',NULL);
INSERT INTO `acos` VALUES (184,'The Advanced Computing Center for the Arts and Design (ACCAD)',3,'In 1987, Chuck Csuri and Tom Linehan (later President of the Ringling School of Design) converted the Computer Graphics Research Group into The Advanced Computing Center for the Arts and Design (ACCAD). With funding from a long-term Ohio Board of Regents grant, ACCAD was established to provide computer animation resources in teaching, research, and production for all departments in the College of the Arts at Ohio State',2,'1987-01-01 00:00:00',NULL,NULL,1,'2012-10-24 11:07:23','2012-10-24 11:07:49',NULL,NULL,'the-advanced-computing-center-for-the-arts-and-design-accad','http://accad.osu.edu/');
INSERT INTO `acos` VALUES (185,'Omnibus',3,'The Omnibus Group Inc. began as a group of Canadian companies in marketing and communication founded in London, Ontario, in 1972. It expanded with affiliated and shareholding offices in Toronto (Omnibus Video Inc.), Los Angeles (Image West Limited & Downstream-Keyer Inc.), and Sydney, Australia (The Picture Company). John C. Pennie joined in 1974 as President.\r\nImage West was developed by Omnibus beginning in 1975 and was located in Hollywood, California. (See the Image West company entry for more details.)\r\nOmnibus Video Inc., started in 1981, was headed by President Jack Porter (who for 14 years was president of Sheridan College in Toronto) and was located in the Yonge-Eglinton area of Toronto, Canada. The NYIT TWEEN system was acquired and used by animator Robert Marinic (now a CG Supervisor at ILM), who was one of nine employees there at the time.\r\nOmnibus Computer Graphics Inc. was started in early 1982 with W. Kelly Jarmain as Chairman and J.C. Pennie as President and CEO.',2,'1982-01-01 00:00:00','1987-05-01 00:00:00',NULL,1,'2012-10-24 11:27:46','2012-10-24 12:09:16',NULL,NULL,'omnibus-computer-graphics-inc','http://www.omnibusjp.com/');
INSERT INTO `acos` VALUES (186,'Dan Philips',1,'',2,NULL,NULL,NULL,0,'2012-10-24 11:29:50','2012-10-24 11:29:50',NULL,NULL,'dan-philips',NULL);
INSERT INTO `acos` VALUES (187,'Kevin Tureski',1,'',2,NULL,NULL,NULL,0,'2012-10-24 11:31:29','2012-10-24 11:31:29',NULL,NULL,'kevin-tureski',NULL);
INSERT INTO `acos` VALUES (188,'Side Effects Software',3,'Side Effects Software made the early procedurally based 3D system Prisms and now its modern version, Houdini. The company was founded by Kim Davidson and partner Greg Hermanovic after the demise of Omnibus Toronto. Greg was Director of Research at Omnibus, and Kim programmed and was the Director of Animation.\r\nWhen Omnibus went under in 1987, Greg and Kim bought the rights to the Prisms software they had developed from the Royal Bank of Canada (the majority dept holder of Omnibus at the time of Omnibus\' collapse). They started up a production house called Side Effects that later split into Side Effects Production and Side Effects Software. (The production side eventually was renamed Spin Productions to reduce confusion.)\r\n',2,'1987-01-01 00:00:00',NULL,NULL,1,'2012-10-24 12:00:33','2012-10-25 10:02:49',NULL,NULL,'side-effects','http://www.sidefx.com/');
INSERT INTO `acos` VALUES (189,'Thad Bier',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:18:22','2012-10-24 12:18:22',NULL,NULL,'thad-bier',NULL);
INSERT INTO `acos` VALUES (190,'Jamie Dixon',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:18:39','2012-10-24 12:18:39',NULL,NULL,'jamie-dixon',NULL);
INSERT INTO `acos` VALUES (191,'Hammerhead',3,'',2,NULL,NULL,NULL,0,'2012-10-24 12:19:11','2012-10-24 12:19:11',NULL,NULL,'hammerhead',NULL);
INSERT INTO `acos` VALUES (192,'Scott Anderson',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:25:18','2012-10-24 12:25:18',NULL,NULL,'scott-anderson',NULL);
INSERT INTO `acos` VALUES (193,'Glenn Entis',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:25:38','2012-10-24 12:25:38',NULL,NULL,'glenn-entis',NULL);
INSERT INTO `acos` VALUES (194,'Carl Rosendahl',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:26:49','2012-10-24 12:26:49',NULL,NULL,'carl-rosendahl',NULL);
INSERT INTO `acos` VALUES (195,'Richard Chuang',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:27:11','2012-10-24 12:27:11',NULL,NULL,'richard-chuang',NULL);
INSERT INTO `acos` VALUES (196,'Rob Cook',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:34:56','2012-10-24 12:34:56',NULL,NULL,'rob-cook',NULL);
INSERT INTO `acos` VALUES (197,'Loren Carpenter',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:35:45','2012-10-24 12:35:45',NULL,NULL,'loren-carpenter',NULL);
INSERT INTO `acos` VALUES (198,'Eben Ostby',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:36:08','2012-10-24 12:36:08',NULL,NULL,'eben-ostby',NULL);
INSERT INTO `acos` VALUES (199,'Ralph Guggenheim',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:36:31','2012-10-24 12:36:31',NULL,NULL,'ralph-guggenheim',NULL);
INSERT INTO `acos` VALUES (200,'Rodney Stock',1,'',2,NULL,NULL,NULL,0,'2012-10-24 12:38:59','2012-10-24 12:38:59',NULL,NULL,'rodney-stock',NULL);
INSERT INTO `acos` VALUES (201,'Protozoa',3,'Located in San Francisco, CA Protozoa was a pioneering performance animation company of complete systems, production, and Web-based animation content. Founder Brad DeGraf spun this new company off from Colossal Picturesâ€™ Digital Media Division with $2 million from the Motorola New Ventures fund.',2,NULL,NULL,NULL,1,'2012-10-24 14:12:57','2012-10-24 14:13:00',NULL,NULL,'protozoa','');
INSERT INTO `acos` VALUES (202,'Bill Kovacs',1,'',2,'1949-10-25 00:00:00','2006-05-30 00:00:00',NULL,1,'2012-10-24 14:24:03','2012-10-24 14:26:59',NULL,NULL,'bill-kovacs','');
INSERT INTO `acos` VALUES (203,'Wavefront',3,'Larry Barels, Bill Kovacs, and Mark Sylvester founded Wavefront Technologies in 1984. The company created its first product, an animation software application called PreView, and shipped it to Universal Studios for use on the television series Knight Rider and to Lamb & Company for use in previsualizing and controlling a motion control camera rig. During the next several years, the product line expanded to include modeling, rendering, compositing, and material-editing capabilities. The company enjoyed early relationships with key partners that shaped the direction of the products and the marketplace. Those early partners included Disney (The Great Mouse Detective), NASA (the Shuttle accident re-creation), NBC (the 1986 Olympics), and Failure Analysis (legal animations, including the World Airways crash at Logan Airport in Boston).',2,'1984-01-01 00:00:00','1995-06-01 00:00:00',NULL,1,'2012-10-24 14:26:36','2012-10-25 17:36:02',NULL,NULL,'wavefront','');
INSERT INTO `acos` VALUES (204,'Rhythm & Hues',3,'',2,NULL,NULL,NULL,1,'2012-10-24 14:28:28','2012-10-24 14:28:30',NULL,NULL,'rhythm-hues','http://www.rhythm.com/');
INSERT INTO `acos` VALUES (205,'VIFX',3,'VIFX was co-founded by partners Richard Hollander, Greg McMurry, Rhonda Gunner, and John Wash.',2,'1985-01-01 00:00:00','2000-01-01 00:00:00',NULL,1,'2012-10-24 14:34:45','2012-10-25 17:12:52',NULL,NULL,'vifx','');
INSERT INTO `acos` VALUES (206,'John Hughes',1,'',2,NULL,NULL,NULL,0,'2012-10-24 14:35:26','2012-10-24 14:35:26',NULL,NULL,'john-hughes',NULL);
INSERT INTO `acos` VALUES (207,'Robert Abel & Associates',3,'Icon of advertising, Harry Marks, provided Bob Abel and his old friend Con Pederson with the opportunity to create a new look for ABC television. From 1971 to 1973, in 6,000 square feet of vacant space behind an accountant\'s office, the fledgling Robert Abel & Associates began to take shape. There was no phone, no sign on the building, no advertising, and no secretary; just Abel, Con, an optical guy named Dick Alexander, and a cameraman named Dave Stuart.',2,'1971-01-01 00:00:00',NULL,NULL,1,'2012-10-24 16:48:47','2012-10-24 16:50:45',NULL,NULL,'robert-abel-associates','');
INSERT INTO `acos` VALUES (208,'Robert Abel',1,'',2,NULL,NULL,NULL,0,'2012-10-24 16:49:29','2012-10-24 16:49:29',NULL,NULL,'robert-abel',NULL);
INSERT INTO `acos` VALUES (209,'Con Pederson',1,'',2,NULL,NULL,NULL,0,'2012-10-24 16:50:25','2012-10-24 16:50:25',NULL,NULL,'con-pederson',NULL);
INSERT INTO `acos` VALUES (210,'Richard Hollander',1,'',2,NULL,NULL,NULL,0,'2012-10-24 16:54:38','2012-10-24 16:54:38',NULL,NULL,'richard-hollander',NULL);
INSERT INTO `acos` VALUES (211,'Richard Taylor',1,'',2,NULL,NULL,NULL,0,'2012-10-24 16:54:58','2012-10-24 16:54:58',NULL,NULL,'richard-taylor',NULL);
INSERT INTO `acos` VALUES (212,'Abel Image Research',3,'',2,NULL,NULL,NULL,0,'2012-10-24 16:58:28','2012-10-24 16:58:28',NULL,NULL,'abel-image-research',NULL);
INSERT INTO `acos` VALUES (213,'Robert Greenberg & Associates ( R/GA )',3,'While R/GA itself was founded in 1977, Chris Woods set up the computer graphics department in 1981. Early on, some folks (including Jonathan Luskin) did some research, but not until 1985 did the CG department really get off the ground. The initial crew was all from MAGI/Synthavision: Josh Pines and Ken Perlin wrote the R/GA rendering code, Jan Carlee and Christine Chang were joined later by Tom Miller, Jim Goodman, Kevin Bjorke, and Job Francis.\r\nIntegral to RGA up to that point was a world-class optical and motion-control effects department headed by Joel Hynek and Stuart Robertson.\r\n',2,'1981-01-01 00:00:00',NULL,NULL,1,'2012-10-25 09:20:40','2012-10-25 09:33:58',NULL,NULL,'robert-greenberg-associates-r-ga-','http://www.rga.com/');
INSERT INTO `acos` VALUES (214,'Joel Hynek',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:21:33','2012-10-25 09:21:33',NULL,NULL,'joel-hynek',NULL);
INSERT INTO `acos` VALUES (215,'Jan Carlee',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:29:00','2012-10-25 09:29:00',NULL,NULL,'jan-carlee',NULL);
INSERT INTO `acos` VALUES (216,'Christine Chang',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:29:25','2012-10-25 09:29:25',NULL,NULL,'christine-chang',NULL);
INSERT INTO `acos` VALUES (217,'Kevin Bjorke',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:29:59','2012-10-25 09:29:59',NULL,NULL,'kevin-bjorke',NULL);
INSERT INTO `acos` VALUES (218,'George Joblove',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:32:34','2012-10-25 09:32:34',NULL,NULL,'george-joblove',NULL);
INSERT INTO `acos` VALUES (219,'Ellen Somers',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:33:48','2012-10-25 09:33:48',NULL,NULL,'ellen-somers',NULL);
INSERT INTO `acos` VALUES (220,'Santa Barbara Studios',3,'Santa Barbara Studios was founded in 1990 by John Grower and began specializing in procedural natural phenomenon effects using Wavefront Technologies\' Dynamation software. Employees included Bill Kovacs, Will Rivera, Eric Guagliani, Bruce Jones, Phil Brock, Eric DeJong, Mark, Wendell, Diane Holland, and Matt Rhodes.',2,'1990-01-01 00:00:00','2002-09-01 00:00:00',NULL,1,'2012-10-25 09:36:21','2012-10-25 09:59:33',NULL,NULL,'santa-barbara-studios','');
INSERT INTO `acos` VALUES (221,'John Grower',1,'',2,NULL,NULL,NULL,0,'2012-10-25 09:46:18','2012-10-25 09:46:18',NULL,NULL,'john-grower',NULL);
INSERT INTO `acos` VALUES (222,'Kim Davidson',1,'',2,NULL,NULL,NULL,0,'2012-10-25 10:03:21','2012-10-25 10:03:21',NULL,NULL,'kim-davidson',NULL);
INSERT INTO `acos` VALUES (223,'Greg Hermanovic',1,'',2,NULL,NULL,NULL,0,'2012-10-25 10:04:29','2012-10-25 10:04:29',NULL,NULL,'greg-hermanovic',NULL);
INSERT INTO `acos` VALUES (224,'Silicon Graphics Inc. ( SGI )',3,'Founded in 1982 by Dr. Jim Clark (Ph.D., University of Utah, 1974), Silicon Graphics Inc. was the manufacturer of RISC processor-based IRIS graphics workstations, which are popular in visualization and high-end CG animation/visual-effects companies. Jim Clark, while at Stanford University, invented the Graphics Engine, the first Very Large Scale Integrated (VLSI) graphics chip. \r\nThe company has gone through many significant changes until being branded simply as SGI in May of 2009.',2,'1982-01-01 00:00:00',NULL,NULL,1,'2012-10-25 10:17:24','2012-10-25 10:17:26',NULL,NULL,'silicon-graphics-inc-sgi-','http://www.sgi.com/');
INSERT INTO `acos` VALUES (225,'Softimage',3,'Formed by Daniel Langlois (one of the three animators on the short film Tony de Peltri) in 1986, Softimage was based in Montreal. Its first interactive 3D software product, Creative Environment 1.0, debuted at the 1988 Siggraph in Atlanta. Softimage led the way in advanced IK character animation tools for high-end 3D users with the Actor module. The work on Actor started in late 1990, and it was first shown in public at Siggraph 1991 in Las Vegas. It was first released in version 2.51 of the Softimage Creative Environment in early 1992.',2,'1986-01-01 00:00:00','1998-01-01 00:00:00',NULL,1,'2012-10-25 11:36:52','2012-10-25 11:36:54',NULL,NULL,'softimage','');
INSERT INTO `acos` VALUES (226,'Daniel Langlois',1,'',2,NULL,NULL,NULL,0,'2012-10-25 11:37:55','2012-10-25 11:37:55',NULL,NULL,'daniel-langlois',NULL);
INSERT INTO `acos` VALUES (227,'Sogitec',3,'',2,NULL,NULL,NULL,0,'2012-10-25 11:45:31','2012-10-25 11:45:31','','','sogitec','');
INSERT INTO `acos` VALUES (228,'Xavier Nicolas',1,'',2,NULL,NULL,NULL,0,'2012-10-25 11:50:35','2012-10-25 11:50:35',NULL,NULL,'xavier-nicolas',NULL);
INSERT INTO `acos` VALUES (229,'Symbolics Graphics Division',3,'Symbolics, Inc. was formed in 1980, headed by Russell Noftsker and his right-hand man and CTO Jack Holloway (both from Triple-I). Hardware architecture was based on work by researchers at the M.I.T. Artificial Intelligence Laboratory and the Lisp Machine project in 1974 (thanks to the close proximity of the Symbolics Cambridge Research Center).\r\n\r\nThe Symbolics LM-2 was introduced in 1981, the 3600 in 1982, the 3640 and 3670 in 1984, and the 3675 and 3645 in 1985. At its peak in 1985, Symbolics had more than 650 employees and 35 sales offices in North America, Europe, Japan, and the Middle East. Symbolics had more than 1,500 systems installed around the world. Color graphics system hardware included 8-bit or 24-bit high-resolution framebuffers, 32-bit broadcast resolution framebuffers, CAD buffers, digitizing frame grabbers, genlock options (for synchronization to video), color monitors (standard, premium, NTSC-resolution, and CAD buffer monitors), graphics tablets, and NTSC encoders and decoders.',2,'1981-01-01 00:00:00',NULL,NULL,1,'2012-10-25 12:20:37','2012-10-25 12:20:40',NULL,NULL,'symbolics-graphics-division','');
INSERT INTO `acos` VALUES (230,'Joseph Goldstone',1,'',2,NULL,NULL,NULL,0,'2012-10-25 12:23:57','2012-10-25 12:23:57',NULL,NULL,'joseph-goldstone',NULL);
INSERT INTO `acos` VALUES (231,'Richard ( Doc ) Baily',1,'',2,NULL,NULL,NULL,0,'2012-10-25 12:25:15','2012-10-25 12:25:15',NULL,NULL,'richard-doc-baily',NULL);
INSERT INTO `acos` VALUES (232,'Philippe Bergeron',1,'',2,NULL,NULL,NULL,0,'2012-10-25 12:26:39','2012-10-25 12:26:39',NULL,NULL,'philippe-bergeron',NULL);
INSERT INTO `acos` VALUES (233,'Tom McMahon',1,'',2,NULL,NULL,NULL,0,'2012-10-25 13:31:23','2012-10-25 13:31:23',NULL,NULL,'tom-mcmahon',NULL);
INSERT INTO `acos` VALUES (234,'John Lansdown',1,'John Lansdown was Emeritus Professor of Computer Aided Art and Design and formerly Head of the Centre for Electronic Arts (formerly called the Centre for Advanced Studies in Computer Aided Art and Design) from September 1988 until July 1995 when he retired from full-time employment.\r\nIn 1968, he was one of the founders of the Computer Arts Society and was its honorary secretary for more than 25 years. He was engaged in using computers for creative activities (such as architecture, art, and choreography) since 1960 and wrote over 300 publications on computer uses in art and design.\" â€”excerpt by permission of Huw Jones\r\nA true pioneer of computer graphics in the UK, John Lansdown died of leukemia on February 17, 1999.\r\n',2,'1929-01-22 00:00:00','1999-02-17 00:00:00',NULL,1,'2012-10-25 13:33:42','2012-10-25 13:46:38',NULL,NULL,'john-lansdown','');
INSERT INTO `acos` VALUES (235,'John Lansdown',1,'John Lansdown was Emeritus Professor of Computer Aided Art and Design and formerly Head of the Centre for Electronic Arts (formerly called the Centre for Advanced Studies in Computer Aided Art and Design) from September 1988 until July 1995 when he retired from full-time employment.\r\nIn 1968, he was one of the founders of the Computer Arts Society and was its honorary secretary for more than 25 years. He was engaged in using computers for creative activities (such as architecture, art, and choreography) since 1960 and wrote over 300 publications on computer uses in art and design.\" â€”excerpt by permission of Huw Jones\r\nA true pioneer of computer graphics in the UK, John Lansdown died of leukemia on February 17, 1999.\r\n',2,NULL,'1999-02-17 00:00:00',NULL,0,'2012-10-25 13:34:08','2012-10-25 13:34:08','','','john-lansdown','');
INSERT INTO `acos` VALUES (236,'System Simulation',3,'John Lansdown founded System Simulation in London with his colleague George Mallen and others from the Computer Arts Society. Through it, he developed major innovations in computer animation such as special effects for advertisements and television titles; effects for the feature films Alien (1979), Saturn III, and Heavy Metal; and the realization of the original animated Channel 4 logo. John created what was then the world\'s largest computer-generated mural (reviewed in Building Design as a \"waste of electricity,\" although few today would question the bright power of his creative output).\r\nJohn Lansdown chaired the company until 1988.',2,'1970-01-01 00:00:00',NULL,NULL,1,'2012-10-25 13:45:00','2012-10-25 13:48:32',NULL,NULL,'system-simulation','http://www.ssl.co.uk/');
INSERT INTO `acos` VALUES (237,'Computer Arts Society',3,'Formed in 1968 by Alan Sutcliffe, George Mallen, and John Lansdown',2,'1968-01-01 00:00:00',NULL,NULL,1,'2012-10-25 13:45:29','2012-10-26 09:43:05',NULL,NULL,'computer-arts-society','http://computer-arts-society.com/');
INSERT INTO `acos` VALUES (238,'University of Bath ( UK )',3,'',2,'1975-01-01 00:00:00',NULL,NULL,1,'2012-10-25 13:57:44','2012-10-25 14:02:48',NULL,NULL,'university-of-bath-uk-','http://www.bath.ac.uk/media/');
INSERT INTO `acos` VALUES (239,'Electronic Visualization Laboratory (EVL) ',3,'The Electronic Visualization Laboratory (EVL) is a graduate research laboratory specializing in virtual reality and real-time interactive computer graphics. It is a joint effort of University of Illinois - Chicago\'s College of Engineering and School of Art and Design, and it represents the oldest formal collaboration between engineering and art in the country, offering graduate degrees to those specializing in visualization.',2,'1973-01-01 00:00:00',NULL,NULL,1,'2012-10-25 14:05:21','2012-10-25 15:28:15',NULL,NULL,'electronic-visualization-laboratory-evl-','http://www.evl.uic.edu/');
INSERT INTO `acos` VALUES (240,'Larry Cuba',1,'Larry Cuba is widely recognized as a pioneer in the use of computers in animation art. Producing his first computer animation in 1974, Cuba was at the forefront of the computer-animation artists considered the \"second generation\" --- those who directly followed the visionaries of the sixties: John Whitney, Sr., Stan Vanderbeek and Lillian Schwartz.',2,'1950-09-17 00:00:00',NULL,NULL,1,'2012-10-25 14:11:49','2012-10-25 15:34:49',NULL,NULL,'larry-cuba','http://www.well.com/~cuba/');
INSERT INTO `acos` VALUES (241,'Star Wars',2,'',2,NULL,NULL,NULL,0,'2012-10-25 15:35:38','2012-10-25 15:35:38',NULL,NULL,'star-wars',NULL);
INSERT INTO `acos` VALUES (242,'University of Utah',3,'Dr. David Evans founded the Computer Science Department at the University of Utah in 1968. It was started in part by Bob Taylor\'s ARPA funding a $5 million grant.',2,'1968-01-01 00:00:00',NULL,NULL,1,'2012-10-25 15:47:41','2012-10-25 15:52:03',NULL,NULL,'university-of-utah','http://www.cs.utah.edu/research/areas/graphics/');
INSERT INTO `acos` VALUES (243,'Henri Gouraud',1,'',2,NULL,NULL,NULL,0,'2012-10-25 15:50:08','2012-10-25 15:50:08',NULL,NULL,'henri-gouraud',NULL);
INSERT INTO `acos` VALUES (244,'Jim Kajiya',1,'',2,NULL,NULL,NULL,0,'2012-10-25 15:51:28','2012-10-25 15:51:28',NULL,NULL,'jim-kajiya',NULL);
INSERT INTO `acos` VALUES (245,'James ( Jim ) Blinn',1,'',2,'1949-01-01 00:00:00',NULL,NULL,1,'2012-10-25 15:51:57','2012-10-27 16:47:14',NULL,NULL,'james-jim-blinn','http://www.jimblinn.com/');
INSERT INTO `acos` VALUES (246,'Vertigo',3,'The history of Vertigo, a 3D animation company based in Vancouver, Canada, is marked by a sequence of four distinct eras:\r\nVertigo Production Company, 1979â€“83\r\nVertigo Systems International, 1983â€“87\r\nVertigo/Cubicomp, 1987â€“90\r\nVertigo Again, 1990â€“present\r\n',2,'1979-01-01 00:00:00','2005-07-15 00:00:00',NULL,1,'2012-10-25 16:00:15','2012-10-25 16:17:05',NULL,NULL,'vertigo','');
INSERT INTO `acos` VALUES (247,'Rick Stringfellow',1,'',2,NULL,NULL,NULL,0,'2012-10-25 16:15:02','2012-10-25 16:15:02',NULL,NULL,'rick-stringfellow',NULL);
INSERT INTO `acos` VALUES (248,'Cubicomp',3,'Cubicomp was founded in the early 1980s in a garage in Berkeley, California, by Edwin P. Berlin, Jr. to provide a turnkey computer animation system on an IBM personal computer. The Cubicomp product, called PictureMaker, featured polygonal modeling, scene choreography, and rendering at a much lower price point than on comparable workstation-based software systems. At the time of the aquisition, the combined installed based totalled some 750 units worldwide.',2,'1982-01-01 00:00:00',NULL,NULL,1,'2012-10-25 16:17:36','2012-10-25 16:27:33',NULL,NULL,'cubicomp','');
INSERT INTO `acos` VALUES (249,'Michael Zyda',1,'Professor Zyda began his career in Computer Graphics in 1973 as part of an undergraduate research group, the Senses Bureau, at the University of California, San Diego. Professor Zyda received a BA in Bioengineering from the University of California, San Diego in La Jolla in 1976, an MS in Computer Science from the University of Massachusetts, Amherst in 1978 and a DSc in Computer Science from Washington University, St. Louis, Missouri in 1984.',2,'1954-09-11 00:00:00',NULL,NULL,1,'2012-10-25 16:52:07','2012-10-25 16:52:50',NULL,NULL,'michael-zyda','http://gamepipe.usc.edu/~zyda/');
INSERT INTO `acos` VALUES (250,'John Wash',1,'',2,NULL,NULL,NULL,0,'2012-10-25 17:02:16','2012-10-25 17:02:16',NULL,NULL,'john-wash',NULL);
INSERT INTO `acos` VALUES (251,'Mark Sylvester',1,'',2,NULL,NULL,NULL,0,'2012-10-25 17:22:58','2012-10-25 17:22:58',NULL,NULL,'mark-sylvester',NULL);
INSERT INTO `acos` VALUES (252,'Whitney Demos Productions',3,'Whitney/Demos was founded by John Whitney Jr. and Gary Demos after their company, Digital Productions, was taken over by Omnibus. Funding assistance included Tom McMahon from the Symbolics Graphics Division and other private investors.\r\nInitial production was based on Thinking Machines\' Connection Machine II fronted by a Symbolics workstation along with other computer systems.',2,'1986-01-01 00:00:00','1988-06-01 00:00:00',NULL,1,'2012-10-25 17:38:59','2012-10-25 17:39:22',NULL,NULL,'whitney-demos-productions','');
INSERT INTO `acos` VALUES (253,'Stanley and Stella in Breaking the Ice',2,'A brilliant early CG animation short film produced by the Symbolics Graphics Division in association with Whitney / Demos Productions. Premiered at SIGGRAPH 1987.',2,'1987-01-01 00:00:00',NULL,NULL,1,'2012-10-25 17:43:25','2012-10-25 17:47:10',NULL,NULL,'stanley-and-stella-in-breaking-the-ice','');
INSERT INTO `acos` VALUES (254,'John Turner Whitted',1,'Best known for his breakthrough 1979 paper \"An  Improved  Illumination Model  for  Shaded  Display\" which introduced the concept of ray tracing; Turner is currently a senior researcher at Microsoft.',2,NULL,NULL,NULL,1,'2012-10-27 16:34:03','2012-10-27 16:41:50',NULL,NULL,'turner-whitted','http://research.microsoft.com/en-us/people/jtw/');
INSERT INTO `acos` VALUES (255,'ray tracing',2,'Ray tracing was first developed in the mid 1960s by Bob Goldstein. (The key paper was published in \"Simulation\" in 1968.) Other developers at this stage included Arthur Appel, Herb Steinberg, Roger Nage, Marty Cohen, and Eugene Troubetskoy (Magi/Synthavision).\r\nPapers presented at SIGGRAPH by Alan Kay and Turner Whitted in 1979 and 1980 expanded its utilization with specular reflection and refraction.\r\n',2,'1963-01-01 00:00:00',NULL,NULL,1,'2012-10-27 16:39:32','2012-10-29 12:13:27',NULL,NULL,'ray-tracing','');
INSERT INTO `acos` VALUES (256,'Jet Propulsion Laboratory ( JPL )',3,'',2,NULL,NULL,NULL,0,'2012-10-27 16:46:23','2012-10-27 16:46:23',NULL,NULL,'jet-propulsion-laboratory-jpl-',NULL);
INSERT INTO `acos` VALUES (257,'Project Mathematics!',2,'',2,'1988-01-01 00:00:00',NULL,NULL,1,'2012-10-27 16:47:04','2012-10-27 16:49:59',NULL,NULL,'project-mathematics','http://www.projectmathematics.com/');
INSERT INTO `acos` VALUES (258,'SIGGRAPH',3,'The Special Interest Group on GRAPHics and Interactive Techniques was founded in 1969 by Andy Van Dam and best known for its annual conference, celebrating it\'s 40th anniversary in 2013.',2,'1969-01-01 00:00:00',NULL,NULL,1,'2012-10-27 16:55:44','2012-10-27 16:55:47',NULL,NULL,'siggraph','http://www.siggraph.org/');
INSERT INTO `acos` VALUES (259,'Xaos',3,'Xaos originally was called Eidolon by Arthur Shwartzberg and Michael Tolson when they both left a studio in San Fransisco called Synthetic Video, where Arthur was Director of Marketing and Michael was a co-founder.\r\nRenamed and incorporated in early 1989, Tolson held the office of President, Schwartzberg was VP/General Manager, and a new third partner, Mark Malmberg, was named Secretary, Creative Director, and Head of Production.\r\nWhile Arthur\'s strength was in marketing, Tolson was largely self-taught and was a visionary both creatively and technically. He wrote the bulk of Xaos\' early software from scratch with contributions to software development at the time from programmers Michael Beese and Eric Texier. Malmberg received an M.F.A. from UC-Berkeley in 1981 and had been working for General Graphics Services in San Francisco.\r\n',2,'1989-01-01 00:00:00','2000-01-01 00:00:00',NULL,1,'2012-10-27 17:54:12','2012-10-27 18:08:53',NULL,NULL,'xaos','');
INSERT INTO `acos` VALUES (260,'Helene Plotkin',1,'',2,NULL,NULL,NULL,0,'2012-10-27 18:05:51','2012-10-27 18:05:51',NULL,NULL,'helene-plotkin',NULL);
INSERT INTO `acos` VALUES (261,'Arthur Shwartzberg',1,'',2,NULL,NULL,NULL,0,'2012-10-27 18:06:29','2012-10-27 18:06:29',NULL,NULL,'arthur-shwartzberg',NULL);
INSERT INTO `acos` VALUES (262,'Michael Tolson',1,'',2,NULL,NULL,NULL,0,'2012-10-27 18:06:59','2012-10-27 18:06:59',NULL,NULL,'michael-tolson',NULL);
INSERT INTO `acos` VALUES (263,'Mark Malmberg',1,'',2,NULL,NULL,NULL,0,'2012-10-27 18:07:23','2012-10-27 18:07:23',NULL,NULL,'mark-malmberg',NULL);
INSERT INTO `acos` VALUES (264,'Daniel Wexler',1,'',2,NULL,NULL,NULL,0,'2012-10-27 18:10:08','2012-10-27 18:10:08',NULL,NULL,'daniel-wexler',NULL);
INSERT INTO `acos` VALUES (265,'Richard Shoup',1,'',2,NULL,NULL,NULL,1,'2012-10-27 18:22:50','2012-10-27 18:24:47',NULL,NULL,'richard-shoup','http://www.rgshoup.com/');
INSERT INTO `acos` VALUES (266,'Aurora Systems',3,'',2,NULL,NULL,NULL,0,'2012-10-27 18:24:38','2012-10-27 18:24:38',NULL,NULL,'aurora-systems',NULL);
INSERT INTO `acos` VALUES (267,'Maurice Benayoun',1,'',2,'1957-03-29 00:00:00',NULL,NULL,1,'2012-10-27 18:30:05','2012-10-27 18:30:35',NULL,NULL,'maurice-benayoun','http://www.benayoun.com/');
INSERT INTO `acos` VALUES (268,'Z-A',3,'Z-A was founded in 1987 in Paris by three people: StÃ©phane Singier (Chief Manager), Thierry Prieur (Technical Manager), and Maurice Benayoun (Art Director).\r\n\r\nIn addition to animated projects for television, Z-A worked on special effects, television openings, receiving numerous awards. For example, 1st and 2nd prize at Imagina; scientific and architectural simulations, etc. Most recently Z-A had been working on several Japanese CG ventures (television, theme parks, and so on) and French and European productions. ',2,'1987-01-01 00:00:00','2003-03-01 00:00:00',NULL,1,'2012-10-27 18:32:29','2012-10-27 18:39:41',NULL,NULL,'z-a','http://www.z-a.net/indexza.fr.html');
INSERT INTO `acos` VALUES (269,'scanimate',2,'Patented in 1972, Scanimate was a wall-sized behemoth of knobs, switches, thumbwheel counters, and patch panels. At its heart was a 950 scan-line resolution cathode ray tube (CRT) with special phosphors for a brighter, longer-lasting image. A camera was trained on a light box with flat artwork of the client\'s logo. The monochromatic video image of the logo from this camera was fed into Scanimate\'s special CRT. The Scanimate artist could then plug hundreds of little yellow wires into the patch panels, connecting such electronic components as ramp voltages, summing amplifiers, multipliers, rectifiers, diodes, and oscillators in much the same way as with a \"50-in-1\" electronics kit. These circuits could animate the client\'s logo on the screen in an infinite number of ways[md]stretching, warping, undulating, wiggling, sparkling, glowing, flying over slit-scan grids or star fields[md]all based on the creativity and electronic virtuosity of the Scanimate artist. If a sine wave oscillator was patched into Scanimate\'s HORIZONTAL parameter, for example, the logo would move back and forth from left to right. If the oscillator was switched to a square wave, the logo would pop from left to right. If a sine wave was patched into HORIZONTAL and',2,'1972-01-01 00:00:00',NULL,NULL,1,'2012-10-27 21:51:39','2012-10-28 12:10:19',NULL,NULL,'scanimate','http://scanimate.zfx.com/');
INSERT INTO `acos` VALUES (270,'alpha channel',2,'The fourth RGBA information channel that contains 8-bit grayscale values used in compositing. It was co-developed by Ed Catmull and Alvy Ray Smith at the New York Institute of Technology in 1977. Why \"alpha?\" According to Smith, image composition uses simple linear interpretation in which the Greek letter \"A\" (alpha) controls the amount of interpolation between two images.',2,'1977-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:22:11','2012-10-28 12:25:42',NULL,NULL,'alpha-channel','');
INSERT INTO `acos` VALUES (271,'Tom Porter',1,'',2,NULL,NULL,NULL,0,'2012-10-28 12:24:16','2012-10-28 12:24:16',NULL,NULL,'tom-porter',NULL);
INSERT INTO `acos` VALUES (272,'Tom Duff',1,'',2,NULL,NULL,NULL,0,'2012-10-28 12:24:46','2012-10-28 12:24:46',NULL,NULL,'tom-duff',NULL);
INSERT INTO `acos` VALUES (273,'Altamira Composer',2,'This is sprite-based image-compositing software for Windows, marketed for Web-based image creation. Originally from Altamira Software Corporation. It was acquired by Microsoft\'s Advanced Technology Division in 1994',2,'1991-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:28:01','2012-10-28 12:38:40',NULL,NULL,'altamira','http://alvyray.com/Altamira/AltamiraProduct.htm');
INSERT INTO `acos` VALUES (274,'Chalice',2,'This 2D compositing software used an \"interactive data-flow diagram paradigm\" (a fancy way of saying an intuitive interface with dependency structure). Written in conjunction with Side Effects Software and RFX, Chalice was available for UNIX and NT from Silicon Grail in 1995. Film resolution tracking color correction and extractions can be controlled through mathematical expressions. It was optimized for the DEC Alpha and cost about $3,000 in 1998. Chalice (and its sister program RAYZ) was purchased by Apple in June 2002 and later discontinued. ',2,'2000-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:33:37','2012-10-28 12:33:37','','','chalice','');
INSERT INTO `acos` VALUES (275,'RFX',3,'',2,NULL,NULL,NULL,0,'2012-10-28 12:34:03','2012-10-28 12:34:03',NULL,NULL,'rfx',NULL);
INSERT INTO `acos` VALUES (276,'Cineon',2,'SGI-based compositing software from Kodak. Typhoon is the O2-based entry-level system, Storm is a dual-processor version for high resolution and remote rendering, and Tornado runs on multi-proc Onyx2 supercomputers. This product hasn\'t been available since 1998 when Kodak pulled support for it. Its very powerful dual-monitor setup and flow chart GUI approach to interface design are made for productive work sessions.\r\nCineon also refers to the image file format used by the system, which has the capability to store data in 16-bit log format. This provides a very deep response curve that preserves the subtle color details and gradients found in film. A users site can be found at www.cineon.com  \r\n',2,'1995-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:35:01','2012-10-28 12:36:14',NULL,NULL,'cineon','http://www.cineon.com/');
INSERT INTO `acos` VALUES (277,'Wavefront Composer',2,'This full-featured film-resolution compositing software launched originally from Wavefront was first made available for the SGI in 1991. Features include lens warping, motion blur, multiprocessor rendering, time distortion, and \"True Track\" motion tracking. This product is based on scanline compositing algorithms and a data-flow diagram interface, the GUI being similar to modern After Effects. Composer was discontinued in late 2001 in favor of Fusion.',2,'1991-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:37:34','2012-10-28 12:37:36',NULL,NULL,'wavefront-composer','');
INSERT INTO `acos` VALUES (278,'Concerto',2,'Such a deal! This resolution-independent compositing software for Windows 95/NT was originally from Axis Software and later  from Chyron Corporation. Plug-ins werr available such as Final Effects from MetaCreations, BorisFX from Artel Software, Hollywood FX from Synergy International, and Power Pack from WAVES. Concerto gave you a multiprocessor plug-in environment for the only affordable price. Chyron disposed of Concerto in late 1998.',2,'1995-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:41:03','2012-10-28 12:41:03','','','concerto','');
INSERT INTO `acos` VALUES (279,'Chyron',3,'',2,NULL,NULL,NULL,0,'2012-10-28 12:41:28','2012-10-28 12:41:28',NULL,NULL,'chyron',NULL);
INSERT INTO `acos` VALUES (280,'Discreet Logic',3,'Formed in 1991 to provide several high-end painting, video editing, and compositing software products based on the SGI hardware platform. Products have included inferno and flame; effect, paint, and light for multimedia content creation; and frost, a real-time 3D broadcast graphics system with vapour virtual studio module, Paint vector-based painting, and an animation system for NT.',2,'1991-01-01 00:00:00',NULL,NULL,1,'2012-10-28 12:42:26','2012-10-28 12:42:44',NULL,NULL,'discreet-logic','');
INSERT INTO `acos` VALUES (281,'Quantel',2,'',2,NULL,NULL,NULL,0,'2012-10-28 14:11:47','2012-10-28 14:11:47','','','quantel','http://www.quantel.com/');
INSERT INTO `acos` VALUES (282,'Domino',2,'This real-time, 12-bit, film-resolution compositing and effects product was first introduced from Quantel in 1993. The core Double4 workstation can be purchased separately, or (at almost $1 million) the complete proprietary hardware/software film effects system can handle everything from scanning to film out. Domino contained a full suite of advanced tools including tracking/stabilization, color correction, keying, grain tools, restoration, and wire removal. ',2,'1993-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:12:48','2012-10-28 14:13:01',NULL,NULL,'domino','');
INSERT INTO `acos` VALUES (283,'Effetto Pronto',2,'Effetto Pronto was a Quicktime based compositing tool introduced for the Mac by Videonics in 1999, and later acquired from KUB Systems in 1998. (Effetto Pronto is Italian for \"fast effects.\") It can be used in connection with the Pronto and Rapido PCI interface cards for hardware accelerated real-time, resolution-independent character generation, compositing, effects, keying, 3D DVE, and texture mapping. It has full third-party filter support for Photoshop, After Effects, and Commotion. At the time it was similar to After Effects but with true 3D space control. Discontinued in early 2000. ',2,'1999-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:15:28','2012-10-28 14:15:48',NULL,NULL,'effetto-pronto','');
INSERT INTO `acos` VALUES (284,'After Effects',2,'',2,NULL,NULL,NULL,0,'2012-10-28 14:16:42','2012-10-28 14:16:42',NULL,NULL,'after-effects',NULL);
INSERT INTO `acos` VALUES (285,'Elastic Reality',2,'The early de facto industry standard for warping and morphing effects, it also contains many other standard compositing, color correction, matting, and 2D animation tools. First developed by ASDG, which in 1994 changed its corporate name to that of its most popular product. ER was acquired in March of 1995 by Avid and was honored with a Technical Achievement Award from the Academy of Motion Picture Arts and Sciences in 1996. It was discontinued in about 2001.',2,'1994-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:17:43','2012-10-28 14:17:57',NULL,NULL,'elastic-reality','');
INSERT INTO `acos` VALUES (286,'Avid',3,'',2,NULL,NULL,NULL,0,'2012-10-28 14:18:24','2012-10-28 14:18:24',NULL,NULL,'avid',NULL);
INSERT INTO `acos` VALUES (287,'Flame',2,'First introduced in 1992, flame is Discreet Logic\'s (now Autodeskâ€™s) high-end effects and compositing package. Originally optimized for the SGI Octane platform, the cost was over $250,000. New features include a full 12-bit image format, 3D distortion tools, and a new extremely accurate tracking feature.\r\nCapabilities include real-time high-resolution playback, up to 2K resolution at 8-bit per channel color depth, true 3D object manipulating, warping and time-stretch tools, precise keying, painting, automated rotoscoping and matte generation, image processing, film grain tools, and much more. Hundreds of SPARKS third-party plug-ins are available for a wide range of additional capabilities.\r\n',2,'1992-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:19:16','2012-10-28 14:22:35',NULL,NULL,'flame','http://usa.autodesk.com/flame/');
INSERT INTO `acos` VALUES (288,'Autodesk',3,'',2,NULL,NULL,NULL,0,'2012-10-28 14:23:03','2012-10-28 14:23:03',NULL,NULL,'autodesk',NULL);
INSERT INTO `acos` VALUES (289,'Flint',2,'This was the native name for Discreet Logics\'s SGI O2-based effect compositing software. If offers real-time and resolution-independent compositing, editing, graphics, and painting.\r\nOriginally the product name for entry-level SGI workstation-based compositing software, it was marketed as effect (option 3) before being reintroduced as a new product in February 1999.\r\n',2,'1999-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:24:31','2012-10-28 14:25:45',NULL,NULL,'flint','');
INSERT INTO `acos` VALUES (290,'Fusion',2,'Professional compositing software available from eyeon Software Inc. (Toronto). First designed in 1999 in partnership with then Alias|Wavefront (when A|W was still part of SGI). ',2,'1999-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:27:35','2012-10-28 14:27:35','','','fusion','www.eyeonline.com');
INSERT INTO `acos` VALUES (291,'Illuminaire',2,'Composition and paint software tool arketed as part of the effect product for Windows 95/NT and Mac. This product featured motion tracking, keying, and 3D shadow-casting space much like flint and flame. It was acquired by Discreet Logic from Denim Software in 1998.',2,'1997-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:28:55','2012-10-28 14:28:55','','','illuminaire','');
INSERT INTO `acos` VALUES (292,'Inferno',2,'This was the top-of-the-line ($500,000) compositing and effects system from Discreet Logic (now Autodesk). Inferno offers all the basics of flame with added resolution up to 4,000 lines and a unique fully 3D compositing environment.',2,NULL,NULL,NULL,1,'2012-10-28 14:30:43','2012-10-28 14:31:58',NULL,NULL,'inferno','');
INSERT INTO `acos` VALUES (293,'Knockout',2,'This was originally a dedicated, masking, standalone software for the Mac. Originally from Ultimattte, then sold to Corel in 1999 and later available as a plugin for Photoshop and Painter.',2,'1999-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:33:02','2012-10-28 14:33:43',NULL,NULL,'knockout','');
INSERT INTO `acos` VALUES (294,'Photoshop',2,'',2,NULL,NULL,NULL,0,'2012-10-28 14:33:41','2012-10-28 14:33:41',NULL,NULL,'photoshop',NULL);
INSERT INTO `acos` VALUES (295,'Ultimatte',3,'Founded in 1976 by special effects pioneer Petro Vlahos and makers of the patented standalone color-difference extraction software. Originally developed as an analog video keying technology it initially was used extensively at Francis Ford Coppola\'s Zoetrope Studios in the early 1980s.\r\nUltimatte is available as a plug-in for just about every major compositing software package including Adobe After Effects, Avid Media Composer, Chyron Concerto, and Liberty, Discreet Logic, and Softimage D|S environments. Ultimatte Corp. also makes the Mac OS-dedicated masking software KnockOut. They are located in Chatsworth, California. \r\n',2,'1976-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:34:28','2012-10-28 14:47:02',NULL,NULL,'ultimatte','www.ultimatte.com');
INSERT INTO `acos` VALUES (296,'Media Illusion',2,'This full-featured, high-end effects and compositing software was first available from Avid for the SGI platform. Version 5.0 included the uncompressed nonlinear editing features of Media Composer and integrated Elastic Reality. ',2,NULL,NULL,NULL,1,'2012-10-28 14:36:15','2012-10-28 14:36:54',NULL,NULL,'media-illusion','');
INSERT INTO `acos` VALUES (297,'Panoptica',2,'This was a unique software product used to generate flawless background plates; to remove, add, and retouch artifacts; to reshoot scenes with a virtual camera; and to accelerate creation of complex visual effects. Originally available from the Harlequin Group which was purchased by Global Graphics in 1999.',2,'1999-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:37:45','2012-10-28 14:37:45','','','panoptica','');
INSERT INTO `acos` VALUES (298,'Primatte',2,'This was chroma keying software available as a standalone for SGI workstations or as a plug-in for Adobe After Effects, Avid, Discreet Logic, and Kinetix products. Licensed by Photron USA and available from Red Giant Software. ',2,NULL,NULL,NULL,1,'2012-10-28 14:39:12','2012-10-28 14:39:12','','','primatte','http://www.redgiantsoftware.com/');
INSERT INTO `acos` VALUES (299,'Shake',2,'Shake was a high-speed node-based compositing software optimized for large image resolutions without the need for specialized hardware. With a data-flow diagram paradigm, it ran on both NT and UNIX. Features included resolution independence and a host of real-time 2D animation and effects tools. Originally from Nothing Real, which was purchased by Apple in 2002 and made available for both Linux and for MacOSX after 2003. Apple discontinued Shake in mid-1999.',2,'1999-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:42:17','2012-10-28 14:43:14',NULL,NULL,'shake','');
INSERT INTO `acos` VALUES (300,'Petro Vlahos',1,'',2,NULL,NULL,NULL,0,'2012-10-28 14:45:03','2012-10-28 14:45:03',NULL,NULL,'petro-vlahos',NULL);
INSERT INTO `acos` VALUES (301,'Zbig Chromakey',2,'This was advanced chroma key and compositing software from Zbigniew Rybczynski. Features include automatic reflections of background objects and very fine pixel-level control of even the toughest and most unevenly lit screens. It was available as a standalone product for NT, as a plug-in for Adobe After Effects and Discreet Logic effect on Mac and NT, as a spark for other Discreet Logic products, and for Digital Fusion Eyeon software. Zbigniew licensed this software to the Ultimatte Corporation in about 2002.',2,'2002-01-01 00:00:00',NULL,NULL,1,'2012-10-28 14:49:42','2012-10-28 14:51:56',NULL,NULL,'zbig-chromakey','http://www.zbigvision.com/');
INSERT INTO `acos` VALUES (302,'Zbig Rybczynski',1,'',2,'1949-01-27 00:00:00',NULL,NULL,1,'2012-10-28 14:50:15','2012-10-28 14:55:00',NULL,NULL,'zbig-rybczynski','http://www.zbigvision.com/');
INSERT INTO `acos` VALUES (303,'rendering',2,'There are several identifiable major milestones in the refinement of creating computer-generated renderings. These can most simply be broken down into the following:\r\n1) Wireframe: The simple, vector graphic representation of polylines or surface patch geometry. No solid surface is visible at all.\r\n2) Hidden line: Visible-line determination shows only the portions of an object that face you directly.\r\n3) Surface shading: (1969) Flat shading of one color calculation per polygon. No interpolation at all.\r\n4) Gouraud: (1971) Interpolates individual pixel values from each vertex illumination value.\r\n5) (1975) Interpolates individual pixel values from the polygon surface\'s normal vectors. Creates realistic specular highlights.\r\n6) Bump mapping (1978)\r\n7) Displacement mapping (1984)\r\n8) Raytracing: (1979) Great for calculating reflections, refractions, and specular lighting.\r\n9) Radiosity: (1984) Great for rendering diffuse global illumination but not so good for specular light. A good compliment to ray tracing.\r\n',2,NULL,NULL,NULL,1,'2012-10-28 18:18:19','2012-10-28 18:18:55',NULL,NULL,'rendering','');
INSERT INTO `acos` VALUES (304,'A-buffer',2,'This is Loren Carpenter\'s further development of the Z-buffer concept in 1984 as an \"anti-aliased hidden surface method.\" The A-buffer technique was intended to overcome the main disadvantage of Catmull\'s earlier Z-buffer method, which had the tendency to produce aliasing artifacts.',2,'1984-01-01 00:00:00',NULL,NULL,1,'2012-10-28 18:19:20','2012-10-28 18:19:39',NULL,NULL,'a-buffer','');
INSERT INTO `acos` VALUES (305,'Advanced Rendering Technology (ART)',2,'ART was founded in 1995 and developed the ART AR250 raytracing chip technology that automatically calculates reflections, refractions, and soft shadows with Pixar\'s RenderMan shader library. Later operated as ARTVPS providing hardware accelerated rendering solutions for Maya, 3dsMax, VIZ and Catia, now marketed as Shaderlight .. Based in Cambridge, England. ',2,'1995-01-01 00:00:00',NULL,NULL,1,'2012-10-28 18:21:48','2012-10-28 18:24:09',NULL,NULL,'advanced-rendering-technology-art','http://www.artvps.com/');
INSERT INTO `acos` VALUES (306,'Afterburn',2,'Like Hypervoxels for LightWave users, Afterburn works with 3D Studio MAX to render realistic volumetric effects such as smoke and fire. It is particle-based with tons of fully animatable parameters, glow effects, and dynamic forces. Originally from Id8media, Inc. now Ideate, Inc. ',2,NULL,NULL,NULL,1,'2012-10-28 18:28:18','2012-10-28 18:28:46',NULL,NULL,'afterburn','http://www.ideateinc.com/');
INSERT INTO `acos` VALUES (307,'3D Studio Max',2,'',2,NULL,NULL,NULL,0,'2012-10-28 18:28:42','2012-10-28 18:28:42',NULL,NULL,'3d-studio-max',NULL);
INSERT INTO `acos` VALUES (308,'Animal Logic',3,'Animal Logic began in 1991 as a developer of several useful shader and plug-in software products such as SoftMan, a Softimage-to-RenderMan plug-in that enables both Prman and BMRT use from within Softimage; Shader Pack is a collection of mental ray shaders, and ALMB (Animal Logic Motion Blur) is an optional Eddie plug-in that offers an extremely rapid alternative to normal m-ray motion blur. Animal Logic, now a top digital production company, is located in Sydney, Australia. ',2,'1991-01-01 00:00:00',NULL,NULL,1,'2012-10-28 18:30:08','2012-10-28 18:32:36',NULL,NULL,'animal-logic','http://www.animallogic.com/');
INSERT INTO `acos` VALUES (309,'Blinn shading',2,'A shading method developed by James Blinn in 1977 that uses diffuse, specular, eccentricity, and refractive index attributes. Increased control over the specular component makes for good representation of metallic surfaces. The Blinn shading model was initially inspired by Phong\'s work at the University of Utah, and Blinn\'s desire to represent a more accurate specular lighting model. Blinn then spent many weeks researching extensively at the University library, discovering many papers dating back to the 1920s by an \"optical illumination societyâ€ and more recent work was done by Torrance and Sparrow at the University of Minnesota. However all these theories were fairly cumbersome to describe and not directly related to CG. What Blinn did was to codify the theory into a practical light reflection model that was both physically based and accurate. \r\nThe Blinn shading model was later expanded upon by Ken Torrance and Rob Cook at the University of Cornell.\r\n',2,'1997-01-01 00:00:00',NULL,NULL,1,'2012-10-28 18:33:32','2012-10-29 12:00:14',NULL,NULL,'blinn-shading','');
INSERT INTO `acos` VALUES (310,'Ken Torrance',1,'',2,'2000-01-01 00:00:00','2010-02-15 00:00:00',NULL,1,'2012-10-28 18:34:42','2012-10-28 18:38:31',NULL,NULL,'ken-torrance','');
INSERT INTO `acos` VALUES (311,'Cornell University',3,'',2,NULL,NULL,NULL,0,'2012-10-28 18:36:42','2012-10-28 18:36:42',NULL,NULL,'cornell-university',NULL);
INSERT INTO `acos` VALUES (312,'Cornell box',2,'',2,'1984-06-01 00:00:00',NULL,NULL,1,'2012-10-28 18:41:08','2012-10-28 18:43:36',NULL,NULL,'cornell-box','http://www.graphics.cornell.edu/online/box/history.html');
INSERT INTO `acos` VALUES (313,'Donald Greenberg',1,'',2,NULL,NULL,NULL,0,'2012-10-28 18:44:22','2012-10-28 18:44:22',NULL,NULL,'donald-greenberg',NULL);
INSERT INTO `acos` VALUES (314,'Blue Moon Rendering Tools ( BMRT )',2,'Blue Moon Rendering Tools was a shareware toolkit for rendering 3D images written by Larry Gritz based on his work at George Washington University. BMRT supported such features as raytracing, radiosity, and area light sources as well as more standard features such as texture and environment mapping. It was made available in 1995 for SGI, Sun SPARC, Linux, NextStep, and Windows. In 2000 Larry and several co-workers formed Exluna to replace BMRT with a new Renderman renderer called entropy. Unfortunately after some legal words with Pixar that product and the new company were discontinued in 2002. Larry has been at Nvidia for some time now developing next generation hardware rendering solutions.',2,NULL,NULL,NULL,1,'2012-10-28 18:47:17','2012-10-28 18:47:17','','','blue-moon-rendering-tools-bmrt-','');
INSERT INTO `acos` VALUES (315,'Larry Gritz',1,'',2,NULL,NULL,NULL,0,'2012-10-28 18:48:49','2012-10-28 18:48:49',NULL,NULL,'larry-gritz',NULL);
INSERT INTO `acos` VALUES (316,'Brazil r/s ',2,'From SplutterFish LLC, the Brazil rendering system is an uncompromising professional renderer for 3ds Max and Autodesk VIZ products. Utilizing advanced global illumination and raytracing techniques it is designed to be both easy to use and production friendly. As of March 2004 Brazil Rio has been made available as a free personal use edition. The brainchild of Scott Kirvan and Steven Blackmon. ',2,'2004-01-01 00:00:00',NULL,NULL,1,'2012-10-28 18:51:19','2012-10-28 18:54:27',NULL,NULL,'brazil-r-s-','www.splutterfish.com');
INSERT INTO `acos` VALUES (317,'CAPS ( Computer Animation Production System )',2,'CAPS was the Computer Animation Production System that computerizes traditional ink and paint methods and adds many multiplane animation camera techniques and effects. ',2,'1991-01-01 00:00:00',NULL,NULL,1,'2012-10-29 11:26:37','2012-10-29 11:27:21',NULL,NULL,'caps-computer-animation-production-system-','');
INSERT INTO `acos` VALUES (318,'Gouraud shading',2,'Gouraud (Ph.D., University of Utah, 1971) to add a smooth alternative to flat shading. Although it does not affect the polygonal profile of the object, it does approximate a single continuous surface for rendering purposes.',2,'1971-01-01 00:00:00',NULL,NULL,1,'2012-10-29 11:33:36','2012-10-29 11:33:53',NULL,NULL,'gouraud-shading','');
INSERT INTO `acos` VALUES (319,'hidden surface removal',2,'This is the process of determining which surfaces are visible and which are occluded, or hidden, by others closer to the camera. This also is called visible-surface determination. The self-named \"warnock recursive subdivision algorithms for hidden surface elimination\" were developed by John Warnock (Ph.D., University of Utah, 1969).',2,'1969-01-01 00:00:00',NULL,NULL,1,'2012-10-29 11:35:30','2012-10-29 11:35:30','','','hidden-surface-removal','');
INSERT INTO `acos` VALUES (320,'John Warnock',1,'',2,'1940-10-06 00:00:00',NULL,NULL,1,'2012-10-29 11:36:03','2012-10-29 11:38:39',NULL,NULL,'john-warnock','');
INSERT INTO `acos` VALUES (321,'Adobe Systems',3,'',2,NULL,NULL,NULL,0,'2012-10-29 11:37:49','2012-10-29 11:37:49',NULL,NULL,'adobe-systems',NULL);
INSERT INTO `acos` VALUES (322,'Mental Ray',2,'This professional rendering software was developed by mental images and first released commercially in 1989. First used mainly as an SGI-based alternative renderer to SoftImage\'s own output in 1993, and is now integrated with and supported by virtually all high-end animation software packages. Mental Images is located in Berlin, Germany .. having been purchased by Nvidia in 2007',2,'1989-01-01 00:00:00',NULL,NULL,1,'2012-10-29 11:56:12','2012-10-29 11:57:27',NULL,NULL,'mental-ray','http://www.mentalimages.com/');
INSERT INTO `acos` VALUES (323,'Phong shading',2,'This is a shader method developed by Bui Tuong-Phong (Ph.D., University of Utah, 1975). It introduces the specular reflection component of surfaces giving shiny highlights. It interpolates the vertex normal as opposed to the vertex intensity as in Gouraud shading. It is best for representing plastic surfaces.',2,'1975-01-01 00:00:00',NULL,NULL,1,'2012-10-29 11:59:27','2012-10-29 11:59:27','','','phong-shading','');
INSERT INTO `acos` VALUES (324,'Radiance Synthetic Imaging System',2,'The Radiance Synthetic Imaging System is UNIX freeware used for lighting design and rendering. It was developed by Greg Ward Larson at Lawrence Berkeley National Laboratory with funding from the U.S. Department of Energy and the Swiss federal government, and it is copyrighted by the Regents of the University of California.',2,NULL,NULL,NULL,1,'2012-10-29 12:04:18','2012-10-29 12:07:36',NULL,NULL,'radiance-synthetic-imaging-system','http://radsite.lbl.gov/radiance/HOME.html ');
INSERT INTO `acos` VALUES (325,'Greg Ward Larson',1,'',2,NULL,NULL,NULL,0,'2012-10-29 12:07:56','2012-10-29 12:07:56',NULL,NULL,'greg-ward-larson',NULL);
INSERT INTO `acos` VALUES (326,'Alan Kay',1,'',2,'1940-05-17 00:00:00',NULL,NULL,1,'2012-10-29 12:13:47','2012-10-29 12:16:24',NULL,NULL,'alan-kay','');
INSERT INTO `acos` VALUES (327,'RenderMan Interface Specification',2,'RenderMan is a standardized interface specification for sending modeling and animation data to a rendering system. It is not a renderer itself, as is often believed. RenderMan was developed  at Pixar in 1986, was patented in 1988, and was publicly introduced in 1989.',2,'1986-01-01 00:00:00',NULL,NULL,1,'2012-10-29 12:24:44','2012-10-29 12:29:30',NULL,NULL,'renderman','http://renderman.pixar.com');
INSERT INTO `acos` VALUES (328,'Thomas Porter',1,'',2,NULL,NULL,NULL,0,'2012-10-29 12:31:36','2012-10-29 12:31:36',NULL,NULL,'thomas-porter',NULL);
INSERT INTO `acos` VALUES (329,'Tony Apodaca',1,'',2,NULL,NULL,NULL,0,'2012-10-29 12:32:01','2012-10-29 12:32:01',NULL,NULL,'tony-apodaca',NULL);
INSERT INTO `acos` VALUES (330,'Darwyn Peachey',1,'',2,NULL,NULL,NULL,0,'2012-10-29 12:32:25','2012-10-29 12:32:25',NULL,NULL,'darwyn-peachey',NULL);
INSERT INTO `acos` VALUES (331,'REYES',2,'Named after the Pt.Reyes area of Marin but more fondly standing for \"Render Everything You Ever Saw.\" This render code was written by Loren Carpenter and Rob Cook for Lucasfilm in 1981. Much of this code found its way into Pixar\'s RenderMan renderer, Photorealistic RenderMan (PRMAN).',2,NULL,NULL,NULL,1,'2012-10-29 12:36:06','2012-10-29 12:36:06','','','reyes','');
INSERT INTO `acos` VALUES (332,'Red\'s Dream',2,'',2,'1987-04-01 00:00:00',NULL,NULL,1,'2012-10-29 12:37:29','2012-10-29 12:37:50',NULL,NULL,'reds-dream','');
INSERT INTO `acos` VALUES (333,'V-Ray',2,'',2,'2002-01-01 00:00:00',NULL,NULL,1,'2012-10-29 12:41:08','2012-10-29 12:41:08','','','v-ray','http://www.chaosgroup.com/');
INSERT INTO `acos` VALUES (334,'Z-buffer',2,'A visible-surface determination method in which each pixel records (in addition to color) its distance from the camera. As each surface is scan converted, overlapping pixels are sorted so that only the ones closest to the camera ultimately get rendered. Although this is great for optimizing reasons, it also prone is to aliasing artifacts. It was developed by Ed Catmull in 1974 at the University of Utah.',2,'1974-01-01 00:00:00',NULL,NULL,1,'2012-10-29 13:25:45','2012-10-29 13:26:23',NULL,NULL,'z-buffer','');
INSERT INTO `acos` VALUES (335,'Optomystic',3,'',2,NULL,NULL,NULL,0,'2012-10-29 15:11:10','2012-10-29 15:11:10',NULL,NULL,'optomystic',NULL);
INSERT INTO `acos` VALUES (336,'Mom',1,'ljshdfhj\r\n',2,NULL,NULL,NULL,0,'2012-12-12 13:21:45','2012-12-12 13:21:45','','','mom','');
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_stories`
--

DROP TABLE IF EXISTS `entries_stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_stories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `story_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`),
  KEY `story_id` (`story_id`),
  CONSTRAINT `entries_stories_ibfk_1` FOREIGN KEY (`story_id`) REFERENCES `stories` (`id`) ON DELETE CASCADE
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_stories`
--

LOCK TABLES `entries_stories` WRITE;
/*!40000 ALTER TABLE `entries_stories` DISABLE KEYS */;
INSERT INTO `entries_stories` VALUES (1,1,1,1);
INSERT INTO `acos` VALUES (2,2,2,2);
INSERT INTO `acos` VALUES (3,2,3,2);
INSERT INTO `acos` VALUES (4,5,4,5);
INSERT INTO `acos` VALUES (6,6,6,5);
INSERT INTO `acos` VALUES (8,7,8,5);
INSERT INTO `acos` VALUES (10,10,10,5);
INSERT INTO `acos` VALUES (11,10,11,5);
INSERT INTO `acos` VALUES (12,11,12,5);
INSERT INTO `acos` VALUES (14,12,14,4);
INSERT INTO `acos` VALUES (16,14,16,2);
INSERT INTO `acos` VALUES (17,11,17,2);
INSERT INTO `acos` VALUES (18,19,18,6);
INSERT INTO `acos` VALUES (19,11,19,2);
INSERT INTO `acos` VALUES (20,22,20,2);
INSERT INTO `acos` VALUES (21,24,21,2);
INSERT INTO `acos` VALUES (22,25,22,2);
INSERT INTO `acos` VALUES (25,21,25,6);
INSERT INTO `acos` VALUES (26,29,26,5);
INSERT INTO `acos` VALUES (27,29,27,5);
INSERT INTO `acos` VALUES (28,32,28,6);
INSERT INTO `acos` VALUES (30,34,30,3);
INSERT INTO `acos` VALUES (31,12,31,4);
INSERT INTO `acos` VALUES (32,1,32,4);
INSERT INTO `acos` VALUES (33,12,33,4);
INSERT INTO `acos` VALUES (34,36,34,4);
INSERT INTO `acos` VALUES (35,34,35,4);
INSERT INTO `acos` VALUES (36,34,36,4);
INSERT INTO `acos` VALUES (37,34,37,3);
INSERT INTO `acos` VALUES (38,4,38,4);
INSERT INTO `acos` VALUES (39,40,39,2);
INSERT INTO `acos` VALUES (40,40,40,2);
INSERT INTO `acos` VALUES (41,40,41,2);
INSERT INTO `acos` VALUES (42,40,42,2);
INSERT INTO `acos` VALUES (43,43,43,2);
INSERT INTO `acos` VALUES (44,43,44,2);
INSERT INTO `acos` VALUES (45,47,45,2);
INSERT INTO `acos` VALUES (46,48,46,2);
INSERT INTO `acos` VALUES (47,52,47,2);
INSERT INTO `acos` VALUES (48,56,48,2);
INSERT INTO `acos` VALUES (49,58,49,2);
INSERT INTO `acos` VALUES (50,58,50,2);
INSERT INTO `acos` VALUES (51,63,51,2);
INSERT INTO `acos` VALUES (52,65,52,2);
INSERT INTO `acos` VALUES (53,65,53,2);
INSERT INTO `acos` VALUES (54,65,54,2);
INSERT INTO `acos` VALUES (55,72,55,2);
INSERT INTO `acos` VALUES (56,77,56,2);
INSERT INTO `acos` VALUES (57,77,57,2);
INSERT INTO `acos` VALUES (58,77,58,2);
INSERT INTO `acos` VALUES (59,90,59,2);
INSERT INTO `acos` VALUES (60,90,60,2);
INSERT INTO `acos` VALUES (61,93,61,2);
INSERT INTO `acos` VALUES (62,95,62,2);
INSERT INTO `acos` VALUES (63,98,63,2);
INSERT INTO `acos` VALUES (64,98,64,2);
INSERT INTO `acos` VALUES (65,104,65,2);
INSERT INTO `acos` VALUES (66,104,66,2);
INSERT INTO `acos` VALUES (67,104,67,2);
INSERT INTO `acos` VALUES (68,104,68,2);
INSERT INTO `acos` VALUES (69,104,69,2);
INSERT INTO `acos` VALUES (70,104,70,2);
INSERT INTO `acos` VALUES (71,113,71,2);
INSERT INTO `acos` VALUES (72,114,72,2);
INSERT INTO `acos` VALUES (73,114,73,2);
INSERT INTO `acos` VALUES (74,114,74,2);
INSERT INTO `acos` VALUES (75,114,75,2);
INSERT INTO `acos` VALUES (76,114,76,2);
INSERT INTO `acos` VALUES (77,114,77,2);
INSERT INTO `acos` VALUES (78,119,78,2);
INSERT INTO `acos` VALUES (79,122,79,2);
INSERT INTO `acos` VALUES (80,127,80,2);
INSERT INTO `acos` VALUES (81,127,81,2);
INSERT INTO `acos` VALUES (82,127,82,2);
INSERT INTO `acos` VALUES (83,127,83,2);
INSERT INTO `acos` VALUES (84,127,84,2);
INSERT INTO `acos` VALUES (85,22,85,2);
INSERT INTO `acos` VALUES (86,22,86,2);
INSERT INTO `acos` VALUES (87,22,87,2);
INSERT INTO `acos` VALUES (88,135,88,2);
INSERT INTO `acos` VALUES (89,135,89,2);
INSERT INTO `acos` VALUES (90,135,90,2);
INSERT INTO `acos` VALUES (91,135,91,2);
INSERT INTO `acos` VALUES (92,135,92,2);
INSERT INTO `acos` VALUES (93,135,93,2);
INSERT INTO `acos` VALUES (94,135,94,2);
INSERT INTO `acos` VALUES (95,135,95,2);
INSERT INTO `acos` VALUES (96,135,96,2);
INSERT INTO `acos` VALUES (97,135,97,2);
INSERT INTO `acos` VALUES (98,137,98,2);
INSERT INTO `acos` VALUES (99,137,99,2);
INSERT INTO `acos` VALUES (100,137,100,2);
INSERT INTO `acos` VALUES (101,137,101,2);
INSERT INTO `acos` VALUES (102,139,102,2);
INSERT INTO `acos` VALUES (103,139,103,2);
INSERT INTO `acos` VALUES (104,139,104,2);
INSERT INTO `acos` VALUES (105,139,105,2);
INSERT INTO `acos` VALUES (106,139,106,2);
INSERT INTO `acos` VALUES (107,144,107,2);
INSERT INTO `acos` VALUES (108,144,108,2);
INSERT INTO `acos` VALUES (109,144,109,2);
INSERT INTO `acos` VALUES (110,144,110,2);
INSERT INTO `acos` VALUES (111,144,111,2);
INSERT INTO `acos` VALUES (112,147,112,2);
INSERT INTO `acos` VALUES (113,147,113,2);
INSERT INTO `acos` VALUES (114,147,114,2);
INSERT INTO `acos` VALUES (115,150,115,2);
INSERT INTO `acos` VALUES (116,153,116,2);
INSERT INTO `acos` VALUES (117,153,117,2);
INSERT INTO `acos` VALUES (118,155,118,2);
INSERT INTO `acos` VALUES (119,155,119,2);
INSERT INTO `acos` VALUES (120,155,120,2);
INSERT INTO `acos` VALUES (121,160,121,2);
INSERT INTO `acos` VALUES (122,155,122,2);
INSERT INTO `acos` VALUES (123,155,123,2);
INSERT INTO `acos` VALUES (124,155,124,2);
INSERT INTO `acos` VALUES (125,155,125,2);
INSERT INTO `acos` VALUES (126,155,126,2);
INSERT INTO `acos` VALUES (127,155,127,2);
INSERT INTO `acos` VALUES (128,155,128,2);
INSERT INTO `acos` VALUES (129,155,129,2);
INSERT INTO `acos` VALUES (130,166,130,2);
INSERT INTO `acos` VALUES (131,167,131,2);
INSERT INTO `acos` VALUES (132,167,132,2);
INSERT INTO `acos` VALUES (133,167,133,2);
INSERT INTO `acos` VALUES (134,167,134,2);
INSERT INTO `acos` VALUES (135,167,135,2);
INSERT INTO `acos` VALUES (136,167,136,2);
INSERT INTO `acos` VALUES (137,167,137,2);
INSERT INTO `acos` VALUES (138,167,138,2);
INSERT INTO `acos` VALUES (139,167,139,2);
INSERT INTO `acos` VALUES (140,167,140,2);
INSERT INTO `acos` VALUES (141,167,141,2);
INSERT INTO `acos` VALUES (142,168,142,2);
INSERT INTO `acos` VALUES (143,171,143,2);
INSERT INTO `acos` VALUES (144,171,144,2);
INSERT INTO `acos` VALUES (145,171,145,2);
INSERT INTO `acos` VALUES (146,171,146,2);
INSERT INTO `acos` VALUES (147,171,147,2);
INSERT INTO `acos` VALUES (148,171,148,2);
INSERT INTO `acos` VALUES (149,171,149,2);
INSERT INTO `acos` VALUES (150,175,150,2);
INSERT INTO `acos` VALUES (151,177,151,2);
INSERT INTO `acos` VALUES (152,175,152,2);
INSERT INTO `acos` VALUES (153,166,153,2);
INSERT INTO `acos` VALUES (154,166,154,2);
INSERT INTO `acos` VALUES (155,166,155,2);
INSERT INTO `acos` VALUES (156,166,156,2);
INSERT INTO `acos` VALUES (157,182,157,2);
INSERT INTO `acos` VALUES (158,182,158,2);
INSERT INTO `acos` VALUES (159,182,159,2);
INSERT INTO `acos` VALUES (160,182,160,2);
INSERT INTO `acos` VALUES (161,182,161,2);
INSERT INTO `acos` VALUES (162,88,162,2);
INSERT INTO `acos` VALUES (163,185,163,2);
INSERT INTO `acos` VALUES (164,185,164,2);
INSERT INTO `acos` VALUES (165,185,165,2);
INSERT INTO `acos` VALUES (166,185,166,2);
INSERT INTO `acos` VALUES (167,185,167,2);
INSERT INTO `acos` VALUES (168,185,168,2);
INSERT INTO `acos` VALUES (169,185,169,2);
INSERT INTO `acos` VALUES (170,185,170,2);
INSERT INTO `acos` VALUES (171,30,171,2);
INSERT INTO `acos` VALUES (172,30,172,2);
INSERT INTO `acos` VALUES (173,30,173,2);
INSERT INTO `acos` VALUES (174,30,174,2);
INSERT INTO `acos` VALUES (175,30,175,2);
INSERT INTO `acos` VALUES (176,30,176,2);
INSERT INTO `acos` VALUES (177,30,177,2);
INSERT INTO `acos` VALUES (178,30,178,2);
INSERT INTO `acos` VALUES (179,30,179,2);
INSERT INTO `acos` VALUES (180,30,180,2);
INSERT INTO `acos` VALUES (181,30,181,2);
INSERT INTO `acos` VALUES (182,6,182,2);
INSERT INTO `acos` VALUES (183,6,183,2);
INSERT INTO `acos` VALUES (184,6,184,2);
INSERT INTO `acos` VALUES (185,6,185,2);
INSERT INTO `acos` VALUES (186,6,186,2);
INSERT INTO `acos` VALUES (187,6,187,2);
INSERT INTO `acos` VALUES (188,6,188,2);
INSERT INTO `acos` VALUES (189,6,189,2);
INSERT INTO `acos` VALUES (190,6,190,2);
INSERT INTO `acos` VALUES (191,201,191,2);
INSERT INTO `acos` VALUES (192,201,192,2);
INSERT INTO `acos` VALUES (193,201,193,2);
INSERT INTO `acos` VALUES (194,201,194,2);
INSERT INTO `acos` VALUES (195,202,195,2);
INSERT INTO `acos` VALUES (196,204,196,2);
INSERT INTO `acos` VALUES (197,204,197,2);
INSERT INTO `acos` VALUES (198,204,198,2);
INSERT INTO `acos` VALUES (199,204,199,2);
INSERT INTO `acos` VALUES (200,204,200,2);
INSERT INTO `acos` VALUES (201,207,201,2);
INSERT INTO `acos` VALUES (202,207,202,2);
INSERT INTO `acos` VALUES (203,207,203,2);
INSERT INTO `acos` VALUES (204,207,204,2);
INSERT INTO `acos` VALUES (205,207,205,2);
INSERT INTO `acos` VALUES (206,207,206,2);
INSERT INTO `acos` VALUES (207,207,207,2);
INSERT INTO `acos` VALUES (208,207,208,2);
INSERT INTO `acos` VALUES (209,207,209,2);
INSERT INTO `acos` VALUES (210,213,210,2);
INSERT INTO `acos` VALUES (211,220,211,2);
INSERT INTO `acos` VALUES (212,220,212,2);
INSERT INTO `acos` VALUES (213,220,213,2);
INSERT INTO `acos` VALUES (214,220,214,2);
INSERT INTO `acos` VALUES (215,188,215,2);
INSERT INTO `acos` VALUES (216,224,216,2);
INSERT INTO `acos` VALUES (217,224,217,2);
INSERT INTO `acos` VALUES (218,64,218,2);
INSERT INTO `acos` VALUES (219,225,219,2);
INSERT INTO `acos` VALUES (220,225,220,2);
INSERT INTO `acos` VALUES (221,123,221,2);
INSERT INTO `acos` VALUES (222,123,222,2);
INSERT INTO `acos` VALUES (223,124,223,2);
INSERT INTO `acos` VALUES (224,124,224,2);
INSERT INTO `acos` VALUES (225,124,225,2);
INSERT INTO `acos` VALUES (226,229,226,2);
INSERT INTO `acos` VALUES (227,229,227,2);
INSERT INTO `acos` VALUES (228,229,228,2);
INSERT INTO `acos` VALUES (229,229,229,2);
INSERT INTO `acos` VALUES (230,229,230,2);
INSERT INTO `acos` VALUES (231,229,231,2);
INSERT INTO `acos` VALUES (232,229,232,2);
INSERT INTO `acos` VALUES (233,234,233,2);
INSERT INTO `acos` VALUES (234,234,234,2);
INSERT INTO `acos` VALUES (235,236,235,2);
INSERT INTO `acos` VALUES (236,238,236,2);
INSERT INTO `acos` VALUES (237,238,237,2);
INSERT INTO `acos` VALUES (238,239,238,2);
INSERT INTO `acos` VALUES (239,239,239,2);
INSERT INTO `acos` VALUES (240,239,240,2);
INSERT INTO `acos` VALUES (241,239,241,2);
INSERT INTO `acos` VALUES (242,240,242,2);
INSERT INTO `acos` VALUES (243,240,243,2);
INSERT INTO `acos` VALUES (244,240,244,2);
INSERT INTO `acos` VALUES (245,242,245,2);
INSERT INTO `acos` VALUES (246,242,246,2);
INSERT INTO `acos` VALUES (247,242,247,2);
INSERT INTO `acos` VALUES (248,242,248,2);
INSERT INTO `acos` VALUES (249,246,249,2);
INSERT INTO `acos` VALUES (250,246,250,2);
INSERT INTO `acos` VALUES (251,246,251,2);
INSERT INTO `acos` VALUES (252,246,252,2);
INSERT INTO `acos` VALUES (253,246,253,2);
INSERT INTO `acos` VALUES (254,246,254,2);
INSERT INTO `acos` VALUES (255,246,255,2);
INSERT INTO `acos` VALUES (256,246,256,2);
INSERT INTO `acos` VALUES (257,246,257,2);
INSERT INTO `acos` VALUES (258,246,258,2);
INSERT INTO `acos` VALUES (259,248,259,2);
INSERT INTO `acos` VALUES (260,248,260,2);
INSERT INTO `acos` VALUES (261,248,261,2);
INSERT INTO `acos` VALUES (262,248,262,2);
INSERT INTO `acos` VALUES (263,248,263,2);
INSERT INTO `acos` VALUES (264,249,264,2);
INSERT INTO `acos` VALUES (265,249,265,2);
INSERT INTO `acos` VALUES (266,205,266,2);
INSERT INTO `acos` VALUES (267,205,267,2);
INSERT INTO `acos` VALUES (268,205,268,2);
INSERT INTO `acos` VALUES (269,205,269,2);
INSERT INTO `acos` VALUES (270,205,270,2);
INSERT INTO `acos` VALUES (271,203,271,2);
INSERT INTO `acos` VALUES (272,203,272,2);
INSERT INTO `acos` VALUES (273,203,273,2);
INSERT INTO `acos` VALUES (274,203,274,2);
INSERT INTO `acos` VALUES (275,203,275,2);
INSERT INTO `acos` VALUES (276,203,276,2);
INSERT INTO `acos` VALUES (277,203,277,2);
INSERT INTO `acos` VALUES (278,203,278,2);
INSERT INTO `acos` VALUES (279,203,279,2);
INSERT INTO `acos` VALUES (280,203,280,2);
INSERT INTO `acos` VALUES (281,203,281,2);
INSERT INTO `acos` VALUES (282,252,282,2);
INSERT INTO `acos` VALUES (283,252,283,2);
INSERT INTO `acos` VALUES (285,253,285,2);
INSERT INTO `acos` VALUES (286,254,286,2);
INSERT INTO `acos` VALUES (287,254,287,2);
INSERT INTO `acos` VALUES (288,245,288,2);
INSERT INTO `acos` VALUES (289,258,289,2);
INSERT INTO `acos` VALUES (290,259,290,2);
INSERT INTO `acos` VALUES (291,259,291,2);
INSERT INTO `acos` VALUES (292,259,292,2);
INSERT INTO `acos` VALUES (293,259,293,2);
INSERT INTO `acos` VALUES (294,259,294,2);
INSERT INTO `acos` VALUES (295,259,295,2);
INSERT INTO `acos` VALUES (296,259,296,2);
INSERT INTO `acos` VALUES (297,46,297,2);
INSERT INTO `acos` VALUES (298,46,298,2);
INSERT INTO `acos` VALUES (299,46,299,2);
INSERT INTO `acos` VALUES (300,265,300,2);
INSERT INTO `acos` VALUES (301,46,301,2);
INSERT INTO `acos` VALUES (302,46,302,2);
INSERT INTO `acos` VALUES (303,267,303,2);
INSERT INTO `acos` VALUES (304,268,304,2);
INSERT INTO `acos` VALUES (305,268,305,2);
INSERT INTO `acos` VALUES (306,185,306,2);
INSERT INTO `acos` VALUES (307,129,307,2);
INSERT INTO `acos` VALUES (308,269,308,2);
INSERT INTO `acos` VALUES (309,269,309,2);
INSERT INTO `acos` VALUES (310,269,310,2);
INSERT INTO `acos` VALUES (311,269,311,2);
INSERT INTO `acos` VALUES (312,269,312,2);
INSERT INTO `acos` VALUES (313,269,313,2);
INSERT INTO `acos` VALUES (314,269,314,2);
INSERT INTO `acos` VALUES (315,270,315,2);
INSERT INTO `acos` VALUES (316,173,316,2);
INSERT INTO `acos` VALUES (317,280,317,2);
INSERT INTO `acos` VALUES (318,280,318,2);
INSERT INTO `acos` VALUES (319,295,319,2);
INSERT INTO `acos` VALUES (320,302,320,2);
INSERT INTO `acos` VALUES (321,310,321,2);
INSERT INTO `acos` VALUES (322,310,322,2);
INSERT INTO `acos` VALUES (323,312,323,2);
INSERT INTO `acos` VALUES (324,316,324,2);
INSERT INTO `acos` VALUES (325,317,325,2);
INSERT INTO `acos` VALUES (326,317,326,2);
INSERT INTO `acos` VALUES (327,317,327,2);
INSERT INTO `acos` VALUES (328,320,328,2);
INSERT INTO `acos` VALUES (329,326,329,2);
INSERT INTO `acos` VALUES (330,327,330,2);
INSERT INTO `acos` VALUES (331,327,331,2);
INSERT INTO `acos` VALUES (332,332,332,2);
/*!40000 ALTER TABLE `entries_stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_tags`
--

DROP TABLE IF EXISTS `entries_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entries_tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `entry_id` int(11) unsigned NOT NULL,
  `tag_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tag_id` (`tag_id`),
  KEY `entry_id` (`entry_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_tags`
--

LOCK TABLES `entries_tags` WRITE;
/*!40000 ALTER TABLE `entries_tags` DISABLE KEYS */;
INSERT INTO `entries_tags` VALUES (18,5,9);
INSERT INTO `acos` VALUES (19,5,10);
INSERT INTO `acos` VALUES (36,8,16);
INSERT INTO `acos` VALUES (37,8,11);
INSERT INTO `acos` VALUES (38,8,17);
INSERT INTO `acos` VALUES (39,8,18);
INSERT INTO `acos` VALUES (41,7,14);
INSERT INTO `acos` VALUES (42,7,15);
INSERT INTO `acos` VALUES (43,7,19);
INSERT INTO `acos` VALUES (45,9,19);
INSERT INTO `acos` VALUES (50,10,20);
INSERT INTO `acos` VALUES (51,10,21);
INSERT INTO `acos` VALUES (66,13,26);
INSERT INTO `acos` VALUES (67,13,27);
INSERT INTO `acos` VALUES (70,15,30);
INSERT INTO `acos` VALUES (71,15,31);
INSERT INTO `acos` VALUES (72,16,32);
INSERT INTO `acos` VALUES (73,17,30);
INSERT INTO `acos` VALUES (74,17,31);
INSERT INTO `acos` VALUES (75,17,33);
INSERT INTO `acos` VALUES (76,18,30);
INSERT INTO `acos` VALUES (77,18,31);
INSERT INTO `acos` VALUES (78,18,33);
INSERT INTO `acos` VALUES (81,19,34);
INSERT INTO `acos` VALUES (82,19,35);
INSERT INTO `acos` VALUES (83,20,30);
INSERT INTO `acos` VALUES (84,20,31);
INSERT INTO `acos` VALUES (85,21,30);
INSERT INTO `acos` VALUES (86,21,31);
INSERT INTO `acos` VALUES (87,22,31);
INSERT INTO `acos` VALUES (88,22,36);
INSERT INTO `acos` VALUES (95,23,37);
INSERT INTO `acos` VALUES (96,23,38);
INSERT INTO `acos` VALUES (117,3,7);
INSERT INTO `acos` VALUES (118,3,8);
INSERT INTO `acos` VALUES (121,24,5);
INSERT INTO `acos` VALUES (122,24,38);
INSERT INTO `acos` VALUES (131,25,39);
INSERT INTO `acos` VALUES (132,25,19);
INSERT INTO `acos` VALUES (133,26,40);
INSERT INTO `acos` VALUES (149,1,1);
INSERT INTO `acos` VALUES (150,1,2);
INSERT INTO `acos` VALUES (151,1,3);
INSERT INTO `acos` VALUES (154,28,32);
INSERT INTO `acos` VALUES (166,31,47);
INSERT INTO `acos` VALUES (167,31,25);
INSERT INTO `acos` VALUES (168,31,48);
INSERT INTO `acos` VALUES (169,32,49);
INSERT INTO `acos` VALUES (170,32,50);
INSERT INTO `acos` VALUES (174,33,51);
INSERT INTO `acos` VALUES (175,33,22);
INSERT INTO `acos` VALUES (176,33,52);
INSERT INTO `acos` VALUES (183,11,10);
INSERT INTO `acos` VALUES (184,11,9);
INSERT INTO `acos` VALUES (199,35,11);
INSERT INTO `acos` VALUES (200,35,9);
INSERT INTO `acos` VALUES (201,35,53);
INSERT INTO `acos` VALUES (202,12,22);
INSERT INTO `acos` VALUES (203,12,23);
INSERT INTO `acos` VALUES (204,12,24);
INSERT INTO `acos` VALUES (205,12,25);
INSERT INTO `acos` VALUES (208,37,32);
INSERT INTO `acos` VALUES (209,36,54);
INSERT INTO `acos` VALUES (210,36,55);
INSERT INTO `acos` VALUES (211,34,47);
INSERT INTO `acos` VALUES (212,34,24);
INSERT INTO `acos` VALUES (213,4,7);
INSERT INTO `acos` VALUES (214,4,8);
INSERT INTO `acos` VALUES (215,38,52);
INSERT INTO `acos` VALUES (216,39,6);
INSERT INTO `acos` VALUES (220,40,56);
INSERT INTO `acos` VALUES (221,40,31);
INSERT INTO `acos` VALUES (222,40,57);
INSERT INTO `acos` VALUES (223,41,57);
INSERT INTO `acos` VALUES (224,41,31);
INSERT INTO `acos` VALUES (225,42,57);
INSERT INTO `acos` VALUES (226,42,3);
INSERT INTO `acos` VALUES (227,42,58);
INSERT INTO `acos` VALUES (229,44,60);
INSERT INTO `acos` VALUES (230,44,61);
INSERT INTO `acos` VALUES (231,43,59);
INSERT INTO `acos` VALUES (233,45,59);
INSERT INTO `acos` VALUES (244,47,59);
INSERT INTO `acos` VALUES (245,47,63);
INSERT INTO `acos` VALUES (247,49,62);
INSERT INTO `acos` VALUES (248,50,31);
INSERT INTO `acos` VALUES (249,51,31);
INSERT INTO `acos` VALUES (250,51,34);
INSERT INTO `acos` VALUES (251,48,31);
INSERT INTO `acos` VALUES (253,52,31);
INSERT INTO `acos` VALUES (254,53,31);
INSERT INTO `acos` VALUES (255,53,62);
INSERT INTO `acos` VALUES (258,54,64);
INSERT INTO `acos` VALUES (259,54,31);
INSERT INTO `acos` VALUES (261,55,31);
INSERT INTO `acos` VALUES (263,56,32);
INSERT INTO `acos` VALUES (264,56,31);
INSERT INTO `acos` VALUES (265,57,65);
INSERT INTO `acos` VALUES (268,59,66);
INSERT INTO `acos` VALUES (269,59,62);
INSERT INTO `acos` VALUES (270,60,67);
INSERT INTO `acos` VALUES (271,61,56);
INSERT INTO `acos` VALUES (272,62,31);
INSERT INTO `acos` VALUES (273,62,68);
INSERT INTO `acos` VALUES (274,58,31);
INSERT INTO `acos` VALUES (275,58,68);
INSERT INTO `acos` VALUES (278,63,62);
INSERT INTO `acos` VALUES (281,66,68);
INSERT INTO `acos` VALUES (282,67,68);
INSERT INTO `acos` VALUES (283,68,68);
INSERT INTO `acos` VALUES (285,65,68);
INSERT INTO `acos` VALUES (288,70,62);
INSERT INTO `acos` VALUES (289,71,60);
INSERT INTO `acos` VALUES (290,69,19);
INSERT INTO `acos` VALUES (291,69,70);
INSERT INTO `acos` VALUES (293,72,71);
INSERT INTO `acos` VALUES (294,73,71);
INSERT INTO `acos` VALUES (295,74,71);
INSERT INTO `acos` VALUES (296,75,71);
INSERT INTO `acos` VALUES (297,76,71);
INSERT INTO `acos` VALUES (300,79,72);
INSERT INTO `acos` VALUES (301,80,31);
INSERT INTO `acos` VALUES (302,77,31);
INSERT INTO `acos` VALUES (305,82,73);
INSERT INTO `acos` VALUES (307,83,56);
INSERT INTO `acos` VALUES (308,84,60);
INSERT INTO `acos` VALUES (309,85,74);
INSERT INTO `acos` VALUES (310,86,31);
INSERT INTO `acos` VALUES (311,87,56);
INSERT INTO `acos` VALUES (313,89,75);
INSERT INTO `acos` VALUES (314,89,76);
INSERT INTO `acos` VALUES (316,91,73);
INSERT INTO `acos` VALUES (317,92,77);
INSERT INTO `acos` VALUES (318,92,73);
INSERT INTO `acos` VALUES (319,90,31);
INSERT INTO `acos` VALUES (321,94,77);
INSERT INTO `acos` VALUES (322,93,62);
INSERT INTO `acos` VALUES (325,96,77);
INSERT INTO `acos` VALUES (326,97,77);
INSERT INTO `acos` VALUES (327,95,78);
INSERT INTO `acos` VALUES (328,95,31);
INSERT INTO `acos` VALUES (330,99,77);
INSERT INTO `acos` VALUES (331,100,79);
INSERT INTO `acos` VALUES (332,101,60);
INSERT INTO `acos` VALUES (333,102,34);
INSERT INTO `acos` VALUES (334,103,34);
INSERT INTO `acos` VALUES (335,98,68);
INSERT INTO `acos` VALUES (337,104,70);
INSERT INTO `acos` VALUES (340,107,31);
INSERT INTO `acos` VALUES (341,107,80);
INSERT INTO `acos` VALUES (342,108,81);
INSERT INTO `acos` VALUES (343,109,60);
INSERT INTO `acos` VALUES (344,110,80);
INSERT INTO `acos` VALUES (345,111,80);
INSERT INTO `acos` VALUES (346,112,82);
INSERT INTO `acos` VALUES (351,113,83);
INSERT INTO `acos` VALUES (352,113,84);
INSERT INTO `acos` VALUES (353,78,65);
INSERT INTO `acos` VALUES (355,115,68);
INSERT INTO `acos` VALUES (356,115,73);
INSERT INTO `acos` VALUES (357,116,68);
INSERT INTO `acos` VALUES (358,116,85);
INSERT INTO `acos` VALUES (359,117,60);
INSERT INTO `acos` VALUES (360,118,3);
INSERT INTO `acos` VALUES (362,114,68);
INSERT INTO `acos` VALUES (364,120,77);
INSERT INTO `acos` VALUES (365,120,73);
INSERT INTO `acos` VALUES (366,121,77);
INSERT INTO `acos` VALUES (367,121,73);
INSERT INTO `acos` VALUES (369,119,86);
INSERT INTO `acos` VALUES (375,122,64);
INSERT INTO `acos` VALUES (377,125,31);
INSERT INTO `acos` VALUES (378,126,77);
INSERT INTO `acos` VALUES (379,126,73);
INSERT INTO `acos` VALUES (381,128,71);
INSERT INTO `acos` VALUES (382,128,72);
INSERT INTO `acos` VALUES (386,130,71);
INSERT INTO `acos` VALUES (387,130,89);
INSERT INTO `acos` VALUES (388,131,89);
INSERT INTO `acos` VALUES (389,132,90);
INSERT INTO `acos` VALUES (390,133,90);
INSERT INTO `acos` VALUES (392,127,88);
INSERT INTO `acos` VALUES (393,134,60);
INSERT INTO `acos` VALUES (396,136,77);
INSERT INTO `acos` VALUES (397,135,78);
INSERT INTO `acos` VALUES (400,137,91);
INSERT INTO `acos` VALUES (401,138,92);
INSERT INTO `acos` VALUES (403,140,93);
INSERT INTO `acos` VALUES (406,141,73);
INSERT INTO `acos` VALUES (407,142,5);
INSERT INTO `acos` VALUES (408,143,3);
INSERT INTO `acos` VALUES (409,143,77);
INSERT INTO `acos` VALUES (410,139,93);
INSERT INTO `acos` VALUES (413,145,73);
INSERT INTO `acos` VALUES (414,145,78);
INSERT INTO `acos` VALUES (415,146,73);
INSERT INTO `acos` VALUES (417,144,31);
INSERT INTO `acos` VALUES (419,147,94);
INSERT INTO `acos` VALUES (422,148,82);
INSERT INTO `acos` VALUES (423,149,92);
INSERT INTO `acos` VALUES (424,149,77);
INSERT INTO `acos` VALUES (426,150,91);
INSERT INTO `acos` VALUES (427,151,73);
INSERT INTO `acos` VALUES (428,151,77);
INSERT INTO `acos` VALUES (429,152,73);
INSERT INTO `acos` VALUES (431,153,78);
INSERT INTO `acos` VALUES (440,154,73);
INSERT INTO `acos` VALUES (441,154,77);
INSERT INTO `acos` VALUES (443,155,78);
INSERT INTO `acos` VALUES (444,156,73);
INSERT INTO `acos` VALUES (445,157,3);
INSERT INTO `acos` VALUES (446,157,77);
INSERT INTO `acos` VALUES (447,158,77);
INSERT INTO `acos` VALUES (448,158,3);
INSERT INTO `acos` VALUES (455,159,77);
INSERT INTO `acos` VALUES (456,159,3);
INSERT INTO `acos` VALUES (458,160,31);
INSERT INTO `acos` VALUES (459,161,77);
INSERT INTO `acos` VALUES (460,161,89);
INSERT INTO `acos` VALUES (461,162,77);
INSERT INTO `acos` VALUES (462,162,3);
INSERT INTO `acos` VALUES (463,163,77);
INSERT INTO `acos` VALUES (464,164,77);
INSERT INTO `acos` VALUES (465,165,95);
INSERT INTO `acos` VALUES (466,165,77);
INSERT INTO `acos` VALUES (469,166,56);
INSERT INTO `acos` VALUES (472,167,31);
INSERT INTO `acos` VALUES (474,168,5);
INSERT INTO `acos` VALUES (476,169,96);
INSERT INTO `acos` VALUES (477,170,61);
INSERT INTO `acos` VALUES (479,171,96);
INSERT INTO `acos` VALUES (480,172,3);
INSERT INTO `acos` VALUES (481,172,77);
INSERT INTO `acos` VALUES (484,174,95);
INSERT INTO `acos` VALUES (485,174,77);
INSERT INTO `acos` VALUES (487,176,77);
INSERT INTO `acos` VALUES (488,175,77);
INSERT INTO `acos` VALUES (490,177,31);
INSERT INTO `acos` VALUES (491,2,4);
INSERT INTO `acos` VALUES (492,2,5);
INSERT INTO `acos` VALUES (493,2,6);
INSERT INTO `acos` VALUES (494,178,92);
INSERT INTO `acos` VALUES (495,178,58);
INSERT INTO `acos` VALUES (496,178,77);
INSERT INTO `acos` VALUES (497,179,77);
INSERT INTO `acos` VALUES (498,180,73);
INSERT INTO `acos` VALUES (499,180,77);
INSERT INTO `acos` VALUES (500,181,73);
INSERT INTO `acos` VALUES (501,181,77);
INSERT INTO `acos` VALUES (504,183,3);
INSERT INTO `acos` VALUES (505,183,77);
INSERT INTO `acos` VALUES (508,182,96);
INSERT INTO `acos` VALUES (509,182,62);
INSERT INTO `acos` VALUES (516,184,31);
INSERT INTO `acos` VALUES (517,184,62);
INSERT INTO `acos` VALUES (518,184,96);
INSERT INTO `acos` VALUES (520,88,72);
INSERT INTO `acos` VALUES (525,186,70);
INSERT INTO `acos` VALUES (526,187,77);
INSERT INTO `acos` VALUES (532,185,31);
INSERT INTO `acos` VALUES (533,185,70);
INSERT INTO `acos` VALUES (538,189,77);
INSERT INTO `acos` VALUES (539,190,77);
INSERT INTO `acos` VALUES (540,191,5);
INSERT INTO `acos` VALUES (541,192,77);
INSERT INTO `acos` VALUES (542,193,73);
INSERT INTO `acos` VALUES (543,193,77);
INSERT INTO `acos` VALUES (544,194,73);
INSERT INTO `acos` VALUES (545,194,77);
INSERT INTO `acos` VALUES (546,195,73);
INSERT INTO `acos` VALUES (547,195,77);
INSERT INTO `acos` VALUES (548,30,45);
INSERT INTO `acos` VALUES (549,30,46);
INSERT INTO `acos` VALUES (550,29,42);
INSERT INTO `acos` VALUES (551,29,43);
INSERT INTO `acos` VALUES (552,29,44);
INSERT INTO `acos` VALUES (556,196,73);
INSERT INTO `acos` VALUES (557,196,40);
INSERT INTO `acos` VALUES (558,197,73);
INSERT INTO `acos` VALUES (559,197,3);
INSERT INTO `acos` VALUES (560,198,3);
INSERT INTO `acos` VALUES (561,199,73);
INSERT INTO `acos` VALUES (562,6,11);
INSERT INTO `acos` VALUES (563,6,12);
INSERT INTO `acos` VALUES (564,6,13);
INSERT INTO `acos` VALUES (565,200,77);
INSERT INTO `acos` VALUES (567,201,31);
INSERT INTO `acos` VALUES (568,81,31);
INSERT INTO `acos` VALUES (573,202,77);
INSERT INTO `acos` VALUES (576,204,70);
INSERT INTO `acos` VALUES (577,204,31);
INSERT INTO `acos` VALUES (579,206,73);
INSERT INTO `acos` VALUES (580,206,77);
INSERT INTO `acos` VALUES (583,208,73);
INSERT INTO `acos` VALUES (584,208,77);
INSERT INTO `acos` VALUES (585,209,73);
INSERT INTO `acos` VALUES (586,209,77);
INSERT INTO `acos` VALUES (588,207,70);
INSERT INTO `acos` VALUES (589,210,77);
INSERT INTO `acos` VALUES (590,211,77);
INSERT INTO `acos` VALUES (591,212,56);
INSERT INTO `acos` VALUES (596,214,61);
INSERT INTO `acos` VALUES (597,215,70);
INSERT INTO `acos` VALUES (598,216,77);
INSERT INTO `acos` VALUES (599,217,77);
INSERT INTO `acos` VALUES (600,218,77);
INSERT INTO `acos` VALUES (601,219,30);
INSERT INTO `acos` VALUES (602,213,97);
INSERT INTO `acos` VALUES (603,213,70);
INSERT INTO `acos` VALUES (616,221,92);
INSERT INTO `acos` VALUES (617,221,77);
INSERT INTO `acos` VALUES (618,220,30);
INSERT INTO `acos` VALUES (619,220,5);
INSERT INTO `acos` VALUES (620,220,70);
INSERT INTO `acos` VALUES (622,188,56);
INSERT INTO `acos` VALUES (623,222,73);
INSERT INTO `acos` VALUES (624,222,77);
INSERT INTO `acos` VALUES (625,223,77);
INSERT INTO `acos` VALUES (626,223,73);
INSERT INTO `acos` VALUES (628,224,59);
INSERT INTO `acos` VALUES (631,64,69);
INSERT INTO `acos` VALUES (634,225,56);
INSERT INTO `acos` VALUES (635,225,31);
INSERT INTO `acos` VALUES (636,226,77);
INSERT INTO `acos` VALUES (637,226,92);
INSERT INTO `acos` VALUES (638,227,70);
INSERT INTO `acos` VALUES (639,227,64);
INSERT INTO `acos` VALUES (642,228,92);
INSERT INTO `acos` VALUES (643,123,64);
INSERT INTO `acos` VALUES (654,229,56);
INSERT INTO `acos` VALUES (655,229,70);
INSERT INTO `acos` VALUES (656,230,70);
INSERT INTO `acos` VALUES (657,231,77);
INSERT INTO `acos` VALUES (658,231,3);
INSERT INTO `acos` VALUES (659,232,89);
INSERT INTO `acos` VALUES (660,232,77);
INSERT INTO `acos` VALUES (661,233,77);
INSERT INTO `acos` VALUES (663,235,77);
INSERT INTO `acos` VALUES (668,234,77);
INSERT INTO `acos` VALUES (670,236,56);
INSERT INTO `acos` VALUES (671,124,87);
INSERT INTO `acos` VALUES (672,124,64);
INSERT INTO `acos` VALUES (675,238,96);
INSERT INTO `acos` VALUES (676,238,62);
INSERT INTO `acos` VALUES (686,239,62);
INSERT INTO `acos` VALUES (687,239,96);
INSERT INTO `acos` VALUES (694,240,77);
INSERT INTO `acos` VALUES (695,240,99);
INSERT INTO `acos` VALUES (696,240,3);
INSERT INTO `acos` VALUES (697,241,80);
INSERT INTO `acos` VALUES (702,243,77);
INSERT INTO `acos` VALUES (703,243,40);
INSERT INTO `acos` VALUES (704,244,96);
INSERT INTO `acos` VALUES (705,244,40);
INSERT INTO `acos` VALUES (709,242,96);
INSERT INTO `acos` VALUES (710,242,62);
INSERT INTO `acos` VALUES (714,247,77);
INSERT INTO `acos` VALUES (715,246,56);
INSERT INTO `acos` VALUES (722,248,56);
INSERT INTO `acos` VALUES (723,248,31);
INSERT INTO `acos` VALUES (726,249,40);
INSERT INTO `acos` VALUES (727,249,63);
INSERT INTO `acos` VALUES (729,250,77);
INSERT INTO `acos` VALUES (730,250,73);
INSERT INTO `acos` VALUES (734,205,5);
INSERT INTO `acos` VALUES (735,251,77);
INSERT INTO `acos` VALUES (739,203,56);
INSERT INTO `acos` VALUES (742,252,70);
INSERT INTO `acos` VALUES (747,253,31);
INSERT INTO `acos` VALUES (749,237,98);
INSERT INTO `acos` VALUES (757,254,40);
INSERT INTO `acos` VALUES (758,254,100);
INSERT INTO `acos` VALUES (759,256,62);
INSERT INTO `acos` VALUES (765,245,77);
INSERT INTO `acos` VALUES (766,245,3);
INSERT INTO `acos` VALUES (767,245,96);
INSERT INTO `acos` VALUES (770,257,101);
INSERT INTO `acos` VALUES (771,257,86);
INSERT INTO `acos` VALUES (774,258,29);
INSERT INTO `acos` VALUES (775,258,28);
INSERT INTO `acos` VALUES (778,14,28);
INSERT INTO `acos` VALUES (779,14,29);
INSERT INTO `acos` VALUES (784,27,41);
INSERT INTO `acos` VALUES (785,27,31);
INSERT INTO `acos` VALUES (788,260,102);
INSERT INTO `acos` VALUES (789,261,92);
INSERT INTO `acos` VALUES (790,262,73);
INSERT INTO `acos` VALUES (791,263,73);
INSERT INTO `acos` VALUES (794,259,70);
INSERT INTO `acos` VALUES (795,259,56);
INSERT INTO `acos` VALUES (796,264,3);
INSERT INTO `acos` VALUES (801,46,62);
INSERT INTO `acos` VALUES (802,46,59);
INSERT INTO `acos` VALUES (807,266,56);
INSERT INTO `acos` VALUES (808,265,77);
INSERT INTO `acos` VALUES (809,265,3);
INSERT INTO `acos` VALUES (814,267,103);
INSERT INTO `acos` VALUES (815,267,77);
INSERT INTO `acos` VALUES (824,268,103);
INSERT INTO `acos` VALUES (825,268,70);
INSERT INTO `acos` VALUES (836,129,71);
INSERT INTO `acos` VALUES (837,129,89);
INSERT INTO `acos` VALUES (838,129,81);
INSERT INTO `acos` VALUES (842,106,77);
INSERT INTO `acos` VALUES (843,269,104);
INSERT INTO `acos` VALUES (844,269,59);
INSERT INTO `acos` VALUES (846,271,77);
INSERT INTO `acos` VALUES (847,271,3);
INSERT INTO `acos` VALUES (848,272,77);
INSERT INTO `acos` VALUES (849,272,3);
INSERT INTO `acos` VALUES (850,270,56);
INSERT INTO `acos` VALUES (855,173,3);
INSERT INTO `acos` VALUES (856,173,77);
INSERT INTO `acos` VALUES (862,274,56);
INSERT INTO `acos` VALUES (863,275,77);
INSERT INTO `acos` VALUES (866,276,56);
INSERT INTO `acos` VALUES (867,276,105);
INSERT INTO `acos` VALUES (870,277,105);
INSERT INTO `acos` VALUES (871,277,56);
INSERT INTO `acos` VALUES (872,273,56);
INSERT INTO `acos` VALUES (873,273,105);
INSERT INTO `acos` VALUES (874,278,105);
INSERT INTO `acos` VALUES (875,278,56);
INSERT INTO `acos` VALUES (876,279,56);
INSERT INTO `acos` VALUES (878,280,56);
INSERT INTO `acos` VALUES (879,281,56);
INSERT INTO `acos` VALUES (882,282,56);
INSERT INTO `acos` VALUES (883,282,105);
INSERT INTO `acos` VALUES (885,283,32);
INSERT INTO `acos` VALUES (886,284,56);
INSERT INTO `acos` VALUES (888,285,56);
INSERT INTO `acos` VALUES (889,286,56);
INSERT INTO `acos` VALUES (890,286,106);
INSERT INTO `acos` VALUES (893,287,56);
INSERT INTO `acos` VALUES (894,287,105);
INSERT INTO `acos` VALUES (895,288,56);
INSERT INTO `acos` VALUES (898,289,56);
INSERT INTO `acos` VALUES (899,289,105);
INSERT INTO `acos` VALUES (900,290,105);
INSERT INTO `acos` VALUES (901,290,56);
INSERT INTO `acos` VALUES (902,291,105);
INSERT INTO `acos` VALUES (903,291,56);
INSERT INTO `acos` VALUES (906,292,105);
INSERT INTO `acos` VALUES (907,292,56);
INSERT INTO `acos` VALUES (910,294,56);
INSERT INTO `acos` VALUES (911,294,107);
INSERT INTO `acos` VALUES (912,293,105);
INSERT INTO `acos` VALUES (913,293,56);
INSERT INTO `acos` VALUES (916,296,56);
INSERT INTO `acos` VALUES (917,297,105);
INSERT INTO `acos` VALUES (918,297,56);
INSERT INTO `acos` VALUES (919,298,56);
INSERT INTO `acos` VALUES (922,299,105);
INSERT INTO `acos` VALUES (923,299,56);
INSERT INTO `acos` VALUES (924,300,77);
INSERT INTO `acos` VALUES (925,300,105);
INSERT INTO `acos` VALUES (927,295,56);
INSERT INTO `acos` VALUES (928,295,59);
INSERT INTO `acos` VALUES (934,301,105);
INSERT INTO `acos` VALUES (935,301,56);
INSERT INTO `acos` VALUES (939,302,77);
INSERT INTO `acos` VALUES (940,302,105);
INSERT INTO `acos` VALUES (941,302,3);
INSERT INTO `acos` VALUES (944,303,58);
INSERT INTO `acos` VALUES (945,303,56);
INSERT INTO `acos` VALUES (947,304,56);
INSERT INTO `acos` VALUES (950,305,58);
INSERT INTO `acos` VALUES (953,307,58);
INSERT INTO `acos` VALUES (954,307,31);
INSERT INTO `acos` VALUES (955,306,58);
INSERT INTO `acos` VALUES (956,306,56);
INSERT INTO `acos` VALUES (961,308,58);
INSERT INTO `acos` VALUES (962,308,70);
INSERT INTO `acos` VALUES (967,311,77);
INSERT INTO `acos` VALUES (968,311,96);
INSERT INTO `acos` VALUES (969,311,62);
INSERT INTO `acos` VALUES (970,310,77);
INSERT INTO `acos` VALUES (971,310,3);
INSERT INTO `acos` VALUES (975,312,58);
INSERT INTO `acos` VALUES (976,313,77);
INSERT INTO `acos` VALUES (977,313,96);
INSERT INTO `acos` VALUES (978,313,40);
INSERT INTO `acos` VALUES (979,314,58);
INSERT INTO `acos` VALUES (980,314,56);
INSERT INTO `acos` VALUES (981,315,3);
INSERT INTO `acos` VALUES (982,315,77);
INSERT INTO `acos` VALUES (985,316,58);
INSERT INTO `acos` VALUES (986,316,56);
INSERT INTO `acos` VALUES (989,317,31);
INSERT INTO `acos` VALUES (990,317,56);
INSERT INTO `acos` VALUES (993,318,58);
INSERT INTO `acos` VALUES (994,318,56);
INSERT INTO `acos` VALUES (995,319,58);
INSERT INTO `acos` VALUES (996,319,56);
INSERT INTO `acos` VALUES (1000,321,56);
INSERT INTO `acos` VALUES (1001,320,77);
INSERT INTO `acos` VALUES (1002,320,3);
INSERT INTO `acos` VALUES (1003,320,96);
INSERT INTO `acos` VALUES (1006,322,58);
INSERT INTO `acos` VALUES (1007,322,56);
INSERT INTO `acos` VALUES (1008,323,58);
INSERT INTO `acos` VALUES (1009,323,56);
INSERT INTO `acos` VALUES (1012,309,58);
INSERT INTO `acos` VALUES (1013,309,56);
INSERT INTO `acos` VALUES (1016,324,58);
INSERT INTO `acos` VALUES (1017,324,56);
INSERT INTO `acos` VALUES (1018,325,3);
INSERT INTO `acos` VALUES (1020,255,56);
INSERT INTO `acos` VALUES (1023,326,77);
INSERT INTO `acos` VALUES (1024,326,3);
INSERT INTO `acos` VALUES (1029,327,56);
INSERT INTO `acos` VALUES (1030,327,58);
INSERT INTO `acos` VALUES (1031,328,77);
INSERT INTO `acos` VALUES (1032,328,3);
INSERT INTO `acos` VALUES (1033,329,77);
INSERT INTO `acos` VALUES (1034,329,3);
INSERT INTO `acos` VALUES (1035,330,77);
INSERT INTO `acos` VALUES (1036,330,3);
INSERT INTO `acos` VALUES (1037,331,108);
INSERT INTO `acos` VALUES (1038,331,56);
INSERT INTO `acos` VALUES (1040,332,31);
INSERT INTO `acos` VALUES (1041,333,58);
INSERT INTO `acos` VALUES (1042,333,56);
INSERT INTO `acos` VALUES (1045,334,58);
INSERT INTO `acos` VALUES (1046,334,56);
INSERT INTO `acos` VALUES (1047,335,70);
INSERT INTO `acos` VALUES (1048,105,77);
INSERT INTO `acos` VALUES (1049,336,109);
/*!40000 ALTER TABLE `entries_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'admins','2012-02-03 16:05:42','2012-02-03 16:06:05');
INSERT INTO `acos` VALUES (2,'users','2012-02-03 16:06:11','2012-02-03 16:06:11');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `locations`
--

DROP TABLE IF EXISTS `locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `locations` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `city` varchar(30) DEFAULT NULL,
  `state` varchar(20) DEFAULT NULL,
  `country` varchar(30) NOT NULL DEFAULT '',
  `latitude` float(10,6) DEFAULT NULL,
  `longitude` float(10,6) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `locations`
--

LOCK TABLES `locations` WRITE;
/*!40000 ALTER TABLE `locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sources`
--

DROP TABLE IF EXISTS `sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sources` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(180) NOT NULL DEFAULT '',
  `url` varchar(300) NOT NULL DEFAULT '',
  `entry_id` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `entry_id` (`entry_id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sources`
--

LOCK TABLES `sources` WRITE;
/*!40000 ALTER TABLE `sources` DISABLE KEYS */;
/*!40000 ALTER TABLE `sources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stories`
--

DROP TABLE IF EXISTS `stories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stories` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `story_type_id` int(11) unsigned NOT NULL,
  `date` datetime DEFAULT NULL,
  `story` varchar(4000) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `video` varchar(50) DEFAULT NULL,
  `author_id` int(11) unsigned DEFAULT NULL,
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  `source_name` varchar(300) DEFAULT NULL,
  `source_url` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stories`
--

LOCK TABLES `stories` WRITE;
/*!40000 ALTER TABLE `stories` DISABLE KEYS */;
INSERT INTO `stories` VALUES (1,'Favorite Thing',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/thumb/4/45/A_small_cup_of_coffee.JPG/275px-A_small_cup_of_coffee.JPG',NULL,NULL,1,'2012-03-26 23:02:18','2012-04-10 15:21:51',NULL,NULL);
INSERT INTO `acos` VALUES (2,'My first job was programming binary load lifters .. (ILM 1991)',2,NULL,NULL,'http://visualfx.com/photos_files/Media/R23PO/R23PO.jpg?disposition=download',NULL,NULL,1,'2012-03-27 14:40:03','2012-03-27 14:51:23',NULL,NULL);
INSERT INTO `acos` VALUES (3,'After rolling some dice with Gary Gygax',2,NULL,NULL,'http://visualfx.com/photos_files/Media/meandGary2_800/meandGary2_800.jpg?disposition=download',NULL,NULL,1,'2012-03-27 14:50:05','2012-03-27 14:51:40',NULL,NULL);
INSERT INTO `acos` VALUES (4,'Toy Story',2,NULL,NULL,'http://4.bp.blogspot.com/_O6xLvXpZlOU/S933Vft3qgI/AAAAAAAAIBg/rvk8OhSsc1o/s1600/toy-story-10.jpg',NULL,NULL,1,'2012-03-28 22:36:20','2012-03-28 22:36:20',NULL,NULL);
INSERT INTO `acos` VALUES (6,'Pixar Animation Studios',2,NULL,NULL,'http://www.solarnavigator.net/films_movies_actors/film_images/Pixar_animation_studios_logo.jpg',NULL,NULL,1,'2012-03-28 22:42:30','2012-03-28 22:42:30',NULL,NULL);
INSERT INTO `acos` VALUES (8,'Ed Catmull',2,NULL,NULL,'http://fyi.utah.edu/wp-content/uploads/2012/01/catmull_ed_602.jpg',NULL,NULL,1,'2012-03-28 22:44:33','2012-03-28 22:44:33',NULL,NULL);
INSERT INTO `acos` VALUES (10,'NYIT',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/thumb/3/35/A2_Seal.jpg/205px-A2_Seal.jpg',NULL,NULL,0,'2012-03-29 08:09:04','2012-03-29 08:09:04',NULL,NULL);
INSERT INTO `acos` VALUES (11,'NYIT',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/thumb/3/35/A2_Seal.jpg/205px-A2_Seal.jpg',NULL,NULL,1,'2012-03-29 08:09:04','2012-03-29 08:09:06',NULL,NULL);
INSERT INTO `acos` VALUES (12,'Monsters, Inc.',2,NULL,NULL,'http://collider.com/wp-content/image-base/Movies/M/Monsters_Inc/Monsters%20Inc%20movie%20image%20Pixar%20(2).jpg',NULL,NULL,1,'2012-03-29 09:57:24','2012-04-10 14:45:17',NULL,NULL);
INSERT INTO `acos` VALUES (14,'Sloth Story',2,NULL,NULL,'https://images.nonexiste.net/popular/wp-content/uploads/2012/03/Hand-sized-baby-sloth-anyone.jpeg',NULL,NULL,0,'2012-03-29 14:21:36','2012-04-17 14:27:04',NULL,NULL);
INSERT INTO `acos` VALUES (16,'Conference Chair Terrence Masson',2,NULL,NULL,'http://photos.siggraph.org/gallery3/var/resizes/SIGGRAPH-2010-Photos/Keynote-Sessions/20100726-DSC_2125.jpg?m=1311175864',NULL,NULL,1,'2012-04-03 14:40:20','2012-04-03 14:41:37',NULL,NULL);
INSERT INTO `acos` VALUES (17,'Official Trailer',1,NULL,NULL,'http://www.youtube.com/watch?v=cvOQeozL4S0','cvOQeozL4S0',NULL,1,'2012-04-03 14:59:16','2012-04-03 14:59:20',NULL,NULL);
INSERT INTO `acos` VALUES (18,'George Lucas',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/a/a0/George_Lucas_cropped_2009.jpg',NULL,NULL,1,'2012-04-03 15:00:12','2012-04-03 15:00:55',NULL,NULL);
INSERT INTO `acos` VALUES (19,'poster',2,NULL,NULL,'http://www.pixartalk.com/wp-content/uploads/2009/06/monsterstheatrical2.jpg',NULL,NULL,1,'2012-04-03 15:00:43','2012-04-03 15:00:45',NULL,NULL);
INSERT INTO `acos` VALUES (20,'old logo',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/en/d/dc/ILM.jpg',NULL,NULL,1,'2012-04-03 15:08:14','2012-04-03 15:08:16',NULL,NULL);
INSERT INTO `acos` VALUES (21,'Digital Fauxtography banner at SIGGRAPH',2,NULL,NULL,'http://visualfx.com/photos_files/Media/digfaux/digfaux.jpg?disposition=download',NULL,NULL,1,'2012-04-10 14:30:33','2012-04-10 14:32:39',NULL,NULL);
INSERT INTO `acos` VALUES (22,'\"The Works\"',3,'1979-01-01 00:00:00','\"The Works is a shelved 3D computer animated film which was under development by the staff of the Computer Graphics Lab in association with the New York Institute of Technology in Old Westbury, New York. Being worked on sporadically from 1979 to 1986\"',NULL,NULL,NULL,1,'2012-04-10 15:05:25','2012-04-10 15:05:33','Wikipedia','http://en.wikipedia.org/wiki/The_Works_(film)');
INSERT INTO `acos` VALUES (25,'Logo',2,NULL,NULL,'http://www.lucasfilm.com/divisions/lfl/img/lfl_intmark_rgb.jpg',NULL,NULL,1,'2012-04-13 14:40:27','2012-04-13 14:40:27',NULL,NULL);
INSERT INTO `acos` VALUES (26,'Homer In 3D',2,NULL,NULL,'http://www.simpsonsfolder.com/gallery/homer3/3d01.gif',NULL,NULL,1,'2012-04-13 14:41:58','2012-04-13 14:42:00',NULL,NULL);
INSERT INTO `acos` VALUES (27,'',2,NULL,NULL,'http://mimg.ugo.com/201005/44356/simpsons-tron.jpg',NULL,NULL,1,'2012-04-13 14:42:45','2012-04-13 14:42:45',NULL,NULL);
INSERT INTO `acos` VALUES (28,'Box Art',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/en/d/dd/Ultima_Underworld_cover.png',NULL,NULL,1,'2012-04-13 14:57:07','2012-04-13 14:57:07',NULL,NULL);
INSERT INTO `acos` VALUES (30,'Laterrr',2,NULL,NULL,'http://i.imgur.com/8tGx8.gif',NULL,NULL,0,'2012-04-17 14:16:52','2012-04-23 14:49:41',NULL,NULL);
INSERT INTO `acos` VALUES (31,'How I eat cereal',2,NULL,NULL,'http://i44.tinypic.com/169lys8.gif',NULL,NULL,1,'2012-04-17 14:22:05','2012-04-17 14:22:10',NULL,NULL);
INSERT INTO `acos` VALUES (32,'yikes',2,NULL,NULL,'http://i.imgur.com/tlc6Y.gif',NULL,NULL,1,'2012-04-17 14:24:11','2012-04-17 14:24:11',NULL,NULL);
INSERT INTO `acos` VALUES (33,'WHAAAA--',2,NULL,NULL,'http://theuniblog.evilspacerobot.com/wp-content/uploads/2011/06/sloth-sitting-on-chair-behind-door.gif',NULL,NULL,1,'2012-04-17 14:26:52','2012-04-17 14:26:52',NULL,NULL);
INSERT INTO `acos` VALUES (34,'Staying busy',2,NULL,NULL,'http://i.imgur.com/SYOZc.gif',NULL,NULL,1,'2012-04-17 14:30:50','2012-04-17 14:30:50',NULL,NULL);
INSERT INTO `acos` VALUES (35,'No hugs',2,NULL,NULL,'http://24.media.tumblr.com/tumblr_lhn7qqfQk31qzrrzdo1_400.gif',NULL,NULL,1,'2012-04-18 11:08:01','2012-04-18 11:08:01',NULL,NULL);
INSERT INTO `acos` VALUES (36,'Ninja Cat',2,NULL,NULL,'http://24.media.tumblr.com/tumblr_m1j04knGY91qdlh1io1_400.gif',NULL,NULL,1,'2012-04-18 11:09:12','2012-04-18 11:09:12',NULL,NULL);
INSERT INTO `acos` VALUES (37,'This happens in the desert.',2,NULL,NULL,'http://i.imgur.com/Azkmu.gif',NULL,NULL,1,'2012-04-23 14:50:07','2012-04-23 14:50:09',NULL,NULL);
INSERT INTO `acos` VALUES (38,'Movie Poster',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/en/b/b2/ReturnOfTheJediPoster1983.jpg',NULL,NULL,1,'2012-04-23 16:32:12','2012-04-23 16:52:57',NULL,NULL);
INSERT INTO `acos` VALUES (39,'The name \"Alias\"?',3,'1983-01-01 00:00:00','The name â€œAliasâ€ was arrived at during a brainstorming session when Susan said â€œWhat we need is an alias for the company.',NULL,NULL,NULL,1,'2012-08-10 11:56:39','2012-08-10 11:57:01','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (40,'First Alias office space?',3,'1983-01-01 00:00:00','The first office was in an elevator shaft and rent was $150/month in the always-under-construction â€œMuch Musicâ€ building, Canadaâ€™s version of MTV.',NULL,NULL,NULL,1,'2012-08-10 11:57:59','2012-08-10 11:58:02','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (41,'The Alias Renderer',3,'1997-01-01 00:00:00','Raycasting (as Alias called it) is the casting of 2.5D rays into 2.5D buckets of triangles. We call the rays (and geometry) 2.5D because they are in the projected screen space of the image, so they are 2D, but they still have a bit of Z depth information which we can use to generate a real 3D intersection point. Alias Raycasting is like ray tracing in that we can compute volume intersections (fog, particles, glows, et. al.) with the speed of a 2D intersetion test, but unlike raytracing in that no secondary rays are (or can be) generated due to the nature of the geometry which is already projected into 2.5D. The Raycasting algorithm is closest to the ZZbuffer (yes, 2 Z\'s) presented  a Siggraph a few years back (the paper was unrelated to A|W).\n	People also tend to think of rendering as a post process, separate task. The Maya renderer is completely integrated so that geometric, dynamic or other properties of the scene can affect the shading (ie. connect the Y coordinate of a sphere to the red channel of a shader and you\'ve got a sphere that gets \"redder\" the higher it is translated)',NULL,NULL,NULL,1,'2012-08-10 12:01:09','2012-08-10 12:01:12',NULL,NULL);
INSERT INTO `acos` VALUES (42,'wrl',3,'1997-01-01 00:00:00','A little known fact: The name of the Alias image viewing utility â€œwrlâ€ came about when Will Anielewicz added to the existing code of â€œrlâ€ and wanted to change itâ€™s nameâ€¦hence the self initialed w(ill)rl utility name we all know and love today. Will developed his skills in obscurity at Omnibus. One of his dozen-or-so variants of an extrusion program was called â€œnewtube2â€, and itâ€™s help went approximately as follows:\n\nnewtube2: useage: file x y z xbang ybang zbang xtang ytang zbang\nfile: a ppt file to extrube about x y z\nxbang ybang zbang: do the obvious\nxtang ytang ztang: use only if you wrote the code\n\nanimators had to chain together dozens of unix programs using Cshell. In fact, Keith Ballinger, a TD, programmed ease-in/ease-out values with his TI-58 calculator. Others looked up the values in tables and typed them in with a text editor\n',NULL,NULL,41,1,'2012-08-10 12:03:24','2012-08-10 12:03:26',NULL,NULL);
INSERT INTO `acos` VALUES (43,'Unique feature',3,'1997-01-01 00:00:00','A unique feature of the 1000 model was its built-in composite video output. This allowed you to record to a VHS deck whatever you saw on the screen in realtime. With masked brush shapes and color cycling, you could really get some amazing effects out of D-Paint II with this set up. ',NULL,NULL,2,1,'2012-08-10 14:30:49','2012-08-10 14:30:54',NULL,NULL);
INSERT INTO `acos` VALUES (44,'Testimonial!',3,'1997-01-01 00:00:00','Amiga - \"The cool thing about the Amiga was/is (I have two in my house right now...) that it had a built-in graphics and sound co-processors and could do true multi-tasking on the Motorola 68000 series, which DOS, MS-DOS, WindowsX and MacOS never did on that CPU...or any other, for that matter. What a box!â€ ',NULL,NULL,44,1,'2012-08-10 14:33:10','2012-08-10 14:33:19',NULL,NULL);
INSERT INTO `acos` VALUES (45,'Fun Fact!',3,'1997-01-01 00:00:00','Nolan Bushnell, creator of â€œpongâ€ and the founder of Atari Computers is also the founder of Chuck E. Cheese Pizza.',NULL,NULL,NULL,1,'2012-08-10 14:52:50','2012-08-10 14:52:56',NULL,NULL);
INSERT INTO `acos` VALUES (46,'Fun Fact!',3,'1988-01-01 00:00:00','Blue Skyâ€™s very first jobs included a recycling campaign for the Glass Institute of NY in 1988 and a film job for \"Famous Players\", a theater chain in Canada. That job featured procedurally generated skies, clouds, sunset and water with a glass logo.',NULL,NULL,NULL,1,'2012-08-10 14:59:49','2012-08-10 15:00:08','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (47,'Fun Fact!',3,'1977-01-01 00:00:00','Bo Gehring Associates first feature film work in 1977 was the little know â€œDemon Seedâ€ sci-fi B-movie about a computer who becomes sentient and wishes to reproduce with his creators wife. (A late night classic now to be sure.) Bo provided vector graphics for computer displays on set, making this one of the very earliest examples of CG in a feature film',NULL,NULL,NULL,1,'2012-08-10 15:05:48','2012-08-10 15:05:55','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (48,'Fun Fact!',3,'1982-01-01 00:00:00','They used the first Digital Disk recorder system, the ESS-1 made by Ampex, and used code they had written on PDP-11 minicomputers for rendering. In the later eighties, they did a huge project for Williams videogames, but I am unsure as to how the company fared after that. Anyone know!?\n',NULL,NULL,2,1,'2012-08-10 15:30:53','2012-08-10 15:30:56',NULL,NULL);
INSERT INTO `acos` VALUES (49,'Fun Fact!',3,'1984-01-01 00:00:00','The intent at CFC from the very beginning was full frame digital manipulation and compositing of live action footage. This was a unique charter among startup CG facilities, that is not to be primarily concerned with vector or raster computer generated imagery.\n',NULL,NULL,NULL,1,'2012-08-10 15:43:53','2012-08-10 15:43:56','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (50,'Merge with Framestore',3,'1997-08-01 00:00:00','In August of 1997 CFC sold 100% ownership to MegaloMedia which also owns Londonâ€™s Frame Store post house and the Sachi & Sachi company. Today, alongside Domino, Cineon, Matador and Flame systems, CFC still uses their original Benchmark computer systems, a true testament to how far ahead that technology was when first designed over a dozen years ago.',NULL,NULL,NULL,1,'2012-08-10 15:45:58','2012-08-10 15:46:01','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (51,'â€œcamera matrix programâ€',3,NULL,'Both simple and revolutionary, the idea was to be able to automatically track as little as four points (6 were ideal) in a filmed scene, allowing it to extrapolate matchmove information for compositing CG imagery perfectly â€œintoâ€ a live action scene. Film footage was rear projected on a vertically mounted Calcomp 30x40 inch translucent plotting surface. An Oxberry based camera rig was used to increment the rear projection images one frame at a time.',NULL,NULL,NULL,0,'2012-08-10 15:56:46','2012-08-10 15:56:46','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (52,'Fun Fact!',3,'1997-01-01 00:00:00','I was once animating with a client, who said something like \"this is amazing, how fast you can do this stuff.  This must help you get it right very easily\" to which I replied \"We don\'t make any fewer mistakes than anybody else. We just compress the time between mistakes.\" ',NULL,NULL,NULL,1,'2012-08-10 16:04:40','2012-08-10 16:04:53',NULL,NULL);
INSERT INTO `acos` VALUES (53,'Fun Fact!',3,'1984-01-01 00:00:00','Andrew Berend left in late 1984 to join Mike Boudry and co-found the Computer Film Company (CFC)',NULL,NULL,NULL,0,'2012-08-10 16:07:23','2012-08-10 16:07:23','','');
INSERT INTO `acos` VALUES (54,'Early rendering story ...',3,'1983-01-01 00:00:00','â€œOne of our first rendered jobs went to 1-inch tape (remember that?) via a Sony BVH-2000 (or 2500, whichever it was that allowed single frame edits). The frame buffer would fill with the image, then a person had to hit \"edit\" on the Sony, and it would pre-roll, run forward, record the frame, and then stop. Then a person had to tell the computer to render the next frame. That person was me. I had to stay awake, hitting 2 buttons every 5 minutes, in the correct order, for about 36 hours straight, in order to get it done on time. The truth is, I did fall asleep for a few hours around 5AM, so I lost some time, but I don\'t think it matters now if I admit it.â€ ',NULL,NULL,67,1,'2012-08-10 16:09:10','2012-08-10 16:09:12',NULL,NULL);
INSERT INTO `acos` VALUES (55,'Fun Fact!',3,'1983-01-01 00:00:00','In the 80\'s we produced graphics animation, character animation and special effects direct to video.  This group is often overlooked because of the analog video component of their systems. However, they implemented computer control of many aspects of the animation process, keyframing, hierarchical control structures and image processing, years before many others in the field.',NULL,NULL,76,1,'2012-08-10 16:58:52','2012-08-10 17:00:43',NULL,NULL);
INSERT INTO `acos` VALUES (56,'Fun Fact!',3,'1997-01-01 00:00:00','Cranston/Csuri was originally to be called Animatrix, but the name was already being used by another company.',NULL,NULL,NULL,0,'2012-08-10 17:04:31','2012-08-10 17:04:31','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (57,'early hardware',3,'1983-01-01 00:00:00','Hardware included PDP 11-780 and 750\'s, a Megatek vector display and an IMI Pyramid (3 or 4 mips) and VAX 780 (1 mip!). One of the first production ethernet networks connected everyone. Rendering at that time was done to memory, not to hard a disc, and was output to a Celco 2000 film recorder. Also used was a rare but extremely cool digital disk recorder called an Ampex ESS. (Way ahead of it\'s time in 1983, the Abekas was not released until about 1987.) ',NULL,NULL,NULL,0,'2012-08-10 17:07:06','2012-08-10 17:07:06','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (58,'Licensed software',3,'1985-01-01 00:00:00','In 1985 CCP in-house software was licensed to the Japan Computer Graphics Laboratory (JCGL) ',NULL,NULL,NULL,1,'2012-08-10 17:09:59','2012-08-10 17:10:04','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (59,'Fun Fact!',3,'1988-01-01 00:00:00','Michael Wahrman and I did \"Mike The Talking Head\" (officially christened Mike Normal ) at deGraf/Wahrman in 1988, live at the SIGGRAPH Electronic Theatre in Atlanta. Mike was a virtual caricature of the late Mike Gribble, the host of that show, and the Mike of Spike and Mike\'s animation festival.',NULL,NULL,NULL,1,'2012-08-10 17:46:19','2012-08-10 17:47:11','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (60,'Fun Fact!',3,'1990-01-01 00:00:00','In 1990, deGraf/Wahrman did The Funtastic World of Hanna-Barbera, the first CG ridefilm. It was a fully 3D chase/ride through Bedrock and Scooby-Doo\'s castle, with cel animated characters, for Universal Studios Florida. (Rhythm and Hues also helped out with this production in the end.)',NULL,NULL,91,1,'2012-08-10 17:48:13','2012-08-10 17:49:09',NULL,NULL);
INSERT INTO `acos` VALUES (61,'Fun Fact!',3,'1987-01-01 00:00:00','The Digital Film Printer had been literally just sitting in a warehouse when Digital Productions (who had leased it from Triple-I) went out of business in 1987. ',NULL,NULL,NULL,1,'2012-08-10 17:55:47','2012-08-10 17:55:51','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (62,'Fun Fact!',3,'1985-01-01 00:00:00','Our original setup was a 1200 baud modem connection to an Amdahl V6 running APL in Bethesda Maryland using a Tekronix dispay to preview wireframe (polygons refreshed at one per second, thatâ€™s one polygon per second!). The perspective data was written onto 9 track tape and mounted on an IBM 370/158 to do scan conversion. Another tape was written as hi con images onto 9 track and shipped to LA for film recording on a Stromberg Carlson 4020 film recorder. Processed film was sent to NYC where I deinterlaced it onto hicon film and made a print to separate out the colors and have matte rolls that I could mount on an optical printer to do multiple passes with color filters onto color negative, which was then processed and printed at Technicolor downstairs. Total time to see a color image: 1 week tops.',NULL,NULL,97,1,'2012-08-10 17:59:47','2012-08-10 17:59:50',NULL,NULL);
INSERT INTO `acos` VALUES (63,'Fun Fact!',3,'1990-01-01 00:00:00','Digital Pictures was eventually sold to a company called Molinaire, which was itself owned by WH Smith. Moli was a TV post house, so buying DP made sense. WH Smith was (and is) a chain of bookstores, and what they were doing buying TV companies is not clear, nor was it then.',NULL,NULL,67,1,'2012-08-10 18:02:44','2012-08-10 18:02:47',NULL,NULL);
INSERT INTO `acos` VALUES (64,'Fun Fact!',3,'1986-01-01 00:00:00','When I first started, we were working on Data\nGeneral Eclipse 3300s, two of them. Each machine was about 7 feet high, 2 feet wide and 3 feet deep, had 32 Kb main memory and a 300Mb disk drive which was about twice the size of a domestic washing machine. I\'d say they were maybe 4 or 5 times more powerfull than an Amiga 500. We rendered tests direct to a frame buffer, usually 1-2 days for a 5-10 second test and rendered directly to a Matrix film plotter - there was no disk space to store rendered images as files. Each frame would take 30-90 minutes to render and 10 minutes to plot. Color consistency isn\'t guaranteed across film baths so if we missed or gashed a frame, we started over after we\'d got the film back from the labs.  Our renderer, which was a fine one, was written in house, did no ray tracing or texture mapping, had no reflection maps but did have shadows as long as we didn\'t use re-entrant polygons in our models. Intersecting surfaces were a no-no. We modeled and animated by writing Fortran 5 code. The last job done on the Eclipses was at a stage when they were so knackered that I was entirely losing disk data about 3 times a day and was archiving my code every 20 minutes or so I could recover it after I\'d reformatted the disk every time it went down. One of the disk drives bust so I was booting one machine, starting a render, removing the drive and plugging it back into the other machine so I could start a render on that one. My 8 second sting took a week to render. The air conditioner was being overworked so much it would freeze up every couple of hours, melt and dump gallons of water into the machine room. We had buckets all over the disk drives and mainframes. I didn\'t get to go home for 10 days.',NULL,NULL,99,1,'2012-08-10 18:04:56','2012-08-10 18:04:58',NULL,NULL);
INSERT INTO `acos` VALUES (65,'Good times',3,'1997-01-01 00:00:00','DP was one of those experiences like going away to college or to be in the military which stands out in your memory and establishes relationships in a short period of time that continue for many years after the \'main\' experience. Imagine the setting. You start from say the LA airport and drive a short distance and find yourself in a \'bad\' part of town, project housing and low-rent industrial warehouses.  You turn into a dirty alley that runs beside a plastic products factory and come to a chain-link access control gate with concertina razor wire along the top.  Once you are buzzed through the gate you are in a parking lot in front of a somewhat rundown warehouse.  You enter the warehouse and suddenly it\'s a different world.  Like a high tech artist\'s loft filled with digitizing tables, Technical Director Workstations and as you turn a corner and look to your left a glassed in raised floor computer room like something out of a super-secret government lab. The transition was amazing.',NULL,NULL,NULL,1,'2012-08-10 19:05:02','2012-08-10 19:05:42',NULL,NULL);
INSERT INTO `acos` VALUES (66,'Cray story',3,'1997-01-01 00:00:00','A Cray is a real headache. This one had like a $12,000 a month electric bill, and the maintenance and support bill for the \"Crayons\", the people who attended to it and kept it working came to like $50,000 a month. Its like a 747 jetliner. If its not in the air with seats full, you\'re losing money!',NULL,NULL,106,1,'2012-08-10 19:06:53','2012-08-10 19:07:32',NULL,NULL);
INSERT INTO `acos` VALUES (67,'The Last Starfighter',3,'1997-01-01 00:00:00','DPâ€™s first major computer graphic project was for The Last Starfighter, $4.5 million worth of state-of-the-art high resolution CG animation. Beginning in Oct 83, Digital Productions traded in the â€œolderâ€ Cray-1S for the very first Cray X-MP supercomputer. The Cray was fronted by a VAX 11/780 and was used to produce nearly 300 shots totaling 25 minutes of screen time. The team used E&S PS400\'s for modeling and IMI vector motion systems for motion preview with Ramtek frame buffers for display. When Triple-I had wrapped the TRON work and decided not to continue in the CG film business, DP leased the Digital Film Printer (DFP) and hooked it up to on of the high speed channels of the Cray. The Cray driven DFP could scan 35mm film at four seconds a frame, and film out the 2000x2560 rendered images at twelve seconds a frame.\nFor the first time, highly detailed computer generated images were integrated with live action as realistic scene elements, rather than as monitor graphics or deliberately â€œCGâ€ looking images. Gary Demos from the very begining always had the drive to only produce the highest resolution, highest quality imagery possible. \nKevin Rafferty(ILM) led the team that digitally encoded (modeled) many of the forms designed for the film by Ron Cobb. The technique used was to have top, front and side views of the model drawn orthographically on blueprint-like paper. A mouse/cursor (or â€œpuckâ€) with cross hairs would then be used to input the lines of the drawing, one point at a time. Details even included little 3D digital stunt actors inside the Gunstarâ€™s cockpit.\n',NULL,NULL,NULL,1,'2012-08-10 19:11:09','2012-08-10 19:13:20','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (68,'Hard Woman',3,'1985-01-01 00:00:00','Bill Kroyer and Chris Baily animated Mick Jagger\'s Hard Woman rock video in 1985. The 4.5 minute long animation was Co-produced by Nancy St.John and Alan Peach. Because of the tught deadline, the team concentrated on the character animation, with rendering being restricted to extremely simplified tube-like forms.',NULL,NULL,NULL,1,'2012-08-10 19:14:59','2012-08-10 19:15:44','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (69,'Meeting Mick Jagger',3,'1997-01-01 00:00:00','I was in transition at the time, moving from the head of the modeling department (we called them designer/encoder\'s) into the land of the TD. TD\'s at DP did everything else besides modeling...animation, lighting, compositing. All proprietary. I laid out the Adobe town for the video, and handed the layout work over to my successor, Stephen Skinner, and I moved on to TD\'ing my first project (I believe it was an HBO \"behind the scenes\" bumper. It was during that time that a bunch of us late-nighters met Mick Jagger. Fun time.',NULL,NULL,109,1,'2012-08-10 19:17:36','2012-08-10 19:18:09',NULL,NULL);
INSERT INTO `acos` VALUES (70,'The Omnibus takeover',3,'1986-01-01 00:00:00','In about 1985, CDC and Ramtek were both breaking up or going out of business themselves, and wanted out of the digital movie making business at any cost. Anxious to cut their losses, the board went along with a hostile takeover bid by Omnibus, breaking there agreement with Whitney Jr. and Demos. Backed by the Royal Bank of Canada, Omnibus arranged for a leveraged buy-out that would burden them with nearly $25 million in debt. Unable to prevent what they saw as sheer folly, and also unable to afford a costly legal battle to protect their company, John Whitney Jr. and Gary Demos left to start up Whitney/Demos Productions. Digital Productions was renamed \"Omnibus Simulation\" in June of 1986, and declared bankruptcy (along with Omnibus and Abel) only 9 months later on April 13th of 1987.',NULL,NULL,NULL,1,'2012-08-10 19:21:35','2012-08-10 19:21:37','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (71,'1st edition cover',2,NULL,NULL,'http://img2.imagesbn.com/images/103030000/103032135.jpg',NULL,NULL,1,'2012-08-10 20:07:04','2012-08-10 20:07:07',NULL,NULL);
INSERT INTO `acos` VALUES (72,'Fun Fact!',3,NULL,'They first bought the first two SGI terminals (at that stage SGI only made terminals) sold out of the US and used them as a front end to a DEC VAX 11-780. The disk drives were two removable platter â€œwashing machinesâ€ which stood about 3 feet high and held a massive 450megs of data.\n',NULL,NULL,NULL,1,'2012-08-11 14:03:53','2012-08-11 14:03:58','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (73,'Tractor parts',3,'1997-01-01 00:00:00','We were told that only a month before a shipment marked â€œTractor Partsâ€ had been intercepted on its way to West Germany and found to contain a VAX computer, so the extremely jumpy American customs people grabbed our SGI terminals.  We had to hire a lawyer in the states in order to get them released, two weeks after we were due to start on British Telecom Internationalâ€™s new corporate identity using this gear.',NULL,NULL,115,1,'2012-08-11 14:06:58','2012-08-11 14:07:03',NULL,NULL);
INSERT INTO `acos` VALUES (74,'Abel Image connection',3,'1997-01-01 00:00:00','Paul did a source code co-development deal with Abel Image Research (Robert Abelâ€™s software division), where Electric helped with some the PAL video issues and worked closely with the Abel team to debug the code. ( The development team at Abel at the time included Roy Hall, Hank Weghorst, Kim Shelley a number of other Cornell luminaries. ) \nEI began using the Abel system for television work and eventually added an Oxberry Matrix 35mm camera for film work. Like most companies of this early era, the EI team had to work pretty much from scratch creating custom renders, color look up tables, modeling utilities etc., and without the benefit of the academic superstructure that already existed in the US. \n',NULL,NULL,NULL,1,'2012-08-11 14:09:19','2012-08-11 14:09:46','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (75,'DORIS',3,'1997-01-01 00:00:00','The various shareholders felt that we should have a gimmicky name for the VAX/SGI/AbelGraphix combination, so at a late night pub session Colin Reynolds drunkenly suggested â€œDorisâ€.  After a few more pints we decided that DORIS stood for â€œDigital Optical Raster Imaging Systemâ€ and thatâ€™s what we told the press it was called.',NULL,NULL,NULL,1,'2012-08-11 14:11:19','2012-08-11 14:11:21','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (76,'Many \"firsts\"',3,'1997-01-01 00:00:00','The company was responsible for many European â€œfirstsâ€ â€“ first to use C and Unix for commercial graphics production (most everyone else was using VMS and Pascal), the first bit of serious raytracing on UK television (an ident for Yorkshire Television), the first real time display SGI graphics terminals, first UK dynamics animation package (written by David Benson). A heavy use of clever compositing and geometric projection tricks (picked up from the Abel initially) gave the companyâ€™s work a distinctive look and built up a reputation for quality',NULL,NULL,NULL,1,'2012-08-11 14:13:43','2012-08-11 14:13:45','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (77,'Framestore connection',3,'1997-01-01 00:00:00','About this time EI became one of the founding shareholders in The Framestore, along with director Steve Barron (Teenage Mutant Ninja Turtles, Merlin, etc.).  The new company had the first Quantel Harry and has since grown in to one of Europeâ€™s largest digital post houses.',NULL,NULL,NULL,1,'2012-08-11 14:21:48','2012-08-11 14:22:05',NULL,NULL);
INSERT INTO `acos` VALUES (78,'first hardware',3,'1968-01-01 00:00:00','E&S first products were the LDS-1, LDS-2 then Picture System-2 vector systems; all used with another host system such as the VAX-11/780 (Abel used a PS2 with the Gould 6031)',NULL,NULL,NULL,1,'2012-08-11 14:30:18','2012-08-11 14:30:22','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (79,'In house software',3,'1997-01-01 00:00:00','Like other major production companies, Ex Machina has also relied on developing itâ€™s own custom software. Its in-house character animation system â€œAppiaâ€ was developed in 1991/92 and first used during the production of \"World of Materials\" directed by Jerzy Kukar. This was a 10 minute 70mm stereo movie for a Korean International Festival. (Ex Machina was also involved in the training of CG artists for a Korean CG company who did one part of the film.)',NULL,NULL,NULL,1,'2012-08-11 15:52:06','2012-08-11 15:52:10','CG101: Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (80,'relocated',3,'1983-01-01 00:00:00','Image West moved from Hollywood to Studio City, CA in 1983.',NULL,NULL,NULL,1,'2012-08-16 14:20:33','2012-08-16 14:21:13','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (81,'Star Wars connection',3,'1975-01-01 00:00:00','Image West\'s only feature film CG project was for the original Star Wars film in 1977. The Yavin planet count down imagery was done by John Wash and Jay Teitzell. A great deal more imagery for Star Wars was traditional animation, analog effects and other non-CG techniques.',NULL,NULL,NULL,1,'2012-08-16 14:22:54','2012-08-16 14:26:52','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (82,'Realtime .. repeated',3,'1973-01-01 00:00:00','Digital image-making state of the art was a PDP-11 and a $50,000 framebuffer, and a bunch of assembly or FORTRAN programmers hacking away from scratch. Triple-I, NYIT, and MAGI were about the only people going that route. Image West had always had the advantage of \"real time\", meaning that despite the limitations of the analog rescan technology, it could run right before your eyes, and be adjusted on the fly. Its big downfall was complete lack of repeatability, due to all those knobs and patch wires. (Scanimate) After reviewing all the options, Cliff Brown and I decided a good approach would be to build a system based on the analog rescan technology, but using digital computers to track and store the setups needed to repeat a job. I did not realize at the time how large a project this would be (VersEFX).â€ ',NULL,NULL,106,1,'2012-08-16 14:27:58','2012-08-16 14:28:01',NULL,NULL);
INSERT INTO `acos` VALUES (83,'the origin of raised flooring!?',3,'1973-01-01 00:00:00','This was the first facility I had ever designed that involved raised computer flooring. Half of the building was on a level two feet lower than the other half. So we used raised computer flooring to make the two floor levels equal. This gave us about 20\" under the floor for cables, power and air conditioning.',NULL,NULL,106,1,'2012-08-16 14:28:50','2012-08-16 14:28:54',NULL,NULL);
INSERT INTO `acos` VALUES (84,'The End',3,'1985-01-01 00:00:00','The company faced increasingly hard times competing with the trend of completely digital effects, 3D CG and digital video effects boxes like the ADO. The new VersEFX system that they had partnered with SFP on (the French TV production company) had gone to France, and they were trying to build one for themselves. But hybrid video technology was not going to able to compete with the all digital systems, so they made a deal with Symbolics to get one of their S-series systems with both paint and 3D \nCapabilities. Unfortunately, they could never return to the revenue levels they had been working at with the Scanimates,   and in desperation, they attempted a public offering on the Vancouver stock exchange. That attempt failed and the company closed its doors in 1985.\n',NULL,NULL,NULL,1,'2012-08-16 14:29:50','2012-08-16 14:29:54','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (85,'Funny George Story',3,'1999-01-01 00:00:00','The second floor of the building was being completely renovated for the video editing space, and George would come by occasionally to check up on the work. One day he stops by and makes a casual question about why a wall has a door put in a particular location. Some days later he returns to find that the construction workers have actually moved the door to another spot! Hoping to avoid future misunderstandings, George tells the workers that just because he asks a question doesnâ€™t mean they need necessarily jump to conclusions and change something. Satisfied that all is now well, he leaves the workers to finish the job. Returning again sometime later, he finds that the workers have moved the door back to its original position. ',NULL,NULL,7,1,'2012-08-16 14:38:54','2012-08-16 14:39:00',NULL,NULL);
INSERT INTO `acos` VALUES (86,'Temp location in Bel Marin Keys',3,'1982-01-01 00:00:00','A few years later the Graphics group would move to a new custom office space up north in Bell Marin Keys, Novato. (This was also the year of the big Marin County flood that left 5 feet of water in down town San Enselmo). In 1983 the permanent space for ILM in SanRafael was finished, and the Graphics Group moved into â€œCâ€ building on Kerner Blvd.',NULL,NULL,NULL,1,'2012-08-16 14:40:31','2012-08-16 14:40:33','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (87,'Busy early \'80s',3,NULL,'During the early 1980s, many Lucasfilm corporate and management changes take place, with the original President Charlie Weber being replaced by Bob Greeber, who is then replaced by Doug Norby. The â€œEgg Companyâ€ Lucasfilm location in LA is closed down, and development on SkyWalker Ranch was ongoing.',NULL,NULL,NULL,1,'2012-08-16 14:42:11','2012-08-16 14:42:13','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (88,'The Foonly F1',3,'1974-01-01 00:00:00','The F1 was originally built by Triple-I in hopes of getting a large contract with the Government for an Optical Character Recognition system. Its design became the DEC KL-10, but was built on five wire-wrap pages, that were machine wrapped. This meant that it was a one-of-a-kind system, a prototype that never went anywhere. It required a DEC KA-10 (5 tons of stuff that barely could do 1 MIP!), which ran a hacked up version of the TOPS10 operating system, just to boot it. When it was up, it probably ran at something like 6 MIPS. The Disk systems were old DEC washing-machine style drives that barely held 50Mb, and they crashed at least every month! TRANEW rendering software was written by Gary Demos, Bill Dungan, Rich Schroeppel, Jim Blinn, and a host of others while Triple-I had the machine. Triple-I had married the F1 to a modified PFR-80 film recorder, one of the first in the motion picture industry. Omnibus bought the F1 system because it had produced the majority of the CGI in the film \"TRON\", and it seemed like a good way to jump-start feature film production. We did scenes from \"Explorers\", and \"Flight of the Navigator\" on it, but it was painful.',NULL,NULL,106,1,'2012-08-16 14:52:00','2012-08-16 14:52:03',NULL,NULL);
INSERT INTO `acos` VALUES (89,'Founders',3,'1975-01-01 00:00:00','The Motion Picture Project or Entertainment Technology Group was formed at Triple-I in 1975 by Gary Demos, John Whitney Jr., Tom McMahon, Karol Brandt and Art Durinski, later joined by Craig Reynolds and many others. ',NULL,NULL,NULL,1,'2012-08-16 14:53:18','2012-08-16 14:53:21','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (90,'Close Encounters tests',3,'1975-01-01 00:00:00','The first project Whitney Jr. and Demos were charged with was a series of tests for the film Close Encounters of the Third Kind. The concept was for little glowing cubes to fly around during the start of the filmâ€™s finally. The filmâ€™s DP Vilmos Zigmund shot some plates with a crane, including some small spheres whose position would be input to a 3D tracking program to extrapolate the matchmove by which to render the 3D elements â€œintoâ€ the scene. (Malcom McMillan, a UCLA mathematician and key Triple-I programmer wrote this code)',NULL,NULL,NULL,1,'2012-08-16 14:54:57','2012-08-16 14:55:00','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (91,'Early software .. and Jim Blinn!',3,'1977-01-01 00:00:00','Both Frank Crow and Jim Blinn worked here briefly in 1977 developing algorithms later published in their thesis work. The Actor/Scriptor Animation System (ASAS) was developed by Craig Reynolds, Art Durinski and others; and the modeling tools were written by Larry Malone(Nichiman) using tools such as the Tektronix 4014 storage tube display terminal running Tekshow.',NULL,NULL,NULL,1,'2012-08-16 14:56:29','2012-08-16 14:56:33','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (92,'Oversees broadcast work',3,'1976-01-01 00:00:00','Most of 1976 was spent producing broadcast logo packages for foreign markets, as the domestic networks were not ready to commit to the new idea of CG â€œflying logosâ€. NBC in particular was one early client Triple-I approached with the idea, only to be rejected in favor of a traditional spinning practical model.',NULL,NULL,NULL,1,'2012-08-16 14:57:35','2012-08-16 14:57:38','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (93,'Lucasfilm tests',3,NULL,'Other 3D CG tests were done for Star Wars, The Black Hole, and The Empire Strikes Back, but did not end up in the finished films. One particular test for LucasFilm involved Art Durinski building a beautiful 60k poly count X-Wing fighter. Rendered at 4k by 6k resolution, Lucas was only impressed after the ever-amazing Mal MacMillan wrote some additional code to â€œdirtyâ€ it up from itâ€™s original pristine CG condition. It was eventually shown on the cover of â€œComputer Magazineâ€ in 1979. \nA lower poly count version was created for an animation test Gary Demos did of a five ship formation, complete with anti-aliasing and motion-blur. Unfortunately the seven thousand dollar per minute production cost required by Lucas was much too low for Triple-I to consider real production. Also in 1978 scanning and filmout tests were performed with Richard Edlund at LucasFilm, but the nature of the CRT technology and 5247 film stocks did not yield great results.\n',NULL,NULL,NULL,1,'2012-08-16 14:58:30','2012-08-16 14:58:33','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (94,'Looker',3,'1980-01-01 00:00:00','1980 saw the production of seven minutes of digital imagery for Looker; another Michael Chrichton film written after the authorâ€™s visits to Triple-I during Westword and FutureWorld productions. Full body 3D scans where made of an actress from software developed once again my Malcom McMillan. The film was about a company that created computer generated actresses from full body scansâ€¦dÃ©jÃ  vu?',NULL,NULL,NULL,1,'2012-08-16 14:59:26','2012-08-16 14:59:29','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (95,'Digital Productions spin-off',3,'1981-01-01 00:00:00','About this time it was becoming clear to both John Whitney Jr. and Gary Demos that Triple-I was not going to allow the expansion or spin off of the Motion Picture Group as they had originally hoped. John and Gary were instrumental in the pitching and pre-production of the next big CGI film, Tron, but left in April of 1981 before its production to form their own company: Digital Productions.',NULL,NULL,NULL,1,'2012-08-16 15:01:02','2012-08-16 15:01:04','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (96,'Tron',3,'1982-01-01 00:00:00','Triple-I created the Sarkâ€™s Carrier, solor sailor and the MCP scenes for the end of the film. Some key people on the work included Art Durinski, Larry Malone, Craig Reynolds, Bill Dungan and Jeremy Swartz. ',NULL,NULL,NULL,1,'2012-08-16 15:01:55','2012-08-16 15:01:57','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (97,'The End',3,'1983-01-01 00:00:00','After completing Tron and a 3D (steroscopic) project for Kodak/Epcot called â€œMagic Journeysâ€, Triple-I ceased itâ€™s computer graphics business. Some employees joined Digital Production while others joined  the new Symbolics Graphics Division.',NULL,NULL,NULL,1,'2012-08-16 15:03:04','2012-08-16 15:03:06','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (98,'Starting hardware and software',3,'1980-01-01 00:00:00','JCGL\'s system for television animation production consisted of a huge custom designed optical printer to print extra frames of the same image for reducing rendering time, 2 Dicomed 48-S film recorders, 2 Vax 780 super mini computers , 4 PDP 44s, 8 PDP 11s for ink and paint stations, two DeAnza scanners for scanning animation papers, 18 Genisco frame buffers for image buffering and one PS 300 for vector drawing. The software \"MK-1\" was based upon NYIT\'s Tween and Tweep software for vector animation generation and scanned image inking and coloring capabilities with help of Tokyo Institute of Technology Image Lab lead by Prof.Takeshi Agui. ',NULL,NULL,NULL,1,'2012-08-16 15:40:30','2012-08-16 15:40:33','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (99,'The Yearling',3,'1981-01-01 00:00:00','The production of \"The Yearling\", however, failed with only one completed episode, which was actually No.2. of the series. Because of various creative challenges, the production schedule became almost double of what had been estimated. This episode No. 2 was broadcast in April 1982 and became world\'s first television animated program completely processed with a computer. The rest of the 51 episode production was switched to the conventional hand drawn, hand painted method. ',NULL,NULL,NULL,1,'2012-08-16 15:44:17','2012-08-16 15:44:20','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (100,'The End',3,'1987-01-01 00:00:00','JCGL lead Japan\'s CG production for 7 years but came to its dissolution in 1987 when its VAX based system could not compete any longer with cheaper more modern systems.',NULL,NULL,NULL,1,'2012-08-16 15:46:49','2012-08-16 16:08:26','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (101,'Great success',3,'1985-01-01 00:00:00','Mits Kaneko decided to move to 3D computer graphics production for commercial films and special effects on feature films. Jim Kristoff of Cranston Csuri Production (CCP) helped integrate 3D production software with the existing hardware, and the transition went well. The JCGL went on to win prizes including Nicograph, NCGA and INA gran-prixs. ',NULL,NULL,NULL,1,'2012-08-16 15:48:07','2012-08-16 16:08:31','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (102,'Sextone for President',3,'1988-01-01 00:00:00','Their first Synthespian, created for SIGGRAPH/88, was â€œSextone for Presidentâ€. The 30 second piece demonstrated facial animation based on interpolating Dianaâ€™s digitized sculptures with software written by Larry Weinberg. The TALK program could mix any percentage of any facial shape at any frame, even with arbitrary polygon ordering. This technique of phoneme interpolation is today a standard way of producing 3D facial animation. The narration made heavy use of irony as the character lobbied for SAG (Synthetic Actors Guild) rights.',NULL,NULL,NULL,1,'2012-08-16 16:11:52','2012-08-16 16:11:54','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (103,'The End',3,'2004-01-01 00:00:00','KWCC was reborn as Synthespian Studios and continues to produce high-end computer graphic animation and visual effects.',NULL,NULL,2,1,'2012-08-16 16:15:19','2012-08-16 16:16:55',NULL,NULL);
INSERT INTO `acos` VALUES (104,'Don\'t Touch Me',3,'1989-01-01 00:00:00','In 1989, Hewlett Packard supported KWCCâ€™s next character Dozo in the ambitious â€œDon\'t Touch Meâ€. The 3 minute animation utilized early optical motion capture from Motion Analysis. Frank Vitz joined the team to wrangle the always late and always buggy motion capture data. After more than five months, only about 20% of the motion capture data was delivered, forcing KWCC to make very creative use of piecing together and repeating many short fragments of motion. The rendering was done all over the country, anywhere there was Wavefront rendering code. All the final imagery was output to big 9-track data discs and stacked 6 feet high, output to film and delivered to NY airport, picked up by an HP employee and handed into the SIGGRAPH office one minute before the midnight deadline for the Electronic Theatre submissions.',NULL,NULL,NULL,1,'2012-08-16 16:18:59','2012-08-16 16:19:01','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (105,'Collaborations',3,'1993-01-01 00:00:00','Two important television series were also created in conjunction with Santa Barbara Studios: â€œAstronomersâ€ with 12 minutes of cosmic simulation for PBS and â€œ500 Nationsâ€, where they built entire Native American cities.',NULL,NULL,NULL,1,'2012-08-16 16:20:20','2012-08-16 16:20:24','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (106,'Getting started ...',3,'1987-01-01 00:00:00','Diana and I formed KWCC to build databases using her sculptures and a 3D digitizer by Polhemus. Soon we were approached by Viewpoint who wanted to market our data along with theirs, and we were more interested in developing Synthespians than database service market.',NULL,NULL,97,1,'2012-08-16 16:22:26','2012-08-16 16:22:30',NULL,NULL);
INSERT INTO `acos` VALUES (107,'Pen plotter output',3,'1986-01-01 00:00:00','Output was on an HP plotter, hooked up to an SGI 3130. (A machine with only 4 megs of ram that cost $42,000 US!) The unique hybrid 3D/cel technique was used for the first time with futuristic motorcycles in the short-lived TV series UltraCross. (The show was canceled when the toy deal fell through.) \n',NULL,NULL,NULL,1,'2012-08-16 16:26:45','2012-08-16 16:26:48','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (108,'Technological Threat',3,'1988-01-01 00:00:00','With the method proven, and the time to spare, Kroyer and his team next produced the short film Technological Threat in 1988. The film realized the conflict and resolution of a traditionally animated character with that of a computer generated one. Great story telling, design and execution added up for an Academy Award-nomination for the film that year.',NULL,NULL,NULL,1,'2012-08-16 16:27:36','2012-08-16 16:29:20','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (109,'FernGully: The Last Rainforest',3,'1992-01-01 00:00:00','The full length animated feature film FernGully: The Last Rainforest was completed on February 10th, 1990. Besides being a very enjoyable film for both kids and adults, the project was notable for several reasons. Backed by the Australian team that had made â€œCrocodile Dundeeâ€, the entire production was accomplished in just two years from storyboards to premier. Kroyer ramped up from 15 to 200 people and in addition created 40,000 computer plotted cel frames to augment the bulk of the traditional animation. ',NULL,NULL,NULL,1,'2012-08-16 16:31:18','2012-08-16 16:31:21','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (110,'FerGully factoid',3,'1992-01-01 00:00:00','One Ferngully scene in fact was done with digital-in-and-paint technology at Sidly-Rite(sp?) in Hollywood. The â€œsinging bat inside a treeâ€ scene was a feature film first to use this technique. (Disneyâ€™s â€œRescuers Down Underâ€ would come out the same year.)',NULL,NULL,NULL,0,'2012-08-16 16:32:12','2012-08-16 16:34:00','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (111,'The End',3,'1994-01-01 00:00:00','Finally in 1994, studios began jumping on the feature animation bandwagon, but Kroyer by now had downsized considerably. Bill and Sue both decided to shut down their company and join the fledgling Feature Animation department at Warner Brothers for â€œQuest For Camelotâ€. While that partnership would not last because of creative differences, the Kroyers were able to freelance and develop their own film project. ',NULL,NULL,NULL,1,'2012-08-17 14:38:44','2012-08-17 14:38:47','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (112,'First Wavefront licence',3,'1980-01-01 00:00:00','Lamb & Company created some of the world\'s first flying logos when it acquired the first license of Wavefront software, allowing them to do production internally without relying on film or outside film support services. The Wavefront Preview software complemented their Oxberry equipment by allowing staff to previsualize the work being done on the computer controlled animation camera. This way of working was a \'preview\' of the coming the shift to computer graphics in the industry at large. ',NULL,NULL,NULL,1,'2012-08-17 14:48:50','2012-08-17 14:49:06','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (113,'Cranston Csuri software',3,'1985-01-01 00:00:00','About the same time, Larry bought the core animation technology developed at Cranston Csuri, one of a handful of \'original\' computer animation companies that passed into history. This substantial body of \'prior art\' in animation technology served as the basis for Lamb & Company\'s internal development efforts. ',NULL,NULL,NULL,1,'2012-08-17 14:50:56','2012-08-17 14:50:58','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (114,'Lambsoft',3,'1997-01-01 00:00:00','In 1997, Lamb & Company spun off LambSoft, a software technology development company whose goal is to productize motion editing and compositing software created as part of the company\'s long term efforts around blending motion capture with keyframe animation. ',NULL,NULL,NULL,1,'2012-08-17 15:24:19','2012-08-17 15:24:22','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (115,'1983 demo reel',1,NULL,NULL,'http://www.youtube.com/watch?v=V1NdUDfRqys','V1NdUDfRqys',NULL,1,'2012-08-17 15:33:13','2012-08-17 15:33:20',NULL,NULL);
INSERT INTO `acos` VALUES (116,'From junkmail to Tron',3,'1982-01-01 00:00:00','How the largest \"junkmail\" company in Westchester created TRON! In itâ€™s early days, MAGIâ€™s largest business was creating â€œjunk mailâ€ databases for direct mail and marketing uses. Three other divisions included: A CAD/CAM group which was very busy in manufacturing and defense contracts, Computer Slides Corp., which handled the presentation business projects; and the smallest of them all:  Synthavision',NULL,NULL,NULL,1,'2012-08-17 15:44:04','2012-08-17 15:44:06','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (117,'first raytraced image',3,'1963-01-01 00:00:00','In fact, the very first raytraced image was produced in 1963, output on special test equipment (similar to an oscilloscope) developed at the University of Maryland. An â€œegg in a boxâ€ whose complex hidden surface problems were easily handled by the new raytracing technique. ',NULL,NULL,NULL,1,'2012-08-17 15:45:31','2012-08-17 15:45:34','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (118,'Solid modeling ',3,'1982-01-01 00:00:00','The software techniques were unique in their use of solid modeling techniques. Unlike all other systems, Synthavision used not polygons or patches but \"combinatorial geometry\" (boolean union, difference and intersection) of mathematically defined solid shapes such as cubes, cones and spheres. For example, a simple flying saucer would be modeled as the intersection of two perfect spheres, and a sphere would never suffer from low resolution straight edged profiles because it is defined mathematically perfect. The raytracing technique, originally developed by Bob Goldstein in the late 1960s, evaluated these boolean combinations once per ray. (the key paper was published in \"Simulation\" in 1968, and is referenced in Turner Whitteds 1981 SIGGRAPH paper which introduced raytracing to a much broader audience). The core math and physics developers at this stage included Herb Steinberg and Dr. Eugene Troubetskoy while Marty Cohen and Larry Elin (a non-scientist and Phil Mittlemanâ€™s son-in-law too) served in Executive Producer type roles. ',NULL,NULL,NULL,1,'2012-08-18 13:46:56','2012-08-18 13:46:58','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (119,'CE3K tests',3,'1975-01-01 00:00:00','In 1975/76 Bo Gehring and others traveled to Hollywood to produce CG tests for Steven Speilberg film Close Encounters of the Third Kind. A film recorder was built by Carl Machover, one of the earliest of itâ€™s kind, it used a 9â€ CRT to expose the imagery onto 35mm film at 4000x2500 lines of resolution. Doug Trumbull also arranged to use a facility in Minniapolis to output to 65mm film. The intent was to realize the spaceships in the end landing sequence entirely with CG. In the end, Trumbull favored the traditional approach, and the CG tests were no longer pursued.',NULL,NULL,NULL,1,'2012-08-18 13:48:04','2012-08-18 13:48:07','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (120,'pioneering filmout tech',3,'1980-01-01 00:00:00','MAGI was a pioneer in putting high resolution computer graphics directly out to film. It\'s CELCO film recorder (way ahead of its time) was the second ever made. (The first being used by the government for Landsat imagery. ',NULL,NULL,NULL,1,'2012-08-20 16:59:24','2012-08-20 16:59:27','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (121,'Who\'s \'PDI\' ??',3,'1983-07-10 00:00:00','To relate an interesting perspective on the mind set of the time, in New York for the premier of Tron were all the computer graphics people who contributed to the film. From MAGI, Triple-I, Abel and Digital Effects all sitting around a table at Sardies. The topic of conversation soon center on the fact that the â€œentire CG business was sitting right hereâ€ and â€œhad anyone heard about some company trying to break in to the CG business in Californiaâ€¦they are going to call it Pacific Data Images or something like that..â€ â€œand how do they expect to get into such an established business as ours? Itâ€™ll never be successful.â€',NULL,NULL,NULL,1,'2012-08-20 17:11:27','2012-08-20 17:12:30','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (122,'Fun Fact!',3,'1982-01-01 00:00:00','Shortly after Ken Perlin was hired I was hired into the CAD/CAM division to help build an interactive modeler for Synthavision\'s CSG (ray-traced boolean ops on quadratic solids) It was to be used by the movie division and sold toe the mechanical engineering market. This was an ambitious task given that all of the rendering and animation programs were still written in 80 column punched card format, compiled and run as \"batch jobs\" on IBM mainfraims and later on 32bit mini-computers and animation pencil tests were output to film and looked at on a upright Movieola, there weren\'t any frame buffer or color displays.',NULL,NULL,NULL,0,'2012-08-20 17:15:02','2012-08-20 17:16:50',NULL,NULL);
INSERT INTO `acos` VALUES (123,'Wild Things',3,'1983-01-01 00:00:00','John Lasseter (Then a traditional animator at Disney) got his first exposure to computer graphics by working as the official Disney-Magi liason for a joint 1983 post-TRON test for \"Where the Wild Things Areâ€. Based on the popular childrens book by Maurice Sendak, the (60sec?) short had a young boy in his pajamas running with his dog up a flight of stairs. The characters were traditional cell animation and the environment was all 3D CG. Disney footed the bill for production, while MAGI paid for the substantial R&D needed to create the hardware and software. Ken Perlin supervised and wrote code for the project. (which also included the now well known Disney animator Glen Keane). Jan Carlee and Chris Wedge modeled the environment and animated the camera move. Christine Chang wrote the digital â€œink and paintâ€ software that was used to color the Disney animators scanned in drawings complete with shadow and highlight elements. (A technique used much later to great effect at ILM in Who Framed Roger Rabbit.) Josh Pines built the scanner. This amazing project may have been the first ever example of full feature film resolution CG digital compositing. ',NULL,NULL,NULL,1,'2012-08-21 15:50:42','2012-08-21 15:53:50','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (124,'Brave Little Toaster',3,'1983-01-01 00:00:00','An interesting side story that happened about this time concerned another Disney animation project. The Brave Little Toaster was being story-boarded by Lasseter and Jo Ramf(sp?), but when Ron Miller (then head of Feature Animation) was ousted, so was the project. For those of you who know the film (and if you have kids you should!) all the characters were household appliances, including a lamp, a radio, and a vacuum cleanerâ€¦all of whom would have been created in 3D CG by MAGI. However Tom Wilhite left Disney and formed Hyperion Animation in order to independently produce the film, and the MAGI work never was to be.',NULL,NULL,NULL,1,'2012-08-21 15:54:59','2012-08-21 15:55:01','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (125,'Perlin makes some noise',3,'1983-01-01 00:00:00','In 1983-84 at MAGI Ken Perlin developed his now famous â€œPerlin Noise and Turbulenceâ€ techniques of creating solid and procedural textures that are now commonly used everywhere in the CG industry. (It earned him an Academy Award for Technical Achievement in 1997 too). ',NULL,NULL,NULL,1,'2012-08-21 15:57:15','2012-08-21 15:57:16','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (126,'\'The Fly\' on the wall ',3,'1985-01-01 00:00:00','Sythavision\'s work can be seen in David Cronenberg\'s, The Fly, where the main character, Seth Brundel plays a visual sequence on his computer that explains that his DNA has been mixed with a housefly. The work is not credited in the film.',NULL,NULL,NULL,1,'2012-08-21 15:59:12','2012-08-21 15:59:13','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (127,'Buyout and new owners ',3,'1984-01-01 00:00:00','The Synthavision division was sold off in 1984 to a holding company in Toronto Canada run by Bob Robbins and Leo Grey. The companyâ€™s new president was David Boyd Brown(Blue Sky). \nThe first main project for Synthavision after the by-out was a laser video disk arcade game called Robot Rebellion which required the player to pilot a small LV1 robot to the core of a mining asteroid to overcome a mine full of crazed robots and booby traps and regain control of the colony by punching in a color code they learned along the way. Hazards included CG fire created with KPL(Ken Perlin Language) texture code.\nThe finished project had was shopped around to gaming companies like Bally and Atari, but unfortunately occurred as the downturn in arcade gaming began. Like many other computer graphic production companies of the 1980\'s, Sythavision collapsed under the heavy overhead costs and enormous capital debt of the purchase of the technology. ',NULL,NULL,NULL,1,'2012-08-21 16:01:07','2012-08-21 16:01:09','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (128,'Scrubbing Bubbles curse!',3,'1986-01-01 00:00:00','The very last project that Sythavision did was a commercial featuring DOW Chemical\'s Scrubbing Bubbles in their first CG incarnation. These, I\'m told, are the same characters that Cranston/Csuri where working on when they folded later. We all watched PDI with interest when they took on Scrubbing Bubbles. Fortunately they survived the curse.',NULL,NULL,NULL,1,'2012-08-21 16:02:35','2012-08-21 16:02:36',NULL,NULL);
INSERT INTO `acos` VALUES (129,'The End',3,'1986-08-01 00:00:00','Synthavisionâ€™s parent company went out of business in the fall of 1986. Arcca was the reformation of Sythavision staff and software to do the Captain Power television series for Landmark Entertainment. \nThe CAD/CAM division of Magi had been sold to Lockheed Aerospace in 1982/83, while MAGI Computer Slides Corp. was purchased in 1986 from MAGI for $4million and renamed MAGICorp.\n',NULL,NULL,NULL,1,'2012-08-21 16:03:43','2012-08-21 16:03:49','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (130,'The End',3,'2007-12-01 00:00:00','Mental Images was acquired by NVIDIA in December of 2007.',NULL,NULL,NULL,1,'2012-08-21 16:11:51','2012-08-21 16:11:52',NULL,NULL);
INSERT INTO `acos` VALUES (131,'1991 Demo Reel',1,NULL,NULL,'http://www.youtube.com/watch?v=5ZDSAHHg1Co','5ZDSAHHg1Co',NULL,1,'2012-08-21 16:16:04','2012-08-21 16:16:06',NULL,NULL);
INSERT INTO `acos` VALUES (132,'Stimpy you FOOL!',3,'1992-01-01 00:00:00','A little known fact is that MetroLight also created 3D effects for several Ren & Stimpy episodes. In one scene, George Liquor sees Ren through a pet store window which was rendered in 3D with reflections and refractions. Another 3D effects included a full blown snowstorm effect. ',NULL,NULL,NULL,1,'2012-08-21 16:17:53','2012-08-21 16:17:55','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (133,'first hardware and software',3,'1987-01-01 00:00:00','Initially new SGI 3130 computers were purchased for the new company, running software from a relatively new company called Wavefront. At this same time Robert Abel and Associates had just gone out of business with that companies landlord acquiring much of the production equipment upon its closing. MetroLight then purchased this gear for itself (which included Evans & Sutherland computers, Mitchel cameras, motion control equipment, and other hardware.',NULL,NULL,NULL,1,'2012-08-21 16:18:38','2012-08-21 16:18:58','CG101: A Computer Graphics Industry Reference','www.cg01.com');
INSERT INTO `acos` VALUES (134,'Fun Fact!',3,'1987-01-01 00:00:00','Before MetroLight was chosen as the official name, it was originally called North Light Studios (until it was found that this name was already taken)',NULL,NULL,NULL,1,'2012-08-21 16:19:42','2012-08-21 16:19:44','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (135,'First job',3,'1987-01-01 00:00:00','MetroLightâ€™s first job was a intro for National Geographic, Directed by Jeff Doud. The rendering was done at 1k at 1:1.33 aspect ratio for both film and television markets. Jeff was soon after hired to work at MetroLight as an Art Director, and then to Click3x in Atlanta. ',NULL,NULL,NULL,1,'2012-08-21 16:20:53','2012-08-21 16:20:55','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (136,'Total Recall ',3,'1989-01-01 00:00:00','For their first attempt at feature film work, MetroLight shared a Special Achievement Visual Effects Academy Award for 1989\'s Total Recall. The project required animating 3D CG \"skeletons\" in a life size walk-through X-ray machine. Initially an early optical motion capture system from Motion Analysis was tested on Arnold (complete with sticking ping-pong balls all over him!). Eventually though the problems with the system necessitated a backup plan. The rear camera used behind the X-ray in the motion capture set up was used to capture footage that was rotoscoped for the key frames used in the final character animation. Paul Verhoven, then new to CG technology was very accommodating to the MetroLight crew, although he vetoed the idea of putting muscles on the X-ray skeletons. The hope was that this would help to differentiate Arnolds large physique from the other â€œnormalâ€ sized human skeletons, but it was not to be.',NULL,NULL,NULL,1,'2012-08-21 16:22:05','2012-08-21 16:22:07','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (137,'Fun Factoid! ( Total Recall )',3,'1990-01-01 00:00:00','Although MetroLight was only acknowledged by company name in the films credits, Verhoven rewarded the company with allotments for additional personal credits in the video release. ',NULL,NULL,NULL,1,'2012-08-21 16:23:33','2012-08-21 16:23:34','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (138,'software update',3,'1988-05-01 00:00:00','In May of 1988 MetroLight decided that it wanted a more robust rendering software solution than was provided by Wavefront at the time. Yung-Chen began work on the in-house code only to loose all his data four months later in a series of software backup failures. More for the better the second time around, the code (finished in spring of â€˜89) was fast, and enough to carry them until about 1991/92 when they began using Renderman. At this same time Alias was selling there product modularly and MetroLight decided on their superior modeling package rather than write their own code for this task. Alias animation eventually replaced Wavefront Preview, with Composer also being recently replaced with Chalice for compositing. Maya was also being introduced as the all around tool of choice, (Although Con Pederson was still using Abel software up until very recently :)',NULL,NULL,NULL,1,'2012-08-21 16:25:25','2012-08-21 16:25:29',NULL,NULL);
INSERT INTO `acos` VALUES (139,'Two division',3,'1987-01-01 00:00:00','From the very beginning, MetroLight had two separate divisions, each ultimately with about 65 employees. The main 3D production division, and MetroCel the 2D ink and paint division. Mits Kaneko actually directed the overall development of the 2D software, Mark Steeves ran the division and Charles Scalfani was the lead programmer. The â€œannieâ€ software was ready for production work by about 1991 and was used in such television shows as Ren & Stimpy.',NULL,NULL,NULL,0,'2012-08-21 16:26:20','2012-08-21 16:26:55','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (140,'\"Annie\" and \"7th Level\"',3,'1994-01-01 00:00:00','In 1994 the MetroCel software â€œannieâ€ was sold to the interactive company â€œ7th Levelâ€, who were going public with the backing of a certain investment banker named Michael Milken.',NULL,NULL,NULL,1,'2012-08-21 16:27:50','2012-08-21 16:28:12','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (141,'Special Venue',3,'1990-01-01 00:00:00','Over the years MetroLight has also contributed to a number of large format films, including the Korean â€œStar Questâ€ (with DreamQuest providing practical effects) and an Imax Intel show. Two such large format projects are currently in production; one for a summer 1999 release in Universalâ€™s new Florida theme park, and another in Orlando for Sigfreid and Roy, produced by L Squared.',NULL,NULL,NULL,1,'2012-08-21 16:29:11','2012-08-21 16:29:12','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (142,'First hardware and software',3,'1980-01-01 00:00:00','In 1981 they had also just installed a computer animation system, which consisted of a Hewlett Packard desktop machine, programmed in Basic, which drove a plotter. The plotter had no pens - instead, it had a fibre-optic light source where the pen went - this was pointed at the camera film plane. The lens would open, a colored gel would rotate in front of the lens, and the plotter would draw a wire-frame layer directly onto the film emulsion. Then the color would change, and more lines would be drawn. Of course, this all took place in a black box. This multi-layered approach could take minutes to do a single frame. There was no way of knowing what you had until you unloaded it, took it to the labs, waited overnight, went back to the labs, brought it back, laced it up and viewed it on the Movieola.â€\nThe quality of the light was uneven, and the guy who helped build it spent a lot of time trying to control light intensity down fibre-optic cable. He was an Australian named was Mike Boudry, the later founder of CFC.â€',NULL,NULL,NULL,1,'2012-08-21 16:33:54','2012-08-21 16:33:55',NULL,NULL);
INSERT INTO `acos` VALUES (143,'Ed, Alvy and David : first hardware and software',3,'1974-01-01 00:00:00','Ed Catmull had just finished his Ph.D. at Utah and taken a job at a CAD/CAM company called Applicon. It was not a hard sell to get Ed to leave Applicon for NYIT however, so he and fellow Utah graduate Malcolm Blanchard packed their bags for New York. Alvy Ray Smith and David DiFrancesco (both fresh from Xerox PARC) joined the team a few months later in what was called the â€œGerry Mansionâ€. Alvy and David had heard of Dr. Schureâ€™s plans from  Martin Newell at Utah (whom Alex had just hired briefly as a consultant). Dr. Schure had recently come through Utah and literally ordered â€œone of everythingâ€ to jump start his NYIT project. Some of this equipment included a DEC PDP-11, a new E&S LDS-1 and the first random access frame buffer also from E&S. Later, the CGL group would also receive the very first commercial VAX',NULL,NULL,NULL,1,'2012-08-21 16:39:04','2012-08-21 16:39:18','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (144,'Fun Factoid! ( VAX almost smashed! )',3,'1975-01-01 00:00:00','VAX ALMOST SMASHED! In fact, the VAX almost never made it inside the building, if not for Alvy Ray Smithâ€™s quick actions. It seems that when the computer was just lowered off the back of the delivery truck, another truck parked behind and uphill had itâ€™s brakes slip, which started it rolling towards the brand new machine. Alvy quickly jumped in the driver-less truck and stopped it just before it could smash the VAX back into the very truck it was just unloaded from.  ',NULL,NULL,NULL,1,'2012-08-21 16:39:55','2012-08-21 16:40:11','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (145,'Notable \"firsts\"',3,'1975-01-01 00:00:00','The CGL quickly attracted other technology experts and artists, including Christy Barton(from E&S), Tom Duff, Lance Williams, Fred Parke, Garland Stern, Ralph Guggenheim, Ed Emshwiller, and many others. \nThroughout the 1970s, the people of the CGL thrived in a pioneering spirit, creating milestones in many areas of graphic software. Many of the â€œfirstsâ€ that happened at NYIT were based on the development of the first RGB full color (24bit) raster graphics. \n\nA few of the more notable â€œfirstsâ€:\nâ€¢First RGB anything (because they had the first RGB framebuffers in the world).\nâ€¢First RGB paint program (Paint by Alvy Ray Smith).\nâ€¢First soft-edged fill (Alvy Ray again). \nâ€¢First computer-controlled video editing. First TV \ncommercial with raster graphics (Lance, I think, or maybe\nit was Ephraim Cohen). \nâ€¢First pixel dissolve. \nâ€¢First networked computer system (Christy rolled our own for us). \nâ€¢The alpha channel is invented by Ed Catmull and Alvy Ray Smith. \nâ€¢First hidden surface algorithm within a pixel (Ed).\nâ€¢Lance Williams invented mipmapping (texture mapping is \nstill done this way today). \nâ€¢Garland Stern implemented the first scan and paint \nsystem (this is how the Disney/Pixar CAPS system now makes 2D animation - different system but same idea).\n',NULL,NULL,NULL,1,'2012-08-21 16:41:14','2012-08-21 16:41:41','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (146,'Strangest job title ever',3,'1974-01-01 00:00:00','Alvy Ray Smith would later accidently come across an organization chart for the lab put together by Dr. Shure. Ed Catmull was running the lab of course but there where people listed above and below him that no one had even heard of. Alvy was particularly amused to find that his official title was â€œInformation Quantaâ€. A term very much in keeping with Dr. Shureâ€™s somewht unique, and non-standard form of communicating.',NULL,NULL,NULL,1,'2012-08-21 16:42:27','2012-08-21 16:42:52','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (147,'2D was king',3,'1975-01-01 00:00:00','Ed Catmullâ€™s Tween, Alvy Ray Smithâ€™s Paint program, and the 2D animation program SoftCel, all were in keeping with the original charter of the CGL, which was 2D CG. There were also many breakthroughs in image techniques involving fractals, morphing, image compositing, and Mip-Map texture mapping and many others. Key to this pioneering effort was the seemingly unlimited financing evidenced by Alex Schure. One such example took place when Alvy Ray Smith spoke with Alex about how good it might be to have not just the one, but three frame buffers. This way, Alvy explained, the three 8bit buffers could be combined to create the first RGB color frame buffer ever! Sometime later Alex not only delivered the two additional frame buffers, but an additional 3, which gave the CGL team a grand total of 6. (â€œEnough for two of those RGB thingsâ€ said Alex.) At $60,000 each (plus the $80,000 for the first) what this meant in todayâ€™s dollars was that on a simple request, Alex had just delivered about $2million worth of equipment.',NULL,NULL,NULL,1,'2012-08-21 16:43:37','2012-08-21 16:43:39','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (148,'Summer intern',3,'1976-07-01 00:00:00','Jim Blinn even worked at the CGL as a summer intern in 1976.',NULL,NULL,NULL,1,'2012-08-21 16:46:05','2012-08-21 16:46:06','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (149,'Tubby The Tuba',3,'1975-01-01 00:00:00','At this same time as the CGL was up and running, Alex had about 100 traditional animators working on a film called â€œTuby The Tubaâ€.  [ MORE INFO NEEDED ]',NULL,NULL,NULL,1,'2012-08-21 16:48:36','2012-08-21 16:49:22','CG101: A Computer Graphics Industry Reference','www.cg101.com');
INSERT INTO `acos` VALUES (150,'Interview on the farm',1,NULL,NULL,'http://www.youtube.com/watch?v=_D-zPmlhlVE','_D-zPmlhlVE',NULL,1,'2012-08-29 09:25:29','2012-08-29 09:25:31',NULL,NULL);
INSERT INTO `acos` VALUES (151,'The Spirit of Spawn',1,NULL,NULL,'http://www.youtube.com/watch?NR=1&v=8_pqwk-WkBc&feature=endscreen','8_pqwk-WkBc',NULL,1,'2012-08-29 11:52:48','2012-08-29 11:52:50',NULL,NULL);
INSERT INTO `acos` VALUES (152,'The Abyss CGI demo',1,NULL,NULL,'http://www.facebook.com/photo.php?v=496656927786','',NULL,1,'2012-08-29 21:27:23','2012-08-29 21:27:25',NULL,NULL);
INSERT INTO `acos` VALUES (153,'The beginning ... 1986-1989',3,'1986-04-01 00:00:00','mental images was incorporated in April of 1986 by Rolf Herken with financial backing from private investors. The first generation of mental ray was begun initially by Robert Hodicke using one Solarity computer along with the first two SGI 3030\'s in Europe. Their initial commercial software used was the first Wavefront license in Europe.',NULL,NULL,NULL,1,'2012-10-24 09:56:29','2012-10-24 09:56:31',NULL,NULL);
INSERT INTO `acos` VALUES (154,'Softimage integration',3,'1993-01-01 00:00:00','In 1993 mental ray and Softimage Inc. of Canada entered into a rendering technology agreement under the terms of which version 1.9 of mental ray was integrated into version 3.0 of Softimage|3D',NULL,NULL,NULL,1,'2012-10-24 09:59:23','2012-10-24 10:00:03',NULL,NULL);
INSERT INTO `acos` VALUES (155,'Version 2.0 ... 1994-1998',3,'1994-01-01 00:00:00','Version 2.0 was developed and led by project leader and software engineer Thomas Dreimeyer.',NULL,NULL,NULL,1,'2012-10-24 10:03:54','2012-10-24 10:03:56',NULL,NULL);
INSERT INTO `acos` VALUES (156,'Academy Award',3,'2003-01-01 00:00:00','Mental Images was awarded an Academy Award in 2003 for their pioneering excellence in computer graphic software development. ',NULL,NULL,NULL,1,'2012-10-24 10:14:26','2012-10-24 10:14:29','','www.mentalimages.com');
INSERT INTO `acos` VALUES (157,'animation systems ',3,'1972-01-01 00:00:00','Early animation language projects focused on a new concept of user friendliness termed \"habitability\" by Tom DeFanti. This was promoted as an interface to the real-time systems consisting of dials and joysticks. Some examples include : GRASS (Graphics Symbiosis System) animation programming language was written by Tom DeFanti in 1972; ANIMA motion language was written by Manfred Knemeyer in 1973; ANIMA II was developed with contributions from Ron Hackathorn, Alan Myers, Richard Parent, and Tim Van Hook and TWIXT designed by Julian Gomez as a \"track-based keyframe animation system.\"',NULL,NULL,88,1,'2012-10-24 10:55:57','2012-10-24 10:55:58',NULL,NULL);
INSERT INTO `acos` VALUES (158,'character animation',3,'1985-01-01 00:00:00','A great many individuals at Ohio State created award-winning, character-based short animations including Tuber\'s Two Step by Chris (Blue Sky) Wedge and Snoot and Muttly by Susan Van Baerle and Doug Kingsbury.',NULL,NULL,88,1,'2012-10-24 10:57:56','2012-10-24 10:57:57',NULL,NULL);
INSERT INTO `acos` VALUES (159,'Tuber\'s Two Step - 1985',1,NULL,NULL,'http://www.youtube.com/watch?v=k-GZ0PogVLw','k-GZ0PogVLw',NULL,1,'2012-10-24 10:58:28','2012-10-24 10:59:46',NULL,NULL);
INSERT INTO `acos` VALUES (160,'Snoot and Muttly - 1984',1,NULL,NULL,'http://www.youtube.com/watch?v=3RlrtAf7Qsg','3RlrtAf7Qsg',NULL,1,'2012-10-24 10:59:34','2012-10-24 10:59:35',NULL,NULL);
INSERT INTO `acos` VALUES (161,'The Advanced Computing Center for the Arts and Design (ACCAD)',3,'1987-01-01 00:00:00','In 1987, Chuck Csuri and Tom Linehan (later President of the Ringling School of Design) converted the Computer Graphics Research Group into The Advanced Computing Center for the Arts and Design (ACCAD). With funding from a long-term Ohio Board of Regents grant, ACCAD was established to provide computer animation resources in teaching, research, and production for all departments in the College of the Arts at Ohio State. ',NULL,NULL,88,1,'2012-10-24 11:04:32','2012-10-24 11:05:37',NULL,NULL);
INSERT INTO `acos` VALUES (162,'Wayne Carlson',2,NULL,NULL,'http://design.osu.edu/carlson/images/WayneCarlson.jpg',NULL,NULL,1,'2012-10-24 11:12:39','2012-10-24 11:19:49',NULL,NULL);
INSERT INTO `acos` VALUES (163,'In the beginning ... ',3,NULL,'In 1983, they installed a DEC VAX 11/750 and produced the first CG commercial in Canada. In 1983, an IPO (which raised $4.2 million) made Omnibus the first publicly traded CG company. The plan was to expand and operate three main facilities: Toronto, New York, and Los Angeles. The original Toronto location was for computer operations and for Canadian broadcast and agency work. Its production group was run by Dan Philips (later head of CG production at Dreamworks). The New York facility, for video broadcast and recording, was on 57th Street West under a lease from Unitel Video Inc. The Los Angeles location was intended primarily for motion picture film work. All three were linked by satellite by the end of 1984. (The satellite link amounted to modems for many months and finally a WAN that was painfully slow and unreliable.) As part of the initial expansion in mid-1984, several larger VAX 11/780 systems were installed at the Toronto facility.',NULL,NULL,NULL,1,'2012-10-24 11:29:14','2012-10-24 11:29:56',NULL,NULL);
INSERT INTO `acos` VALUES (164,'\"My first day on the job\"',3,'1984-05-22 00:00:00','\"I remember walking in past reception to where the animators worked. There was Eric Ladd hunched over a massive drafting table. He was digitizing by hand the x, y, and z coordinates of a horse. Someone had drawn about five sectional slices of a horse on 4 foot by 3 foot graph paper, one slice per paper. Eric was calculating the x,y values from the grid and was writing down the coordinates on a piece of paper, later typing them in, manually creating several .ppt files. There was no digitizing tablet to be found anywhere. Later, on a tour of the edit suite, I saw Mike Johnson feeding paper tape containing the boot program through the ESS, a still store capable of holding 30 seconds of video on its RK05 disks.\"',NULL,NULL,187,1,'2012-10-24 11:31:37','2012-10-28 11:39:18',NULL,NULL);
INSERT INTO `acos` VALUES (165,'Omnibus LA',3,'1985-01-01 00:00:00','Omnibus/LA (which was now majority-owned by Santa Clara-based Ramtek) hired David Sieg from Image West as VP of R&D and a team of programmers from CalTech working with Al Barr, Brian Von Herzen, and many others. In addition to developing its own software (called Prisms), Omnibus obtained several exclusive software license agreements with Robert Abel & Associates and Triple-I. (The deal with Abel originally was signed to last seven years, the Triple-I deal until the year 2001. This is a moot point given the abbreviated future of the companies.) To start up the Omnibus/LA facility, they bought the F1 computer system and older film printers (called PFRs) from Triple-I (which had just shut down their CG group) and started working out of the Triple-I offices in Culver City. Omnibus/LA soon moved to the Paramount Studios lot in Hollywood, sharing facilities with Unitel Video. Art Durinski was hired as Creative Director and staffed the initial dozen employees. Among these employees were a number of students from UCLA where he had been teaching.',NULL,NULL,NULL,1,'2012-10-24 11:34:40','2012-10-24 11:34:54',NULL,NULL);
INSERT INTO `acos` VALUES (166,'Star Trek III',3,'1984-01-01 00:00:00','The first feature film contract  Omnibus worked on was for Paramount Pictures\' Star Trek III. Omnibus (one of three companies to contribute effects) created a number of video graphics displays seen on the bridge of the Enterprise and Klingon starships. About 30 to 40 computer-generated video clips comprised almost an hour\'s worth of imagery. Artists included Technical Director Dan Krech and Animator Dan Philips.',NULL,NULL,NULL,1,'2012-10-24 11:38:24','2012-10-24 11:38:45',NULL,NULL);
INSERT INTO `acos` VALUES (167,'DOA',3,'1986-06-01 00:00:00','In June of 1986, Omnibus bought Digital Productions. Omnibus was approached by the Digital Productioons majority owner Control Data, which was desperate to get out from under the increasing debt of DP. In September of that same year, Omnibus also bought Robert Abel & Associates for $6.5 million. Abel likewise was on the verge of bankruptcy and was led to believe that Omnibus was a legitimate bid from a publicly held and stable company. The management at Omnibus saw the purchases as a way to consolidate the best of everything (and all their customers) into a single monolithic parent company. Unfortunately, nothing was as it appeared, as everyone soon found out.',NULL,NULL,NULL,1,'2012-10-24 11:40:44','2012-10-24 11:49:13',NULL,NULL);
INSERT INTO `acos` VALUES (168,'The work that could have saved us ..',3,NULL,'\"The Omnibus management knew nothing about computer animation but kept muttering about \'Economies of Scale.\' The reality was: three separate sales forces, three separate production crews, three separate facilities, philosophies, software systems, and hardware systems, none of which were likely to ever work together. What is ironic is that the next Star Trek movie was about to go into production and had tons of CGI work in it. We had good contacts with the right people, and we did some amazing tests (I have videotape!) of the Enterprise that blew the modelmakers away. But they were too scared Omnibus would go under to give us the contract that would have saved us.\" ',NULL,NULL,106,1,'2012-10-24 11:50:37','2012-10-24 11:51:00',NULL,NULL);
INSERT INTO `acos` VALUES (169,'The End',3,'1987-04-13 00:00:00','In early 1987, with a debt of about $25 million, Omnibus defaulted on investments and closed Abel, DP, and Omnibus on April 13, 1987.\n\nAn Omnibus Japan still exists today and uses the 3D Omnibus orb logo. www.omnibusjp.com ',NULL,NULL,NULL,1,'2012-10-24 11:58:39','2012-10-24 11:58:41',NULL,NULL);
INSERT INTO `acos` VALUES (170,'Side Effects birth ',3,NULL,'Kim Davidson and Greg Hermanovic purchased the rights to the Prisms source code and started Side Effects Productions, which later became Side Effects Software.',NULL,NULL,NULL,1,'2012-10-24 11:59:31','2012-10-24 11:59:33',NULL,NULL);
INSERT INTO `acos` VALUES (171,'Chromosaurus - 1985',1,NULL,NULL,'http://www.youtube.com/watch?v=HOUYSLStGak','HOUYSLStGak',NULL,1,'2012-10-24 12:10:57','2012-10-24 12:11:00',NULL,NULL);
INSERT INTO `acos` VALUES (172,'in the beginning ...',3,NULL,'The first PDP-11/44 was used for programming much of the original proprietary code written by Richard and Glenn (and Carl, too). Richard concentrated on the renderer and later on lighting tools. A DeAnza framebuffer also was used early on. Their very first jobs were doing broadcast graphics for Jose Diaz of Brazilian Globo Television.\n',NULL,NULL,NULL,1,'2012-10-24 12:12:55','2012-10-24 12:12:57',NULL,NULL);
INSERT INTO `acos` VALUES (173,'commercials .. good business sense',3,NULL,'By the late 1980s, PDI was using Ridge UNIX workstations (similar to those by Solarity) and controlled about 60 percent of the high-end commercial broadcast market. Clients included virtually every network and cable channel along with hundreds of affiliate local stations. From the very beginning, it was clear that PDI (and Carl, in particular) had a uniquely keen business savvy that enabled the company to thrive through a time when CG company bankruptcies otherwise were the norm. At least two key strategies were instrumental to PDI\'s continued financial success. First, unlike most companies that were going heavily into debt to finance \"glamorous\" feature film work, PDI concentrated through the 1980s on the lucrative commercial market. Their early reputation in broadcast graphics work made the transition to film work easy. The second important factor that kept the books in the black was the wise decision to purchase and use \"last year\'s\" models of computer equipment and to depreciate it in just a few short years.',NULL,NULL,NULL,1,'2012-10-24 12:14:17','2012-10-24 12:14:19',NULL,NULL);
INSERT INTO `acos` VALUES (174,'Opening the LA office',3,NULL,'In 1990, however, PDI opened a feature film production office in LA for work on its first film project, the Japanese-funded Solar Crisis. New equipment included a film scanner built by none other than Les Dittert and a Management Graphics film recorder. (The effects work was optically composited.) \nWork continued on many feature films including T2 and  several Batman films. In 1994, PDI closed the LA office, and several key employees (including Jamie Dixon and Thad Bier) stayed in LA to form HammerHead.',NULL,NULL,NULL,1,'2012-10-24 12:15:38','2012-10-24 12:17:39',NULL,NULL);
INSERT INTO `acos` VALUES (175,'Terminator 2',3,NULL,'Soon after opening the LA office, PDI got a big break with some lesser-known but still important work on Terminator2: Judgment Day. PDI did a number of different \"invisible\" effects such as wire removal and digital plate reconstruction.',NULL,NULL,NULL,1,'2012-10-24 12:16:48','2012-10-24 12:16:49',NULL,NULL);
INSERT INTO `acos` VALUES (176,'Early morphing success ',3,NULL,'Meanwhile, back at home base in Sunnyvale, PDI was continuing to set new standards in broadcast commercial CG techniques. In 1991â€“92 the technique of morphing was used with great success on numerous projects. The first was a Plymouth Voyager commercial, followed soon by the Exxon tiger and the famous Michael Jackson video \"Black or White.\" A perfect subject that was perfectly executed, the \"Black or White\" video only served to increase the demand for this new technology in broadcast work.',NULL,NULL,NULL,1,'2012-10-24 12:20:14','2012-10-24 12:20:35',NULL,NULL);
INSERT INTO `acos` VALUES (177,'early 3D character animation',3,NULL,'Along with the strong 2D effects work being produced, PDI also began very early to experiment and create 3D character animation. Waldo, the first ever 3D CG real-time animated \"muppet,\" was created for the Jim Henson Hour in 1988. The Crest Toothpaste \"Singers\" (1988) and DOW Scrubbing Bubbles (1989) commercials were followed by the Last Halloween television special in 1991 (based on the M&M Mars candy commercial campaign started by ILM). In 1994, PDI broke a long-standing stop-motion tradition by introducing a 3D CG Pillsbury Doughboy with the \"Mambo\" spot. The Doughboy would in fact continue to be created by PDI for another four years. Gradually, more subtle enhancements crept into the spots including motion blur, which originally was intentionally left out to more closely resemble the look of stop-motion animation.',NULL,NULL,NULL,1,'2012-10-24 12:21:57','2012-10-24 12:22:21',NULL,NULL);
INSERT INTO `acos` VALUES (178,'first Dreamworks partnership',3,'1996-03-01 00:00:00','The year 1995 saw Carl knocking on Hollywood studio doors again, this time with better results. In March 1996, PDI signed a co-production deal with Dreamworks to create the original computer-animated feature film Antz. The hugely successful Shrek (2001) was to be followed by Tusker before that project was canceled. Shrek 2 (2004) and finally Madagascar in 2005 were the companies last films to be produced under the PDI/Dreamworks moniker.',NULL,NULL,NULL,1,'2012-10-24 12:23:28','2012-10-24 12:23:30',NULL,NULL);
INSERT INTO `acos` VALUES (179,'short films',3,NULL,'PDI always has gone beyond pure commercialism with its support of short animated films for their own sake. Some of the earliest memorable SIGGRAPH clips include Happy Drinking Birds, Chromosaurs, Opera Industrial, Cosmic Zoom, Burning Love, Max\'s Place, Locomotion, and Gas Planet. More shorts include Gabola the Great, Sleepy Guy and Fat Cat.',NULL,NULL,NULL,1,'2012-10-24 12:24:13','2012-10-24 12:24:16',NULL,NULL);
INSERT INTO `acos` VALUES (180,'Academy Award',3,NULL,'In 1998, Richard Chuang, Glenn Entis, and Carl Rosendahl were awarded a Scientific and Technical Achievement Award for the concept and architecture of the PDI Animation System.',NULL,NULL,NULL,1,'2012-10-24 12:24:51','2012-10-24 12:24:51','','');
INSERT INTO `acos` VALUES (181,'The End (but not really)',3,NULL,'By 2004 Dreamwork had acquired full ownership of PDI, LLC and now operates that campus as part of Dreamworks Feature Animation.',NULL,NULL,NULL,1,'2012-10-24 12:28:12','2012-10-24 12:28:13',NULL,NULL);
INSERT INTO `acos` VALUES (182,'How PIXAR got its name!',3,NULL,'Here is the story of how Pixar got its name: It was 1981 and the Computer Graphics Group at Lucasfilm was developing the hardware and software for a digital imaging \"scanning/manipulating/filming computer-machine.\" David DiFrancesco was the hardware guy, Loren Carpenter was the software guy, and Alvy Ray Smith managed the project. When it came time to write up a formal proposal about the new device, it seemed appropriate to come up with a catchy name for the middle component of the system, the computer that did the image processing between the scanning and the filming.\nOne night over dinner (at Franks Country Garden restaurant in Bel Marin Keys, California), four men got around to discussing the topic of a name. Present were Rodney Stock (a hardware consultant), Jim Blinn (who worked at Lucas for a short time), Loren Carpenter, and Alvy Ray Smith. Because the hope was for this clever device to actually \"make pictures,\" the name Picture Maker was suggested. This quickly was rejected in favor of Alvy\'s suggested contraction of Pixer. Loren then made the suggestion to change it to Pixar (it had a nicer ring to it), and the rest is history.\nLoren relates that there occasionally are some attempts to put a greater meaning to the word after the fact (such as \"Programmed Image transformation[X] And Render\") but the true story has now been told.\n',NULL,NULL,NULL,1,'2012-10-24 12:38:19','2012-10-24 12:38:21',NULL,NULL);
INSERT INTO `acos` VALUES (183,'The pixar image computer',3,NULL,'In the first few years, the Pixar Image Computer sold well to a few (very different) client markets. For instance, Philips bought more than 20 systems to use in the medical image-processing market, and Disney made a significant partnership with Pixar to develop the graphics end of what would eventually become Disney\'s CAPS system. Roy Disney himself wanted to get his company back into feature animation in the right way, and this was seen (wisely) as an investment in the future technology of 2D animation production.\nEd Catmull and Pixar soon realized, however, that the 2D image-processing power of the Image Computer was not a moneymaker. They felt its days were numbered because of the ever increasing power and low cost of new general-purpose PCs. Ed chose, however, not to drop the hardware development business right away, mainly because the CAPS deal with Disney was entirely based on the Pixar Image Computer, and he did not want to leave them high and dry. Ed also knew it was only a matter of a time before they could port the CAPS development to the new SGI platform; it was just a matter of waiting it out while they continued to lose money. Just then, Ed received a call from one of their chief competitors in the image-processing market, a company called Vicom. Vicom was taking the position that to make that market more successful, all the competitors should join forces with one product. \"Would Pixar be willing to sell their hardware outright to Vicom?\" Ed: \"Let me think about that and get back to youâ€¦\" (Ed smiles to himself). Ed happily sold the Pixar Imaging Computer hardware business to Vicom for $2 million, hoping that they could keep it as a viable product just long enough for the Disney CAPS system to transition over to SGI, which is exactly what happened.\n',NULL,NULL,NULL,1,'2012-10-24 12:40:48','2012-10-24 12:40:50',NULL,NULL);
INSERT INTO `acos` VALUES (184,'the pixar image computer',2,NULL,NULL,'http://s7.computerhistory.org/is/image/CHM/102621974p-03-01?$re-zoomed$',NULL,NULL,1,'2012-10-24 12:42:40','2012-10-24 12:42:42',NULL,NULL);
INSERT INTO `acos` VALUES (185,'early commercial work',3,NULL,'About 1990 or so the Commercial Division was started to cut some teeth on real production experience. The Listerene, Life Savers, and Tropicana spots immediately stood out as being in a creative class by themselves. Produced in conjunction with Colossal Pictures, they blended what was (and continues to be) Pixar\'s trademark realistic rendering \"look\" with outstanding character animation and humor. It was at this time that Andrew Stanton and Pete Doctor joined the company as animators. The hope was to get the hang of commercial production and then step up to make a half hour television short film based on Tinny from the Tin Toy short film.',NULL,NULL,NULL,1,'2012-10-24 12:44:20','2012-10-24 12:44:22',NULL,NULL);
INSERT INTO `acos` VALUES (186,'\'Toy Story\' and the 3 picture deal with Disney',3,NULL,'in 1991, Ed Catmull made a three-picture deal with Disney to create fully CG-animated films. Disney\'s point of view was that if Pixar was ready to commit to a half hour show, then doing an 85-minute feature film really shouldn\'t be that much of a stretch. (Yeahâ€¦ sure!) The first film, to be called Toy Story, was given a budget of only $17 million. Although the final cost was considerably more than that, it still was considerably less than the cost of a traditionally animated Disney feature film.',NULL,NULL,NULL,1,'2012-10-24 12:45:55','2012-10-24 12:45:56',NULL,NULL);
INSERT INTO `acos` VALUES (187,'\'Toy Story\' rendering power ',3,NULL,'Toy Story was rendered with a render farm consisting of some 300 Sun computers, each with roughly the processing power of one original Cray 1 Supercomputer. (A Bug\'s Life used 1,400 SUN computers, each with a processor upgrade that was three to four times faster than the ones used on Toy Story! You do the math.',NULL,NULL,NULL,1,'2012-10-24 12:46:43','2012-10-24 12:46:44',NULL,NULL);
INSERT INTO `acos` VALUES (188,'the early short films ',3,NULL,'After AndrÃ© and Wally B. (1984), while still part of Lucasfilm, there was Luxo Jr. (1986), Red\'s Dream (1987), Tin Toy (1988), and Knick Knack (1989). More recent shorts include Geri\'s Game (1997), For the Birds (2000), Mikeâ€™s New Car (2002), Boundinâ€™ (2003), One Man Band (2005), Lifted (2006), Presto (2008), Partly Cloudy (2009), Day and Night (2010), La Luna (2011).',NULL,NULL,NULL,1,'2012-10-24 12:49:35','2012-10-24 12:59:21',NULL,NULL);
INSERT INTO `acos` VALUES (189,'Pixarvision laser film recorder',3,NULL,'David DiFrancesco culminated his 20 years of pioneering film-recording technology knowledge in 1998 into PixarVision, for which he was awarded an Academy Award in 1999. This laser-based recording system at the time was the finest and fastest in the world, operating with 35mm, 65mm, and VistaVision film stocks at between four and eight seconds a frame. The system was tested on Bugs, and saw full use on Pixar\'s next film Toy Story II. \n\nPixarVision Factoid! : Early problems with the PixarVision laser film recorder eventually were tracked down to the air-conditioning system that keeps Pixar\'s vast render farm cool. The AC system was so large that the vibrations caused the whole building to vibrate just enough to throw the delicate film recorder\'s quality off!',NULL,NULL,NULL,1,'2012-10-24 13:00:06','2012-10-24 13:01:02',NULL,NULL);
INSERT INTO `acos` VALUES (190,'Point Richmond to Emeryville',3,NULL,'In 1998 Pixar relocated south a dozen miles from Point Richmond, CA to a brand new campus in Emeryville. Shortly thereafter they released Monsters, Inc. in 2001.',NULL,NULL,NULL,1,'2012-10-24 13:01:46','2012-10-24 13:01:47',NULL,NULL);
INSERT INTO `acos` VALUES (191,'first real-time performance animation',3,NULL,'Brad previously (along with partner Michael Wahrman of deGraf/ Wahrman) had created the first real-time character performance, Mike the Talking Head, at Siggraph 1988. Brad also was part of the team that Jim Henson contracted at Digital Productions in 1988 to digitize Kermit the Frog. \n\nMoxy, the first-ever live 3D character for television, was created and originally produced by Protozoa\'s founders while at Colossal Pictures in 1993 (and later by Turner Productions). Turner also licensed Protozoa\'s Alive for the Cartoon Network.\n\nZiff-Davis Television bought Alive and Dev Null from Protozoa to co-host The Site on MSNBC. They produced more than 20 minutes a week for over a year, viewed by 55 million homes worldwide. This makes Dev easily the most widely seen virtual character in the world.',NULL,NULL,NULL,1,'2012-10-24 14:14:17','2012-10-24 14:15:57',NULL,NULL);
INSERT INTO `acos` VALUES (192,'Floops!',3,NULL,'Protozoa also created Floops, the first live 3D episodic cartoon, which has been published twice weekly on the Web for over six months using VRML 2.0 (Virtual Reality Modeling Language). Floops won Best of Show at the 1997 VRML Excellence Awards.',NULL,NULL,NULL,1,'2012-10-24 14:16:59','2012-10-24 14:17:01',NULL,NULL);
INSERT INTO `acos` VALUES (193,'The End',3,NULL,'Protozoa was sold in late 2000 to an internet startup company called Dreamtime which promptly when out of business. Since then Brad DeGraf has focused his attentions to a variety of media, technology and information based social programs.',NULL,NULL,NULL,1,'2012-10-24 14:17:49','2012-10-24 14:17:50',NULL,NULL);
INSERT INTO `acos` VALUES (194,'Floops - 1987',2,NULL,NULL,'http://www.digitalpuppetry.com/articles/sg97/mc_puppetry.gif',NULL,NULL,1,'2012-10-24 14:20:26','2012-10-24 14:20:28',NULL,NULL);
INSERT INTO `acos` VALUES (195,'Bill Kovacs',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/en/3/3b/Bill_Kovacs_11-Sep-2002_at_Rezn8.jpg',NULL,NULL,1,'2012-10-24 14:24:16','2012-10-24 14:24:19',NULL,NULL);
INSERT INTO `acos` VALUES (196,'in the beginning ',3,'1987-04-23 00:00:00','Their very first job (April 23, 1987) was a film project to realize the MGM/UA logo for that studio. This was especially unusual at a time when virtually all CG production work was for broadcast television. The following years were spent creating many different commercial and logo projects, starting with their second job for a New Zealand station.',NULL,NULL,NULL,1,'2012-10-24 14:30:00','2012-10-24 14:30:04',NULL,NULL);
INSERT INTO `acos` VALUES (197,'Flight of the Intruder',3,NULL,'The year 1990 saw some incredible breakthrough work for the feature film Flight of the Intruder. Remember that, at the time, The Abyss had just come out a year before and T2 was still a year away (1991). R&H created more than 30 full-daylight shots of photo-realistic aircraft, cluster bombs, and smoke[md]all with proprietary software. This was truly breakthrough work that unfortunately was not as recognized as it should have been because the film itself did poorly. ',NULL,NULL,NULL,1,'2012-10-24 14:31:05','2012-10-24 14:31:07',NULL,NULL);
INSERT INTO `acos` VALUES (198,'early software code',3,NULL,'With four out of the six original employees being code writers, the in-house software effort had begun from day one. Eventually, four main components were written: animation, modeling, rendering, and compositing. Before all the code was production-ready, however, Wavefront software was used based on an agreement John had made earlier with the company started by his former co-worker Bill Kovaks. While working at Bob Abel\'s on and off from 1976 to 1987, John had his own company called Motion Control Systems (MCS) with partner Jim Keating. Jim, at that time, wrote the model component of the Wavefront code. In exchange for sole rights to that software, Wavefront gave a number of licences to John\'s new company, R&H. Bill Kovacs actually wrote his preview code while consulting for John\'s earlier MCS company, but he retained sole ownership of that software for himself.',NULL,NULL,NULL,1,'2012-10-24 14:32:01','2012-10-24 14:32:02',NULL,NULL);
INSERT INTO `acos` VALUES (199,'Academy Award for Babe',3,NULL,'Rhythm & Hues\' work on Babe won an Academy Award for best Visual Effects. VFX Supervised by Scott Anderson and VFX Produced by Nancy St. John.',NULL,NULL,NULL,1,'2012-10-24 14:33:09','2012-10-24 14:33:11',NULL,NULL);
INSERT INTO `acos` VALUES (200,'acquiring VIFX',3,'1999-03-01 00:00:00','In March of 1999, R&H bought the visual effects CG company VIFX (which was located just two blocks away in Hollywood) from Fox, which had also just recently acquired the company and briefly merged it with Blue Sky. VIFX\'s founder and President Richard Hollander\'s new position is as head of the film effects group, bringing some 80 of VIFX\'s employees with the purchase. ',NULL,NULL,NULL,1,'2012-10-24 14:34:24','2012-10-24 14:34:25',NULL,NULL);
INSERT INTO `acos` VALUES (201,'Larry Cuba visit',3,'1976-01-01 00:00:00','Larry Cuba joined RAA for a short time at the start of 1976, hoping to program the new motion-control computers. He left just four months later, however, to create the famous Death Star graphics for George Lucas\' Star Wars.',NULL,NULL,NULL,1,'2012-10-24 16:51:51','2012-10-24 16:51:52',NULL,NULL);
INSERT INTO `acos` VALUES (202,'Star Trek The Motion Picture .. almost',3,NULL,'Abel assembled a team to work on Star Trek: The Motion Picture, but the work eventually was discontinued at Abel\'s and was completed by Doug Trumbull and others.',NULL,NULL,NULL,1,'2012-10-24 16:52:56','2012-10-24 16:52:57',NULL,NULL);
INSERT INTO `acos` VALUES (203,'early crew and motion control ',3,NULL,'Among Abel\'s early associates were Richard Hollander, John Hughes, Richard Taylor, and Wayne Kimall. By 1979, Abel\'s was a full-service effects company with a miniature shop and six different motion-control rigs to augment live-action footage. A real breakthrough came when they wanted to have a way to preview motion control moves. To this end, Bill Kovacs was hired to modify an E&S real-time vector PS-2 flight simulation computer. A deal was made to acquire the source code for the $100,000 machine in exchange for promising to E&S that Abel\'s would not go into the flight simulator business. Eventually, with new employee Ray Feeney\'s help, the resulting \"Abel/Kovaks box\" drove six axes of movement in both the camera and the motion controlled object for virtually unlimited range of motion combinations.',NULL,NULL,NULL,1,'2012-10-24 16:54:01','2012-10-24 16:54:03',NULL,NULL);
INSERT INTO `acos` VALUES (204,'Abel Image Research - software',3,NULL,'RAA sold its own software under the division Abel Image Research. Bill Kovacs left to found Wavefront, and Frank Vitz took over his job as head of R&D at Abel\'s. ',NULL,NULL,NULL,1,'2012-10-24 16:57:46','2012-10-24 16:57:49',NULL,NULL);
INSERT INTO `acos` VALUES (205,'The Black Hole',3,NULL,'Disney awarded a CG effects job for the film The Black Hole to an independent company called Neo Plastics, which was run by C.D. Taylor and Mick Hagerty. They, in turn, hired John Hughes to create a vector graphics grid/black hole simulation. John rented Abel\'s E&S system and shot the images off the screen, optically compositing the CG with artwork and additional traditional animation. Unfortunately, once he had the job, he also realized that he had to deliver it in a mere 14 days. Not only did John actually finish the job in just nine days, Disney liked it so much they had him repeat the effect for the film\'s opening sequence and one-sheet poster.',NULL,NULL,NULL,1,'2012-10-24 16:59:32','2012-10-24 17:00:10',NULL,NULL);
INSERT INTO `acos` VALUES (206,'Tron - opening credits',3,NULL,'Kenny Merman and Frank Vitz headed the team that produced the opening titles and \"Flynn\'s Ride\" sequences of the movie Tron.',NULL,NULL,NULL,1,'2012-10-24 17:00:43','2012-10-24 17:00:46',NULL,NULL);
INSERT INTO `acos` VALUES (207,'The End  (DOA)',3,'1987-04-13 00:00:00','At its peak, RAA occupied some 45,000 square feet and employed 240 people. With the best of intentions, Robert Abel & Associates was sold in September of 1986 to Omnibus Computer Graphics of Canada for $6.5 million. The hope was to gain much needed capital investment from an established, publicly traded company. As soon as January of 1987, it was clear that all was not right with the new parent company. Sure enough, on April 12 of that year, all the Omnibus people left en mass in the evening. The next day, with word that Omnibus had defaulted on mountains of dept, all of Abel\'s had one last party before packing up for good.',NULL,NULL,NULL,1,'2012-10-24 17:02:15','2012-10-24 17:02:16',NULL,NULL);
INSERT INTO `acos` VALUES (208,'Brilliance (Sexy Robot) - 1985',1,NULL,NULL,'http://www.youtube.com/watch?v=hl2lhtBIt2E','hl2lhtBIt2E',NULL,1,'2012-10-24 17:04:24','2012-10-24 17:04:26',NULL,NULL);
INSERT INTO `acos` VALUES (209,'Abel 1982 demo reel',1,NULL,NULL,'http://www.youtube.com/watch?v=cT3_3d2JcR0','cT3_3d2JcR0',NULL,1,'2012-10-24 17:05:22','2012-10-24 17:06:33',NULL,NULL);
INSERT INTO `acos` VALUES (210,'changing with the times',3,NULL,'The Los Angeles production office, run by George Joblove (ILM) and Ellen Sumers (Boss Film), and RG/LA operated for a few years in the mid-1990s. In 1999 the company decided to focus solely on interactive projects. Aquired first by True North (1995) which was then acquired by Interpublic (2000). R/GA today promotes itself as the â€œadvertising for the digital ageâ€. ',NULL,NULL,NULL,1,'2012-10-25 09:32:14','2012-10-25 09:32:15',NULL,NULL);
INSERT INTO `acos` VALUES (211,'really big pixels',3,NULL,'Large format work has include the 70mm 3D film Shooting Star and IMAX space films Destiny In Space and Cosmic Voyage.',NULL,NULL,NULL,1,'2012-10-25 09:38:30','2012-10-25 09:38:31',NULL,NULL);
INSERT INTO `acos` VALUES (212,'notable TV work',3,NULL,'Television series contributions include Other Worlds: A Tour of the Solar System and two collaborations with the Kleiser-Walczak Construction Company on The Astronomers and 500 Nations (the latter of which depicted beautifully realistic reconstructions of Native American cultures).',NULL,NULL,NULL,1,'2012-10-25 09:39:04','2012-10-25 09:39:06',NULL,NULL);
INSERT INTO `acos` VALUES (213,'Feature film work',3,NULL,'Feature film work included An American Werewolf in Paris, Spawn, Star Trek: Generations, Star Trek: Insurrection and Supernova.',NULL,NULL,NULL,1,'2012-10-25 09:40:43','2012-10-25 09:41:35',NULL,NULL);
INSERT INTO `acos` VALUES (214,'The End',3,'2002-09-01 00:00:00','The company apparently shut down after completing work on the film \'K-19: The Widowmaker\' ... have to ask John Grower for details.',NULL,NULL,NULL,1,'2012-10-25 09:42:19','2012-10-25 09:58:54',NULL,NULL);
INSERT INTO `acos` VALUES (215,'Academy Award',3,NULL,'Greg Hermanovic, Kim Davidson, Mark Elendt, and Paul Breslin were presented with a 1998 Academy Scientific and Technical Achievement Award for the development of the procedural modeling and animation components of the Prisms software package.',NULL,NULL,NULL,1,'2012-10-25 10:05:38','2012-10-25 10:05:39',NULL,NULL);
INSERT INTO `acos` VALUES (216,'IRIS 1000',3,NULL,'SGI produced its first computer, the IRIS 1000, in 1983 and went public in 1986. (IRIS stands for Integrated Raster Imaging System.) The first 1000 series workstations were really terminals because they required a VAX host.SGI then acquired both Alias and Wavefront in 1995 and Cray Supercomputers in 1996. Those where good times, but they would not last.',NULL,NULL,NULL,1,'2012-10-25 10:18:57','2012-10-25 10:19:08',NULL,NULL);
INSERT INTO `acos` VALUES (217,'SGI and Intel',3,NULL,'In 1997, SGI announced a new joint effort with Microsoft and Intel to develop a next-generation processor line for its graphics workstations, a new SGI Intel/NT. Introduced in spring of 1999, the SGI 320 and 540 workstations were Windows NT-based and cost between $3,400 and $5,995. The 540 supported up to four Pentium II Xeon 450MHz processors and up to 2GB of graphics memory.',NULL,NULL,NULL,1,'2012-10-25 10:19:48','2012-10-25 10:19:50',NULL,NULL);
INSERT INTO `acos` VALUES (218,'James (Jim) Clark',2,NULL,NULL,'http://s7.computerhistory.org/is/image/CHM/500004825-03-01?$re-inline-artifact$',NULL,NULL,1,'2012-10-25 10:32:27','2012-10-25 10:32:31',NULL,NULL);
INSERT INTO `acos` VALUES (219,'Academy Award',3,NULL,'Dominique Boisvert, Rejean Gagne, Daniel Langlois, and Richard Laperriere were awarded a Scientific and Engineering Award from the Academy of Motion Picture Arts and Sciences in 1998 for the development of the Actor animation component of the Softimage computer animation system.',NULL,NULL,NULL,1,'2012-10-25 11:37:29','2012-10-25 11:37:31',NULL,NULL);
INSERT INTO `acos` VALUES (220,'The End ( as a company )',3,NULL,'Softimage was acquired by Microsoft in 1994 and was sold to Avid in June of 1998 for about $200 million, with the 3D animation assets being later sold in 2008 to Autodesk for a reported $35 million.',NULL,NULL,NULL,1,'2012-10-25 11:40:57','2012-10-25 11:40:58',NULL,NULL);
INSERT INTO `acos` VALUES (221,'Sogitec - 1984',2,NULL,NULL,'http://histoire3d.siggraph.org/images/8/8c/Equipe-Sogitec-1984.jpg',NULL,NULL,1,'2012-10-25 11:45:46','2012-10-25 11:46:06',NULL,NULL);
INSERT INTO `acos` VALUES (222,'The End',3,NULL,'Beginning in 1984, Sogitec had became a subsidiary of Dassault Aviation in France and is now involved in simulation but not in CGI directly.\n\nIn 1989 Xavier and Sogitec\'s animation component merged with Thompson Digital Images ( TDI ) to form a new company called ExMachina.\n\n',NULL,NULL,NULL,1,'2012-10-25 11:48:55','2012-10-25 11:54:49',NULL,NULL);
INSERT INTO `acos` VALUES (223,'TDI logo',2,NULL,NULL,'http://histoire3d.siggraph.org/images/d/df/TDI-logo.png',NULL,NULL,0,'2012-10-25 12:08:48','2012-10-25 12:08:50',NULL,NULL);
INSERT INTO `acos` VALUES (224,'The End',3,NULL,'The production division merged in 1989 with Sogitec to form Ex Machina. TDI (the software company) also was at one time half owned by IBM.\nIn 1990, TDI released the first versions of their software for the PC. The software division was then bought by Wavefront in 1993. Wavefront in turn was bought by SGI and merged with Alias.\n',NULL,NULL,NULL,1,'2012-10-25 12:12:01','2012-10-25 12:12:02',NULL,NULL);
INSERT INTO `acos` VALUES (225,'Explore',3,NULL,'Known particularly for their Explore - Interactive Photorealistic Renderer (IPR) interface, TDI even opened a sales branch called Rainbow Images in San Jose.',NULL,NULL,NULL,1,'2012-10-25 12:12:54','2012-10-25 12:12:56',NULL,NULL);
INSERT INTO `acos` VALUES (226,'firsts in hardware',3,NULL,'Symbolics produced the first workstation that could genlock, the first to have real-time video I/O, the first to support digital video I/O, and the first to do HDTV.',NULL,NULL,NULL,1,'2012-10-25 12:21:18','2012-10-25 12:21:20',NULL,NULL);
INSERT INTO `acos` VALUES (227,'Symbolics Graphics Division',3,NULL,'The Symbolics Graphics Division (SGB) was created by former members of Triple-I when that company ceased computer graphics production work in about 1981. Founded initially by Tom McMahon (General Manager from Triple-I), he soon was joined by Craig Reynolds, Dave Dyer, Larry Malone, Jeremy Schwartz, Larry Stein (hardware), and Bob Coyne (software). Matt Elson, Jay Sloat, and Ken Brain were artists, TDs, and trainers. Tom first worked out of the small Woodland Hills office, commuting often to the Massachusetts research center. Chatsworth was home for a short while before finally relocating to Westwood, California, in 1983.',NULL,NULL,NULL,1,'2012-10-25 12:22:16','2012-10-25 12:22:17',NULL,NULL);
INSERT INTO `acos` VALUES (228,'Stanley and Stella - Breaking the Ice',3,NULL,'As many as 50 people worked on this memorable project and shared responsibility. Some key people included Phillipe Bergeron (animation), Joseph Goldstone, Kevin Hunter, Larry Malone, Craig Reynolds (flocking and schooling code), Jim Ryan, and Michael Wahrman (Producer). Richard \"Dr.\" Baily was hired by Michael Wahrman to model the two main characters based on sketches. He also composed and recorded the original soundtrack, which later was replaced by another one. It was a big hit at the 1985 SIGGRAPH in particular.',NULL,NULL,NULL,1,'2012-10-25 12:23:03','2012-10-25 12:26:49',NULL,NULL);
INSERT INTO `acos` VALUES (229,'more early employees ',3,NULL,'SGD\'s first general manager was Howard Cannon from the Cambridge office, followed by Sheila Madsen, John Kulp, and then Tom McMahon. Tom went on to design most of the hardware and video systems for the company including all the framegrabbing, genlock, and high-definition capabilities that SGD pioneered with Sony and others.',NULL,NULL,NULL,1,'2012-10-25 12:27:48','2012-10-25 12:27:49',NULL,NULL);
INSERT INTO `acos` VALUES (230,'in-house tools',3,NULL,'In-house tools included S-Geometry for modeling and S-Dynamics for animation. S-Paint was a LISP-based 32-bit paint system designed by Craig Reynolds, Tom McMahon, Bob Coyne, and Eric Weaver. \n\nAfter being sold to Nichimen in 1992 it is still available ( as of 2012 ) as Mirai from Izware.',NULL,NULL,NULL,1,'2012-10-25 12:28:32','2012-10-25 12:36:00',NULL,NULL);
INSERT INTO `acos` VALUES (231,'The End',3,NULL,'Around 1990, Symbolics started to fail and began to lay off employees. Even though SGD had a successful ongoing business with a good customer base, it still relied on its parent company for workstation and operating system technology as well as for other corporate infrastructure such as HR, finance, customer service, and so on.\nSymbolics was sold to Nichimen in 1992, declared Chapter 11 bankruptcy in 1995 and was bought back by its original founder Russell Noftsker.\n',NULL,NULL,NULL,1,'2012-10-25 12:33:58','2012-10-25 12:33:59',NULL,NULL);
INSERT INTO `acos` VALUES (232,'inside story - by Tom McMahon ',3,NULL,'\"Eventually, SGD was the target of a takeover and transition to Japanese management. SGD\'s Japanese distributor (Nichimen) had a thriving business based on the SGD product line of videographics hardware and the animation and rendering software. They couldn\'t afford to see us get blown away lest they be left without a source of supply. So they started buying up an insurance policy. They made Symbolics some offers it couldn\'t refuse given its poor financial health.\nIn a sequence of financial transactions, Nichimen bought rights to certain hardware technologies. They also started picking up the payroll for SGD employees in exchange for certain worldwide distribution rights. In the end, we had the people but Nichimen ended up owning most of our hard-earned technology.\nWe already had begun looking at how to port these tools off of Symbolics workstation platforms. SGI became the porting target. By 1991, we were well into the rewrite and port, but Symbolics needed to pull the plug on us.\nI worked out a pretty amazing salvage deal with our old friends at Triple-I. I negotiated a contract where I could take all of SGD\'s key employees back to the employ of Triple-I but under a funding arrangement with Nichimen. Nichimen got their security blanket, and the employees kept their jobs. (A blanket layoff and the entire extermination of SGD were the alternatives at the time.)\nAt Triple-I, we proceeded to port all the SGD products to SGI machines, but things started going sour there, too.\nWe spun out of Triple-I and started yet another new company (with Nichimen seed funding) called Del Rey Graphics. Del Ray was co-founded by Al Fenaughty, President and CEO of Triple-I, along with Jack Holloway, one of the Foonly designers at Triple-I. But that didn\'t work due to a hostile takeover by Nichimen. My partners and I ended up selling the whole thing to Nichimen and what is left of this very long thread is now called Nichimen Graphics.\"\n',NULL,NULL,NULL,1,'2012-10-25 13:30:41','2012-10-25 13:32:00',NULL,NULL);
INSERT INTO `acos` VALUES (233,'Obituary by Huw Jones',3,NULL,'\"John Lansdown was Emeritus Professor of Computer Aided Art and Design and formerly Head of the Centre for Electronic Arts (formerly called the Centre for Advanced Studies in Computer Aided Art and Design) from September 1988 until July 1995 when he retired from full-time employment.\nIn 1968, he was one of the founders of the Computer Arts Society and was its honorary secretary for more than 25 years. He was engaged in using computers for creative activities (such as architecture, art, and choreography) since 1960 and wrote over 300 publications on computer uses in art and design.\" \n',NULL,NULL,NULL,1,'2012-10-25 13:35:10','2012-10-25 13:37:34',NULL,NULL);
INSERT INTO `acos` VALUES (234,'John Lansdown',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/en/b/b2/LANSDOWN-John-1998-10-28.jpg',NULL,NULL,1,'2012-10-25 13:37:50','2012-10-25 13:37:53',NULL,NULL);
INSERT INTO `acos` VALUES (235,'Alien',3,NULL,'SSL created the vector graphics for the Nostromo in Ridley Scott\'s \'Alien\'',NULL,NULL,NULL,1,'2012-10-25 13:50:05','2012-10-25 13:50:07',NULL,NULL);
INSERT INTO `acos` VALUES (236,'special display architectures ',3,NULL,'\"In the mid-1970s, we developed the ZMP parallel processor for real-time display (25 frames per second) of color scenes for aircraft flight simulation. This architecture was patented.\nIn the early 1980s, we developed the color Quad-encoded display for instantaneous pan and detail-revealing zoom into images of 4k by 4k resolution displayed on a 512-line monitor. Overviews correctly showed subpixel data as anti-aliased averages. The same system could also be used to reveal different symbology at different levels of zoom. As far as we are aware, it was the first display system to achieve either of these. The hardware required to do this was carefully chosen and designed but quite modest.\"\n',NULL,NULL,NULL,1,'2012-10-25 13:58:27','2012-10-25 13:58:33',NULL,NULL);
INSERT INTO `acos` VALUES (237,'very high resolution image manipulation',3,NULL,'\"We have a long history of working with pictures of very high resolution. In 1983, we completed a paint program for the binary Perq display, which offered a roamable drawing area of approximately 7000 by 7000, displaying a 640 by 640 subset.\nWe moved on to use the HLH Orion UNIX workstation\'s new color display (the design of which was in part influenced by us; we later took delivery of the preproduction prototype). With our own software, we produced what we believe to be the first color picture with a resolution of a billion pixels (32k by 32k) in about 1986.\"\n',NULL,NULL,NULL,1,'2012-10-25 14:00:25','2012-10-25 14:00:26',NULL,NULL);
INSERT INTO `acos` VALUES (238,'in the beginning ',3,NULL,'The EVL started its life in 1973 as Circle Graphics Habitat, part of the effort by then Vice Chancellor Joe Lipson to utilize interactive computer graphics and low-cost video (which had just become available) to make an impact on undergraduate education. This reflected a commitment to using technology in education and a belief in its transformative power, which have again become important in the \'90s. The Lab\'s earliest home was in the Chemistry department, which already boasted the most advanced computer graphics available for state-of-the-art chemical modeling[md]a Vector General Calligraphic Display (PDP 11/45). The earliest goal was to develop computer-based introductory material for the chemistry curriculum with the basic premise that this would constitute a self-paced learning environment specifically designed for the varying entry levels of students at an urban university.',NULL,NULL,NULL,1,'2012-10-25 14:07:47','2012-10-25 14:07:49','EVL online database ','www.evl.uic.edu/EVL/EVLLAB/history.shtml');
INSERT INTO `acos` VALUES (239,'Circle Graphics Habitat',3,NULL,'Circle Graphics Habitat brought together Tom DeFanti and Dan Sandin. The media development system they designed used DeFanti\'s Graphics Symbiosis System and the Sandin Image Processor. The Graphics Symbiosis System (GRASS) was a computer graphics language that DeFanti had developed for his Ph.D. thesis. The Sandin Image Processor was a patch-programmable analog video synthesizer. A combination of the two systems was the basis of a video production facility for the generation of educational materials. Sandin was a faculty member of the sculpture department, where he taught video and was involved with the making of electronically based, interactive, kinetic sculpture. Circle Graphics therefore also brought together chemists, engineers, and artists. An equally important early goal for the Lab was to use the systems created to make art. The GRASS and Image Processor systems were used to make real-time animations that were distributed on the experimental video circuit. The Lab also organized a series of Real-Time Interactive Installations and Performancesâ€”performance in the music tradition rather than in the newer sense of performance art.',NULL,NULL,NULL,1,'2012-10-25 14:08:57','2012-10-25 14:08:59','EVL online database ','www.evl.uic.edu/EVL/EVLLAB/history.shtml');
INSERT INTO `acos` VALUES (240,'Star Wars - Death Star graphics by Larry Cuba',3,NULL,'In 1976, Larry Cuba came to the lab to create his wireframe Death Star simulation for George Lucas\' Star Wars film. ',NULL,NULL,NULL,1,'2012-10-25 14:10:18','2012-10-25 14:11:54',NULL,NULL);
INSERT INTO `acos` VALUES (241,'The first Electronic Visualization Event',3,NULL,'The first EVE (1973) event was actually an IEVEâ€”Interactive Electronic Visualization Event. The performers were faculty and students of Chicago Circle (UIC) and of the School of the Art Institute. The performances took place in the rotunda of the Science and Engineering South building. In the evenings, imagesâ€”manipulated using the GRASS system and analog processorâ€”were projected onto large video screens and shown on monitors to the accompaniment of live music.\n\"Real time,\" with respect to these performances, meant that the images changed instantaneously as the controls were manipulated. In effect, the performers \"played\" both musical instruments and visuals. The performances were improvisational in a variety of musical styles. Preparation involved not only technical and programming issues but extensive jamming. The interactivity of Interactive Electronic Visualization Event was supplied during the day when the audience could come and play with the equipment. Subsequently, the \"I\" was dropped, and EVE2 and EVE3 continued as performances, which were interactive for the performers but not for the audience.\nEVE1 was the prototype, establishing the possibility of such an event. EVE2 (1975) involved a lot more planning and quality control of content but was also held in the rotunda with live musical accompaniment. EVE3, in 1977, still emphasized the real-time possibilities of this medium. However, the performers felt that the logistics of organizing a complicated live performance and a large-scale physical event were beginning to interfere with aesthetic goals. Therefore, the performances were recorded in front of a small studio audience and were edited on a deck. The finished show took place in the auditorium of the First National Bank, and the computer graphics and sound were played back on a light-valve projector. By the end of the \'70s, calligraphic systems were being replaced by raster graphics systems with framebuffering. Except in the video games industry, computer graphics became very static. The possibility of interacting in real time with graphics is only becoming a possibility in the \'90s.\n',NULL,NULL,NULL,1,'2012-10-25 15:27:25','2012-10-25 15:27:27','EVL online database ','www.evl.uic.edu/EVL/EVLLAB/history.shtml');
INSERT INTO `acos` VALUES (242,'Larry Cuba',2,NULL,NULL,'http://www.well.com/~cuba/Lary.jpg',NULL,NULL,1,'2012-10-25 15:29:13','2012-10-25 15:29:21',NULL,NULL);
INSERT INTO `acos` VALUES (243,'bio',3,NULL,'While still a graduate student at The California Institute of the Arts, he was convinced of the artistic potential of computer graphics, but this was years before art schools began teaching the subject. Cuba\'s solution was to solicit access to the mainframe computers at NASA\'s Jet Propulsion Lab and teach himself computer animation by producing his first film, First Fig.\n\nIn 1975, John Whitney, Sr. invited Cuba to be the programmer on one of his films. The result of this collaboration was Arabesque.\n\nSubsequently, Cuba produced three more computer-animated films: 3/78 (Objects and Transformations), Two Space, and Calculated Movements. These works were shown at film festivals throughout the world---including Los Angeles, Hiroshima, Zagreb and Bangkok---and have won numerous awards. Cuba\'s been invited to present his work at various conferences such as Siggraph, ISEA, Ars Electronica, and Art and Math Moscow and his films have been included in screenings at New York\'s Museum of Modern Art, The Hirshhorn Museum, The San Francisco Museum of Modern Art, The Art Institute of Chicago, The Amsterdam Filmmuseum and the Isetan Museum of Art, Tokyo.\n\nCuba received grants for his work from the American Film Institute and The National Endowment for the Arts and was awarded a residency at the Center for Art and Media Technology Karlsruhe (ZKM). He has served on the juries for the Siggraph Electronic Theater, the Montpellier Festival of Abstract Film, The Ann Arbor Film Festival and Ars Electronica.\n\nIn the pure form of abstraction that Cuba pursues, visual perception is paramount. But because the images are generated via algorithms written in computer language, there is a paradox in trying to use words to describe images for which words do not exist.\n',NULL,NULL,NULL,1,'2012-10-25 15:31:02','2012-10-25 15:31:05','Larry Cuba','http://www.well.com/~cuba/Biography.html');
INSERT INTO `acos` VALUES (244,'Calculated Movements - 1985',1,NULL,NULL,'http://www.youtube.com/watch?v=HcvN1dt0yJo','HcvN1dt0yJo',NULL,1,'2012-10-25 15:32:24','2012-10-25 15:32:25',NULL,NULL);
INSERT INTO `acos` VALUES (245,'hidden surfaces',3,NULL,'The number one problem of the day (according to Ed Catmull at least) was hidden surfaces. Many continually evolving algorithms, such as Watkins\' algorithm (which subdivided the picture), were never actually implemented but served as inspiration for more practical solutions such as Catmull\'s more expensive techniques that actually subdivided surfaces. (This work was presented in his thesis work \"Characteristics of 10 hidden surface Algorithms\" in 1974.)\nAt the time, Ivan Sutherland did not like Catmull\'s \"brute-force\" approach, but the advent of much cheaper memory and storage made it extremely effective and increasingly practical. Indeed, it is just such a technique that is used as the basis for most all CG systems today. Catmull, as part of his interest in solving curved surface problems, had briefly attempted techniques of bending polygons before making his discovering of how to very efficiently and quickly subdivide cubic patches.\n',NULL,NULL,NULL,1,'2012-10-25 15:48:30','2012-10-25 15:48:41',NULL,NULL);
INSERT INTO `acos` VALUES (246,'Gouraud shading',3,NULL,'Henri Gouraud had been working for some time on linear interpolated shading when he visited Martin Newell and his brother in England who were working on similar research. A stumbling block with the early implementation was mach-banding artifacts, which also hindered the Newells. This allowed Gouraud to travel to Utah to finish his paper on \"Continuous Shading of Curved Surfaces\" in 1971.',NULL,NULL,NULL,1,'2012-10-25 15:49:39','2012-10-25 15:49:41',NULL,NULL);
INSERT INTO `acos` VALUES (247,'so many pioneers!',3,NULL,'Other important individuals at Utah over the years included Frank Crow, Fred Parke, Jim Blinn, Jim Clark, Lance Williams, Garland Stern, Ron Resch, Alan Kay, John Warnock, Patrick Baudelaire, Jim Kajiya, Christy Barton, Gary Watkins, and many others.',NULL,NULL,NULL,1,'2012-10-25 15:50:47','2012-10-25 15:50:48',NULL,NULL);
INSERT INTO `acos` VALUES (248,'the Newell Teapot',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/c/ca/Original_Utah_Teapot.jpg',NULL,NULL,1,'2012-10-25 15:55:15','2012-10-25 15:55:17',NULL,NULL);
INSERT INTO `acos` VALUES (249,'Vertigo demo reel - 1990',1,NULL,NULL,'http://www.youtube.com/watch?v=QLQ-bYLCGog','QLQ-bYLCGog',NULL,1,'2012-10-25 16:00:33','2012-10-25 16:00:34',NULL,NULL);
INSERT INTO `acos` VALUES (250,'Vertigo Production Company',3,NULL,'The company was formed in 1979 in Vancouver, Canada. Vertigo began, unlike the startups that predominate our industry, as a company in a totally different field in search of solutions for which computer graphics was an excellent fit. Two real estate developers (Fred Daniels and Mike Parker) building prefabricated houses for the Asian market were looking for ways to communicate the complexities of assembling their product in the field in a clear, unambiguous way. Because their product sold into a variety of countries speaking different languages, a visual approach was ideal.\nA video production group was formed, and the bold idea of harnassing computer graphics to demonstrate the assembly of their product was adopted. In those days, there were no off-the-shelf animation systems one could buy, and computers powerful enough to render were still in the $500,000 price range or higher.\nBy 1982, development had begun on a scanline polygon renderer written by Steve White from the University of British Columbia. (Later, Steve became software architect for the Neo-Visuals animation systemâ€”a turnkey computer animation system that debuted at SIGGRAPH 1985 and had the interesting quality of being written in Fortan.) The computer was a VAX-11/750 that was \"borrowed\" at night from a timeshare company two floors upstairs.\nThe company hired artists who had to learn computer graphics on the job. Very soon, the company began work on computer animations for the Canada-wide market such as flying logos for national ad campaigns, instructional videos, and a memorable 30-second flythough of Vancouver for a local radio station. Time was billed at $1,000/second of finished work, and the upstairs computer with 4MB of RAM was churning images on a nighly basis.\nVertigo employed many animators, many of whom are still active in the industry. Matt Arrott went on to Silicon Graphics and later became Director of Engineering for Dreamworks. Rod Paul went to Rhythm & Hues and then DreamWorks. Kirk McInroy ended up at ILM. Nancy St. John (producer) went on to Digital Productions, ILM, and later worked on feature films such as Babe as an independent producer.\nIn 1983, Vertigo began development of a quadric surface constructive solid geometry renderer for its producton work. The interesting thing here is that the developer on this project, Dave Gordon, went on to Omnibus. (Later in 1988, the Omnibus software became the nucleus of the Side Effects animation system.)\n',NULL,NULL,NULL,1,'2012-10-25 16:02:39','2012-10-25 16:02:40',NULL,NULL);
INSERT INTO `acos` VALUES (251,'Vertigo, Alias and Wavefront',3,NULL,'During early 1985, Roy Hall was hired by the production group as a consultant. He wrote a polygon renderer and later became a member of the Wavefront development team. Several consultants (including Charles Poynton and Paul Fuscher) were hired to help with hardware layout. At SIGGRAPH 1985, Alias Research of Toronto unveiled a \"slidemaker.\" It really was just a renderer with the modeller and animation system promised \"shortly.\" Wavefront unveiled its offering, displaying PreView, their animation tool, but no renderer or modeller. Meanwhile, Vertigo had an extrusion modeller and a renderer but decided to wait and unveil the finished product when all the pieces were complete. The official unveiling was at SIGGRAPH 1986.',NULL,NULL,NULL,1,'2012-10-25 16:05:20','2012-10-25 16:05:22',NULL,NULL);
INSERT INTO `acos` VALUES (252,'early software development',3,NULL,'Design began in earnest in mid-1984 and development commenced in October of 1984. Under Bill Etra (who had developed numerous real-time graphics effect devices including co-development of the Rutt-Etra synthesiser used in 1977\'s Logan\'s Run), three development teams were set up. A turnkey software group was led by Rikk Carey (a rendering expert from Don Greenberg\'s group at Cornell), a hardware group was led by Tim Piper (who had worked on real-time flight simulator hardware), and an interfacing group was led by Doug Girling. Soon afterwards, Gary Hooper and John Gross joined Carey, and this threesome led the effort to design and build the Vertigo animation system.',NULL,NULL,NULL,1,'2012-10-25 16:06:54','2012-10-25 16:06:55',NULL,NULL);
INSERT INTO `acos` VALUES (253,'The End - and new beginning ',3,NULL,'In 1987, however, Vertigo was running out of money, and sales were not yet strong enough to support the company. Things quickly unraveled, payroll was missed, the doors were shut, and the employees waited around to see what would happen. Surprisingly, the core engineering team stuck it out and eventually participated in the deal to be acquired by Cubicomp.',NULL,NULL,NULL,1,'2012-10-25 16:08:27','2012-10-25 16:08:30',NULL,NULL);
INSERT INTO `acos` VALUES (254,'some early employees',3,NULL,'Early employees included Fred Daniels, Mike Parker, Bill Diack (A|W), Tim Piper, Bill Etra (Sun), Rikk Carey (SGI), Gary Hooper (A|W), John Gross (PDI, A|W), Dave Dignam (SGI, Gigapixels), Mike Kelley (Apple, SGI), and Paul Wagschal. Other employees included Rod Paul (Omnibus NY, R&H, Dreamworks), Floyd Gillis, Dave Gordon, Carl Frederick (OMNIBUS NY, then ILM), Matt Arrott, and Nancy St John.',NULL,NULL,NULL,1,'2012-10-25 16:09:31','2012-10-25 16:09:32',NULL,NULL);
INSERT INTO `acos` VALUES (255,'some \"firsts\"',3,NULL,'Company \"firsts\" included the first digital framebuffer, the first multiprocessing rendering system, the first complete 3D animation system, the first extrusion modeler, the first friendly 3D animation user interface, and the first integrated animation system.',NULL,NULL,NULL,1,'2012-10-25 16:10:07','2012-10-25 16:10:09',NULL,NULL);
INSERT INTO `acos` VALUES (256,'purchased by Cubicomp',3,NULL,'In late 1987, Vertigo was purchased by the Cubicomp Corporation of Hayward, California. Cubicomp was founded in the early 1980s in a garage in Berkeley, California, by Edwin P. Berlin, Jr. to provide a turnkey computer animation system on an IBM personal computer. The Cubicomp product, called PictureMaker, featured polygonal modeling, scene choreography, and rendering at a much lower price point than on comparable workstation-based software systems. At the time of the aquisition, the combined installed based totalled some 750 units worldwide.\nVertigo moved from the historic Pender Street office to a new modern office in the West End of Vancouver. The team was reinvigorated by the new office, excitement, and owners and quickly got back on track.\nIn 1988, the Vertigo product was rewritten to take advantage of the new RISC-based workstations from SGI (the 4D series). All 3D modules of the system were integrated with new extended functionality and enhanced workflow was provided. A new hardware product providing D1 and D2 video support, the VideoPak (with development led by Dave Dignam), was released. Boolean modeling and ray tracing were added in 1989. A notable advance for character animation purposes was the addition of free-form deformations that permitted animatable lattice deformations to be applied to static or animated objects. In addition to bend and twist deformations, the lattices also permitted arbitrary animation of lattice points to enact simple muscle bulging.\n',NULL,NULL,NULL,1,'2012-10-25 16:12:10','2012-10-25 16:12:12',NULL,NULL);
INSERT INTO `acos` VALUES (257,'Vertigo AFTER Cubicomp',3,NULL,'In 1990, out of the ashes of Cubicomp, a couple of ex-Vertigo employees and a group of investors purchased the code. With little money and little experience, this team managed to finish the next release of code, which sold well. Existing Vertigo users, fearing that this would be the last cut, bought up the software. Surprised by its success, the team then continued to expand and rebuilt the company. For a number of years the successes continued, as did the releases of versions. New features were added, and the team grew back to the size it was in the early days. In 1993, the decision was make to ditch the old renderer in favor of supporting the industry standard RenderMan. The team undertook this directly, creating a seamless link to RenderMan. An interface was created to allow easy interactive editing of shaders and renders to RenderMan without writing out the usual ASCII RIBs. Finally, this enabled Vertigo to break into the film market. Disney BVVE took the system along with a great deal of support from Vertigo. This relationship grew into Vertigo eventually producing shots for Disney movies in Vancouver. Even with this success and turning into a public company, Vertigo again began to run short of cash and lost its capability to compete with teams such as Softimage and Alias|Wavefront. In a final attempt to get out of the way of these bigger competitors, the team started to move the entire development to the Mac using Apple Quickdraw3D, at the same time spinning off smaller components into 2D applications such as Photoshop and Illustrator. Vertigo still exists and still functions on the SGI. ',NULL,NULL,NULL,1,'2012-10-25 16:13:27','2012-10-25 16:15:58',NULL,NULL);
INSERT INTO `acos` VALUES (258,'The End - for real this time',3,NULL,'Unfortunately since 1997 the flagship 3D animation product was discontinued in favor of developing 3D plug-ins for Adobe Illustrator and Photoshop. However in 2002 the intent was announced to once again market Vertigo 9.6 for the SGI. In June of 2002 Vertigo Software began its acquisition of Digital Accelerator Corporation (also of Vancouver, BC) whoâ€™s marketing efforts focus on still and video compression technology. Vertigo Software Corp. completed its reorganization in 2003, including the re-branding of â€œDaccelâ€ to Even Technologies. Sadly, the company apparently ceased operations as of July 15,2005. ',NULL,NULL,NULL,1,'2012-10-25 16:16:51','2012-10-25 16:16:53',NULL,NULL);
INSERT INTO `acos` VALUES (259,'\'Night Cafe\' - 1988',3,NULL,'Cubicomp submitted a version of Night Cafe, a computer-generated character animation piece (the one with the dancing salt and pepper shakers). This made it into the 1989 SIGGRAPH Electronic Theater. Night Cafe was put together by Sharon Calahan, an artist employed by the Vancouver office who now works at Pixar.',NULL,NULL,NULL,1,'2012-10-25 16:19:19','2012-10-25 16:19:45',NULL,NULL);
INSERT INTO `acos` VALUES (260,'Cubicomp / Vertigo demo reel - 1990',1,NULL,NULL,'http://www.youtube.com/watch?v=2zW56z2q698','2zW56z2q698',NULL,1,'2012-10-25 16:21:36','2012-10-25 16:21:38',NULL,NULL);
INSERT INTO `acos` VALUES (261,'Picturemaker training video - part 2 of 3',1,NULL,NULL,'http://www.youtube.com/watch?v=6fSZbJGWb0k','6fSZbJGWb0k',NULL,1,'2012-10-25 16:29:12','2012-10-25 16:29:14',NULL,NULL);
INSERT INTO `acos` VALUES (262,'Picturemaker training video - part 3 of 3',1,NULL,NULL,'http://www.youtube.com/watch?v=u5d6bBTEoTM&feature=relmfu','u5d6bBTEoTM',NULL,1,'2012-10-25 16:29:49','2012-10-25 16:32:23',NULL,NULL);
INSERT INTO `acos` VALUES (263,'Picturemaker training video - part 1 of 3',1,NULL,NULL,'http://www.youtube.com/watch?v=U1FLlcAVy14&feature=relmfu','U1FLlcAVy14',NULL,1,'2012-10-25 16:32:51','2012-10-25 16:32:54',NULL,NULL);
INSERT INTO `acos` VALUES (264,'The Tainted Sky',1,NULL,NULL,'http://www.youtube.com/watch?v=K4iCdZtPCG4','K4iCdZtPCG4',NULL,1,'2012-10-25 16:53:18','2012-10-25 16:53:20',NULL,NULL);
INSERT INTO `acos` VALUES (265,'Mike Zyda',2,NULL,NULL,'http://www.usc.edu/dept/pubrel/trojan_family/summer05/GamePlan_files/5-1-05_Zyda.jpg',NULL,NULL,1,'2012-10-25 16:57:10','2012-10-25 16:57:12',NULL,NULL);
INSERT INTO `acos` VALUES (266,'2010, digital composites, Bill & Ted',3,NULL,'The company\'s first job was to produce video display graphics for the feature film 2010: Odyssey 2. Virtually all the 3D CG in the early years was produced using Cubicomp equipment. Richard was inspired by a NASA/Kodak article about CCD technology and promptly designed and built a 1k by 1k input scanner for production use. The first digital composites it was used for were on the feature film Bill and Ted\'s Excellent Adventure in 1989.',NULL,NULL,NULL,1,'2012-10-25 17:05:01','2012-10-25 17:05:02',NULL,NULL);
INSERT INTO `acos` VALUES (267,'1990\'s film visual effects',3,NULL,'In about 1990, the company began creating more ambitious motion picture visual effects and was then known as VIFX/Video Image. Feature film visual effects work for 20th Century Fox and other studios was wide-ranging and extensive. The work included Batman Returns, Mighty Morphin\' Power Rangers, Down Periscope, Volcano, Face/Off, The X-Files, The Relic, Star Trek: Insurrection, Blade, and Pushing Tin.',NULL,NULL,NULL,1,'2012-10-25 17:05:43','2012-10-25 17:05:44',NULL,NULL);
INSERT INTO `acos` VALUES (268,'sold to 20th Century Fox',3,'1996-01-01 00:00:00','VIFX was sold to 20th Century Fox in 1996, and partners Greg McMurry and Rhonda Gunner left the company.',NULL,NULL,NULL,1,'2012-10-25 17:06:25','2012-10-25 17:16:12',NULL,NULL);
INSERT INTO `acos` VALUES (269,'sold to Rhythm & Hues ',3,'1999-03-01 00:00:00','In 1998, the Fox animation production Planet Ice was changed from an all-3D CG feature to being traditional cel animation. This left VIFX with an opportunity to sell itself yet again to Rhythm & Hues in the spring of 1999. About 80 people, including Richard Hollander, transferred to the new company following the merger.',NULL,NULL,NULL,1,'2012-10-25 17:07:49','2012-10-25 17:16:01',NULL,NULL);
INSERT INTO `acos` VALUES (270,'purchase / merger of Blue Sky',3,'1997-08-01 00:00:00','In August of 1997 Fox/VIFX purchased Blue Sky Studios ( New York )',NULL,NULL,2,1,'2012-10-25 17:17:22','2012-10-25 17:17:45',NULL,NULL);
INSERT INTO `acos` VALUES (271,'Able Image Research software',3,'1987-01-01 00:00:00','The company\'s first real competition came in 1987 with the advent of Robert Abel & Associates\' software division, Abel Image Research (AIR). This company, originally founded on a code base developed by Bill Kovacs, was started to capitalize on the momentum Wavefront was enjoying in the marketplace. This software was incomplete, undocumented, and very expensive, but AIR had the best marketing materials in the industry with an award-winning animation reel done by Robert Abel. Unable to compete against this body of work, a deal was struck in 1988 that had Wavefront purchasing the assets of AIR. The AIR software was never incorporated into the Wavefront code bases, even though urban myths have contrary opinions.',NULL,NULL,251,1,'2012-10-25 17:23:05','2012-10-25 17:23:18',NULL,NULL);
INSERT INTO `acos` VALUES (272,'early funding and revenue',3,'1994-01-01 00:00:00','The company originally was financed by the founders for the first year. Then it went through several rounds of venture funding, culminating in an IPO 10 years later in 1995. Initial revenues were in the several hundred thousand per year range and ended in 1994 with annual revenues around $26 million.',NULL,NULL,251,1,'2012-10-25 17:24:10','2012-10-25 17:24:11',NULL,NULL);
INSERT INTO `acos` VALUES (273,'more funding partners and expansion ',3,'1995-01-01 00:00:00','The company went from three founders and four employees to 12, then 28, then 50, then 90, and then 160 at its highest point in the late \'80s. Expansion into Europe happened in 1987 with the creation of Wavefront Europe, located in Belgium. At that time, the Belgian government also became an investor. The next year, concurrent with the AIR acquisition, Wavefront moved into Japan and then throughout the rest of Asia.\nIn the early \'90s, a round of funding with CSK, a major Japanese computer company, resulted in the founding of Wavefront Japan, a wholly owned subsidiary. CSK at one time owned 14 percent of Wavefront.\n',NULL,NULL,251,1,'2012-10-25 17:25:04','2012-10-25 17:25:07',NULL,NULL);
INSERT INTO `acos` VALUES (274,'acquisition of TDI',3,'1993-01-01 00:00:00','In 1993, Wavefront entered into discussions to acquire another of the pioneering computer graphics companies, Thomson Digital Images (TDI). TDI had developed a similar set of technologies in modeling, animation, and rendering and had innovated in the area of NURBS modeling and interactive rendering. These technologies coupled with extensive distribution in Europe and Asia made for an ideal fit with Wavefront. The acquisition was treated more as a merger, but more than half the employees of TDI left immediately. It took nearly two years to blend the distribution channels in Europe and Asia because Wavefront had a toehold in those areas already. Fierce competition between the channels was clearly in play.',NULL,NULL,251,1,'2012-10-25 17:25:55','2012-10-25 17:26:16',NULL,NULL);
INSERT INTO `acos` VALUES (275,'GameWare',3,'1993-01-01 00:00:00','In 1993, the company entered the electronic game market with a repackaging of its core application, The Advanced Visualizer, into a tailored offering called GameWare. This bundle focused the marketplace on Wavefront for game development and was very successful. This effort lasted for one year until the merger of Alias and Wavefront, when the program was canceled so PowerAnimator could be sold to game developers instead.',NULL,NULL,251,1,'2012-10-25 17:27:09','2012-10-25 17:27:11',NULL,NULL);
INSERT INTO `acos` VALUES (276,'Data Visualizer',3,'1995-01-01 00:00:00','The original business plan talked about military, educational, medical, electronic game, simulation, film/entertainment, engineering, and product visualization marketplaces. The only one that never materialized was the simulation market. The company expanded into the scientific market in the late \'80s with a product called The Data Visualizer. This product, aimed at nonpolygonal databases, was a success until Silicon Graphics and IBM developed competing products that were offered for free in bundles to sell high-end server hardware into the scientific marketplace. The Data Visualizer built on Wavefront\'s reputation for open systems and fast graphics interaction.',NULL,NULL,251,1,'2012-10-25 17:28:30','2012-10-25 17:28:31',NULL,NULL);
INSERT INTO `acos` VALUES (277,'Personal Visualizer',3,'1995-01-01 00:00:00','The company made one foray into the desktop marketplace with a project co-developed by Silicon Graphics called The Personal Visualizer. This product was created to give CAD users a point-and-click interface to high-end photorealistic rendering. Initially targeted to SGI hardware, the product eventually was ported to Sun, IBM, HP, Tektronix, DEC, and Sony platforms. The strategy was to bundle the software on every system sold and then follow with module sales into the installed base.',NULL,NULL,251,1,'2012-10-25 17:29:26','2012-10-25 17:29:28',NULL,NULL);
INSERT INTO `acos` VALUES (278,'major customers',3,'1995-01-01 00:00:00','In the film market, Disney was the premier customer along with Warner Digital and Boss Film (both now defunct), Industrial Light & Magic, Film Magic (Hong Kong), TRIX (Belgium), and Electronic Arts (London). In video production, NBC, CBS, ABC, and CNN (Turner Broadcasting) were the premier partners. In engineering visualization, there was Harvard, National Center for Atmospheric Research (NCAR), NASA (six locations), Alcoa, and the National Center for Supercomputing Applications (NCSA). The military visualization marketplace included the CIA, FBI, Naval Surface Warfare Center, U.S. Air Force, and the National Security Agency. At the high point, there were nearly 8,000 Advanced Visualizer users.',NULL,NULL,251,1,'2012-10-25 17:30:05','2012-10-25 17:30:16',NULL,NULL);
INSERT INTO `acos` VALUES (279,'ArcVision',3,'1995-01-01 00:00:00','In early 1995, another effort was undertaken to capture the architectural market. ArcVision was designed to take existing CAD translation software and bundle it with preset color and environment controls, using IPR (Explore\'s renderer front-end) to offer a low-cost solution to small firms that wanted to experiment with different color and lighting schemes using existing CAD architectural databases. This project was terminated postmerger because the Alias management had bad experiences in this market with their Sonata purchase and did not believe the market was viable. It never really got off the ground because it was scheduled to be launched at Siggraph 1995.',NULL,NULL,251,1,'2012-10-25 17:32:05','2012-10-25 17:32:06',NULL,NULL);
INSERT INTO `acos` VALUES (280,'Academy Awards',3,NULL,'In 1998, a Scientific and Technical Achievement Award was awarded to Jim Keating, Michael Wahrman, and Richard Hollander for their contributions that led to the Wavefront Advanced Visualizer computer graphics system. Also in 1998, a Scientific and Engineering Award was presented to Bill Kovacs for his creative leadership and to Roy Hall for his principal engineering efforts that led to the Wavefront Advanced Visualizer computer graphics program.',NULL,NULL,251,1,'2012-10-25 17:33:18','2012-10-25 17:33:19',NULL,NULL);
INSERT INTO `acos` VALUES (281,'triple merger',3,'1995-06-01 00:00:00','In June of 1995, the merger of Alias Research, Wavefront, and Silicon Graphics was completed.',NULL,NULL,251,1,'2012-10-25 17:34:15','2012-10-25 17:34:16',NULL,NULL);
INSERT INTO `acos` VALUES (282,'Stanley and Stella',3,'1987-01-01 00:00:00','Their first project was to team up with fellow ex-Triple-I employees from the Symbolics Graphics Division to produce the film Stanley and Stella: Breaking The Ice. ',NULL,NULL,2,1,'2012-10-25 17:40:10','2012-10-25 17:40:12',NULL,NULL);
INSERT INTO `acos` VALUES (283,'The End',3,'1988-06-01 00:00:00','Unfortunately, before they could collect the remainder of an initial $5 million loan, the majority of the CG production industry collapsed (thanks to the Omnibus fiasco), and the investors balked.\n\nAfter declaring bankruptcy in June of 1988, Gary Demos went on to form his own research company, DemoGraFX. John Whitney Jr. elected to stay and take the company through the bankruptcy proceedings himself. John continued the company under various names, initially starting fresh as OptoMystic. When another company\'s name was found to be similar to that of OptoMystic, he changed the name to Digital Animation Laboratories and later sold the assets of the company to US Animation Labs. In December of 1996, US Animation Labs split in two. It kept the production side as Virtual Magic and sold the company name and software side to Toon Boom Technologies. For a time, John ran his remaining original assets of Digital Animation Laboratories under the name Digital Editions Inc.\n',NULL,NULL,2,1,'2012-10-25 17:41:24','2012-10-25 17:41:26',NULL,NULL);
INSERT INTO `acos` VALUES (285,'Stanley & Stella in Breaking the Ice',1,NULL,NULL,'http://www.youtube.com/watch?v=SVcE5b1KDXY','SVcE5b1KDXY',NULL,1,'2012-10-25 17:48:25','2012-10-25 17:48:28',NULL,NULL);
INSERT INTO `acos` VALUES (286,'John Turner Whitted',2,NULL,NULL,'http://www.engr.ncsu.edu/images/dea/whitted2005_color.jpg',NULL,NULL,1,'2012-10-27 16:34:32','2012-10-27 16:36:36',NULL,NULL);
INSERT INTO `acos` VALUES (287,'Turner Whitted Keynote at SIGGRAPH 2011 Pioneer\'s Dinner',1,NULL,NULL,'http://www.youtube.com/watch?v=7x1Ye8GBaEI','7x1Ye8GBaEI',NULL,1,'2012-10-27 16:37:24','2012-10-27 16:37:32',NULL,NULL);
INSERT INTO `acos` VALUES (288,'James Blinn',2,NULL,NULL,'http://www.fxguide.com/wp-content/uploads/2012/07/jim.jpg',NULL,NULL,1,'2012-10-27 16:45:22','2012-10-27 16:45:24',NULL,NULL);
INSERT INTO `acos` VALUES (289,'ACM SIGGRAPH logo',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/en/a/ad/ACM_SIGGRAPH_logo.svg',NULL,NULL,1,'2012-10-27 16:56:17','2012-10-27 16:56:19',NULL,NULL);
INSERT INTO `acos` VALUES (290,'in-house software',3,'1990-01-01 00:00:00','All the software used for the first four years or so was written in-house, from image and object formats to animation tools and renderers. Using this proprietary script-based software, Xaos quickly became known for complex, organic imagery. This was quite contrary to the norm of the period, which largely consisted of rectilinear, beveled-chrome logos created with commercial software derived from industrial design applications.',NULL,NULL,NULL,1,'2012-10-27 17:56:15','2012-10-27 17:56:16',NULL,NULL);
INSERT INTO `acos` VALUES (291,'early crew',3,'1990-01-01 00:00:00','The animation crew in late \'89 consisted of Hayden Landis (ILM), Ken Pearce (PDI), and Tony Lupidi  (EA), followed by the additions of Henry Preston (ILM) and Roberta Brandao. This group was supported by the engineering teem of Tolson, Texier, and Michael Beese. Executive Producer from late \'89 through \'96 was Helene Plotkin (Producer of Toy Story 2 at Pixar).\nDuring the mid- to late \'90s, Xaos benefited from the substantial programming expertise of Cassidy Curtis (Brown University graduate), Sumit Das (previously of \"The Cave\" in Illinois, then PDI), and Kevin Rogers (later at Disney).',NULL,NULL,NULL,1,'2012-10-27 17:56:50','2012-10-27 18:03:32',NULL,NULL);
INSERT INTO `acos` VALUES (292,'Lawnmower Man',3,'1990-01-01 00:00:00','During the \'89â€“90 period, Xaos produced more than eight minutes of animation for the film Lawnmower Man. While certainly a B-movie, Lawnmower Man topped the sales charts for a week and was, in fact, a milestone in its extensive use of computer animation. ',NULL,NULL,NULL,1,'2012-10-27 17:57:39','2012-10-27 17:57:40',NULL,NULL);
INSERT INTO `acos` VALUES (293,'XAos Tools',3,'1996-01-01 00:00:00','Tolson and Schwartzberg soon left Xaos to spin-off Xaos Tools, but the venture did not fare well. Arthur left Xaos Tools in 1996, and Michael followed in late 1998, soon after the venture filed for bankruptcy.',NULL,NULL,NULL,1,'2012-10-27 17:59:04','2012-10-27 17:59:05',NULL,NULL);
INSERT INTO `acos` VALUES (294,'mid-90\'s work',3,'1996-01-01 00:00:00','Xaos continued to grow under Malmberg\'s presidency, garnering numerous awards for such projects as animation for the feature film The Pagemaster (starring Macaulay Culkin), a fully animated music video for the Grateful Dead (\"Infrared Roses\"), numerous commercials and film titles, and a pair of IDs for the SCI-FI channel that were mini sci-fi movies in themselves, complete with miniature motion-control models and an intergalactic battle sequence. Another Emmy followed in 1996 for a set of MSNBC IDs designed and produced by Xaos.',NULL,NULL,NULL,1,'2012-10-27 17:59:55','2012-10-27 18:00:07',NULL,NULL);
INSERT INTO `acos` VALUES (295,'Windows NT and large format work',3,'1996-01-01 00:00:00','Xaos continued its role as an industry leader, becoming in 1996 the world\'s first high-end 3D CG animation company to officially move fully to Windows NT. This move, quite \"against the grain\" of the SGI-loyal industry, initially was the inspiration of Lupidi, whose background includes having helped establish the historic Amiga lab at Ohio State nearly a decade earlier.\nTeaming closely with Intel, Kinetics, and Intergraph, Xaos entered the \"large-format\" world in 1996, producing its first two \"15-perf 70mm\" projects on prerelease Pentium Pro (then code-named \"P6\") machines running the first 3D Studio MAX beta. In the ensuing years, Xaos has become a leading supplier of animation for the IMAX/large-format industry.\n',NULL,NULL,NULL,1,'2012-10-27 18:01:04','2012-10-27 18:01:05',NULL,NULL);
INSERT INTO `acos` VALUES (296,'later management changes',3,'1997-01-01 00:00:00','In late \'97, Schwartzberg rejoined the company as President, and Malmberg took this opportunity to focus on creative direction and to work with Christina Schmidlin, Executive Producer, in the development of the large-format market.\nIn late November 1998, Malmberg left Xaos, citing differences in management style, after dedicating 10 years to the direction and growth of this unique company. Malmberg now works at Radium, S.F. as a creative director specializing in C.G. along with his industry pals and Radium founders Jonathan Keaton and Simon Mowbray. Xaos continues to produce innovative animation and effects for the feature, large-format, and commercial markets.\n',NULL,NULL,NULL,1,'2012-10-27 18:04:33','2012-10-27 18:04:34',NULL,NULL);
INSERT INTO `acos` VALUES (297,'Superpaint',3,'1970-01-01 00:00:00','The person who brought CG research to PARC under Taylor was Dr. Richard Shoup of Carnegie Mellon University. Shoup had been at the short-lived Berkeley Computer Company (BCC) from 1968 to 1970 and was given a full year upon starting at PARC to explore what it was he wanted to do. What he ended up doing was developing SuperPaint. Along with artist Alvy Ray Smith, Shoup experimented, designed, and built the first digital paint system with a non-random access, 8-bit framebuffer.\nSuperPaint recorded and stored its first image at 486âˆž640 resolution (a picture of Dick Shoup holding a sign saying \"It works, sort of\"). The work was completed with assistance from Robert Flegal, Jim Curry, and Patrick Beaudelaire on April 10, 1973.\n',NULL,NULL,NULL,1,'2012-10-27 18:19:36','2012-10-27 18:20:00',NULL,NULL);
INSERT INTO `acos` VALUES (298,'Alvy Ray Smith and Superpaint',3,'1971-01-01 00:00:00','\"My big technical contribution (I was really there as an artist) at Xerox PARC to Shoup\'s SuperPaint was invention and implementation of the RGB to HSV transform for artistic selection of colors. Other than this contribution, all other programming of SuperPaint was Dick\'s.\" ',NULL,NULL,173,1,'2012-10-27 18:20:49','2012-10-27 18:21:06',NULL,NULL);
INSERT INTO `acos` VALUES (299,'Superpaint',2,NULL,NULL,'http://www.rgshoup.com/prof/SuperPaint/images/SP_menu75.gif',NULL,NULL,1,'2012-10-27 18:22:05','2012-10-27 18:22:08',NULL,NULL);
INSERT INTO `acos` VALUES (300,'Richard Shoup',2,NULL,NULL,'http://www.rgshoup.com/prof/RGS-1a-med.jpg',NULL,NULL,1,'2012-10-27 18:23:22','2012-10-27 18:23:23',NULL,NULL);
INSERT INTO `acos` VALUES (301,'the first PC in the White House!',3,'1978-01-01 00:00:00','The first Alto PC was powered up in 1973 (displaying an image of Sesame Street\'s Cookie Monster). Its bitmap display was a vertical format 8âˆž11-inch screen with a resolution of 606âˆž808 pixels. With a maximum of 128k of main memory and a 2.5 meg disc, more than 2,000 were manufactured by 1978 at a cost of about $12,000 each. Upgraded as the AltoII in 1975 and the AltoIII in 1976, it actually was the first PC installed in the White House (in 1978). There\'s some irony, perhaps, in the fact that the world\'s first WYSIWYG computer was used in the heart of Washington politics.',NULL,NULL,NULL,1,'2012-10-27 18:27:54','2012-10-27 18:27:55',NULL,NULL);
INSERT INTO `acos` VALUES (302,'the first GUI',3,'1975-01-01 00:00:00','In February 1975, the first GUI is demonstrated with multiple windows and pop-up menus. These later would be incorporated as a standard in Mac (and later Windows) operating desktop systems.',NULL,NULL,NULL,1,'2012-10-27 18:28:28','2012-10-27 18:28:29',NULL,NULL);
INSERT INTO `acos` VALUES (303,'Maurice Benayoun',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/thumb/4/4c/MoBen.jpg/220px-MoBen.jpg',NULL,NULL,1,'2012-10-27 18:31:12','2012-10-27 18:31:14',NULL,NULL);
INSERT INTO `acos` VALUES (304,'in-house software',3,'1992-01-01 00:00:00','In addition to using Softimage, Z-A continues to develop its own software for animation. One of the most interesting is probably Persona. Interfaced with some classical 3D animation software, Persona is a complete toolbox for filtering captured inputs such as gestures (with magnetic trackers, for example), sounds (music, voice), mouse, joystick, and so on. Persona the animator can easily convert plain gestures in cartoon-like, robotic, elastic animation. For all virtual reality applications, Z-A R&D (David Nahon, Tristan Lorach) has developed in-house software including the Zasoundserver, which is a tool for real-time sound mixing and 3D sound effects for 16 channels and up to eight outputs suitable to virtual environments. Mostly developed in OpenGL, some of these developments have been achieved thanks to the partnership of SGI Europe (Patrick Bouchaud, Kimi Bishop).',NULL,NULL,267,1,'2012-10-27 18:37:01','2012-10-27 18:37:02',NULL,NULL);
INSERT INTO `acos` VALUES (305,'World Skin',3,'1998-01-01 00:00:00','In 1998, World Skin, a CAVE installation presented at Siggraph 98 (Orlando), received the Golden Nica interactive art award at Ars Electronica. All these artistic as well as philosophically challenging installations combined virtual reality, the Internet, intelligent agents, photographic cameras, and printers. These works, conceived by Maurice Benayoun, were able to give Z-A a leading edge in Europe with regard to interactive installations, museums, cultural theme parks, exhibitions, and events. ',NULL,NULL,267,1,'2012-10-27 18:38:37','2012-10-27 18:38:38',NULL,NULL);
INSERT INTO `acos` VALUES (306,'Omnibus demo reel - 1985',1,NULL,NULL,'http://www.youtube.com/watch?v=K18ZcE2t1Kw','K18ZcE2t1Kw',NULL,1,'2012-10-28 11:41:13','2012-10-28 11:41:16',NULL,NULL);
INSERT INTO `acos` VALUES (307,'Ed Kramer',2,NULL,NULL,'http://media.dexigner.com/article/12888/Ed_Kramer.jpg',NULL,NULL,1,'2012-10-28 12:02:19','2012-10-28 12:02:23',NULL,NULL);
INSERT INTO `acos` VALUES (308,'for more information ...',3,NULL,'For a more in-depth look at analog video animation, see \"ANALOG to DIGITAL Conversion: A History of Video Animation\" by Ed Kramer, published in the Conference Proceedings of the National Computer Graphics Association, Volume II, 1987 pp. 363â€“382. You also can visit the Scanimate Web page, maintained by former Image West engineer David Seig, at http://scanimate.zfx.com ',NULL,NULL,129,1,'2012-10-28 12:05:57','2012-10-28 12:06:04',NULL,NULL);
INSERT INTO `acos` VALUES (309,'partial list of early users',3,NULL,'It would be impossible to name all the analog animation pioneers from the early days of computer graphics. Many of them, however, have remained active in the CG industry for almost 20 years including Rob Bekhurs, Susan Crouse-Kemp, Richard Froman, Dave Holman, Mike Jackson, Art Kellner, Fred Kessler, Sonny King, Jeff Kleiser, Henry Kline II, Peter Koczera, Ed Kramer, Russ Maehl, Gary McKinnon, Mike Saz, and Roy Weinstock. The late Ron Hays was one of the original pioneers of the aesthetics of video animation, and he is remembered for his elegant direction of effects in the music video for \"Sergeant Pepper\'s.\"',NULL,NULL,129,1,'2012-10-28 12:06:33','2012-10-28 12:06:34',NULL,NULL);
INSERT INTO `acos` VALUES (310,'The End',3,'1985-06-01 00:00:00','In the early 1980s, with the digital revolution poised to wash over the effects industry, there were two attempts to create a digitally controlled analog video system. At Image West, David Seig engineered the VERSEFEX, a system in which full-color transparencies could be used as input. Digital oscillators and 3D perspective were incorporated to animate the same video parameters found in Scanimate. At Computer Image Corp., Ed Tajchman created the System IV, a true digital 3D animation system with accurate perspective and digital keyframing. Its input, however, was still monochrome video, and it carried a price tag of around a million dollars. The System IV was used in production (by this author) at Editel in Hollywood from 1983 to 1985 in conjunction with Scanimate.\nWith the introduction of the Ampex Digital Optics (ADO) digital video system in late 1981, digital paint systems such as the Quantel Paint Box in 1982, and affordable 3D animation systems such as the Bosch FGS-4000 in 1983, the era of analog effects was rapidly phased out in the United States by the mid-1980s.\n',NULL,NULL,129,1,'2012-10-28 12:07:17','2012-10-28 12:07:18',NULL,NULL);
INSERT INTO `acos` VALUES (311,'how many scanimates?',3,'1980-01-01 00:00:00','Eight Scanimates had been built, six of which were in the United States. Two were in Denver at Computer Image Corporation, Lee Harrison\'s company. (Harrison\'s team also created an analog animation device known as CAESAR, which was specifically used for character animation.) Two Scanimates were in New York at Dolphin Productions, and two more were in Hollywood at Image West.',NULL,NULL,129,1,'2012-10-28 12:08:20','2012-10-28 12:08:21',NULL,NULL);
INSERT INTO `acos` VALUES (312,'The Golden Days',3,'1980-01-01 00:00:00','The Golden Days\nThe aesthetics of television graphics were driven by analog technology in the 1970s and early \'80s, and were defined by such Scanimate effects as shining gold logos flying over glowing grids and sparkling star fields. Because Scanimate used a video CRT, optical devices such as star filters, shower glass, or rainbow filters could be placed in front of the lens to make the logos glow or twinkle.\nA Scanimate suite was much like a video-editing suite; image sources were combined through a video switcher using wipes, cross-dissolves, luminance keying, and chroma keying. Multiple images could be played back from multiple videotape machines through the switcher. Scanimate could be triggered to run in sync with any tape deck. (This was before the invention of VHS, Beta, or digital videotape. The professional video standard format at this time was reel-to-reel two-inch videotape!) Scanimate animation could be recorded on one tape machine, played back with another pass added on top, and then recorded to another machine.\nThese video techniques enabled Scanimate trickery to be used, for example, to create 3D gold flying logos. Here\'s the secret: An artist programmed Scanimate to create an undulating golden texture using oscillators patched into the INTENSITY parameter. (At Image West, we referred to this effect as \"Thrill-o-vision!\") A 3D logo, physically carved from balsa wood, was attached to a wooden dowel and connected to a stepper motor. The front surface of the carved logo was painted white, and the extruded sides were painted gray. The whole logo was then mounted in front of a chroma key blue background. Patching these signals into the video switcher, the artist defined the logo\'s white front surface as a luminance key hole. He then replaced it with the moving gold texture from Scanimate. Setting a different luminance key for the gray surfaces, he patched a darker gold texture into the extruded sides. He then created a streaking Scanimate star field and replaced the chroma key blue with that. The artist added another Scanimate pass to make the logo glow and used an Apple II computer to drive the motor to rotate the logo. VoilÃ¡! A 3D gold logo rotating through space! All this was recorded to tape in real time with the capability to change speeds, color, or motion as the client and art director supervised.\n',NULL,NULL,129,1,'2012-10-28 12:09:15','2012-10-28 12:09:17',NULL,NULL);
INSERT INTO `acos` VALUES (313,'Imagewest Scanimate demo - 1978',1,NULL,NULL,'http://www.youtube.com/watch?v=wTO3CKM2Yy0','wTO3CKM2Yy0',NULL,1,'2012-10-28 12:11:27','2012-10-28 12:11:28',NULL,NULL);
INSERT INTO `acos` VALUES (314,'Interview with Lee Harrison',1,NULL,NULL,'http://www.youtube.com/watch?v=SGF0Okaee1o','SGF0Okaee1o',NULL,1,'2012-10-28 12:15:14','2012-10-28 12:15:16',NULL,NULL);
INSERT INTO `acos` VALUES (315,'Scientific and Technical Academy Award',3,'1996-01-01 00:00:00','Ed Catmull, Tom Porter, Tom Duff, and Alvy Ray Smith received a Scientific and Technical Academy Award in 1996 from the Academy of Motion Picture Arts and Sciences (AMPAS) for \"pioneering inventions in digital image compositing\" (basically, for the invention of the alpha channel).',NULL,NULL,NULL,1,'2012-10-28 12:23:34','2012-10-28 12:23:35',NULL,NULL);
INSERT INTO `acos` VALUES (316,'Alvy Ray Smith',2,NULL,NULL,'http://alvyray.com/Bio/images/AlvyKingForbesASAP4x5.jpg',NULL,NULL,1,'2012-10-28 12:26:28','2012-10-28 12:26:30',NULL,NULL);
INSERT INTO `acos` VALUES (317,'Scientific and Engineering Award',3,'1999-01-01 00:00:00','In February 1999, the Academy of Motion Picture Arts and Sciences recognized Discreet Logic\'s flame and inferno products for their influence on the advancement of the motion picture industry with a Scientific and Engineering Award.',NULL,NULL,NULL,1,'2012-10-28 12:43:30','2012-10-28 12:43:32',NULL,NULL);
INSERT INTO `acos` VALUES (318,'The End',3,'2000-01-01 00:00:00','Discreet Logic was acquired by Autodesk in 1999 for about $520 million in stock. Terms of the buyout were modified in early 1999 after an SEC review. The company is located in Montreal.',NULL,NULL,NULL,1,'2012-10-28 12:44:48','2012-10-28 12:44:49',NULL,NULL);
INSERT INTO `acos` VALUES (319,'How to light a blue screen',1,NULL,NULL,'http://www.youtube.com/watch?v=k1-1GpQVOJ4','k1-1GpQVOJ4',NULL,1,'2012-10-28 14:47:21','2012-10-28 14:47:47',NULL,NULL);
INSERT INTO `acos` VALUES (320,'Zbigniew Rybczynski',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Zbigniew_Rybczy%C5%84ski.jpg/220px-Zbigniew_Rybczy%C5%84ski.jpg',NULL,NULL,1,'2012-10-28 14:53:50','2012-10-28 14:53:52',NULL,NULL);
INSERT INTO `acos` VALUES (321,'ACM ',3,NULL,'Having received his Ph.D from the University of Minnesota, Kenneth Torrance made the move to Cornell University to teach mechanical and aerospace engineering in 1968.  During the next 42 years, he delighted and challenged students with his kind nature and probing intellect. Torrance used innovative strategies in computer graphics to further his research in heat transfer and fluid mechanics and subsequently became one of ACM SIGGRAPH\'s most highly respected researchers.  Recipient of the ACM SIGGRAPH Computer Graphics Achievement Award in 1994, Ken Torrance was a familiar face at SIGGRAPH conferences and became a valued volunteer and close-knit member of the SIGGRAPH community. ACM SIGGRAPH mourns the loss of one of our own; he will be dearly missed by all who knew him. ',NULL,NULL,NULL,1,'2012-10-28 18:37:50','2012-10-28 18:37:51',NULL,NULL);
INSERT INTO `acos` VALUES (322,'Kenneth Torrance',2,NULL,NULL,'http://cornelldailysun.com/files/images/Pg-1-Kenneth-Torrance-Mug.thumbnail.jpg',NULL,NULL,1,'2012-10-28 18:39:31','2012-10-28 18:39:33',NULL,NULL);
INSERT INTO `acos` VALUES (323,'the original Cornell box',2,NULL,NULL,'http://www.graphics.cornell.edu/online/box/goral.jpg',NULL,NULL,1,'2012-10-28 18:41:41','2012-10-28 18:42:50',NULL,NULL);
INSERT INTO `acos` VALUES (324,'The End',3,'2012-05-14 00:00:00','\"Imagination Technologies announces the end of sale and end of life of the SplutterFish Brazil and Rio software plugins for 3ds Max, effective May 14, 2012. No further product development will be done on these products and no purchases will be accepted. There has been no development for Autodesk 3ds Max 2013.\"',NULL,NULL,NULL,1,'2012-10-28 18:52:35','2012-10-28 18:52:37',NULL,NULL);
INSERT INTO `acos` VALUES (325,'Scientific and Technical Achievement Academy Award ',3,'1991-01-01 00:00:00','The digital ink and paint system was awarded a Scientific and Technical Achievement Academy Award in 1991. Seven individuals shared the award between Pixar Animation Studios and Disney. Tom Hahn, Peter Nye, and Michael Shantzis of Pixar developed the scan and paint part of the system. Randy Cartwright, Lem Davis, David Coons, Mark Kimball, Jim Houston, and David Wolf of Disney developed the Disney Logistics System (DALS) component.',NULL,NULL,NULL,1,'2012-10-29 11:27:59','2012-10-29 11:28:00',NULL,NULL);
INSERT INTO `acos` VALUES (326,'The End',3,'2004-01-01 00:00:00','Unfortunately by 2004 Disney decided that â€œall 3Dâ€ movies where what the public wanted and CAPS (along with the entire 2D division) was shut down.',NULL,NULL,NULL,1,'2012-10-29 11:28:33','2012-10-29 11:28:35',NULL,NULL);
INSERT INTO `acos` VALUES (327,'First CAPS use ',3,'1989-01-01 00:00:00','CAPS was first used on a single scene at the end of The Little Mermaid in 1989. The Rescuers Down Under (1990) was the first film to be produced with no traditional cels at all (making it the first all digital feature film in that respect).',NULL,NULL,NULL,1,'2012-10-29 11:30:28','2012-10-29 11:30:30',NULL,NULL);
INSERT INTO `acos` VALUES (328,'John Warnock',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/2/25/John_Warnock_2008.jpg',NULL,NULL,1,'2012-10-29 11:36:35','2012-10-29 11:36:38',NULL,NULL);
INSERT INTO `acos` VALUES (329,'Alan Cutis Kay',2,NULL,NULL,'http://upload.wikimedia.org/wikipedia/commons/c/c1/Alan_Kay2.jpg',NULL,NULL,1,'2012-10-29 12:16:01','2012-10-29 12:16:04',NULL,NULL);
INSERT INTO `acos` VALUES (330,'Academy Award',3,'1993-01-01 00:00:00','In 1993 the developers of Pixar\'s RenderMan (Loren Carpenter , Rob Cook, Ed Catmull, Thomas Porter, Pat Hanrahan, Tony Apodaca & Darwyn Peachey) won a Scientific and Engineering Achievement Award from the Academy of Motion Picture Arts and Sciences for RenderMan\'s contribution to the motion picture industry.',NULL,NULL,NULL,1,'2012-10-29 12:30:45','2012-10-29 12:32:34',NULL,NULL);
INSERT INTO `acos` VALUES (331,'How did Renderman get its name?',3,'1989-01-01 00:00:00','\"Well, the short version of the story is that back in \'86 or \'87, the hardware people were building VME boards with 16 transputers to run the renderer. Just for grins, one of them (Jeff Mock) built a postcard-size, 4-TP board. Pat was in his office, and they were admiring the coolness of it, thinking how you could put it in a box and render while you\'re walking around. Prestoâ€”RenderMan!\"  ',NULL,NULL,NULL,1,'2012-10-29 12:33:26','2012-10-29 12:33:40',NULL,NULL);
INSERT INTO `acos` VALUES (332,'Red\'s Dream - 1987',1,NULL,NULL,'http://www.youtube.com/watch?v=VA1vZ8wJTys','VA1vZ8wJTys',NULL,1,'2012-10-29 12:38:23','2012-10-29 12:38:24',NULL,NULL);
/*!40000 ALTER TABLE `stories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `story_types`
--

DROP TABLE IF EXISTS `story_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `story_types` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `story_types`
--

LOCK TABLES `story_types` WRITE;
/*!40000 ALTER TABLE `story_types` DISABLE KEYS */;
INSERT INTO `story_types` VALUES (1,'Video');
INSERT INTO `acos` VALUES (2,'Image');
INSERT INTO `acos` VALUES (3,'Text');
/*!40000 ALTER TABLE `story_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(30) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '',
  `approved` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'student',1);
INSERT INTO `acos` VALUES (2,'NEU',1);
INSERT INTO `acos` VALUES (3,'software engineer',1);
INSERT INTO `acos` VALUES (4,'Producer',1);
INSERT INTO `acos` VALUES (5,'visual effects',1);
INSERT INTO `acos` VALUES (6,'SIGGRAPH',1);
INSERT INTO `acos` VALUES (7,'Senior Technical Director',1);
INSERT INTO `acos` VALUES (8,'Sequence Supervisor',1);
INSERT INTO `acos` VALUES (9,'Pixar',1);
INSERT INTO `acos` VALUES (10,'Animated Film',1);
INSERT INTO `acos` VALUES (11,'Animation',1);
INSERT INTO `acos` VALUES (12,'Motion Pictures',1);
INSERT INTO `acos` VALUES (13,'Software',1);
INSERT INTO `acos` VALUES (14,'Computer Scientist',1);
INSERT INTO `acos` VALUES (15,'President',1);
INSERT INTO `acos` VALUES (16,'Cartoon',1);
INSERT INTO `acos` VALUES (17,'Studio',1);
INSERT INTO `acos` VALUES (18,'Production Company',1);
INSERT INTO `acos` VALUES (19,'NYIT',1);
INSERT INTO `acos` VALUES (20,'University',1);
INSERT INTO `acos` VALUES (21,'Research',1);
INSERT INTO `acos` VALUES (22,'interactive media',1);
INSERT INTO `acos` VALUES (23,'design',1);
INSERT INTO `acos` VALUES (24,'capstone class',1);
INSERT INTO `acos` VALUES (25,'awesome',1);
INSERT INTO `acos` VALUES (26,'junk',1);
INSERT INTO `acos` VALUES (27,'jshdf',1);
INSERT INTO `acos` VALUES (28,'conference',1);
INSERT INTO `acos` VALUES (29,'ACM',1);
INSERT INTO `acos` VALUES (30,'film',1);
INSERT INTO `acos` VALUES (31,'animation',1);
INSERT INTO `acos` VALUES (32,'',1);
INSERT INTO `acos` VALUES (33,'graphics',1);
INSERT INTO `acos` VALUES (34,'director',1);
INSERT INTO `acos` VALUES (35,'screenwriter',1);
INSERT INTO `acos` VALUES (36,'special effects',1);
INSERT INTO `acos` VALUES (37,'Luxor',1);
INSERT INTO `acos` VALUES (38,'previsualization',1);
INSERT INTO `acos` VALUES (39,'computer graphics',1);
INSERT INTO `acos` VALUES (40,'researcher',1);
INSERT INTO `acos` VALUES (41,'Creative Industries',1);
INSERT INTO `acos` VALUES (42,'Simpsons',1);
INSERT INTO `acos` VALUES (43,'Utah Teapot',1);
INSERT INTO `acos` VALUES (44,'Pacific Data Images',1);
INSERT INTO `acos` VALUES (45,'PDI/DreamWorks',1);
INSERT INTO `acos` VALUES (46,'PDI',1);
INSERT INTO `acos` VALUES (47,'designer',1);
INSERT INTO `acos` VALUES (48,'lalala',1);
INSERT INTO `acos` VALUES (49,'game',1);
INSERT INTO `acos` VALUES (50,'3D graphics',1);
INSERT INTO `acos` VALUES (51,'capstone',1);
INSERT INTO `acos` VALUES (52,'Northeastern University',1);
INSERT INTO `acos` VALUES (53,'Disney',1);
INSERT INTO `acos` VALUES (54,'project manager',1);
INSERT INTO `acos` VALUES (55,'amazing musician',1);
INSERT INTO `acos` VALUES (56,'software',1);
INSERT INTO `acos` VALUES (57,'Canadian',1);
INSERT INTO `acos` VALUES (58,'rendering',1);
INSERT INTO `acos` VALUES (59,'hardware',1);
INSERT INTO `acos` VALUES (60,'ILM',1);
INSERT INTO `acos` VALUES (61,'visual effects supervisor',1);
INSERT INTO `acos` VALUES (62,'research',1);
INSERT INTO `acos` VALUES (63,'video games',1);
INSERT INTO `acos` VALUES (64,'France',1);
INSERT INTO `acos` VALUES (65,'Pioneer',1);
INSERT INTO `acos` VALUES (66,'harware',1);
INSERT INTO `acos` VALUES (67,'motion-control',1);
INSERT INTO `acos` VALUES (68,'UK',1);
INSERT INTO `acos` VALUES (69,'SGI',1);
INSERT INTO `acos` VALUES (70,'production',1);
INSERT INTO `acos` VALUES (71,'scanimate',1);
INSERT INTO `acos` VALUES (72,'president',1);
INSERT INTO `acos` VALUES (73,'co-founder',1);
INSERT INTO `acos` VALUES (74,'Metrolight',1);
INSERT INTO `acos` VALUES (75,'Windlight',1);
INSERT INTO `acos` VALUES (76,'Nelvana',1);
INSERT INTO `acos` VALUES (77,'pioneer',1);
INSERT INTO `acos` VALUES (78,'Tron',1);
INSERT INTO `acos` VALUES (79,'professor',1);
INSERT INTO `acos` VALUES (80,'feature film',1);
INSERT INTO `acos` VALUES (81,'technical director',1);
INSERT INTO `acos` VALUES (82,'software design',1);
INSERT INTO `acos` VALUES (83,'book',1);
INSERT INTO `acos` VALUES (84,'history',1);
INSERT INTO `acos` VALUES (85,'Technical Director',1);
INSERT INTO `acos` VALUES (86,'simulation',1);
INSERT INTO `acos` VALUES (87,'TDI',1);
INSERT INTO `acos` VALUES (88,'Scanimate',1);
INSERT INTO `acos` VALUES (89,'animator',1);
INSERT INTO `acos` VALUES (90,'Art Director',1);
INSERT INTO `acos` VALUES (91,'Japan',1);
INSERT INTO `acos` VALUES (92,'founder',1);
INSERT INTO `acos` VALUES (93,'Wavefront',1);
INSERT INTO `acos` VALUES (94,'Minneapolis',1);
INSERT INTO `acos` VALUES (95,'hardware engineer',1);
INSERT INTO `acos` VALUES (96,'academic',1);
INSERT INTO `acos` VALUES (97,'broadcast',1);
INSERT INTO `acos` VALUES (98,'art',1);
INSERT INTO `acos` VALUES (99,'artist',1);
INSERT INTO `acos` VALUES (100,'raytracing',1);
INSERT INTO `acos` VALUES (101,'math',1);
INSERT INTO `acos` VALUES (102,'producer',1);
INSERT INTO `acos` VALUES (103,'French',1);
INSERT INTO `acos` VALUES (104,'analog',1);
INSERT INTO `acos` VALUES (105,'compositing',1);
INSERT INTO `acos` VALUES (106,'editing',1);
INSERT INTO `acos` VALUES (107,'image editing',1);
INSERT INTO `acos` VALUES (108,'rednering',1);
INSERT INTO `acos` VALUES (109,'blah',1);
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) NOT NULL DEFAULT '',
  `last_name` varchar(30) NOT NULL DEFAULT '',
  `email` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT '',
  `group_id` int(11) unsigned NOT NULL DEFAULT '2',
  `created` datetime DEFAULT NULL,
  `modified` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Stefano','DAmico','skdamico@gmail.com','6fb9ed561623d1be80b15c0e52389d5423a6b15e',2,'2012-03-26 22:59:51','2012-03-26 22:59:51');
INSERT INTO `acos` VALUES (2,'Terrence','Masson','tman@visualfx.com','913830ec55fab145e80ab190e1bafc2a8e14942d',2,'2012-03-27 14:33:22','2012-03-27 14:33:22');
INSERT INTO `acos` VALUES (3,'Connie','Chan','hello.cchan@gmail.com','2a92c83503a1c0fb61cce89f1b069e739222bd23',2,'2012-03-28 19:37:50','2012-03-28 19:37:50');
INSERT INTO `acos` VALUES (4,'Michelle','Gayowski','michelle.gayowski@gmail.com','2a92c83503a1c0fb61cce89f1b069e739222bd23',2,'2012-03-28 21:25:58','2012-03-28 21:25:58');
INSERT INTO `acos` VALUES (5,'James','Staub','james.staub@gmail.com','d3cb84f1600300a06a7da36de1d3214f83818b4b',2,'2012-03-28 22:17:54','2012-03-28 22:17:54');
INSERT INTO `acos` VALUES (6,'Brian','Sullivan','bri.sullivan@neu.edu','086f86f4ea6d9e82cc00e4a914037127a564ca88',2,'2012-04-03 14:16:48','2012-04-03 14:16:48');
INSERT INTO `acos` VALUES (7,'Ali','Aas','aas.alexandra@gmail.com','bd387ee897b089d564141ad5cc1f537554f420ac',2,'2012-09-18 14:45:30','2012-09-18 14:45:30');
INSERT INTO `acos` VALUES (8,'steve','yao','yao.s@husky.neu.edu','fcfbb2ced1610032bf31d0da60447369d71e4ee4',2,'2012-10-16 06:15:35','2012-10-16 06:15:35');
INSERT INTO `acos` VALUES (9,'Kyle','Montag','gordon117@gmail.com','33177d0a958397cf80710388ebd6f883f568d3f7',2,'2012-12-01 18:52:56','2012-12-01 18:52:56');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `views`
--

DROP TABLE IF EXISTS `views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `table_id` int(11) unsigned NOT NULL,
  `table_name` varchar(15) NOT NULL DEFAULT '',
  `count` int(11) unsigned NOT NULL,
  PRIMARY KEY (`id`)
);
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `views`
--

LOCK TABLES `views` WRITE;
/*!40000 ALTER TABLE `views` DISABLE KEYS */;
/*!40000 ALTER TABLE `views` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2012-12-21 18:13:36
