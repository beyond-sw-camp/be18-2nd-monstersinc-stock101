package com.monstersinc.stock101.indicator.model.service;

import com.monstersinc.stock101.indicator.model.vo.AnalystIndicator;
import com.monstersinc.stock101.indicator.model.vo.FinancialIndicator;
import com.monstersinc.stock101.indicator.model.vo.IndividualIndicator;
import com.monstersinc.stock101.indicator.model.vo.NewsIndicator;

public interface IndicatorService {
    IndividualIndicator getIndividualIndicator(long stockId);

    AnalystIndicator getAnalystIndicator(long stockId);

    NewsIndicator getNewsIndicator(long stockId);

    FinancialIndicator getFinancialIndicator(long stockId);
}
