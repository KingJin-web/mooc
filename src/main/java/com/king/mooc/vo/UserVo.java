package com.king.mooc.vo;

import com.king.mooc.bean.User;
import lombok.Data;

import java.io.Serializable;
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
    //是否为会员
    private Boolean isVip = false;
    private String validateCode;


    public void setUser(User user) {
        System.out.println(user);
        this.id = user.getId();
        this.name = user.getName();
        this.email = user.getEmail();
        this.phone = user.getPhone();
        this.headImg = user.getHeadImg();
        this.isVip = user.getVipTime().isBefore(LocalDateTime.now());
    }

}
