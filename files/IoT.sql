CREATE DATABASE  IF NOT EXISTS `iot` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `iot`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: iot
-- ------------------------------------------------------
-- Server version	8.1.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `datosplanta`
--

DROP TABLE IF EXISTS `datosplanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `datosplanta` (
  `datoP_ID` int NOT NULL AUTO_INCREMENT,
  `datoP_humedad` int DEFAULT NULL,
  `datoP_luzSolar` int DEFAULT NULL,
  `datoP_nivelAgua` decimal(10,2) DEFAULT NULL,
  `datoP_fecha` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`datoP_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `datosplanta`
--

LOCK TABLES `datosplanta` WRITE;
/*!40000 ALTER TABLE `datosplanta` DISABLE KEYS */;
INSERT INTO `datosplanta` VALUES (1,427,500,5.73,'2024-02-17 10:39:36'),(2,890,907,24.69,'2024-02-17 06:23:09'),(3,815,642,22.45,'2024-02-19 06:52:15'),(4,42,648,1.38,'2024-02-16 15:28:23'),(5,517,557,6.14,'2024-02-16 22:41:40'),(6,339,502,13.78,'2024-02-19 02:52:25'),(7,758,242,28.84,'2024-02-15 11:21:18'),(8,602,676,16.21,'2024-02-18 13:58:32'),(9,983,674,12.37,'2024-02-15 09:52:57'),(10,179,643,18.61,'2024-02-16 01:42:36'),(11,214,417,12.24,'2024-02-19 02:02:26'),(12,880,873,20.65,'2024-02-19 09:24:58'),(13,335,2,0.86,'2024-02-15 16:25:50'),(14,612,594,3.31,'2024-02-19 00:56:23'),(15,724,121,14.12,'2024-02-19 23:25:12'),(16,577,854,14.48,'2024-02-19 12:59:45'),(17,95,759,13.00,'2024-02-19 16:31:29'),(18,397,134,14.74,'2024-02-15 07:21:05'),(19,851,1001,11.98,'2024-02-15 07:01:44'),(20,96,304,6.13,'2024-02-15 15:27:38'),(21,31,786,22.52,'2024-02-17 05:39:50'),(22,1006,591,28.12,'2024-02-19 18:23:33'),(23,976,933,20.91,'2024-02-18 17:53:04'),(24,669,24,4.65,'2024-02-18 12:35:43'),(25,60,187,22.07,'2024-02-15 15:34:30'),(26,452,839,23.27,'2024-02-17 02:00:47'),(27,774,548,12.30,'2024-02-17 04:55:13'),(28,997,563,24.95,'2024-02-17 12:35:17'),(29,29,646,2.13,'2024-02-17 07:12:30'),(30,89,56,0.43,'2024-02-19 12:50:17'),(31,502,753,6.23,'2024-02-19 03:33:43'),(32,537,139,3.14,'2024-02-15 13:53:03'),(33,270,997,2.44,'2024-02-17 09:45:34'),(34,166,379,11.03,'2024-02-18 14:54:09'),(35,529,426,15.96,'2024-02-17 01:03:15'),(36,458,12,21.55,'2024-02-17 18:30:05'),(37,630,428,7.37,'2024-02-19 20:34:16'),(38,123,702,2.23,'2024-02-16 13:17:21'),(39,338,737,18.37,'2024-02-19 11:52:46'),(40,673,607,29.79,'2024-02-15 22:12:01'),(41,967,177,0.95,'2024-02-18 04:30:55'),(42,94,563,14.23,'2024-02-18 14:29:09'),(43,184,756,4.65,'2024-02-17 18:55:57'),(44,331,966,22.64,'2024-02-19 16:29:18'),(45,433,311,7.58,'2024-02-16 18:00:35'),(46,1014,931,17.28,'2024-02-15 17:45:05'),(47,12,630,1.39,'2024-02-16 21:56:00'),(48,792,740,8.89,'2024-02-16 13:15:49'),(49,678,393,27.96,'2024-02-17 12:49:22'),(50,755,175,19.28,'2024-02-18 11:54:15');
/*!40000 ALTER TABLE `datosplanta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'iot'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_DatosP` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_DatosP`(in op int,in id int, in humedad int, in luz int,in nivelagua int, in fecha datetime)
BEGIN
if (op = 1) then
if exists(select * from datosplanta where datoP_ID=id) then 
	update datosplanta set datoP_humedad=humedad, datoP_luzSolar=luz, datoP_nivelAgua=nivelagua where datoP_ID=id;
		select 0;
    else
		Insert into datosplanta (datoP_humedad, datoP_luzSolar, datoP_nivelAgua) values (humedad , luz, nivelagua);
		select 1;
end if;
end if;
if (op = 2) then
select * from datosplanta;
end if;
if (op = 3) then
if not(exists( select * from datosplanta where datoP_ID=id)) then 
		select 0;
    else
		delete from datosplanta where datoP_ID = id;
		select 1;
end if;
end if;
if (op = 4) then
SET lc_time_names = 'es_ES';
select datoP_ID, datoP_humedad,datoP_luzSolar,datoP_nivelAgua,concat(DATE_FORMAT(datoP_fecha, '%W %e de %M del %Y'),"*",time(datoP_fecha)) AS fecha_formateada from datosplanta order by datoP_fecha desc limit 1;
end if;
if (op = 5) then
SELECT *, time(datoP_fecha) FROM datosplanta where date(datoP_fecha) = fecha;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-20 19:03:00
