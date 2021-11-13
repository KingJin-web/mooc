package com.king.mooc.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.Date;
import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-11-13 17:12
 */
@Data
@TableName(value = "coursevideo")
public class CourseVideo {
    @ApiModelProperty(value = "课程视频id")
    private Long id;
    @ApiModelProperty(value = "课程id")
    private Long cid;
    @ApiModelProperty(value = "课程视频名")
    private String name;
    @ApiModelProperty(value = "课程视频id地址")
    private String path;
    @ApiModelProperty(value = "是否可以试看")
    private Integer isTry;
    @ApiModelProperty(value = "视频编号")
    private Double videoNumber;
    @ApiModelProperty(value = "视频时长")
    private Double learnTimes;
}
