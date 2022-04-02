
package com.king.mooc.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.api.response.AlipayTradePagePayResponse;
import com.king.mooc.config.AlipayConfig;
import com.king.mooc.entity.Course;
import com.king.mooc.entity.User;
import com.king.mooc.service.CourseService;
import com.king.mooc.service.UserService;
import com.king.mooc.service.impl.OrderServiceImpl;
import com.king.mooc.util.HttpUtil;
import com.king.mooc.vo.AlipayVo;
import com.king.mooc.vo.ResultObj;
import com.king.mooc.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.TransactionStatus;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-16 13:28
 */
@RestController()
@RequestMapping("/api/alipay")
@Api(value = "支付宝沙箱支付接口", tags = "支付宝沙箱支付接口")
public class AlipayController {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private OrderServiceImpl orderService;

    @RequestMapping(value = "/playVip", method = RequestMethod.GET)
    @ApiOperation(value = "会员充值", tags = "支付宝沙箱支付接口")
    @ApiImplicitParam(name = "money", value = "金额", dataType = "double", paramType = "query", example = "1", required = true)
    public void playVip(HttpServletRequest request, HttpServletResponse response, double money) throws ServletException, IOException {

        AlipayConfig ac = new AlipayConfig();
        //生成订单号
        //商户订单号，商户网站订单系统中唯一订单号，必填
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String out_trade_no = simpleDateFormat.format(Calendar.getInstance().getTime());
        //付款金额，必填
        String total_amount = String.valueOf(money);
        //订单名称，必填
        String subject = "会员充值";
        //商品描述，可空
        String body = "会员充值";
        //向支付宝发送请求
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(ac.getGatewayUrl(), ac.getApp_id(),
                ac.getMerchant_private_key(), "json", ac.getCharset(), ac.getAlipay_public_key(),
                ac.getSign_type());
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        alipayRequest.setNotifyUrl(ac.getNotify_url());
        alipayRequest.setReturnUrl(ac.getReturn_url());


        alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\","
                + "\"total_amount\":\"" + total_amount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        AlipayTradePagePayResponse alipayResponse = null;
        try {
            alipayResponse = alipayClient.pageExecute(alipayRequest);
            System.out.println(alipayResponse.getBody());
            System.out.println(alipayResponse.getMsg());
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().write(alipayResponse.getBody());
    }

    @RequestMapping(value = "/byCourse.do", method = RequestMethod.GET)
    @ApiOperation(value = "支付", tags = "支付宝沙箱支付接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "cid", value = "课程id", dataType = "int", paramType = "query", example = "1", required = true),
            @ApiImplicitParam(name = "uid", value = "用户id", dataType = "int", paramType = "query", example = "1", required = true),
            @ApiImplicitParam(name = "money", value = "金额", dataType = "double", paramType = "query", example = "1", required = true),
    })

    public void byCourse(HttpServletRequest request, HttpServletResponse response, Long cid, Long uid, BigDecimal money) throws ServletException, IOException {

        logger.info("开始购买课程");
        String title = "购买课程";
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        UserVo userVo = new UserVo(user);
        String total;
        Course course = courseService.selectById(cid);
        if (userVo.getIsVip()) {
            //会员价
            total = String.valueOf(course.getVipPrice());
        } else {
            //普通价
            total = String.valueOf(course.getPrice());
        }


        String message = "购买课程" + course.getName();
        AlipayConfig ac = new AlipayConfig();
        //生成订单号
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String orderSn = simpleDateFormat.format(Calendar.getInstance().getTime());
        //创建订单
        orderService.creatOrder(Long.parseLong(orderSn), user.getId(), course.getId(), new BigDecimal(total));
        //向支付宝发送请求

        AlipayClient alipayClient = new DefaultAlipayClient(ac.getGatewayUrl(), ac.getApp_id(),
                ac.getMerchant_private_key(), "json", ac.getCharset(), ac.getAlipay_public_key(),
                ac.getSign_type());
        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();

        String url = HttpUtil.getUrlStart(request) + "/api/alipay/notify";
        alipayRequest.setNotifyUrl(url);
        alipayRequest.setReturnUrl(url);

        alipayRequest.setBizContent("{\"out_trade_no\":\"" + orderSn + "\","
                + "\"total_amount\":\"" + total + "\","
                + "\"subject\":\"" + title + "\","
                + "\"body\":\"" + message + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        AlipayTradePagePayResponse alipayResponse = null;
        try {
            alipayResponse = alipayClient.pageExecute(alipayRequest);
            System.out.println(alipayResponse.getBody());
            System.out.println(alipayResponse.getMsg());
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        response.setContentType("text/html;charset=UTF-8");
        assert alipayResponse != null;
        response.getWriter().write(alipayResponse.getBody());
    }

    /**
     * 支付宝支付回调
     *
     * @param request
     * @param response
     * @throws ServletException
     */
    @GetMapping("/notify")
    public ResultObj notify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        logger.info("支付宝回调");
        //获取支付宝POST过来反馈信息
        Map<String, String> params = new HashMap<>();
        Map requestParams = request.getParameterMap();
        for (Object o : requestParams.keySet()) {
            String name = (String) o;
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
            //valueStr = new String(valueStr.getBytes("ISO-8859-1"), "gbk");
            params.put(name, valueStr);
        }
        AlipayConfig alipayConfig = new AlipayConfig();
        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
        //商户订单号
        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");  //支付宝交易号

        //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//
        //计算得出通知验证结果
        //boolean AlipaySignature.rsaCheckV1(Map<String, String> params, String publicKey, String charset, String sign_type)
        boolean verify_result = false;
        try {
            verify_result = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipay_public_key(), alipayConfig.getCharset(), "RSA2");
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }
        logger.info("支付宝回调验证结果：" + verify_result);
        if (verify_result) {//验证成功
            orderService.overOrder(Long.valueOf(out_trade_no));
        }
        logger.info("商户订单号{}支付宝交易号{}", out_trade_no, trade_no);

        return ResultObj.ok(params);
    }

