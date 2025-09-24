package com.monstersinc.stock101.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class Comment {
    private long commentId;
    private String content;
    private String createdAt;
    private boolean isDeleted;
    private long postId;
    private long userId;
    private Long parentCommentId;

    private String userName;
    private String authorTierCode;
    private int totalCommentCount;
    private String imageUrl;
}
