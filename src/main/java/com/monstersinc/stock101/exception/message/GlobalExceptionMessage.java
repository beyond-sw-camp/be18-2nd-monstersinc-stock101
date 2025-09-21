package com.monstersinc.stock101.exception.message;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;


@Getter
@RequiredArgsConstructor
public enum GlobalExceptionMessage {

    DUPLICATE_EMAIL("중복된 이메일 입니다.", HttpStatus.CONFLICT),

    USER_NOT_FOUND("유저 정보를 찾을 수 없습니다.",HttpStatus.NOT_FOUND),

    UNAUTHORIZED_TOKEN("유효한 인증 토큰이 없습니다.", HttpStatus.UNAUTHORIZED),
  
    UNAUTHORIZED_USER("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED),

    INDICATOR_NOT_FOUND("지표 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND),

    STOCK_NOT_FOUND("주식 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND);

    private final String message;

    private final HttpStatus status;
}
