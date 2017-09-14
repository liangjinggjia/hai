package com.zhou.hai.service.impl;

import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.domain.Reject;
import com.zhou.hai.domain.Turns;
import com.zhou.hai.service.BaseTest;
import com.zhou.hai.service.ICheckService;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by zhou on 2017/2/11.
 */
public class CheckServiceTest extends BaseTest {
    @Autowired
    private ICheckService checkService;
    @Test
    public void testSelectNoCheck() throws Exception {
        PageInfo pageInfo=new PageInfo(1,10);
        checkService.selectUncheck(pageInfo);
    }

    @Test
    public void testSelectTurns() throws Exception {
       List<Turns> turns= checkService.selectTurns();
        System.out.println(turns);
    }

    @Test
    public void testReject() throws Exception {
        Reject reject=new Reject();
        Long id=new Long(45);
        reject.setPostId(id);
        checkService.reject(reject);
    }

    @Test
    public void testPass() throws Exception {
        PostWithBLOBs postWithBLOBs=new PostWithBLOBs();
        postWithBLOBs.setPostId(new Long(31));
        postWithBLOBs.setPostTitle("nononono");
        checkService.pass(postWithBLOBs);
    }
}