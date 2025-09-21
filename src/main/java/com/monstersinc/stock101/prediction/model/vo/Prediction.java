package com.monstersinc.stock101.prediction.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Prediction {
    private Long predictionId;
    private Long userId;
    private Long stockId;
    private LocalDateTime predictedAt;
    private PredictionType prediction;      // UP/DOWN
    private LocalDateTime evaluatedAt;      // nullable
    private Double actualPrice;             // nullable
    private PredictionResult result;        // SUCCESS/FAILURE or null
}

