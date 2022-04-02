package com.king.mooc.service;

import com.king.mooc.util.MyException;
import com.king.mooc.vo.MailVo;
import org.springframework.scheduling.annotation.Async;

import java.util.concurrent.CompletableFuture;

public interface MailService {

    /**
     * 发送邮件
     * @param mailVo 邮件内容
     * @param isDebug 是否开启debug模式
     * @throws MyException
     */
    @Async("myTaskExecutor")
    void sendMail(MailVo mailVo, boolean isDebug) throws MyException;
}
