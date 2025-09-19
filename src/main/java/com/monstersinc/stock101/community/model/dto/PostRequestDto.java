package com.monstersinc.stock101.community.model.dto;

import com.monstersinc.stock101.community.model.vo.Post;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
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
public class PostRequestDto {
    @NotNull
    private long stockId;

    @NotBlank
    @Size(max = 100)
    private String opinion;

    @NotBlank
    private String content;

    public Post toPost() {
        return Post.builder()
                .stockId(stockId)
//                .userId(userId)
                .opinion(opinion)
                .content(content)
                .build();
    }
}
