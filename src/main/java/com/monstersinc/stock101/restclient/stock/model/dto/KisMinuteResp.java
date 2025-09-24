package com.monstersinc.stock101.restclient.stock.model.dto;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter @Setter @Builder
@AllArgsConstructor @NoArgsConstructor
public class KisMinuteResp {
    private Output1 output1;
    private java.util.List<Bar> output2;
    private String rt_cd;
    private String msg_cd;
    private String msg1;

@Getter @Setter @Builder
@AllArgsConstructor @NoArgsConstructor
    public static class Output1 {
        private String rsym;
        private String zdiv;
        private String stim; // ET HHMMSS
        private String etim; // ET HHMMSS
        private String sktm; // KST HHMMSS
        private String ektm; // KST HHMMSS
        private String next; // "1" or "0"
        private String more;
        private String nrec;
    }

@Getter @Setter @Builder
@AllArgsConstructor @NoArgsConstructor
    public static class Bar {
        private String tymd; // 원장일 (문서 용도, 보통 x/k중 하나)
        private String xymd; // ET yyyyMMdd
        private String xhms; // ET HHmmss
        private String kymd; // KST yyyyMMdd
        private String khms; // KST HHmmss
        private String open;
        private String high;
        private String low;
        private String last;
        private String evol; // 거래량(또는 체결수)
        private String eamt; // 거래대금
    }
}