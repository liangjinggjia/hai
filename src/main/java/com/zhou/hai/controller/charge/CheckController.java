package com.zhou.hai.controller.charge;

import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.domain.*;
import com.zhou.hai.service.ICheckService;
import com.zhou.hai.service.PostService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.io.File;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * Created by zhou on 2017/2/1.
 */
@Controller
@RequestMapping("/check")
public class CheckController extends ChargeBaseController {
    @Autowired
    private ICheckService checkService;
    @Autowired
    private PostService postService;
//上传发布(待审)
    @PostMapping("/addtocheck")
    @ResponseBody
    public Object addtoCheck(@ModelAttribute("postWithBLOBs") PostWithBLOBs postWithBLOBs) throws Exception{
        postService.addPost(postWithBLOBs);
        return renderSuccess("文章已上传待审");
    }
//上传发布(公开)
    @PostMapping("/addtopass")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object addtoPass(@ModelAttribute("postWithBLOBs") PostWithBLOBs postWithBLOBs) throws Exception{
        postWithBLOBs.setPostStatus(1);
        postService.addPost(postWithBLOBs);
        return renderSuccess("文章已上传公开");
    }
    @RequestMapping("/getuncheck")
    @ResponseBody
    public Object getUncheck(Integer page, Integer rows,String keyWord,String sort, String order){
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
//此处写condition
        condition.put("keyWord",keyWord);
        pageInfo.setCondition(condition);
        checkService.selectUncheck(pageInfo);
        return pageInfo;
    }
    @RequestMapping("/getpass")
    @ResponseBody
    public Object getPass(Integer page, Integer rows,String keyWord){
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
//此处写condition
        condition.put("keyWord",keyWord);
        pageInfo.setCondition(condition);
        checkService.selectPass(pageInfo);
        return pageInfo;
    }
    @RequestMapping("/getreject")
    @ResponseBody
    public Object getReject(Integer page, Integer rows,String keyWord, String sort, String order){
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
//此处写condition
        condition.put("keyWord",keyWord);
        pageInfo.setCondition(condition);
        checkService.selectReject(pageInfo);
        return pageInfo;
    }
    @RequestMapping("/getphoto")
    @ResponseBody
    public Object getPhoto(Integer page, Integer rows,String keyWord, String sort, String order){
        PageInfo pageInfo = new PageInfo(page, rows);
        Map<String, Object> condition = new HashMap<String, Object>();
//此处写condition
        condition.put("keyWord",keyWord);
        pageInfo.setCondition(condition);
        checkService.selectPhoto(pageInfo);
        return pageInfo;
    }


//跳转处理
    @RequestMapping("/gotoadd")
    public String gotoAdd(){
    return "admin/postAdd";
}
    @GetMapping("/gototurns")
    public String gotoTurns(Map<String,Object> map) {
        List<Turns> turns=checkService.selectTurns();
        map.put("turns",turns);
        return "admin/turns";
    }
    @GetMapping("/gotophotoadd")
    public String gotoPhotoAdd() {
        return "admin/photoAdd";
    }
    @GetMapping("/gotophoto")
    public String gotoPhotoModify() {
        return "admin/photo";
    }

    @GetMapping("/gotouncheck")
    public String gotoUncheck() {
        return "admin/postUncheck";
    }

    @GetMapping("/gotopass")
    public String gotoPass() {
        return "admin/postPass";
    }
    @GetMapping("/gotoreject")
    public String gotoReject() {
        return "admin/postReject";
    }
    @GetMapping("/gotoreason/{id}")
    public String gotoReason(@PathVariable("id")Long id,Map<String,Object> map) {
        map.put("postId",id);
        return "admin/reason";
    }
    @GetMapping("/postuncheckdetail/{id}")
    @RequiresPermissions("/check/pass")
    public String postUncheckDetail(@PathVariable("id")Long id,Map<String,Object> map){
        map.put("postWithBLOBs",checkService.modify(id));
        return "admin/postUncheckDetail";
    }
    @GetMapping("/postrejectdetail/{id}")
    @RequiresPermissions("/check/pass")
    public String postRejectDetail(@PathVariable("id")Long id,Map<String,Object> map){
        map.put("reject",checkService.selectRejectReason(id));
        map.put("postWithBLOBs",checkService.modify(id));
        return "admin/postRejectDetail";
    }
    @GetMapping("/postpassdetail/{id}")
    @RequiresPermissions("/check/pass")
    public String postPassDetail(@PathVariable("id")Long id,Map<String,Object> map){
        map.put("postWithBLOBs",checkService.modify(id));
        return "admin/postPassDetail";
    }

//管理处理
    @PostMapping(value = "/pass",produces="application/json;charset=UTF-8")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object pass(@ModelAttribute("postWithBLOBs")PostWithBLOBs postWithBLOBs){
        checkService.pass(postWithBLOBs);
        return renderSuccess("文章已公开");
    }
    @PostMapping("/reject")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object reject(Reject reject){
        checkService.reject(reject);
        return renderSuccess("已退稿");
    }
    @RequestMapping("/delete")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object delete(Long id){
        checkService.delete(id);
        return renderSuccess("已删除");
    }
    @RequestMapping("/changetonopass")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object changetonopass(Long id){
        checkService.changetonopass(id);
        return renderSuccess("转为待审状态");
    }
    @PostMapping("/updateturn")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object pass(@ModelAttribute("turns")Turns turns, MultipartFile pic){
        int result=checkService.upadteTurn(turns,pic);
        if (result!=1){
            return renderError("轮播修改失败");
        }
        return renderSuccess("轮播修改成功");
    }
    @PostMapping("/setphotos")
    @ResponseBody
    @RequiresPermissions("/check/pass")
//   框架问题，只有MultipartFile[] photo才可以接受所有文件，而photo是photodetail的属性名，photo不可改为其他
//    或者用MultipartHttpServletRequest request List<MultipartFile> photofiles= request.getFiles("photofile")
//    来解决
    public Object setPotots(MultipartFile[] photo,String[] introducearr,String title,Date date,MultipartHttpServletRequest request){
        checkService.setPhotos(photo,introducearr,title,date);
        return renderSuccess("相集上传成功");
    }
    @GetMapping("/photodetail/{id}")
    @RequiresPermissions("/check/pass")
    public String photosDetail(@PathVariable("id")Long id,Map<String,Object> map){
        map.put("photos",checkService.getPhotosByPhotoCollectionId(id));
        return "admin/photoModify";
    }
    @PostMapping("/photodetailmodify")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public Object updatephotos(Long photocollectionId, String title, Date date,String[]idarr, String[] introducearr, String[] photoarr){

        checkService.updatePhotos(photocollectionId,title,date,idarr,introducearr,photoarr);
        return renderSuccess("已更新");
    }

    @PostMapping("/uploadnewphoto")
    @ResponseBody
    @RequiresPermissions("/check/pass")
    public String updatephotos(MultipartFile newphoto){
        String imgurl= checkService.uploadnewphoto(newphoto);
        return imgurl;
    }

}
