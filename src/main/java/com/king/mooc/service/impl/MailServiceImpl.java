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
    @Autowired
    private JavaMailSenderImpl javaMailSender;//注入邮件工具类

    @Async("myTaskExecutor")
    @Override
    public CompletableFuture<MailVo> sendAndSaveMail(MailVo mailVo) {
        try {
            checkMail(mailVo); //1.检测邮件
            sendMimeMail(mailVo); //2.发送邮件
            return CompletableFuture.completedFuture(saveMail(mailVo)); //3.保存邮件
        } catch (Exception e) {
            mailVo.setStatus("fail");
            mailVo.setError(e.getMessage());
            return CompletableFuture.completedFuture(mailVo);
        }
    }

    @Async("myTaskExecutor")
    @Override
    public void sendMail(MailVo mailVo) throws MyException {
        System.out.println(Thread.currentThread().getName());
        try {
            checkMail(mailVo); //1.检测邮件
            sendMimeMail(mailVo); //2.发送邮件
        } catch (Exception e) {
            mailVo.setStatus("fail");
            mailVo.setError(e.getMessage());
            e.printStackTrace();
            throw new MyException(e);//发送失败
        }
    }

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

    //构建复杂邮件信息类
    private void sendMimeMail(MailVo mailVo) throws MyException {
        try {
            MimeMessageHelper messageHelper = new MimeMessageHelper(javaMailSender.createMimeMessage(), true);//true表示支持复杂类型
            //mailVo.setFrom(getMailSendFrom());//邮件发信人从配置项读取
            messageHelper.setFrom(mailVo.getFrom());//邮件发信人
            messageHelper.setTo(mailVo.getTo().split(","));//邮件收信人
            messageHelper.setSubject(mailVo.getSubject());//邮件主题
            messageHelper.setText(mailVo.getText(), true);//邮件内容
            if (!StringUtils.checkNull(mailVo.getCc())) {//抄送
                messageHelper.setCc(mailVo.getCc().split(","));
            }
            if (!StringUtils.checkNull(mailVo.getBcc())) {//密送
                messageHelper.setCc(mailVo.getBcc().split(","));
            }
            if (!StringUtils.checkNull(mailVo.getMultipartFiles())) {//添加邮件附件
                for (MultipartFile multipartFile : mailVo.getMultipartFiles()) {
                    messageHelper.addAttachment(multipartFile.getOriginalFilename(), multipartFile);
                }
            }
            if (StringUtils.checkNull(mailVo.getSentDate())) {//发送时间
                mailVo.setSentDate(new Date());
                messageHelper.setSentDate(mailVo.getSentDate());
            }
            javaMailSender.send(messageHelper.getMimeMessage());//正式发送邮件
            mailVo.setStatus("ok");
        } catch (Exception e) {
            throw new MyException(e);//发送失败
        }
    }

    @Value("${spring.mail.password}")
    private String password;
    @Value("${spring.mail.username}")
    private String username;

    @Async("myTaskExecutor")
    public void sendMail(MailVo mailVo, boolean isDebug) throws MyException {
        checkMail(mailVo);
        try {
            Properties properties = new Properties();
            properties.setProperty("mail.host", "smtp.qq.com");
            properties.setProperty("mail.transport.protocol", "smtp");
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
            transport.connect("smtp.qq.com", username, password);
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

    /**
     * email消息发送
     *
     * @param mailVo
     * @return
     */
    @Override
    public boolean adminSendEmail(MailVo mailVo) throws MyException {
        try {
            // 使用JavaMail的MimeMessage，支持更加复杂的邮件格式和内容
            MimeMessage msg = javaMailSender.createMimeMessage();
            // 创建MimeMessageHelper对象，处理MimeMessage的辅助类
            MimeMessageHelper message = new MimeMessageHelper(msg, true);
            message.setFrom(mailVo.getFrom()); // 邮件发送者
            message.setTo(mailVo.getTo()); // 邮件接受者
            message.setSubject(mailVo.getSubject()); // 主题
            message.setText(mailVo.getText(), true); // 内容！
            javaMailSender.send(msg);// 消息发送
        } catch (Exception e) {
            e.printStackTrace();
            throw new MyException("email发送失败，错误原因：" + e.getMessage());
        }
        return true;
    }

    //保存邮件
    private MailVo saveMail(MailVo mailVo) {

        //将邮件保存到数据库..

        return mailVo;
    }

    //获取邮件发信人
    public String getMailSendFrom() {
        return javaMailSender.getJavaMailProperties().getProperty("from");
    }

}
