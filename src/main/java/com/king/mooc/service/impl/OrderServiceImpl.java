package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.king.mooc.entity.Orders;
import com.king.mooc.entity.enums.State;
import com.king.mooc.mapper.OrderMapper;
import com.king.mooc.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

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
    public int creatOrder(Long id,Long uid, Long cid, BigDecimal price) {
        Orders order = Orders.builder().id(id).uid(uid).cid(cid).price(price).state(State.START).build();
        return orderMapper.insert(order);
    }

    @Override
    public List<Orders> queryOrder(Long uid) {
        return null;
    }

    @Override
    public void cancelOrder(Long id) {
        UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        updateWrapper.eq("state", State.START);
        updateWrapper.set("state", State.CANCEL);
        orderMapper.update(null, updateWrapper);
    }

    @Override
    public int overOrder(Long id) {
        UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        updateWrapper.set("state", State.SUCCESS);
        return orderMapper.update(null, updateWrapper);
    }
}
