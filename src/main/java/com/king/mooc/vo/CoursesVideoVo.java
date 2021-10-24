package com.king.mooc.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;

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
    @ApiModelProperty(value = "章节名")
    private String url;
    @ApiModelProperty(value = "章节名")
    private int learn_times;
}
