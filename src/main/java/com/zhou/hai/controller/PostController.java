package com.zhou.hai.controller;

import com.mysql.fabric.xmlrpc.base.Data;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.service.MainService;
import com.zhou.hai.service.PostService;
import com.zhou.hai.util.PagedResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.math.BigInteger;
import java.util.Map;

/**
 * Created by zhou on 2017/1/10.
 */
@Controller
@RequestMapping("/post")
public class PostController  extends BaseController{
    @Autowired
    private PostService postService;
     @Autowired
    private MainService mainService;
//     转到文章详情
    @RequestMapping("/{postId}")
    public String getDetail(@PathVariable("postId") Long postId, Map<String,Object> map) throws Exception{
        map.put("post",postService.getPost(postId));
        map.put("latest",mainService.getPostList(5));
        return "getpost";
    }
//    点击进入更多时
    @RequestMapping("/more")
    public String getMore(Map<String,Object> map){
        map.put("latest",mainService.getPostList(5));
        return "morepost";
    }
//    进入后的数据获取
    @RequestMapping(value = "/getall",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getAll(String keyWord, Integer pageNumber, Integer pageSize){
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);
        try {
            PagedResult<PostWithBLOBs> pageResult = postService.getAllPost(keyWord, pageNumber,pageSize);
            return responseSuccess(pageResult);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }
}
