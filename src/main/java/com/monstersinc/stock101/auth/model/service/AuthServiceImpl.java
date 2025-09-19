package com.monstersinc.stock101.auth.model.service;

import com.monstersinc.stock101.auth.jwt.JwtTokenProvider;
import com.monstersinc.stock101.auth.jwt.JwtUtil;
import com.monstersinc.stock101.auth.model.dto.LoginResponse;
import com.monstersinc.stock101.auth.model.mapper.AuthMapper;
import com.monstersinc.stock101.common.model.vo.CommonConstants;
import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.message.GlobalExceptionMessage;
import com.monstersinc.stock101.user.model.vo.User;
import jakarta.security.auth.message.AuthException;
import lombok.RequiredArgsConstructor;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
@RequiredArgsConstructor
public class AuthServiceImpl implements AuthService {


    private final AuthMapper authMapper;
    private final JwtTokenProvider jwtTokenProvider;
    private final PasswordEncoder passwordEncoder;
    private final JwtUtil jwtUtil;
    private final RedisTemplate<Object, Object> redisTemplate;

    @Override
    public LoginResponse login(String email, String password) {

        // 로그인시 회원 탈퇴 요청 한지 2주 이내 계정이면 탈퇴 취소한다.

        // 탈퇴 요청 한지 2주 지난 계정이라면 유효계정인지 확인한다.
        User user = authMapper.selectUserByEmail(email);

        if (user == null || !passwordEncoder.matches(password, user.getPassword())) {
            throw new GlobalException(GlobalExceptionMessage.DUPCLICATE_EMAIL);
        }

        LocalDateTime requestedAt = user.getDeletedAt();
        //회원 탈퇴 요청자라면
        if(requestedAt !=null){
            LocalDateTime  now =  LocalDateTime.now();
            long daysBetween = ChronoUnit.DAYS.between(requestedAt,now);

            // 2주 안된 계정이라면 사용가능하게만든다.
            if(daysBetween< CommonConstants.USER_DELETION_EXPIRE_DAYS ){
                // 현재 user 객체의 상태도 업데이트 (이후 로직을 위해)
                user.setDeletedAt(null);
                authMapper.cancelDeleteUser(user.getUserId());

            }else{// 2주 지난 계정이라면 예외처리
                throw new GlobalException(GlobalExceptionMessage.DUPCLICATE_EMAIL);
            }
        }

        return createLoginResponse(user);
    }

    private LoginResponse createLoginResponse(User user) {

        List<String> rolesList = user.getAuthorities().stream().map(GrantedAuthority::getAuthority).toList();

        // AccessToken 생성
        String accessToken = jwtTokenProvider.createAccessToken(user.getUserId(),rolesList);

        return LoginResponse.builder()
                .accessToken(accessToken)
                .userId(user.getUserId())
                .type("Bearer")
                .issuedAt(jwtUtil.getIssuedAt(accessToken))
                .expiresAt(jwtUtil.getExpiration(accessToken))
                .roles(rolesList)
                .build();
    }

    @Override
    public String createRefreshToken(Long userId) {

        return jwtTokenProvider.createRefreshToken(userId);

    }

    @Override
    public void logout(String bearerToken) {
        String accessToken = jwtTokenProvider.resolveToken(bearerToken);
        jwtTokenProvider.addBlacklist(accessToken);
        jwtTokenProvider.deleteRefreshToken(accessToken);
    }
}
