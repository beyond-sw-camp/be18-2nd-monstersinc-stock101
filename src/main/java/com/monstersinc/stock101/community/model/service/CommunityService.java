package com.monstersinc.stock101.community.model.service;

import com.monstersinc.stock101.community.model.dto.CommentRequestDto;
import com.monstersinc.stock101.community.model.dto.CommentResponseDto;
import com.monstersinc.stock101.community.model.dto.PostRequestDto;
import com.monstersinc.stock101.community.model.dto.PostResponseDto;

import java.util.List;

public interface CommunityService {
    long saveAPost(long userId, PostRequestDto dto);

    PostResponseDto getAPost(long postId);

    PostResponseDto getPostDetail(long postId);

    List<PostResponseDto> getPostListByStock(long stockId);

    void delete(long postId);

    void likePost(long postId, long userId);

    void unlikePost(long postId, long userId);

    List<CommentResponseDto> getCommentListByPost(long postId);

    long saveAComment(CommentRequestDto requestDto);

    CommentResponseDto getAComment(long commentId);

    void deleteComment(long commentId);

    List<PostResponseDto> getPostListByUserId(Long userId);
}
