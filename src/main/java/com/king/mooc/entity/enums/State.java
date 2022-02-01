package com.king.mooc.entity.enums;

import com.baomidou.mybatisplus.annotation.IEnum;

//订单状态枚举
public enum State implements IEnum<Integer> {

    START("开始", 1),
    ERROR("订单错误", -1),
    END("订单结束", 2);

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
}

