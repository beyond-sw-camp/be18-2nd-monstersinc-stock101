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
    @NotNull(message = "STOCK_ID_REQUIRED")
    private long stockId;

    @NotBlank(message = "OPINION_REQUIRED")
    private String opinion;

    @NotBlank(message = "CONTENT_REQUIRED")
    @Size(max = 300, message = "CONTENT_TOO_LONG")
    private String content;

    public Post toPost() {
        return Post.builder()
                .stockId(stockId)
                .opinion(opinion)
                .content(content)
                .build();
    }
}
