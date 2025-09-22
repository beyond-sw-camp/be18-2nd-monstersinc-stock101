package com.monstersinc.stock101.community.model.mapper;

import com.monstersinc.stock101.community.model.vo.Comment;
import com.monstersinc.stock101.community.model.vo.Post;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

@Mapper
public interface CommunityMapper {
    void insertPost(@Param("userId") long userId, @Param("post") Post post);

    Post selectPostById(@Param("postId") long postId, @Param("userId") Long userId);

    List<Post> selectPostsByStockId(@Param("stockId") long stockId, @Param("userId") Long userId);

    void softDeletePost(@Param("postId") long postId);

    int isLiked(Map<String, Long> postId);

    void insertLike(Map<String, Long> postId);

    void deleteLike(Map<String, Long> postId);

    List<Comment> selectCommentListByPostId(@Param("postId") long postId);

    void insertComment(Comment comment);

    Comment selectCommentById(@Param("commentId") long commentId);

    void softDeleteComment(@Param("commentId") long commentId);

    List<Post> selectPostByUserId(@Param("writerId") long writerId, @Param("userId") Long userId);


}

