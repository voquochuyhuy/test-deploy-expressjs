CREATE DATABASE  IF NOT EXISTS `togetherbetter` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `togetherbetter`;
-- MySQL dump 10.13  Distrib 8.0.22, for Win64 (x86_64)
--
-- Host: db4free.net    Database: togetherbetter
-- ------------------------------------------------------
-- Server version	8.0.23

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
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `role` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('1','Ri','voquochuy798@gmail.com','admin','Master Administrator'),('2','MyQ','hungtran@gmail.com','admin','Admin'),('3','Evan','hungle@gmail.com','admin','Admin'),('4','Nic.H','nghianguyen@gmail.com','admin','Admin');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookmark`
--

DROP TABLE IF EXISTS `bookmark`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookmark` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `userID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `commentID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookmark`
--

LOCK TABLES `bookmark` WRITE;
/*!40000 ALTER TABLE `bookmark` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookmark` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `userID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `questionID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `audioURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `photoURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `votes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES ('1','1','1','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('10','2','5','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('2','1','2','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('3','1','3','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('4','1','4','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('5','1','5','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('6','2','1','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('7','2','2','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('8','2','3','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01'),('9','2','4','','','this is a comment','1','2020-12-26 00:00:01','2020-12-26 00:00:01');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `userID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES ('1dc7fa3c-f9b8-4ebe-b854-a4120c6adb66','YZzFWIuPmzNAAWXDAml19iOQb5n1','Login','2021-02-16 04:54:55'),('7120ac15-36a0-47a2-9371-7822dbbd5ca1','YZzFWIuPmzNAAWXDAml19iOQb5n1','Login','2021-02-16 04:55:52'),('847e38ba-bea3-47e7-85dd-b1fe9c322b5f','YZzFWIuPmzNAAWXDAml19iOQb5n1','Ask a new question','2021-02-17 03:57:37'),('9430d835-4afe-4833-a6f8-c0d0686cab06','kave6fyxPLfAI4zPksWFdOY9HYy1','Login','2021-01-27 01:34:54'),('a06625ed-1eaf-42fc-879c-9e19926a30ea','YZzFWIuPmzNAAWXDAml19iOQb5n1','Login','2021-02-16 05:01:38'),('a6344c6f-4fe5-43da-bbb8-cdb6df8714c1','YZzFWIuPmzNAAWXDAml19iOQb5n1','Ask a new question','2021-02-18 02:17:05'),('b0a27546-9b27-4e99-892b-4e329a9a5ce2','SUPFEuTfXwarwpm2tl65EBRaG4j2','Ask a new question','2021-02-18 02:09:36'),('b483c2d5-ff1d-45e7-b362-aab9ce6aee09','53KtHe72UUVHaqo5WdD2etAI7Vx2','Login','2021-01-27 01:35:20'),('bde34939-15c6-43e5-ba3b-0fa9862149c5','YZzFWIuPmzNAAWXDAml19iOQb5n1','Ask a new question','2021-02-18 02:04:58'),('c27c07b9-3ab7-4e8f-b0bb-6cb51c15a085','YZzFWIuPmzNAAWXDAml19iOQb5n1','Ask a new question','2021-02-18 02:02:11'),('cb96dcad-a65e-4205-a575-3e7bef617ecf','SUPFEuTfXwarwpm2tl65EBRaG4j2','Login','2021-01-16 04:17:25'),('ce0cf5f0-ea4f-418d-b12c-0ed12f5e5d77','SUPFEuTfXwarwpm2tl65EBRaG4j2','Ask a new question','2021-01-27 01:45:07'),('d46112c6-f6b2-414c-a56b-98fc35c732cb','YZzFWIuPmzNAAWXDAml19iOQb5n1','Ask a new question','2021-02-18 02:20:57'),('e9a6e6fc-d2c7-47a5-a19c-129d05a69333','YZzFWIuPmzNAAWXDAml19iOQb5n1','Login','2021-02-09 12:06:39');
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `senderID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `receiveID` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `isRead` tinyint(1) DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `Id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `userID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `additionalInfomation` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `audioURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `photoURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `questionType` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comments` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `featuredAnswer` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `votes` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  `updatedAt` datetime DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES ('0cmRp3YxGvNNfOocXfbq','YZzFWIuPmzNAAWXDAml19iOQb5n1','what-mean','en','cost an arm and a leg','undefined','','','what-mean','123','undefined','0','active','2021-02-17 03:57:37','2021-02-18 01:56:26'),('0Mvnn5gPL4smBFB15Ydq','MqQsxGIwLCZIMsCiDCzCTyuSheC3','what-mean','in','The first notice was taken of me was by a gentleman','','','','How','123','','','active','2021-02-16 02:26:56','2021-02-18 01:55:28'),('7ejOuAIOCAuscJcQiSKm','5BQ0Bel5d4R3QcImSyJe9mAkM6A3','free-question','English','Can someone tell me if the grammar is wrong in this sentence:“ I\'m that person who\'s noticed everything but acted like I didn\'t. ” I feel like it\'s wrong for some reason ...','','','','How','15 16','1 2','0','active','2021-01-27 09:52:33','2021-01-27 09:52:33'),('9TDnOUxZncXF9YJ3NFUp','SUPFEuTfXwarwpm2tl65EBRaG4j2','difference','en','strike and stroke','undefined','','','difference','','undefined','0','active','2021-02-18 02:09:37','2021-02-18 02:09:37'),('az237rAd34Cwb8PLBpcH','TnIjzNidIsRkjbXNfRQ627CzITv2','what-mean','English','top seed','','','','How','15 16','1 2','2','active','2021-01-27 10:05:13','2021-01-27 10:05:13'),('CmMvoIdalTxWxdbVIfYX','5BQ0Bel5d4R3QcImSyJe9mAkM6A3','sound-natural','English','I\'m good at making someone anger.','','','','How','15 16','1 2','0','active','2021-01-27 09:40:04','2021-01-27 09:40:04'),('cSHYKSklthQin5vprCha','SUPFEuTfXwarwpm2tl65EBRaG4j2','sound-natural','KO','종인 아 ... 진짜 수고 많았 어 ㅠㅠ 진짜 처음 부터 끝까지 다 레전드 다','','','','How','15 16','1 2','2','active','2021-01-27 10:07:18','2021-01-27 10:07:18'),('cVKBvchTQfy2b1WdV6Ck','YZzFWIuPmzNAAWXDAml19iOQb5n1','difference','en','fit and suit','undefined','','','difference','wVSnDQZpbrRSPGs1TUzi','undefined','0','active','2021-02-18 02:20:57','2021-02-18 02:22:04'),('DAKHyxexiGxTRaF2GfNm','SUPFEuTfXwarwpm2tl65EBRaG4j2','your-pronounce','English','marketplace','','','','How','15 16','1 2','0','active','2021-01-27 09:53:41','2021-01-27 09:53:41'),('DTKmkOjJknnKiyrLCgVA','UBiiykOYsdWdhfbgOXtMjyOaKw62','sound-natural','English','I don\'t know what to write ， so it took me sometime to write these.You can write whatever you want, daily persistence is the most important thing.You can express your ideas, sentences in daily life also work. You would feel the joy of mastering English one day. ','','','','How','15 16','1 2','0','active','2021-01-27 09:55:28','2021-01-27 09:55:28'),('f3ccMEqXda4fbnhjGGRB','53KtHe72UUVHaqo5WdD2etAI7Vx2','what-mean','English','setting me off','','','','How','15 16','1 2','0','active','2021-01-27 10:08:36','2021-01-27 10:08:36'),('FhFMaREH8LBMYmbOfZv3','Qhg31jnDKkhFeo9NIP9WBaUmmty1','sound-natural','English','Many children are jumping rope. They are jumping a long white rope together. Two people, a girl in the foreground on the right and a child in the background on the left, are rotating the rope.','','','','How','15 16','1 2','2','active','2021-01-27 09:56:44','2021-01-27 09:56:44'),('fiEthIJMb2xFqmpYC4OS','5BQ0Bel5d4R3QcImSyJe9mAkM6A3','how-say','English','','','','','How','15 16','1 2','1','active','2021-01-27 10:18:58','2021-01-27 10:18:58'),('GVSt00c9zJgL268O090W','SUPFEuTfXwarwpm2tl65EBRaG4j2','your-pronounce','English','It\'s hard working overtime after taking a few days off.','','','','How','15 16','1 2','2','active','2021-01-27 09:59:07','2021-01-27 09:59:07'),('iWYioj3UjaM4fcboBgSL','SUPFEuTfXwarwpm2tl65EBRaG4j2','how-say','English','what the fuck is that?','','','','How','15 16','1 2','0','active','2021-01-27 10:19:46','2021-01-27 10:19:46'),('JGahx9QJJZBRpUTc8T71','xrzgDfZSJgMLJfamgDZ7euy1slj2','how-say','English','country','','','','How','15 16','1 2','2','active','2021-01-27 10:00:00','2021-01-27 10:00:00'),('kBiJGRL4tO0kbTdvNWfx','TnIjzNidIsRkjbXNfRQ627CzITv2','my-pronounce','English','','','','','How','15 16','1 2','0','active','2021-01-27 10:20:39','2021-01-27 10:20:39'),('loi7p17JG3HYpMmrEldQ','SUPFEuTfXwarwpm2tl65EBRaG4j2','sound-natural','en','My teacher has us clean the classroom.','','https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/assets%2Faudio%2F7329e23b-92fc-4aa7-906d-7919684d233b?alt=media&token=42cad5cb-9072-48d5-a97b-94286cacb982','','How','','','4WAZvtNyeGRgrUejdWkMFqa0GSM2','active','2021-02-16 06:00:52','2021-02-16 06:00:52'),('nO4GqJ4OKrdq8aeLoKvK','Sjt6dJ4v0XafOonc8eMYILlsDZH3','what-mean','vi','Chị em','','','','How','GvairkZ0pSLkbbbyxfhb','','','active','2021-02-16 06:12:18','2021-02-16 06:12:18'),('nXpQ05JhiVtFprATTHhQ','5HHJ6fA1aieFKWXFGpsFIjuLIx42','how-say','vi',' I have high expectations for this.','','','','How','LzkVJWb8jHBBQdkY8eQF','','','active','2021-02-16 06:22:19','2021-02-16 06:22:19'),('R6b1AbzZdRhFkmPHLnaU','TnIjzNidIsRkjbXNfRQ627CzITv2','sound-natural','English','I\'m coming to the Ueno park to enjoy autumn colored leaves, but it\'s so dark that I can\'t see the color of trees well.','','','','How','15 16','1 2','2','active','2021-01-27 10:00:59','2021-01-27 10:00:59'),('Twj7tedExU6wfopyI7rX','VhApuAfHD4cOy0V5kfzdkqNc7Ai2','example','English','Hello','','','','How','15 16','1 2','1','active','2021-01-27 10:02:02','2021-01-27 10:02:02'),('VbXI3wmrRjAstmdQz4q4','YZzFWIuPmzNAAWXDAml19iOQb5n1','what-mean','en','could you tell me the reason why people in England have steering in left hand','undefined','','','what-mean','','undefined','0','active','2021-02-18 02:17:06','2021-02-18 02:17:06'),('vC6cffI4dg7OpWynWA23','hpOXQcaJHIhggzlVzt4eOxlwTCB2','how-say','en',' 今の良かったよ！','','','','How','qCYSJzzL3yHmxCDeAK9e cQRzfAPxhFX3DlELjnHs','','kave6fyxPLfAI4zPksWFdOY9HYy1','active','2021-02-16 06:27:38','2021-02-16 06:27:38'),('VE6wHAXurpoU6oUwyHuc','SUPFEuTfXwarwpm2tl65EBRaG4j2','what-mean','English','keep me on my toes','','','','How','15 16','1 2','1','active','2021-01-27 10:03:22','2021-01-27 10:03:22'),('wJdw6TDoeOuXavG7B9Nj','oPaXeCbRDOQDAzkndaSTXzgM2Dj1','your-pronounce','en','Hi','','https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/assets%2Faudio%2Fb0962ff9-f6e0-4b92-9229-6fe96447902c?alt=media&token=f06c1ace-0401-4f9d-b98d-95aa7200818c','','How','','','','active','2021-02-16 06:29:57','2021-02-16 06:29:57'),('x9AR4qI9cP35kmI3BNxd','SUPFEuTfXwarwpm2tl65EBRaG4j2','your-pronounce','en','','undefined','https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/assets%2Faudio%2Fc95fdb29-b6ba-4284-9a78-401d5a5a9591.mp3?alt=media&token=bc847a10-353a-45e2-b8b0-77587b4eaa7a','','your-pronounce','','undefined','0','active','2021-01-27 01:45:07','2021-01-27 01:45:07'),('y975s60karzEZXqhA8o7','SUPFEuTfXwarwpm2tl65EBRaG4j2','your-pronounce','ja','レッスンを受ける .','','','','How','','','','active','2021-02-16 07:01:11','2021-02-16 07:01:11'),('zOeGhWTXXVp7GZNFAKVg','TnIjzNidIsRkjbXNfRQ627CzITv2','how-say','en','동시에','','','','How','5BNjpyjiewHGbYgCM0CM','','5BQ0Bel5d4R3QcImSyJe9mAkM6A3','active','2021-02-16 07:02:27','2021-02-16 07:02:27');
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `report`
--

