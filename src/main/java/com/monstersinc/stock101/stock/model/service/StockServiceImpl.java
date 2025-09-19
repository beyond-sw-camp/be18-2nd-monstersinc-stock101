package com.monstersinc.stock101.stock.model.service;

import com.monstersinc.stock101.stock.model.mapper.StockMapper;
import com.monstersinc.stock101.stock.model.vo.Stock;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class StockServiceImpl implements StockService {
    private final StockMapper stockMapper;

    @Override
    public List<Stock> getStockList() {
        return stockMapper.selectStockList();
    }

    @Override
    public Stock getStockById(long stockId) {
        return stockMapper.selectStockById(stockId);
    }
}
