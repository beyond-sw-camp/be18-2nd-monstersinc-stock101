package com.monstersinc.stock101.auth.model.service;

import com.monstersinc.stock101.auth.model.dto.LoginResponse;
import jakarta.validation.constraints.NotBlank;

public interface AuthService {
    LoginResponse login(@NotBlank String email, @NotBlank String password);

    String createRefreshToken(Long userId);

    void logout(String bearerToken);

    LoginResponse refreshAccessToken(String refreshToken);
}
