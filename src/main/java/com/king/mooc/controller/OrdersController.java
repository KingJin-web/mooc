package com.king.mooc.controller;

import com.king.mooc.entity.Course;
import com.king.mooc.entity.User;
import com.king.mooc.service.OrdersService;
import com.king.mooc.vo.OrdersVo;
import com.king.mooc.vo.ResultObj;
import io.swagger.annotations.Api;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.GetMapping;
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

    //判断你是否购买课程
    @GetMapping("/isBuy.do")
    public ResultObj isBuy(Long cid) {
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            return ResultObj.ok(ordersService.isBuy(user.getId(), cid));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("查询失败");
        }
    }

    //获取订单
    @GetMapping("getOrders.do")
    public ResultObj getOrders(int page, int limit) {
        try {
            User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
            List<OrdersVo> orders = ordersService.getOrders(user.getId());
            int size = orders.size();
            int a = (page - 1) * limit; //开始行数
            int b = page * limit; //结束行数
            if (b > size) {
                b = size;
            }
            orders = orders.subList(a, b);
            return ResultObj.obj(0,"查询成功",size,orders);
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("查询失败");
        }
    }
}
