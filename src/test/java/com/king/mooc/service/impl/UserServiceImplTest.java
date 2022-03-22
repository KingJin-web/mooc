package com.king.mooc.service.impl;

import com.king.mooc.service.UserService;
import com.king.mooc.util.MyException;
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
}