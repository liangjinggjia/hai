package com.zhou.hai.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import com.zhou.hai.domain.Resource;
import com.zhou.hai.domain.Role;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

/**
 *
 * Role 表数据库控制层接口
 *
 */
public interface RoleMapper extends BaseMapper<Role> {

    List<Long> selectResourceIdListByRoleId(@Param("id") Long id);

    List<Resource> selectResourceListByRoleIdList(@Param("list") List<Long> list);

    List<Map<Long, String>> selectResourceListByRoleId(@Param("id") Long id);

    List<Role> selectRoleList(Pagination page, @Param("sort") String sort, @Param("order") String order);

}