package com.zhou.hai.service.impl;

import com.zhou.hai.domain.*;
import com.zhou.hai.mapper.*;
import org.apache.commons.lang.StringEscapeUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.service.ICheckService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by zhou on 2017/2/1.
 */
@Service
public class CheckService implements ICheckService {
    @Autowired
    private PostMapper postsMapper;
    @Autowired
    private TurnsMapper turnMapper;
    @Autowired
    private RejectMapper rejectMapper;
    @Autowired
    private PhotodetailMapper photodetailMapper;
    @Autowired
    private PhotocollectionMapper photocollectionMapper;

    @Override
    public void selectPass(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getNowpage(), pageInfo.getSize());
        List<PostWithBLOBs> list = postsMapper.selectPass(pageInfo.getCondition());
        pageInfo.setRows(list);
        Page<PostWithBLOBs> page = (Page) list;
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public void selectReject(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getNowpage(), pageInfo.getSize());
        List<PostWithBLOBs> list = postsMapper.selectReject(pageInfo.getCondition());
        pageInfo.setRows(list);
        Page<PostWithBLOBs> page = (Page) list;
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public Reject selectRejectReason(Long id) {
        return rejectMapper.selectByPostId(id);
    }

    @Override
    public void selectPhoto(PageInfo pageInfo) {
        PageHelper.startPage(pageInfo.getNowpage(), pageInfo.getSize());
        List<Photocollection> list = photocollectionMapper.selectAll(pageInfo.getCondition());
        pageInfo.setRows(list);
        Page<PostWithBLOBs> page = (Page) list;
        pageInfo.setTotal(page.getTotal());
    }

    @Override
    public void selectUncheck(PageInfo pageInfo) {
//Page<PostWithBLOBs> page = new Page<PostWithBLOBs>(pageInfo.getNowpage(), pageInfo.getSize());
        PageHelper.startPage(pageInfo.getNowpage(), pageInfo.getSize());
        List<PostWithBLOBs> list = postsMapper.selectUnckeck(pageInfo.getCondition());
//将结果放到pageInfo中
        pageInfo.setRows(list);
        Page<PostWithBLOBs> page = (Page) list;
//mybaits-plus已经将总数目放到gage中
        pageInfo.setTotal(page.getTotal());

//        PostExample postExample=new PostExample();
////        表示所有条件均由or连接
//        postExample.or().andPostStatusEqualTo(0);
//        postsMapper.selectByExampleWithBLOBs(postExample);
    }

    @Override
    public List<Turns> selectTurns() {
        return turnMapper.getturns();
    }

    @Override
    public PostWithBLOBs modify(Long id) {
        return postsMapper.selectByPrimaryKey(id);
    }

    @Override
    public void pass(PostWithBLOBs postWithBLOBs) {
        postWithBLOBs.setPostContent(StringEscapeUtils.unescapeHtml(postWithBLOBs.getPostContent()));
        postsMapper.updateByPrimaryKeySelective(postWithBLOBs);
    }

    @Override
    @Transactional
    public void reject(Reject reject) {
        rejectMapper.insertSelective(reject);
//        String a = "abc";
//        int b = Integer.parseInt(a);
        postsMapper.updatePostToReject(reject.getPostId());
    }

