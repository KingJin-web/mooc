package com.king.mooc.util;

import com.king.mooc.vo.UserVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class RedisObjUtilTest {
    @Autowired
    RedisObjUtil redisObjUtil;
    @Test
    public void setEntity(){
        UserVo userVo = new UserVo();
        userVo.setEmail("123456789@qq.com");
        userVo.setId(1L);
        userVo.setName("test");
        userVo.setHeadImg("F:\\Downloads\\1.jpg");
        userVo.setIsVip(true);
        userVo.setValidateCode("K25sk");
        redisObjUtil.setEntity("userVo",userVo);
    }

    @Test
    public void getEntity(){
        UserVo userVo = redisObjUtil.getUserVo("63D040C0FCB350AFEE619712CBF49E75");
       // System.out.println(userVo);

        UserVo userVo1 = redisObjUtil.getEntity("63D040888A00FBDBB0ABDC519DD26B4101DEDFC0FCB350AFEE619712CBF49E75",userVo.getClass());
        System.out.println(userVo1);
    }
}