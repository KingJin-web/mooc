package com.king.mooc.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
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
public class CourseVideo extends Model<CourseVideo> {
    private static final long serialVersionUID = -7585862229833387698L;

    @ApiModelProperty(value = "课程视频id")
    @TableId(value = "id", type = IdType.ASSIGN_ID)//指定自增策略
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
    @ApiModelProperty(value = "播放量")
    private int playAmount;

    public void println() {
        System.out.println(this);
    }

    @Override
    public Serializable pkVal() {
        return id;
    }
}
