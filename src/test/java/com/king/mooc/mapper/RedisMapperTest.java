package com.king.mooc.mapper;


import com.king.mooc.util.RedisStringUtil;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class RedisMapperTest {

    @Autowired
    RedisStringUtil redisStringUtil;
    @Test
    public void insert() {
        redisStringUtil.insert("1","2");
    }
}