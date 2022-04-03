package com.king.mooc.entity;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.annotation.*;
import com.king.mooc.entity.enums.State;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
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
@Builder
@AllArgsConstructor
@TableName(value = "orders")
public class Orders {
    @TableId(type = IdType.AUTO)//指定自增策略
    private Long id;

    @ApiModelProperty(value = "购买的用户id")
    private Long uid;

    @ApiModelProperty(value = "购买的课程id")
    private Long cid;

    @ApiModelProperty(value = "实际付款价格")
    private BigDecimal price;

    @ApiModelProperty(value = "支付状态")
    @JSONField(serialzeFeatures = SerializerFeature.WriteEnumUsingToString)
    private State state;

    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;



    public void println() {
        System.out.println(this);
    }

    public Orders() {
    }
}