    @Override
    public void delete(Long id) {
        postsMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void changetonopass(Long id) {
        postsMapper.updatePostToNopass(id);
    }

    @Override
    public int upadteTurn(Turns turn, MultipartFile pic) {
        //进行图片上传
        if (pic != null && pic.getOriginalFilename() != null && pic.getOriginalFilename().length() > 0) {
            //图片上传成功后，将图片的地址写到数据库
//filePath中最后一定不可忘加上\\，否则路径名会出错，但idea不报错，而图片还是没存进去
            String filePath = "F:\\picture\\";
            //上传文件原始名称
            String originalFilename = pic.getOriginalFilename();
            //新的图片名称
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String newFileName = sdf.format(new Date())+'-'+UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新文件
            File file = new java.io.File(filePath + newFileName);

            //将内存中的文件写入磁盘
            try {
                pic.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            turn.setPicture(newFileName);
        }
        //图片上传成功，将新图片名称写入数据库
        //没有上传图片的话就用原来的图片，不会删掉user的图片属性
        return turnMapper.updateTurn(turn);
    }

    @Override
    public void setPhotos(MultipartFile[] photofile, String[] introducearr, String title,Date date) {
        Photocollection photocollection = new Photocollection();
        photocollection.setTitle(title);
        photocollection.setDate(date);
        photocollectionMapper.insertSelective(photocollection);
        List<Photodetail> photodetailList = new ArrayList<>();
        for (int i = 0; i < photofile.length; i++) {
            String fileName = photofile[i].getOriginalFilename();//获取上传图片的名字
            if (photofile[i] != null && fileName != null && fileName.length() > 0) {
                //图片上传成功后，将图片的地址写到数据库
//filePath中最后一定不可忘加上\\，否则路径名会出错，但idea不报错，而图片还是没存进去
                String filePath = "F:\\picture\\";
                //新的图片名称
                DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                String newFileName = sdf.format(new Date())+'-'+UUID.randomUUID() + fileName.substring(fileName.lastIndexOf("."));
                //新文件
                File file = new java.io.File(filePath + newFileName);

                //将内存中的文件写入磁盘
                try {
                    photofile[i].transferTo(file);
                } catch (IOException e) {
                    e.printStackTrace();
                }
                Photodetail photodetail = new Photodetail();
                photodetail.setPhoto(newFileName);
                photodetail.setPhotocollectionId(photocollection.getPhotocollectionId());
                if (introducearr.length > 0) {
                    photodetail.setIntroduce(introducearr[i]);
                }
                photodetailList.add(photodetail);
            }
        }
        photodetailMapper.insertphotodetailList(photodetailList);
    }

    @Override
    public void updatePhotos(Long photocollectionId, String title, Date date, String[] idarr, String[] introducearr, String[] photoarr) {
        Photocollection photocollection=new Photocollection(photocollectionId,title,date);
        photocollectionMapper.updateByPrimaryKeySelective(photocollection);

        List<Long> oldId= photodetailMapper.selectIdByPhotocollectionId(photocollectionId);
        List<Long> newId =Arrays.asList(stringToLong(idarr));
        oldId.removeAll(newId);
        if (oldId.size()>0){
            photodetailMapper.deleteByList(oldId);
        }

        List<Photodetail> updatephotodetailList=new ArrayList<Photodetail>();
        List<Photodetail> insertphotodetailList=new ArrayList<Photodetail>();
        for(int i=0;i<idarr.length;i++){
            if (newId.get(i)>=0){
                Photodetail photodetail=new Photodetail();
                photodetail.setPhotocollectionId(photocollectionId);
                photodetail.setId(Long.valueOf(idarr[i]));
                photodetail.setPhoto(photoarr[i]);
                photodetail.setIntroduce(introducearr[i]);
                updatephotodetailList.add(photodetail);
            }
            if (newId.get(i)<0){
                Photodetail photodetail=new Photodetail();
                photodetail.setPhotocollectionId(photocollectionId);
                photodetail.setId(Long.valueOf(idarr[i]));
                photodetail.setPhoto(photoarr[i]);
                photodetail.setIntroduce(introducearr[i]);
                insertphotodetailList.add(photodetail);
            }
        }
        if(insertphotodetailList.size()>0){
            photodetailMapper.insertphotodetailList(insertphotodetailList);
        }
        if(updatephotodetailList.size()>0){
            photodetailMapper.updateSelectiveList(updatephotodetailList);
        }

    }
    public static Long[] stringToLong(String stringArray[]) {
        if (stringArray == null || stringArray.length < 1) {
            return null;
        }
        Long longArray[] = new Long[stringArray.length];
        for (int i = 0; i < longArray.length; i++) {
            try {
                longArray[i] = Long.valueOf(stringArray[i]);
            } catch (NumberFormatException e) {
                longArray[i] = new Long(0);
                continue;
            }
        }
        return longArray;
    }
    @Override
    public Photocollection getPhotosByPhotoCollectionId(Long id) {
        return photocollectionMapper.getPhotosByPhotoCollectionId(id);
    }

    @Override
    public String uploadnewphoto(MultipartFile newphoto) {
        //进行图片上传
        if (newphoto != null && newphoto.getOriginalFilename() != null && newphoto.getOriginalFilename().length() > 0) {
            //图片上传成功后，将图片的地址写到数据库
//filePath中最后一定不可忘加上\\，否则路径名会出错，但idea不报错，而图片还是没存进去
            String filePath = "F:\\picture\\";
            //上传文件原始名称
            String originalFilename = newphoto.getOriginalFilename();
            //新的图片名称
            DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String newFileName = sdf.format(new Date())+'-'+UUID.randomUUID() + originalFilename.substring(originalFilename.lastIndexOf("."));
            //新文件
            File file = new java.io.File(filePath + newFileName);

            //将内存中的文件写入磁盘
            try {
                newphoto.transferTo(file);
            } catch (IOException e) {
                e.printStackTrace();
            }
            return newFileName;
        }
        return null;
    }
}
