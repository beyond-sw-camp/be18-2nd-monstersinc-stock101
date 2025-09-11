package com.monstersinc.stock101.community.model.mapper;

import com.monstersinc.stock101.community.model.vo.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommunityMapper {
    void insertPost(Post post);

    Post selectPostById(@Param("postId") long postId);

    List<Post> selectPostsByStockId(@Param("stockId") long stockId);

    void softDeletePost(@Param("postId") long postId);

    void insertLike(Map<String, Long> postId);

    void deleteLike(Map<String, Long> postId);
}

