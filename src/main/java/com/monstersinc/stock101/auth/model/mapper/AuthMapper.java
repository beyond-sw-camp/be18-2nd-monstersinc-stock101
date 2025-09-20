package com.monstersinc.stock101.auth.model.mapper;

import com.monstersinc.stock101.user.model.vo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.time.LocalDateTime;

@Mapper
public interface AuthMapper {
    User selectUserByEmail(@Param("email") String email);

    User selectUserByUserId(@Param("userId") Long userId);

    void cancelDeleteUser(@Param("userId") Long userId);

    void updateLastLogin(@Param("userId") Long userId, @Param("now") LocalDateTime now);
}
