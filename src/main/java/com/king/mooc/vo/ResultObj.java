package com.king.mooc.vo;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;

import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-03 12:06
 */
@Data
@ApiModel(value = "返回响应类")
public class ResultObj {
    @ApiModelProperty(value = "解析接口状态")
    private Integer code = 1;
    @ApiModelProperty(value = "解析提示文本")
    private String msg;
    @ApiModelProperty(value = "解析数据长度")
    private Integer count;
    @ApiModelProperty(value = "解析数据列表")
    private Object data;

    public ResultObj() {

    }

    public ResultObj(Integer code, String msg, Integer count, Object data) {
        this.code = code;
        this.msg = msg;
        this.count = count;
        this.data = data;
    }

    public static ResultObj error() {
        return error(0, "操作失败");
    }

    public static ResultObj error(String msg) {
        return error(0, msg);
    }

    public static ResultObj obj(Integer code, String msg, Integer count, Object data) {
        return new ResultObj(code, msg, count, data);
    }

    public static ResultObj obj(Integer code, String msg) {
        return obj(code, msg, null, null);
    }

    public static ResultObj error(int code, String msg) {
        return obj(code, msg, null, null);
    }

    public static ResultObj ok(ResultObj resultObj) {
        return resultObj;
    }

    public static ResultObj ok(Object o) {
        return obj(1, "成功！", null, o);
    }

    public static ResultObj ok() {
        return ok("成功！");
    }

    public static ResultObj ok(String msg) {
        return obj(1, msg);
    }

    public static ResultObj success() {
        return ok("成功！");
    }

    public static ResultObj success(String msg) {
        return ok(msg);
    }

    public static ResultObj success(Object o) {
        return ok(o);
    }

    public static ResultObj layui(Long total, Object data) {
        return obj(0, "成功！", Math.toIntExact(total), data);
    }
}
