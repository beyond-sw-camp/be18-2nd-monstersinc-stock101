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
    private long userId;

    @NotNull
    private String content;

    private long parentCommentId;

    public Comment toComment() {
        return Comment.builder()
                .userId(userId)
                .content(content)
                .parentCommentId(parentCommentId)
                .build();
    }
}
