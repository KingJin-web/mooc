package com.king.mooc.controller;

import com.king.mooc.service.UserService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import com.king.mooc.vo.ResultObj;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-03 08:08
 */
@RestController("/user/")
@Api(value = "用户操作接口", tags = "用户操作接口")
public class UserController {
    @Autowired
    UserService userService;

    @PostMapping(value = "register.do")
    @ApiOperation(value = "注册用户", tags = "用户操作接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "用户名", dataType = "string", paramType = "query", example = "lihailin9073", required = true),
            @ApiImplicitParam(name = "pwd1", value = "登录密码", dataType = "string", paramType = "query", example = "123456", required = true),
            @ApiImplicitParam(name = "pwd2", value = "确认密码", dataType = "string", paramType = "query", example = "123456", required = true),
            @ApiImplicitParam(name = "email", value = "邮箱", dataType = "string", paramType = "query", example = "jinpeng.qmail@qq.com", required = true),
            @ApiImplicitParam(name = "validate_code", value = "注册验证码", dataType = "string", paramType = "query", example = "3679", required = true)

    })
    public ResultObj register(String name, String pwd1, String pwd2, String email, String validate_code) {

        ResultObj result = new ResultObj();
        try {
            StringUtils.nameIsOk(name);
            StringUtils.pwdCheckNull(pwd1, pwd2);
            StringUtils.isEmail(email, "邮箱不合法！");
            if (userService.IsUse("name",name)) {
                result.setMsg("用户名已经被使用！");
                return result;
            }
            if (userService.register(name, pwd1, email)) {
                result.setCode(0);
                result.setData(true);
                result.setMsg("注册成功");
            }
        } catch (MyException e) {
            result.setMsg(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("系统错误请联系管理员！");
        }
        return result;
    }

    @PostMapping(value = "nameIsUse.do")
    @ApiOperation(value = "用户名是否被使用", tags = "用户操作接口")
    @ApiImplicitParam(name = "name", value = "用户名", dataType = "string", paramType = "query", example = "king", required = true)
    public ResultObj nameIsUse(String name) {
        ResultObj result = new ResultObj();
        if (userService.nameIsUse(name)) {
            result.setMsg("用户名已经被使用！");
            return result;
        } else {
            result.setCode(0);
            result.setMsg("用户名可以使用使用！");
        }

        return result;
    }

    @PostMapping(value = "login.do")
    @ApiOperation(value = "用户登录", tags = "用户操作接口")
    public ResultObj login(String s, String password) {
        ResultObj result = new ResultObj();
        try {
            StringUtils.checkNull(s,"请输入用户名或者邮箱!");
            StringUtils.pwdCheckNull(password);
            if (StringUtils.isEmail(s)) {
                userService.loginByEmail(s, password);
            } else {
                userService.loginByName(s, password);
            }
            result.setMsg("登录成功！");
            result.setCode(0);
        } catch (MyException e) {
            result.setMsg(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("系统错误请联系管理员！");
        }

        return result;
    }
}
