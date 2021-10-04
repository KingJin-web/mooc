package com.king.mooc.service.impl;

import com.king.mooc.service.MailService;
import com.king.mooc.vo.MailVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class MailServiceImplTest {

    @Autowired
    MailService mailService;
    @Test
    public void sendMail() {
        MailVo mailVo = new MailVo();
        mailVo.setTo("1261337209@qq.com");
        mailVo.setFrom("3098629064@qq.com");
        mailVo.setSubject("主题");
        mailVo.setText("test email");
        System.out.println(mailService.sendMail(mailVo));
    }

    @Test
    public void sendMail1() {
        MailVo mailVo = new MailVo("1261337209@qq.com","注册验证码","123456","king");

        System.out.println(mailService.sendMail(mailVo));
    }
    @Autowired
    MailVo mailVo ;

    @Test
    public void aa(){

        System.out.println(mailVo);
    }
}