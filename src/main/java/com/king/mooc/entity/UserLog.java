package com.king.mooc.entity;

import lombok.Builder;
import lombok.Data;

import java.util.Date;

/**
 * @program: springboot
 * @description:
 * @author: King
 * @create: 2022-03-13 15:11
 */
@Data
@Builder
public class UserLog {
    private Long uid;
    private String name;
    private String ip;
    private String address;
    private Date loginTime;

}
