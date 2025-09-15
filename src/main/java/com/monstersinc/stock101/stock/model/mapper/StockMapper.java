package com.monstersinc.stock101.stock.model.mapper;

import com.monstersinc.stock101.stock.model.vo.Stock;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StockMapper {
    Stock selectStockById(long stockId);

    List<Stock> selectStockList();
}
