package com.monstersinc.stock101.community.model.service;

import com.monstersinc.stock101.community.model.dto.PostRequestDto;
import com.monstersinc.stock101.community.model.dto.PostResponseDto;

import java.util.List;
import java.util.Map;

public interface CommunityService {
    long save(PostRequestDto dto);                         // 생성

    PostResponseDto getAPost(long postId);             // 생성 직후/목록용

    PostResponseDto getPostDetail(long postId);

    List<PostResponseDto> getPostListByStock(long stockId);

    void delete(long postId);

   void likePost(long postId, long userId);

    void unlikePost(long postId, long userId);

}
