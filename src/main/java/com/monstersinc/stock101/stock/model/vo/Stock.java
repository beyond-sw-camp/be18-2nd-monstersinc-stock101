package com.monstersinc.stock101.stock.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class Stock {
    private Long stockId;              // 종목 ID
    private String name;               // 종목명
    private String individualIndicator; // 개미 지표 (STRONG_SELL, SELL, HOLD, BUY, STRONG_BUY)
    private String analystIndicator;    // 전문가 지표 (STRONG_SELL, SELL, HOLD, BUY, STRONG_BUY)
    private String newsIndicator;       // 뉴스 지표 (NEGATIVE, NEUTRAL, POSITIVE)
    private Double price;              // 종가
    private Double fluctuation;        // 등락률
    private String industryCode;       // 산업 코드 (FK)
    private String industryName;       // 산업 이름 (FK)
    private String sectorCode;         // 섹터 코드 (FK)
    private String sectorName;         // 섹터 이름 (FK)
}