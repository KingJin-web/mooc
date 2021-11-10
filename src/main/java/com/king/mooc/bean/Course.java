package com.king.mooc.bean;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.annotation.*;
import com.king.mooc.vo.CourseLessonVo;
import com.king.mooc.vo.CourseVo;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@TableName(value = "course")
public class Course {
    @TableId(value = "id", type = IdType.ASSIGN_ID)//指定自增策略
    private Long id;
    private String name;
    private String summary;
    private String coverImage;
    private BigDecimal price;
    private BigDecimal vipPrice;
    private BigDecimal activityPrice;
    private String owner;
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

    private String data;

    public Course() {
    }

    public CourseVo getCourseVo() {
        CourseVo courseVo = new CourseVo();
        courseVo.setName(this.name);
        courseVo.setSummary(this.summary);
        courseVo.setCoverImage(this.coverImage);
        courseVo.setPrice(this.price);
        courseVo.setVipPrice(this.vipPrice);
        courseVo.setActivityPrice(this.activityPrice);
        courseVo.setOwner(this.owner);
        courseVo.setData(JSON.parseObject(this.data, CourseVo.class).getData());
        return courseVo;
    }

    public Course(Long id) {
        this.id = id;
    }
}
