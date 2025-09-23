package com.monstersinc.stock101.indicator.model.mapper;

import com.monstersinc.stock101.indicator.model.vo.AnalystIndicator;
import com.monstersinc.stock101.indicator.model.vo.FinancialIndicator;
import com.monstersinc.stock101.indicator.model.vo.IndividualIndicator;
import com.monstersinc.stock101.indicator.model.vo.NewsIndicator;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface IndicatorMapper {

    IndividualIndicator selectIndividualIndicatorByStockId(long stockId);

    AnalystIndicator selectAnalystIndicatorByStockId(long stockId);

    NewsIndicator selectNewsIndicatorByStockId(long stockId);

    FinancialIndicator selectFinancialIndicatorByStockId(long stockId);
}
