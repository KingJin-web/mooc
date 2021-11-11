package com.king.mooc.vo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.Version;
import com.king.mooc.bean.Course;
import io.swagger.annotations.ApiModel;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

/**
 * @program: mooc
 * @description: 告诉大家我是干啥的
 * @author: King
 * @create: 2021/10/12 18:01
 */


@ApiModel(value = "课程响应类")
@Data
public class CourseVo {
    private Long id;
    private String name;
    private String summary;
    private String coverImage;
    private BigDecimal price;
    private BigDecimal vipPrice;
    private BigDecimal activityPrice;
    private String owner;
    private Integer sales;
    private List<CourseLessonVo> data;

//    public Course getCourse(){
//        Course course = new Course();
//        course.setId(this.id);
//        course.setName(this.name);
//        course.setSummary(this.summary);
//        course.setCoverImage(this.coverImage);
//        course.setPrice(this.price);
//        course.setVipPrice(this.vipPrice);
//        course.setActivityPrice(this.activityPrice);
//        course.setOwner(this.owner);
//        course.setSales(this.sales);
//        course.setData(JSONObject.toJSONString(data));
//        return course;
//    }

    @Override
    public String toString() {
        return JSON.toJSONString(this);
    }
}

