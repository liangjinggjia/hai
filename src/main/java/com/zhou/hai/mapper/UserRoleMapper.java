package com.zhou.hai.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.zhou.hai.domain.UserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 *
 * UserRole 表数据库控制层接口
 *
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {

    List<UserRole> selectByUserId(@Param("userId") Long userId);

    List<Long> selectRoleIdListByUserId(@Param("userId") Long userId);

}