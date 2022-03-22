package com.king.mooc.controller;

import com.king.mooc.entity.User;
import com.king.mooc.service.MailService;
import com.king.mooc.service.impl.TxSmsServiceImpl;
import com.king.mooc.service.impl.UserServiceImpl;
import com.king.mooc.util.MyException;
import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.util.StringUtils;
import com.king.mooc.util.VerifyCodeGen;
import com.king.mooc.vo.MailVo;
import com.king.mooc.vo.ResultObj;
import com.king.mooc.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Date;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-06 01:18
 */
@RestController()
@RequestMapping("/api/verify")
@Api(value = "图形验证码接口", tags = "图形验证码接口")
public class VerifyCodeController {
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private RedisObjUtil redisObjUtil;

    @ApiOperation(value = "获取登录图形验证码", tags = "图形验证码接口")
    @GetMapping(value = "/login.png")
    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        redisObjUtil.setEntity(session.getId(), 30, new UserVo(VerifyCodeGen.outputImage(resp)));
    }

    @Autowired
    private TxSmsServiceImpl txSmsService;

    @Autowired
    private UserServiceImpl userService;
    @Autowired
    private MailService mailService;

    @ApiOperation(value = "发送注册验证码", httpMethod = "POST")
    @ApiImplicitParam(name = "phone", value = "电话号码", dataType = "string", paramType = "query", example = "13788888888", required = true)
    @PostMapping("/sendRegisterCode.do")
    public ResultObj sendRegisterCode(String emailOrPhone, String username, HttpServletRequest request) {
        try {
            StringUtils.checkNull(emailOrPhone);
            HttpSession session = request.getSession();
            UserVo userVo = redisObjUtil.getUserVo(session.getId());
            Date lastDate = new Date(new Date().getTime() - 1000 * 120);
            if (userVo != null) {
                lastDate = userVo.getCode_date();
            }

            String code = StringUtils.getInt(6);
            logger.info("验证码: " + code + "username: " + username + " " + emailOrPhone);
            if (lastDate != null && (new Date().getTime() - lastDate.getTime()) < (1000 * 120)) {
                return ResultObj.error("别点了，等" + (120 - ((new Date().getTime() - lastDate.getTime()) / 1000)) + "秒后再点");
            } else {
                //存验证码到session 存当前时间到session
                redisObjUtil.setEntity(session.getId(), 30, UserVo.builder().validateCode(code).code_date(new Date()).build());

                if (StringUtils.emailOrPhone(emailOrPhone)) {
                    if (userService.isUse("email", emailOrPhone)) {
                        return ResultObj.error("此邮箱已经被注册！");
                    }
                    StringUtils.nameCheckNull(username);
                    MailVo mailVo = new MailVo("3098629064@qq.com",
                            emailOrPhone, "注册验证码", code, username);
                    mailService.sendMail(mailVo, false);
                    return ResultObj.ok("发送成功");
                } else {
                    if (userService.isUse("phone", emailOrPhone))
                        return ResultObj.error("此电话已经被注册！");
                    return ResultObj.ok(txSmsService.sendSmsCode(emailOrPhone, code));
                }

            }

        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        }
    }
}
