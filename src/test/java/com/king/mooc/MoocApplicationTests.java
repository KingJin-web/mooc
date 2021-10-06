package com.king.mooc;


import com.king.mooc.vo.UserVo;
import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;


public class MoocApplicationTests {

    @Test
   public void contextLoads() throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
        UserVo userVo = new UserVo();
        Method method = userVo.getClass().getMethod("setId", Long.class);
        method.invoke(userVo.getClass().newInstance(),123L);
        System.out.println(userVo);
    }

}
