
-- 1. Lookup / base tables
CREATE TABLE `tiers` (
  `tier_code` varchar(8) NOT NULL COMMENT '티어 코드',
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`tier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

CREATE TABLE `industries` (
  `industry_code` char(4) NOT NULL COMMENT '산업 코드',
  `name` varchar(255) NOT NULL COMMENT '산업명',
  PRIMARY KEY (`industry_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

CREATE TABLE `sectors` (
  `sector_code` char(4) NOT NULL COMMENT '섹터코드',
  `name` varchar(255) NOT NULL COMMENT '섹터명',
  PRIMARY KEY (`sector_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

CREATE TABLE `event_types` (
  `type_code` varchar(5) NOT NULL COMMENT '이벤트 코드',
  `frequency` enum('DAILY','WEEKLY','BIWEEKLY','MONTHLY','YEARLY','ONCE','QUARTERLY') NOT NULL COMMENT '주기',
  PRIMARY KEY (`type_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- 2. Stocks (depends on industries, sectors)
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

-- 3. Users (depends on tiers)
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

-- 4. Posts (depends on users, stocks)
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

-- 5. Comments (depends on posts, users; self-FK allowed in same CREATE)
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

-- 6. Likes (depends on users, posts)
CREATE TABLE `user_likes` (
  `user_id` bigint(20) NOT NULL COMMENT '사용자 ID',
  `post_id` bigint(20) NOT NULL COMMENT '게시물 ID',
  PRIMARY KEY (`user_id`,`post_id`),
  KEY `IDX_likes_post` (`post_id`),
  CONSTRAINT `FK_likes_post` FOREIGN KEY (`post_id`) REFERENCES `posts` (`post_id`),
  CONSTRAINT `FK_likes_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_uca1400_ai_ci;

-- 7. News (depends on stocks)
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

-- 8. News indicators (depends on stocks)
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

-- 9. Financial/indicator tables (depend on stocks)
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

-- 10. Prices (depends on stocks)
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

-- 11. Predictions (depends on users, stocks)
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

-- 12. Economic events (depends on event_types, stocks)
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

SET FOREIGN_KEY_CHECKS = 1;
