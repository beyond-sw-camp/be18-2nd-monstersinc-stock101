package com.monstersinc.stock101.restclient.stock;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.beans.factory.annotation.Autowired;

import com.monstersinc.stock101.restclient.stock.model.dto.GetStockCodeDto;
import com.monstersinc.stock101.restclient.stock.model.service.StockRestClientServiceImpl;
import com.monstersinc.stock101.restclient.stock.model.mapper.StockRestClientMapper;

import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
public class StockRestClientServiceTest {

    @Autowired
    private StockRestClientServiceImpl service;

    @MockBean
    private StockRestClientMapper mapper;

    @Test
    public void testGetNewsForAAPL() throws Exception {
        // Arrange: mock mapper to return just AAPL ticker
        when(mapper.getAllStockCodes()).thenReturn(List.of(new GetStockCodeDto(1L, "AAPL")));

        // Act: call the service
        String res = service.getNews();

        // Assert: just ensure it returns successfully
        assertNotNull(res);
    }
}
