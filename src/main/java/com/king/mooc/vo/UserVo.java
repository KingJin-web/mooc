package com.king.mooc.vo;

import com.king.mooc.bean.User;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-06 15:08
 */
@Data
@ApiModel(value = "用户响应类")
public class UserVo{
    //用户id
    @ApiModelProperty(value = "id")
    private Long id;
    @ApiModelProperty(value = "用户名")
    private String name;
    @ApiModelProperty(value = "头像路径")
    private String headImg;
    @ApiModelProperty(value = "邮箱")
    private String email;
    @ApiModelProperty(value = "电话")
    private Long phone;
    @ApiModelProperty(value = "是否可以分享课程")
    private Boolean isShare;
    @ApiModelProperty(value = "用户账户余额")
    private BigDecimal balance;
    @ApiModelProperty(value = "是否为会员")
    private Boolean isVip = false;
    @ApiModelProperty(value = "验证码")
    private String validateCode;

    public UserVo() {
    }

    public void setUser(User user) {
        System.out.println(user);
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.headImg = user.getHeadImg();
        this.balance = user.getBalance();
        this.isShare = user.getIsShare() == 1;
        this.isVip = user.getVipTime().isAfter(LocalDateTime.now());
    }

    public UserVo(String validateCode) {
        this.validateCode = validateCode;
    }
}
