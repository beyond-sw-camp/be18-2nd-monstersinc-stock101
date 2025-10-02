/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.8.2-MariaDB, for Win64 (AMD64)
--
-- Host: 121.170.161.72    Database: stock101
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `analyst_indicators`
--

DROP TABLE IF EXISTS `analyst_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `analyst_indicators` (
  `result` enum('STRONG_SELL','SELL','HOLD','BUY','STRONG_BUY') NOT NULL COMMENT '결과',
  `date` date NOT NULL COMMENT '날짜',
  `strong_sell` int(11) NOT NULL COMMENT '적극 판매 카운트',
  `sell` int(11) NOT NULL COMMENT '판매 카운트',
  `hold` int(11) NOT NULL COMMENT '중립 카운트',
  `buy` int(11) NOT NULL COMMENT '구매 카운트',
  `strong_buy` int(11) NOT NULL COMMENT '적극 구매 카운트',
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  PRIMARY KEY (`stock_id`,`date`),
  KEY `IDX_analyst_date` (`date`),
  CONSTRAINT `FK_analyst_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `analyst_indicators`
--

LOCK TABLES `analyst_indicators` WRITE;
/*!40000 ALTER TABLE `analyst_indicators` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `analyst_indicators` VALUES
('HOLD','2025-09-11',2,10,40,10,2,1001);
/*!40000 ALTER TABLE `analyst_indicators` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '댓글 ID',
  `content` text DEFAULT NULL COMMENT '댓글 내용',
  `created_at` timestamp NULL DEFAULT current_timestamp() COMMENT '댓글 작성 시간',
  `is_deleted` tinyint(1) DEFAULT 0 COMMENT '댓글 삭제 여부 (삭제된 댓글입니다)',
  `post_id` bigint(20) NOT NULL COMMENT '게시물 ID',
  `user_id` bigint(20) NOT NULL COMMENT '사용자 ID',
  `parent_comment_id` bigint(20) DEFAULT NULL COMMENT '대댓글 ID',
  PRIMARY KEY (`comment_id`),
  KEY `IDX_comments_post` (`post_id`),
  KEY `IDX_comments_user` (`user_id`),
  KEY `IDX_comments_parent` (`parent_comment_id`),
  CONSTRAINT `FK_comments_parent` FOREIGN KEY (`parent_comment_id`) REFERENCES `comments` (`comment_id`),
  CONSTRAINT `FK_comments_posts` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FK_comments_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `comments` VALUES
(2,'wow','2025-09-15 07:11:14',1,14,11,NULL),
(3,'wow','2025-09-15 07:12:18',1,14,11,NULL),
(4,'3-1','2025-09-15 07:38:34',1,14,11,3),
(5,'3-2','2025-09-15 07:46:17',1,14,11,3),
(6,'3-2','2025-09-15 08:15:11',1,14,11,NULL),
(7,'6-1','2025-09-15 08:15:26',1,14,11,6),
(21,'contentcontentcontent','2025-09-21 07:20:57',1,15,15,NULL),
(22,'contentcontentcontent','2025-09-21 07:21:12',0,15,15,21),
(23,'contentcontentcontent','2025-09-21 07:32:44',0,15,15,21),
(28,'Noooooo','2025-09-22 07:37:20',0,15,15,21),
(29,'!!!!!','2025-09-22 07:37:33',0,15,15,21),
(30,'!!!!!','2025-09-23 00:45:46',0,15,15,21),
(31,'!!!!!','2025-09-23 00:46:36',0,15,15,NULL),
(32,'!!!!!','2025-09-23 08:20:28',0,15,15,NULL),
(33,'sdf','2025-09-24 05:17:41',0,27,15,NULL),
(34,'왱','2025-09-24 06:18:35',0,28,15,NULL),
(35,'호호잇','2025-09-24 06:23:29',0,28,15,34),
(36,'!!!','2025-09-24 08:12:27',0,29,15,NULL),
(37,'tt','2025-09-24 08:22:58',0,30,15,NULL),
(38,'tt','2025-09-24 08:23:01',0,30,15,37),
(39,'맞아요, 저도 같은 생각입니다. 이제는 단순 반도체 기업이 아니라 AI 생태계 전체를 이끌어가는 핵심이라 봅니다. 이런 기회 흔치 않죠, 동의합니다.','2025-09-25 01:46:10',0,37,31,NULL),
(40,'저도 동감합니다. 실적과 시장 지위를 보면 확실히 다른 회사들과는 레벨이 다르네요. 장기적으로 놓고 보면 Strong Buy 의견에 힘 실릴 것 같습니다.','2025-09-25 02:38:23',0,37,32,NULL),
(41,'저도 동감합니다. 실적과 시장 지위를 보면 확실히 다른 회사들과는 레벨이 다르네요. 장기적으로 놓고 보면 Strong Buy 의견에 힘 실릴 것 같습니다.','2025-09-25 03:24:05',0,37,25,NULL),
(42,'이의가 있는지 궁금하군요.','2025-09-25 06:17:26',0,39,1,NULL),
(44,'저도 그렇게 생각합니다.','2025-09-26 01:26:50',0,37,39,NULL),
(45,'저도 중장기적으로 좋다고 생각됩니다.','2025-09-26 01:27:04',0,37,39,41);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `economic_events`
--

DROP TABLE IF EXISTS `economic_events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `economic_events` (
  `event_id` bigint(20) NOT NULL COMMENT '이벤트 ID',
  `type_code` varchar(5) NOT NULL COMMENT '이벤트 타입',
  `name` varchar(255) DEFAULT NULL COMMENT '이벤트명',
  `date` datetime NOT NULL COMMENT '발표시간+날짜',
  `stock_id` bigint(20) DEFAULT NULL COMMENT '종목 ID',
  `actual` double DEFAULT NULL COMMENT '값',
  `forecast` double DEFAULT NULL COMMENT '예상치',
  `previous` double DEFAULT NULL COMMENT '과거값',
  `impact` enum('positive','negative','neutral') DEFAULT NULL COMMENT '영향',
  PRIMARY KEY (`event_id`),
  KEY `IDX_ece_type` (`type_code`),
  KEY `IDX_ece_stock` (`stock_id`),
  CONSTRAINT `FK_ece_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`),
  CONSTRAINT `FK_ece_type` FOREIGN KEY (`type_code`) REFERENCES `event_types` (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `economic_events`
--

LOCK TABLES `economic_events` WRITE;
/*!40000 ALTER TABLE `economic_events` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `economic_events` VALUES
(400001,'FOMC','FOMC Decision: Fed holds 4.25%–4.50%','2025-07-30 14:00:00',NULL,4.375,NULL,4.375,'neutral'),
(400002,'CPI','US CPI (Jul 2025): +0.2% m/m; core +0.3% m/m','2025-08-12 08:30:00',NULL,0.2,NULL,NULL,'neutral'),
(400003,'NFP','US NFP (Jul 2025): +73k jobs; UR 4.2%','2025-08-01 08:30:00',NULL,73000,110000,14000,'negative'),
(400004,'GDP','US GDP Q2 2025 (2nd): +3.3% SAAR','2025-08-28 08:30:00',NULL,3.3,3.1,3,'positive'),
(410001,'EARN','NVIDIA Q2 FY2026 earnings release','2025-08-27 16:20:00',1001,NULL,NULL,NULL,'positive'),
(410002,'GUID','Options market implies huge swing ahead of results','2025-08-26 10:00:00',1001,NULL,NULL,NULL,'neutral'),
(410003,'EARN','Microsoft FY25 Q4 results (quarter ended Jun 30)','2025-07-30 16:05:00',1002,NULL,NULL,NULL,'positive'),
(410004,'GUID','Press release: revenue $76.4B (+18% y/y)','2025-07-30 16:05:00',1002,76.4,NULL,NULL,'positive'),
(410005,'EARN','Apple Q3 FY2025 results (conf. call 2:00pm PT)','2025-07-31 14:00:00',1003,NULL,NULL,NULL,'neutral'),
(410006,'DIV','Apple declares $0.26/share dividend (payable Aug 14)','2025-07-31 08:00:00',1003,0.26,NULL,NULL,'neutral'),
(410007,'EARN','Amazon Q2 2025 results (net sales +13% y/y)','2025-07-31 16:10:00',1004,NULL,NULL,NULL,'positive'),
(410008,'GUID','Company commentary/outlook in Q2 release','2025-07-31 16:10:00',1004,NULL,NULL,NULL,'neutral'),
(410009,'EARN','Meta Q2 2025 results','2025-07-30 16:10:00',1005,NULL,NULL,NULL,'positive'),
(410010,'GUID','Release includes forward-looking outlook','2025-07-30 16:10:00',1005,NULL,NULL,NULL,'neutral'),
(410011,'EARN','Alphabet Q2 2025 results (Class A/C)','2025-07-23 16:05:00',1006,NULL,NULL,NULL,'positive'),
(410012,'GUID','Raised 2025 capex target to ~$85B','2025-07-23 16:05:00',1006,85,NULL,NULL,'positive'),
(410013,'EARN','Broadcom FQ3 2025 results (after close Sep 4)','2025-09-04 16:05:00',1007,NULL,NULL,NULL,'neutral'),
(410014,'GUID','Prior guide: Q3 revenue ~$15.8B','2025-06-05 16:00:00',1007,15.8,NULL,NULL,'neutral'),
(410015,'EARN','Alphabet Q2 2025 results (Class C)','2025-07-23 16:05:00',1008,NULL,NULL,NULL,'positive'),
(410016,'GUID','Raised 2025 capex target to ~$85B','2025-07-23 16:05:00',1008,85,NULL,NULL,'positive'),
(410017,'EARN','Tesla Q2 2025 results (call as-it-happened)','2025-07-23 16:30:00',1009,NULL,NULL,NULL,'negative'),
(410018,'PROD','Tesla says started building initial versions of affordable car','2025-07-23 16:35:00',1009,NULL,NULL,NULL,'positive'),
(410019,'EARN','Netflix Q2 2025 results (posted Jul 17)','2025-07-17 16:05:00',1010,NULL,NULL,NULL,'positive'),
(410020,'GUID','Company raises 2025 revenue guidance to ~$44.8–45.2B','2025-07-17 16:05:00',1010,44.8,NULL,44.5,'positive'),
(410021,'EARN','Costco FY25 Q3 results & call','2025-05-29 14:00:00',1011,NULL,NULL,NULL,'positive'),
(410022,'EARN','Costco FY25 Q4 earnings call (scheduled)','2025-09-25 14:00:00',1011,NULL,NULL,NULL,'neutral'),
(410023,'EARN','Palantir Q2 2025 results (raised full-year revenue guide)','2025-08-04 16:05:00',1012,NULL,NULL,NULL,'positive'),
(410024,'GUID','Breakingviews: valuation commentary (context to outlook)','2025-09-02 10:00:00',1012,NULL,NULL,NULL,'neutral'),
(410025,'EARN','ASML Q2 2025 results / bookings beat; outlook caveat','2025-07-16 07:30:00',1013,NULL,NULL,NULL,'neutral'),
(410026,'GUID','Analyst color: 2026 growth hinges on stronger bookings','2025-07-15 07:00:00',1013,NULL,NULL,NULL,'neutral'),
(410027,'EARN','T-Mobile Q2 2025 results (record postpaid adds)','2025-07-23 16:30:00',1014,NULL,NULL,NULL,'positive'),
(410028,'PROD','Enterprise “SuperMobile” plan announced','2025-08-27 13:05:00',1014,NULL,NULL,NULL,'positive'),
(410029,'EARN','Cisco FY25 Q4 results (Aug 13 call)','2025-08-13 16:30:00',1015,NULL,NULL,NULL,'positive'),
(410030,'GUID','Post-earnings AI orders >$2B FY25','2025-08-13 17:00:00',1015,2,NULL,NULL,'positive'),
(410031,'EARN','AMD Q2 2025 results (press release)','2025-08-05 16:10:00',1016,NULL,NULL,NULL,'negative'),
(410032,'GUID','Company Q3 revenue outlook (~$8.7B in coverage)','2025-08-05 16:10:00',1016,8.7,NULL,NULL,'positive'),
(410033,'EARN','AstraZeneca H1/Q2 2025 results','2025-07-29 12:00:00',1017,NULL,NULL,NULL,'positive'),
(410034,'GUID','CEO commentary on pricing & US production plans','2025-07-29 12:10:00',1017,NULL,NULL,NULL,'neutral'),
(410035,'EARN','Linde Q2 2025 results (beat)','2025-08-01 07:00:00',1018,NULL,NULL,NULL,'positive'),
(410036,'GUID','Raised lower end of FY EPS guidance','2025-08-01 07:05:00',1018,NULL,NULL,NULL,'positive'),
(410037,'EARN','PepsiCo Q2 2025 results','2025-07-17 06:00:00',1019,NULL,NULL,NULL,'positive'),
(410038,'GUID','Prepared remarks/outlook posted with Q2 package','2025-07-17 08:15:00',1019,NULL,NULL,NULL,'neutral'),
(410039,'EARN','Intuit FY25 Q4 & full-year results','2025-08-21 16:05:00',1020,NULL,NULL,NULL,'positive'),
(410040,'GUID','FY26 initial outlook shared (press release)','2025-08-21 16:10:00',1020,NULL,NULL,NULL,'neutral');
/*!40000 ALTER TABLE `economic_events` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `event_types`
--

DROP TABLE IF EXISTS `event_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `event_types` (
  `type_code` varchar(5) NOT NULL COMMENT '이벤트 코드',
  `frequency` enum('DAILY','WEEKLY','BIWEEKLY','MONTHLY','YEARLY','ONCE','QUARTERLY') NOT NULL COMMENT '주기',
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_types`
--

LOCK TABLES `event_types` WRITE;
/*!40000 ALTER TABLE `event_types` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `event_types` VALUES
('CPI','MONTHLY'),
('DIV','ONCE'),
('EARN','ONCE'),
('FOMC','MONTHLY'),
('GDP','MONTHLY'),
('GUID','ONCE'),
('NFP','MONTHLY'),
('PROD','ONCE');
/*!40000 ALTER TABLE `event_types` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `financial_indicators`
--

DROP TABLE IF EXISTS `financial_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `financial_indicators` (
  `financial_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '재무 지표 ID',
  `EPS` double NOT NULL COMMENT '주당 순이익',
  `BPS` double NOT NULL COMMENT '주당 순자산',
  `ROE` double NOT NULL COMMENT '자기자본 이익률',
  `ROA` double NOT NULL COMMENT '총 자산 이익률',
  `quarter` int(11) NOT NULL COMMENT '분기',
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  PRIMARY KEY (`financial_id`),
  KEY `IDX_financial_stock` (`stock_id`),
  CONSTRAINT `FK_financial_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `financial_indicators`
--

LOCK TABLES `financial_indicators` WRITE;
/*!40000 ALTER TABLE `financial_indicators` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `financial_indicators` VALUES
(19,2.97,3.231,1.192,0.822,1,1001),
(20,13.7,46.21,0.333,0.18,2,1002),
(21,6.11,3.712,1.574,0.261,3,1003),
(22,5.66,27.305,0.243,0.103,4,1004),
(23,24.61,72.075,0.371,0.247,4,1005),
(24,8.13,26.389,0.329,0.235,4,1006),
(25,1.27,14.636,0.129,0.049,4,1007),
(26,8.13,26.389,0.329,0.235,4,1008),
(27,2.23,22.807,0.106,0.063,4,1009),
(28,20.28,57.608,0.384,0.17,4,1010),
(29,16.59,53.213,0.303,0.106,3,1011),
(30,0.21,2.224,0.11,0.086,4,1012),
(31,9.7,52.806,0.179,0.055,4,1014),
(32,2.56,11.781,0.221,0.083,3,1015),
(33,1.01,35.536,0.029,0.024,4,1016),
(34,13.71,79.562,0.173,0.084,4,1018),
(35,6.59,13.447,0.514,0.095,4,1019),
(36,13.82,70.393,0.203,0.112,3,1020);
/*!40000 ALTER TABLE `financial_indicators` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `individual_indicators`
--

DROP TABLE IF EXISTS `individual_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `individual_indicators` (
  `result` enum('STRONG_SELL','SELL','HOLD','BUY','STRONG_BUY') NOT NULL COMMENT '결과',
  `date` date NOT NULL COMMENT '날짜',
  `strong_sell` int(11) NOT NULL COMMENT '적극 판매 카운트',
  `sell` int(11) NOT NULL COMMENT '판매 카운트',
  `hold` int(11) NOT NULL COMMENT '중립 카운트',
  `buy` int(11) NOT NULL COMMENT '구매 카운트',
  `strong_buy` int(11) NOT NULL COMMENT '적극 구매 카운트',
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  PRIMARY KEY (`stock_id`,`date`),
  KEY `IDX_indiv_date` (`date`),
  CONSTRAINT `FK_indiv_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `individual_indicators`
--

LOCK TABLES `individual_indicators` WRITE;
/*!40000 ALTER TABLE `individual_indicators` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `individual_indicators` VALUES
('SELL','2025-09-11',10,20,3,1,0,1001);
/*!40000 ALTER TABLE `individual_indicators` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `industries`
--

DROP TABLE IF EXISTS `industries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `industries` (
  `industry_code` char(4) NOT NULL COMMENT '산업 코드',
  `name` varchar(255) NOT NULL COMMENT '산업명',
  PRIMARY KEY (`industry_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `industries`
--

LOCK TABLES `industries` WRITE;
/*!40000 ALTER TABLE `industries` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `industries` VALUES
('BEVG','Beverages'),
('BIOP','Biopharma & Biotech'),
('CHEM','Chemicals & Industrial Gases'),
('EVCL','Electric Vehicles & Clean Energy'),
('NETM','Internet & Media Platforms'),
('RETL','Retail & Wholesale'),
('SEMI','Semiconductors'),
('SOFT','Software'),
('TELC','Telecom Services');
/*!40000 ALTER TABLE `industries` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `news` (
  `news_id` char(150) NOT NULL COMMENT '뉴스 ID',
  `link` varchar(500) NOT NULL COMMENT '뉴스 원문 링크',
  `title` varchar(255) NOT NULL COMMENT '뉴스 제목',
  `content_summary` text DEFAULT NULL COMMENT '뉴스 요약',
  `published_at` timestamp NOT NULL COMMENT '발행 시간',
  `result` enum('NEGATIVE','NEUTRAL','POSITIVE') DEFAULT NULL COMMENT '감정 분석 결과',
  `click_count` int(11) DEFAULT 0 COMMENT '클릭 수',
  `ticker` char(5) DEFAULT NULL,
  `stock_id` bigint(20) DEFAULT NULL,
  `img_url` char(150) DEFAULT NULL,
  PRIMARY KEY (`news_id`),
  KEY `idx_news_stockId` (`stock_id`),
  CONSTRAINT `fk_news_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `news` VALUES
('0008f6b11b93c59798a179e332502df1a2c1804af822770cb948f2240483829b','https://www.investing.com/analysis/sp-500-will-stocks-extend-their-rally-after-the-fed-rate-decision-200667066','S&P 500: Will Stocks Extend Their Rally After the Fed Rate Decision?','The S&P 500 reached a record high of 6,626.99 ahead of the Federal Reserve\'s interest rate decision. Investors are cautious, with low investor sentiment and potential for market volatility. The market expects a 0.25 percentage point rate increase and is awaiting Fed Chair Powell\'s press conference.','2025-09-17 14:43:00','NEGATIVE',0,'NVDA',1001,NULL),
('031d7e03c7a2fa7ba6db5db6654fcbd1a9a19796c77272e60d8d2568c2ed6613','https://www.globenewswire.com/news-release/2025/09/17/3151932/0/en/The-Data-Centre-Companies-Shaping-2025-Report-Out-Now.html','The Data Centre Companies Shaping 2025 - Report Out Now','BizClik\'s Data Centre Magazine has released its Top 100 Data Centre Companies 2025 report, highlighting leading organizations in data centre operations, design, sustainability, and innovation, with a focus on AI-driven infrastructure and green technologies.','2025-09-17 17:00:00','POSITIVE',0,'AMZN',1004,NULL),
('04d85b4272a6609d7e2329022613fff262f893ee5f73836432a6a9ea021cf397','https://www.benzinga.com/Opinion/25/09/47829071/fed-chairs-no-risk-free-path-warning-sparks-unusual-outcome-as-gold-and-stocks-hit-records-simultaneously','Fed Chair\'s \"No Risk-Free Path\" Warning Sparks Unusual Outcome, As Gold And Stocks Hit Records Simultaneously','Federal Reserve Chair Jerome Powell warned of economic challenges with no risk-free path, while markets displayed an unusual scenario of gold and stocks simultaneously hitting record highs, signaling potential contradictory investor expectations.','2025-09-23 19:35:36','NEUTRAL',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/23/federal-reserve-chair-jerome-powell-anno.jpeg?width=1200&height=800&fit=crop'),
('06552fdaf64674fe5484c554a5bc03bedd97ac474701704726095e29a8e0a969','https://www.benzinga.com/markets/tech/25/09/47757830/tesla-rival-xpeng-deliveries-in-overseas-markets-surge-nearly-140-from-january-to-august-amid-europe','Tesla Rival Xpeng Deliveries In Overseas Markets Surge Nearly 140% From January To August Amid European Production Expansion','Chinese electric vehicle maker Xpeng reported a 137% year-over-year surge in overseas deliveries from January to August 2025, delivering over 24,702 units across 46 countries. The company is expanding production in Europe through a partnership with Magna International.','2025-09-19 10:15:59','NEUTRAL',0,'TSLA',1009,'https://cdn.benzinga.com/files/images/story/2025/09/19/Xpeng.jpeg?width=1200&height=800&fit=crop'),
('07966b1314865008f7d040a01e82bacc21e545e7e2b9a71ebc66665ba8705033','https://www.fool.com/investing/2025/09/16/the-smartest-artificial-intelligence-ai-stocks-to/?source=iedfolrf0000001','The Smartest Artificial Intelligence (AI) Stocks to Buy With $1,000','The article explores six AI stocks that investors can purchase with a modest $1,000 investment, highlighting companies across infrastructure, software, and consumer technology sectors that are positioned to benefit from AI\'s ongoing development and adoption.','2025-09-17 00:35:00','POSITIVE',0,'META',1005,NULL),
('09dc0bd215984d4ae8812cf6c52f69c0b62312f77696f865d1a652c9f5ec0242','https://www.fool.com/investing/2025/09/16/prediction-oracle-will-surpass-amazon-microsoft-an/?source=iedfolrf0000001','Prediction: Oracle Will Surpass Amazon, Microsoft, and Google to Become the Top Cloud for Artificial Intelligence (AI) By 2031','Oracle is predicted to become the leading cloud infrastructure provider for AI by 2031, with aggressive expansion plans and a massive $300 billion contract with OpenAI, positioning itself to potentially surpass AWS, Microsoft Azure, and Google Cloud in AI-specific cloud services.','2025-09-17 00:30:00','NEUTRAL',0,'MSFT',1002,NULL),
('0cd2f478469eb7f957511b29eeb525cc8d160ec5476fdaba47ca4c91f9c41741','https://www.investing.com/analysis/these-under10-stocks-are-up-100-this-quarter--and-some-still-have-room-to-run-200667317','These Under-$10 Stocks Are Up 100%+ This Quarter - And Some Still Have Room to Run','The article explores undervalued stocks trading under $10 that have shown significant quarterly gains, highlighting potential investment opportunities using Investing.com\'s stock screener.','2025-09-23 14:32:00','POSITIVE',0,'AAPL',1003,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('0ecb98c16833d61da38b6c61b03050556166d79b8337ffdc819b153b1ab47a87','https://www.investing.com/analysis/broadcom-insider-sales-look-less-bearish-when-measured-against-ownership-trends-200667087','Broadcom Insider Sales Look Less Bearish When Measured Against Ownership Trends','Broadcom\'s CEO Hock Tan received an incentive package tied to AI revenue growth, potentially earning over $220 million if the company reaches $90 billion in AI revenue. Despite recent share sales, the overall insider trading trend suggests confidence in the company\'s future.','2025-09-17 19:25:00','POSITIVE',0,'AVGO',1007,NULL),
('1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27','https://www.globenewswire.com/news-release/2025/09/22/3153697/28124/en/U-S-Smart-Home-and-Security-Market-Tracker-August-2025-Update-Key-Industry-Trends-Market-Shifts-and-Player-Announcements.html','U.S. Smart Home and Security Market Tracker, August 2025 Update - Key Industry Trends, Market Shifts, and Player Announcements','The August 2025 Smart Home and Security Market Tracker reveals key industry trends, focusing on AI\'s impact, consumer adoption, and market shifts among major tech and security providers.','2025-09-22 08:47:00','NEUTRAL',0,'AMZN',1004,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('17c8b47d8717048610db513cf87555bde0102c95db8ebdb5555632d68bd2b054','https://www.investing.com/analysis/nvidia-faces-structural-threat-as-china-halts-ai-chip-purchases-200667063','Nvidia Faces Structural Threat as China Halts AI Chip Purchases','China\'s Cyberspace Administration has instructed major tech firms to stop purchasing Nvidia\'s AI processors, signaling an escalation in Beijing\'s efforts to reduce dependence on American semiconductor technology and develop domestic alternatives.','2025-09-17 13:32:00','NEGATIVE',0,'NVDA',1001,NULL),
('1a5cb3bbd7a06010bbef384eff26c7a9815e3a7164ecb3bb5f57780a693ec3fa','https://www.globenewswire.com/news-release/2025/09/19/3153025/28124/en/Solar-Integrated-Construction-Materials-Industry-Trend-Analysis-Report-2025-Market-to-Reach-259-2-Billion-by-2034-Smart-Cities-Eco-Friendly-Demand-Propel-Growth.html','Solar-Integrated Construction Materials Industry Trend Analysis Report 2025: Market to Reach $259.2 Billion by 2034 - Smart Cities & Eco-Friendly Demand Propel Growth','The global solar-integrated construction materials market is projected to grow from $90.2 billion in 2024 to $259.2 billion by 2034, driven by sustainable development goals, smart city initiatives, and increasing demand for energy-efficient building solutions.','2025-09-19 08:58:00','POSITIVE',0,'TSLA',1009,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('1b6c44a8a4f4fe0499f3c168c864e4f8e02daa4420c9d5c9bcb0fee4b05792eb','https://www.benzinga.com/markets/large-cap/25/09/47801834/european-advisory-panel-recommends-two-astrazeneca-drugs-for-approval','European Advisory Panel Recommends Two AstraZeneca Drugs For Approval','European Medicines Agency\'s Committee recommended approval for two AstraZeneca drugs: Tezspire for chronic rhinosinusitis with nasal polyps and Koselugo for symptomatic, inoperable plexiform neurofibromas in NF1 patients.','2025-09-22 18:20:56','POSITIVE',0,'AZN',1017,'https://cdn.benzinga.com/files/images/story/2025/09/22/Konskie--Poland---January-03--2024-Astra.jpeg?width=1200&height=800&fit=crop'),
('1baa7c0c96fff8c58a034e259cc7b4ba3bcb7853c3fc6d4bb5fb5b5d67b22516','https://www.globenewswire.com/news-release/2025/09/17/3151975/19933/nl/Lloyds-Banking-Group-breidt-strategisch-partnerschap-met-Broadcom-uit-om-digitale-transformatie-te-versnellen.html','Lloyds Banking Group breidt strategisch partnerschap met Broadcom uit om digitale transformatie te versnellen','Lloyds Banking Group has expanded its strategic partnership with Broadcom to enhance digital infrastructure, implementing VMware Cloud Foundation and mainframe solutions to improve service delivery and technological capabilities.','2025-09-17 18:56:00','POSITIVE',0,'AVGO',1007,NULL),
('20251e9735fe79a6b819956e162ef26e5db090dfa00882ca3311f8c695f15f74','https://www.fool.com/investing/2025/09/17/is-bigbearai-stock-a-buy-now/?source=iedfolrf0000001','Is BigBear.ai Stock a Buy Now?','BigBear.ai\'s stock has surged 275% in 12 months, but the company faces significant challenges including declining revenue, lack of profitability, and inconsistent gross margins, making it a risky investment at present.','2025-09-17 10:15:00','NEUTRAL',0,'PLTR',1012,NULL),
('20cfc7f7c85ca064ded02fd639e1f28fb53b9370fadd50821b59dd7e81a07a11','https://www.investing.com/analysis/nvidia-100b-openai-deal-reinforces-its-role-as-the-core-ai-infrastructure-provid-200667372','Nvidia: $100B OpenAI Deal Reinforces Its Role as the Core AI Infrastructure Provid','Nvidia announced a $100 billion partnership with OpenAI to build AI infrastructure, investing in 10 gigawatts of NVIDIA systems to train and run next-generation AI models, with the first phase expected in the second half of 2026.','2025-09-23 19:02:00','POSITIVE',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693','https://www.globenewswire.com/news-release/2025/09/19/3153048/28124/en/Software-Defined-Data-Center-Market-Research-Report-2025-2034-Growth-Accelerates-as-AI-Machine-Learning-and-Cloud-Native-Technologies-Drive-Demand-for-Skilled-Professionals-and-Agi.html','Software-Defined Data Center Market Research Report 2025-2034: Growth Accelerates as AI, Machine Learning, and Cloud-Native Technologies Drive Demand for Skilled Professionals and Agile Solutions','Global Software-Defined Data Center Market projected to grow from $70.6 billion in 2024 to $573.8 billion by 2034, driven by AI, machine learning, and cloud-native technologies, with increasing demand for skilled professionals and agile infrastructure solutions.','2025-09-19 09:39:00','POSITIVE',0,'MSFT',1002,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('24ed7f3b4da753b89521495a38de8185aa990e22e61c7f5b724b2816865f2064','https://www.investing.com/analysis/3-ai-infrastructure-stocks-with-upside-after-the-summer-rally-200667199','3 AI Infrastructure Stocks With Upside After the Summer Rally','The article highlights three AI infrastructure stocks with potential growth: Super Micro Computer, Arista Networks, and Broadcom. These companies provide critical components for AI data center infrastructure, including servers, networking solutions, and specialized chips.','2025-09-19 09:48:00','POSITIVE',0,'AVGO',1007,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('2798caebbbb0a457c11c65c35229acc7d19aad226a2e930fecdf334c91a6f8c2','https://www.fool.com/investing/2025/09/17/why-this-biotech-may-be-growth-powerhouse/?source=iedfolrf0000001','Why This Biotech Company Could Be a Growth Stock Powerhouse','Vertex Pharmaceuticals is a leading biotech company revolutionizing cystic fibrosis treatment and expanding into new therapeutic areas like blood disorders and pain management, with promising drug candidates in development.','2025-09-17 09:10:00','NEUTRAL',0,'META',1005,NULL),
('28308485f7ea695c83cb0b06324401ea83db5cc016152706aa0759f661b75733','https://www.fool.com/investing/2025/09/17/cryptocurrencies-that-will-benefit-from-rate-cut/?source=iedfolrf0000001','3 Cryptocurrencies That Will Benefit From a Rate Cut','As interest rates potentially decline in 2024-2025, three cryptocurrencies - Bitcoin, Dogecoin, and XRP - are expected to see price increases due to various market catalysts including ETF approvals, reduced mining rewards, and regulatory changes.','2025-09-17 10:10:00','NEUTRAL',0,'TSLA',1009,NULL),
('312af6caca36655b687353a9a8bde46aa15783d83766110fafc76f16cda4df0a','https://www.fool.com/investing/2025/09/17/dia-is-1-of-the-leading-blue-chip-etfs-in-2025-h/?source=iedfolrf0000001','The SPDR Dow Jones Industrial Average ETF Trust Is 1 of the Leading Blue Chip ETFs in 2025. Here\'s Why.','The SPDR Dow Jones Industrial Average ETF (DIA) is highlighted as a top blue chip ETF offering diversified exposure across multiple sectors, with stable, dividend-paying companies and better diversification compared to other market indexes.','2025-09-17 12:18:00','NEUTRAL',0,'MSFT',1002,NULL),
('33c2aeeac73f2eb4c9775cab84631370a642302ba77654dab482e31b11dd869b','https://www.fool.com/investing/2025/09/17/best-artificial-intelligence-ai-stock-to-buy-now-n/?source=iedfolrf0000001','Best Artificial Intelligence (AI) Stock to Buy Now: Nvidia or Palantir?','The article compares Nvidia and Palantir as AI investment opportunities, analyzing their business models, growth potential, and stock valuations. The author concludes that Nvidia is the better investment due to more reasonable valuation and stronger growth prospects.','2025-09-17 09:30:00','NEUTRAL',0,'PLTR',1012,NULL),
('37c2b9de10fc61ebada8152124878c08763fe31025f9c9fb6572e0f0ab3263b9','https://www.globenewswire.com/news-release/2025/09/17/3151820/0/en/Just-Released-From-Palmetto-Publishing-Children-s-Picture-Book-THE-UNICORN-THAT-DIDN-T-BELIEVE-Inspires-with-Tale-of-Self-Discovery.html','Just Released From Palmetto Publishing: Children’s Picture Book THE UNICORN THAT DIDN’T BELIEVE Inspires with Tale of Self-Discovery','A children\'s picture book about a gender-neutral unicorn named Sammy who struggles with self-acceptance and embarks on a journey of self-discovery, learning to believe in themselves despite not having a full horn.','2025-09-17 15:00:00','NEUTRAL',0,'AMZN',1004,NULL),
('387a855bfc059d361765a6b54801c06f604545d7f723265f0b153d5e1442e140','https://www.globenewswire.com/news-release/2025/09/17/3151975/19933/fr/Lloyds-Banking-Group-d%C3%A9veloppe-son-partenariat-strat%C3%A9gique-avec-Broadcom-en-vue-d-acc%C3%A9l%C3%A9rer-la-transformation-num%C3%A9rique.html','Lloyds Banking Group développe son partenariat stratégique avec Broadcom en vue d’accélérer la transformation numérique','Lloyds Banking Group has expanded its partnership with Broadcom to modernize its digital infrastructure, deploying VMware Cloud Foundation and mainframe solutions to enhance digital banking services and operational efficiency.','2025-09-17 18:56:00','POSITIVE',0,'AVGO',1007,NULL),
('3c616b391e050d9b6542b90f2c8ba7690e953dc88c0e8dbacb7d27daf08dceef','https://www.benzinga.com/markets/tech/25/09/47757923/larry-ellison-topples-elon-musk-as-worlds-richest-then-loses-34-billion-in-days-as-oracle-openai-dea','Larry Ellison Topples Elon Musk As World\'s Richest, Then Loses $34 Billion In Days As Oracle-OpenAI Deal Sparks Market Doubts','Larry Ellison briefly became the world\'s richest person after Oracle\'s strong earnings, but lost $34 billion due to market skepticism about the $300 billion OpenAI deal, with concerns about OpenAI\'s financial ability to honor the agreement.','2025-09-19 10:34:20','NEUTRAL',0,'TSLA',1009,'https://cdn.benzinga.com/files/images/story/2025/09/19/San-Francisco--Ca--Sept-30--2012---Ceo-O.jpeg?width=1200&height=800&fit=crop'),
('3ccd7df7be0e17749d5bd3e3876bd1ee4a9e74a4cab544ad786ba8dd667c80b8','https://www.globenewswire.com/news-release/2025/09/19/3153188/0/en/Cloudastructure-Launches-MotionGi-to-Redefine-Video-Processing-Efficiency.html','Cloudastructure Launches MotionGi to Redefine Video Processing Efficiency','Cloudastructure introduced MotionGi, an innovative video processing technology for Cloud Video Recorders that reduces bandwidth requirements by up to 50%, enables more cameras per unit, and lowers deployment costs while improving video quality.','2025-09-19 13:00:00','NEUTRAL',0,'NVDA',1001,'https://ml.globenewswire.com/Resource/Download/56e1765a-0a47-4e4b-ae9e-69893dd9e35d'),
('3f2adf439810192ccd637787badd8db2e2c08d7cabd7cf1c2fd7b643036cc64e','https://www.fool.com/investing/2025/09/17/1-unstoppable-stock-that-could-join-nvidia-microso/?source=iedfolrf0000001','1 Unstoppable Stock That Could Join Nvidia Microsoft and Apple in the $2 Trillion Club by 2028','Taiwan Semiconductor Manufacturing (TSMC) is positioned to potentially reach a $2 trillion market cap by 2028, driven by its dominant 70% global foundry market share and critical role in advanced chip manufacturing for tech giants.','2025-09-17 08:30:00','POSITIVE',0,'MSFT',1002,NULL),
('41f39f0a27fb7561ecd3cae8e5ee08427d0c29c7498933d2c6cb3fe5354b957c','https://www.benzinga.com/trading-ideas/long-ideas/25/09/47725923/tesla-cybertruck-underperformed-in-the-us-will-the-international-launch-be-different','Tesla Cybertruck Underperformed In The US: Will The International Launch Be Different?','Tesla\'s Cybertruck has struggled in the US market, selling far below its projected 250,000 annual capacity. The company is now expanding to international markets like South Korea and the Middle East, hoping to revive interest in the electric pickup truck.','2025-09-17 19:50:49','NEGATIVE',0,'TSLA',1009,NULL),
('42c7f8649d1cebb19c08266b7c18eb23e43a4acd7668c09df46c38674b24776f','https://www.fool.com/investing/2025/09/17/as-of-2025-the-average-social-security-retirement/?source=iedfolrf0000001','As of 2025, the Average Social Security Retirement Benefit Check is $1,976. Could ASML Help Boost Your Retirement?','ASML is a leading semiconductor equipment manufacturer specializing in extreme ultraviolet lithography technology, with near-monopoly market share. Despite current market challenges, the company is positioned to benefit from growing AI and chip technology demands, particularly with its advanced high-NA EUV machines.','2025-09-17 11:15:00','POSITIVE',0,'ASML',1013,NULL),
('4416856d506306d2226f86c871be93b909808f518cf97311b0bc685b05278c8a','https://www.globenewswire.com/news-release/2025/09/22/3154090/0/en/Non-alcoholic-Steatohepatitis-Treatment-Market-Booms-at-28-14-CAGR-by-2034.html','Non-alcoholic Steatohepatitis Treatment Market Booms at 28.14% CAGR by 2034','The global non-alcoholic steatohepatitis (NASH) treatment market is projected to grow from $7.75 billion in 2024 to $92.5 billion by 2034, driven by increasing obesity, diabetes, and metabolic disorders, with significant market expansion expected in North America and Asia-Pacific regions.','2025-09-22 15:00:00','NEUTRAL',0,'AZN',1017,'https://ml.globenewswire.com/Resource/Download/01eb1f79-0c67-420b-b423-376619f975cd'),
('471bdb343858a8a20321d430806f91e7fd26be39ef5f938989800ea0cae1ddc4','https://www.globenewswire.com/news-release/2025/09/22/3153696/28124/en/U-S-Home-Services-Market-Dashboard-Q2-2025-Edition-Product-Adoption-Spending-Intentions-and-Churn.html','U.S. Home Services Market Dashboard, Q2 2025 Edition: Product Adoption, Spending Intentions, and Churn','A comprehensive market research report analyzing U.S. home services market trends, focusing on product adoption, spending intentions, and consumer insights for communication service providers.','2025-09-22 08:43:00','NEUTRAL',0,'TMUS',1014,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('482324c33ac92aa26d2731a8a6ae4b6171d5342736e264b600ea62d8f82ef488','https://www.benzinga.com/markets/tech/25/09/47807001/nvidia-pledges-100-billion-to-supercharge-openai-this-is-a-giant-project-huang-says','Nvidia Pledges $100 Billion To Supercharge OpenAI: \'This Is A Giant Project,\' Huang Says','Nvidia and OpenAI announced a massive infrastructure deal to deploy 10 gigawatts of AI systems, with Nvidia investing up to $100 billion in the project, expected to launch in late 2026.','2025-09-22 20:43:58','POSITIVE',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/22/Jensen-Huang-Nvidias-Founder--President-.jpeg?width=1200&height=800&fit=crop'),
('4a0009bb4ce1d9f81a82abea1a41c7422fc20e81a9961446c7d60aa730f87150','https://www.benzinga.com/pressreleases/25/09/n47712269/advancing-cancer-research-brings-new-hope-for-patients-worldwide','Advancing Cancer Research Brings New Hope for Patients Worldwide','Oncotelic Therapeutics is developing innovative RNA-based and nanomedicine therapies to address challenging cancers and rare diseases, with a focus on transformative treatments like OT-101 that target critical biological pathways.','2025-09-17 12:30:00','POSITIVE',0,'AZN',1017,NULL),
('4f3ac244730595825139944579f4d2506205876c69e3cd24bbf8d2d77a9fbd6e','https://www.fool.com/investing/2025/09/17/3-top-tech-stocks-to-buy-in-september/?source=iedfolrf0000001','3 Top Tech Stocks to Buy in September','Despite market challenges, three technology stocks - Alphabet, Netflix, and The Trade Desk - show promising growth potential driven by AI, streaming, and digital advertising trends.','2025-09-17 08:15:00','POSITIVE',0,'GOOGL',1006,NULL),
('4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092','https://www.investing.com/analysis/sp-500-key-weekly-levels-and-price-targets-200667287','S&P 500: Key Weekly Levels and Price Targets','The article provides an overview of S&P 500 futures, highlighting key technical developments and potential trading zones for the upcoming week, with a focus on market movements and strategic price targets.','2025-09-22 13:27:00','NEUTRAL',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('51e026ff32e3d7a40d2d3e5fc33ab302f46f0deab170d934788675090805e2bf','https://www.benzinga.com/markets/tech/25/09/47763558/nvidia-intel-deal-implications-amd-arm-synopsis-analysts','Nvidia And Intel Just Changed The AI Game—And The Pressure on AMD And ARM Is Rising','Nvidia invested $5 billion in Intel, forming a strategic partnership to co-develop custom AI chips for data centers and PCs, potentially disrupting the semiconductor landscape and challenging competitors.','2025-09-19 14:36:55','POSITIVE',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/19/Nvidia-Expands-Global-AI-Footprint.jpeg?width=1200&height=800&fit=crop'),
('53f543b66f26a2bff101d1e65b73a4f6ce35c2201eb5ba5b8b7f067baedb2719','https://www.globenewswire.com/news-release/2025/09/17/3151975/19933/de/Lloyds-Banking-Group-weitet-strategische-Partnerschaft-mit-Broadcom-zur-Beschleunigung-der-digitalen-Transformation-aus.html','Lloyds Banking Group weitet strategische Partnerschaft mit Broadcom zur Beschleunigung der digitalen Transformation aus','Lloyds Banking Group has expanded its partnership with Broadcom to modernize its technology infrastructure, implementing VMware Cloud Foundation and mainframe solutions to enhance digital banking services for its 28 million customers.','2025-09-17 18:56:00','POSITIVE',0,'AVGO',1007,NULL),
('56040b170cb7d3b39ac5a8a34419c0326ae463ee1122e841aa3eaafc3d6afe74','https://www.benzinga.com/markets/economic-data/25/09/47726901/tech-stocks-reactions-fed-jerome-powell-speech-interest-rates','Tech Stocks Surge As Fed Cuts Rates, Powell Signals More Easing Ahead','The Federal Reserve cut interest rates by 25 basis points, signaling potential future rate reductions due to labor market softening. Fed Chair Powell emphasized the move as a \'risk management cut\' while maintaining commitment to controlling inflation.','2025-09-17 20:21:43','NEGATIVE',0,'NVDA',1001,NULL),
('563887dbcdea8efd64c82b8290ab40817ceae9c5ec7ceec6081b0eaa3b71049f','https://www.fool.com/investing/2025/09/17/monster-stock-that-continues-to-crush-the-market/?source=iedfolrf0000001','Meet the Monster Stock That Continues to Crush the Market','Amazon continues to demonstrate strong growth across multiple business segments, including e-commerce, cloud computing (AWS), and digital advertising, with attractive valuation and ongoing operational efficiencies.','2025-09-17 11:30:00','POSITIVE',0,'AMZN',1004,NULL),
('56614c66d266d2f3fd16f6ef0594013275f6677fa236524cd0208774a8692dc8','https://www.globenewswire.com/news-release/2025/09/17/3151975/19933/it/Lloyds-Banking-Group-estende-la-partnership-strategica-con-Broadcom-per-accelerare-la-trasformazione-digitale.html','Lloyds Banking Group estende la partnership strategica con Broadcom per accelerare la trasformazione digitale','Lloyds Banking Group has expanded its partnership with Broadcom to enhance digital banking infrastructure, implementing VMware Cloud Foundation and mainframe solutions to improve service delivery and technological capabilities.','2025-09-17 18:56:00','POSITIVE',0,'AVGO',1007,NULL),
('588df31d5eb60922da39628593248a8bb25233f6b1425070045acf397de2ae6d','https://www.fool.com/investing/2025/09/17/amazon-just-partnered-with-netflix-heres-what-it/?source=iedfolrf0000001','Amazon Just Partnered With Netflix -- Here\'s What It Means for The Trade Desk Stock','Amazon and Netflix formed a partnership to make Netflix\'s ad-supported inventory available through Amazon\'s demand-side platform, potentially challenging The Trade Desk\'s market position in connected TV advertising.','2025-09-17 10:30:00','POSITIVE',0,'NFLX',1010,NULL),
('591c964df4be1af6f3f9f376ca2403794c5bdca7e1590276777375b1d8c54eab','https://www.investing.com/analysis/oracle-growth-outlook-highlights-metas-cost-challenge-in-ai-infrastructure-200667082','Oracle Growth Outlook Highlights Meta’s Cost Challenge in AI Infrastructure','Oracle projected massive cloud infrastructure revenue growth to $144 billion by 2030, highlighting significant AI infrastructure investment. This outlook reveals potential cost challenges for hyperscalers like Meta, Amazon, and Google in AI development.','2025-09-17 19:23:00','NEUTRAL',0,'AMZN',1004,NULL),
('5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41c','https://www.investing.com/analysis/feds-risk-management-cut-sparks-confusion-amid-mixed-signals-200667278','Fed’s ‘Risk Management Cut’ Sparks Confusion Amid Mixed Signals','The Federal Reserve cut interest rates from 4.25-4.50% to 4.00-4.25%, with Chair Powell describing it as a \'risk management cut\' due to potential labor market weakening. The decision passed with broad consensus, with projections suggesting potentially two additional rate cuts this year.','2025-09-22 12:20:00','NEUTRAL',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('5c0188a85382e30f6605aa6941164f05ca9663b27dcaa87415b7b0e20b42f150','https://www.globenewswire.com/news-release/2025/09/17/3151927/0/en/Trapped-By-Love-Freed-By-Courage-One-Woman-s-Escape-From-The-Unthinkable.html','Trapped By Love, Freed By Courage: One Woman’s Escape From The Unthinkable','Joan Grey\'s memoir reveals her traumatic experience of emotional abuse by her therapist-turned-husband, exposing the hidden epidemic of therapy abuse and her journey from victimhood to empowerment.','2025-09-17 17:00:00','NEUTRAL',0,'AMZN',1004,NULL),
('61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46d','https://www.globenewswire.com/news-release/2025/09/23/3155040/0/en/ELD-Asset-Management-Oracle-s-AI-Surge-Boosts-Stock.html','ELD Asset Management: Oracle’s AI Surge Boosts Stock','Oracle reported strong Q1 FY2026 cloud revenue growth of 27%, with cloud infrastructure revenue rising 54%. A significant multi-year OpenAI contract worth approximately $300 billion is driving infrastructure investments and future growth potential.','2025-09-23 17:53:00','POSITIVE',0,'NVDA',1001,'https://ml.globenewswire.com/Resource/Download/37596f51-3a5e-45bd-bbbe-f860e3e2d8b0'),
('656e3b8c317f0f0c22761e9f786c5c3f94eadd6b97ac8c24e390eba0acf4f9f3','https://www.benzinga.com/markets/equities/25/09/47812582/stock-market-today-nasdaq-futures-rise-sp-500-slips-amid-mixed-trade-kenvue-micron-tech-nvidia-i','Stock Market Today: Dow Futures Rise, Nasdaq, S&P 500 Slip Amid Mixed Trade—Kenvue, Micron Tech, Nvidia In Focus (UPDATED)','U.S. stock futures fluctuated on Tuesday following Monday\'s record advances, with investors anticipating Federal Reserve Chair Jerome Powell\'s monetary policy speech and potential interest rate cuts in October.','2025-09-23 12:44:45','NEUTRAL',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/23/Wall-Street.jpeg?width=1200&height=800&fit=crop'),
('67a104c0be90b7e62ec7692a79101591a6d404d0d9a7e1f14596a27cbb9afa96','https://www.globenewswire.com/news-release/2025/09/23/3154923/0/en/Via-Automation-Debuts-Agentic-AI-Based-Platforms-for-Smart-Manufacturing-at-SEMICON-West.html','Via Automation Debuts Agentic AI-Based Platforms for Smart Manufacturing at SEMICON West','Via Automation launched Via Connect and Via Co-Pilot, AI platforms designed to revolutionize semiconductor manufacturing by reducing equipment downtime, optimizing operations, and enabling predictive maintenance through advanced data integration and AI-driven insights.','2025-09-23 15:00:00','NEUTRAL',0,'MSFT',1002,'https://ml.globenewswire.com/Resource/Download/cfa6cc72-d105-43a6-bada-4b535c38de30'),
('6b1d43be623c6eef2f7758d36891a234a8c7f8a931e4308ebc63baf33802ec53','https://www.globenewswire.com/news-release/2025/09/17/3151596/0/en/Global-Notebook-Shipments-to-Grow-2-2-in-2025-as-Southeast-Asia-Production-Capacity-Expands-Says-TrendForce.html','Global Notebook Shipments to Grow 2.2% in 2025 as Southeast Asia Production Capacity Expands, Says TrendForce','Despite geopolitical challenges, global notebook shipments are expected to grow 2.2% in 2025, driven by production capacity expansion in Southeast Asia, particularly in Vietnam and Thailand, with localized manufacturing strategies helping mitigate trade risks.','2025-09-17 12:00:00','POSITIVE',0,'AAPL',1003,NULL),
('6c7a46592e17892afc3ec9396eeef021a62a35d21c5d63723b9d0cfde25fb00c','https://www.benzinga.com/markets/equities/25/09/47757554/stock-market-today-sp-500-nasdaq-futures-mixed-ahead-of-trump-xi-call-fedex-moneyhero-lennar-in-','Stock Market Today: Dow, S&P 500 Futures Rise Ahead Of Trump-Xi Call— FedEx, MoneyHero, Lennar In Focus (UPDATED)','U.S. stock futures were mixed on Friday, with investors awaiting a phone call between President Trump and Chinese President Xi Jinping. The market showed positive momentum following the Federal Reserve\'s rate cut signals, with tech stocks leading gains.','2025-09-19 12:28:34','NEUTRAL',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/19/Wall-Street.jpeg?width=1200&height=800&fit=crop'),
('6e5019b305a77a1905ce1b105c4ce0d7b4a5cfddc52c16015713b9d45cd3c2f8','https://www.benzinga.com/markets/equities/25/09/47774208/wall-street-record-highs-fed-interest-rates-intel-nvidia','Wall Street Tops Record Highs As Fed Cuts Rates, Signals More Ahead: This Week In Markets','The Federal Reserve cut interest rates by 25 basis points, signaling potential future reductions. Wall Street indices reached record highs, with notable movements in tech and automotive stocks.','2025-09-19 20:17:20','POSITIVE',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/19/fed-ai8.png?width=1200&height=800&fit=crop'),
('759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3e','https://www.investing.com/analysis/governments-pour-billions-into-chips-and-ai-infrastructure-to-fuel-arms-race-200667306','Governments Pour Billions Into Chips and AI Infrastructure to Fuel Arms Race','Governments worldwide are investing billions in semiconductor and AI infrastructure, viewing compute power as a critical strategic resource. Tech giants are spending massive amounts on data centers and AI technology, with significant implications for economic and military competitiveness.','2025-09-22 20:15:00','POSITIVE',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('7a600fae1de86ce580a947d2d85fdae323eebcfa654489b14eff41c353f99f20','https://www.investing.com/analysis/this-stock-quietly-benefits-from-oracle-and-nvidias-ai-surge-200667070','This Stock Quietly Benefits From Oracle and Nvidia’s AI Surge','Taiwan Semiconductor Manufacturing (TSMC) is positioned to benefit from the AI boom, serving as a critical chip manufacturer for Oracle and Nvidia\'s cloud and AI infrastructure expansion.','2025-09-17 14:44:00','POSITIVE',0,'NVDA',1001,NULL),
('7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4d','https://www.investing.com/analysis/could-forward-earnings-and-fed-cuts-spark-a-1999style-rally-200667251','S&P 500: Could Forward Earnings and Fed Cuts Spark a 1999-Style Rally?','The stock market is experiencing record highs driven by better-than-expected earnings and the Fed\'s rate cut. Analysts draw parallels to the 1999 Tech Bubble, suggesting potential for a market rally followed by potential correction.','2025-09-22 15:12:00','NEUTRAL',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('83bafb032fe76705ef6f87669b439942c49d2cf8334d2a4fbd3a1f24e0d6c5bb','https://www.investing.com/analysis/lyft-surges-on-waymo-robotaxi-deal-is-the-stock-a-buy-200667288','Lyft Surges on Waymo Robotaxi Deal: Is the Stock a Buy?','Lyft\'s stock surged over 13% after announcing a partnership with Waymo to launch an autonomous ride-hailing service in Nashville in 2026, signaling potential growth in the robotaxi market.','2025-09-22 14:08:00','NEUTRAL',0,'TSLA',1009,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('86e3b6d8cdef07540e85f18f62057b253e299f927e084a7ee15d9b1ab39f27b0','https://www.investing.com/analysis/workday-rerating-narrative-builds-as-analyst-targets-and-support-levels-align-200667211','Workday Re-Rating Narrative Builds as Analyst Targets and Support Levels Align','Workday is experiencing a potential market rebound with strong analyst support, driven by AI acquisitions, strategic partnerships, and positive financial performance. Analysts forecast up to 25% upside potential and institutional investors like Elliott Management are showing significant interest.','2025-09-19 13:11:00','NEUTRAL',0,'MSFT',1002,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('86f64780039f25594a93d6dbb622702b0bccb82c5b9ececfa98a1d9b4c8aefdc','https://www.benzinga.com/markets/tech/25/09/47729383/trump-makes-chinese-stocks-great-again-until-someone-mentions-tariffs','Trump Makes Chinese Stocks Great Again — Until Someone Mentions Tariffs','Chinese stocks experienced a boost due to optimistic trade negotiations, AI enthusiasm, and potential easing of US-China tensions, with President Trump and Xi Jinping expected to discuss trade and technology issues in an upcoming phone call.','2025-09-17 23:08:36','NEUTRAL',0,'NVDA',1001,NULL),
('8f1cb8ad5bda106b3ec037679904a881ce540c4692714b67c170e3259096a146','https://www.fool.com/investing/2025/09/17/prediction-sp-500-return-2026-index-stocks/?source=iedfolrf0000001','Prediction: The S&P 500 Won\'t Return Anything Close to 10% in 2026','The S&P 500 index is experiencing increased volatility due to heavy concentration in mega-cap growth stocks, with potential for significant returns or losses in 2026 depending on AI investments, interest rates, and tech sector performance.','2025-09-17 08:33:00','NEUTRAL',0,'MSFT',1002,NULL),
('90f87c3e41b26d4a7f5bf3130e0eeebaeda5d8442c9b78aa09983a06c7018355','https://www.investing.com/analysis/3-stocks-to-buy-as-fed-rate-cuts-reshape-the-market-200667228','3 Stocks to Buy as Fed Rate Cuts Reshape the Market','The Federal Reserve lowered interest rates by 0.25%, signaling potential further cuts. The article highlights three stocks positioned to benefit from changing economic conditions: a data center REIT, a telecom company, and an energy corporation.','2025-09-19 18:45:00','POSITIVE',0,'TMUS',1014,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('926bb00b11fdb0f969f09f0d661196ff4b7d48e7b28b4132b1b52a2a6cbb7ddf','https://www.fool.com/investing/2025/09/17/where-will-broadcom-stock-be-in-5-years/?source=iedfolrf0000001','Where Will Broadcom Stock Be in 5 Years?','Broadcom has achieved significant growth in the AI and semiconductor sectors, delivering a 1,070% return over five years by developing custom chips and software solutions for hyperscale data centers and enterprise clients.','2025-09-17 12:30:00','NEUTRAL',0,'AAPL',1003,NULL),
('93081126ce8b9c52715318736f29d8a2a8e774bd5e5fa62e4f0f818b06d26171','https://www.investing.com/analysis/soundhound-ai-factors-to-look-at-before-investing-in-this-hypergrowth-ai-stock-200667209','SoundHound AI: Factors to Look at Before Investing in This Hyper-Growth AI Stock','SoundHound AI, a conversational AI technology company, has experienced significant growth with 217% year-over-year revenue increase in Q2 2025, but faces challenges with profitability, high valuation, and potential cash constraints.','2025-09-19 12:39:00','NEUTRAL',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('94823e986481b9271246d8d1bd4df6fc3c25ca52ab7362c388a50276cd877d06','https://www.benzinga.com/markets/equities/25/09/47713706/top-10-us-stocks-worth-market-capitalization-surpass-china-germany-economies','Nvidia, Microsoft Sit Atop A $23.9 Trillion Empire—More Than China And Germany Combined','Top 10 U.S. stocks have reached a combined market capitalization of $23.9 trillion, surpassing the GDPs of China and Germany. Nvidia leads with a $4.25 trillion market cap, driven by the AI boom, with seven tech giants responsible for over $20 trillion of total value.','2025-09-17 13:21:45','POSITIVE',0,'NVDA',1001,NULL),
('968775bcb4d03572eaedeba0b8282f6e5e26637200485eb8a63513b60a3a20d8','https://www.benzinga.com/news/legal/25/09/47816623/google-fights-antitrust-trial-to-avoid-ad-tech-breakup-too-great-a-risk-says-doj','Google Fights Antitrust Trial To Avoid Ad Tech Breakup: \'Too Great A Risk,\' Says DOJ','Google is facing an antitrust trial where the Department of Justice and state coalition are seeking to force the company to divest its AdX ad exchange and make its auction system open source, potentially reshaping its digital advertising business.','2025-09-23 13:03:38','NEGATIVE',0,'GOOGL',1006,'https://cdn.benzinga.com/files/images/story/2025/09/23/Close-Up-Of-The-Google-Logo-Sign-On-The-.jpeg?width=1200&height=800&fit=crop'),
('980ae49ef95232a86996649bc8600aaee5337f6d837c321919f7f54aaf4c1764','https://www.benzinga.com/news/legal/25/09/47816650/amazon-sues-new-york-state-over-new-labor-law-citing-unconstitutional-power-grab','Amazon Sues New York State Over New Labor Law, Citing \'Unconstitutional Power Grab\'','Amazon filed a lawsuit against New York State\'s Public Employment Relations Board, challenging a new labor law that allows state oversight of union organizing and workplace disputes, which Amazon claims infringes on federal labor authority.','2025-09-23 13:04:46','NEGATIVE',0,'AMZN',1004,'https://cdn.benzinga.com/files/images/story/2025/09/23/Malaga---spain---10-09-2020--Selective-F.jpeg?width=1200&height=800&fit=crop'),
('99cc6952213193b083772b8691813d41b4e52e9686534a25258f7d4070db492a','https://www.globenewswire.com/news-release/2025/09/22/3153695/28124/en/North-American-Streaming-Video-Tracker-Report-August-2025-Edition-Featuring-Roku-Howdy-Fox-Apple-ESPN-NFL-WWE-Nexstar-Tegna.html','North American Streaming Video Tracker Report, August 2025 Edition Featuring Roku, Howdy, Fox, Apple, ESPN, NFL, WWE, Nexstar, Tegna','The August 2025 Streaming Video Tracker report highlights emerging trends in North American OTT services, featuring new streaming launches, strategic partnerships, and the growing use of generative AI in entertainment.','2025-09-22 08:41:00','NEUTRAL',0,'AAPL',1003,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('9c102952112eb78ffbfe24b00c9ed290e75b72f847e2a5adde6b3dbff09f2469','https://www.investing.com/analysis/is-it-time-to-trim-your-positions-in-these-2-ai-stocks-200667053','Is It Time to Trim Your Positions in These 2 AI Stocks?','The article analyzes two AI-related stocks, Palantir and Oracle, suggesting potential risks and volatility in their current market positions due to high valuations, financial metrics, and institutional investor behavior.','2025-09-17 09:38:00','NEGATIVE',0,'PLTR',1012,NULL),
('9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43b','https://www.investing.com/analysis/market-volatility-suppressed-ahead-of-opex-as-liquidity-drain-continues-200667171','Market Volatility Suppressed Ahead of OPEX as Liquidity Drain Continues','Market volatility remains low ahead of options expiration (OPEX), with suppressed trading activity and declining liquidity. Analysts note low realized volatility and potential market shifts after today\'s options expiration.','2025-09-19 06:50:00','POSITIVE',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('a107b587a3717719f7c4fc31fb0a564d37b6ea8d24230c6113f4206354d06b08','https://www.fool.com/investing/2025/09/17/1-reason-wall-street-is-obsessed-with-nvidia/?source=iedfolrf0000001','1 Reason Wall Street Is Obsessed With Nvidia\'s Stock','Nvidia has emerged as a critical player in AI infrastructure, providing essential GPUs for major tech companies and experiencing significant revenue growth, with data center revenue increasing 56% year-over-year to $41.1 billion.','2025-09-17 10:15:00','NEUTRAL',0,'MSFT',1002,NULL),
('a109b0746bb3af4a5d66e02de92075e8cb37dd0ad1c03ecd480537733a7f669f','https://www.fool.com/investing/2025/09/17/1-index-fund-to-buy-turn-500-into-474400-ai-stocks/?source=iedfolrf0000001','1 Vanguard Index Fund to Buy That Could Turn $500 per Month Into $474,400 With Help From Popular AI Stocks','The Vanguard Growth ETF offers significant exposure to technology and AI stocks, with a strong historical performance of 1,003% over two decades. The fund is heavily weighted towards tech companies with promising AI potential and projected earnings growth.','2025-09-17 08:12:00','POSITIVE',0,'MSFT',1002,NULL),
('a3127f7ad3a5d2ae41a28754b3cc6480a7f89779bfcbd0f88081306298ef6740','https://www.globenewswire.com/news-release/2025/09/19/3153065/28124/en/EV-Platform-Market-Trend-Analysis-Report-2025-2034-Modular-Systems-and-AI-Drive-Next-Gen-Mobility-China-Leads-with-69-Share.html','EV Platform Market Trend Analysis Report 2025-2034: Modular Systems and AI Drive Next-Gen Mobility; China Leads with 69% Share','Global EV platform market projected to grow from $16.5 billion in 2024 to $96 billion by 2034, with China leading at 69% market share. Modular systems, AI, and sustainable mobility are driving innovation in electric vehicle platforms.','2025-09-19 10:44:00','POSITIVE',0,'TSLA',1009,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('a3eed22280bf0e2fe2c2ee7838b18b7b45412a5b811949108bca12707392b2d5','https://www.investing.com/analysis/if-2026-is-2008-redux-youll-want-to-own-this-84-dividend-200667269','If 2026 Is 2008 Redux, You’ll Want to Own This 8.4% Dividend','The article discusses the significant rise in US housing market value and suggests investing in Real Estate Investment Trusts (REITs) as a hedge against potential market volatility, specifically recommending the Nuveen Real Estate Fund (JRS) with an 8.4% dividend yield.','2025-09-22 10:02:00','POSITIVE',0,'MSFT',1002,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('a44e2a33e2e60c7c055e9ca35523dd6b44dcaf4c0612750274c89230a04ef304','https://www.investing.com/analysis/smci-valuation-leaves-room-for-strategic-investment-plays-200667371','SMCI Valuation Leaves Room for Strategic Investment Plays','Super Micro Computer (SMCI) is strategically positioned in the AI infrastructure market, with potential for strategic investment due to its critical cooling technologies and power systems for data centers, especially in collaboration with NVIDIA.','2025-09-23 19:50:00','POSITIVE',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('a4d6e93ea405d14746fe25c57b0493f66d2db03e60c677c18d32dfdfe1c6cf3e','https://www.benzinga.com/markets/equities/25/09/47783091/stock-market-today-dow-nasdaq-100-futures-slip-after-a-stellar-week-fox-oracle-dell-in-focus-on-','Stock Market Today: Dow, Nasdaq 100 Futures Slip After A Stellar Week—Fox, Oracle, Dell In Focus On TikTok Investment','U.S. stock futures declined on Monday following a positive week, with focus on potential TikTok ownership transfer involving Fox, Oracle, and Dell. The market anticipates Federal Reserve interest rate decisions amid mixed economic signals.','2025-09-22 09:43:30','POSITIVE',0,'AAPL',1003,'https://cdn.benzinga.com/files/images/story/2025/09/22/Wall-Street.jpeg?width=1200&height=800&fit=crop'),
('a60a8752e758a0cf995d70fcf19ad60d2be830c45bbd2e6588b4fef002845f7b','https://www.globenewswire.com/news-release/2025/09/23/3154920/0/en/GoGuardian-Launches-Merge-Classrooms-Streamlining-Classroom-Management-for-Educators.html','GoGuardian Launches Merge Classrooms, Streamlining Classroom Management for Educators','GoGuardian Teacher introduces a new \'merge classrooms\' feature that allows educators to combine up to five classes into one session, simplifying digital teaching workflows and saving instructional time.','2025-09-23 14:48:00','NEUTRAL',0,'GOOGL',1006,'https://ml.globenewswire.com/Resource/Download/cff9116e-2882-4a4d-8fc0-fefebbb382dd'),
('a70d6cdec4b494ef961909fcc957e88b0659932ebdd50c5b5f1b264d923085e9','https://www.investing.com/analysis/coreweave-nvidia-partnership-illustrates-why-ai-picksandshovels-matter-most-200667085','CoreWeave: Nvidia Partnership Illustrates Why AI Picks-and-Shovels Matter Most','CoreWeave secured a landmark $6.3 billion deal with Nvidia, positioning itself as a critical infrastructure provider in the AI ecosystem by building specialized data centers for advanced GPU deployment.','2025-09-17 19:06:00','POSITIVE',0,'NVDA',1001,NULL),
('b2c2a6342ba143587a1dc39580152f88ef278d8aa605b21e3c33509b0185a5b1','https://www.investing.com/analysis/crowdstrike-stock-set-for-breakout-as-agentic-ai-demand-surges-200667074','CrowdStrike Stock Set for Breakout as Agentic AI Demand Surges','CrowdStrike is positioned for potential growth through strategic AI cybersecurity partnerships with Salesforce and NVIDIA, focusing on agentic AI security and governance.','2025-09-17 15:17:00','POSITIVE',0,'NVDA',1001,NULL),
('b59277ac6385407d2a35d0b1a23167c21b6607c4b8e3b974e86a07e4415f383e','https://www.fool.com/investing/2025/09/17/5-autonomous-driving-stocks-not-named-tesla-you-ne/?source=iedfolrf0000001','5 Autonomous Driving Stocks (Not Named Tesla) You Need to Know About','The autonomous driving market is expanding with multiple companies competing for leadership, including Tesla and Waymo, with significant potential for growth in artificial intelligence and electric vehicle technologies.','2025-09-17 11:15:00','NEUTRAL',0,'GOOGL',1006,NULL),
('b63780fd255ec5ab860a24e7d9e70c2772ae45c1772adc72cdf4f43d7a347551','https://www.fool.com/investing/2025/09/17/ai-needs-babysitters-these-stocks-are-cashing-in/?source=iedfolrf0000001','AI Needs Babysitters, and These Stocks Are Cashing In','Despite fears of AI replacing human workers, experts argue that AI tools still require significant human supervision and expertise, particularly in nuanced fields like translation and content creation.','2025-09-17 11:27:00','POSITIVE',0,'GOOGL',1006,NULL),
('b6fd39cb9714f0f09c38f062ba12a30457e3c59825a616abd735541c9ddfeb0a','https://www.benzinga.com/markets/commodities/25/09/47709943/us-to-set-5-billion-critical-minerals-fund','US To Set $5 Billion Critical Minerals Fund','The United States is launching a $5 billion fund through the U.S. International Development Finance Corporation and Orion Resource Partners to secure critical mineral supplies and reduce dependence on Chinese-controlled supply chains.','2025-09-17 10:11:12','NEUTRAL',0,'TSLA',1009,NULL),
('b7bde3d0b49cbb64165bbaaac7d5c24569a95f0434acb74e17a1ada7b2573d96','https://www.globenewswire.com/news-release/2025/09/19/3153230/0/en/Automotive-Rubber-Molded-Component-Market-Worth-USD-84-04-Bn-by-2034.html','Automotive Rubber-Molded Component Market Worth USD 84.04 Bn by 2034','The global automotive rubber-molded component market is expected to grow from $48.87 billion in 2025 to $84.04 billion by 2034, driven by increasing electric vehicle adoption, lightweight material demand, and sustainability trends.','2025-09-19 14:00:00','POSITIVE',0,'TSLA',1009,'https://ml.globenewswire.com/Resource/Download/01eb1f79-0c67-420b-b423-376619f975cd'),
('ba67e13cf02171244ae4df0dd5265c19ecdb3279e0636df9c79d14fae360fb40','https://www.fool.com/investing/2025/09/17/larry-ellison-billionaire-stock-market-investors/?source=iedfolrf0000001','Here\'s Why Larry Ellison Becoming the Richest Billionaire in the World Is Great News for Oracle Stock Investors.','Oracle co-founder Larry Ellison became the world\'s richest person after the company\'s stock surged 36%, driven by an ambitious five-year plan to grow Oracle Cloud Infrastructure from $10 billion to $144 billion in annual revenue.','2025-09-17 11:05:00','NEUTRAL',0,'MSFT',1002,NULL),
('bbf40dd3a347dbc7b9c3b6ebb31e91db8a9d8133f8861b54e49faa20af9a50da','https://www.benzinga.com/pressreleases/25/09/n47713635/audiocodes-expands-voice-cpaas-offering-with-ai-agents','AudioCodes Expands Voice CPaaS Offering with AI Agents','AudioCodes has launched AI Agents, a new module for its Live Hub Voice CPaaS platform, enabling enterprises to build and integrate LLM-powered voice bots into existing telephony systems to improve customer support and reduce operational costs.','2025-09-17 13:17:00','NEUTRAL',0,'MSFT',1002,NULL),
('c282827a99f11db63109d237d4ac9308d48b05a4147f9c7505dfb46c67496dfd','https://www.fool.com/investing/2025/09/17/billionaire-david-tepper-buy-3-trillion-ai-stocks/?source=iedfolrf0000001','Billionaire David Tepper of Appaloosa Is Buying 3 Trillion-Dollar Artificial Intelligence (AI) Stocks and Selling 3 Others','Billionaire investor David Tepper is strategically repositioning his portfolio, buying stakes in Nvidia, Taiwan Semiconductor Manufacturing, and Amazon Web Services while selling positions in Meta, Alphabet, and Broadcom during the second quarter.','2025-09-17 07:06:00','NEUTRAL',0,'META',1005,NULL),
('c32095bdb41c9724a3ae10eb11409a0a077016c5797410bde00783a8c8a5ccb7','https://www.fool.com/investing/2025/09/17/rate-cuts-are-coming-these-are-the-4-stocks-im-buy/?source=iedfolrf0000001','Rate Cuts Are Coming: These Are the 4 Stocks I\'m Buying','The article discusses potential stock market movements following Federal Reserve rate cuts and highlights performance of AI cloud stocks, with specific focus on emerging technology companies.','2025-09-17 12:30:00','POSITIVE',0,'MSFT',1002,NULL),
('c3d701e64a3d948a88030281057b14d169b664c499eaec31142aadf81c461f75','https://www.investing.com/analysis/the-fed-cut-rates-what-now-for-the-sp-500-and-equity-markets-200667206','The Fed Cut Rates: What Now for the S&P 500 and Equity Markets?','The Federal Reserve has announced interest rate cuts, potentially reducing rates by 100 basis points between September 2025 and mid-2026. This move is expected to positively impact the S&P 500, tech sector, and potentially stimulate consumer spending and housing markets.','2025-09-19 12:23:00','POSITIVE',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('c6028bcacabebded122d6d64e2b149ff4b0bfb45e667cc200d36f73349ac2230','https://www.globenewswire.com/news-release/2025/09/23/3155112/0/en/DATE-to-spotlight-Saudi-Arabia-s-Vision-2030-digital-transformation-at-Riyadh-s-global-tech-summit.html','DATE to spotlight Saudi Arabia’s Vision 2030 digital transformation at Riyadh’s global tech summit','Riyadh will host the Digital Acceleration & Transformation Expo (DATE) on 8-9 December, bringing together 2,000+ government officials, investors, and tech leaders to showcase advancements in digital technologies and support Saudi Arabia\'s Vision 2030 digital agenda.','2025-09-23 20:56:00','POSITIVE',0,'NVDA',1001,'https://ml-eu.globenewswire.com/Resource/Download/2c7388d5-68be-40a3-98bc-ec5c1bb8a85f'),
('cd3bad8cd98207fe2e4e44175d63680c073a9b5ad9ac41eeccd5bfe16c534493','https://www.benzinga.com/markets/tech/25/09/47756856/white-house-ai-czar-david-sacks-warns-washington-must-let-us-chipmakers-like-nvidia-sell-abroad-or-r','White House AI Czar David Sacks Warns Washington Must Let US Chipmakers Like Nvidia Sell Abroad Or Risk Forfeiting AI Race To Huawei And China','White House AI czar David Sacks urged Washington to update export control policies, warning that restricting US chipmakers from selling abroad could help Chinese companies like Huawei gain an advantage in the global AI technology race.','2025-09-19 09:09:16','NEUTRAL',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/19/Nvidia-Corporation.jpeg?width=1200&height=800&fit=crop'),
('cdbdde315385ca59b4891d1c796dc5a73957209621df249a68e0d9c695f9f62f','https://www.globenewswire.com/news-release/2025/09/22/3154224/0/en/Global-Data-Center-Market-to-Expand-at-10-6-CAGR-from-2025-to-2030.html','Global Data Center Market to Expand at 10.6% CAGR from 2025 to 2030','BCC Research reports the global data center market will grow from $418.2 billion in 2025 to $691.6 billion by 2030, driven by digital transformation, AI, 5G, and cloud computing expansion, with a 10.6% CAGR.','2025-09-22 17:51:00','POSITIVE',0,'AMZN',1004,'https://ml.globenewswire.com/Resource/Download/c6629cf3-8bc7-4bae-9bf7-bd5bef48bb25'),
('ce91b74dd947b8b56e001310fea44cf77ed3002b7159e55936d029db0b2a708f','https://www.investing.com/analysis/sp-500-fed-meeting-sets-stage-for-sellthenews-market-setup-200667027','Fed Meeting Sets Stage for \'Sell-the-News\' Market Setup','The Federal Reserve is expected to implement a 25 basis point rate cut, with markets anticipating a carefully choreographed announcement that could impact dollar valuation, emerging markets, and overall market sentiment.','2025-09-17 08:13:00','NEUTRAL',0,'AAPL',1003,NULL),
('d4a5dbcb142b86af86006f736013ad9d036aee16ae2c922c6dc385556cd5e4e9','https://www.benzinga.com/markets/tech/25/09/47781962/nvidia-greenlights-samsungs-ai-chip-technology-sets-stage-for-hbm4-battle-report','Nvidia Greenlights Samsung\'s AI Chip Technology, Sets Stage For HBM4 Battle: Report','Nvidia has approved Samsung\'s fifth-generation 12-layer HBM3E memory chip after extensive development, marking a significant milestone in AI hardware chip technology. Samsung is now positioned as the third supplier for Nvidia\'s AI accelerator chips, with future competition focused on HBM4 technology.','2025-09-22 07:03:00','POSITIVE',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/22/In-This-Photo-The-Logo-Of-Nvidia-With-Th.jpeg?width=1200&height=800&fit=crop'),
('d51bbae74419b9a4e7430d0efe520de2b22cd40aaf50301211e4ce0d48dd6ae2','https://www.globenewswire.com/news-release/2025/09/22/3154031/0/en/Electric-Vehicle-Motor-Communication-Controller-Market-Worth-USD-3540-67-Mn-by-2034.html','Electric Vehicle Motor Communication Controller Market Worth USD 3540.67 Mn by 2034','The global electric vehicle motor communication controller market is expected to expand from USD 1119.52 million in 2026 to USD 3540.67 million by 2034, with a CAGR of 15.48%. Growth is driven by increasing EV adoption, efficient power management needs, and technological advancements in communication controllers.','2025-09-22 14:00:00','POSITIVE',0,'TSLA',1009,'https://ml.globenewswire.com/Resource/Download/01eb1f79-0c67-420b-b423-376619f975cd'),
('d93920ca4cba0c4610e69853aa187cdec656d9d229dcd78762c22013a4a57bdd','https://www.fool.com/investing/2025/09/17/should-you-buy-costco-before-sept-25/?source=iedfolrf0000001','Should You Buy Costco Before Sept. 25?','Costco continues to demonstrate resilience amid import tariffs, leveraging its membership-based business model and maintaining high customer loyalty. The company has strategies to minimize tariff impacts and has shown consistent revenue and earnings growth.','2025-09-17 08:10:00','POSITIVE',0,'COST',1011,NULL),
('d939cd5debaf86db98be21870c1c640112106406b4ab4cc7dd367c7a93c0caaf','https://www.globenewswire.com/news-release/2025/09/17/3151758/0/en/Small-Cell-Networks-Market-Size-was-Valued-at-USD-90-86-Billion-by-2032-Due-to-the-Surging-Demand-for-Better-Mobile-Coverage-Research-by-SNS-Insider.html','Small Cell Networks Market Size was Valued at USD 90.86 Billion by 2032 Due to the Surging Demand for Better Mobile Coverage | Research by SNS Insider','The small cell networks market is expected to grow from USD 14.29 billion in 2024 to USD 90.86 billion by 2032, driven by 5G network expansion, increasing mobile data demand, and need for better indoor-outdoor connectivity.','2025-09-17 14:00:00','NEUTRAL',0,'CSCO',1015,NULL),
('e40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053','https://www.benzinga.com/news/politics/25/09/47784490/will-elon-musk-join-trump-administration-this-year-heres-what-betting-markets-are-predicting','Will Elon Musk Join Trump Administration This Year? Here\'s What Betting Markets Are Predicting','Betting markets suggest a 7-8% probability of Elon Musk joining the Trump Administration by the end of 2025, following a recent memorial service interaction between Musk and Trump.','2025-09-22 11:14:47','NEUTRAL',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/22/Donald-Trumps-Conversation-With-Elon-Mus.jpeg?width=1200&height=800&fit=crop'),
('e43113d9455570ba3888535164ed55fa34990a262f02b1e2ecc5495d41be6309','https://www.fool.com/investing/2025/09/17/why-lyft-stock-was-climbing-today/?source=iedfolrf0000001','Why Lyft Stock Was Climbing Today','Lyft announced a partnership with Waymo to launch a full autonomous ride-sharing service in Nashville by 2026, leveraging Lyft\'s fleet management capabilities through Flexdrive.','2025-09-17 16:36:25','NEUTRAL',0,'AMZN',1004,NULL),
('e69d5fb1a933eb6e7cabb082faf93fcd3a95816c54bc586f6325519197a8452f','https://www.benzinga.com/markets/large-cap/25/09/47721938/astrazenecas-fasenra-falls-short-in-smokers-lung-trial','AstraZeneca\'s Fasenra Falls Short In Smoker\'s Lung Trial','AstraZeneca reported mixed results in clinical trials: Fasenra did not meet primary endpoint for COPD, while Saphnelo showed significant reduction in lupus disease activity in a Phase 3 trial.','2025-09-17 17:20:31','NEUTRAL',0,'AZN',1017,NULL),
('ec2eafcf6e83d9cac32224ece0e40c4ea4cce59c4189c400b2bc7df4e56053ad','https://www.globenewswire.com/news-release/2025/09/19/3153355/0/en/Global-Quantum-Batteries-Market-to-Surge-with-24-5-CAGR-Through-2030.html','Global Quantum Batteries Market to Surge with 24.5% CAGR Through 2030','BCC Research forecasts the quantum batteries market will grow to $65.4 million by 2030, with a 24.5% CAGR. The market is driven by quantum computing adoption, solar energy demand, electric vehicle growth, and healthcare technology advancements.','2025-09-19 18:43:00','POSITIVE',0,'GOOGL',1006,'https://ml.globenewswire.com/Resource/Download/c6629cf3-8bc7-4bae-9bf7-bd5bef48bb25'),
('f0e6c8e2278be3b3d136039e8262fd388c6454b2cacbfbb34bfc4e497a7ef830','https://www.globenewswire.com/news-release/2025/09/22/3153938/0/en/Verizon-Leads-the-Future-of-Wireless-with-Development-of-New-Industry-6G-Alliance.html','Verizon Leads the Future of Wireless with Development of New Industry 6G Alliance','Verizon launched a 6G Innovation Forum with key technology partners to develop foundational 6G technologies, focusing on AI-enabled connectivity, new spectrum testing, and global standards alignment.','2025-09-22 13:00:00','NEUTRAL',0,'META',1005,'https://ml.globenewswire.com/Resource/Download/2a0c6c7a-3980-4c97-a719-a463817cf3f6'),
('f228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2','https://www.investing.com/analysis/the-investors-paradox-of-uncertainty-and-time-is-this-holding-back-your-returns-200667242','The Investors\' Paradox of Uncertainty and Time: Is This Holding Back Your Returns?','The article explores how market uncertainty can create investment opportunities, highlighting that markets often rise during periods of uncertainty when fundamental conditions are improving, and investors should focus on earnings expectations rather than short-term news.','2025-09-22 06:45:00','NEUTRAL',0,'NVDA',1001,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('fc11943e95ac793bc2bdc8b9759374a2ce59dc087104baeb37e91cfc95f843d2','https://www.investing.com/analysis/asml-on-a-high-where-will-the-rally-lead-200667299','ASML on a High: Where Will the Rally Lead?','Dutch semiconductor specialist ASML has seen impressive stock performance, driven by strong quarterly results, high demand for EUV lithography systems, and a strategic €1.3 billion investment in French AI start-up Mistral AI.','2025-09-22 17:41:00','POSITIVE',0,'ASML',1013,'https://i-invdn-com.investing.com/redesign/images/seo/investingcom_analysis_og.jpg'),
('fcf1a2960ddc18daca057f6ae6406b366efe4951503868837815fea7afdcdfb6','https://www.globenewswire.com/news-release/2025/09/23/3154927/28124/en/Fc-and-Glycoengineered-Antibodies-Market-Report-2025-Antibody-Therapeutics-Surge-with-550-Clinical-Pipeline-Molecules-Fc-Innovations-Leading-the-Charge.html','Fc and Glycoengineered Antibodies Market Report 2025: Antibody Therapeutics Surge with 550+ Clinical Pipeline Molecules - Fc Innovations Leading the Charge','The global Fc and glycoengineered antibodies market is valued at $38.8 billion in 2025, with over 550 clinical pipeline molecules and significant growth potential, particularly in oncological applications.','2025-09-23 14:59:00','POSITIVE',0,'AZN',1017,'https://ml.globenewswire.com/Resource/Download/908fb457-7f8e-4a08-9081-5565e3dfb3d7'),
('fdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918','https://www.globenewswire.com/news-release/2025/09/22/3153939/0/en/Remote-Home-Monitoring-Systems-Market-Projected-at-USD-81-75-Billion-by-2032-Driven-by-Growing-Global-Demand-for-Home-Automation-Solutions-Research-by-SNS-Insider.html','Remote Home Monitoring Systems Market Projected at USD 81.75 Billion by 2032 Driven by Growing Global Demand for Home Automation Solutions | Research by SNS Insider','The global remote home monitoring systems market is expected to grow from USD 28.99 billion in 2024 to USD 81.75 billion by 2032, driven by increasing demand for home automation, healthcare monitoring, and smart security solutions.','2025-09-22 13:00:00','POSITIVE',0,'AAPL',1003,'https://ml.globenewswire.com/Resource/Download/d6272c2e-d204-41b8-b545-a6e2e24f85c2'),
('fdd3a1e9f74825a58dd5129e591c72b55ec8b85438819b0813a250195d3a1ba2','https://www.benzinga.com/trading-ideas/movers/25/09/47824304/nvidia-high-fives-palantir-rocket-lab-on-this-list-of-10-bagger-legends','Nvidia High-Fives Palantir, Rocket Lab — On This List Of \'10-Bagger\' Legends','Ten stocks in the Russell 1000 index have achieved over 1,000% returns since October 2022, driven by AI boom and market recovery, with companies like Nvidia, Palantir, and Rocket Lab leading significant stock gains.','2025-09-23 16:40:29','POSITIVE',0,'NVDA',1001,'https://cdn.benzinga.com/files/images/story/2025/09/23/Green-Bullish-Chart.jpeg?width=1200&height=800&fit=crop'),
('fefcb92e17a908c528c72f522d932bd2107c4e7627e8bf0cbf3987fd2d2dfc2b','https://www.fool.com/investing/2025/09/17/quantum-computings-potential-monster-stocks-of-the/?source=iedfolrf0000001','Meet Quantum Computing\'s Potential Monster Stocks of the Next Decade (Hint: Not IonQ)','The article explores how Nvidia and Alphabet are positioning themselves as leaders in quantum computing, leveraging their advanced AI ecosystems and technological capabilities to potentially dominate the emerging quantum computing landscape.','2025-09-17 14:15:00','POSITIVE',0,'NVDA',1001,NULL),
('ff88c49514878b1cfa41aea7e505c6dd17efdb2840618dd2a0e9537bfe7e27b1','https://www.investing.com/analysis/will-stocks-rally-through-year-two-of-the-fed-cutting-cycle-200667065','Fed Rate Cutting Cycles Show Strong Second-Year Returns — Unless Recession Strikes','The Federal Reserve is expected to cut interest rates, with historical data suggesting strong stock market performance in the second year of rate-cutting cycles, provided a recession is avoided. The outlook depends on economic growth, inflation, and potential geopolitical risks.','2025-09-17 13:03:00','NEUTRAL',0,'NVDA',1001,NULL);
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `news_indicators`
--

DROP TABLE IF EXISTS `news_indicators`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `news_indicators` (
  `Insight_id` char(255) NOT NULL,
  `result` enum('NEGATIVE','NEUTRAL','POSITIVE') NOT NULL COMMENT '결과',
  `date` date NOT NULL COMMENT '날짜',
  `stock_code` char(11) NOT NULL,
  `news_id` char(150) NOT NULL,
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  PRIMARY KEY (`Insight_id`),
  KEY `FK_newsind_stock` (`stock_id`),
  CONSTRAINT `FK_newsind_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news_indicators`
--

LOCK TABLES `news_indicators` WRITE;
/*!40000 ALTER TABLE `news_indicators` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `news_indicators` VALUES
('2025-09-19T06:50:00Z9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43bAAPL','NEUTRAL','2025-09-19','AAPL','9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43b',1003),
('2025-09-19T06:50:00Z9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43bAMZN','NEUTRAL','2025-09-19','AMZN','9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43b',1004),
('2025-09-19T06:50:00Z9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43bNVDA','POSITIVE','2025-09-19','NVDA','9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43b',1001),
('2025-09-19T06:50:00Z9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43bTSLA','NEGATIVE','2025-09-19','TSLA','9c399df40a638b1c08813bf0df70fc368c511f906a34fefe88973bafa290a43b',1009),
('2025-09-19T08:58:00Z1a5cb3bbd7a06010bbef384eff26c7a9815e3a7164ecb3bb5f57780a693ec3faTSLA','POSITIVE','2025-09-19','TSLA','1a5cb3bbd7a06010bbef384eff26c7a9815e3a7164ecb3bb5f57780a693ec3fa',1009),
('2025-09-19T09:09:16Zcd3bad8cd98207fe2e4e44175d63680c073a9b5ad9ac41eeccd5bfe16c534493NVDA','NEUTRAL','2025-09-19','NVDA','cd3bad8cd98207fe2e4e44175d63680c073a9b5ad9ac41eeccd5bfe16c534493',1001),
('2025-09-19T09:39:00Z216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693CSCO','POSITIVE','2025-09-19','CSCO','216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693',1015),
('2025-09-19T09:39:00Z216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693GOOG','POSITIVE','2025-09-19','GOOG','216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693',1008),
('2025-09-19T09:39:00Z216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693GOOGL','POSITIVE','2025-09-19','GOOGL','216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693',1006),
('2025-09-19T09:39:00Z216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693MSFT','POSITIVE','2025-09-19','MSFT','216e9bf64a979529eac6123e13061c9ccf0d961c8e81010343bbbc4ee27f2693',1002),
('2025-09-19T09:48:00Z24ed7f3b4da753b89521495a38de8185aa990e22e61c7f5b724b2816865f2064AVGO','POSITIVE','2025-09-19','AVGO','24ed7f3b4da753b89521495a38de8185aa990e22e61c7f5b724b2816865f2064',1007),
('2025-09-19T10:15:59Z06552fdaf64674fe5484c554a5bc03bedd97ac474701704726095e29a8e0a969TSLA','NEUTRAL','2025-09-19','TSLA','06552fdaf64674fe5484c554a5bc03bedd97ac474701704726095e29a8e0a969',1009),
('2025-09-19T10:34:20Z3c616b391e050d9b6542b90f2c8ba7690e953dc88c0e8dbacb7d27daf08dceefTSLA','NEUTRAL','2025-09-19','TSLA','3c616b391e050d9b6542b90f2c8ba7690e953dc88c0e8dbacb7d27daf08dceef',1009),
('2025-09-19T10:44:00Za3127f7ad3a5d2ae41a28754b3cc6480a7f89779bfcbd0f88081306298ef6740TSLA','POSITIVE','2025-09-19','TSLA','a3127f7ad3a5d2ae41a28754b3cc6480a7f89779bfcbd0f88081306298ef6740',1009),
('2025-09-19T12:23:00Zc3d701e64a3d948a88030281057b14d169b664c499eaec31142aadf81c461f75NVDA','POSITIVE','2025-09-19','NVDA','c3d701e64a3d948a88030281057b14d169b664c499eaec31142aadf81c461f75',1001),
('2025-09-19T12:28:34Z6c7a46592e17892afc3ec9396eeef021a62a35d21c5d63723b9d0cfde25fb00cNVDA','NEUTRAL','2025-09-19','NVDA','6c7a46592e17892afc3ec9396eeef021a62a35d21c5d63723b9d0cfde25fb00c',1001),
('2025-09-19T12:39:00Z93081126ce8b9c52715318736f29d8a2a8e774bd5e5fa62e4f0f818b06d26171NVDA','NEUTRAL','2025-09-19','NVDA','93081126ce8b9c52715318736f29d8a2a8e774bd5e5fa62e4f0f818b06d26171',1001),
('2025-09-19T13:00:00Z3ccd7df7be0e17749d5bd3e3876bd1ee4a9e74a4cab544ad786ba8dd667c80b8NVDA','NEUTRAL','2025-09-19','NVDA','3ccd7df7be0e17749d5bd3e3876bd1ee4a9e74a4cab544ad786ba8dd667c80b8',1001),
('2025-09-19T13:11:00Z86e3b6d8cdef07540e85f18f62057b253e299f927e084a7ee15d9b1ab39f27b0MSFT','NEUTRAL','2025-09-19','MSFT','86e3b6d8cdef07540e85f18f62057b253e299f927e084a7ee15d9b1ab39f27b0',1002),
('2025-09-19T14:00:00Zb7bde3d0b49cbb64165bbaaac7d5c24569a95f0434acb74e17a1ada7b2573d96TSLA','POSITIVE','2025-09-19','TSLA','b7bde3d0b49cbb64165bbaaac7d5c24569a95f0434acb74e17a1ada7b2573d96',1009),
('2025-09-19T14:36:55Z51e026ff32e3d7a40d2d3e5fc33ab302f46f0deab170d934788675090805e2bfAMD','NEGATIVE','2025-09-19','AMD','51e026ff32e3d7a40d2d3e5fc33ab302f46f0deab170d934788675090805e2bf',1016),
('2025-09-19T14:36:55Z51e026ff32e3d7a40d2d3e5fc33ab302f46f0deab170d934788675090805e2bfNVDA','POSITIVE','2025-09-19','NVDA','51e026ff32e3d7a40d2d3e5fc33ab302f46f0deab170d934788675090805e2bf',1001),
('2025-09-19T18:43:00Zec2eafcf6e83d9cac32224ece0e40c4ea4cce59c4189c400b2bc7df4e56053adGOOG','POSITIVE','2025-09-20','GOOG','ec2eafcf6e83d9cac32224ece0e40c4ea4cce59c4189c400b2bc7df4e56053ad',1008),
('2025-09-19T18:43:00Zec2eafcf6e83d9cac32224ece0e40c4ea4cce59c4189c400b2bc7df4e56053adGOOGL','POSITIVE','2025-09-20','GOOGL','ec2eafcf6e83d9cac32224ece0e40c4ea4cce59c4189c400b2bc7df4e56053ad',1006),
('2025-09-19T18:45:00Z90f87c3e41b26d4a7f5bf3130e0eeebaeda5d8442c9b78aa09983a06c7018355TMUS','POSITIVE','2025-09-20','TMUS','90f87c3e41b26d4a7f5bf3130e0eeebaeda5d8442c9b78aa09983a06c7018355',1014),
('2025-09-19T18:53:00Z728488af79ac2025d0a2e441f6514c3c765d3cf587d9d705ba2e0f1343f3d127AMZN','NEUTRAL','2025-09-20','AMZN','728488af79ac2025d0a2e441f6514c3c765d3cf587d9d705ba2e0f1343f3d127',1004),
('2025-09-19T20:17:20Z6e5019b305a77a1905ce1b105c4ce0d7b4a5cfddc52c16015713b9d45cd3c2f8NVDA','POSITIVE','2025-09-20','NVDA','6e5019b305a77a1905ce1b105c4ce0d7b4a5cfddc52c16015713b9d45cd3c2f8',1001),
('2025-09-22T06:45:00Zf228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2AAPL','POSITIVE','2025-09-22','AAPL','f228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2',1003),
('2025-09-22T06:45:00Zf228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2AMZN','NEUTRAL','2025-09-22','AMZN','f228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2',1004),
('2025-09-22T06:45:00Zf228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2NVDA','NEUTRAL','2025-09-22','NVDA','f228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2',1001),
('2025-09-22T06:45:00Zf228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2TSLA','POSITIVE','2025-09-22','TSLA','f228871c29e1861bcedce6872e12b06461a8a23e0a7641d02e6df221e5c277f2',1009),
('2025-09-22T07:03:00Zd4a5dbcb142b86af86006f736013ad9d036aee16ae2c922c6dc385556cd5e4e9NVDA','POSITIVE','2025-09-22','NVDA','d4a5dbcb142b86af86006f736013ad9d036aee16ae2c922c6dc385556cd5e4e9',1001),
('2025-09-22T08:41:00Z99cc6952213193b083772b8691813d41b4e52e9686534a25258f7d4070db492aAAPL','NEUTRAL','2025-09-22','AAPL','99cc6952213193b083772b8691813d41b4e52e9686534a25258f7d4070db492a',1003),
('2025-09-22T08:43:00Z471bdb343858a8a20321d430806f91e7fd26be39ef5f938989800ea0cae1ddc4TMUS','NEUTRAL','2025-09-22','TMUS','471bdb343858a8a20321d430806f91e7fd26be39ef5f938989800ea0cae1ddc4',1014),
('2025-09-22T08:47:00Z1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27AMZN','NEUTRAL','2025-09-22','AMZN','1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27',1004),
('2025-09-22T08:47:00Z1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27GOOG','NEGATIVE','2025-09-22','GOOG','1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27',1008),
('2025-09-22T08:47:00Z1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27GOOGL','NEGATIVE','2025-09-22','GOOGL','1388d419fea4a2677fd21bb61dab5310fec1c0677af2113ff9957633af59ad27',1006),
('2025-09-22T09:43:30Za4d6e93ea405d14746fe25c57b0493f66d2db03e60c677c18d32dfdfe1c6cf3eAAPL','POSITIVE','2025-09-22','AAPL','a4d6e93ea405d14746fe25c57b0493f66d2db03e60c677c18d32dfdfe1c6cf3e',1003),
('2025-09-22T10:02:00Za3eed22280bf0e2fe2c2ee7838b18b7b45412a5b811949108bca12707392b2d5MSFT','POSITIVE','2025-09-22','MSFT','a3eed22280bf0e2fe2c2ee7838b18b7b45412a5b811949108bca12707392b2d5',1002),
('2025-09-22T11:14:47Ze40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053AAPL','NEUTRAL','2025-09-22','AAPL','e40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053',1003),
('2025-09-22T11:14:47Ze40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053MSFT','NEUTRAL','2025-09-22','MSFT','e40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053',1002),
('2025-09-22T11:14:47Ze40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053NVDA','NEUTRAL','2025-09-22','NVDA','e40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053',1001),
('2025-09-22T11:14:47Ze40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053TSLA','NEUTRAL','2025-09-22','TSLA','e40b8cf86f7ea3f3fda20fd5fc73c2c635ab18211010b11e5bbc291ff923d053',1009),
('2025-09-22T12:20:00Z5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41cAAPL','POSITIVE','2025-09-22','AAPL','5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41c',1003),
('2025-09-22T12:20:00Z5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41cNVDA','NEUTRAL','2025-09-22','NVDA','5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41c',1001),
('2025-09-22T12:20:00Z5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41cTSLA','POSITIVE','2025-09-22','TSLA','5a335d8e35f71a9f0584315226c76c3e02e67207239109a4c556d3be8a91a41c',1009),
('2025-09-22T13:00:00Zf0e6c8e2278be3b3d136039e8262fd388c6454b2cacbfbb34bfc4e497a7ef830META','NEUTRAL','2025-09-22','META','f0e6c8e2278be3b3d136039e8262fd388c6454b2cacbfbb34bfc4e497a7ef830',1005),
('2025-09-22T13:00:00Zfdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918AAPL','POSITIVE','2025-09-22','AAPL','fdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918',1003),
('2025-09-22T13:00:00Zfdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918GOOG','POSITIVE','2025-09-22','GOOG','fdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918',1008),
('2025-09-22T13:00:00Zfdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918GOOGL','POSITIVE','2025-09-22','GOOGL','fdbcebf880e37eb7a63adf8e00fd78ef4847d41011d7b495a7754b7cbfe2f918',1006),
('2025-09-22T13:27:00Z4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092AAPL','POSITIVE','2025-09-22','AAPL','4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092',1003),
('2025-09-22T13:27:00Z4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092AMZN','NEUTRAL','2025-09-22','AMZN','4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092',1004),
('2025-09-22T13:27:00Z4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092META','NEUTRAL','2025-09-22','META','4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092',1005),
('2025-09-22T13:27:00Z4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092NVDA','NEUTRAL','2025-09-22','NVDA','4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092',1001),
('2025-09-22T13:27:00Z4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092TSLA','POSITIVE','2025-09-22','TSLA','4f88b5e9459eb2ae7873a6154b2bc64ddaadbb2e0160de058e222347c116c092',1009),
('2025-09-22T14:00:00Zd51bbae74419b9a4e7430d0efe520de2b22cd40aaf50301211e4ce0d48dd6ae2TSLA','POSITIVE','2025-09-22','TSLA','d51bbae74419b9a4e7430d0efe520de2b22cd40aaf50301211e4ce0d48dd6ae2',1009),
('2025-09-22T14:08:00Z83bafb032fe76705ef6f87669b439942c49d2cf8334d2a4fbd3a1f24e0d6c5bbTSLA','NEUTRAL','2025-09-22','TSLA','83bafb032fe76705ef6f87669b439942c49d2cf8334d2a4fbd3a1f24e0d6c5bb',1009),
('2025-09-22T15:00:00Z4416856d506306d2226f86c871be93b909808f518cf97311b0bc685b05278c8aAZN','NEUTRAL','2025-09-23','AZN','4416856d506306d2226f86c871be93b909808f518cf97311b0bc685b05278c8a',1017),
('2025-09-22T15:12:00Z7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4dAAPL','POSITIVE','2025-09-23','AAPL','7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4d',1003),
('2025-09-22T15:12:00Z7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4dAMZN','NEUTRAL','2025-09-23','AMZN','7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4d',1004),
('2025-09-22T15:12:00Z7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4dNVDA','NEUTRAL','2025-09-23','NVDA','7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4d',1001),
('2025-09-22T15:12:00Z7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4dTSLA','POSITIVE','2025-09-23','TSLA','7f0e0960b91163bfe35c12e4c192254cb4ed4093ff3799e4f8f7264b98afcf4d',1009),
('2025-09-22T17:41:00Zfc11943e95ac793bc2bdc8b9759374a2ce59dc087104baeb37e91cfc95f843d2ASML','POSITIVE','2025-09-23','ASML','fc11943e95ac793bc2bdc8b9759374a2ce59dc087104baeb37e91cfc95f843d2',1013),
('2025-09-22T17:51:00Zcdbdde315385ca59b4891d1c796dc5a73957209621df249a68e0d9c695f9f62fAMZN','POSITIVE','2025-09-23','AMZN','cdbdde315385ca59b4891d1c796dc5a73957209621df249a68e0d9c695f9f62f',1004),
('2025-09-22T17:56:00Zc8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5AAPL','POSITIVE','2025-09-23','AAPL','c8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5',1003),
('2025-09-22T17:56:00Zc8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5AMZN','POSITIVE','2025-09-23','AMZN','c8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5',1004),
('2025-09-22T17:56:00Zc8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5GOOG','POSITIVE','2025-09-23','GOOG','c8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5',1008),
('2025-09-22T17:56:00Zc8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5GOOGL','POSITIVE','2025-09-23','GOOGL','c8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5',1006),
('2025-09-22T17:56:00Zc8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5META','POSITIVE','2025-09-23','META','c8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5',1005),
('2025-09-22T17:56:00Zc8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5NFLX','POSITIVE','2025-09-23','NFLX','c8d53769e161d011ab75ce847fee654dcf515ec48daa1bd6420c575d06f693e5',1010),
('2025-09-22T18:20:56Z1b6c44a8a4f4fe0499f3c168c864e4f8e02daa4420c9d5c9bcb0fee4b05792ebAZN','POSITIVE','2025-09-23','AZN','1b6c44a8a4f4fe0499f3c168c864e4f8e02daa4420c9d5c9bcb0fee4b05792eb',1017),
('2025-09-22T20:15:00Z759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3eAMD','NEUTRAL','2025-09-23','AMD','759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3e',1016),
('2025-09-22T20:15:00Z759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3eAVGO','POSITIVE','2025-09-23','AVGO','759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3e',1007),
('2025-09-22T20:15:00Z759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3eMSFT','POSITIVE','2025-09-23','MSFT','759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3e',1002),
('2025-09-22T20:15:00Z759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3eNVDA','POSITIVE','2025-09-23','NVDA','759d2783ed892c16c5abd83a6f867a67df80640edf17a43ed269d238306f2c3e',1001),
('2025-09-22T20:43:58Z482324c33ac92aa26d2731a8a6ae4b6171d5342736e264b600ea62d8f82ef488NVDA','POSITIVE','2025-09-23','NVDA','482324c33ac92aa26d2731a8a6ae4b6171d5342736e264b600ea62d8f82ef488',1001),
('2025-09-22T23:24:00Zfd1429e98cd5b8c6b853e4a46dd0a7e471b4b3f6fa6467720f39f0f6533c0216GOOG','NEUTRAL','2025-09-23','GOOG','fd1429e98cd5b8c6b853e4a46dd0a7e471b4b3f6fa6467720f39f0f6533c0216',1008),
('2025-09-22T23:24:00Zfd1429e98cd5b8c6b853e4a46dd0a7e471b4b3f6fa6467720f39f0f6533c0216GOOGL','NEUTRAL','2025-09-23','GOOGL','fd1429e98cd5b8c6b853e4a46dd0a7e471b4b3f6fa6467720f39f0f6533c0216',1006),
('2025-09-22T23:24:00Zfd1429e98cd5b8c6b853e4a46dd0a7e471b4b3f6fa6467720f39f0f6533c0216MSFT','NEUTRAL','2025-09-23','MSFT','fd1429e98cd5b8c6b853e4a46dd0a7e471b4b3f6fa6467720f39f0f6533c0216',1002),
('2025-09-23T12:44:45Z656e3b8c317f0f0c22761e9f786c5c3f94eadd6b97ac8c24e390eba0acf4f9f3NVDA','NEUTRAL','2025-09-23','NVDA','656e3b8c317f0f0c22761e9f786c5c3f94eadd6b97ac8c24e390eba0acf4f9f3',1001),
('2025-09-23T13:03:38Z968775bcb4d03572eaedeba0b8282f6e5e26637200485eb8a63513b60a3a20d8GOOG','NEGATIVE','2025-09-23','GOOG','968775bcb4d03572eaedeba0b8282f6e5e26637200485eb8a63513b60a3a20d8',1008),
('2025-09-23T13:03:38Z968775bcb4d03572eaedeba0b8282f6e5e26637200485eb8a63513b60a3a20d8GOOGL','NEGATIVE','2025-09-23','GOOGL','968775bcb4d03572eaedeba0b8282f6e5e26637200485eb8a63513b60a3a20d8',1006),
('2025-09-23T13:04:46Z980ae49ef95232a86996649bc8600aaee5337f6d837c321919f7f54aaf4c1764AMZN','NEGATIVE','2025-09-23','AMZN','980ae49ef95232a86996649bc8600aaee5337f6d837c321919f7f54aaf4c1764',1004),
('2025-09-23T14:32:00Z0cd2f478469eb7f957511b29eeb525cc8d160ec5476fdaba47ca4c91f9c41741AAPL','POSITIVE','2025-09-23','AAPL','0cd2f478469eb7f957511b29eeb525cc8d160ec5476fdaba47ca4c91f9c41741',1003),
('2025-09-23T14:32:00Z0cd2f478469eb7f957511b29eeb525cc8d160ec5476fdaba47ca4c91f9c41741AMD','POSITIVE','2025-09-23','AMD','0cd2f478469eb7f957511b29eeb525cc8d160ec5476fdaba47ca4c91f9c41741',1016),
('2025-09-23T14:48:00Za60a8752e758a0cf995d70fcf19ad60d2be830c45bbd2e6588b4fef002845f7bGOOG','NEUTRAL','2025-09-23','GOOG','a60a8752e758a0cf995d70fcf19ad60d2be830c45bbd2e6588b4fef002845f7b',1008),
('2025-09-23T14:48:00Za60a8752e758a0cf995d70fcf19ad60d2be830c45bbd2e6588b4fef002845f7bGOOGL','NEUTRAL','2025-09-23','GOOGL','a60a8752e758a0cf995d70fcf19ad60d2be830c45bbd2e6588b4fef002845f7b',1006),
('2025-09-23T14:59:00Zfcf1a2960ddc18daca057f6ae6406b366efe4951503868837815fea7afdcdfb6AZN','POSITIVE','2025-09-23','AZN','fcf1a2960ddc18daca057f6ae6406b366efe4951503868837815fea7afdcdfb6',1017),
('2025-09-23T15:00:00Z67a104c0be90b7e62ec7692a79101591a6d404d0d9a7e1f14596a27cbb9afa96AMZN','NEUTRAL','2025-09-24','AMZN','67a104c0be90b7e62ec7692a79101591a6d404d0d9a7e1f14596a27cbb9afa96',1004),
('2025-09-23T15:00:00Z67a104c0be90b7e62ec7692a79101591a6d404d0d9a7e1f14596a27cbb9afa96MSFT','NEUTRAL','2025-09-24','MSFT','67a104c0be90b7e62ec7692a79101591a6d404d0d9a7e1f14596a27cbb9afa96',1002),
('2025-09-23T16:40:29Zfdd3a1e9f74825a58dd5129e591c72b55ec8b85438819b0813a250195d3a1ba2NVDA','POSITIVE','2025-09-24','NVDA','fdd3a1e9f74825a58dd5129e591c72b55ec8b85438819b0813a250195d3a1ba2',1001),
('2025-09-23T16:40:29Zfdd3a1e9f74825a58dd5129e591c72b55ec8b85438819b0813a250195d3a1ba2PLTR','POSITIVE','2025-09-24','PLTR','fdd3a1e9f74825a58dd5129e591c72b55ec8b85438819b0813a250195d3a1ba2',1012),
('2025-09-23T17:53:00Z61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46dAMZN','NEUTRAL','2025-09-24','AMZN','61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46d',1004),
('2025-09-23T17:53:00Z61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46dGOOG','NEUTRAL','2025-09-24','GOOG','61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46d',1008),
('2025-09-23T17:53:00Z61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46dGOOGL','NEUTRAL','2025-09-24','GOOGL','61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46d',1006),
('2025-09-23T17:53:00Z61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46dMSFT','NEUTRAL','2025-09-24','MSFT','61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46d',1002),
('2025-09-23T17:53:00Z61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46dNVDA','POSITIVE','2025-09-24','NVDA','61e174c6d1e37af936722274faa4121c40353c8cd07dfbe4a66734df7acca46d',1001),
('2025-09-23T19:02:00Z20cfc7f7c85ca064ded02fd639e1f28fb53b9370fadd50821b59dd7e81a07a11MSFT','NEUTRAL','2025-09-24','MSFT','20cfc7f7c85ca064ded02fd639e1f28fb53b9370fadd50821b59dd7e81a07a11',1002),
('2025-09-23T19:02:00Z20cfc7f7c85ca064ded02fd639e1f28fb53b9370fadd50821b59dd7e81a07a11NVDA','POSITIVE','2025-09-24','NVDA','20cfc7f7c85ca064ded02fd639e1f28fb53b9370fadd50821b59dd7e81a07a11',1001),
('2025-09-23T19:35:36Z04d85b4272a6609d7e2329022613fff262f893ee5f73836432a6a9ea021cf397NVDA','NEUTRAL','2025-09-24','NVDA','04d85b4272a6609d7e2329022613fff262f893ee5f73836432a6a9ea021cf397',1001),
('2025-09-23T19:50:00Za44e2a33e2e60c7c055e9ca35523dd6b44dcaf4c0612750274c89230a04ef304NVDA','POSITIVE','2025-09-24','NVDA','a44e2a33e2e60c7c055e9ca35523dd6b44dcaf4c0612750274c89230a04ef304',1001),
('2025-09-23T20:56:00Zc6028bcacabebded122d6d64e2b149ff4b0bfb45e667cc200d36f73349ac2230NVDA','POSITIVE','2025-09-24','NVDA','c6028bcacabebded122d6d64e2b149ff4b0bfb45e667cc200d36f73349ac2230',1001);
/*!40000 ALTER TABLE `news_indicators` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '게시물 ID',
  `opinion` varchar(100) NOT NULL COMMENT '의견',
  `content` text NOT NULL COMMENT '게시물 내용',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '게시판 생성 시간',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '게시판 삭제 여부',
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  `user_id` bigint(20) NOT NULL COMMENT '사용자 ID',
  PRIMARY KEY (`post_id`),
  KEY `IDX_posts_stock` (`stock_id`),
  KEY `IDX_posts_user` (`user_id`),
  CONSTRAINT `FK_posts_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`),
  CONSTRAINT `FK_posts_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `posts` VALUES
(1,'Buy','yyy','2025-09-08 14:34:47',1,1001,2),
(2,'yyy','yyy','2025-09-10 07:14:38',1,1001,2),
(4,'Buy','yyy','2025-09-10 07:36:01',1,1002,2),
(5,'Buy','yyy','2025-09-10 08:41:05',1,1002,2),
(6,'Buy','yyy','2025-09-10 08:42:52',1,1002,2),
(7,'Buy','yyy','2025-09-11 01:25:19',1,1002,2),
(8,'Sell','yyy','2025-09-11 01:32:16',1,1003,2),
(9,'Sell','yyy','2025-09-11 06:32:10',1,1004,2),
(10,'Sell','yyy','2025-09-11 06:32:23',1,1004,2),
(11,'Sell','yyy','2025-09-11 06:32:35',1,1004,2),
(12,'Strong Sell','yyy','2025-09-11 12:37:45',1,1004,2),
(14,'qwer','qwer','2025-09-11 14:08:53',1,1001,1),
(15,'Sell','ewww','2025-09-18 07:05:11',1,1001,2),
(16,'Sell','ewww','2025-09-19 03:39:50',1,1001,15),
(18,'Sell','ewww','2025-09-19 08:09:39',1,1001,1),
(19,'Strong Sell','내요엉엉','2025-09-19 09:17:20',1,1001,1),
(20,'Sell','ewww','2025-09-21 06:38:50',1,1001,15),
(22,'Sell','ewww','2025-09-21 13:13:10',1,1001,15),
(23,'Sell','ewww','2025-09-22 01:54:19',1,1001,15),
(24,'SELL','striasng','2025-09-22 06:01:53',1,1001,1),
(25,'Sell','ewww','2025-09-23 07:43:12',1,1001,15),
(26,'Sell','ewww','2025-09-23 08:17:00',1,1001,15),
(27,'Hold','fg','2025-09-24 03:29:56',1,1001,15),
(28,'Hold','아잇!!!!','2025-09-24 06:18:27',1,1001,15),
(29,'Hold','dfesfs','2025-09-24 08:07:31',1,1001,15),
(30,'Strong Sell','tt','2025-09-24 08:21:31',1,1004,1),
(31,'Sell','tt','2025-09-24 08:22:24',1,1004,15),
(32,'Buy','NVIDIA, 개인·애널리스트 모두 STRONG BUY 의견! 반도체·AI 성장성 감안하면 장기적으로 강력 매수 유망해 보입니다 🚀','2025-09-25 01:21:06',1,1001,15),
(33,'Strong Buy','qwertyuio','2025-09-25 01:25:47',1,1001,15),
(34,'Hold','test','2025-09-25 01:31:18',1,1001,1),
(35,'Buy','최근 주가가 많이 오른 건 사실이지만 여전히 성장 여력이 크다고 생각합니다. 단기보단 장기 투자 관점에서 접근하면 괜찮을 듯해 Buy 의견 남깁니다.','2025-09-25 01:41:09',0,1001,25),
(36,'Buy','NVIDIA의 GPU는 업계 표준이 되어가고 있어요. 다만 현재 밸류에이션이 부담스러운 건 사실이라, 조금 더 지켜보며 Buy 의견 정도로 접근하겠습니다.','2025-09-25 01:42:14',0,1001,26),
(37,'Strong Buy','NVIDIA는 이제 단순 반도체 회사를 넘어 AI 시대의 핵심 기업으로 자리 잡았다고 봅니다. 이런 기회는 흔치 않다 생각해 Strong Buy 남깁니다.','2025-09-25 01:43:12',0,1001,27),
(38,'Strong Buy','ㅜㅜㅜㅜㅜㅜㅜ','2025-09-25 03:23:03',1,1001,25),
(39,'Hold','미국 증시 현재 굉장히 unstable 하군요. 저는 HOLD 하겠습니다. Let\'s go 버크셔','2025-09-25 03:28:14',0,1003,1),
(42,'Sell','구매하기 적기입니다.','2025-09-26 01:24:55',0,1001,39);
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `predictions`
--

DROP TABLE IF EXISTS `predictions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `predictions` (
  `prediction_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '예측 ID',
  `user_id` bigint(20) NOT NULL COMMENT '사용자 ID',
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  `predicted_at` datetime NOT NULL DEFAULT current_timestamp(),
  `prediction` enum('UP','DOWN') NOT NULL COMMENT '예측 내용',
  `evaluated_at` datetime DEFAULT NULL COMMENT '평가 일시',
  `actual_price` double DEFAULT NULL COMMENT '실제 가격',
  `result` enum('SUCCESS','FAILURE') DEFAULT NULL COMMENT '예측 성공 여부',
  PRIMARY KEY (`prediction_id`),
  KEY `fk_prediction_user` (`user_id`),
  KEY `fk_prediction_stock` (`stock_id`),
  CONSTRAINT `fk_prediction_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`),
  CONSTRAINT `fk_prediction_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `predictions`
--

LOCK TABLES `predictions` WRITE;
/*!40000 ALTER TABLE `predictions` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `predictions` VALUES
(4,1,1001,'2025-09-21 21:39:38','UP',NULL,NULL,'SUCCESS'),
(5,1,1002,'2025-09-21 21:39:52','UP',NULL,NULL,'SUCCESS'),
(6,1,1003,'2025-09-21 21:40:08','DOWN',NULL,NULL,'SUCCESS'),
(7,1,1004,'2025-09-21 21:40:52','DOWN',NULL,NULL,'FAILURE'),
(8,1,1007,'2025-09-22 15:08:11','DOWN',NULL,NULL,'SUCCESS'),
(9,1,1001,'2025-09-22 11:07:32','DOWN',NULL,NULL,'SUCCESS'),
(10,1,1003,'2025-09-22 11:24:10','UP',NULL,NULL,'SUCCESS'),
(11,1,1001,'2025-09-23 15:14:31','DOWN',NULL,NULL,'SUCCESS'),
(12,1,1004,'2025-09-23 15:14:35','DOWN',NULL,NULL,'SUCCESS'),
(13,1,1003,'2025-09-23 15:14:43','UP',NULL,NULL,'SUCCESS'),
(14,1,1001,'2025-09-15 15:14:45','UP',NULL,NULL,'SUCCESS'),
(15,1,1008,'2025-09-19 15:14:51','UP',NULL,NULL,'SUCCESS'),
(16,1,1008,'2025-09-15 15:14:55','DOWN',NULL,NULL,'SUCCESS'),
(17,1,1019,'2025-09-09 15:18:41','DOWN',NULL,NULL,'SUCCESS'),
(18,1,1019,'2025-09-10 15:18:44','UP',NULL,NULL,'SUCCESS'),
(19,1,1019,'2025-09-24 15:18:46','UP',NULL,NULL,'SUCCESS'),
(20,1,1017,'2025-09-24 15:18:49','UP',NULL,NULL,'SUCCESS'),
(21,1,1001,'2025-09-24 15:18:53','UP',NULL,NULL,NULL),
(22,1,1001,'2025-09-25 15:18:54','UP',NULL,NULL,'SUCCESS'),
(23,1,1001,'2025-09-25 15:18:55','UP',NULL,NULL,NULL),
(24,1,1001,'2025-09-25 15:25:02','DOWN',NULL,NULL,NULL),
(25,38,1001,'2025-09-25 16:10:44','UP',NULL,NULL,NULL),
(26,39,1001,'2025-09-26 10:46:32','UP',NULL,NULL,NULL);
/*!40000 ALTER TABLE `predictions` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `sectors`
--

DROP TABLE IF EXISTS `sectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `sectors` (
  `sector_code` char(4) NOT NULL COMMENT '섹터코드',
  `name` varchar(255) NOT NULL COMMENT '섹터명',
  PRIMARY KEY (`sector_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sectors`
--

LOCK TABLES `sectors` WRITE;
/*!40000 ALTER TABLE `sectors` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `sectors` VALUES
('BASC','Basic Materials'),
('COMM','Communication Services'),
('CONS','Consumer Discretionary'),
('HCAR','Healthcare'),
('STPL','Consumer Staples'),
('TECH','Technology');
/*!40000 ALTER TABLE `sectors` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `stock_prices`
--

DROP TABLE IF EXISTS `stock_prices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stock_prices` (
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  `stock_price_pk` char(50) NOT NULL COMMENT '주식 가격 pk',
  `datetime` datetime NOT NULL COMMENT '날짜',
  `open` double NOT NULL COMMENT '종가',
  `high` double DEFAULT NULL,
  `low` double DEFAULT NULL,
  `last` double DEFAULT NULL,
  PRIMARY KEY (`stock_price_pk`),
  KEY `FK_prices_stock` (`stock_id`),
  CONSTRAINT `FK_prices_stock` FOREIGN KEY (`stock_id`) REFERENCES `stocks` (`stock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_prices`
--

LOCK TABLES `stock_prices` WRITE;
/*!40000 ALTER TABLE `stock_prices` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `stock_prices` VALUES
(1003,'AAPL_2025-09-12','2025-09-12 00:00:00',234.07,NULL,NULL,NULL),
(1003,'AAPL_2025-09-22','2025-09-22 00:00:00',245.5,NULL,NULL,NULL),
(1003,'AAPL_2025-09-23','2025-09-23 00:00:00',256.08,NULL,NULL,NULL),
(1003,'AAPL_2025-09-24','2025-09-24 00:00:00',254.43,NULL,NULL,NULL),
(1016,'AMD_2025-09-12','2025-09-12 00:00:00',158.57,NULL,NULL,NULL),
(1016,'AMD_2025-09-22','2025-09-22 00:00:00',157.39,NULL,NULL,NULL),
(1016,'AMD_2025-09-23','2025-09-23 00:00:00',159.79,NULL,NULL,NULL),
(1016,'AMD_2025-09-24','2025-09-24 00:00:00',160.9,NULL,NULL,NULL),
(1004,'AMZN_2025-09-12','2025-09-12 00:00:00',228.15,NULL,NULL,NULL),
(1004,'AMZN_2025-09-22','2025-09-22 00:00:00',231.48,NULL,NULL,NULL),
(1004,'AMZN_2025-09-23','2025-09-23 00:00:00',227.63,NULL,NULL,NULL),
(1004,'AMZN_2025-09-24','2025-09-24 00:00:00',220.71,NULL,NULL,NULL),
(1013,'ASML_2025-09-12','2025-09-12 00:00:00',813.87,NULL,NULL,NULL),
(1013,'ASML_2025-09-22','2025-09-22 00:00:00',932.15,NULL,NULL,NULL),
(1013,'ASML_2025-09-23','2025-09-23 00:00:00',957.8,NULL,NULL,NULL),
(1013,'ASML_2025-09-24','2025-09-24 00:00:00',963.51,NULL,NULL,NULL),
(1007,'AVGO_2025-09-12','2025-09-12 00:00:00',359.87,NULL,NULL,NULL),
(1007,'AVGO_2025-09-22','2025-09-22 00:00:00',344.94,NULL,NULL,NULL),
(1007,'AVGO_2025-09-23','2025-09-23 00:00:00',338.79,NULL,NULL,NULL),
(1007,'AVGO_2025-09-24','2025-09-24 00:00:00',338.94,NULL,NULL,NULL),
(1017,'AZN_2025-09-12','2025-09-12 00:00:00',79.56,NULL,NULL,NULL),
(1017,'AZN_2025-09-22','2025-09-22 00:00:00',76.28,NULL,NULL,NULL),
(1017,'AZN_2025-09-23','2025-09-23 00:00:00',77.5,NULL,NULL,NULL),
(1017,'AZN_2025-09-24','2025-09-24 00:00:00',75.97,NULL,NULL,NULL),
(1011,'COST_2025-09-12','2025-09-12 00:00:00',967.9,NULL,NULL,NULL),
(1011,'COST_2025-09-22','2025-09-22 00:00:00',951.16,NULL,NULL,NULL),
(1011,'COST_2025-09-23','2025-09-23 00:00:00',943.26,NULL,NULL,NULL),
(1011,'COST_2025-09-24','2025-09-24 00:00:00',943.6,NULL,NULL,NULL),
(1015,'CSCO_2025-09-12','2025-09-12 00:00:00',66.53,NULL,NULL,NULL),
(1015,'CSCO_2025-09-22','2025-09-22 00:00:00',68.21,NULL,NULL,NULL),
(1015,'CSCO_2025-09-23','2025-09-23 00:00:00',67.75,NULL,NULL,NULL),
(1015,'CSCO_2025-09-24','2025-09-24 00:00:00',67.54,NULL,NULL,NULL),
(1008,'GOOG_2025-09-12','2025-09-12 00:00:00',241.38,NULL,NULL,NULL),
(1008,'GOOG_2025-09-22','2025-09-22 00:00:00',255.24,NULL,NULL,NULL),
(1008,'GOOG_2025-09-23','2025-09-23 00:00:00',252.88,NULL,NULL,NULL),
(1008,'GOOG_2025-09-24','2025-09-24 00:00:00',252.34,NULL,NULL,NULL),
(1006,'GOOGL_2025-09-12','2025-09-12 00:00:00',240.8,NULL,NULL,NULL),
(1006,'GOOGL_2025-09-22','2025-09-22 00:00:00',254.72,NULL,NULL,NULL),
(1006,'GOOGL_2025-09-23','2025-09-23 00:00:00',252.53,NULL,NULL,NULL),
(1006,'GOOGL_2025-09-24','2025-09-24 00:00:00',251.66,NULL,NULL,NULL),
(1020,'INTU_2025-09-12','2025-09-12 00:00:00',646.03,NULL,NULL,NULL),
(1020,'INTU_2025-09-22','2025-09-22 00:00:00',687.92,NULL,NULL,NULL),
(1020,'INTU_2025-09-23','2025-09-23 00:00:00',702.09,NULL,NULL,NULL),
(1020,'INTU_2025-09-24','2025-09-24 00:00:00',699.18,NULL,NULL,NULL),
(1018,'LIN_2025-09-12','2025-09-12 00:00:00',482.04,NULL,NULL,NULL),
(1018,'LIN_2025-09-22','2025-09-22 00:00:00',479.01,NULL,NULL,NULL),
(1018,'LIN_2025-09-23','2025-09-23 00:00:00',477.76,NULL,NULL,NULL),
(1018,'LIN_2025-09-24','2025-09-24 00:00:00',479.94,NULL,NULL,NULL),
(1005,'META_2025-09-12','2025-09-12 00:00:00',755.59,NULL,NULL,NULL),
(1005,'META_2025-09-22','2025-09-22 00:00:00',778.38,NULL,NULL,NULL),
(1005,'META_2025-09-23','2025-09-23 00:00:00',765.16,NULL,NULL,NULL),
(1005,'META_2025-09-24','2025-09-24 00:00:00',755.4,NULL,NULL,NULL),
(1002,'MSFT_2025-09-12','2025-09-12 00:00:00',509.9,NULL,NULL,NULL),
(1002,'MSFT_2025-09-22','2025-09-22 00:00:00',517.93,NULL,NULL,NULL),
(1002,'MSFT_2025-09-23','2025-09-23 00:00:00',514.45,NULL,NULL,NULL),
(1002,'MSFT_2025-09-24','2025-09-24 00:00:00',509.23,NULL,NULL,NULL),
(1010,'NFLX_2025-09-12','2025-09-12 00:00:00',1188.44,NULL,NULL,NULL),
(1010,'NFLX_2025-09-22','2025-09-22 00:00:00',1226.97,NULL,NULL,NULL),
(1010,'NFLX_2025-09-23','2025-09-23 00:00:00',1227.37,NULL,NULL,NULL),
(1010,'NFLX_2025-09-24','2025-09-24 00:00:00',1218.47,NULL,NULL,NULL),
(1001,'NVDA_2025-09-12','2025-09-12 00:00:00',177.82,NULL,NULL,NULL),
(1001,'NVDA_2025-09-22','2025-09-22 00:00:00',176.67,NULL,NULL,NULL),
(1001,'NVDA_2025-09-23','2025-09-23 00:00:00',183.61,NULL,NULL,NULL),
(1001,'NVDA_2025-09-24','2025-09-24 00:00:00',178.43,NULL,NULL,NULL),
(1019,'PEP_2025-09-12','2025-09-12 00:00:00',143.53,NULL,NULL,NULL),
(1019,'PEP_2025-09-22','2025-09-22 00:00:00',141.76,NULL,NULL,NULL),
(1019,'PEP_2025-09-23','2025-09-23 00:00:00',141.03,NULL,NULL,NULL),
(1019,'PEP_2025-09-24','2025-09-24 00:00:00',141.9,NULL,NULL,NULL),
(1012,'PLTR_2025-09-12','2025-09-12 00:00:00',171.43,NULL,NULL,NULL),
(1012,'PLTR_2025-09-22','2025-09-22 00:00:00',182.39,NULL,NULL,NULL),
(1012,'PLTR_2025-09-23','2025-09-23 00:00:00',179.33,NULL,NULL,NULL),
(1012,'PLTR_2025-09-24','2025-09-24 00:00:00',182.55,NULL,NULL,NULL),
(1014,'TMUS_2025-09-12','2025-09-12 00:00:00',241.72,NULL,NULL,NULL),
(1014,'TMUS_2025-09-22','2025-09-22 00:00:00',238.17,NULL,NULL,NULL),
(1014,'TMUS_2025-09-23','2025-09-23 00:00:00',237.44,NULL,NULL,NULL),
(1014,'TMUS_2025-09-24','2025-09-24 00:00:00',239.49,NULL,NULL,NULL),
(1009,'TSLA_2025-09-12','2025-09-12 00:00:00',395.94,NULL,NULL,NULL),
(1009,'TSLA_2025-09-22','2025-09-22 00:00:00',426.07,NULL,NULL,NULL),
(1009,'TSLA_2025-09-23','2025-09-23 00:00:00',434.21,NULL,NULL,NULL),
(1009,'TSLA_2025-09-24','2025-09-24 00:00:00',425.85,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stock_prices` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `stocks`
--

DROP TABLE IF EXISTS `stocks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `stocks` (
  `stock_id` bigint(20) NOT NULL COMMENT '종목 ID',
  `name` varchar(255) NOT NULL COMMENT '종목명',
  `stock_code` char(11) NOT NULL COMMENT '주식 코드',
  `individual_indicator` enum('STRONG_SELL','SELL','HOLD','BUY','STRONG_BUY') NOT NULL COMMENT '개미 지표',
  `analyst_indicator` enum('STRONG_SELL','SELL','HOLD','BUY','STRONG_BUY') NOT NULL COMMENT '전문가 지표',
  `news_indicator` enum('NEGATIVE','NEUTRAL','POSITIVE') NOT NULL COMMENT '뉴스 지표',
  `price` double NOT NULL COMMENT '종가',
  `fluctuation` double NOT NULL COMMENT '등락률',
  `industry_code` char(4) NOT NULL COMMENT '산업 코드',
  `sector_code` char(4) NOT NULL COMMENT '섹터 코드',
  PRIMARY KEY (`stock_id`),
  KEY `IDX_stocks_industry` (`industry_code`),
  KEY `IDX_stocks_sector` (`sector_code`),
  CONSTRAINT `FK_stocks_industry` FOREIGN KEY (`industry_code`) REFERENCES `industries` (`industry_code`),
  CONSTRAINT `FK_stocks_sector` FOREIGN KEY (`sector_code`) REFERENCES `sectors` (`sector_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stocks`
--

LOCK TABLES `stocks` WRITE;
/*!40000 ALTER TABLE `stocks` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `stocks` VALUES
(1001,'NVIDIA Corporation','NVDA','STRONG_BUY','STRONG_BUY','POSITIVE',177.0937,177.094,'SEMI','TECH'),
(1002,'Microsoft Corporation','MSFT','BUY','STRONG_BUY','POSITIVE',510.17,510.17,'SOFT','TECH'),
(1003,'Apple Inc.','AAPL','HOLD','BUY','NEUTRAL',252.3,252.3,'SOFT','TECH'),
(1004,'Amazon.com, Inc.','AMZN','BUY','BUY','POSITIVE',220.8,220.8,'RETL','CONS'),
(1005,'Meta Platforms, Inc.','META','BUY','HOLD','POSITIVE',755.99,755.99,'NETM','COMM'),
(1006,'Alphabet Inc. Class A','GOOGL','BUY','BUY','POSITIVE',252.2,252.2,'NETM','COMM'),
(1007,'Broadcom Inc.','AVGO','HOLD','BUY','POSITIVE',338.94,0.15,'SEMI','TECH'),
(1008,'Alphabet Inc. Class C','GOOG','BUY','BUY','POSITIVE',252.34,-0.54,'NETM','COMM'),
(1009,'Tesla, Inc.','TSLA','HOLD','HOLD','NEUTRAL',426.0501,426.05,'EVCL','CONS'),
(1010,'Netflix, Inc.','NFLX','HOLD','BUY','POSITIVE',1217.5,1217.5,'NETM','COMM'),
(1011,'Costco Wholesale Corporation','COST','BUY','BUY','NEUTRAL',943.6,0.34,'RETL','STPL'),
(1012,'Palantir Technologies Inc.','PLTR','BUY','HOLD','POSITIVE',182.55,3.22,'SOFT','TECH'),
(1013,'ASML Holding N.V.','ASML','BUY','BUY','POSITIVE',963.51,5.71,'SEMI','TECH'),
(1014,'T-Mobile US, Inc.','TMUS','HOLD','BUY','NEUTRAL',238.08,238.08,'TELC','COMM'),
(1015,'Cisco Systems, Inc.','CSCO','HOLD','HOLD','NEUTRAL',67.4017,67.402,'SOFT','TECH'),
(1016,'Advanced Micro Devices, Inc.','AMD','BUY','STRONG_BUY','POSITIVE',160.9,1.11,'SEMI','TECH'),
(1017,'AstraZeneca PLC','AZN','HOLD','HOLD','NEUTRAL',76,76,'BIOP','HCAR'),
(1018,'Linde plc','LIN','HOLD','BUY','NEUTRAL',479.94,2.18,'CHEM','BASC'),
(1019,'PepsiCo, Inc.','PEP','HOLD','HOLD','NEUTRAL',141.9,0.87,'BEVG','STPL'),
(1020,'Intuit Inc.','INTU','BUY','BUY','POSITIVE',698,698,'SOFT','TECH');
/*!40000 ALTER TABLE `stocks` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `tiers`
--

DROP TABLE IF EXISTS `tiers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiers` (
  `tier_code` varchar(8) NOT NULL COMMENT '티어 코드',
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`tier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiers`
--

LOCK TABLES `tiers` WRITE;
/*!40000 ALTER TABLE `tiers` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `tiers` VALUES
('BRONZE',1),
('DIAMOND',5),
('GOLD',3),
('PLATINUM',4),
('SILVER',2);
/*!40000 ALTER TABLE `tiers` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `user_likes`
--

DROP TABLE IF EXISTS `user_likes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_likes` (
  `user_id` bigint(20) NOT NULL COMMENT '사용자 ID',
  `post_id` bigint(20) NOT NULL COMMENT '게시물 ID',
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `IDX_likes_post` (`post_id`),
  CONSTRAINT `FK_likes_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FK_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_likes`
--

LOCK TABLES `user_likes` WRITE;
/*!40000 ALTER TABLE `user_likes` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `user_likes` VALUES
(15,28),
(31,28),
(15,30),
(15,31),
(31,37),
(38,37),
(39,37),
(1,39);
/*!40000 ALTER TABLE `user_likes` ENABLE KEYS */;
UNLOCK TABLES;
commit;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '사용자 ID',
  `user_name` varchar(255) NOT NULL COMMENT '사용자 이름',
  `email` varchar(255) NOT NULL COMMENT '사용자 이메일',
  `password` varchar(255) NOT NULL COMMENT '패스워드',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() COMMENT '계정 생성 시각',
  `last_login_at` timestamp NULL DEFAULT NULL COMMENT '마지막 로그인 시각',
  `tier_code` varchar(8) NOT NULL DEFAULT 'BRONZE' COMMENT '티어 코드',
  `deleted_at` timestamp NULL DEFAULT NULL,
  `role` enum('ADMIN','USER') NOT NULL DEFAULT 'USER',
  `image_url` varchar(255) DEFAULT NULL COMMENT '프로밀 이미지 URL',
  `status_message` varchar(255) DEFAULT NULL COMMENT '상태메시지',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `UK_users_email` (`email`) USING BTREE,
  KEY `FK_users_tiers` (`tier_code`),
  CONSTRAINT `FK_users_tiers` FOREIGN KEY (`tier_code`) REFERENCES `tiers` (`tier_code`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
set autocommit=0;
INSERT INTO `users` VALUES
(1,'워렌 버핏','admin@naver.com','$2a$10$NAWVH3WTufBwXJ.iV1aBvOqRqwrF..gu86b9zBTWmV4kqPAzF4mrW','2025-09-02 13:31:51','2025-09-26 00:58:23','DIAMOND',NULL,'ADMIN','https://encrypted-tbn1.gstatic.com/licensed-image?q=tbn:ANd9GcS1KVVa-bpsH56U50mGC5jN3XdvfrMEcwjBYSIbYKIwCicvDqAj5kjviwyVRelbAVGEzGL7b_08-IARlMiUzlio_HSSqnPiIkt8OtCg362WE21cm77Nzeyn0E4X_Zb0l6AnPb0zW5NE4bg','내일을 바라봅니다.'),
(2,'손예원','test@naver.com_DEL_20250901','$2a$10$2A.RgEGtRnEN7jN080X0MeNvlDFr/jtLngamSvOMl6HdRUkcIicZC','2025-09-06 13:48:32','2025-09-06 13:48:33','BRONZE',NULL,'USER','https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(11,'박진우','pjw1480@naver.com','$2a$10$hfM9W6dIR4gDuFjz5fA1A.xu4QmqCmySrpn/S0pj/w1szl4lHyV5y','2025-09-10 14:59:57',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1688891564708-9b2247085923?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(14,'test','tes123t@naver.com','$2a$10$gVS3kOa4l6EvdCA2r28p.uqd4GrWyTsoaCeDURj34reIdfE80s46C','2025-09-18 12:47:05',NULL,'BRONZE','2025-09-19 07:07:23','USER','https://plus.unsplash.com/premium_photo-1710911198710-3097c518f0e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(15,'손혜원','test@naver.com','$2a$10$U5tpzVIG.eyLH.N.GWW/8uDOUdZe15ZZ2T/2aRKLQaIXNr55AwGIi','2025-09-18 13:21:22','2025-09-26 00:37:21','BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1710911198710-3097c518f0e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','뭘 봐'),
(16,'test','test@naver.com232','$2a$10$xGrDNKHOZ/oiZlE9x2yU2Os8/PDUpJHPG3lD9Yg.YZQWEN/7o5laG','2025-09-19 07:40:58',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1688891564708-9b2247085923?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(17,'test','test@naver.com2323','$2a$10$j9gG43lbUpRqDOk07I4RtOq/QNHTB12QvKJGm7tPnrgGDuW2NjToq','2025-09-19 07:45:17',NULL,'BRONZE',NULL,'USER','https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(18,'test','test12322@naver.com','$2a$10$sNU/5IwHiXi1bEc7p3DkGOt00.rH81cpsQX5lr3IwF/.JR0B1Avu6','2025-09-19 07:47:12',NULL,'BRONZE',NULL,'USER','https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(19,'test','test123222222@naver.com','$2a$10$5OIGPhcdPHt3FG072yNdMuO1Gk0xzX5T61EToBp4YZtkc306Byev.','2025-09-19 09:09:45',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1710911198710-3097c518f0e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(20,'릴리 레몬','admin@naver.com23','$2a$10$whKle/4wOGO5hh04xoEAheGtLwwcNBqZYXo/ntrduWrOBg4E4HipO','2025-09-19 13:49:41',NULL,'GOLD',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','Wanna Yoga?'),
(22,'막스 베르스타펜','testqs@naver.com','$2a$10$YKYE5oclzkvUbXHqIwarZ.8GuyiaDEYchabkGhIjqX4kM7Aw.bX9q','2025-09-20 08:08:32',NULL,'DIAMOND',NULL,'USER','https://plus.unsplash.com/premium_photo-1688891564708-9b2247085923?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','World Class Driver'),
(23,'제프 베이조스','test11@naver.com','$2a$10$8RbxyeeGS024IBGprCEoU.64SX3EM0CgBQ9VoV5zUwL7FLuHceIQS','2025-09-22 06:01:01',NULL,'SILVER',NULL,'USER','https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSzKuTXytvv6wrOy9OHngda-EEmHPhlyZC50dgHhCd9gvm-zwD3cJooNuaZik6wFNvIunFFnmBvJBTw2141DfMS4Wv4cwdwxrGkOMo73NqvrMnqlxFrIfidZktffUJ6j87zJ1qb-0QsCRti','No Coupang'),
(24,'강낭콩','admin@naver.com6662','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-23 07:23:16','2025-09-23 07:23:26','BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(25,'Chloe Davis','chloe123@gmail.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34','2025-09-25 03:18:06','BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','안녕하세요, 저는 호기심 많은 개발자입니다.'),
(26,'Liam Taylor','liam4567@naver.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34','2025-09-25 01:41:42','BRONZE',NULL,'USER','https://images.unsplash.com/photo-1560250097-0b93528c311a?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','세상에는 배울 게 참 많네요!'),
(27,'Olivia Wilson','olivia7890@gmail.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34','2025-09-25 01:42:25','BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1710911198710-3097c518f0e1?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','음악과 커피를 사랑하는 사람입니다.'),
(28,'Noah Moore','noah112233@naver.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','오늘도 행복한 하루 되세요!'),
(29,'Emma Harris','emma445566@gmail.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','꾸준함이 답이라고 생각해요.'),
(30,'Mason Jones','mason778899@naver.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','새로운 도전이 즐거워요.'),
(31,'Isabella Garcia','isabella0123@gmail.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34','2025-09-25 03:17:33','BRONZE',NULL,'USER','https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cHJvZmlsZXxlbnwwfHwwfHx8MA%3D%3D','여행을 좋아합니다.'),
(32,'Jacob Rodriguez','jacob45678@naver.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34','2025-09-25 03:16:47','BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','세상을 바꾸고 싶습니다.'),
(33,'Ava Martinez','ava901234@gmail.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','긍정적인 에너지를 전파합니다.'),
(34,'William Hernandez','william56789@naver.com','$2a$10$ta1SefJpc3NET9ikYBJHSOMdr7ad4NXzZWm3OcwSKxuVusVz7PJI6','2025-09-24 00:43:34',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','책 읽는 것을 즐깁니다.'),
(35,'test','NOOO@naver.com','$2a$10$mP4q2xKSRfvoJ3e32eN7I.hx3M54XKF7sNdXwnkL2Fh0vOFCPUJdm','2025-09-24 03:48:08',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(36,'test','tes11@naver.com','$2a$10$f8aadgPl1OQlhIpI/81RUebYQiaUgrvM8aA8WiFo1zAGXrlqpedc2','2025-09-25 02:16:57',NULL,'BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',NULL),
(37,'석렌 버핏','jws020501@naver.com','$2a$10$N4wvjFwDV/s2f7x6iJFVtOoJFchDEaxd0nKxwm5KvZ3YOOFifw3Zi','2025-09-25 03:33:15','2025-09-25 05:46:32','BRONZE',NULL,'USER','https://plus.unsplash.com/premium_photo-1690407617542-2f210cf20d7e?q=80&w=687&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D','나스닥은 신이다'),
(38,'수정된 이름','name@naver.com','$2a$10$deUTeBUYrgQ1a/AT9tKbwO7KOmMeocQJaKtIjHw1HV9NkK17J88Ve','2025-09-25 07:09:05','2025-09-25 07:09:13','BRONZE',NULL,'USER',NULL,'최고'),
(39,'이몽룡','hong@naver.com','$2a$10$mYeXfDbNfNKNoUV6JZjIzejSaOXtCJlGXMvCRcuYPLP3VJ45J5EsW','2025-09-26 01:07:19','2025-09-26 01:17:57','BRONZE',NULL,'USER',NULL,'좋은 아침입니다!');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
commit;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-02  9:40:58
