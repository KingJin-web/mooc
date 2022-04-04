package com.king.mooc.entity;

import com.alipay.api.domain.Amount;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import io.swagger.annotations.ApiModelProperty;
import lombok.Builder;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-11-13 17:12
 */
@EqualsAndHashCode(callSuper = true)
@Data
@Builder
@TableName(value = "course_video")
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

//    @ApiModelProperty(value = "是否可以试看")
//    private Integer isTry;

    @ApiModelProperty(value = "视频编号")
    private int videoNumber;

    @ApiModelProperty(value = "播放量")
    private int playAmount;


    @ApiModelProperty(value = "是否是视频")
    private long isVideo;

    @ApiModelProperty(value = "预览图地址")
    private String imgPath;

    public void println() {
        System.out.println(this);
    }

    @Override
    public Serializable pkVal() {
        return id;
    }


    public CourseVideo() {
    }

    public CourseVideo(Long id, Long cid, String name, String path, int videoNumber, int playAmount, long isVideo, String imgPath) {
        this.id = id;
        this.cid = cid;
        this.name = name;
        this.path = path;
        this.videoNumber = videoNumber;
        this.playAmount = playAmount;
        this.isVideo = isVideo;
        this.imgPath = imgPath;
    }
}
