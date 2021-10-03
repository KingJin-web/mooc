package com.king.mooc.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.util.Date;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-03 16:32
 */
@Data
public class MailVo {
    private String id;//邮件id
    private String from;//邮件发送人
    private String to;//邮件接收人
    private String subject;//邮件主题
    private String text;//邮件内容
    private Date sentDate;//发送时间
    private String cc; //抄送
    private String bcc; //密送
    private String status; //状态
    private String error; //报错信息
    @JsonIgnore
    private MultipartFile[] multipartFiles;//邮件附件
}
