package com.monstersinc.stock101.user.model.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

// 유저 회원가입시 이메일, 이름, 비밀 번호가 필요합니다.
@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserRegisterRequestDto {

    @Email()
    @NotBlank(message = "이메일은 필수 입력 값입니다.")
    private String email;

    @NotBlank(message = "이름은 필수 입력 값입니다.")
    private String name;

    @NotBlank(message = "비밀번호는 필 수 입력 값입니다.")
    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,}$",
            message = "비밀번호는 8자 이상, 영문 , 숫자를 포함해야 합니다.")
    private String password;

}
