package com.monstersinc.stock101.restclient.stock.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monstersinc.stock101.restclient.stock.model.service.StockRestClientService;

import lombok.RequiredArgsConstructor;



@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/")
public class StockRestClientController {

    private final StockRestClientService stockRestClientService;

    @GetMapping("rest-client/getstockinfo/{stockCode}")
    public Object getStockInfo(@PathVariable String stockCode) {
    Object object = stockRestClientService.getStockInfo(stockCode);
        return object;
    }
    
    @GetMapping("rest-client/getstockprice/{stockCode}")
    public Object getStockprice(@PathVariable String stockCode) {
    Object object = stockRestClientService.getStockprice(stockCode);
        return object;
    }
}       
