package com.king.mooc.service;


import com.alipay.api.AlipayApiException;
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
    int overOrder(Long id, String tradeNo);

    /**
     * 判断你有没有购买这个课程
     *
     * @param uid
     * @param cid
     * @return boolean
     */
    boolean isBuy(Long uid, Long cid);

    List<OrdersVo> getOrders(Long uid);

    //退款
    ResultObj refund(Long id);


    public ResultObj getOrders(Long uid, Integer page, Integer size);

    /**
     * 退款
     *
     * @param outTradeNo   订单编号
     * @param refundReason 退款原因
     * @param refundAmount 退款金额
     * @param outRequestNo 标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
     */
    void refund(String outTradeNo, String trade_no, String refundReason, BigDecimal refundAmount, String outRequestNo) throws AlipayApiException;

    /**
     * 取消订单
     * @param oid
     * @return
     */
    ResultObj cancel(Long oid);

    /**
     * 删除订单
     * @param oid
     * @return
     */
    ResultObj delete(Long oid);
}
