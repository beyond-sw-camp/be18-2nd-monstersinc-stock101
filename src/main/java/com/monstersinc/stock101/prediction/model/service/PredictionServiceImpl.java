package com.monstersinc.stock101.prediction.model.service;

import com.monstersinc.stock101.prediction.model.mapper.PredictionMapper;
import com.monstersinc.stock101.prediction.model.vo.Prediction;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class PredictionServiceImpl implements PredictionService {
    private final PredictionMapper predictionMapper;

    @Override
    public void insertPrediction(Prediction prediction) {
        predictionMapper.insertPrediction(prediction);
    }

    @Override
    public Prediction selectById(Long predictionId) {
        return predictionMapper.selectById(predictionId);
    }

    @Override
    public List<Prediction> selectByUserId(long userId) {
        return predictionMapper.selectByUserId(userId);
    }

    @Override
    public boolean existsPendingPrediction(long userId, Long stockId) {
        return predictionMapper.existsPendingPrediction(userId, stockId);
    }
}
