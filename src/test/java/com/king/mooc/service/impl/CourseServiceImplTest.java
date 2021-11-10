package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.king.mooc.vo.CourseLessonVo;
import com.king.mooc.vo.CourseVo;
import org.junit.Test;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

public class CourseServiceImplTest {

    @Test
    public void insert() {
        CourseVo courseVo = new CourseVo();
        List<CourseLessonVo> clvs = new ArrayList<>();
        CourseLessonVo clv = new CourseLessonVo();
        clv.setName("第一章");
        clvs.add(clv);
        clv.setName("第二章");
        clvs.add(clv);
        courseVo.setData(clvs);
        System.out.println(courseVo);
        System.out.println(JSON.toJSON(courseVo));

        String s = String.valueOf(JSON.toJSON(courseVo));
        CourseVo courseVo1 =JSON.parseObject(s,CourseVo.class);
        System.out.println(courseVo1);

        String s1 = "{\"data\":[{\"name\":\"第二章\"},{\"name\":\"第二章\"}]}";
        CourseVo courseVo2 = JSONObject.parseObject(s1,CourseVo.class);
        System.out.println(courseVo2);
    }

    @Test
    public void queryByLikeName() {
    }

    @Test
    public void updatePrice() {
    }

    @Test
    public void deleteCourse() {
    }
}