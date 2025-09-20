package com.monstersinc.stock101.exception.handler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.monstersinc.stock101.exception.dto.ApiErrorResponseDto;
import com.monstersinc.stock101.exception.message.GlobalExceptionMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.http.MediaType;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;

import java.io.IOException;

public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {
    @Override
    public void commence(HttpServletRequest request,
                         HttpServletResponse response,
                         AuthenticationException authException) throws IOException {

        GlobalExceptionMessage em = GlobalExceptionMessage.UNAUTHORIZED_USER;

        ApiErrorResponseDto apiError = new ApiErrorResponseDto(
                em.getStatus().value(),
                em.name(),
                em.getMessage()
        );

        response.setStatus(em.getStatus().value());
        response.setContentType(MediaType.APPLICATION_JSON_VALUE);
        response.setCharacterEncoding("UTF-8");

        ObjectMapper objectMapper = new ObjectMapper();
        response.getWriter().write(objectMapper.writeValueAsString(apiError));
    }
}