package com.zhou.hai.service;

import com.zhou.hai.domain.PostWithBLOBs;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import static org.junit.Assert.*;

/**
 * Created by zhou on 2017/2/14.
 */
public class ICheckServiceTest extends BaseTest {
    @Autowired
    private ICheckService checkService;
    @Test
    public void testModify() throws Exception {
        Long a=(long)71;
        PostWithBLOBs postWithBLOBs=checkService.modify(a);
    }
}