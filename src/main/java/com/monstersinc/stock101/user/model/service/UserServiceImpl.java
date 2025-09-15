package com.monstersinc.stock101.user.model.service;

import com.monstersinc.stock101.user.model.dto.UserRegisterRequestDto;
import com.monstersinc.stock101.user.model.dto.UserUpdateRequestDto;
import com.monstersinc.stock101.user.model.mapper.UserMapper;
import com.monstersinc.stock101.user.model.vo.User;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.util.NoSuchElementException;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    @Override
    public User registerUser(UserRegisterRequestDto userRegisterRequestDto) {

        if (this.checkEmailExists(userRegisterRequestDto.getEmail())) {
            throw new IllegalArgumentException("이미 가입된 이메일입니다.");
        }

        String encodedPassword = passwordEncoder.encode(userRegisterRequestDto.getPassword());

        User user = User.builder()
                .password(encodedPassword)
                .email(userRegisterRequestDto.getEmail())
                .name(userRegisterRequestDto.getName())
                .build();

        userMapper.insertUser(user);

        return user;
    }

    @Transactional
    @Override
    public User updateUserInfo(Long userId, UserUpdateRequestDto userUpdateRequestDto) {

        User user = getUserByUserId(userId);

        // 변경 이메일 중복 체크
        if (userUpdateRequestDto.hasEmail() && !userUpdateRequestDto.getEmail().equalsIgnoreCase(user.getEmail())) {
            if (userMapper.existsByEmail(userUpdateRequestDto.getEmail())) {
                throw new IllegalArgumentException("이미 사용중인 이메일입니다.");
            }
        }

        String encodedPassword = null;
        if(userUpdateRequestDto.hasPassword()){
            encodedPassword = passwordEncoder.encode(userUpdateRequestDto.getPassword());
        }

        user.update(userUpdateRequestDto,encodedPassword);

        userMapper.updateUser(user);
        return user;
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByEmail(String email) {
        return userMapper.findByEmail(email).orElseThrow(() ->
                new NoSuchElementException("사용자를 찾을 수 없습니다."));
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByUserId(Long userId) {
        return userMapper.findByUserId(userId).orElseThrow(() ->
                new NoSuchElementException("사용자를 찾을 수 없습니다."));
    }

    @Transactional(readOnly = true)
    @Override
    public boolean checkEmailExists(String email) {
        return userMapper.existsByEmail(email);
    }


    @Transactional
    @Override
    public void softDeleteUser(Long userId) {
        User user = getUserByUserId(userId);
        user.setDeletedAt(LocalDateTime.now());

        userMapper.updateUser(user);
    }

}
