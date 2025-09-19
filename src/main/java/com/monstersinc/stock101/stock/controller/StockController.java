package com.monstersinc.stock101.stock.controller;

import com.monstersinc.stock101.common.model.dto.ItemsResponseDto;
import com.monstersinc.stock101.stock.model.service.StockService;
import com.monstersinc.stock101.stock.model.vo.Stock;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/v1/stock")
@RequiredArgsConstructor
public class StockController {
    private final StockService stockService;

    // 모든 주식 정보 조회
    @GetMapping
    public ResponseEntity<ItemsResponseDto<Stock>> getAllStocks() {
        List<Stock> stocks = stockService.getStockList();
        return ResponseEntity.ok(ItemsResponseDto.ofAll(HttpStatus.OK, stocks));
    }

    // 특정 주식 정보 조회
    @GetMapping("/{stockId}")
    public ResponseEntity<Stock> getStockById(@PathVariable long stockId) {
        Stock stock = stockService.getStockById(stockId);
        return ResponseEntity.ok(stock);
    }
}
