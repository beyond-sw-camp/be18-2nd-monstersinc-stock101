package com.monstersinc.stock101.user.model.dto;

import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class UpdateProfileRequestDto {

    private String name;

    private String statusMessage;

    public boolean hasName() {
        return name != null && !name.isBlank();
    }

    public boolean hasStatusMessage() {
        return statusMessage != null && !statusMessage.isBlank();
    }

}
