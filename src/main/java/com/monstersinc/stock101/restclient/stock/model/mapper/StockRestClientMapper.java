package com.monstersinc.stock101.restclient.stock.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.monstersinc.stock101.restclient.stock.model.dto.GetStockCodeDto;
import com.monstersinc.stock101.restclient.stock.model.dto.StockFinancialInfoInfoResDto;
import com.monstersinc.stock101.restclient.stock.model.dto.StockPriceDto;

@Mapper
public interface StockRestClientMapper {
    List<GetStockCodeDto> getAllStockCodes();
    boolean existsFinance(long stockId);
    void updateFinance(StockFinancialInfoInfoResDto stockInfoResDto);
    void insertFinance(StockFinancialInfoInfoResDto stockInfoResDtoLocal);
    double getStockPriceById(long stockId);
    void updateStockInfo(StockPriceDto StockPriceDto);
    void insertStockPrice(StockPriceDto StockPriceDto);
}