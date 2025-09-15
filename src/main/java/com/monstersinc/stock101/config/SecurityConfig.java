package com.monstersinc.stock101.config;

import com.monstersinc.stock101.auth.jwt.JwtAuthenticationFilter;
import io.micrometer.core.instrument.binder.logging.LogbackMetrics;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
@EnableWebSecurity
@RequiredArgsConstructor
public class SecurityConfig {
    private final JwtAuthenticationFilter jwtAuthenticationFilter;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, LogbackMetrics logbackMetrics) throws Exception {
        http
                .csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth-> auth
                        .requestMatchers("/api/v1/auth/login").permitAll()

                        // 2) 게시물 등록 회원만
                        .requestMatchers(HttpMethod.POST, "/api/v1/board/posts").authenticated()

                        // 3) 조회는 공개
                        .requestMatchers(HttpMethod.GET, "/api/v1/board/posts/**").permitAll()

                        // 4) 뉴스 조회, 클릭카운트 업데이트는 공개
                        .requestMatchers(HttpMethod.POST, "/api/v1/news/**").permitAll()

                        // 5) 주식은 조회만 있으므로 공개
                        .requestMatchers(HttpMethod.POST, "/api/v1/stock/**").permitAll()
                        // 나머지 요청은 일단 모두 허용.
                        .anyRequest().permitAll()
                )
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class)
                .logout(logout-> logout.disable());

        return http.build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {

        return new BCryptPasswordEncoder();
    }
}
