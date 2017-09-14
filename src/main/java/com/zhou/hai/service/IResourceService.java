package com.zhou.hai.service;

import com.baomidou.mybatisplus.service.IService;
import com.zhou.hai.domain.Resource;
import com.zhou.hai.charge.result.Tree;
import com.zhou.hai.charge.shiro.ShiroUser;
import java.util.List;

/**
 *
 * Resource 表数据服务层接口
 *
 */
public interface IResourceService extends IService<Resource> {
    //用于index.jsp中west的列表显示
    List<Tree> selectTree(ShiroUser shiroUser);

}