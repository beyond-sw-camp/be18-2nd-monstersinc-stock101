package com.monstersinc.stock101.community.model.service;

import com.monstersinc.stock101.community.model.dto.CommentRequestDto;
import com.monstersinc.stock101.community.model.dto.CommentResponseDto;
import com.monstersinc.stock101.community.model.dto.PostRequestDto;
import com.monstersinc.stock101.community.model.dto.PostResponseDto;
import jakarta.annotation.Nullable;

import java.util.List;
import java.util.Map;

public interface CommunityService {
    long saveAPost(long userId, PostRequestDto dto);

    PostResponseDto getPostDetail(long postId, @Nullable Long userId);

    List<PostResponseDto> getPostListByStock(long stockId, @Nullable Long userId);

    void delete(long postId);

    Map<String, Object> likePost(long postId, long userId);

    List<CommentResponseDto> getCommentListByPostId(long postId);

    long saveAComment(CommentRequestDto requestDto);

    CommentResponseDto getAComment(long commentId);

    void deleteComment(long commentId);

    List<PostResponseDto> getPostListByUserId(long writerId, @Nullable Long userId);
}
