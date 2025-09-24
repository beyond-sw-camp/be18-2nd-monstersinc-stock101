package com.monstersinc.stock101.user.model.service;

import com.monstersinc.stock101.user.model.dto.UserRegisterRequestDto;
import com.monstersinc.stock101.user.model.dto.UpdateProfileRequestDto;
import com.monstersinc.stock101.user.model.vo.User;

import java.util.List;

public interface UserService {
    User registerUser(UserRegisterRequestDto userRegisterRequestDto);

    User updateProfile(Long userId, UpdateProfileRequestDto userRequestDto);

    User getUserByEmail(String email);

    User getUserByUserId(Long userId);

    boolean checkEmailExists(String email);

    void softDeleteUser(Long userId);

    List<User> getBestPredictors();
}
