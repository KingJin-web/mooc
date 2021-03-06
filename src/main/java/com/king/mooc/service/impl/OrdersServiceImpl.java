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
            return ResultObj.error("???????????????");
        }
        if (order.getState() != State.SUCCESS) {
            return ResultObj.error("???????????????");
        }
        //??????????????????15??????????????????
        if (LocalDateTime.now().isAfter(order.getCompletionTime().plusDays(15))) {
            return ResultObj.error("???????????????15??????????????????");
        }
        //??????
        try {
            refund(order.getId().toString(), order.getTradeNo(), "15???????????????", order.getPrice(), UUID.randomUUID().toString());
        } catch (AlipayApiException e) {
            logger.error("????????????", e);
            return ResultObj.error("????????????");
        }

        //??????????????????
        UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
        updateWrapper.eq("id", id);
        updateWrapper.set("state", State.REFUND);
        orderMapper.update(null, updateWrapper);
        return ResultObj.success();

    }


    /**
     * @param outTradeNo   ???????????????
     * @param trade_no     ??????????????????
     * @param refundReason ????????????
     * @param refundAmount ????????????
     * @param outRequestNo ??????????????????????????????????????????????????????????????????????????????????????????????????????????????????
     * @throws AlipayApiException
     */
    @Override
    public void refund(String outTradeNo, String trade_no, String refundReason,
                       BigDecimal refundAmount, String outRequestNo
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
        logger.info("???????????????" + result);
        logger.info("???????????????" + alipayRequest.getBizContent());
        logger.info("???????????????" + alipayClient.execute(alipayRequest));

    }

    @Override
    public ResultObj cancel(Long oid) {
        try {
            User user = UserIPUtil.getUser();
            QueryWrapper<Orders> queryWrapper = new QueryWrapper<>();
            queryWrapper.eq("id", oid);
            queryWrapper.eq("uid", user.getId());
            Orders orders = orderMapper.selectOne(queryWrapper);
            logger.info("???????????????" + orders.toString());
            if (StringUtils.isNull(orders)) {
                return ResultObj.error("??????????????????");
            }
            if (!orders.getState().getValue().equals(1)) {
                return ResultObj.error("????????????????????????");
            }
            UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
            updateWrapper.eq("id", oid);
            updateWrapper.set("state", State.CANCEL);
            orderMapper.update(null, updateWrapper);
            return ResultObj.success("???????????????");

        } catch (MyException e) {
            logger.info("?????????????????????", e);
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            logger.info("?????????????????????", e);
            return ResultObj.error("?????????????????????");
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
            logger.info("???????????????" + orders.toString());
            if (StringUtils.isNull(orders)) {
                return ResultObj.error("??????????????????");
            }
            logger.info("???????????????" + orders.getState().getValue());
            if (orders.getState().getValue().equals(4) || orders.getState().getValue().equals(3)) {
                UpdateWrapper<Orders> updateWrapper = new UpdateWrapper<>();
                updateWrapper.eq("id", oid);

                orderMapper.delete(updateWrapper);
                return ResultObj.success("???????????????");
            }else {
                return ResultObj.error("????????????????????????");
            }

        }catch (MyException e){
            logger.info("?????????????????????",e);
            return ResultObj.error(e.getMessage());
        }catch (Exception e){
            logger.info("?????????????????????",e);
            return ResultObj.error("?????????????????????");
        }
    }
}
