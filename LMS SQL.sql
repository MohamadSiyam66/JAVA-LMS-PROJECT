CREATE DATABASE  IF NOT EXISTS `lms-java` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lms-java`;
-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lms-java
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `Ad_id` int NOT NULL AUTO_INCREMENT,
  `Pno` int DEFAULT NULL,
  `Password` varchar(100) NOT NULL,
  `Fname` varchar(100) DEFAULT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `DOB` datetime DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`Ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `attendance` (
  `Attend_id` int NOT NULL,
  `Lec_id` int DEFAULT NULL,
  `Std_id` varchar(45) DEFAULT NULL,
  `Course_code` varchar(45) DEFAULT NULL,
  `Status` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`Attend_id`),
  KEY `Course_code` (`Course_code`),
  KEY `Lec_id` (`Lec_id`),
  KEY `Std_id` (`Std_id`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`Course_code`) REFERENCES `course` (`Course_code`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`Lec_id`) REFERENCES `lecturer` (`Lec_id`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`Std_id`) REFERENCES `student` (`Std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `Lec_id` int DEFAULT NULL,
  `Course_code` varchar(45) NOT NULL,
  `Course_name` varchar(45) DEFAULT NULL,
  `Ad_id` int DEFAULT NULL,
  PRIMARY KEY (`Course_code`),
  KEY `Ad_id` (`Ad_id`),
  KEY `Lec_id` (`Lec_id`),
  CONSTRAINT `course_ibfk_1` FOREIGN KEY (`Ad_id`) REFERENCES `admin` (`Ad_id`),
  CONSTRAINT `course_ibfk_2` FOREIGN KEY (`Lec_id`) REFERENCES `lecturer` (`Lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exam`
--

DROP TABLE IF EXISTS `exam`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exam` (
  `Acadamic_year` int DEFAULT NULL,
  `Exam_no` int NOT NULL,
  `Course_name` varchar(45) DEFAULT NULL,
  `Course_code` varchar(45) DEFAULT NULL,
  `Std_id` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Exam_no`),
  KEY `Std_id` (`Std_id`),
  CONSTRAINT `exam_ibfk_1` FOREIGN KEY (`Std_id`) REFERENCES `student` (`Std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exam`
--

LOCK TABLES `exam` WRITE;
/*!40000 ALTER TABLE `exam` DISABLE KEYS */;
/*!40000 ALTER TABLE `exam` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lecturer` (
  `Lec_id` int NOT NULL,
  `Fname` varchar(100) NOT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Pno` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Lec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `Std_id` varchar(45) DEFAULT NULL,
  `Course_code` varchar(45) DEFAULT NULL,
  `Quizzes` int DEFAULT NULL,
  `Mid_term` int DEFAULT NULL,
  `Final_theory` int DEFAULT NULL,
  `Final_practical` int DEFAULT NULL,
  `Course_name` varchar(45) DEFAULT NULL,
  `GPA` decimal(3,0) DEFAULT NULL,
  `Grade` varchar(45) DEFAULT NULL,
  `Lec_id` int DEFAULT NULL,
  KEY `Lec_id` (`Lec_id`),
  KEY `Std_id` (`Std_id`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`Lec_id`) REFERENCES `lecturer` (`Lec_id`),
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`Std_id`) REFERENCES `student` (`Std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical`
--

DROP TABLE IF EXISTS `medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medical` (
  `Med_id` int NOT NULL,
  `Date` datetime DEFAULT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `Std_id` varchar(45) DEFAULT NULL,
  `course_code` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Med_id`),
  KEY `Std_id` (`Std_id`),
  KEY `course_code` (`course_code`),
  CONSTRAINT `medical_ibfk_1` FOREIGN KEY (`Std_id`) REFERENCES `student` (`Std_id`),
  CONSTRAINT `medical_ibfk_2` FOREIGN KEY (`course_code`) REFERENCES `course` (`Course_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical`
--

LOCK TABLES `medical` WRITE;
/*!40000 ALTER TABLE `medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `Notice_no` int NOT NULL AUTO_INCREMENT,
  `Details` varchar(45) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Ad_id` int DEFAULT NULL,
  PRIMARY KEY (`Notice_no`),
  KEY `Ad_id` (`Ad_id`),
  CONSTRAINT `notice_ibfk_1` FOREIGN KEY (`Ad_id`) REFERENCES `admin` (`Ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `Std_id` varchar(45) NOT NULL,
  `Pno` int DEFAULT NULL,
  `Fname` varchar(100) NOT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Std_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technical officer`
--

DROP TABLE IF EXISTS `technical officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `technical officer` (
  `Tec_id` int NOT NULL,
  `Fname` varchar(100) NOT NULL,
  `Lname` varchar(100) DEFAULT NULL,
  `Sex` char(1) DEFAULT NULL,
  `Pno` int DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `DOB` date DEFAULT NULL,
  PRIMARY KEY (`Tec_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical officer`
--

LOCK TABLES `technical officer` WRITE;
/*!40000 ALTER TABLE `technical officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `technical officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `timetable`
--

DROP TABLE IF EXISTS `timetable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `timetable` (
  `TT_id` int NOT NULL AUTO_INCREMENT,
  `Date` datetime DEFAULT NULL,
  `Ad_id` int DEFAULT NULL,
  `Course_code` varchar(45) DEFAULT NULL,
  `Hall_no` varchar(45) DEFAULT NULL,
  `Course_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`TT_id`),
  KEY `Ad_id` (`Ad_id`),
  CONSTRAINT `timetable_ibfk_1` FOREIGN KEY (`Ad_id`) REFERENCES `admin` (`Ad_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `timetable`
--

LOCK TABLES `timetable` WRITE;
/*!40000 ALTER TABLE `timetable` DISABLE KEYS */;
/*!40000 ALTER TABLE `timetable` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-03-05 23:12:11
