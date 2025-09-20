package com.monstersinc.stock101.exception.handler;


import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.dto.ApiErrorResponseDto;
import jakarta.validation.ConstraintViolation;
import jakarta.validation.ConstraintViolationException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.HandlerMethodValidationException;

import java.util.stream.Collectors;


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
    @ExceptionHandler(HandlerMethodValidationException.class)
    public ResponseEntity<ApiErrorResponseDto> handleConstraintViolationException(HandlerMethodValidationException e) {

        String violationMessages = "Request가 잘못된 형식입니다.";

        log.error("ConstraintViolationException: {}", violationMessages, e);

        // BAD_REQUEST (400) 상태로 응답 DTO를 생성합니다.
        return new ResponseEntity<>(
                new ApiErrorResponseDto(
                        HttpStatus.BAD_REQUEST.value(),
                        "INVALID_INPUT_FORMAT",
                        violationMessages
                ),
                HttpStatus.BAD_REQUEST // 400 Bad Request
        );
    }

}
