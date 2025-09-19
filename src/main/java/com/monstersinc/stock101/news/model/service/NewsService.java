package com.monstersinc.stock101.news.model.service;

import com.monstersinc.stock101.news.model.vo.News;

import java.util.List;

public interface NewsService {
    List<News> getPopularNews();

    void clickNews(long newsId);
}
