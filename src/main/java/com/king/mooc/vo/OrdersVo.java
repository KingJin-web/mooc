package com.king.mooc.vo;

import com.alibaba.fastjson.annotation.JSONField;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.king.mooc.entity.enums.State;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-04-03 02:46
 */
@Data
public class OrdersVo {

    @ApiModelProperty(value = "编号")
    private Long id;

    @ApiModelProperty(value = "订单")
    private Long oid;

    @ApiModelProperty(value = "购买的课程id")
    private Long cid;

    @ApiModelProperty(value = "购买的课程名称")
    private String cname;

    @ApiModelProperty(value = "实际付款价格")
    private BigDecimal price;

    @ApiModelProperty(value = "支付状态")
    private State state;

    @ApiModelProperty(value = "创建时间")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;

}
