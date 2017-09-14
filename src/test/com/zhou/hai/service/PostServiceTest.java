package com.zhou.hai.service;

import com.zhou.hai.controller.BaseController;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.util.PagedResult;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by zhou on 2017/1/17.
 */
public class PostServiceTest extends BaseTest {
    @Autowired
    private PostService postService;
    @Test
    public void testGetAllPost() throws Exception {

        System.out.println(postService.getAllPost("ok",2,5));
    }

    @Test
    public void testGetAllPost1() throws Exception {

        PagedResult<PostWithBLOBs> postWithBLOBsPagedResult= postService.getAllPost("q",1,5);

    }
}