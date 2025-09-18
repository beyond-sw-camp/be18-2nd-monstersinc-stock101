package com.monstersinc.stock101.restclient.stock.model.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @Builder
@AllArgsConstructor
@NoArgsConstructor
public class GetNewsDto {
    private String newsId;            // 뉴스 ID (PK)
    private String link;            // 뉴스 원문 링크
    private String title;           // 뉴스 제목
    private String contentSummary;  // 뉴스 요약
    private String articleUrl;      // 뉴스 기사 URL
    private Timestamp publishedAt;     // 발행 시간 (ISO8601 문자열 or LocalDateTime으로 변환 가능)
    private String ticker;          // 종목 티커
    private String result;          // 감정 분석 결과 (예: positive, neutral, negative)
    private Long stockId;           // 종목 ID (FK)
}
