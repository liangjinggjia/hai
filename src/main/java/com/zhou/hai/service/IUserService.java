package com.zhou.hai.service;

import com.baomidou.mybatisplus.service.IService;
import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.domain.User;
import com.zhou.hai.domain.vo.UserVo;

import java.util.List;

/**
 *
 * User 表数据服务层接口
 *
 */
public interface IUserService extends IService<User> {

    List<User> selectByLoginName(UserVo userVo);

    void insertByVo(UserVo userVo);

    UserVo selectVoById(Long id);

    void updateByVo(UserVo userVo);

    void updatePwdByUserId(Long userId, String md5Hex);

    void selectDataGrid(PageInfo pageInfo);

    void deleteUserById(Long id);
}