package com.monstersinc.stock101.user.model.dto;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class UserUpdateRequestDto {

    private String name;

    @Email
    private String email;

    @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9]{8,}$",
            message = "비밀번호는 8자 이상, 영문 , 숫자를 포함해야 합니다.")

    private String password;

    private String tierCode;

    public boolean hasEmail() {
        return email != null && !email.isBlank();
    }

    public boolean hasName() {
        return name != null && !name.isBlank();
    }

    public boolean hasPassword() {
        return password != null && !password.isBlank();
    }

    public boolean hasTierCode() {
        return tierCode != null && !tierCode.isBlank();
    }

}
