package com.king.mooc.vo;

import com.king.mooc.bean.User;
import com.king.mooc.util.StringUtils;
import com.king.mooc.util.TimeUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-06 15:08
 */
@Data
@ApiModel(value = "用户响应类")
public class UserVo {
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
    @ApiModelProperty(value = "会员剩余时间")
    private String vipTime;

    @ApiModelProperty("会员到期时间")
    private LocalDateTime vipEndTime;

    public UserVo() {
        System.out.println("无参构造方法");
    }

    public UserVo(UserVo user) {
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.headImg = user.getHeadImg();
        this.balance = user.getBalance();
        this.isShare = user.getIsShare();
        if (user.vipEndTime != null){
            this.isVip = user.vipEndTime.isAfter(LocalDateTime.now());
            this.vipTime = TimeUtils.formatDateTime(ChronoUnit.SECONDS.between(LocalDateTime.now(), user.vipEndTime));
        }
    }
    public UserVo(User user) {
        setUser(user);
    }

    public void setUser(User user) {
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.headImg = user.getHeadImg();
        this.balance = user.getBalance();
        this.isShare = user.getIsShare() == 1;
        this.isVip = user.getVipTime().isAfter(LocalDateTime.now());
        this.vipEndTime = user.getVipTime();
        if (isVip) {
            this.vipTime = TimeUtils.formatDateTime(ChronoUnit.SECONDS.between(LocalDateTime.now(), user.getVipTime()));
        }

    }

    public UserVo(String validateCode) {
        this.validateCode = validateCode;
    }
}
