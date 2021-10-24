package com.king.mooc.vo;

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
    //是否已经删除
    private Integer flag;
    //创建时间
    private LocalDateTime createTime;
    //上次修改时间
    private LocalDateTime updateTime;
    //版本号，乐观锁
    @Version
    private Integer version;

    private String file;

    private List<CourseLessonVo> courseLessonVos;

}

