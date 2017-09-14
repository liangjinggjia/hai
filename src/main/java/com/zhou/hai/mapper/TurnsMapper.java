package com.zhou.hai.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.domain.Turns;

import java.util.List;

public interface TurnsMapper extends BaseMapper<PostWithBLOBs>{
    List<Turns> getturns();
    int updateTurn(Turns turn);
}