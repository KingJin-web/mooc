package com.king.mooc.mapper;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.king.mooc.entity.Orders;
import com.king.mooc.vo.OrdersVo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface OrderMapper extends BaseMapper<Orders> {

    @Select("SELECT\n" +
            "	( @i := @i + 1 ) AS id,\n" +
            "	cid,\n" +
            "	o.id AS oid,\n" +
            "	c.name AS cname,\n" +
            "	o.price,\n" +
            "	o.create_time,\n" +
            "	o.state \n" +
            "FROM\n" +
            "	orders o,\n" +
            "	course c,(\n" +
            "	SELECT\n" +
            "		@i := 0 \n" +
            "	) AS k \n" +
            "WHERE\n" +
            "	o.cid = c.id \n" +
            "	AND o.uid =  #{uid}")
    List<OrdersVo> getOrdersVo(Long uid);

    @Select("SELECT\n" +
            "	( @i := @i + 1 ) AS id,\n" +
            "	cid,\n" +
            "	o.id AS oid,\n" +
            "	c.NAME AS cname,\n" +
            "	o.price,\n" +
            "	o.create_time,\n" +
            "	o.state \n" +
            "FROM\n" +
            "	orders o,\n" +
            "	course c,(\n" +
            "	SELECT\n" +
            "		@i := 0 \n" +
            "	) AS k \n" +
            "WHERE\n" +
            "	o.cid = c.id \n" +
            "	AND o.uid = #{uid} \n" +
            "	AND o.flag = 0 \n" +
            "ORDER BY\n" +
            "	o.create_time DESC")
    IPage<OrdersVo> getOrders(Page<OrdersVo> ordersVoPage, Long uid);
}
