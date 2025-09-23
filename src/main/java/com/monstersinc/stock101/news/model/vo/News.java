package com.monstersinc.stock101.news.model.vo;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class News {
    private String newsId;
    private String link;
    private String title;
    private String contentSummary;
    private LocalDateTime publishedAt;
    private String result;
    private int clickCount;
    private Long stockId;
    private String img_url;
}
