package com.zhou.hai.service;

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.AbstractJUnit4SpringContextTests;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by zhou on 2016/12/19.
 */
//指定servicebean注入的配置文件

@ContextConfiguration(locations = {
        "classpath:spring-mvc.xml",
        "classpath:spring-config.xml"
})//使用标准的JUnit @RunWith注释来告诉JUnit使用Spring TestRunner
@RunWith(SpringJUnit4ClassRunner.class)
public class BaseTest extends AbstractJUnit4SpringContextTests {
}