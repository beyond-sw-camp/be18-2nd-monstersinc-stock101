package com.monstersinc.stock101.restclient.stock.model.service;

public interface StockRestClientService {
    String getStockprices();
    String getFinancialInfo(String timeframe);
    String getNews();
}
