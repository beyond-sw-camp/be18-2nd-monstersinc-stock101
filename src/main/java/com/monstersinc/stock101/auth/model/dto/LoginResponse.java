package com.monstersinc.stock101.auth.model.dto;


import lombok.Builder;
import lombok.Getter;
import lombok.RequiredArgsConstructor;
import lombok.ToString;

import java.util.List;

@Getter
@ToString
@Builder
@RequiredArgsConstructor
public class LoginResponse {
    private final String accessToken;

    private final Long userId;

    private final String userName;

    private final String tierCode;

    private final String imageURL;

    private final String statusMessage;

    private final String type;

    private final List<String> roles;

    private final long issuedAt;

    private final long expiresAt;

}
