package com.monstersinc.stock101.restclient.stock.model;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.monstersinc.stock101.restclient.stock.model.PolygonResponse.Financials;

import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class NewsPolygonResponse {
    private List<Result> results;

    @Getter
    public static class Result {
        private String id;
        private Financials financials;
        private String title;
        private List<String> tickers;
        private String description;
        @JsonProperty("article_url")
        private String articleUrl;
        @JsonProperty("published_utc")
        private String publishedUtc;
        private List<Insight> insights;
    }
}
