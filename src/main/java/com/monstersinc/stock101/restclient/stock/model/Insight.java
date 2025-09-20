package com.monstersinc.stock101.restclient.stock.model;

import lombok.Getter;

@Getter
public class Insight {
    private String ticker;
    private String sentiment; // 감정 분석 결과 (예: positive, neutral, negative)
}
