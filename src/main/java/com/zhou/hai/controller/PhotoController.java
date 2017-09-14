package com.zhou.hai.controller;

import com.zhou.hai.domain.Photocollection;
import com.zhou.hai.domain.Photodetail;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.service.PhotoService;
import com.zhou.hai.util.PagedResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by zhou on 2017/4/28.
 */
@Controller
@RequestMapping("/photo")
public class PhotoController extends BaseController {

    @Autowired
    private PhotoService photoService;
    //    点击导航的相集
    @GetMapping("/more")
    public String getMore(){
        return "morephoto";
    }

//    进入后的数据获取
    @RequestMapping(value = "/getall",method = RequestMethod.POST,produces="text/html;charset=UTF-8")
    @ResponseBody
    public String getAll(String keyWord, Integer pageNumber, Integer pageSize){
        logger.info("分页查询用户信息列表请求入参：pageNumber{},pageSize{}", pageNumber,pageSize);
        try {
            PagedResult<Photocollection> pageResult = photoService.getAllPost(keyWord, pageNumber,pageSize);
            return responseSuccess(pageResult);
        } catch (Exception e) {
            return responseFail(e.getMessage());
        }
    }

    @GetMapping("/{photocollectionid}")
    public String getDetail(@PathVariable ("photocollectionid")Long id, Map<String,Object> map){
        Photocollection photocollection=photoService.getPhotosByPhotoCollectionId(id);
        Photocollection prephotocollection=photoService.getPrePhotoByPhotoCollectionId(id);
        Photocollection aftphotocollection=photoService.getAftPhotoByPhotoCollectionId(id);

        map.put("photos",photocollection);
        map.put("pre",prephotocollection);
        map.put("aft",aftphotocollection);
        return "getphoto";
    }
}
