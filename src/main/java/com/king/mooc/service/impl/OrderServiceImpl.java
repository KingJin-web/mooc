package com.king.mooc.service.impl;

import com.king.mooc.entity.Order;
import com.king.mooc.mapper.OrderMapper;
import com.king.mooc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-01-30 21:27
 */
@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int creatOrder(Long uid, Long cid, BigDecimal price) {
        Order order = new Order();
        orderMapper.insert(order);
        return 0;
    }

    @Override
    public int overOrder(Long id) {
        return 0;
    }
}
