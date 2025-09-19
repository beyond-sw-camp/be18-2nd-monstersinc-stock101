package com.monstersinc.stock101.news.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

import java.time.LocalDateTime;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
public class News {
    private Long newsId;
    private String link;
    private String title;
    private String contentSummary;
    private LocalDateTime publishedAt;
    private String result;
    private int clickCount;
    private Long stockId;
}
