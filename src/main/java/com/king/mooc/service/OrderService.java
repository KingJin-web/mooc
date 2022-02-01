package com.king.mooc.service;

import java.math.BigDecimal;

public interface OrderService {

    /**
     * 创建订单
     * @return
     */
    int creatOrder(Long uid, Long cid, BigDecimal price);
    /**
     * 提交订单
     * @return
     */
    int overOrder(Long id);
}
