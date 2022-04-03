package com.king.mooc.controller;

import com.alibaba.fastjson.JSON;
import com.king.mooc.entity.Orders;
import com.king.mooc.service.OrdersService;
import com.king.mooc.service.impl.OrdersServiceImpl;
import com.king.mooc.vo.OrdersVo;
import io.swagger.annotations.Api;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class OrdersControllerTest {

    @Autowired
    OrdersService ordersService;

    @Test
    public void isBuy() {
    }

    @Test
    public void getOrders() {
        List<OrdersVo> list = ordersService.getOrders(2L);
        String s = JSON.toJSONString(list);

        System.out.println(s);
        Object s1 = JSON.toJSON(list);
        System.out.println(s1);

    }
}