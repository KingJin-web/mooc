package com.king.mooc.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.TableField;
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
public class CourseLessonVo {
    private Long id;
    private String name;
    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    private Long lessonId;
    private List<CoursesVideoVo> coursesVideos;
}
