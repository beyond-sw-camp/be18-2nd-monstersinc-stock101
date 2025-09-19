package com.monstersinc.stock101.exception;


import com.monstersinc.stock101.exception.message.GlobalExceptionMessage;
import lombok.Getter;
import org.springframework.http.HttpStatus;

import java.io.Serial;

@Getter
public class GlobalException extends RuntimeException {

    @Serial
    private static final long serialVersionUID = -8661014816924751645L;

    private final String type;

    private final HttpStatus status;

    public GlobalException(GlobalExceptionMessage message) {
        super(message.getMessage());

        this.type = message.name();
        this.status = message.getStatus();
    }
}
