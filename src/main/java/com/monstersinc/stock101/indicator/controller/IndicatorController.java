package com.monstersinc.stock101.indicator.controller;

import com.monstersinc.stock101.common.model.dto.BaseResponseDto;
import com.monstersinc.stock101.indicator.model.service.IndicatorService;
import com.monstersinc.stock101.indicator.model.vo.AnalystIndicator;
import com.monstersinc.stock101.indicator.model.vo.FinancialIndicator;
import com.monstersinc.stock101.indicator.model.vo.IndividualIndicator;
import com.monstersinc.stock101.indicator.model.vo.NewsIndicator;
import com.monstersinc.stock101.stock.model.service.StockService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api/v1/indicator-service")
@RequiredArgsConstructor
public class IndicatorController {
    private final IndicatorService indicatorService;

    // 개미 지표 조회
    // 개미 지표 조회 시, stockId 기준 가장 최근 지표 조회.
    @GetMapping("/individual-indicator" )
    public ResponseEntity<BaseResponseDto<IndividualIndicator>> getIndividualIndicator(@RequestParam long stockId) {
        IndividualIndicator indicator = indicatorService.getIndividualIndicator(stockId);

        if(indicator == null) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(new BaseResponseDto<>(HttpStatus.NO_CONTENT, null));
        }

        return ResponseEntity.ok(new BaseResponseDto<IndividualIndicator>(HttpStatus.OK, indicator));
    }

    // 전문가 지표 조회
    // 전문가 지표 조회 시, stockId 기준 가장 최근 지표 조회.
    @GetMapping("/analyst-indicator" )
    public ResponseEntity<BaseResponseDto<AnalystIndicator>> getAnalystIndicator(@RequestParam long stockId) {
        AnalystIndicator indicator = indicatorService.getAnalystIndicator(stockId);

        if(indicator == null) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(new BaseResponseDto<>(HttpStatus.NO_CONTENT, null));
        }

        return ResponseEntity.ok(new BaseResponseDto<AnalystIndicator>(HttpStatus.OK, indicator));
    }

    // 뉴스 지표 조회
    // 뉴스 지표 조회 시, stockId 기준 가장 최근 지표 조회.
    @GetMapping("/news-indicator" )
    public ResponseEntity<BaseResponseDto<NewsIndicator>> getNewsIndicator(@RequestParam long stockId) {
        NewsIndicator indicator = indicatorService.getNewsIndicator(stockId);

        if(indicator == null) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(new BaseResponseDto<>(HttpStatus.NO_CONTENT, null));
        }

        return ResponseEntity.ok(new BaseResponseDto<NewsIndicator>(HttpStatus.OK, indicator));
    }

    @GetMapping("/financial-indicator")
    public ResponseEntity<BaseResponseDto<FinancialIndicator>> getFinancialIndicator(@RequestParam long stockId) {
        FinancialIndicator indicator = indicatorService.getFinancialIndicator(stockId);

        if(indicator == null) {
            return ResponseEntity.status(HttpStatus.NO_CONTENT).body(new BaseResponseDto<>(HttpStatus.NO_CONTENT, null));
        }
        return ResponseEntity.ok(new BaseResponseDto<FinancialIndicator>(HttpStatus.OK, indicator));
    }
}
