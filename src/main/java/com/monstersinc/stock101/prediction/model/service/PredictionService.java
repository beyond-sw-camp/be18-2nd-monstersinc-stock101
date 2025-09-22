package com.monstersinc.stock101.prediction.model.service;

import com.monstersinc.stock101.prediction.model.vo.Prediction;
import jakarta.validation.constraints.NotNull;

import java.util.List;

public interface PredictionService  {
    void insertPrediction(Prediction prediction);

    Prediction selectById(Long predictionId);


    List<Prediction> selectByUserId(long userId);

    boolean existsPendingPrediction(long userId, @NotNull Long stockId);
}
