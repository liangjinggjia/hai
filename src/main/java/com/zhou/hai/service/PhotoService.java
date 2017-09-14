package com.zhou.hai.service;

import com.github.pagehelper.PageHelper;
import com.zhou.hai.domain.Photocollection;
import com.zhou.hai.domain.Photodetail;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.exception.GetAllPostException;
import com.zhou.hai.mapper.PhotocollectionMapper;
import com.zhou.hai.mapper.PhotodetailMapper;
import com.zhou.hai.util.BeanUtil;
import com.zhou.hai.util.PagedResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by zhou on 2017/4/28.
 */
@Service
public class PhotoService {
    @Autowired
    private PhotocollectionMapper photocollectionMapper;
    @Autowired
    private PhotodetailMapper photodetailMapper;

    public PagedResult<Photocollection> getAllPost(String keyWord, Integer pageNumber, Integer pageSize) throws GetAllPostException {
        try {
            pageNumber = pageNumber == null?1:pageNumber;
            pageSize = pageSize == null?12:pageSize;
            PageHelper.startPage(pageNumber,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
            List<Photocollection> photocollectionList= photocollectionMapper.selectAllPhotos(keyWord);
            return BeanUtil.toPagedResult(photocollectionList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public Photocollection getPhotosByPhotoCollectionId(Long id){
      return  photocollectionMapper.getPhotosByPhotoCollectionId(id);
    }

    public Photocollection getPrePhotoByPhotoCollectionId(Long id){
        Photocollection prephotocollection=photocollectionMapper.getPrePhotoByPhotoCollectionId(id);
        return prephotocollection;
    }
    public Photocollection getAftPhotoByPhotoCollectionId(Long id){
        Photocollection aftphotocollection=photocollectionMapper.getAftPhotoByPhotoCollectionId(id);
        return aftphotocollection;
    }
}
