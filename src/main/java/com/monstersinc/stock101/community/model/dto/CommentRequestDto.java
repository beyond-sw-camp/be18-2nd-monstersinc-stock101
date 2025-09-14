package com.monstersinc.stock101.community.model.dto;

import com.monstersinc.stock101.community.model.vo.Comment;
import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class CommentRequestDto {
    @NotNull
    private String content;

    @NotNull
    private long postId;

    @NotNull
    private long userId;

    private long parentCommentId;

    public Comment toComment() {
        return Comment.builder()
                .content(content)
                .postId(postId)
                .userId(userId)
                .parentCommentId(parentCommentId)
                .build();
    }
}
