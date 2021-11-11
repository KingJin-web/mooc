package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.king.mooc.bean.Course;
import com.king.mooc.service.CourseService;
import com.king.mooc.vo.CourseLessonVo;
import com.king.mooc.vo.CourseVo;
import com.king.mooc.vo.CoursesVideoVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class CourseServiceImplTest {
    @Autowired
    CourseService courseService;

    @Test
    public void insert() {
        Course courseVo = new Course();
        List<CourseLessonVo> courseLessonVos = new ArrayList<>();
        CourseLessonVo clv = new CourseLessonVo();
        clv.setName("第1章课程简介");

        List<CoursesVideoVo> lis看·t = new ArrayList<>();
        list.add(new CoursesVideoVo("JS正则表达式简介及工具使用",123456L));
        courseLessonVos.add(clv);

//        clv.setName("第二章");
//        courseLessonVos.add(clv);
      //  courseVo.setData(courseLessonVos);

        System.out.println(courseVo);
        System.out.println(JSONObject.toJSONString(courseVo));

//
//        String s = String.valueOf(JSON.toJSON(courseVo));
//        CourseVo courseVo1 = JSON.parseObject(s, CourseVo.class);
//        System.out.println(courseVo1);
//
//        String s1 = "{\"data\":[{\"name\":\"第二章\"},{\"name\":\"第二章\"}]}";
//        CourseVo courseVo2 = JSONObject.parseObject(s1, CourseVo.class);
//        System.out.println(courseVo2);
    }

    @Test
    public void queryByLikeName() {
        Course course = courseService.queryByLikeName("1").get(0);
        System.out.println(course);
//        CourseVo courseVo = course.getCourseVo();
//        System.out.println(courseVo);
    }

    @Test
    public void updatePrice() {
    }

    @Test
    public void deleteCourse() {
    }
}