package com.zhou.hai.service.impl;

import com.zhou.hai.domain.User;
import com.zhou.hai.domain.vo.UserVo;
import com.zhou.hai.service.BaseTest;
import org.junit.After;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by zhou on 2017/2/1.
 */
public class UserServiceImplTest extends BaseTest {
@Autowired
private UserServiceImpl userService;
    @Test
    public void testSelectByLoginName() throws Exception {
        UserVo userVo=new UserVo();
        userVo.setLoginName("admin");
        List<User> userList=userService.selectByLoginName(userVo);
        System.out.println(userList);
    }


    @Test
    public void testinsertByVo() throws Exception {
        UserVo userVo=new UserVo();
        userVo.setLoginName("admin");
        userVo.setPassword("admin");
        userService.insertByVo(userVo);
    }

}