package com.king.mooc.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class CourseMapperTest {

    @Autowired
    CourseMapper courseMapper;
    @Test
    public void queryByUid1() {
        System.out.println(courseMapper.queryByUid1(2));
    }
}