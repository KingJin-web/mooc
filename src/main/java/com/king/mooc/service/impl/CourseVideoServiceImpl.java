package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.king.mooc.entity.CourseVideo;
import com.king.mooc.mapper.CourseVideoMapper;
import com.king.mooc.service.CourseVideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-11-14 01:39
 */

@Service
public class CourseVideoServiceImpl implements CourseVideoService {
    @Autowired
    CourseVideoMapper courseVideoMapper;

    @Override
    public List<CourseVideo> queryByCid(Long cid) {
        QueryWrapper<CourseVideo> qw = new QueryWrapper<>();
        qw.eq("cid", cid);
        return courseVideoMapper.selectList(qw);

    }
}
