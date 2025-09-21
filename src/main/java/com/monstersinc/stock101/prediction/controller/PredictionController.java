package com.monstersinc.stock101.prediction.controller;


import com.monstersinc.stock101.common.model.dto.BaseResponseDto;
import com.monstersinc.stock101.common.model.dto.ItemsResponseDto;
import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.message.GlobalExceptionMessage;
import com.monstersinc.stock101.prediction.model.dto.PredictionRequestDto;
import com.monstersinc.stock101.prediction.model.service.PredictionService;
import com.monstersinc.stock101.prediction.model.vo.Prediction;
import com.monstersinc.stock101.user.model.vo.User;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;


@RestController
@RequestMapping("/api/v1/prediction")
@RequiredArgsConstructor
public class PredictionController {
    private final PredictionService predictionService;

    @PostMapping("/create")
    public ResponseEntity<BaseResponseDto<Prediction>> create(
            @AuthenticationPrincipal User authenticationUser,
            @Valid @RequestBody PredictionRequestDto dto
    ) {
        long userId = authenticationUser.getUserId();
        Prediction prediction = dto.toPrediction(userId);

        // 중복 예측 방지: 같은 종목(stockId)에 대해 미채점(result IS NULL) 예측이 존재하면 차단
        if (predictionService.existsPendingPrediction(userId, dto.getStockId())) {
            throw new GlobalException(GlobalExceptionMessage.DUPLICATE_PREDICTION);
        }

        // INSERT (generated key -> entity.predictionId 세팅)
        predictionService.insertPrediction(prediction);

        // 방금 생성한 행 조회해서 반환
        Prediction saved = predictionService.selectById(prediction.getPredictionId());

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new BaseResponseDto<>(HttpStatus.CREATED, saved));
    }

    @GetMapping
    public ResponseEntity<ItemsResponseDto<Prediction>> getByUserId(
            @AuthenticationPrincipal User authenticationUser
    ) {
        long userId = authenticationUser.getUserId();
        List<Prediction> predictions = predictionService.selectByUserId(userId);

        return ResponseEntity.status(HttpStatus.OK)
                .body( ItemsResponseDto.ofAll(HttpStatus.OK, predictions));
    }
}
