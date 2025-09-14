package com.monstersinc.stock101.user.controller;

import com.monstersinc.stock101.common.model.dto.BaseResponseDto;
import com.monstersinc.stock101.user.model.dto.UserRegisterRequestDto;
import com.monstersinc.stock101.user.model.dto.UserUpdateRequestDto;
import com.monstersinc.stock101.user.model.service.UserService;
import com.monstersinc.stock101.user.model.vo.User;
import io.swagger.v3.oas.annotations.media.ArraySchema;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/users")
@RequiredArgsConstructor
public class UserController {
    private final UserService userService;

    // 사용자 회원가입
    @PostMapping("/register")
    public ResponseEntity<BaseResponseDto<User>> registerUser(@RequestBody @Valid UserRegisterRequestDto userRequestDto) {

        User registeredUser = userService.registerUser(userRequestDto);

        return ResponseEntity.status(HttpStatus.CREATED)
                .body(new BaseResponseDto<>(HttpStatus.CREATED, registeredUser));
    }


    @GetMapping("/me")
    public ResponseEntity<BaseResponseDto<User>> getMe(@AuthenticationPrincipal User authenticationUser) {
        User user = userService.getUserByEmail(authenticationUser.getEmail());

        // user 정보를 리턴한다.
        return ResponseEntity.ok(new BaseResponseDto<>(HttpStatus.OK, user));
    }

    @GetMapping("/check-id")
    public ResponseEntity<BaseResponseDto<Map<String, Object>>> getCheckId(@RequestParam @Valid String email) {

        boolean isEmailExist = userService.checkEmailExists(email);

        Map<String, Object> data = new HashMap<>();

        if (isEmailExist) {
            data.put("available", false);
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(new BaseResponseDto<>(HttpStatus.BAD_REQUEST, data));
        } else {
            data.put("available", true);
        }

        return ResponseEntity.status(HttpStatus.OK).body(new BaseResponseDto<>(HttpStatus.OK, data));
    }


    @PatchMapping("/me")
    public ResponseEntity<BaseResponseDto<User>> updateMe(
            @AuthenticationPrincipal  User principal,
            @RequestBody @Valid UserUpdateRequestDto userRequestDto) {

        Long userId = principal.getUserId();
        User updateUserInfo = userService.updateUserInfo(userId,userRequestDto);

        return ResponseEntity.ok(new BaseResponseDto<>(HttpStatus.OK, updateUserInfo));

    }


    // @TODO 2주뒤에 삭제 => 정보 삭제 취소하는 경우  => 스프링 스케줄링 기능 사용해야함. user-001
}
