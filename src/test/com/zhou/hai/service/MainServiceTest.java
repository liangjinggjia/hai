package com.zhou.hai.service;

import org.junit.After;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by zhou on 2017/1/16.
 */
public class MainServiceTest extends BaseTest{
    @Autowired
    private MainService mainService;
    @Test
    public void testGetPostList() throws Exception {
     System.out.println(mainService.getPostList(9));
    }
}