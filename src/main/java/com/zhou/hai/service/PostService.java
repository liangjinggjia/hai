package com.zhou.hai.service;

import com.github.pagehelper.PageHelper;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.exception.AddPostException;
import com.zhou.hai.exception.GetAllPostException;
import com.zhou.hai.exception.GetPosttException;
import com.zhou.hai.mapper.PostMapper;
import com.zhou.hai.util.BeanUtil;
import com.zhou.hai.util.PagedResult;
import org.apache.commons.lang.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhou on 2017/1/10.
 */
@Service
public class PostService {
    @Autowired
    private PostMapper postMapper;

    public void addPost(PostWithBLOBs postWithBLOBs) throws AddPostException {
        try {
            postWithBLOBs.setPostContent(StringEscapeUtils.unescapeHtml(postWithBLOBs.getPostContent()));
            postMapper.insertSelective(postWithBLOBs);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public PostWithBLOBs getPost(Long postId) throws GetPosttException{
        try {
            return postMapper.selectPassByPrimaryKey(postId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public PagedResult<PostWithBLOBs> getAllPost(String keyWord, Integer pageNumber, Integer pageSize) throws GetAllPostException{
        try {
            pageNumber = pageNumber == null?1:pageNumber;
            pageSize = pageSize == null?10:pageSize;
            PageHelper.startPage(pageNumber,pageSize);  //startPage是告诉拦截器说我要开始分页了。分页参数是这两个。
            List<PostWithBLOBs> postWithBLOBsList= postMapper.selectAll(keyWord);
            return BeanUtil.toPagedResult(postWithBLOBsList);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
