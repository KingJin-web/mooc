package com.king.mooc.service;


import com.king.mooc.entity.Orders;
import com.king.mooc.vo.OrdersVo;
import com.king.mooc.vo.ResultObj;
import org.springframework.data.domain.Sort.Order;

import java.math.BigDecimal;
import java.util.List;

public interface OrdersService {

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
    int overOrder(Long id,String tradeNo);

    /**
     * 判断你有没有购买这个课程
     *
     * @param uid
     * @param cid
     * @return boolean
     */
    boolean isBuy(Long uid, Long cid);

    List<OrdersVo> getOrders(Long uid);
}
