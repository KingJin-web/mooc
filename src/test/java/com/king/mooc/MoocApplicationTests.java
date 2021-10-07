package com.king.mooc;


import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.vo.UserVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class MoocApplicationTests {

    @Autowired
    RedisObjUtil redisObjUtil;
    @Test
    public void setEntity(){
        UserVo userVo = new UserVo();

        redisObjUtil.setEntity("userVo",userVo);
    }
    @Test
    public void getEntity(){

    }
    @Test
   public void contextLoads() throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
        UserVo userVo = new UserVo();
        Method method = userVo.getClass().getMethod("setId", Long.class);
        method.invoke(userVo.getClass().newInstance(),123L);
        System.out.println(userVo);
    }

}
