package com.monstersinc.stock101.restclient.stock.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.monstersinc.stock101.restclient.stock.model.dto.GetNewsDto;
import com.monstersinc.stock101.restclient.stock.model.dto.GetStockCodeDto;
import com.monstersinc.stock101.restclient.stock.model.dto.NewsIndicatorDto;
import com.monstersinc.stock101.restclient.stock.model.dto.StockFinancialInfoResDto;
import com.monstersinc.stock101.restclient.stock.model.dto.StockPriceDto;

@Mapper
public interface StockRestClientMapper {
    List<GetStockCodeDto> getAllStockCodes();
    boolean existsFinance(long stockId);
    void updateFinance(StockFinancialInfoResDto stockInfoResDto);
    void insertFinance(StockFinancialInfoResDto stockInfoResDtoLocal);
    double getStockPriceById(long stockId);
    void updateStockInfo(StockPriceDto StockPriceDto);
    void insertStockPrice(StockPriceDto StockPriceDto);
    void insertNews(GetNewsDto getNewsDto);
    boolean existsNews(String newsId);
    void insertInsight(NewsIndicatorDto newsIndicatorDto);
    GetStockCodeDto getStockIdByCode(String ticker);
}