package com.monstersinc.stock101.restclient.stock.model.service;

import java.util.List;

import com.monstersinc.stock101.restclient.stock.model.dto.StockPriceChartDto;

public interface StockRestClientService {
    List<StockPriceChartDto> getStockprices(String Ticker);
    String getFinancialInfo(String timeframe);
    String getNews();
    void getOAuthToken();
}
