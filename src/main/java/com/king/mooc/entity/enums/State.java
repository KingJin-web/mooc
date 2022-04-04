package com.king.mooc.entity.enums;


import com.baomidou.mybatisplus.annotation.EnumValue;
import com.baomidou.mybatisplus.annotation.IEnum;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonValue;

//订单状态枚举
//https://baomidou.com/pages/8390a4/
//@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum State implements IEnum<Integer> {

    START("订单未完成", 1),
    ERROR("订单错误", -1),
    SUCCESS("订单已完成", 2),
    CANCEL("订单已取消", 3);


    @EnumValue
    private final Integer status;
    @JsonValue
    private final String text;

    State(String text, Integer status) {
        this.status = status;
        this.text = text;
    }

    public Integer getStatus() {
        return status;
    }

    public String getText() {
        return text;
    }

    @Override
    public Integer getValue() {
        return this.status;
    }

}

