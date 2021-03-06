package com.king.mooc.util;

import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.king.mooc.entity.Course;
import com.king.mooc.vo.UserVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import java.util.Objects;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class RedisObjUtilTest {

    @Test
    public void setEntity(){
        UserVo userVo = new UserVo();
        userVo.setEmail("123456789@qq.com");
        userVo.setId(1L);
        userVo.setName("test");
        userVo.setHeadImg("F:\\Downloads\\1.jpg");
        userVo.setIsVip(true);
        userVo.setValidateCode("K25sk");

    }




    @Test
    public void t1() {
        Course course = new Course();
        System.out.println(course);
        System.out.println(course == null);
        System.out.println(StringUtils.isEmpty(course));
        System.out.println(StringUtils.isNull(course));
        course.setId(1L);
        System.out.println(StringUtils.isNull(course));
        System.out.println(ObjectUtils.isNull(course));
        System.out.println(Objects.isNull(course));
        System.out.println(ObjectUtils.isNull(course));
    }
}