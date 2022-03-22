package com.king.mooc.service.impl;

import com.king.mooc.entity.User;
import com.king.mooc.service.UserService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.vo.UserVo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class UserServiceImplTest {

    @Autowired
    UserService userService;
    @Test
    public void register() {
        try {
            userService.registerByEmail("king","aaa","a@qq.com");
        } catch (MyException e) {
            e.printStackTrace();
        }
    }
    @Autowired
    RedisObjUtil redisObjUtil;
    @Test
    public void addRedis(){
        User user = new User();
        user.setName("老九学堂");
        UserVo userVo = new UserVo(userService.queryByName(user.getName()));
        redisObjUtil.setEntity("6DC1207BAFC0B4C84D42CEE5B55003D0", 30, userVo);
    }
}