package com.king.mooc.service.impl;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class OrdersServiceImplTest {

    @Autowired
    OrdersServiceImpl orderService;
    @Test
    public void creatOrder() {
    }

    @Test
    public void overOrder() {
    }

    @Test
    public void getOrder() {
        orderService.getOrders(2L);
    }

    @Test
    public void refund() {
        orderService.refund(20220419025952L);
    }

    @Test
    public void getOrderByUserId() {

        System.out.println(orderService.getOrders(2L, 1, 10));
        //orderService.getOrders(2L);
    }
}