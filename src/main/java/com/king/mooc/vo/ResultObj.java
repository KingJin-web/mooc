package com.king.mooc.vo;

import lombok.Data;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-03 12:06
 */
@Data
public class ResultObj {
    //解析接口状态 0是 true
    private Integer code = 1;
    //解析提示文本
    private String msg;
    //解析数据长度
    private Integer count;
    //解析数据列表
    private Object data;

}
