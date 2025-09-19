package com.monstersinc.stock101.exception.handler;


import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.dto.ApiErrorResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(GlobalException.class)
    public ResponseEntity<ApiErrorResponseDto> handleException(GlobalException globalException) {

        log.error("GlobalException: {} ", globalException.getMessage());

        return new ResponseEntity<>(
                new ApiErrorResponseDto(globalException.getStatus().value() , globalException.getType() , globalException.getMessage()),
                globalException.getStatus()
        );
    }
}
