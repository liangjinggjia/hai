package com.zhou.hai.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;

import com.zhou.hai.domain.UserRole;
import com.zhou.hai.mapper.UserRoleMapper;
import com.zhou.hai.service.IUserRoleService;
import org.springframework.stereotype.Service;

/**
 *
 * UserRole 表数据服务层接口实现类
 *
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements IUserRoleService {

}