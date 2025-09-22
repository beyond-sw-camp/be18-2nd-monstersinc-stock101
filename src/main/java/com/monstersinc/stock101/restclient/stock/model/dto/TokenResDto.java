package com.monstersinc.stock101.restclient.stock.model.dto;

import com.fasterxml.jackson.databind.PropertyNamingStrategies;
import com.fasterxml.jackson.databind.annotation.JsonNaming;

import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

@Getter
@ToString
@RequiredArgsConstructor
public class TokenResDto {

    @JsonNaming(PropertyNamingStrategies.SnakeCaseStrategy.class)
        public record TokenRes(String accessToken, String accessTokenTokenExpired, String TokenType, Integer expiresIn) {
    }

}