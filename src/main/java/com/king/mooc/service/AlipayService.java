package com.king.mooc.service;

import com.alipay.api.AlipayApiException;
import com.king.mooc.entity.Orders;
import com.king.mooc.vo.ResultObj;

public interface AlipayService {
    //退款
    ResultObj refund(Orders orders) throws AlipayApiException;

    //退款
    ResultObj refund(Long id) throws AlipayApiException;
}