DROP TABLE IF EXISTS `report`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `senderID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `targetID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `targetType` varchar(256) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report`
--

LOCK TABLES `report` WRITE;
/*!40000 ALTER TABLE `report` DISABLE KEYS */;
INSERT INTO `report` VALUES ('6672fd43-ba1d-44aa-a035-a42adfe10ba9','YZzFWIuPmzNAAWXDAml19iOQb5n1','wJdw6TDoeOuXavG7B9Nj','question','Inappropriate listings message/category','123','2021-02-09 12:08:35'),('b0ec2708-9d86-4362-baf0-9e2709098d7c','YZzFWIuPmzNAAWXDAml19iOQb5n1','0Mvnn5gPL4smBFB15Ydq','question','Rude or vulgar','123','2021-01-27 01:16:53'),('b0fc6613-cbbb-4a4f-a402-1ab1b35258d7','YZzFWIuPmzNAAWXDAml19iOQb5n1','DTKmkOjJknnKiyrLCgVA','question','Harassment or hate speech','123','2021-02-09 12:07:25'),('d9f13983-6416-4f38-93a8-3e5e926e8e3f','YZzFWIuPmzNAAWXDAml19iOQb5n1','0Mvnn5gPL4smBFB15Ydq','question','Inappropriate listings message/category','123','2021-02-09 12:08:05');
/*!40000 ALTER TABLE `report` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `country` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nativeLanguage` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `interestLanguages` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `points` bigint DEFAULT NULL,
  `photoURL` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `createdAt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('53KtHe72UUVHaqo5WdD2etAI7Vx2','nevadan','test5@gmail.com','','male','','US','ES','US',0,'','active','2021-01-26 03:19:16'),('5BQ0Bel5d4R3QcImSyJe9mAkM6A3','hungtn.98','hungteddy98@gmail.com','','male','','VN','VietNam','US',0,'https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/assets%2Fimages%2F9caa11e7-6e6d-48ed-824d-4ca0857d0f3a_1604628192445?aalt=media&token=b6ed6628-713c254bec784','active','2021-01-26 03:21:10'),('5HHJ6fA1aieFKWXFGpsFIjuLIx42','Jooolia','test@gmail.com','','female','','US','Korean','VietNam',0,'','active','2021-01-26 03:22:59'),('hpOXQcaJHIhggzlVzt4eOxlwTCB2','dumiyu','test4@gmail.com','','male','','JP','ja','en',3,'https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/assets%2Fimages%2F6fdbb094-b727-4350-afea-03fd2e0352c4_1608691306997?alt=media&token=36dd7ce1-8a85-4c16-9768-a46a4c49e228','active','2021-02-17 01:42:44'),('kave6fyxPLfAI4zPksWFdOY9HYy1','minhta359','test2@gmail.com','','male','','VN','cs','US',0,'','active','2021-01-26 03:35:45'),('MqQsxGIwLCZIMsCiDCzCTyuSheC3','hshassan3','test9@gmail.com','','female','','US','US','in',0,'','active','2021-01-26 03:25:34'),('oPaXeCbRDOQDAzkndaSTXzgM2Dj1','Vũ Lê','null','','male','','VN','in','US',0,'https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/assets%2Fimages%2F554394c0-0e8b-492e-b3f3-0663fd54d92a_1605694552712?alt=media&token=66ca98c4-10a5-4d84-b5c4-273bd9ff19ae','active','2021-02-16 01:40:55'),('Qhg31jnDKkhFeo9NIP9WBaUmmty1','Yacchan1','test3@gmail.com','','female','','JP','Japan','US',0,'','active','2021-01-26 03:27:30'),('Sjt6dJ4v0XafOonc8eMYILlsDZH3','kirito7147','test6@gmail.com','','male','','US','US','US',0,'','active','2021-01-26 03:29:30'),('SUPFEuTfXwarwpm2tl65EBRaG4j2','Hưng Ngọc Trần','htbs1gin@gmail.com','','male','','VN','VietNam','English',0,'','active','2021-01-26 03:13:52'),('TnIjzNidIsRkjbXNfRQ627CzITv2','tranngochung0510','tranngochung0510@gmail.com','','male','','US','US','US',0,'','active','2021-01-26 03:30:25'),('UBiiykOYsdWdhfbgOXtMjyOaKw62','wutiaotiaohu','test8@gmail.com','','male','','CN','zh','US',0,'','active','2021-01-26 03:32:22'),('VhApuAfHD4cOy0V5kfzdkqNc7Ai2','vanhoinguyen','vanhoinguyen98@gmail.com','','male','','VN','cs','US',0,'','active','2021-01-26 03:33:53'),('xrzgDfZSJgMLJfamgDZ7euy1slj2','Yuko_MicoNituda5254','test7@gmail.com','','male','','PH','cs','US',0,'','active','2021-01-26 03:36:52'),('YGtBXNAgYBhuVFtXxGHQ0InChyj2','Hen Ri','16520538@gm.uit.edu.vn','','male','','VN','en','en',0,'https://graph.facebook.com/865179637671195/picture?access_token=EAAFj0fSKUGgBAJYe821ZB95EXN41ljXF88Gj6TkgnnmVAF1FADE6vHFLqN9aByZATz6bKtZBrgyKBjAtlW5Uczmls7bw2uQ4TRTQcwkr1NeOV5kZAqp2Vv5AA0BfCORS9XJv4IE5SbOrN9fxYnesA34eZCI22oWZAtZCOBH0l795wZDZD','active','2021-02-17 01:46:07'),('YZzFWIuPmzNAAWXDAml19iOQb5n1','Võ Quốc Huy','voquochuy798@gmail.com','','male','','VN','cs','US',0,'','active','2021-01-26 03:34:48'),('ZAOWuLETs2eKwZAP17w2SuMnsI02','sadasdasd','asdasd@fdsfsd.com','','male','','US','en','en',0,'https://firebasestorage.googleapis.com/v0/b/togebetter.appspot.com/o/img%2Fdefault-avatar.png?alt=media&token=a6ed8c16-5e60-4ca9-aaad-0ddaadd675b1','active','2021-02-17 01:44:45');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vote`
--

DROP TABLE IF EXISTS `vote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vote` (
  `id` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `userID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  `postID` varchar(256) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vote`
--

LOCK TABLES `vote` WRITE;
/*!40000 ALTER TABLE `vote` DISABLE KEYS */;
INSERT INTO `vote` VALUES ('1','1','1'),('10','2','7'),('2','2','2'),('3','3','3'),('4','4','4'),('5','1','2'),('6','2','3'),('7','3','4'),('8','4','5'),('9','1','6');
/*!40000 ALTER TABLE `vote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'togetherbetter'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-02-18 22:46:13
