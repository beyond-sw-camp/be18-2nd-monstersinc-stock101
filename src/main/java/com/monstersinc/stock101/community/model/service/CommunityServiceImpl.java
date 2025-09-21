package com.monstersinc.stock101.community.model.service;

import com.monstersinc.stock101.community.model.dto.CommentRequestDto;
import com.monstersinc.stock101.community.model.dto.CommentResponseDto;
import com.monstersinc.stock101.community.model.dto.PostRequestDto;
import com.monstersinc.stock101.community.model.dto.PostResponseDto;
import com.monstersinc.stock101.community.model.mapper.CommunityMapper;
import com.monstersinc.stock101.community.model.vo.Comment;
import com.monstersinc.stock101.community.model.vo.Post;
import jakarta.annotation.Nullable;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommunityServiceImpl implements CommunityService {
    private final CommunityMapper communityMapper;

    @Override
    @Transactional
    public long saveAPost(long userId, PostRequestDto dto) {
        Post post = dto.toPost();
        communityMapper.insertPost(userId, post);
        return post.getPostId();
    }

    @Override
    public PostResponseDto getPostDetail(long postId, @Nullable Long userId) {
        Post post = communityMapper.selectPostById(postId, userId);
        if (post == null) {
            throw new IllegalArgumentException("Post not found: " + postId);
        }
        return PostResponseDto.of(post);
    }

    @Override
    public List<PostResponseDto> getPostListByStock(long stockId, @Nullable Long userId) {
        List<Post> rows = communityMapper.selectPostsByStockId(stockId, userId);
        return PostResponseDto.of(rows);
    }

    @Override
    @Transactional
    public void delete(long postId) {
        Post post = communityMapper.selectPostById(postId, null);
        if (post == null) {
            throw new IllegalArgumentException("Post not found: " + postId);
        }

        communityMapper.softDeletePost(postId);
    }

    @Override
    public int likePost(long postId, long userId) {
        int result = communityMapper.isLiked(Map.of("postId", postId, "userId", userId));

        if  (result == 0){
            communityMapper.insertLike(Map.of("postId", postId, "userId", userId));
        }
        else{
            communityMapper.deleteLike(Map.of("postId", postId, "userId", userId));
        }

        return result;
    }

    @Override
    public List<CommentResponseDto> getCommentListByPostId(long postId) {
        List<Comment> rows = communityMapper.selectCommentListByPostId(postId);
        return CommentResponseDto.of(rows);
    }

    @Override
    public long saveAComment(CommentRequestDto requestDto) {
        Comment comment = requestDto.toComment();
        communityMapper.insertComment(comment);
        return comment.getCommentId();
    }

    @Override
    public CommentResponseDto getAComment(long commentId) {
        Comment comment = communityMapper.selectCommentById(commentId);
        if (comment == null) {
            throw new IllegalArgumentException("Comment not found: " + commentId);
        }
        return CommentResponseDto.of(comment);
    }

    @Override
    public void deleteComment(long commentId) {
        communityMapper.softDeleteComment(commentId);
    }

    @Override
    public List<PostResponseDto> getPostListByUserId(Long userId) {
        List<Post> rows = communityMapper.selectPostByUserId(userId);
        return PostResponseDto.of(rows);
    }

}
