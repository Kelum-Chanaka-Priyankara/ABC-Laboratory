CREATE DATABASE  IF NOT EXISTS `abc_lab_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `abc_lab_db`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: abc_lab_db
-- ------------------------------------------------------
-- Server version	8.3.0

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
-- Table structure for table `appointments`
--

DROP TABLE IF EXISTS `appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointments` (
  `appointment_id` int NOT NULL,
  `registered_date` date NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `patient_id` int NOT NULL,
  `is_cancelled` tinyint NOT NULL DEFAULT '0',
  `appointment_status` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`appointment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointments`
--

LOCK TABLES `appointments` WRITE;
/*!40000 ALTER TABLE `appointments` DISABLE KEYS */;
INSERT INTO `appointments` VALUES (1,'2024-03-20','2024-03-20','14:30:00',1,0,1,0,NULL),(2,'2024-03-20','2024-03-20','10:30:00',1,0,1,0,NULL),(3,'2024-03-20','2024-03-20','08:30:00',3,0,1,0,NULL),(4,'2024-03-20','2024-03-20','12:45:00',4,0,1,0,NULL),(5,'2024-03-20','2024-03-20','09:15:00',5,0,1,0,NULL),(6,'2024-03-22','2024-03-23','14:00:00',0,0,1,1,NULL),(7,'2024-03-22','2024-03-25','13:30:00',1,0,0,0,NULL),(8,'2024-03-22','2024-03-25','13:30:00',1,0,0,0,NULL),(9,'2024-03-22','2024-03-25','13:30:00',1,0,0,0,NULL),(10,'2024-03-22','2024-03-25','13:30:00',1,0,0,0,NULL);
/*!40000 ALTER TABLE `appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `age` int NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `password` varchar(64) NOT NULL,
  `privilege` varchar(4) NOT NULL DEFAULT 'ptnt',
  `registered_date` date NOT NULL,
  `is_password_changed` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (1,'John ','Stephen','Male',30,'49 Featherstone Street, London.','johnstephen@mail.com','+44207123456','72b87eddf025e74c4fdcfbf480e73fae854e953017a758e6e9816a9121ae852b','ptnt','2024-03-20',1,0,NULL),(2,'Jenny','Piper','Female',28,'73 Holburn street,Aberdeen','jennypiper@mail.com','+44122421167','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','ptnt','2024-03-20',0,0,NULL),(3,'Dean','Harrison','Male',24,'St Loyes House, 20 Loyes House, Bedford.','deanharrison@mail.com','+44123430554','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','ptnt','2024-03-20',0,0,NULL),(4,'Tanner','Braxton','Male',21,'27 Colmore Row, Birmingham','tannerbraxton@mail.com','+44121685830','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','ptnt','2024-03-20',0,0,NULL),(5,'Breanna','Catelin','Female',32,'4 Parkers House, 48 Regent St, Cambridge.','breannacatelin@mail.com','+44127668665','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','ptnt','2024-03-20',0,0,NULL);
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int NOT NULL,
  `payment_date` date DEFAULT NULL,
  `appointment_id` int NOT NULL,
  `payment_method` varchar(6) DEFAULT NULL,
  `payment_status` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`payment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,'2024-03-15',1,'Cash',1,0,NULL),(2,'2024-03-17',2,'Card',1,0,NULL),(3,'2024-03-18',3,'Cash',1,0,NULL),(4,'2024-03-19',4,'Cheque',1,0,NULL),(5,'2024-03-20',5,'Other',1,0,NULL),(6,'2024-03-22',6,'',1,1,NULL),(7,NULL,7,NULL,0,0,NULL),(8,NULL,8,NULL,0,0,NULL),(9,NULL,9,NULL,0,0,NULL),(10,NULL,10,NULL,0,0,NULL);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `test_reports`
--

DROP TABLE IF EXISTS `test_reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `test_reports` (
  `test_report_id` int NOT NULL,
  `technician_id` int NOT NULL,
  `test_date` date DEFAULT NULL,
  `test_time` time DEFAULT NULL,
  `appointment_id` int NOT NULL,
  `test_id` int NOT NULL,
  `prescribed_by` varchar(50) NOT NULL DEFAULT 'Self Request',
  `report` varchar(100) NOT NULL DEFAULT 'Pending',
  `report_status` tinyint NOT NULL DEFAULT '0',
  `is_cancelled` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`test_report_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `test_reports`
--

LOCK TABLES `test_reports` WRITE;
/*!40000 ALTER TABLE `test_reports` DISABLE KEYS */;
INSERT INTO `test_reports` VALUES (1,6,'2024-03-22','10:00:00',1,3,'Dr. Frank jacob','Test Passed',1,0,0,NULL),(2,3,'2024-03-20','13:30:00',2,2,'Dr. Arthur Ernest','450\r\nLow',1,0,0,NULL),(3,5,'2024-03-20','14:30:00',3,1,'Dr. Harry Blake','20\r\nNormal',1,0,0,NULL),(4,6,'2024-03-20','14:50:00',4,4,'Dr. Mary Addison','15\r\nNormal',1,0,0,NULL),(5,6,'2024-03-20','14:55:00',5,5,'Dr. Ashley Wilfred','50\r\nNormal',1,0,0,NULL),(6,0,NULL,NULL,6,0,'Dr. Manula Subasinghe','Pending',0,0,1,NULL),(7,5,NULL,NULL,7,1,'Dr. Manula','Pending',0,0,0,NULL),(8,5,NULL,NULL,8,1,'Dr. Manula','Pending',0,0,0,NULL),(9,5,NULL,NULL,9,1,'Dr. Manula','Pending',0,0,0,NULL),(10,5,NULL,NULL,10,1,'Dr. Manula','Pending',0,0,0,NULL);
/*!40000 ALTER TABLE `test_reports` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tests`
--

DROP TABLE IF EXISTS `tests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tests` (
  `test_id` int NOT NULL,
  `test_name` varchar(50) NOT NULL,
  `unit` varchar(20) NOT NULL,
  `reference_levels` varchar(100) NOT NULL,
  `charges` decimal(8,2) NOT NULL,
  `technician_id` int NOT NULL,
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tests`
--

LOCK TABLES `tests` WRITE;
/*!40000 ALTER TABLE `tests` DISABLE KEYS */;
INSERT INTO `tests` VALUES (1,'Bicarbonate (carbon dioxide content)','mEq/L','18–23',100.00,5,0,NULL),(2,'CD4 cell count','cells/μL','500–1500',250.00,3,0,NULL),(3,'Fasting Blood Glucose','mg/dL','70–110',300.00,6,0,NULL),(4,'Hemoglobin','g/dL','Male: 13–18\r\nFemale: 12–16',500.00,6,0,NULL),(5,'High-density lipoprotein (HDL)','mg/dL','30–70',800.00,6,0,NULL),(6,'Low-density lipoprotein (LDL)','mg/dL','60',800.00,6,0,NULL),(7,'Triglycerides','mg/dL','40–200',800.00,6,1,NULL),(8,'new Test','','No Reference levels are expected',100.00,5,0,NULL),(9,'new Test','','No Reference levels are expected',100.00,5,0,NULL),(10,'new Test','','No Reference levels are expected',100.00,5,0,NULL);
/*!40000 ALTER TABLE `tests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `gender` varchar(6) NOT NULL,
  `address` varchar(100) NOT NULL,
  `email` varchar(50) NOT NULL,
  `phone_number` varchar(12) NOT NULL,
  `password` varchar(64) NOT NULL,
  `privilege` varchar(4) NOT NULL,
  `registered_date` date NOT NULL,
  `is_password_changed` tinyint NOT NULL DEFAULT '0',
  `is_deleted` tinyint NOT NULL DEFAULT '0',
  `deleted_by` int DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Kelum','Priyankara','Male','Mee oya road, Kaladiya, Puttalam.','kelum.chanaka@gmail.com','+94719476645','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','admn','2024-03-20',1,0,NULL),(2,'Wesley','Emerson','Male','78 Norgate Street, Chester.','wesleyemerson@mail.com','+44124434353','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','fdsk','2024-03-20',1,0,NULL),(3,'Jemma','Robinson','Female','29 Horsefair, Banbury','jemmarobinson@mail.com','+44129527773','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','tcnc','2024-03-20',0,0,NULL),(4,'Hazel','Evans','Female','Maddison House, 226 High St, Croydon','hazel.evans@mail.com','+44208649977','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','fdsk','2024-03-20',1,0,NULL),(5,'Archie','Remington','Male','196, Rose Street, Edinburgh','archieremington@mail.com','+44131220199','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','tcnc','2024-03-20',1,1,NULL),(6,'Edith','White','Female','1 Imperial court, Exchange Street East, Liverpool','edithwhite@mail.com','+44151236550','e06b1afd38ddb78b3f87842adc69bd243286f24c7b4ba9c94aaedf366fa064e6','tcnc','2024-03-20',1,0,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'abc_lab_db'
--

--
-- Dumping routines for database 'abc_lab_db'
--
/*!50003 DROP FUNCTION IF EXISTS `get_max_id` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_max_id`(table_name VARCHAR(50), column_name VARCHAR(50)) RETURNS int
    READS SQL DATA
    DETERMINISTIC
BEGIN
DECLARE max_value INT;

    SET @sql = CONCAT('SELECT COALESCE(MAX(CAST(`', column_name, '` AS UNSIGNED)), 0) FROM ', table_name);
    SET max_value = 0;

    CASE
		-- Appointments Table
        WHEN column_name = 'appointment_id' THEN
            SELECT COALESCE(MAX(CAST(`appointment_id` AS UNSIGNED)), 0) INTO max_value FROM appointments;
		-- Tests Table
        WHEN column_name = 'patient_id' THEN
            SELECT COALESCE(MAX(CAST(`patient_id` AS UNSIGNED)), 0) INTO max_value FROM patients;
		-- Tests Table
        WHEN column_name = 'payment_id' THEN
            SELECT COALESCE(MAX(CAST(`payment_id` AS UNSIGNED)), 0) INTO max_value FROM payments;
		-- Tests Table
        WHEN column_name = 'test_report_id' THEN
            SELECT COALESCE(MAX(CAST(`test_report_id` AS UNSIGNED)), 0) INTO max_value FROM test_reports;
		-- Tests Table
        WHEN column_name = 'test_id' THEN
            SELECT COALESCE(MAX(CAST(`test_id` AS UNSIGNED)), 0) INTO max_value FROM tests;
		-- Tests Table
        WHEN column_name = 'user_id' THEN
            SELECT COALESCE(MAX(CAST(`user_id` AS UNSIGNED)), 0) INTO max_value FROM users;
            
        -- Add more cases for other column names if needed
    END CASE;

    RETURN max_value;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_appointment`(
IN appointment_date_in DATE,
IN appointment_time_in TIME, 
IN patient_id_in INT,
IN technician_id_in INT,
IN test_id_in INT,
IN prescribed_by_in VARCHAR(50)
)
BEGIN
    DECLARE appointment_id_in INT;
    DECLARE test_report_id_in INT;
    DECLARE payment_id_in INT;
    
    SET appointment_id_in := (SELECT get_max_id('appointments', 'appointment_id') +1);
	SET test_report_id_in := (SELECT get_max_id('test_reports', 'test_report_id') +1);
	SET payment_id_in := (SELECT get_max_id('payments', 'payment_id') +1);
    
    -- Adding Records into Appointments table
	INSERT INTO appointments (appointment_id,registered_date,appointment_date,appointment_time,patient_id) 
    VALUES(appointment_id_in,CURRENT_DATE,appointment_date_in,appointment_time_in,patient_id_in);
    
	-- Adding Records into Test Reports table
    INSERT INTO test_reports (test_report_id, technician_id, appointment_id, test_id,prescribed_by)
	VALUES (test_report_id_in, technician_id_in, appointment_id_in, test_id_in,prescribed_by_in);
        
    -- Adding Records into Payments table
    INSERT INTO payments (payment_id,appointment_id) 
    VALUES(payment_id_in, appointment_id_in);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_patient`(
IN first_name_in varchar(50), 
IN last_name_in varchar(50), 
IN gender_in varchar(6),
IN age_in INT, 
IN address_in varchar(100), 
IN email_in varchar(50),
IN phone_number_in varchar(12),
IN password_in varchar(64)
)
BEGIN
	DECLARE patient_id_in INT;
	SET patient_id_in := (SELECT get_max_id('patients', 'patient_id') +1);

	INSERT INTO patients (patient_id,first_name,last_name,gender,age,address,email,phone_number,password,registered_date) 
    VALUES(patient_id_in,first_name_in,last_name_in,gender_in,age_in,address_in,email_in,phone_number_in,password_in,current_date());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_test`(
IN test_name_in varchar(50), 
IN unit_in VARCHAR(20),
IN reference_levels_in varchar(100),
IN charges_in DECIMAL(8,2),
IN technician_id_in INT
)
BEGIN
DECLARE test_id_in INT;
SET test_id_in := (SELECT get_max_id('tests', 'test_id') +1);

INSERT INTO tests(test_id,test_name,unit,reference_levels,charges,technician_id) 
VALUES (test_id_in,test_name_in,unit_in,reference_levels_in,charges_in,technician_id_in);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `add_user`(
IN first_name_in varchar(50),
IN last_name_in varchar(50),
IN gender_in varchar(6),
IN address_in varchar(100),
IN email_in varchar(50),
IN phone_number_in varchar(12),
IN password_in varchar(64),
IN privilege_in varchar(4)
)
BEGIN
DECLARE user_id_in INT;
SET user_id_in := (SELECT get_max_id('users', 'user_id') +1);

INSERT INTO users(user_id,first_name,last_name,gender,address,email,phone_number,password,privilege,registered_date) 
VALUES(user_id_in, first_name_in,last_name_in,gender_in,address_in,email_in,phone_number_in,password_in,privilege_in,current_date());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `change_password` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `change_password`(
    IN table_name_in VARCHAR(20),
    IN column_name_in VARCHAR(10),
    IN user_id_in INT,
    IN old_password_in VARCHAR(64),
    IN new_password_in VARCHAR(64),
    OUT rows_affected INT
)
BEGIN
    SET @sql = CONCAT(
        'UPDATE ', table_name_in, 
        ' SET password = "', new_password_in, '"',
        ', is_password_changed = 1',
        ' WHERE ', column_name_in, ' = ', user_id_in,
        ' AND password = "', old_password_in, '"');

    PREPARE stmt FROM @sql;
    EXECUTE stmt;
    SET rows_affected = ROW_COUNT();
    DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_appointment`(
IN appointment_id_in INT
)
BEGIN
	-- Deleting Records from Appointments Table
	UPDATE 
		appointments
	SET
		is_deleted = true
	WHERE
		appointment_id = appointment_id_in;
    
    -- Deleting Records from Test Reports Table
	UPDATE 
		test_reports
	SET
		is_deleted = true
	WHERE
		appointment_id = appointment_id_in;
        
	-- Deleting Records from Payments Table
	UPDATE 
		payments
	SET
		is_deleted = true
	WHERE
		appointment_id = appointment_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_patient`(
IN patient_id_in INT
)
BEGIN
UPDATE 
		patients
	SET
		is_deleted = true
	WHERE
		patient_id = patient_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_test`(
IN test_id_in INT
)
BEGIN
UPDATE 
		tests
	SET
		is_deleted = true
	WHERE
		test_id = test_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_user`(
IN user_id_in INT
)
BEGIN
UPDATE 
		users
	SET
		is_deleted = true
	WHERE
		user_id = user_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appointment`(
IN appointment_id_in INT
)
BEGIN
SELECT
    a.appointment_id,
    p.patient_id,
    t.test_id,
    u.user_id,
    a.appointment_date,
	a.appointment_time,
    a.is_cancelled,
    tr.prescribed_by
FROM
    appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    JOIN test_reports tr ON a.appointment_id = tr.appointment_id
    JOIN tests t ON tr.test_id = t.test_id
    JOIN users u ON tr.technician_id = u.user_id
WHERE 
	a.appointment_id = appointment_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_appointments`()
BEGIN 
SELECT
    a.appointment_id,
    CONCAT(p.first_name,' ',p.last_name) AS patient_name,
    t.test_name,
    CONCAT(u.first_name,' ',u.last_name) AS technician_name,
    a.appointment_date,
	a.appointment_time,
    IF(a.is_cancelled = 1, 'Cancelled', 'Active') AS cancelled_status
FROM
    appointments a
    JOIN patients p ON a.patient_id = p.patient_id
    JOIN test_reports tr ON a.appointment_id = tr.appointment_id
    JOIN tests t ON tr.test_id = t.test_id
    JOIN users u ON tr.technician_id = u.user_id
WHERE
	a.is_deleted = false;
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient`(
IN patient_id_in int
)
BEGIN
SELECT 
	patient_id,
    first_name, 
	last_name,
	gender,
	age,
	address,
	email,
	phone_number
FROM
	patients
WHERE
	patient_id = patient_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patients` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patients`()
BEGIN
SELECT 
	patient_id,
    first_name,
    last_name,
    gender,
    age,
    address,
    email,
    phone_number,
    IF(is_password_changed = 1, 'Modified', 'Default') AS password_status
    
FROM 
	patients
WHERE
	is_deleted = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patients_selection_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patients_selection_list`()
BEGIN
SELECT 
	patient_id, 
    first_name,
    last_name
FROM 
	patients
WHERE 
	is_deleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patient_printable_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient_printable_report`(
IN appointment_id_in int
)
BEGIN
SELECT 
		-- Patient Section
		CONCAT(P.first_name,' ',P.last_name) AS patient_name,
        P.gender,
        P.age,
        P.phone_number,
        -- Appointment Section 
        A.appointment_id,
		A.appointment_date,
		A.appointment_time,
		T.test_name,
        TR.prescribed_by,
        -- Test Section
        TR.test_date,
        test_time,
        CONCAT(U.first_name,' ',U.last_name) AS technician_name,
        -- Test Report Section
        T.reference_levels,
        T.unit,
		IF(TR.report_status = 1,TR.report,'Pending')AS report
		
	FROM 
		patients P 
		JOIN appointments A 
		ON P.patient_id = A.patient_id
		
		JOIN test_reports TR
		ON A.appointment_id = TR.appointment_id
		
		JOIN tests T
		ON TR.test_id = T.test_id

		JOIN users U
        ON U.user_id = TR.technician_id
	WHERE 
		A. appointment_status = true
		AND
		A.appointment_id = appointment_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_patient_test_reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_patient_test_reports`(
IN patient_id_in INT
)
BEGIN
	SELECT 
		A.appointment_id,
		A.appointment_date,
		A.appointment_time,
		T.test_name,
		IF(TR.report_status = 1,TR.report,'Pending')AS report
		
	FROM 
		patients P 
		JOIN appointments A 
		ON P.patient_id = A.patient_id
		
		JOIN test_reports TR
		ON A.appointment_id = TR.appointment_id
		
		JOIN tests T
		ON TR.test_id = T.test_id
		
		JOIN payments PY
		ON A.appointment_id = PY.appointment_id
	WHERE 
		A. appointment_status = true
		AND
		PY.payment_status = true
		AND
		P.patient_id = patient_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_payment`(
IN payment_id_in INT
)
BEGIN
SELECT 
	P.payment_id,
    P.appointment_id,
    T.test_name,
    T.charges,
    P.payment_method,
    P.payment_status,
    P.payment_date,
    PT.first_name,
    PT.last_name,
    PT.gender,
    PT.address,
    PT.email,
	PT.phone_number
FROM 
	payments p 
    JOIN appointments A 
    ON p.appointment_id=A.appointment_id 
    JOIN test_reports Tr 
    ON Tr.appointment_id = A.appointment_id
    JOIN tests T 
    ON Tr.test_id=T.test_id
    JOIN patients PT
    ON A.patient_id = PT.patient_id
WHERE
	P.is_deleted = false
    AND 
    P.payment_id = payment_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_payments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_payments`()
BEGIN
SELECT 
	P.payment_id,
    P.appointment_id,
    T.test_name,
    T.charges,
    P.payment_method,
    IF(payment_status = 1, 'Paid', 'Not Paid') AS payment_status

FROM 
	payments p 
    JOIN appointments A ON 
    p.appointment_id=A.appointment_id 
    JOIN test_reports Tr ON 
    Tr.appointment_id = A.appointment_id
    JOIN tests T ON Tr.test_id=T.test_id
WHERE
	P.is_deleted = false
    AND 
    P.payment_status = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_daily_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_daily_appointments`()
BEGIN
SELECT 
    COUNT(A.appointment_id) AS appointments_today
FROM 
    appointments A
WHERE
    is_deleted = false
    AND 
    DATE_FORMAT(A.appointment_date, '%Y-%m-%d') = CURRENT_DATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_daily_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_daily_customers`()
BEGIN
SELECT 
    COUNT(P.patient_id) AS customers_today
FROM 
    patients P
WHERE
    P.is_deleted = false
    AND 
    DATE_FORMAT(P.registered_date, '%Y-%m-%d') = CURRENT_DATE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_daily_income_by_payment_method` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_daily_income_by_payment_method`()
BEGIN
SELECT 
	P.payment_method,
    SUM(T.charges) AS income
FROM 
	payments p 
    JOIN appointments A ON 
    p.appointment_id=A.appointment_id 
    JOIN test_reports Tr ON 
    Tr.appointment_id = A.appointment_id
    JOIN tests T ON Tr.test_id=T.test_id
WHERE
	P.is_deleted = false
    AND 
    P.payment_date = current_date()
    AND
    P.payment_status = true
GROUP BY
	P.payment_method;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_daily_popular_tests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_daily_popular_tests`()
BEGIN
SELECT 
	T.test_name,
    COUNT(A.appointment_id) AS count
FROM
	appointments A JOIN test_reports TR 
    ON A.appointment_id = TR.appointment_id
    JOIN tests T
    ON TR.test_id = T.test_id
WHERE
	TR.report_status = true
    AND
	A.appointment_date = current_date()
GROUP BY
	T.test_name;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_daily_progress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_daily_progress`()
BEGIN
	SELECT 
		COUNT(P.appointment_id) AS completed_appointments,
		COALESCE(SUM(T.charges), 0) AS income
	FROM 
		payments P
		JOIN appointments A ON 
		P.appointment_id=A.appointment_id 
		JOIN test_reports Tr ON 
		Tr.appointment_id = A.appointment_id
		JOIN tests T ON Tr.test_id=T.test_id
	WHERE
		P.is_deleted = false
		AND 
		P.payment_date = current_date()
		AND
		P.payment_status = true;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_daily_tests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_daily_tests`()
BEGIN
	SELECT
		COUNT(T.test_id) AS tests_today
	FROM
		test_reports T JOIN appointments A 
        ON
        T.appointment_id = A.appointment_id
	WHERE
		T.report_status = true
        AND
        A.appointment_date = current_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_last_week_progress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_last_week_progress`()
BEGIN
	SELECT 
		P.payment_date,
		SUM(T.charges) AS income
	FROM 
		payments p 
		JOIN appointments A ON 
		p.appointment_id=A.appointment_id 
		JOIN test_reports Tr ON 
		Tr.appointment_id = A.appointment_id
		JOIN tests T ON Tr.test_id=T.test_id
	WHERE
		P.is_deleted = false
		AND 
		P.payment_date >= CURDATE() - INTERVAL WEEKDAY(CURDATE()) + 1 DAY - INTERVAL 1 WEEK
		AND P.payment_date < CURDATE() - INTERVAL WEEKDAY(CURDATE()) + 1 DAY
		AND
		P.payment_status = true
	GROUP BY
		P.payment_date
	ORDER BY
		P.payment_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_latest_appointments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_latest_appointments`()
BEGIN
SELECT 
	A.appointment_date,	
	A.appointment_time,	
    CONCAT(U.first_name,' ',U.last_name) AS technician_name,
	T.test_name
FROM 
	appointments A JOIN test_reports Tr
    ON
    A.appointment_id = Tr.appointment_id
    JOIN tests T 
    ON T.test_id = Tr.test_id
    JOIN users U
    ON U.user_id = T.technician_id
ORDER BY A.appointment_id DESC
LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_latest_payments` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_latest_payments`()
BEGIN
SELECT 
	P.payment_date,
    T.charges,
    P.payment_method
FROM 
	payments p 
    JOIN appointments A ON 
    p.appointment_id=A.appointment_id 
    JOIN test_reports Tr ON 
    Tr.appointment_id = A.appointment_id
    JOIN tests T ON Tr.test_id=T.test_id
WHERE
	P.is_deleted = false
    AND 
    P.payment_status = true
ORDER BY P.payment_id DESC
LIMIT 5;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_total_progress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_total_progress`()
BEGIN
SELECT 
		P.payment_date,
		COALESCE(SUM(T.charges), 0) AS income
	FROM 
		payments P
		JOIN appointments A ON 
		P.appointment_id=A.appointment_id 
		JOIN test_reports Tr ON 
		Tr.appointment_id = A.appointment_id
		JOIN tests T ON Tr.test_id=T.test_id
	WHERE
		P.is_deleted = false
		AND
		P.payment_status = true
	GROUP BY
		P.payment_date
	ORDER  BY 
		P.payment_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_report_weekly_progress` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_report_weekly_progress`()
BEGIN
	SELECT 
		P.payment_date,
		SUM(T.charges) AS income
	FROM 
		payments p 
		JOIN appointments A ON 
		p.appointment_id=A.appointment_id 
		JOIN test_reports Tr ON 
		Tr.appointment_id = A.appointment_id
		JOIN tests T ON Tr.test_id=T.test_id
	WHERE
		P.is_deleted = false
		AND 
		P.payment_date >= CURDATE() - INTERVAL 6 DAY
		AND
		P.payment_status = true
	GROUP BY
		P.payment_date
	ORDER BY
		P.payment_date;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_technicians_selection_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_technicians_selection_list`()
BEGIN
SELECT 
	user_id, 
	first_name, 
	last_name
FROM 
	users
WHERE
	privilege = 'tcnc' 
    &&
    is_deleted = 0;
	
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_technician_test_reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_technician_test_reports`(
IN user_id_in INT
)
BEGIN
	SELECT
		A.appointment_id,
		CONCAT(P.first_name,' ',P.last_name) AS patient_name,
        P.gender,
        P.age,
		A.appointment_date,
		A.appointment_time,
		T.test_name,
        T.reference_levels,
        T.unit,
		IF(TR.report_status = 1,TR.report,'Pending')AS report,
        TR.test_report_id
		
	FROM 
		patients P 
		JOIN appointments A 
		ON P.patient_id = A.patient_id
		
		JOIN test_reports TR
		ON A.appointment_id = TR.appointment_id
		
		JOIN tests T
		ON TR.test_id = T.test_id

		JOIN users U
        ON U.user_id = TR.technician_id
	WHERE 
        TR.report_status = false
		AND
		U.user_id = user_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test`(
IN test_id_in INT
)
BEGIN
SELECT 
	t.test_id, 
    t.test_name, 
    t.unit,
    t.reference_levels, 
    t.charges, 
    u.user_id AS technician_id
FROM 
	tests t JOIN users U
WHERE
	t.test_id = test_id_in
	AND
    t.technician_id = U.user_id 
    AND 
    t.is_deleted=false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tests` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tests`()
begin
SELECT 
	t.test_id, 
    t.test_name, 
    t.unit,
    t.reference_levels, 
    t.charges, 
    CONCAT(u.first_name,' ', u.last_name) AS technician_name
FROM 
	tests t JOIN users U
WHERE
	t.technician_id = U.user_id 
    AND 
    t.is_deleted=false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_tests_selection_list` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_tests_selection_list`(
IN technician_id_in INT
)
BEGIN
SELECT 
	test_id,
	test_name
FROM 
	tests
WHERE 
	technician_id = technician_id_in
    &&
    is_deleted = 0;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_test_reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = cp850 */ ;
/*!50003 SET character_set_results = cp850 */ ;
/*!50003 SET collation_connection  = cp850_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_test_reports`()
begin
select * from test_reports;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_user`(
IN user_id_in INT
)
BEGIN
	SELECT 
		user_id,
		first_name, 
		last_name,
		gender,
		address,
		email,
		phone_number,
		privilege
    FROM 
        users
    WHERE
        user_id = user_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_users` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_users`()
BEGIN
    SELECT 
        user_id,
        first_name,
        last_name,
        gender,
        address,
        email,
        phone_number,
        CASE privilege
            WHEN 'admn' THEN 'Administrator'
            WHEN 'fdsk' THEN 'Front Desk Officer'
            WHEN 'tcnc' THEN 'Medical Technician'
            ELSE 'Unknown'
        END AS role
    FROM 
        users
    WHERE
        is_deleted = false;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sign_in` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sign_in`(
IN username_in VARCHAR(50), 
IN password_in VARCHAR(64))
BEGIN

(SELECT patient_id AS user_id,privilege, first_name, last_name,is_password_changed FROM patients WHERE (email = username_in OR phone_number = username_in ) AND password = password_in ) 
UNION 
(SELECT user_id,privilege, first_name, last_name,is_password_changed FROM users WHERE (email = username_in OR phone_number = username_in ) AND password = password_in );

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_appointment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_appointment`(
IN appointment_id_in INT, 
IN patient_id_in INT,
IN test_id_in INT,
IN technician_id_in INT,
IN appointment_date_in DATE,
IN appointment_time_in TIME, 
IN is_cancelled_in TINYINT,
IN prescribed_by_in VARCHAR(50)
)
BEGIN
	-- Updating Records in Appointments Table
	UPDATE 
		appointments 
	SET 
		appointment_date = appointment_date_in,
		appointment_time = appointment_time_in,
		patient_id = patient_id_in,
		is_cancelled = is_cancelled_in
	WHERE
		appointment_id = appointment_id_in;
        
        
	-- Updating Records in Test Reports Table
	UPDATE 
		test_reports 
	SET 
		technician_id = technician_id_in,
		test_id = test_id_in,
		prescribed_by = prescribed_by_in
	WHERE
		appointment_id = appointment_id_in;  

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_patient` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_patient`(
IN patient_id_in INT,
IN first_name_in VARCHAR(50), 
IN last_name_in VARCHAR(50), 
IN gender_in VARCHAR(6),
IN age_in INT, 
IN address_in VARCHAR(100), 
IN email_in VARCHAR(50),
IN phone_number_in VARCHAR(12)
)
BEGIN
UPDATE 
	patients
SET
	first_name = first_name_in,
	last_name = last_name_in,
	gender = gender_in,
	age = age_in,
	address = address_in,
	email = email_in,
	phone_number = phone_number_in
WHERE
	patient_id = patient_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_payment`(
IN payment_id_in INT,
IN payment_method_in VARCHAR(6),
IN payment_status_in TINYINT
)
BEGIN
DECLARE appointment_id_var INT;

    -- Get the appointment_id associated with the payment_id
    SELECT appointment_id INTO appointment_id_var
    FROM payments
    WHERE payment_id = payment_id_in;

    -- Update the payment record
    UPDATE payments
    SET
        payment_date = CURRENT_DATE(),
        payment_method = payment_method_in,
        payment_status = payment_status_in
    WHERE
        payment_id = payment_id_in;

    -- Update the appointment status if payment_status_in is true
    IF payment_status_in = 1 THEN
        UPDATE appointments
        SET
            appointment_status = 1
        WHERE
            appointment_id = appointment_id_var;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_technician_test_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_technician_test_report`(
IN test_report_id_in INT,
IN test_date_in DATE,
IN test_time_in TIME,
IN report_in VARCHAR(100)
)
BEGIN
	UPDATE 
		test_reports
	SET
		test_date = test_date_in,
		test_time = test_time_in,
		report = report_in,
		report_status = true
    WHERE
		test_report_id = test_report_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_test` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_test`(
IN test_id_in INT,
IN test_name_in VARCHAR(50),
IN unit_in VARCHAR(20), 
IN reference_levels_in VARCHAR(100),
in charges_in DECIMAL(8,2),
IN technician_id_in INT
)
BEGIN
UPDATE 
	tests
SET
	test_name = test_name_in,
	reference_levels = reference_levels_in,
    unit = unit_in,
	charges = charges_in,
    technician_id = technician_id_in
WHERE
	test_id = test_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_test_reports` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_test_reports`(
IN test_report_id_in INT,
IN technician_id_in INT, 
IN test_time_in TIME, 
IN appointment_id_in INT, 
IN test_id_in INT, 
IN report_in VARCHAR(100)
)
BEGIN
UPDATE 
	test_reports
SET
	technician_id =technician_id_in,
	test_time = test_time_in, 
	appointment_id = appointment_id_in, 
	test_id = test_id_in,
	report =report_in
WHERE
	test_report_id = test_report_id_in;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_user`(
IN user_id_in INT,
IN first_name_in VARCHAR(50),
IN last_name_in VARCHAR(50),
IN gender_in VARCHAR(6),
IN address_in VARCHAR(100),
IN email_in VARCHAR(50),
IN phone_number_in VARCHAR(12),
IN privilege_in VARCHAR(4)
)
BEGIN
UPDATE 
	users
SET
	first_name = first_name_in,
	last_name = last_name_in,
	gender = gender_in,
	address = address_in,
	email = email_in,
	phone_number = phone_number_in,
	privilege = privilege_in
WHERE
	user_id = user_id_in;
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

-- Dump completed on 2024-03-26 12:10:38
