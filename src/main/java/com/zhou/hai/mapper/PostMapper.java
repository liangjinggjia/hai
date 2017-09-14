package com.zhou.hai.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;
import com.zhou.hai.domain.Post;
import com.zhou.hai.domain.PostExample;
import com.zhou.hai.domain.PostWithBLOBs;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PostMapper extends BaseMapper<PostWithBLOBs>{
//自己写的
    List<PostWithBLOBs> selectLatest(int number);
    List<PostWithBLOBs> selectAll(@Param("keyword") String keyword);
    void updatePostToReject(Long postId);
    void updatePostToNopass(Long postId);
    PostWithBLOBs selectPassByPrimaryKey(Long postId) ;

//mybatis-plus
    List<PostWithBLOBs> selectUnckeck(Map<String, Object> params);
    List<PostWithBLOBs> selectPass(Map<String, Object> params);
    List<PostWithBLOBs> selectReject(Map<String,Object> params);

    int countByExample(PostExample example);

    int deleteByExample(PostExample example);

    int deleteByPrimaryKey(Long postId);

//    int insert(PostWithBLOBs record);

    int insertSelective(PostWithBLOBs record);

    List<PostWithBLOBs> selectByExampleWithBLOBs(PostExample example);

    List<Post> selectByExample(PostExample example);

    PostWithBLOBs selectByPrimaryKey(Long postId);

    int updateByExampleSelective(@Param("record") PostWithBLOBs record, @Param("example") PostExample example);

    int updateByExampleWithBLOBs(@Param("record") PostWithBLOBs record, @Param("example") PostExample example);

    int updateByExample(@Param("record") Post record, @Param("example") PostExample example);

    int updateByPrimaryKeySelective(PostWithBLOBs record);

    int updateByPrimaryKeyWithBLOBs(PostWithBLOBs record);

    int updateByPrimaryKey(Post record);
}