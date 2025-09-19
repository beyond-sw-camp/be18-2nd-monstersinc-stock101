package com.monstersinc.stock101.news.model.mapper;

import com.monstersinc.stock101.news.model.vo.News;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface NewsMapper {
    public List<News> selectPopularNews();

    void updateNewsClick(@Param("newsId") long newsId);
}