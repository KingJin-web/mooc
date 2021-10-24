package com.king.mooc.vo;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

import java.time.LocalDateTime;

/**
 * @program: mooc
 * @description: 告诉大家我是干啥的
 * @author: King
 * @create: 2021/10/20 15:27
 */
@Data
public class CoursesVideoVo {
    @TableId(value = "id", type = IdType.ASSIGN_ID)//指定自增策略
    private Long id;
    private String name;
    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;

    private Long lessonId;
    private String url;
    private int learn_times;
}
