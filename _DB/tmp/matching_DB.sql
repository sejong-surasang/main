CREATE DATABASE  IF NOT EXISTS `matching` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `matching`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: matching
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `id` int NOT NULL COMMENT 'id - 해당 댓글 고유 아이디값 (int) ',
  `postID` int NOT NULL COMMENT 'postID - 원 게시물의 고유 아이디값 (int) ',
  `secret` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'secret - 비밀 댓글 여부, TINYINT 타입을 활용 0 - 공개댓글 1 - 비밀 댓글',
  `CommentPassword` varchar(45) NOT NULL COMMENT 'CommentPAssword - 댓글 작성자 비밀번호(문자열)',
  `comment` varchar(200) NOT NULL COMMENT 'comment - 댓글 내용 (문자열) , 200자 제한 (변동 가능성 있음)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` int NOT NULL COMMENT 'id - 게시물 고유의 아이디 값 (int)',
  `title` varchar(45) NOT NULL COMMENT 'title - 게시물의 제목(문자열) , 45자 제한 (변동 가능성 있음)',
  `author` varchar(45) NOT NULL COMMENT 'author - 게시물 작성자 (문자열)',
  `startTime` datetime DEFAULT NULL COMMENT 'startTime - 희망하는 시간대 시작시간 (datetime), 필수선택 아님(NULL)',
  `endTime` datetime DEFAULT NULL COMMENT 'endTime - 희망하는 시간대 마감시간 (datetime) , 필수선택 아님(NULL)',
  `shop` int DEFAULT NULL COMMENT 'shop - 희망하는 식당(식당코드, int),  필수선택 아님(NULL) ',
  `content` varchar(500) NOT NULL COMMENT 'content - 게시글 내용(문자열), 500자 제한 (변동 가능성 있음)',
  `password` varchar(45) NOT NULL COMMENT 'password - 작성자 비밀번호 (문자열) ',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-18  0:30:40
