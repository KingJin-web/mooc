package com.king.mooc.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.math.BigDecimal;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class OrderServiceImplTest {

    @Autowired
    OrderServiceImpl orderService;
    @Test
    public void creatOrder() {
        orderService.creatOrder(1L,1L,new BigDecimal("1.2"));
    }

    @Test
    public void overOrder() {
    }
}