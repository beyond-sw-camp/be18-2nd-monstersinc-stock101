package com.monstersinc.stock101.indicator.model.vo;

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
public class NewsIndicator {
    private Long stockId;           // BIGINT -> Long
    private String stockCode;       // CHAR(11)
    private Integer negativeCount;
    private Integer neutralCount;
    private Integer positiveCount;
}