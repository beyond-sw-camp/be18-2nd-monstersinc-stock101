package com.monstersinc.stock101.restclient.stock.model.dto;

import lombok.Data;

@Data
public class OverseasPrciceDetailResponse {
    private String rt_cd;
    private String msg_cd;
    private String msg1;
    private Output output;

    @Data
    public static class Output {
        private String excd;   // 거래소 코드
        private String symb;   // 종목 코드
        private double last;   // 현재가
        private String sign;   // 등락부호
        private String diff;   // 전일 대비
        private String rate;   // 등락률
        private String vol;    // 거래량
    }
}