    /**
     * 异步结果通知回调方法
     *
     * @param vo      支付宝异步通知返回的结果
     * @param request request
     * @return 是否验签通过
     * @throws UnsupportedEncodingException
     * @throws AlipayApiException
     */
    @PostMapping("/payed/notify")
    public String notify(AlipayVo vo, HttpServletRequest request) throws UnsupportedEncodingException, AlipayApiException {
        // 验证签名
        boolean signVerified = checkV1(request);
        if (signVerified) {
            // 签名验证通过
            System.out.println("签名验证成功！");
            // 处理支付结果
            // 只要收到了支付宝给我们异步的通知，告诉我们订单支付成功，返回success，支付宝就不会再通知
            return handlePayResult(vo);
        } else {
            // 只要回复的不是success，就会一直通知
            System.out.println("签名验证失败！");
            return "error";
        }
    }

    public AlipayVo getOrderPay(String orderSn) {
        // 模拟一个订单
        AlipayVo payVo = new AlipayVo();
        // 订单号
        payVo.setOut_trade_no(orderSn);
        payVo.setSubject("测试商品");
        payVo.setBody("这是测试支付宝沙箱环境专用的测试商品！");
        payVo.setTotal_amount("99.99");
        return payVo;
    }

    /**
     * 处理支付宝支付结果
     *
     * @param vo 支付信息
     * @return
     */
    public String handlePayResult(AlipayVo vo) {
        // 可以将vo里的相关支付信息保存到数据库....
        // 判断是否支付成功 - 获取状态，只有以下两种状态是支付成功了
        System.out.println(vo);
        return "success";
    }

    /**
     * 校验签名
     *
     * @param request request
     * @return 是否验证通过
     * @throws AlipayApiException 支付异常
     */
    private boolean checkV1(HttpServletRequest request) throws AlipayApiException {
        /*
         * 支付宝验证签名
         * 获取支付宝POST过来反馈信息
         */
        AlipayConfig alipayConfig = new AlipayConfig();
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (String name : requestParams.keySet()) {
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            // valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }
        // 调用SDK验证签名
        return AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipay_public_key(), alipayConfig.getCharset(), alipayConfig.getSign_type());
    }

    @RequestMapping(value = "/returnUrl", method = RequestMethod.GET)
    public String returnUrl(HttpServletRequest request, HttpServletResponse response)
            throws IOException, AlipayApiException {
        System.out.println("=================================同步回调=====================================");

        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (String name : requestParams.keySet()) {
            String[] values = requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("utf-8"), "utf-8");
            params.put(name, valueStr);
        }
        AlipayConfig alipayConfig = new AlipayConfig();

        System.out.println(params);//查看参数都有哪些
        boolean signVerified = AlipaySignature.rsaCheckV1(params, alipayConfig.getAlipay_public_key(), alipayConfig.getCharset(), alipayConfig.getSign_type()); // 调用SDK验证签名
        //验证签名通过
        if (signVerified) {
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            // 支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            // 付款金额
            String total_amount = new String(request.getParameter("total_amount").getBytes(StandardCharsets.ISO_8859_1), StandardCharsets.UTF_8);

            System.out.println("商户订单号=" + out_trade_no);
            System.out.println("支付宝交易号=" + trade_no);
            System.out.println("付款金额=" + total_amount);

            //支付成功，修复支付状态
            //payService.updateById(Integer.valueOf(out_trade_no));
            return "ok";//跳转付款成功页面
        } else {
            return "no";//跳转付款失败页面
        }
    }

}
