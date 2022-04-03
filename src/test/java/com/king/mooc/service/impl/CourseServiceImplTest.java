package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.king.mooc.entity.Course;
import com.king.mooc.service.CourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class CourseServiceImplTest {
    @Autowired
    CourseService courseService;

    @Test
    public void insert() {
        Course courseVo = new Course();

    }
    @Test
    public void queryByLikeName() {
        IPage<Course> courses = courseService.queryByLikeNameAndMsg("java",1);
        System.out.println(courses);
        System.out.println(JSON.toJSONString(courses));

    }

    @Test
    public void updatePrice() {
    }

    @Test
    public void deleteCourse() {



    }

    @Test
    public void queryRecommend() {
        System.out.println(courseService.queryRecommend());
    }

}