package com.zhou.hai.service;

import com.baomidou.mybatisplus.service.IService;
import com.zhou.hai.charge.utils.PageInfo;
import com.zhou.hai.domain.SysLog;


/**
 *
 * SysLog 表数据服务层接口
 *
 */
public interface ISysLogService extends IService<SysLog> {

    void selectDataGrid(PageInfo pageInfo);

}