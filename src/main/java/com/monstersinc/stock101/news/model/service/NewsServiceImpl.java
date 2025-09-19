package com.monstersinc.stock101.news.model.service;

import com.monstersinc.stock101.news.model.mapper.NewsMapper;
import com.monstersinc.stock101.news.model.vo.News;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

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
