package com.king.mooc.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @program: mooc
 * @description: 用户实体类
 * @author: King
 * @create: 2021-10-02 15:38
 */
@Data
@TableName(value = "user")//指定表
@Builder
public class User {
    @TableId(value = "id", type = IdType.ASSIGN_ID)//指定自增策略
    private Long id;
    private String name;
    //密码
    private String password;
    //头像
    private String headImg;
    private String email;
    private Long phone;
    //用户是否可以上传视频课程
    //是否可以分享课程,0不可以1可以
    private Integer isShare;
    //用户账户余额
    private BigDecimal balance;
    //版本号，乐观锁
    @Version
    private Integer version;
    //会员到期时间 新注册赠送三天会员
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime vipTime;
    //是否已经注销
    private Integer flag;
    //创建时间
    @TableField(fill = FieldFill.INSERT)
    private LocalDateTime createTime;
    //上次修改时间
    @TableField(fill = FieldFill.INSERT_UPDATE)
    private LocalDateTime updateTime;
}