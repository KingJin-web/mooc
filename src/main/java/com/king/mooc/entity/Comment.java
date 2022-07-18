package com.king.mooc.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * @program: mall
 * @description: 评价实体类
 * @author: King
 * @create: 2022-04-19 03:06
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@TableName(autoResultMap = true, value = "comment")
@Builder
public class Comment {
    @TableId(type = IdType.AUTO)
    private Long id;

    private Long uid;
    private Long cid;
    private String msg;
    @ApiModelProperty(value = "创建时间")
    @TableField(fill = FieldFill.INSERT)
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime createTime;
}
