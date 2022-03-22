package com.king.mooc.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.baomidou.mybatisplus.annotation.IEnum;

public enum Role implements IEnum<Integer> {
    //这里为啥要加 ROLE_ ?
    ADMIN(1, "ROLE_ADMIN"),
    USER(2, "ROLE_USER"),
    TEMP(3, "ROLE_TEMP");

    @EnumValue
    private final Integer status;
    private final String text;

    Role(Integer status, String text) {
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
