package com.king.mooc.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.baomidou.mybatisplus.annotation.IEnum;

//订单状态枚举
//https://baomidou.com/pages/8390a4/
public enum State implements IEnum<Integer> {

    START("开始", 1),
    ERROR("订单错误", -1),
    SUCCESS("订单成功", 2),
    CANCEL("订单取消", 3);


    @EnumValue
    private final Integer status;
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

    @Override
    public String toString() {
        return "State{" +
                "status=" + status +
                ", text='" + text + '\'' +
                "} " + super.toString();
    }
}

