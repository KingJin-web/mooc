package com.king.mooc.vo;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @program: mooc
 * @description: 告诉大家我是干啥的
 * @author: King
 * @create: 2021/10/20 15:27
 */
@Data
public class CoursesVideoVo {
    @ApiModelProperty(value = "视频小节名")
    private String name;
    @ApiModelProperty(value = "视频地址")
    private String url;
    @ApiModelProperty(value = "视频时间")
    private Long learn_times;

    public CoursesVideoVo(String name, Long learn_times) {
        this.name = name;
        this.url = "www.baidu.com";
        this.learn_times = learn_times;
    }

    @Override
    public String toString() {
        return "CoursesVideoVo{" +
                "name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", learn_times=" + learn_times +
                '}';
    }
}
