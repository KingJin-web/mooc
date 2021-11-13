package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.king.mooc.entity.Course;
import com.king.mooc.mapper.CourseMapper;
import com.king.mooc.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: mooc
 * @description: 课程操作实现类
 * @author: King
 * @create: 2021/10/12 9:28
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    CourseMapper courseMapper;

    @Override
    public int insert(Course course) {
        return courseMapper.insert(course);
    }

    @Override
    public List<Course> queryByLikeName(String name) {
        QueryWrapper<Course> qw = new QueryWrapper<>();
        qw.like("name", name);
        return courseMapper.selectList(qw);
    }

    @Override
    public int updatePrice(long id, Double price, Double vipPrice, Double activityPrice) {
        return courseMapper.updatePrice(id, price, vipPrice, activityPrice);
    }

    @Override
    public int deleteCourse(long id, long uid) {
        QueryWrapper<Course> qw = new QueryWrapper<>();
        qw.eq("id", id);
        qw.eq("uid", uid);
        return courseMapper.delete(qw);
    }

    @Override
    public Course queryById(Long id) {
        return courseMapper.selectById(id);
    }


}
