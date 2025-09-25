package com.monstersinc.stock101.restclient.stock.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monstersinc.stock101.restclient.stock.model.dto.StockPriceChartDto;
import com.monstersinc.stock101.restclient.stock.model.service.StockRestClientService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/")
public class StockRestClientController {

    private final StockRestClientService stockRestClientService;
    @GetMapping("rest-client/getStockPrice/{ticker}")
    public List<StockPriceChartDto> getStockPrice(
        @PathVariable String ticker
        ) {
        return stockRestClientService.getStockprices(ticker);
    }
    
    @GetMapping("rest-client/getFinancialInfo")
    public String getFinancialInfo() {
        return stockRestClientService.getFinancialInfo("annual");
    }
    @GetMapping("rest-client/getnews")
    public String getNews() {
        return stockRestClientService.getNews();
    }
    @GetMapping("rest-client/getOauth")
    public void getOauth() {
        stockRestClientService.getOAuthToken();
    }
    
    
    
}
