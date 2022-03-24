package com.king.mooc.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@TableName(value = "course")
public class Course {
    @TableId(value = "id", type = IdType.ASSIGN_ID)//指定自增策略
    private Long id;
    //用户id
    private Long uid;
    //课程名
    private String name;
    //课程简介
    private String summary;
    //图片封面
    private String coverImage;
    //原价
    private BigDecimal price;
    //会员价
    private BigDecimal vipPrice;
    private BigDecimal activityPrice;
    //销量
    private Integer sales;
    //是否已经删除
    private Integer flag;
    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    //上次修改时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
    //版本号，乐观锁
    @Version
    private Integer version;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       


    public Course() {
    }

//    public CourseVo getCourseVo() {
//        CourseVo courseVo = new CourseVo();
//        courseVo.setName(this.name);
//        courseVo.setSummary(this.summary);
//        courseVo.setCoverImage(this.coverImage);
//        courseVo.setPrice(this.price);
//        courseVo.setVipPrice(this.vipPrice);
//        courseVo.setActivityPrice(this.activityPrice);
//        courseVo.setOwner(this.owner);
//        courseVo.setData(JSON.parseObject(this.data, CourseVo.class).getData());
//        return courseVo;
//    }



    public Course(Long id) {
        this.id = id;
    }
}
