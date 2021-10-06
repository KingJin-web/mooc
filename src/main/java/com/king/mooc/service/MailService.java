package com.king.mooc.service;

import com.king.mooc.util.MyException;
import com.king.mooc.vo.MailVo;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.CompletableFuture;

public interface MailService {
    CompletableFuture<MailVo> sendAndSaveMail(MailVo mailVo);

    /**
     * 发送邮件
     *
     * @param mailVo
     * @return 成功返回ture
     */
    @Async("myTaskExecutor")
    void sendMail(MailVo mailVo) throws MyException;


    boolean adminSendEmail(MailVo mailVo) throws MyException;

    /**
     * 发送邮件
     * @param mailVo 邮件内容
     * @param isDebug 是否开启debug模式
     * @throws MyException
     */
    @Async("myTaskExecutor")
    void sendMail(MailVo mailVo, boolean isDebug) throws MyException;
}
