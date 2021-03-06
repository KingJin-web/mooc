package com.king.mooc.service.impl;

import com.alipay.api.AlipayApiException;
import com.king.mooc.service.AlipayService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;
@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class AlipayServiceImplTest {

    @Autowired
    private AlipayService alipayService;
    @Test
    public void refund() {
        try {
            System.out.println(alipayService.refund(20220513190145L));
        } catch (AlipayApiException e) {
            throw new RuntimeException(e);
        }
    }

    @Test
    public void testRefund() {

    }
}