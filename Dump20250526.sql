-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mymarketing
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `admin_name` varchar(100) NOT NULL,
  `admin_email` varchar(100) NOT NULL,
  `admin_password` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY `admin_email` (`admin_email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('admin','admin@gmail.com','adm','2025-05-24 22:06:51'),('manasa','manasa@gmail.com','man','2025-05-24 22:05:28');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `doctor_table`
--

DROP TABLE IF EXISTS `doctor_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `doctor_table` (
  `did` bigint unsigned NOT NULL AUTO_INCREMENT,
  `dname` varchar(100) DEFAULT NULL,
  `demailid` varchar(100) DEFAULT NULL,
  `daddress` varchar(255) DEFAULT NULL,
  `dpincode` varchar(10) DEFAULT NULL,
  `dspeciality` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`did`),
  UNIQUE KEY `did` (`did`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `doctor_table`
--

LOCK TABLES `doctor_table` WRITE;
/*!40000 ALTER TABLE `doctor_table` DISABLE KEYS */;
INSERT INTO `doctor_table` VALUES (2,'Dr. Ayesha Khan','ayesha.khan@healthcare.com','12 Marine Drive, Mumbai','400001','Cardiologist'),(3,'Dr. Rajeev Menon','rajeev.menon@medilife.org','88 Anna Nagar, Chennai','600045','Neurologist'),(4,'Dr. Priya Deshmukh','priya.deshmukh@medplus.in','56 FC Road, Pune','411007','Dermatologist');
/*!40000 ALTER TABLE `doctor_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employe_table`
--

DROP TABLE IF EXISTS `employe_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employe_table` (
  `eid` bigint unsigned NOT NULL AUTO_INCREMENT,
  `ename` varchar(100) NOT NULL,
  `eemailid` varchar(100) NOT NULL,
  `epassword` varchar(255) NOT NULL,
  `epincode` varchar(10) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `eid` (`eid`),
  UNIQUE KEY `eemailid` (`eemailid`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employe_table`
--

LOCK TABLES `employe_table` WRITE;
/*!40000 ALTER TABLE `employe_table` DISABLE KEYS */;
INSERT INTO `employe_table` VALUES (1,'sowmya','sowmya@gmail.com','$2b$12$L7T2P2O3qOsyesMh1XVdwe60qt.qNw7H4oJem9DHS.RJIAllJqrvm','56576','2025-05-24 13:40:29'),(2,'monika','monika@gmail.com','$2b$12$z9d7qO0Z2cb6Zb3TNyzOCu8IH7Bbm/2ck5pX..R42nUGhVRHE95DS','51476','2025-05-24 13:41:05'),(3,'farzana','farzana@gmail.com','$2b$12$NFnNOQh0hZyRzxd5t03BWuofc6s6iXCyotT.AC7A4HTbq2pyC8yIa','51479','2025-05-24 13:41:22'),(4,'keerthi','keerthi@gmail.com','$2b$12$RWXXy.IBmd8GigaeSP9.auDLU90zauHfOBifkQXjOTnaRooN/.ge2','45678','2025-05-24 14:23:06'),(5,'madhu','madhu@gmail.com','$2b$12$qyVHitd0oWcmHy.iVUUiSORK9TYA2eB9f6NaXciOZ9UJCqYls4qNS','34567','2025-05-24 16:51:02'),(8,'rani','rani@gmail.com','ran','45633','2025-05-25 17:56:24'),(10,'nandhu','nandhu@gmail.com','nan','45322','2025-05-25 17:59:36'),(17,'jhansi','jhansi@gmail.com','$2b$12$IA/Vd3VqF9lXY8JFUFrtpegtYIUHaSaO5i/OWbHnUHuPSQ1yKhyqe','45678','2025-05-26 07:15:42'),(21,'teja','teja@gmail.com','$2b$12$sHO/gp3x2wg5Zjdc64j/FO7xn9H036Yc0wBQf4vtWmLnj8sN3t5Cy','45690','2025-05-26 07:19:55'),(26,'mahesh','mahesh@gmail.com','$2b$12$7D8vHrATtrcEDfZyH28iJ.jVqBe90p04LPck.VUeSQPIvDGMbHbhi','34565','2025-05-26 07:29:00');
/*!40000 ALTER TABLE `employe_table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-26 15:36:22
