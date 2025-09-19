package com.monstersinc.stock101.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Data
@Builder
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Post {
    private long postId;
    private String opinion;
    private String content;
    private String createdAt;
    private boolean isDeleted;
    private long stockId;
    private Long userId;
}
