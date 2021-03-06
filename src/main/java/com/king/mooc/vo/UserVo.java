package com.king.mooc.vo;

import com.king.mooc.entity.User;
import com.king.mooc.util.StringUtils;
import com.king.mooc.util.TimeUtils;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.Date;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-06 15:08
 */
@Data
@Builder
@AllArgsConstructor
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
    @Builder.Default
    private Boolean isVip = false;
    @ApiModelProperty(value = "验证码")
    private String validateCode;
    @ApiModelProperty(value = "会员剩余时间")
    private String vipTime;
    @ApiModelProperty("验证码发送时间")
    private Date code_date;
    @ApiModelProperty("会员到期时间")
    private LocalDateTime vipEndTime;
    @ApiModelProperty("提示词")
    private String msg;

    private String msgReg;

    private String msgVip;

    public UserVo() {}

    public UserVo(UserVo user) {
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.headImg = user.getHeadImg();
        this.balance = user.getBalance();
        this.isShare = user.getIsShare();
        if (user.vipEndTime != null) {
            this.isVip = user.vipEndTime.isAfter(LocalDateTime.now());
            if (this.isVip) {
                this.vipTime = TimeUtils.formatDateTime(ChronoUnit.SECONDS.between(LocalDateTime.now(), user.vipEndTime));
            } else {
                this.vipTime = null;
                this.msg = "您的会员已经到期！";
            }

        }
    }

    public UserVo(User user) {
        this.id = user.getId();
        this.name = user.getName();
        this.email =user.getEmail();
        this.phone = user.getPhone();
        this.headImg = user.getHeadImg();
        this.balance = user.getBalance();
        this.isShare = user.getIsShare() == 1;
        this.isVip = user.getVipTime().isAfter(LocalDateTime.now());
        this.vipEndTime = user.getVipTime();
        if (isVip) {
            this.vipTime = TimeUtils.formatDateTime(ChronoUnit.SECONDS.between(LocalDateTime.now(), user.getVipTime()));
            Duration duration = Duration.between(LocalDateTime.now(), user.getVipTime());
            this.msgVip = "您的会员还有 " + duration.toDays() + " 天过期";
        } else {
            Duration duration = Duration.between(user.getVipTime(), LocalDateTime.now());
            this.msgVip = "您的会员已经过期 " + duration.toDays() + " 天";
        }
        this.msg = user.getMsg();
        Duration duration = Duration.between(user.getCreateTime(), LocalDateTime.now());
        this.msgReg = "您已经注册 " + duration.toDays() + " 天了";

    }

    public UserVo(String validateCode) {
        this.validateCode = validateCode;
    }


}
