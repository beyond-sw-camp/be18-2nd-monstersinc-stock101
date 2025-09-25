package com.monstersinc.stock101.restclient.stock.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@Getter @Setter @Builder
@AllArgsConstructor @NoArgsConstructor
public class StockPriceChartDto {
    private Long stockId;          // stock_id (BIGINT)
    private String stockPricePk;   // stock_price_pk (CHAR)
    private LocalDateTime datetime; // datetime (DATETIME)
    private Double open;           // open (DOUBLE)
    private Double high;           // high (DOUBLE)
    private Double low;            // low (DOUBLE)
    private Double last;           // last (DOUBLE)
}