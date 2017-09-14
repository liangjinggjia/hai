package com.zhou.hai.service;

import com.zhou.hai.domain.PostWithBLOBs;
import com.zhou.hai.domain.Turns;
import com.zhou.hai.mapper.PostMapper;
import com.zhou.hai.mapper.TurnsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by zhou on 2017/1/16.
 */
@Service
public class MainService {
    @Autowired
    private PostMapper postMapper;
    @Autowired
    private TurnsMapper turnsMapper;


    public List<PostWithBLOBs> getPostList(int number){
     return postMapper.selectLatest(number);
    }
    public List<Turns> getTurnList(){return turnsMapper.getturns();}
}
