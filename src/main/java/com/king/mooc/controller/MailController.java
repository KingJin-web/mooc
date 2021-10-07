package com.king.mooc.controller;

import com.king.mooc.service.MailService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.util.StringUtils;
import com.king.mooc.vo.MailVo;
import com.king.mooc.vo.ResultObj;
import com.king.mooc.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * @program: mooc
 * @description: 邮箱api
 * @author: King
 * @create: 2021-10-03 21:50
 */
@RestController()
@RequestMapping("/api/mail")
@Api(value = "邮件操作接口", tags = "邮件操作接口")
public class MailController {
    @Autowired
    MailService mailService;
    @Autowired
    RedisObjUtil redisObjUtil;

    @PostMapping(value = "/register.do")
    @ApiOperation(value = "发送注册验证码", tags = "邮件操作接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "用户名", dataType = "string", paramType = "query", example = "lihailin9073", required = true),
            @ApiImplicitParam(name = "email", value = "邮箱", dataType = "string", paramType = "query", example = "jinpeng.qmail@qq.com", required = true),
            @ApiImplicitParam(name = "validate_code", value = "注册验证码", dataType = "string", paramType = "query", example = "3679", required = true)

    })
    public ResultObj register(HttpServletRequest req, String name, String email) {
        ResultObj resultObj = new ResultObj();
        HttpSession session = req.getSession();
        String validate_code = StringUtils.getInt(6);
        redisObjUtil.setEntity(session.getId(), 30, new UserVo(validate_code));
        try {
            StringUtils.isEmail(email, "请输入合法格式邮件地址！");
            StringUtils.nameCheckNull(name);
            MailVo mailVo = new MailVo("3098629064@qq.com",
                    email, "注册验证码", validate_code, name);
            mailService.sendMail(mailVo, false);
            resultObj.setCode(0);
            resultObj.setMsg("发送成功！");

        } catch (MyException e) {
            resultObj.setMsg(e.getMessage());
        }
        return resultObj;
    }


}
