package com.king.mooc.service;



import com.king.mooc.entity.Orders;

import java.math.BigDecimal;
import java.util.List;

public interface OrderService {

    /**
     * 创建订单
     *
     * @return
     */
    int creatOrder(Long id, Long uid, Long cid, BigDecimal price);

    /**
     * 查询订单
     *
     * @return List<Order>
     */
    List<Orders> queryOrder(Long uid);

    /**
     * 取消订单
     *
     * @param id
     */
    void cancelOrder(Long id);

    /**
     * 提交订单
     *
     * @return
     */
    int overOrder(Long id);

}
