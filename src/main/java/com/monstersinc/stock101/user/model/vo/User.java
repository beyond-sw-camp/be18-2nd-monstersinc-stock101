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
public class User implements UserDetails {
    private Long userId;

    private String email;

    private String name;

    private Role role;

    private String password;

    private LocalDateTime createdAt;

    private LocalDateTime lastLoginAt;

    private LocalDateTime deletedAt;

    private String tierCode;

    private String statusMessage;

    private String imageUrl;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {

        return List.of(new SimpleGrantedAuthority(this.role.name()));
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

    public void update(UpdateProfileRequestDto dto) {

        if (dto.hasName()) {
            this.name = dto.getName();
        }

        if(dto.hasStatusMessage()) {
            this.statusMessage = dto.getStatusMessage();
        }


    }

}
