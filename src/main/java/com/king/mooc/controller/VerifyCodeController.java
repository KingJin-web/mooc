package com.king.mooc.controller;

import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.util.VerifyCodeGen;
import com.king.mooc.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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

    @Autowired
    RedisObjUtil redisObjUtil;

    @ApiOperation(value = "获取登录图形验证码", tags = "图形验证码接口")
    @GetMapping(value = "/login.png")
    public void login(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        HttpSession session = req.getSession();
        redisObjUtil.setEntity(session.getId(), 30, new UserVo(VerifyCodeGen.outputImage(resp)));
    }
}
