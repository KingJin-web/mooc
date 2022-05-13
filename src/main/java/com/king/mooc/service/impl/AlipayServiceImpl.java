package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradeRefundRequest;
import com.alipay.api.response.AlipayTradeQueryResponse;
import com.alipay.api.response.AlipayTradeRefundResponse;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.king.mooc.config.AlipayConfig;
import com.king.mooc.entity.Orders;
import com.king.mooc.entity.enums.State;
import com.king.mooc.mapper.OrderMapper;
import com.king.mooc.service.AlipayService;
import com.king.mooc.util.StringUtils;
import com.king.mooc.vo.ResultObj;
import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.UUID;

/**
 * @author: 12613
 * @project: mooc
 * @pcakage: com.king.mooc.service.impl.AlipayServiceImpl
 * @date: 2022年05月13日 03:37
 * @description: ${}
 */
@Service
public class AlipayServiceImpl implements AlipayService {


    private final OrderMapper orderMapper;
    private final Logger logger = org.slf4j.LoggerFactory.getLogger(this.getClass());

    @Autowired
    public AlipayServiceImpl(OrderMapper orderMapper) {
        this.orderMapper = orderMapper;
    }

    @Override
    public ResultObj refund(Orders orders) throws AlipayApiException {
        AlipayTradeRefundRequest alipayRequest = new AlipayTradeRefundRequest();

        AlipayConfig alipayConfig = new AlipayConfig();
        AlipayClient alipayClient = new DefaultAlipayClient(
                alipayConfig.getGatewayUrl(), alipayConfig.getApp_id(), alipayConfig.getMerchant_private_key(), "json", alipayConfig.getCharset(), alipayConfig.getAlipay_public_key()
                , alipayConfig.getSign_type());

        JSONObject bizContent = new JSONObject();
        // trade_no  即便是空你也得写上   不能省略 ！！！！！！！！！！！
        bizContent.put("trade_no", orders.getTradeNo());
        //商户订单号,64个字符以内、可包含字母、数字、下划线；需保证在商户端不重复
        bizContent.put("out_trade_no", orders.getId());
        //退款金额
        bizContent.put("refund_amount", orders.getPrice());
        //退款原因
        bizContent.put("refund_reason", "正常退款");
        //标识一次退款请求，同一笔交易多次退款需要保证唯一，如需部分退款，则此参数必传
        bizContent.put("out_request_no", UUID.randomUUID().toString());
        alipayRequest.setBizContent(bizContent.toString());
        //调用SDK生成表单
        AlipayTradeRefundResponse response = alipayClient.execute(alipayRequest);
        logger.info("api返回：" + JSON.toJSONString(response));
        if (response.isSuccess()) {
            // 退款成功
            logger.info("退款成功");
            return ResultObj.success("退款成功");
        } else {
            throw new AlipayApiException("退款失败");
        }


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
            refund(order);
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
}