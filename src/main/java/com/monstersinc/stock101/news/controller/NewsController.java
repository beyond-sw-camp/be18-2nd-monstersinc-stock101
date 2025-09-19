package com.monstersinc.stock101.news.controller;

import com.monstersinc.stock101.common.model.dto.ItemsResponseDto;
import com.monstersinc.stock101.news.model.service.NewsService;
import com.monstersinc.stock101.news.model.vo.News;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.monstersinc.stock101.stock.model.service.StockService;

import lombok.RequiredArgsConstructor;

import java.util.List;

@RestController
@RequestMapping("/api/v1/news")
@RequiredArgsConstructor
public class NewsController {
    private final NewsService newsService;

    // 홈화면에 들어갈 인기 뉴스 6개 조회
    @GetMapping("/popular-news")
    @Cacheable(value = "newsCache", key = "'latestNews'")
    public ResponseEntity<ItemsResponseDto<News>> get6PopularNews() {
        List<News>  news = newsService.getPopularNews();
        return ResponseEntity.ok(ItemsResponseDto.ofAll(HttpStatus.OK, news));
    }

    // 뉴스 클릭 시 클릭 카운트 증가
    @PostMapping("/{newsId}/click" )
    public ResponseEntity<Void> clickNews(@PathVariable long newsId) {
        newsService.clickNews(newsId);
        return ResponseEntity.ok().build();
    }
}
