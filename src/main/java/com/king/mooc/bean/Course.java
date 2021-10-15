package com.king.mooc.bean;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

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

    private String file;

    public Course() {
    }

    public Course(Long id) {
        this.id = id;
    }
}
