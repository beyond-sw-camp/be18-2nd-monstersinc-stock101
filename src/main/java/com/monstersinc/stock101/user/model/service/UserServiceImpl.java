package com.monstersinc.stock101.user.model.service;

import com.monstersinc.stock101.common.model.vo.CommonConstants;
import com.monstersinc.stock101.exception.GlobalException;
import com.monstersinc.stock101.exception.message.GlobalExceptionMessage;
import com.monstersinc.stock101.user.model.dto.UserRegisterRequestDto;
import com.monstersinc.stock101.user.model.dto.UpdateProfileRequestDto;
import com.monstersinc.stock101.user.model.mapper.UserMapper;
import com.monstersinc.stock101.user.model.vo.Role;
import com.monstersinc.stock101.user.model.vo.User;
import com.monstersinc.stock101.user.model.vo.UserProfile;
import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.List;

@Service
@RequiredArgsConstructor
public class UserServiceImpl implements UserService {
    private final UserMapper userMapper;
    private final PasswordEncoder passwordEncoder;

    @Transactional
    @Override
    public User registerUser(UserRegisterRequestDto userRegisterRequestDto) {

        User getUser = this.getUserByEmail(userRegisterRequestDto.getEmail());

        if (getUser != null) {
            if (getUser.getDeletedAt() == null ||
                    ChronoUnit.DAYS.between(getUser.getDeletedAt(), LocalDateTime.now()) < CommonConstants.USER_DELETION_EXPIRE_DAYS) {

                // 2주가 지나지 않은 계정 또는 활성 계정 -> 에러
                throw new GlobalException(GlobalExceptionMessage.DUPLICATE_EMAIL);
            }

            String markedEmail = getUser.getEmail() + "_DEL_" + getUser.getDeletedAt().format(DateTimeFormatter.ofPattern("yyyyMMdd"));

            userMapper.updateEmail(getUser.getUserId(), markedEmail);

        }

        String encodedPassword = passwordEncoder.encode(userRegisterRequestDto.getPassword());

        User user = User.builder()
                .password(encodedPassword)
                .email(userRegisterRequestDto.getEmail()) // 새 레코드에는 원래 이메일 등록
                .name(userRegisterRequestDto.getName())
                .createdAt(LocalDateTime.now())
                .role(Role.USER)
                .tierCode("BRONZE")
                .build();

        userMapper.insertUser(user);

        return user;
    }

    @Transactional
    @Override
    public User updateProfile(Long userId, UpdateProfileRequestDto updateProfileRequestDto) {

        User user = getUserByUserId(userId);

        user.update(updateProfileRequestDto);

        userMapper.updateUserProfile(user);
        return user;
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByEmail(String email) {
        return userMapper.findByEmail(email).orElse(null);
    }

    @Transactional(readOnly = true)
    @Override
    public User getUserByUserId(Long userId) {
        return userMapper.findByUserId(userId).orElse(null);
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

        userMapper.updateUserProfile(user);
    }

    @Override
    public List<User> getBestPredictors() {
        return userMapper.selectBestPredictors();
    }

    @Override
    public UserProfile getUserProfileById(Long userId) {
        return userMapper.getUserProfileById(userId);
    }


}
