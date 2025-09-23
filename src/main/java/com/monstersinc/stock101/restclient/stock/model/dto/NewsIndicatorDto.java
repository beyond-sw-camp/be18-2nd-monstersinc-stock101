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
public class NewsIndicatorDto {
    private String insightId;
    private String result;          // 감정 분석 결과 (예: positive, neutral, negative)
    private Timestamp date;     // 발행 시간 (ISO8601 문자열 or LocalDateTime으로 변환 가능)
    private String ticker;          // 종목 티커
    private String newsId;            // 뉴스 ID
    private Long stockId;
}
