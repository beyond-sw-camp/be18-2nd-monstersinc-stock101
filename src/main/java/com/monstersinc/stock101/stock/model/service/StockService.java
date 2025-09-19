package com.monstersinc.stock101.stock.model.service;

import com.monstersinc.stock101.stock.model.vo.Stock;

import java.util.List;

public interface StockService {
    List<Stock> getStockList();

    Stock getStockById(long stockId);
}
