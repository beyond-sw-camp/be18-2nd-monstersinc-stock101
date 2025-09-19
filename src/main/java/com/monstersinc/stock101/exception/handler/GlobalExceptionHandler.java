package com.monstersinc.stock101.exception.handler;


import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.dto.ApiErrorResponseDto;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;


@Slf4j
@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(GlobalException.class)
    public ResponseEntity<ApiErrorResponseDto> handleException(GlobalException authException) {

        log.error("authException: {} ", authException.getMessage());

        return new ResponseEntity<>(
                new ApiErrorResponseDto(authException.getStatus().value() , authException.getType() , authException.getMessage()),
                authException.getStatus()
        );
    }

}
