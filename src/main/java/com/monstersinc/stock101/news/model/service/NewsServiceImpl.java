package com.monstersinc.stock101.news.model.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.monstersinc.stock101.news.model.mapper.NewsMapper;
import com.monstersinc.stock101.news.model.vo.News;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NewsServiceImpl implements NewsService {
    private final NewsMapper newsMapper;

    @Override
    public List<News> getPopularNews() {
        return newsMapper.selectPopularNews();
    }

    @Override
    public void clickNews(long newsId) {
        newsMapper.updateNewsClick(newsId);
    }
}
