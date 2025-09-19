package com.monstersinc.stock101.community.model.service;

import com.monstersinc.stock101.community.model.dto.CommentRequestDto;
import com.monstersinc.stock101.community.model.dto.CommentResponseDto;
import com.monstersinc.stock101.community.model.dto.PostRequestDto;
import com.monstersinc.stock101.community.model.dto.PostResponseDto;
import com.monstersinc.stock101.community.model.mapper.CommunityMapper;
import com.monstersinc.stock101.community.model.vo.Comment;
import com.monstersinc.stock101.community.model.vo.Post;
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
    public PostResponseDto getAPost(long postId) {
        Post post = communityMapper.selectPostById(postId);
        if (post == null) {
            throw new IllegalArgumentException("Post not found: " + postId);
        }
        return PostResponseDto.of(post);
    }

    @Override
    public PostResponseDto getPostDetail(long postId) {
        Post post = communityMapper.selectPostById(postId);
        if (post == null) {
            throw new IllegalArgumentException("Post not found: " + postId);
        }
        return PostResponseDto.of(post);
    }

    @Override
    public List<PostResponseDto> getPostListByStock(long stockId) {
        List<Post> rows = communityMapper.selectPostsByStockId(stockId);
        return PostResponseDto.of(rows);
    }

    @Override
    @Transactional
    public void delete(long postId) {
        communityMapper.softDeletePost(postId);
    }

    @Override
    public void likePost(long postId, long userId) {
        communityMapper.insertLike(Map.of("postId", postId, "userId", userId));
    }

    @Override
    public void unlikePost(long postId, long userId) {
        communityMapper.deleteLike(Map.of("postId", postId, "userId", userId));
    }

    @Override
    public List<CommentResponseDto> getCommentListByPost(long postId) {
        List<Comment> rows = communityMapper.selectCommentListByPost(postId);
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
