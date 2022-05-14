package com.king.mooc.controller;

import com.king.mooc.entity.Course;
import com.king.mooc.entity.User;
import com.king.mooc.service.OrdersService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import com.king.mooc.util.UserIPUtil;
import com.king.mooc.vo.OrdersVo;
import com.king.mooc.vo.ResultObj;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-04-03 01:17
 */
@RestController
@RequestMapping("/api/orders")
@Api(value = "订单操作接口", tags = "订单操作接口")
public class OrdersController {
    @Autowired
    private OrdersService ordersService;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    //判断你是否购买课程
    @GetMapping("/isBuy.do")
    public ResultObj isBuy(Long cid) {
        try {
            User user = UserIPUtil.getUser();
            return ResultObj.ok(ordersService.isBuy(user.getId(), cid));
        } catch (MyException e) {
            logger.error(e.getMessage());
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("查询失败");
        }

    }

    //获取订单
    @GetMapping("getOrders.do")
    public ResultObj getOrders(Integer page, Integer limit) {
        try {

            if (StringUtils.isEmpty(page)) {
                page = 1;
            }
            if (StringUtils.isEmpty(limit)) {
                limit = 10;
            }
            User user = UserIPUtil.getUser();
            return ordersService.getOrders(user.getId(), page, limit);
//
        } catch (MyException e) {

            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("查询失败");
        }
    }

    @ApiOperation("取消订单")
    @PostMapping("/cancel.do")
    public ResultObj cancel(Long oid){
        return ordersService.cancel(oid);
    }

    @ApiOperation("删除订单")
    @PostMapping("/delete.do")
    public ResultObj delete(Long oid){
        return ordersService.delete(oid);
    }
}
