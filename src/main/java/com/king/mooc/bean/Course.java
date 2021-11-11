package com.king.mooc.bean;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.annotation.*;
import com.baomidou.mybatisplus.extension.handlers.JacksonTypeHandler;
import com.king.mooc.vo.CourseData;
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
    //用户id
    private Long uid;
    //课程名
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

    @TableField(typeHandler = JacksonTypeHandler.class)
    private CourseData data;

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

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", uid=" + uid +
                ", name='" + name + '\'' +
                ", summary='" + summary + '\'' +
                ", coverImage='" + coverImage + '\'' +
                ", price=" + price +
                ", vipPrice=" + vipPrice +
                ", activityPrice=" + activityPrice +
                ", owner='" + owner + '\'' +
                ", sales=" + sales +
                ", flag=" + flag +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", version=" + version +
                ", data='" + data + '\'' +
                '}';
    }

    public Course(Long id) {
        this.id = id;
    }
}
