package com.monstersinc.stock101.community.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.monstersinc.stock101.community.model.vo.Post;

@Mapper
public interface CommunityMapper {
    void insertPost(Post post); // XML에서 insertPost는 꼭 useGeneratedKeys="true" keyProperty="postId" 설정!

    Post selectPostById(@Param("postId") long postId);

    List<Post> selectPostsByStockId(@Param("stockId") long stockId);
}

