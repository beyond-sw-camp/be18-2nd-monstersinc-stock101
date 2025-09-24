package com.monstersinc.stock101.user.model.vo;

import com.monstersinc.stock101.user.model.dto.UpdateProfileRequestDto;
import lombok.*;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.Collection;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class UserProfile  {
    private Long userId;

    private String email;

    private String name;

    private String tierCode;

    private String statusMessage;

    private String imageUrl;

}
