package com.king.mooc.admin.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-02-15 00:29
 */
@Data
@TableName(value = "admin")
public class Admin {
    @TableId(value = "id", type = IdType.ASSIGN_ID)//指定自增策略
    private Long id;
    private String name;
    //密码
    private String password;
    //头像
    private String headImg;
}
