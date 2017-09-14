package com.zhou.hai.mapper;

import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.domain.Photocollection;
import com.zhou.hai.domain.PhotocollectionExample;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface PhotocollectionMapper {
//查找photocollection（collection中不包含List<PhotoDetail>,包含number数）
    List<Photocollection> selectAll(Map<String, Object> params);

    int insertSelective(Photocollection record);

//查找photocollection（collection中包含了List<PhotoDetail>，不包含number数）
    Photocollection getPhotosByPhotoCollectionId(Long id);

//更新photocollection（collection中不包含List<PhotoDetail>，number数）
    int updateByPrimaryKeySelective(Photocollection record);


//前台用的查找photocollection（collection中包含了List<PhotoDetail>中第一个Phototdetail，不包含number数）
    List<Photocollection> selectAllPhotos(@Param("keyword")String keyword);

//前台用的查找前一个photocollection（collection中包含了List<PhotoDetail>中第一个Phototdetail，不包含number数）
    Photocollection getPrePhotoByPhotoCollectionId(Long id);

//前台用的查找后一个photocollection（collection中包含了List<PhotoDetail>中第一个Phototdetail，不包含number数）
    Photocollection getAftPhotoByPhotoCollectionId(Long id);

}