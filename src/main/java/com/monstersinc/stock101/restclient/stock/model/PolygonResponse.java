package com.monstersinc.stock101.restclient.stock.model;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;

@Getter
@JsonIgnoreProperties(ignoreUnknown = true)
public class PolygonResponse {
    private List<Result> results;

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Result {
        @JsonProperty("end_date")
        private String endDate;

        private Financials financials;
    }

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class Financials {
        @JsonProperty("balance_sheet")
        private BalanceSheet balanceSheet;

        @JsonProperty("income_statement")
        private IncomeStatement incomeStatement;
    }

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class BalanceSheet {
        // 자본
        @JsonProperty("equity_attributable_to_parent")
        private ValueNode equityAttributableToParent;

        // 자산
        private ValueNode assets;
    }

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class IncomeStatement {
        // 당기순이익
        @JsonProperty("net_income_loss")
        private ValueNode netIncomeLoss;

        // EPS
        @JsonProperty("basic_earnings_per_share")
        private ValueNode basicEps;

        // 평균 발행주식수
        @JsonProperty("basic_average_shares")
        private ValueNode basicAverageShares;
    }

    @Getter
    @JsonIgnoreProperties(ignoreUnknown = true)
    public static class ValueNode {
        // Polygon 대부분 숫자 필드가 {"value": ...} 형태라 이 구조로 받음
        private Double value;
    }
}