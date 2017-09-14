package com.zhou.hai.service;

import com.baomidou.mybatisplus.service.IService;
import com.zhou.hai.domain.Organization;
import com.zhou.hai.charge.result.Tree;

import java.util.List;

/**
 *
 * Organization 表数据服务层接口
 *
 */
public interface IOrganizationService extends IService<Organization> {

    List<Tree> selectTree();

    List<Organization> selectTreeGrid();

}