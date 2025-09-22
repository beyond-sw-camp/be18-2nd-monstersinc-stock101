package com.monstersinc.stock101.prediction.model.dto;

import com.monstersinc.stock101.prediction.model.vo.Prediction;
import com.monstersinc.stock101.prediction.model.vo.PredictionType;
import jakarta.validation.constraints.NotNull;
import lombok.*;

import java.time.LocalDateTime;

@Getter @Setter
@NoArgsConstructor @AllArgsConstructor
@Builder
public class PredictionRequestDto {

    /** 예측 대상 종목 */
    @NotNull
    private Long stockId; // DB: stock_id

    /** 예측 방향 (UP / DOWN) */
    @NotNull
    private PredictionType prediction; // DB: prediction

    /** 컨트롤러에서 userId 주입하여 VO 변환 */
    public Prediction toPrediction(long userId) {
        return Prediction.builder()
                .userId(userId)
                .stockId(stockId)
                .prediction(prediction)
                .predictedAt(null)     // null이면 XML에서 DEFAULT 사용
                .evaluatedAt(null)            // 반드시 null로 생성
                .actualPrice(null)            // 반드시 null로 생성
                .result(null)                 // 반드시 null로 생성
                .build();
    }
}