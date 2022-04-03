package com.king.mooc.entity.enums;

import com.baomidou.mybatisplus.annotation.EnumValue;
import com.baomidou.mybatisplus.annotation.IEnum;
import com.fasterxml.jackson.annotation.JsonFormat;

@JsonFormat(shape = JsonFormat.Shape.OBJECT)
public enum Category implements IEnum<Integer> {

    //前端开发frontend
    FRONTEND(1, "前端开发"),
    //后端开发backend
    BACKEND(2, "后端开发"),
    //移动开发mobile
    MOBILE(3, "移动开发"),
    //数据库database
    DATABASE(4, "数据库"),
    //计算机基础computer
    COMPUTER(5, "计算机基础");

//    B(2, "后端开发"),
//    C(3, "移动开发"),
//    D(4, "数据库"),
//    E(5, "计算机基础");

    private final Integer status;
    private final String text;


    Category(Integer status, String text) {
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
