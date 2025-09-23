package com.monstersinc.stock101.community.model.dto;

import com.monstersinc.stock101.community.model.vo.Post;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PostResponseDto {
    private long postId;
    private long stockId;
    private long userId;
    private String opinion;
    private String content;
    private String createdAt;

    private String userName;
    private boolean likedByMe;
    private int likeCount;
    private int commentCount;
    private String authorTierCode;
    private String imageUrl;

    public static PostResponseDto of(Post p) {
        return PostResponseDto.builder()
                .postId(p.getPostId())
                .opinion(p.getOpinion())
                .content(p.getContent())
                .createdAt(p.getCreatedAt())
                .stockId(p.getStockId())
                .userId(p.getUserId())
                .userName(p.getUserName())
                .likedByMe(p.isLikedByMe())
                .likeCount(p.getLikeCount())
                .commentCount(p.getCommentCount())
                .authorTierCode(p.getAuthorTierCode())
                .imageUrl(p.getImageUrl())
                .build();
    }

    public static List<PostResponseDto> of(List<Post> posts) {
        return posts.stream().map(PostResponseDto::of).toList();
    }
}

