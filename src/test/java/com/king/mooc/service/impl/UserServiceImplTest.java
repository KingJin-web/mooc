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

    @Test
    public void update(){
        User user = User.builder().id(1446666198576553985L).
                password("$2a$10$w.0.ZPe6b4HRLBH.tIrZveDhwwX4MEV8EljMgzSIJgDWAhCFenuX.").build();
//        userService.updateEmail(user, "aaa","123@qq.com");
//        userService.updatePhone(user, "aa8a",1234567890L);
    }
}