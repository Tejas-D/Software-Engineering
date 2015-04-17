CREATE DATABASE  IF NOT EXISTS `toytoyerz` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `toytoyerz`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: toytoyerz
-- ------------------------------------------------------
-- Server version	5.5.40

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
  `adminID` varchar(60) NOT NULL,
  `adminPassword` varchar(45) NOT NULL,
  `adminName` varchar(45) NOT NULL,
  `adminSurname` varchar(45) NOT NULL,
  `attendance` int(5) NOT NULL,
  PRIMARY KEY (`adminID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('nelio@uk.com','g4s64fsf1fe','Nelio','Lucas',22),('tejas@uk.com','dfksdg54fsf4f','Tejas','Dwarkaram',22);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `assembly`
--

DROP TABLE IF EXISTS `assembly`;
/*!50001 DROP VIEW IF EXISTS `assembly`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `assembly` (
  `Category_Name` tinyint NOT NULL,
  `Product_ID` tinyint NOT NULL,
  `Product_Name` tinyint NOT NULL,
  `Part_Number` tinyint NOT NULL,
  `Part_Name` tinyint NOT NULL,
  `Quantity_Required` tinyint NOT NULL,
  `Quantity_ON_Hand` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `categoryID` varchar(25) NOT NULL,
  `categoryName` varchar(45) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES ('cat1','console'),('cat2','doll'),('cat3','action figure'),('cat4','board game'),('cat5','doll house'),('cat6','cards');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `company` (
  `companyID` varchar(15) NOT NULL,
  `companyName` varchar(45) NOT NULL,
  `contactName` varchar(20) NOT NULL,
  `contactSurname` varchar(20) NOT NULL,
  `companyAddress` varchar(80) NOT NULL,
  `telno` varchar(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `fax` varchar(10) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`companyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('com1','NovaCore','Leo','Renald','64 jump street','0123456789','leo@gmail.com','6548133648','72b302bf297a228a75730123efef7c41'),('com2','DungeonCo','Bert','Levi','22 maple street','574642367','bert@gmail.com','6943587432','019b111ec0c13ed923922715bfb1670a'),('com3','ToysRus','Bob','Bush','88 stuarthooz street','4579132648','bob@gmail.com','4586139753','daeccf0ad3c1fc8c8015205c332f5b42'),('com4','GameWorld','Kate','Luna','23 murray street','9754238463','kate@gmail.com','4564524564','021aa2da4741fb80f52e328b42cbe097');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `employee sales`
--

DROP TABLE IF EXISTS `employee sales`;
/*!50001 DROP VIEW IF EXISTS `employee sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `employee sales` (
  `Administrator` tinyint NOT NULL,
  `Staff_Memeber` tinyint NOT NULL,
  `salesAmount` tinyint NOT NULL,
  `Date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoice` (
  `invoiceID` varchar(15) NOT NULL,
  `invoiceDate` datetime DEFAULT NULL,
  `salesAmount` decimal(8,0) NOT NULL,
  `companyID` varchar(15) NOT NULL,
  `adminID` varchar(60) NOT NULL DEFAULT '',
  `staffID` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`invoiceID`,`companyID`,`adminID`,`staffID`),
  KEY `fk_invoice_company1_idx` (`companyID`),
  KEY `fk_invoice_admin1_idx` (`adminID`),
  KEY `fk_invoice_staff1_idx` (`staffID`),
  CONSTRAINT `fk_invoice_company1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_admin1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_staff1` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoice`
--

LOCK TABLES `invoice` WRITE;
/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` VALUES ('inv1','2013-07-08 00:00:00',9100,'com1','nelio@uk.com','lin@uk.com'),('inv2','2013-07-09 00:00:00',2100,'com2','tejas@uk.com','Pam@uk.com'),('inv3','2013-07-09 00:00:00',11200,'com1','nelio@uk.com','spiwe@uk.com'),('inv4','2013-07-10 00:00:00',18200,'com4','tejas@uk.com','tyron@uk.com');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoicelist`
--

DROP TABLE IF EXISTS `invoicelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `invoicelist` (
  `invoiceID` varchar(15) NOT NULL,
  `productID` varchar(10) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`invoiceID`,`productID`),
  KEY `fk_invoicelist_products1_idx` (`productID`),
  CONSTRAINT `fk_invoicelist_invoice1` FOREIGN KEY (`invoiceID`) REFERENCES `invoice` (`invoiceID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoicelist_products1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicelist`
--

LOCK TABLES `invoicelist` WRITE;
/*!40000 ALTER TABLE `invoicelist` DISABLE KEYS */;
INSERT INTO `invoicelist` VALUES ('inv1','c01',1),('inv2','a01',3),('inv3','c02',1),('inv4','c01',2);
/*!40000 ALTER TABLE `invoicelist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `loginCount` int(11) NOT NULL,
  `failedLogins` varchar(45) NOT NULL,
  `TimeDate` varchar(45) NOT NULL,
  `staffID` varchar(60) NOT NULL DEFAULT '',
  `adminID` varchar(60) NOT NULL DEFAULT '',
  PRIMARY KEY (`staffID`,`adminID`),
  KEY `fk_log_admin1_idx` (`adminID`),
  CONSTRAINT `fk_log_staffID` FOREIGN KEY (`staffID`) REFERENCES `staff` (`staffID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_log_admin1` FOREIGN KEY (`adminID`) REFERENCES `admin` (`adminID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderlist`
--

DROP TABLE IF EXISTS `orderlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orderlist` (
  `quantity` int(11) NOT NULL,
  `partID` varchar(8) NOT NULL,
  `orderID` varchar(20) NOT NULL,
  PRIMARY KEY (`partID`,`orderID`),
  KEY `fk_orderlist_order1_idx` (`orderID`),
  CONSTRAINT `fk_orderlist_parts1` FOREIGN KEY (`partID`) REFERENCES `parts` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_orderlist_order1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderlist`
--

LOCK TABLES `orderlist` WRITE;
/*!40000 ALTER TABLE `orderlist` DISABLE KEYS */;
INSERT INTO `orderlist` VALUES (60,'p01','001'),(60,'p04','002'),(50,'p08','003'),(40,'p11','004'),(100,'p12','005'),(150,'p13','006');
/*!40000 ALTER TABLE `orderlist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `orderID` varchar(20) NOT NULL,
  `orderDate` datetime DEFAULT NULL,
  PRIMARY KEY (`orderID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES ('001','2012-02-14 00:00:00'),('002','2012-02-14 00:00:00'),('003','2012-02-14 00:00:00'),('004','2012-06-01 00:00:00'),('005','2012-07-23 00:00:00'),('006','2012-10-22 00:00:00');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partinvoice`
--

DROP TABLE IF EXISTS `partinvoice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `partinvoice` (
  `partID` varchar(8) NOT NULL,
  `quantity` int(11) NOT NULL,
  `Date` datetime DEFAULT NULL,
  PRIMARY KEY (`partID`),
  CONSTRAINT `fk_partinvoice_parts1` FOREIGN KEY (`partID`) REFERENCES `parts` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partinvoice`
--

LOCK TABLES `partinvoice` WRITE;
/*!40000 ALTER TABLE `partinvoice` DISABLE KEYS */;
INSERT INTO `partinvoice` VALUES ('p02',50,'2012-08-13 00:00:00'),('p06',45,'2012-09-01 00:00:00');
/*!40000 ALTER TABLE `partinvoice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parts`
--

DROP TABLE IF EXISTS `parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `parts` (
  `partID` varchar(8) NOT NULL,
  `name` varchar(45) NOT NULL,
  `price` decimal(7,0) NOT NULL,
  `qoh` int(6) NOT NULL DEFAULT '100' COMMENT 'Quantity On Hand',
  PRIMARY KEY (`partID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parts`
--

LOCK TABLES `parts` WRITE;
/*!40000 ALTER TABLE `parts` DISABLE KEYS */;
INSERT INTO `parts` VALUES ('p01','Screws',120,0),('p02','Harddrive',1100,100),('p03','CPU',2500,100),('p04','GPU',1200,0),('p06','Wooden Planks',50,300),('p07','Cardboard paper',100,1000),('p08','Motherboard',1100,0),('p09','Case',600,100),('p10','9V Battery',30,120),('p11','8GB DDR5 RAM ',1400,0),('p12','LED lights',15,0),('p13','Resistors',5,0),('p14','Capacitor',25,30);
/*!40000 ALTER TABLE `parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `parts ordered`
--

DROP TABLE IF EXISTS `parts ordered`;
/*!50001 DROP VIEW IF EXISTS `parts ordered`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `parts ordered` (
  `Order_Number` tinyint NOT NULL,
  `Part_Number` tinyint NOT NULL,
  `quantity` tinyint NOT NULL,
  `Date` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `parts recieved`
--

DROP TABLE IF EXISTS `parts recieved`;
/*!50001 DROP VIEW IF EXISTS `parts recieved`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `parts recieved` (
  `Part_Number` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `quantity` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `productID` varchar(10) NOT NULL,
  `productName` varchar(45) NOT NULL,
  `productDescription` varchar(60) NOT NULL,
  `price` decimal(11,0) NOT NULL,
  `barcode` int(10) NOT NULL,
  `vat` varchar(10) NOT NULL,
  `costPrice` decimal(11,0) NOT NULL,
  `markup` decimal(5,0) NOT NULL,
  `image` varchar(300) DEFAULT NULL,
  `quantity` int(4) NOT NULL,
  `categoryID` varchar(25) NOT NULL,
  PRIMARY KEY (`productID`,`categoryID`),
  KEY `fk_products_category1_idx` (`categoryID`),
  CONSTRAINT `fk_products_category1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES ('a01','Action Man','male action figure',700,3367012,'17%',350,2,'unspecified',100,'cat3'),('a02','Barbie Playhouse','female doll house',1540,85206508,'17%',770,2,'unspecified',100,'cat5'),('a03','Baby Born','female baby doll',420,48982837,'17%',210,2,'unspecified',100,'cat2'),('a04','TMNT','mutant ninja turtle action figures',182,73455380,'17%',91,2,'unspecified',100,'cat3'),('a05','G.I. Joe','action figure',210,36624803,'17%',105,2,'unspecified',100,'cat3'),('a06',' OptimusPrime','transformer action figure',280,43387732,'17%',140,2,'unspecified',100,'cat3'),('a07',' Buzz Light Year','ToyStory action figure',420,62262113,'17%',210,2,'unspecified',100,'cat3'),('a08',' Woody','ToyStory action figure',420,5357831,'17%',210,2,'unspecified',100,'cat3'),('a09','AngryBirds cushion','soft cushion',700,28629493,'17%',350,2,'unspecified',100,'cat2'),('b01','Battleship','strategy game board',280,12555687,'17%',140,2,'unspecified',100,'cat4'),('b02','Monopoly','strategy game board',560,86972502,'17%',280,2,'unspecified',100,'cat4'),('b03','Scrabble','strategy game boad',490,46108039,'17%',245,2,'unspecified',100,'cat4'),('b04','UNO','gaming cards',560,92314844,'17%',280,2,'unspecified',100,'cat6'),('b05','Twister','interactive role playing game',910,47656813,'17%',455,2,'unspecified',100,'cat4'),('c01','Playsation 4','gaming console',9100,87194257,'17%',4550,2,'unspecified',100,'cat1'),('c02','Xbox One','gaming console',11200,76420814,'17%',5600,2,'unspecified',100,'cat1'),('d03','Nintendo Wii','gaming console',4900,52398985,'17%',2450,2,'unspecified',100,'cat1');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productsparts`
--

DROP TABLE IF EXISTS `productsparts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productsparts` (
  `productID` varchar(10) NOT NULL,
  `partID` varchar(8) NOT NULL,
  `requiredQuantity` int(5) NOT NULL,
  PRIMARY KEY (`productID`,`partID`),
  KEY `fk_products/parts_products1_idx` (`productID`),
  KEY `fk_products/parts_parts1` (`partID`),
  CONSTRAINT `fk_products/parts_parts1` FOREIGN KEY (`partID`) REFERENCES `parts` (`partID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_products/parts_products1` FOREIGN KEY (`productID`) REFERENCES `products` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productsparts`
--

LOCK TABLES `productsparts` WRITE;
/*!40000 ALTER TABLE `productsparts` DISABLE KEYS */;
INSERT INTO `productsparts` VALUES ('c01','p01',50),('c01','p03',1),('c01','p04',1),('c02','p01',65);
/*!40000 ALTER TABLE `productsparts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `quoteID` varchar(20) NOT NULL,
  `quoteNumber` varchar(10) DEFAULT NULL,
  `companyID` varchar(15) NOT NULL,
  PRIMARY KEY (`quoteID`,`companyID`),
  KEY `fk_quotes_company1_idx` (`companyID`),
  CONSTRAINT `fk_quotes_company1` FOREIGN KEY (`companyID`) REFERENCES `company` (`companyID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES ('q1','1','com1'),('q2','2','com2'),('q3','3','com4');
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `required parts`
--

DROP TABLE IF EXISTS `required parts`;
/*!50001 DROP VIEW IF EXISTS `required parts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `required parts` (
  `Part_no` tinyint NOT NULL,
  `name` tinyint NOT NULL,
  `quantity` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `staff` (
  `staffID` varchar(60) NOT NULL,
  `staffPassword` varchar(45) NOT NULL,
  `staffName` varchar(45) NOT NULL,
  `staffSurname` varchar(45) NOT NULL,
  `clearance` int(1) NOT NULL COMMENT 'clearance level',
  `attendance` int(5) NOT NULL,
  PRIMARY KEY (`staffID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES ('Archer@uk.com','r78wef4sdf','Archer','Stirling',2,15),('Lana@uk.com','4sdf878wet','Lana ','Del Ray',2,20),('lin@uk.com','t4eryge61s','Lin','Lindy',2,21),('Pam@uk.com','sd6f4sdf4','Pamela','Fritz',2,22),('spiwe@uk.com','4dfg4d6g46d','Spiwe','Longolo',2,20),('tyron@uk.com','2dfg5dfg4h4d6','Tyron','McDonald',2,22);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `total profit`
--

DROP TABLE IF EXISTS `total profit`;
/*!50001 DROP VIEW IF EXISTS `total profit`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `total profit` (
  `Total_Sales` tinyint NOT NULL,
  `Total_Product_Cost` tinyint NOT NULL,
  `Total_profit` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `total sales`
--

DROP TABLE IF EXISTS `total sales`;
/*!50001 DROP VIEW IF EXISTS `total sales`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `total sales` (
  `Total_Sales` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `unavailable parts`
--

DROP TABLE IF EXISTS `unavailable parts`;
/*!50001 DROP VIEW IF EXISTS `unavailable parts`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `unavailable parts` (
  `Part_no` tinyint NOT NULL,
  `name` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `assembly`
--

/*!50001 DROP TABLE IF EXISTS `assembly`*/;
/*!50001 DROP VIEW IF EXISTS `assembly`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `assembly` AS select `category`.`categoryName` AS `Category_Name`,`productsparts`.`productID` AS `Product_ID`,`products`.`productName` AS `Product_Name`,`productsparts`.`partID` AS `Part_Number`,`parts`.`name` AS `Part_Name`,`productsparts`.`requiredQuantity` AS `Quantity_Required`,`parts`.`qoh` AS `Quantity_ON_Hand` from (((`productsparts` join `products` on((`products`.`productID` = `productsparts`.`productID`))) join `parts` on((`parts`.`partID` = `productsparts`.`partID`))) join `category` on((`category`.`categoryID` = `products`.`categoryID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `employee sales`
--

/*!50001 DROP TABLE IF EXISTS `employee sales`*/;
/*!50001 DROP VIEW IF EXISTS `employee sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `employee sales` AS select `invoice`.`adminID` AS `Administrator`,`invoice`.`staffID` AS `Staff_Memeber`,`invoice`.`salesAmount` AS `salesAmount`,`invoice`.`invoiceDate` AS `Date` from `invoice` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `parts ordered`
--

/*!50001 DROP TABLE IF EXISTS `parts ordered`*/;
/*!50001 DROP VIEW IF EXISTS `parts ordered`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parts ordered` AS select `orders`.`orderID` AS `Order_Number`,`orderlist`.`partID` AS `Part_Number`,`orderlist`.`quantity` AS `quantity`,`orders`.`orderDate` AS `Date` from (`orders` join `orderlist` on((`orderlist`.`orderID` = `orders`.`orderID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `parts recieved`
--

/*!50001 DROP TABLE IF EXISTS `parts recieved`*/;
/*!50001 DROP VIEW IF EXISTS `parts recieved`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `parts recieved` AS select `parts`.`partID` AS `Part_Number`,`parts`.`name` AS `name`,`partinvoice`.`quantity` AS `quantity` from (`parts` join `partinvoice` on((`partinvoice`.`partID` = `parts`.`partID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `required parts`
--

/*!50001 DROP TABLE IF EXISTS `required parts`*/;
/*!50001 DROP VIEW IF EXISTS `required parts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `required parts` AS select `parts`.`partID` AS `Part_no`,`parts`.`name` AS `name`,`orderlist`.`quantity` AS `quantity` from (`parts` join `orderlist` on((`orderlist`.`partID` = `parts`.`partID`))) where (`parts`.`qoh` = 0) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total profit`
--

/*!50001 DROP TABLE IF EXISTS `total profit`*/;
/*!50001 DROP VIEW IF EXISTS `total profit`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total profit` AS select sum(`invoice`.`salesAmount`) AS `Total_Sales`,sum((`products`.`costPrice` * `invoicelist`.`quantity`)) AS `Total_Product_Cost`,(sum(`invoice`.`salesAmount`) - sum((`products`.`costPrice` * `invoicelist`.`quantity`))) AS `Total_profit` from ((`invoicelist` join `invoice` on((`invoice`.`invoiceID` = `invoicelist`.`invoiceID`))) join `products` on((`products`.`productID` = `invoicelist`.`productID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `total sales`
--

/*!50001 DROP TABLE IF EXISTS `total sales`*/;
/*!50001 DROP VIEW IF EXISTS `total sales`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `total sales` AS select sum(`invoice`.`salesAmount`) AS `Total_Sales` from `invoice` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `unavailable parts`
--

/*!50001 DROP TABLE IF EXISTS `unavailable parts`*/;
/*!50001 DROP VIEW IF EXISTS `unavailable parts`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `unavailable parts` AS select `parts`.`partID` AS `Part_no`,`parts`.`name` AS `name` from `parts` where (`parts`.`qoh` = 0) */;
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

-- Dump completed on 2014-10-11 16:37:49
