package com.monstersinc.stock101.user.model.vo;

import com.monstersinc.stock101.user.model.dto.UserUpdateRequestDto;
import lombok.*;
import org.springframework.context.annotation.Bean;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.SimpleTimeZone;
import java.util.stream.Collectors;

@Data
@NoArgsConstructor
@AllArgsConstructor
@ToString
@Builder
public class User implements UserDetails {
    private Long userId;

    private String email;

    private String name;

    @Builder.Default
    private List<String> roles = new ArrayList<>();

    private String password;

    private LocalDateTime createdAt;

    private LocalDateTime lastLoginAt;

    private String tierCode;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();

        return this.roles.stream().map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());
    }

    @Override
    public String getUsername() {
        return this.name;
    }

    public String getUserEmail(){
        return this.email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return UserDetails.super.isAccountNonExpired();
    }

    @Override
    public boolean isAccountNonLocked() {
        return UserDetails.super.isAccountNonLocked();
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return UserDetails.super.isCredentialsNonExpired();
    }

    @Override
    public boolean isEnabled() {
        return UserDetails.super.isEnabled();
    }

    public void update(UserUpdateRequestDto dto, String  encodedPassword) {

        if (dto.hasName()) {
            this.name = dto.getName();
        }

        if(dto.hasTierCode()){
            this.tierCode = dto.getTierCode();
        }

        if (dto.hasEmail()) {
            this.email = dto.getEmail();
        }

        // encodedPassword는 단순 문자열로 취급, 암호화 로직이 없음
        if (encodedPassword != null) {
            this.password = encodedPassword;
        }
    }

}
