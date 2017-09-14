package com.zhou.hai.mapper;

import com.zhou.hai.domain.Reject;
import com.zhou.hai.domain.RejectExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RejectMapper {

    Reject selectByPostId(Long id);
    int countByExample(RejectExample example);

    int deleteByExample(RejectExample example);

    int deleteByPrimaryKey(Long rejectId);

    int insert(Reject record);

    int insertSelective(Reject record);

    List<Reject> selectByExample(RejectExample example);

    Reject selectByPrimaryKey(Long rejectId);

    int updateByExampleSelective(@Param("record") Reject record, @Param("example") RejectExample example);

    int updateByExample(@Param("record") Reject record, @Param("example") RejectExample example);

    int updateByPrimaryKeySelective(Reject record);

    int updateByPrimaryKey(Reject record);
}