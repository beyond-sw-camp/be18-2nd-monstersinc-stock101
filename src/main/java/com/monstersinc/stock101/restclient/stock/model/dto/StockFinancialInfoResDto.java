package com.monstersinc.stock101.restclient.stock.model.dto;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @Builder
@AllArgsConstructor @NoArgsConstructor
public class StockFinancialInfoResDto {
    private String ticker;
    private long stockId;
    private String timeframe;
    private int quarter;
    private String periodEnd;
    private Double roe;
    private Double roa;
    private Double eps;
    private Double bps;
}