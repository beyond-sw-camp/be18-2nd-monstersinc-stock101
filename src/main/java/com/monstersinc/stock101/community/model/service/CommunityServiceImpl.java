package com.monstersinc.stock101.community.model.service;

import com.monstersinc.stock101.community.model.dto.PostRequestDto;
import com.monstersinc.stock101.community.model.dto.PostResponseDto;
import com.monstersinc.stock101.community.model.mapper.CommunityMapper;
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
    public long save(PostRequestDto dto) {
        Post post = dto.toPost();
        communityMapper.insertPost(post);
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


}
