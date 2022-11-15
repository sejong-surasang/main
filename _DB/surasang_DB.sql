CREATE DATABASE  IF NOT EXISTS `surasang` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `surasang`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: surasang
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
-- Table structure for table `matching_comments`
--

DROP TABLE IF EXISTS `matching_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matching_comments` (
  `id` int NOT NULL COMMENT 'id - 해당 댓글 고유 아이디값 (int) ',
  `postID` int NOT NULL COMMENT 'postID - 원 게시물의 고유 아이디값 (int) ',
  `secret` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'secret - 비밀 댓글 여부, TINYINT 타입을 활용 0 - 공개댓글 1 - 비밀 댓글',
  `CommentPassword` varchar(45) NOT NULL COMMENT 'CommentPAssword - 댓글 작성자 비밀번호(문자열)',
  `comment` varchar(200) NOT NULL COMMENT 'comment - 댓글 내용 (문자열) , 200자 제한 (변동 가능성 있음)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `matching_comments`
--

LOCK TABLES `matching_comments` WRITE;
/*!40000 ALTER TABLE `matching_comments` DISABLE KEYS */;
INSERT INTO `matching_comments` VALUES (1,1,0,'1234','비밀 댓글이 아닙니다.'),(2,1,1,'1234','비밀 댓글입니다.');
/*!40000 ALTER TABLE `matching_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `matching_posts`
--

DROP TABLE IF EXISTS `matching_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `matching_posts` (
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
-- Dumping data for table `matching_posts`
--

LOCK TABLES `matching_posts` WRITE;
/*!40000 ALTER TABLE `matching_posts` DISABLE KEYS */;
INSERT INTO `matching_posts` VALUES (1,'테스트','관리자','2022-09-26 12:00:00','2022-09-26 13:30:00',1001,'학관 테스트','1234');
/*!40000 ALTER TABLE `matching_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_lists`
--

DROP TABLE IF EXISTS `menu_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_lists` (
  `id` int NOT NULL COMMENT '해당 메뉴 고유 id 값(int)',
  `shop_id` int NOT NULL COMMENT '해당 메뉴를 판매하는 매장의 id(int)',
  `food_type` int DEFAULT NULL COMMENT '메뉴의 타임(int) 1-한식 2-중식 3-일식 4-양식 0-기타',
  `name` varchar(45) DEFAULT NULL,
  `price` int DEFAULT NULL COMMENT '해당 메뉴 가격(int)',
  `img_src` varchar(1000) DEFAULT NULL COMMENT '해당 메뉴의 이미지 링크(varchar(1000))',
  `isbest` int DEFAULT '0' COMMENT '0,1로 나뉘는 값으로, 1이면 추천메뉴 기능 표시',
  `detail_src` varchar(1000) DEFAULT NULL COMMENT '해당 메뉴 상세정보 링크 (varchar(1000))',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_lists`
--

LOCK TABLES `menu_lists` WRITE;
/*!40000 ALTER TABLE `menu_lists` DISABLE KEYS */;
INSERT INTO `menu_lists` VALUES (1,1001,3,'치킨까스',4500,NULL,0,NULL),(2,1001,3,'고구마돈까스',5000,NULL,0,NULL),(3,1001,3,'세종대왕돈까스',5500,NULL,1,NULL),(4,1001,3,'새우튀김 알밥',4500,NULL,1,NULL),(5,1001,3,'돈까스 카레덮밥',4500,NULL,0,NULL),(6,1001,3,'새우튀김카레덮밥',4500,NULL,0,NULL),(7,1001,3,'함박카레덮밥',4500,NULL,0,NULL),(8,1001,3,'소세지카레덮밥',4500,NULL,0,NULL),(9,1001,3,'치킨가라아게카레덮밥',5000,NULL,0,NULL),(10,1001,1,'우삼겹된장찌개',5000,NULL,0,NULL),(11,1001,3,'김치우동',2800,NULL,0,NULL),(12,1001,3,'어묵꼬치우동',3500,NULL,0,NULL),(13,1001,3,'새우튀김우동',4000,NULL,0,NULL),(14,1001,3,'돈까스우동정식',5000,NULL,0,NULL),(15,1001,3,'오므라이스',3500,NULL,0,NULL),(16,1001,3,'닭강정오므라이스',5000,NULL,1,NULL),(17,1001,3,'함박오므라이스',5000,NULL,0,NULL),(18,1001,3,'돈까스오므라이스',5000,NULL,0,NULL),(19,1001,1,'소금구이덮밥',4300,NULL,0,NULL),(20,1001,1,'소금구이비빔밥',5300,NULL,0,NULL),(21,1001,1,'닭강정',4000,NULL,0,NULL),(22,1001,1,'제육덮밥',4500,NULL,0,NULL),(23,1001,5,'공기밥',800,NULL,0,NULL),(24,1001,1,'곱빼기참치마요비빔밥',4300,NULL,0,NULL),(25,1001,1,'곱빼기매콤참치마요비빔밥',4500,NULL,0,NULL),(26,1001,1,'라면',2500,NULL,0,NULL),(27,1001,1,'치즈라면',3000,NULL,0,NULL),(28,1001,1,'참치마요비빔밥',3800,NULL,0,NULL),(29,1001,1,'매콤참치마요비빔밥',4000,NULL,0,NULL),(30,1001,1,'국물떡볶이',3500,NULL,0,NULL),(31,1001,1,'국물떡볶이세트',5000,NULL,0,NULL),(32,1001,1,'치즈국물떡볶이',4000,NULL,0,NULL),(33,1001,1,'치즈국물떡볶이세트',5500,NULL,0,NULL),(34,1001,1,'육회비빔밥',5500,NULL,1,NULL),(35,1001,1,'돈육순두부찌개',4800,NULL,0,NULL),(36,1001,1,'밀면',4000,NULL,0,NULL),(37,1001,1,'비빔밀면',4500,NULL,0,NULL),(38,1001,5,'스프라이트',1500,NULL,0,NULL),(39,1001,5,'환타오렌지',1500,NULL,0,NULL),(40,1001,5,'환타파인애플',1500,NULL,0,NULL),(41,1001,5,'환타포도',1500,NULL,0,NULL),(42,1001,5,'콜라',1500,NULL,0,NULL),(43,1001,5,'제로콜라',1500,NULL,0,NULL),(44,1002,1,'라면',2800,NULL,0,NULL),(45,1002,1,'치즈라면',3200,NULL,0,NULL),(46,1002,1,'떡라면',3200,NULL,0,NULL),(47,1002,1,'김치찌개라면',3500,NULL,0,NULL),(48,1002,1,'부대찌개라면',3800,NULL,0,NULL),(49,1002,1,'해물라면',3800,NULL,0,NULL),(50,1002,3,'(유부)우동',3500,NULL,0,NULL),(51,1002,1,'쫄만두',4500,NULL,0,NULL),(52,1002,1,'김치찌개',4500,NULL,0,NULL),(53,1002,1,'순두부찌개',4500,NULL,0,NULL),(54,1002,1,'순쫄찌개',4800,NULL,0,NULL),(55,1002,1,'소고기된장찌개',4800,NULL,0,NULL),(56,1002,1,'김치나베',5000,NULL,0,NULL),(57,1002,1,'설렁탕',5300,NULL,0,NULL),(58,1002,1,'갈비탕',5500,NULL,0,NULL),(59,1002,1,'뚝배기불고기',4800,NULL,0,NULL),(60,1002,1,'소불고기만두전골',5500,NULL,0,NULL),(61,1002,1,'떡만두국',4800,NULL,0,NULL),(62,1002,1,'컵밥',4500,NULL,0,NULL),(63,1002,1,'비빔밥',4500,NULL,0,NULL),(64,1002,1,'치킨마요비빔밥',4500,NULL,0,NULL),(65,1002,1,'참치마요비빔밥',4500,NULL,0,NULL),(66,1002,1,'떡갈비마요비빔밥',4500,NULL,0,NULL),(67,1002,1,'매콤제육비빔밥',5000,NULL,0,NULL),(68,1002,1,'소고기비빔밥',5000,NULL,0,NULL),(69,1002,3,'새우알밥',4500,NULL,0,NULL),(70,1002,3,'날치알밥',4500,NULL,0,NULL),(71,1002,1,'날치알회덮밥',4500,NULL,0,NULL),(72,1002,1,'떡갈비덮밥',5000,NULL,0,NULL),(73,1002,1,'돼지불고기덮밥',5000,NULL,0,NULL),(74,1002,1,'닭불고기덮밥',5000,NULL,0,NULL),(75,1002,1,'불닭마요비빔밥',5000,NULL,0,NULL),(76,1002,1,'수제소세지밥',4500,NULL,0,NULL),(77,1002,3,'치킨까스',5000,NULL,0,NULL),(78,1002,3,'함박스테이크',5000,NULL,0,NULL),(79,1002,3,'등심왕돈까스',5500,NULL,0,NULL),(80,1002,3,'치즈돈까스',5800,NULL,0,NULL),(81,1002,3,'고구마돈까스',5800,NULL,0,NULL),(82,1002,4,'미트그라탕',5500,NULL,0,NULL),(83,1002,4,'미트스파게티',5500,NULL,0,NULL),(84,1002,4,'크림그라탕',5500,NULL,0,NULL),(85,1002,4,'미트스파게티',5500,NULL,0,NULL),(86,1002,1,'공기밥',800,NULL,0,NULL),(87,1002,1,'군만두',1500,NULL,0,NULL),(88,1002,1,'피카츄',1500,NULL,0,NULL),(89,1002,3,'새우튀김',1500,NULL,0,NULL),(90,1002,1,'떡갈비추가',1500,NULL,0,NULL),(91,1002,1,'소떡소떡',2500,'',0,NULL),(92,1002,5,'콜팝',3500,NULL,0,NULL),(93,1002,1,'물냉면',4000,NULL,0,NULL),(94,1002,1,'비빔냉면',4500,NULL,0,NULL),(95,1002,1,'떡쌈물냉면',5500,NULL,0,NULL),(96,1002,1,'떡삼비빔냉면',5900,NULL,0,NULL);
/*!40000 ALTER TABLE `menu_lists` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search`
--

DROP TABLE IF EXISTS `search`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search` (
  `id` int NOT NULL COMMENT 'id - 해당 메뉴 고유 id 값(int)',
  `shop_id` int NOT NULL COMMENT 'shop_id - 해당 메뉴를 판매하는 매장의 id(int)',
  `food_type` int DEFAULT NULL COMMENT 'food_type - 메뉴의 타임(int) 1-한식 2-중식 3-일식 4-양식 0-기타',
  `name` varchar(45) DEFAULT NULL COMMENT 'name - 음식 이름(문자열)',
  `price` int DEFAULT NULL COMMENT 'price - 해당 메뉴 가격(int)',
  `img_src` varchar(1000) DEFAULT NULL COMMENT 'img_src - 해당 메뉴의 이미지 링크(varchar(1000))',
  `isbest` int DEFAULT '0' COMMENT 'isbest - 0,1로 나뉘는 값으로, 1이면 추천메뉴 기능 표시',
  `detail_src` varchar(1000) DEFAULT NULL COMMENT 'detail_src - 해당 메뉴 상세정보 링크 (varchar(1000))',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search`
--

LOCK TABLES `search` WRITE;
/*!40000 ALTER TABLE `search` DISABLE KEYS */;
INSERT INTO `search` VALUES (1,1001,3,'치킨까스',4500,NULL,0,NULL),(2,1001,3,'고구마돈까스',5000,NULL,0,NULL),(3,1001,3,'세종대왕돈까스',5500,NULL,1,NULL),(4,1001,3,'새우튀김 알밥',4500,NULL,1,NULL),(5,1001,3,'돈까스 카레덮밥',4500,NULL,0,NULL),(6,1001,3,'새우튀김카레덮밥',4500,NULL,0,NULL),(7,1001,3,'함박카레덮밥',4500,NULL,0,NULL),(8,1001,3,'소세지카레덮밥',4500,NULL,0,NULL),(9,1001,3,'치킨가라아게카레덮밥',5000,NULL,0,NULL),(10,1001,1,'우삼겹된장찌개',5000,NULL,0,NULL),(11,1001,3,'김치우동',2800,NULL,0,NULL),(12,1001,3,'어묵꼬치우동',3500,NULL,0,NULL),(13,1001,3,'새우튀김우동',4000,NULL,0,NULL),(14,1001,3,'돈까스우동정식',5000,NULL,0,NULL),(15,1001,3,'오므라이스',3500,NULL,0,NULL),(16,1001,3,'닭강정오므라이스',5000,NULL,1,NULL),(17,1001,3,'함박오므라이스',5000,NULL,0,NULL),(18,1001,3,'돈까스오므라이스',5000,NULL,0,NULL),(19,1001,1,'소금구이덮밥',4300,NULL,0,NULL),(20,1001,1,'소금구이비빔밥',5300,NULL,0,NULL),(21,1001,1,'닭강정',4000,NULL,0,NULL),(22,1001,1,'제육덮밥',4500,NULL,0,NULL),(23,1001,5,'공기밥',800,NULL,0,NULL),(24,1001,1,'곱빼기참치마요비빔밥',4300,NULL,0,NULL),(25,1001,1,'곱빼기매콤참치마요비빔밥',4500,NULL,0,NULL),(26,1001,1,'라면',2500,NULL,0,NULL),(27,1001,1,'치즈라면',3000,NULL,0,NULL),(28,1001,1,'참치마요비빔밥',3800,NULL,0,NULL),(29,1001,1,'매콤참치마요비빔밥',4000,NULL,0,NULL),(30,1001,1,'국물떡볶이',3500,NULL,0,NULL),(31,1001,1,'국물떡볶이세트',5000,NULL,0,NULL),(32,1001,1,'치즈국물떡볶이',4000,NULL,0,NULL),(33,1001,1,'치즈국물떡볶이세트',5500,NULL,0,NULL),(34,1001,1,'육회비빔밥',5500,NULL,1,NULL),(35,1001,1,'돈육순두부찌개',4800,NULL,0,NULL),(36,1001,1,'밀면',4000,NULL,0,NULL),(37,1001,1,'비빔밀면',4500,NULL,0,NULL),(38,1001,5,'스프라이트',1500,NULL,0,NULL),(39,1001,5,'환타오렌지',1500,NULL,0,NULL),(40,1001,5,'환타파인애플',1500,NULL,0,NULL),(41,1001,5,'환타포도',1500,NULL,0,NULL),(42,1001,5,'콜라',1500,NULL,0,NULL),(43,1001,5,'제로콜라',1500,NULL,0,NULL),(44,1002,1,'라면',2800,NULL,0,NULL),(45,1002,1,'치즈라면',3200,NULL,0,NULL),(46,1002,1,'떡라면',3200,NULL,0,NULL),(47,1002,1,'김치찌개라면',3500,NULL,0,NULL),(48,1002,1,'부대찌개라면',3800,NULL,0,NULL),(49,1002,1,'해물라면',3800,NULL,0,NULL),(50,1002,3,'(유부)우동',3500,NULL,0,NULL),(51,1002,1,'쫄만두',4500,NULL,0,NULL),(52,1002,1,'김치찌개',4500,NULL,0,NULL),(53,1002,1,'순두부찌개',4500,NULL,0,NULL),(54,1002,1,'순쫄찌개',4800,NULL,0,NULL),(55,1002,1,'소고기된장찌개',4800,NULL,0,NULL),(56,1002,1,'김치나베',5000,NULL,0,NULL),(57,1002,1,'설렁탕',5300,NULL,0,NULL),(58,1002,1,'갈비탕',5500,NULL,0,NULL),(59,1002,1,'뚝배기불고기',4800,NULL,0,NULL),(60,1002,1,'소불고기만두전골',5500,NULL,0,NULL),(61,1002,1,'떡만두국',4800,NULL,0,NULL),(62,1002,1,'컵밥',4500,NULL,0,NULL),(63,1002,1,'비빔밥',4500,NULL,0,NULL),(64,1002,1,'치킨마요비빔밥',4500,NULL,0,NULL),(65,1002,1,'참치마요비빔밥',4500,NULL,0,NULL),(66,1002,1,'떡갈비마요비빔밥',4500,NULL,0,NULL),(67,1002,1,'매콤제육비빔밥',5000,NULL,0,NULL),(68,1002,1,'소고기비빔밥',5000,NULL,0,NULL),(69,1002,3,'새우알밥',4500,NULL,0,NULL),(70,1002,3,'날치알밥',4500,NULL,0,NULL),(71,1002,1,'날치알회덮밥',4500,NULL,0,NULL),(72,1002,1,'떡갈비덮밥',5000,NULL,0,NULL),(73,1002,1,'돼지불고기덮밥',5000,NULL,0,NULL),(74,1002,1,'닭불고기덮밥',5000,NULL,0,NULL),(75,1002,1,'불닭마요비빔밥',5000,NULL,0,NULL),(76,1002,1,'수제소세지밥',4500,NULL,0,NULL),(77,1002,3,'치킨까스',5000,NULL,0,NULL),(78,1002,3,'함박스테이크',5000,NULL,0,NULL),(79,1002,3,'등심왕돈까스',5500,NULL,0,NULL),(80,1002,3,'치즈돈까스',5800,NULL,0,NULL),(81,1002,3,'고구마돈까스',5800,NULL,0,NULL),(82,1002,4,'미트그라탕',5500,NULL,0,NULL),(83,1002,4,'미트스파게티',5500,NULL,0,NULL),(84,1002,4,'크림그라탕',5500,NULL,0,NULL),(85,1002,4,'미트스파게티',5500,NULL,0,NULL),(86,1002,1,'공기밥',800,NULL,0,NULL),(87,1002,1,'군만두',1500,NULL,0,NULL),(88,1002,1,'피카츄',1500,NULL,0,NULL),(89,1002,3,'새우튀김',1500,NULL,0,NULL),(90,1002,1,'떡갈비추가',1500,NULL,0,NULL),(91,1002,1,'소떡소떡',2500,'',0,NULL),(92,1002,5,'콜팝',3500,NULL,0,NULL),(93,1002,1,'물냉면',4000,NULL,0,NULL),(94,1002,1,'비빔냉면',4500,NULL,0,NULL),(95,1002,1,'떡쌈물냉면',5500,NULL,0,NULL),(96,1002,1,'떡삼비빔냉면',5900,NULL,0,NULL);
/*!40000 ALTER TABLE `search` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shop_lists`
--

DROP TABLE IF EXISTS `shop_lists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shop_lists` (
  `id` int NOT NULL COMMENT '해당 식당 고유 아이디값(int)\nNnnn\nN - 분류 (1-학식,2-식당,3-카페,4-편의점)\nn - 번호 (001~999) [ex) 1001-학생회관, 4002-이마트24] ',
  `name` varchar(45) NOT NULL COMMENT '식당 이름(varchar(45))',
  `notice` varchar(400) DEFAULT '공지가 없습니다.' COMMENT '운영 및 휴무 공지 (varchar(400))',
  `opening_hour` varchar(200) DEFAULT '평일 : 09:00~19:00' COMMENT '영업시간(varchar(200))',
  `location_desc` varchar(100) DEFAULT '업데이트 예정입니다.' COMMENT '식당 위치(varchar(100))',
  `img_src` varchar(1000) DEFAULT NULL COMMENT '식당 이미지 링크 (varchar(1000))',
  `isopen` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shop_lists`
--

LOCK TABLES `shop_lists` WRITE;
/*!40000 ALTER TABLE `shop_lists` DISABLE KEYS */;
INSERT INTO `shop_lists` VALUES (1001,'학생회관푸드코트','공지가 없습니다.','평일 : 11:00~19:30','학생회관 지하 1층',NULL,0),(1002,'진관키친','공지가 없습니다.','평일 : 09:30~15:30','진관홀 지하 1층',NULL,0),(1003,'계절밥상','공지가 없습니다.','평일 : 09:00~19:00','군자관 6층',NULL,0),(1004,'군자키친','2023년 3월 오픈예정','평일 : 09:00~19:00','군자관 B1층',NULL,0),(2001,'얌샘김밥','공지가 없습니다.','매일 : 09:00~21:00','학생회관 1층',NULL,0),(2002,'미스사이공','공지가 없습니다.','매일 : 10:00~21:00','학생회관 1층',NULL,0),(2003,'석관동떡볶이','공지가 없습니다.','평일 : 11:00~22:00','학생회관 1층',NULL,0),(2004,'리얼후라이','공지가 없습니다.','평일 : 10:00~23:00','학생회관 1층',NULL,0),(3001,'팬도로시','공지가 없습니다.','평일 : 09:30~18:30','학생회관 1층',NULL,0),(3002,'투썸플레이스','공지가 없습니다.','평일 : 08:00~22:00','대양AI센터 1층',NULL,0),(3003,'카페딕셔너리','공지가 없습니다.','평일 : 08:00~19:00','광개토관 B1층',NULL,0),(3004,'파리바게뜨','공지가 없습니다.','평일 : 08:00~22:00','학생회관 1층',NULL,0),(3005,'카페딕셔너리2','공지가 없습니다.','평일 : 08:00~19:00','충무관 1층',NULL,0),(3006,'제주몰빵','공지가 없습니다.','평일 : 09:00~19:00 주말 : 10:00~18:00 ','학생회관 2층',NULL,0),(3007,'카페드림','공지가 없습니다.','매일 : 09:00~17:30 (방학중 주말영업X)','학술정보원 1층',NULL,0),(4001,'CU','공지가 없습니다.','매일 : 00:00~24:00','대양AI센터 1층',NULL,0),(4002,'이마트24','공지가 없습니다.','매일 : 09:00~18:00','광개토관 B1층',NULL,0),(4003,'이마트24_2','공지가 없습니다.','매일 : 09:00~19:00','율곡관 B1층',NULL,0),(4004,'매점','공지가 없습니다.','평일 : 09:00~19:00','진관홀 B1층',NULL,0);
/*!40000 ALTER TABLE `shop_lists` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-15 11:43:59
