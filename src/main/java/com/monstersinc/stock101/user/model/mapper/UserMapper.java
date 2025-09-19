package com.monstersinc.stock101.user.model.mapper;

import com.monstersinc.stock101.user.model.vo.User;
import jakarta.validation.constraints.NotBlank;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.Optional;

@Mapper
public interface UserMapper {

    // 사용자 정보 저장.
    void insertUser(User user);

    // 유저 조회
    Optional<User> findByEmail(@NotBlank(message = "이메일은 필수 입력 값입니다.") String email);

    Optional<User> findByUserId(Long userId);

    // 이메일로 유저가 존재하는지 확인한다.
    boolean existsByEmail(String email);

    // userId(PK) 값으로 유저가 존재하는지 확인한다.
    boolean existsByUserId(Long userId);

    void updateUser(User user);

    void updateEmail(@Param("userId")Long userId, @Param("email")String markedEmail);}
