package com.king.mooc.entity;

import com.baomidou.mybatisplus.annotation.*;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @program: mooc
 * @description: 订单实体类
 * @author: King
 * @create: 2021-12-31 01:36
 */
@Data
@TableName(value = "order")
public class Order {



    public Order() {
    }

    public Order(Long uid, Long cid, BigDecimal price, Integer status) {
        this.uid = uid;
        this.cid = cid;
        this.price = price;
        this.status = status;
    }

    @TableId(value = "id", type = IdType.ASSIGN_ID)
    private Long id;

    @ApiModelProperty(value = "购买的用户id")
    private Long uid;

    @ApiModelProperty(value = "购买的课程id")
    private Long cid;

    @ApiModelProperty(value = "实际付款价格")
    private BigDecimal price;

    @ApiModelProperty(value = "支付状态")
    private Integer status;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    @ApiModelProperty(value = "上次修改时间")
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;

    public void println() {
        System.out.println(this);
    }
}
