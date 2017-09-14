package com.zhou.hai.mapper;

import com.zhou.hai.domain.Photodetail;
import com.zhou.hai.domain.PhotodetailExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PhotodetailMapper {
//    批量插入
    int insertphotodetailList(List<Photodetail> photodetailList);
//    批量选择性修改
    int updateSelectiveList(List<Photodetail> photodetailList);
//    批量删除
    int deleteByList(List<Long> idList);
//    读取照片数
    int coutByPhotocollectionId(Long photocollection_id);
//    读取第一张照片
    int selectOneByPhotocollectionId(Long photocollection_id);
    List<Long> selectIdByPhotocollectionId(Long id);
    int countByExample(PhotodetailExample example);

    int deleteByExample(PhotodetailExample example);

    int deleteByPrimaryKey(Long id);

    int insert(Photodetail record);

    int insertSelective(Photodetail record);

    List<Photodetail> selectByExample(PhotodetailExample example);

    Photodetail selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Photodetail record, @Param("example") PhotodetailExample example);

    int updateByExample(@Param("record") Photodetail record, @Param("example") PhotodetailExample example);

    int updateByPrimaryKeySelective(Photodetail record);

    int updateByPrimaryKey(Photodetail record);
}