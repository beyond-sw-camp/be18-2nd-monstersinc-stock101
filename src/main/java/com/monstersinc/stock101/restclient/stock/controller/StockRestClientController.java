package com.monstersinc.stock101.restclient.stock.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monstersinc.stock101.restclient.stock.model.service.StockRestClientService;

import lombok.RequiredArgsConstructor;




@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/")
public class StockRestClientController {

    private final StockRestClientService stockRestClientService;
    @GetMapping("rest-client/getStockPrice")
    public String getStockPrice() {
        return stockRestClientService.getStockprices();
    }
    

    @GetMapping("rest-client/getFinancialInfo")
    public String getFinancialInfo() {
        return stockRestClientService.getFinancialInfo("annual");
    }
    @GetMapping("rest-client/getNews")
    public String getNews() {
        return "news";
    }

}
