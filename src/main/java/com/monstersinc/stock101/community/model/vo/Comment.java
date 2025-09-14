package com.monstersinc.stock101.community.model.vo;

import com.monstersinc.stock101.community.model.dto.CommentRequestDto;
import jakarta.validation.Valid;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Builder
public class Comment {
    private long commentId;
    private String content;
    private String createdAt;
    private boolean isDeleted;
    private long postId;
    private long userId;
    private long parentCommentId;

    public void setComment(@Valid CommentRequestDto requestDto){
        this.content = requestDto.getContent();
        this.postId = requestDto.getPostId();
        this.userId = requestDto.getUserId();
        this.parentCommentId = requestDto.getParentCommentId();
    }
}
