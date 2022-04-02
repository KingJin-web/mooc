package com.king.mooc.service.impl;

import com.king.mooc.service.MailService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import com.king.mooc.vo.MailVo;
import com.sun.mail.util.MailSSLSocketFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Date;
import java.util.Properties;
import java.util.concurrent.CompletableFuture;

/**
 * @program: mooc
 * @description: 邮件实现类
 * @author: King
 * @create: 2021-10-03 17:15
 */
@Service
public class MailServiceImpl implements MailService {
    @Value("${mail.password}")
    private String password;
    @Value("${mail.username}")
    private String username;
    @Value("${mail.host}")
    private String host;
    @Value("${mail.protocol}")
    private String protocol;
    @Value("${mail.properties.mail.smtp.auth}")
    private String auth;


    //检测邮件信息类
    private void checkMail(MailVo mailVo) throws MyException {
        if (StringUtils.checkNull(mailVo.getTo())) {
            throw new MyException("邮件收信人不能为空");
        }
        if (StringUtils.checkNull(mailVo.getSubject())) {
            throw new MyException("邮件主题不能为空");
        }
        if (StringUtils.checkNull(mailVo.getText())) {
            throw new MyException("邮件内容不能为空");
        }
    }





    public void sendMali(){

    }

    @Async("myTaskExecutor")
    public void sendMail(MailVo mailVo, boolean isDebug) throws MyException {
        checkMail(mailVo);
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.host", host);
            properties.setProperty("mail.transport.protocol", protocol);
            properties.setProperty("mail.smtp.auth", "true");
            //QQ存在一个特性设置SSL加密
            MailSSLSocketFactory sf = new MailSSLSocketFactory();
            sf.setTrustAllHosts(true);
            properties.put("mail.smtp.ssl.enable", "true");
            properties.put("mail.smtp.ssl.socketFactory", sf);
            //创建一个session对象
            Session session = Session.getDefaultInstance(properties, new Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(username, password);
                }
            });
            //开启debug模式
            session.setDebug(isDebug);
            //获取连接对象
            Transport transport = session.getTransport();
            //连接服务器
            //transport.connect("smtp.qq.com", "发件人邮箱", "邮箱 SMTP 信息");
            transport.connect(host, username, password);
            //创建邮件对象
            MimeMessage mimeMessage = new MimeMessage(session);
            //邮件发送人
            mimeMessage.setFrom(new InternetAddress(username));
            //邮件接收人
            mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(mailVo.getTo()));
            //邮件标题
            mimeMessage.setSubject("注册账号");
            //邮件内容
            mimeMessage.setContent(mailVo.getText(), "text/html;charset=UTF-8");
            //发送邮件
            transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
            //关闭连接
            transport.close();
        } catch (GeneralSecurityException | MessagingException e) {
            e.printStackTrace();
            throw new MyException("验证码发送失败!");
        }

    }


    //保存邮件
    private MailVo saveMail(MailVo mailVo) {

        //将邮件保存到数据库..

        return mailVo;
    }


}
