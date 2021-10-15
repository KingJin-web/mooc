package com.king.mooc.vo;

import com.king.mooc.bean.User;
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
public class UserVo implements Serializable {
    private Long id;
    private String name;
    //头像
    private String headImg;
    private String email;
    private Long phone;
    //是否可以分享课程,0不可以1可以
    private Boolean isShare;
    //用户账户余额
    private BigDecimal balance;
    //是否为会员
    private Boolean isVip = false;
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
