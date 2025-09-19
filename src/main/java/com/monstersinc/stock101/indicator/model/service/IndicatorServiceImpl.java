package com.monstersinc.stock101.indicator.model.service;

import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.message.GlobalExceptionMessage;
import com.monstersinc.stock101.indicator.model.mapper.IndicatorMapper;
import com.monstersinc.stock101.indicator.model.vo.AnalystIndicator;
import com.monstersinc.stock101.indicator.model.vo.IndividualIndicator;
import com.monstersinc.stock101.indicator.model.vo.NewsIndicator;
import com.monstersinc.stock101.stock.model.mapper.StockMapper;
import com.monstersinc.stock101.stock.model.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class IndicatorServiceImpl implements IndicatorService {
    private final IndicatorMapper indicatorMapper;
    @Override
    public IndividualIndicator getIndividualIndicator(long stockId) {
        IndividualIndicator indicator =
        indicatorMapper.selectIndividualIndicatorByStockId(stockId);

        if(indicator == null) {
             throw new GlobalException(GlobalExceptionMessage.INDICATOR_NOT_FOUND);
        }
        return indicator;
    }

    @Override
    public AnalystIndicator getAnalystIndicator(long stockId) {
        AnalystIndicator indicator =
        indicatorMapper.selectAnalystIndicatorByStockId(stockId);

        if(indicator == null) {
                throw new GlobalException(GlobalExceptionMessage.INDICATOR_NOT_FOUND);
        }
        return indicator;
    }

    @Override
    public NewsIndicator getNewsIndicator(long stockId) {
        NewsIndicator indicator =
         indicatorMapper.selectNewsIndicatorByStockId(stockId);

        if(indicator == null) {
            throw new GlobalException(GlobalExceptionMessage.INDICATOR_NOT_FOUND);
        }
            return indicator;
    }
}
