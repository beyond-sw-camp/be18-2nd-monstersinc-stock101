package com.monstersinc.stock101.restclient.stock.model.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @Builder
@AllArgsConstructor @NoArgsConstructor
public class StockPriceDto { 
    private Long id;
    private LocalDateTime from;
    private double fluctuation;
    private String symbol;
    private double close;
    private String PK;
}
