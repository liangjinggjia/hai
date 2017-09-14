package com.zhou.hai.service;

import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.domain.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;
import java.util.List;

/**
 * Created by zhou on 2017/2/1.
 */
public interface ICheckService {
//    全部公开的
    void selectPass(PageInfo pageInfo);
//    全部待审的
    void selectUncheck(PageInfo pageInfo);
//    全部退稿的
    void selectReject(PageInfo pageInfo);
//    获取退稿原因
    Reject selectRejectReason(Long id);

//     获取文章（可以获取所有状态的文章）
    PostWithBLOBs modify(Long id);
//    审核通过
    void pass(PostWithBLOBs postWithBLOBs);
//    退稿
    void reject(Reject reject);
//    删除
    void delete(Long id);
//    非公开（转为待审）
    void changetonopass(Long id);
//    获取轮播
    List<Turns> selectTurns();
//    更新轮播
    int upadteTurn(Turns turn, MultipartFile pic);
//    全部相集
    void selectPhoto(PageInfo pageInfo);
//    设置相册集合
    void setPhotos(MultipartFile[] photofile, String[] introducearr, String title,Date date);
//    更新某个相册内容
    void updatePhotos(Long photocollectionId, String title, Date date,String[]idarr, String[] introducearr, String[] photoarr);
//    获取某个相册集合
    Photocollection getPhotosByPhotoCollectionId(Long id);
//    上传一个图片文件
    String uploadnewphoto(MultipartFile newphoto);
}
