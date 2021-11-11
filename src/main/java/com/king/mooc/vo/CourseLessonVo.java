package com.king.mooc.vo;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.time.LocalDateTime;
import java.util.List;

/**
 * @program: mooc
 * @description: 课程章节实体类
 * @author: King
 * @create: 2021/10/20 15:15
 */
@Data
@ApiModel(value = "课程章节响应类")
public class CourseLessonVo {

    @ApiModelProperty(value = "章节名")
    private String name;
    @ApiModelProperty(value = "章节下面的小节列表")
    private List<CoursesVideoVo> coursesVideos;

    @Override
    public String toString() {
        return "CourseLessonVo{" +
                "name='" + name + '\'' +
                ", coursesVideos=" + coursesVideos +
                '}';
    }
}
