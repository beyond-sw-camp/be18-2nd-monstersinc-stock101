package com.monstersinc.stock101.user.model.service;

import com.monstersinc.stock101.user.model.dto.UserRegisterRequestDto;
import com.monstersinc.stock101.user.model.dto.UserUpdateRequestDto;
import com.monstersinc.stock101.user.model.vo.User;
import jakarta.validation.Valid;
import jakarta.validation.constraints.Email;

import java.util.List;

public interface UserService {
    User registerUser(UserRegisterRequestDto userRegisterRequestDto);

    User updateUserInfo(Long userId,UserUpdateRequestDto userRequestDto);

    User getUserByEmail(String email);

    User getUserByUserId(Long userId);

    boolean checkEmailExists(String email);

    void softDeleteUser(Long userId);

    List<User> getBestPredictors();
}
