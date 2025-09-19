package com.monstersinc.stock101.exception.message;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;


@Getter
@RequiredArgsConstructor
public enum GlobalExceptionMessage {

    EMAIL_NOT_FOUND("이메일 정보를 찾을 수 없습니다.", HttpStatus.NOT_FOUND),

    USER_NOT_FOUND("유저 정보를 찾을 수 없습니다.",HttpStatus.NOT_FOUND),

    UNAUTHORIZED_ACCESS("유저 정보를 찾을 수 없습니다.", HttpStatus.BAD_REQUEST),

    UNAUTHORIZED_USER("로그인이 필요합니다.", HttpStatus.UNAUTHORIZED);

    private final String message;

    private final HttpStatus status;
}
