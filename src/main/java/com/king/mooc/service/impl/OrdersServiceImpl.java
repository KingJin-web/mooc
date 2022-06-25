package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.king.mooc.config.AlipayConfig;
import com.king.mooc.entity.Orders;
import com.king.mooc.entity.User;
import com.king.mooc.entity.enums.State;
import com.king.mooc.mapper.OrderMapper;
import com.king.mooc.service.OrdersService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import com.king.mooc.util.UserIPUtil;
import com.king.mooc.vo.OrdersVo;
import com.king.mooc.vo.ResultObj;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort.Order;
import org.springframework.stereotype.Service;

import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-01-30 21:27
 */
@Service
public class OrdersServiceImpl implements OrdersService {

    @Autowired
    private OrderMapper orderMapper;


    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Override
    public int creatOrder(Long id, Long uid, Long cid, BigDecimal price) {
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
    public int overOrder(Long id, String tradeNo) {
        UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        updateWrapper.set("state", State.SUCCESS);
        updateWrapper.set("trade_no", tradeNo);
        updateWrapper.set("completion_time", LocalDateTime.now());
        return orderMapper.update(null, updateWrapper);
    }

    @Override
    public boolean isBuy(Long uid, Long cid) {
        QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq("uid", uid);
        queryWrapper.eq("cid", cid);
        queryWrapper.eq("state", State.SUCCESS);
        return orderMapper.selectCount(queryWrapper) > 0;
    }

    @Override
    public List<OrdersVo> getOrders(Long uid) {
        return null;
    }

    @Override
    public ResultObj getOrders(Long uid, Integer page, Integer size) {
        Page<OrdersVo> pages = new Page<>(page, size);
        IPage<OrdersVo> iPage = orderMapper.getOrders(pages, uid);
        logger.info("iPage:{}", iPage);
        return ResultObj.layui(iPage.getTotal(), iPage.getRecords());
    }

    @Override
    public ResultObj refund(Long id) {

        Orders order = orderMapper.selectById(id);
        if (StringUtils.isNull(order)) {
            return ResultObj.error("订单不存在");
        }
        if (order.getState() != State.SUCCESS) {
            return ResultObj.error("订单未支付");
        }
        //购买时间超过15天，不能退款
        if (LocalDateTime.now().isAfter(order.getCompletionTime().plusDays(15))) {
            return ResultObj.error("订单已超过15天，不能退款");
        }
        //退款
        try {
            refund(order.getId().toString(), order.getTradeNo(), "15天内可退款", order.getPrice(), UUID.randomUUID().toString());
        } catch (AlipayApiException e) {
            logger.error("退款失败", e);
            return ResultObj.error("退款失败");
        }

        //更新订单状态
        UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        updateWrapper.set("state", State.REFUND);
        orderMapper.update(null, updateWrapper);
        return ResultObj.success();

    }


    /**
     * @param outTradeNo   商户订单号
     * @param trade_no     支付宝订单号
     * @param refundReason 退款原因
     * @param refundAmount 退款金额
     * @param outRequestNo 标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
     * @throws AlipayApiException
     */
    @Override
    public void refund(String outTradeNo, String trade_no, String refundReason,
                       @NotNull BigDecimal refundAmount, String outRequestNo
    ) throws AlipayApiException {
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();

        AlipayConfig alipayConfig = new AlipayConfig();
        AlipayClient alipayClient = new DefaultAlipayClient(
                alipayConfig.getGatewayUrl(), alipayConfig.getApp_id(), alipayConfig.getMerchant_private_key(), "json", alipayConfig.getCharset(), alipayConfig.getAlipay_public_key()
                , alipayConfig.getSign_type());

        JSONObject bizContent = new JSONObject();
        bizContent.put("trade_no", trade_no);
        bizContent.put("out_trade_no", outTradeNo);
        bizContent.put("refund_amount", refundAmount.toString());
        bizContent.put("refund_reason", refundReason);
        bizContent.put("out_request_no", outRequestNo);
        alipayRequest.setBizContent(bizContent.toString());
        String result = alipayClient.execute(alipayRequest).getBody();
        logger.info("退款结果：" + result);
        logger.info("退款结果：" + alipayRequest.getBizContent());
        logger.info("退款结果：" + alipayClient.execute(alipayRequest));

    }

    @Override
    public ResultObj cancel(Long oid) {
        try {
            User user = UserIPUtil.getUser();
            QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("id", oid);
            queryWrapper.eq("uid", user.getId());
            Orders orders = orderMapper.selectOne(queryWrapper);
            logger.info("订单信息：" + orders.toString());
            if (StringUtils.isNull(orders)) {
                return ResultObj.error("查无此订单！");
            }
            if (!orders.getState().getValue().equals(1)) {
                return ResultObj.error("此订单无法取消！");
            }
            UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("id", oid);
            updateWrapper.set("state", State.CANCEL);
            orderMapper.update(null, updateWrapper);
            return ResultObj.success("取消成功！");

        } catch (MyException e) {
            logger.info("取消订单失败！", e);
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            logger.info("取消订单失败！", e);
            return ResultObj.error("取消订单失败！");
        }
    }

    @Override
    public ResultObj delete(Long oid) {
        try {
            User user = UserIPUtil.getUser();
            QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("id", oid);
            queryWrapper.eq("uid", user.getId());
            Orders orders = orderMapper.selectOne(queryWrapper);
            logger.info("订单信息：" + orders.toString());
            if (StringUtils.isNull(orders)) {
                return ResultObj.error("查无此订单！");
            }
            logger.info("订单状态：" + orders.getState().getValue());
            if (orders.getState().getValue().equals(4) || orders.getState().getValue().equals(3)) {
                UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("id", oid);

                orderMapper.delete(updateWrapper);
                return ResultObj.success("删除成功！");
            }else {
                return ResultObj.error("此订单无法删除！");
            }

        }catch (MyException e){
            logger.info("删除订单失败！",e);
            return ResultObj.error(e.getMessage());
        }catch (Exception e){
            logger.info("删除订单失败！",e);
            return ResultObj.error("删除订单失败！");
        }
    }
}
