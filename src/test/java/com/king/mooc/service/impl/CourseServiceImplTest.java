package com.king.mooc.service.impl;

import com.king.mooc.entity.Course;
import com.king.mooc.service.CourseService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

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
        Course course = courseService.queryByLikeName("1").get(0);
        System.out.println(course);

    }

    @Test
    public void updatePrice() {
    }

    @Test
    public void deleteCourse() {



    }

}