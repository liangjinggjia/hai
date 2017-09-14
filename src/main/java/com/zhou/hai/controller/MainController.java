package com.zhou.hai.controller;

import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.domain.Turns;
import com.zhou.hai.exception.CustomException;
import com.zhou.hai.service.MainService;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;


/**
 * Created by zhou on 2017/1/16.
 */
@Controller
@RequestMapping("/hai")
public class MainController {
    @Autowired
    private MainService mainService;
    @RequestMapping("/main")
    public String toMain(Map<String,Object> map){
        List<PostWithBLOBs> postWithBLOBsList=mainService.getPostList(9);
        List<Turns> turnList=mainService.getTurnList();
//        String a = "abc";
//        int b = Integer.parseInt(a);
        map.put("postList",postWithBLOBsList);
        map.put("turnList",turnList);
        return "main";
    }

    //登陆提交地址，和applicationContext-shiro.xml中配置的loginurl一致
    @RequestMapping("login")
    public String login(HttpServletRequest request)throws Exception{
        //此方法不处理登陆成功（认证成功），shiro认证成功会自动跳转到上一个请求路径
        //登陆失败还到login页面
        //如果登陆失败从request中获取认证异常信息，shiroLoginFailure就是shiro异常类的全限定名
        String exceptionClassName = (String) request.getAttribute("shiroLoginFailure");
        //根据shiro返回的异常类路径判断，抛出指定异常信息
        if(exceptionClassName!=null){
            if (UnknownAccountException.class.getName().equals(exceptionClassName)) {
                //最终会抛给异常处理器
                throw new CustomException("账号不存在");
            } else if (IncorrectCredentialsException.class.getName().equals(
                    exceptionClassName)) {
                throw new CustomException("用户名/密码错误");
            } else if("randomCodeError".equals(exceptionClassName)){
                throw new CustomException("验证码错误 ");
            }else {
                throw new Exception();//最终在异常处理器生成未知错误
            }
        }

        return "login";
    }
}
