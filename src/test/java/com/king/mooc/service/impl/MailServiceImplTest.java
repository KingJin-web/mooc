package com.king.mooc.service.impl;

import com.king.mooc.service.MailService;
import com.king.mooc.util.MyException;
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
    public void aa() throws MyException {
        mailService.sendMail(new MailVo(),false);
    }
}