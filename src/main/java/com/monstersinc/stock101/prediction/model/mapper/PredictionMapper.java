package com.monstersinc.stock101.prediction.model.mapper;

import com.monstersinc.stock101.prediction.model.vo.Prediction;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PredictionMapper {

    void insertPrediction(Prediction prediction);

    Prediction selectById(Long predictionId);

    List<Prediction> selectByUserId(long userId);

    boolean existsPendingPrediction(long userId, long stockId);
}
