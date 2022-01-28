package com.king.mooc.controller;

import com.king.mooc.entity.User;
import com.king.mooc.service.UserService;
import com.king.mooc.util.*;
import com.king.mooc.vo.ResultObj;
import com.king.mooc.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.nio.file.Paths;
import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-03 08:08
 */
@RestController()
@RequestMapping("/api/user")
@Api(value = "用户操作接口", tags = "用户操作接口")
public class UserController {
    @Autowired
    UserService userService;

    @Autowired
    RedisObjUtil redisObjUtil;

    @PostMapping(value = "/register.do")
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
            if (userService.isUse("name", name)) {
                result.setMsg("用户名已经被使用！");
                return result;
            }
            if (userService.isUse("email", email)) {
                result.setMsg("此邮箱已经被注册！");
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

    @PostMapping(value = "/login.do")
    @ApiOperation(value = "用户登录", tags = "用户操作接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "s", value = "用户名,或邮箱", dataType = "string", paramType = "query", example = "king", required = true),
            @ApiImplicitParam(name = "password", value = "登录密码", dataType = "string", paramType = "query", example = "aaaa", required = true),
            @ApiImplicitParam(name = "validate_code", value = "登录验证码", dataType = "string", paramType = "query", example = "3679", required = true)

    })
    public ResultObj login(HttpServletRequest req, String s, String password, String validate_code) {
        ResultObj result = new ResultObj();
        HttpSession session = req.getSession();
        try {
            System.out.println(s);
            StringUtils.checkNull(s, "请输入用户名或者邮箱!");
            StringUtils.pwdCheckNull(password);
            StringUtils.checkNull(validate_code, "请输入验证码！");
            UserVo userVo = redisObjUtil.getEntity(session.getId(), UserVo.class);
            System.out.println("注册" + userVo);
            boolean isLogin = false;
            if (userVo.getValidateCode().equalsIgnoreCase(validate_code)) {
                if (StringUtils.isEmail(s)) {
                    User user = userService.loginByEmail(s, password);
                    if (!StringUtils.checkNull(user)) {
                        userVo.setUser(user);
                        isLogin = true;
                    }
                } else {
                    User user = userService.loginByName(s, password);
                    if (!StringUtils.checkNull(user)) {
                        userVo.setUser(user);
                        isLogin = true;
                    }
                }
                if (isLogin) {
                    System.out.println(userVo);
                    redisObjUtil.setEntity(req.getSession().getId(), 30, userVo);
                    result.setMsg("登录成功！");
                    result.setCode(0);
                    result.setData(userVo);
                } else {
                    result.setMsg("登录失败用户名或密码错误！");
                }

            } else {
                result.setMsg("验证码错误！");
            }

        } catch (MyException e) {
            result.setMsg(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            result.setMsg("系统错误请联系管理员！");
        }

        return result;
    }

    @PostMapping(value = "/nameIsUse.do")
    @ApiOperation(value = "用户名是否被使用", tags = "用户操作接口")
    @ApiImplicitParam(name = "name", value = "用户名", dataType = "string", paramType = "query", example = "king", required = true)
    public ResultObj nameIsUse(String name) {
        ResultObj result = new ResultObj();
        if (userService.isUse("name", name)) {
            result.setMsg("用户名已经被使用！");
            return result;
        } else {
            result.setCode(0);
            result.setMsg("用户名可以使用使用！");
        }

        return result;
    }

    @PostMapping(value = "/emailIsUse.do")
    @ApiOperation(value = "邮箱是否已经被注册", tags = "用户操作接口")
    @ApiImplicitParam(name = "name", value = "用户名", dataType = "string", paramType = "query", example = "king", required = true)
    public ResultObj emailIsUse(String email) {
        ResultObj result = new ResultObj();
        if (userService.isUse("email", email)) {
            result.setMsg("用户名已经被使用！");
            return result;
        } else {
            result.setCode(0);
            result.setMsg("用户名可以使用使用！");
        }

        return result;
    }

    @GetMapping(value = "/getUser.do")
    @ApiOperation(value = "获取登录用户信息", tags = "用户操作接口")
    public ResultObj getUser(HttpServletRequest req, HttpServletResponse resp) {
        ResultObj result = new ResultObj();
        try {
            HttpSession session = req.getSession();
            UserVo userVo = redisObjUtil.getUserVo(session.getId());
            if (StringUtils.checkNull(userVo) || StringUtils.checkNull(userVo.getId())) {
                result.setCode(1);
                result.setMsg("请先登录！");
                resp.sendRedirect("/login.html");
            } else {
                userVo = new UserVo(userVo);
                result.setCode(0);
                result.setData(userVo);
            }
            redisObjUtil.expire(session.getId());
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("系统错误！");
            e.printStackTrace();
        }
        return result;
    }

    @PostMapping(value = "/updateUser.do")
    @ApiOperation(value = "修改用户信息", tags = "用户操作接口")
    public ResultObj updateUser(HttpServletRequest req, Long phone, String name, String email, @RequestParam("file") MultipartFile file) {
        ResultObj result = new ResultObj();
        try {
            HttpSession session = req.getSession();
            User user = userService.queryById(redisObjUtil.getUserVo(session.getId()).getId());

            //修改电话
            StringUtils.isPhoneLegal(phone);
            user.setPhone(phone);
            Assert.isNull("","");

            // 修改邮件
            if (!StringUtils.checkNull(email)) {
                StringUtils.isEmail(email, "邮箱不合法！");
                if (!user.getEmail().equals(email)) {
                    if (!userService.isUse("email", email)) {
                        user.setEmail(email);
                    } else {
                        throw new MyException("邮箱已经被使用");
                    }
                }
            }
            //不为空 新旧名字不相等 新名字没有被使用
            if (!StringUtils.checkNull(user.getName()) && !user.getName().equals(name) && !userService.nameIsUse(name)) {
                user.setName(name);
            }

            System.out.println(file.getOriginalFilename());
            file.transferTo(Paths.get(FileUtil.imgPath + file.getOriginalFilename()));
            userService.updateById(user);

        } catch (MyException e) {
            result.setMsg(e.getMessage());
            result.setCode(1);
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("系统错误！");
            e.printStackTrace();
        }
        return result;
    }

    @GetMapping(value = "/getAllUser.do")
    @ApiOperation(value = "获取全部用户信息", tags = "用户操作接口")
    public ResultObj getAllUser(HttpServletRequest req, HttpServletResponse resp) {
        ResultObj result = new ResultObj();
        try {
            List<User> list = userService.getAll();

            result.setCode(0);
            result.setCount(list.size());
            result.setData(list);
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("系统错误！");
            e.printStackTrace();
        }
        return result;
    }

    @GetMapping(value = "/refreshUser.do")
    @ApiOperation(value = "刷新当前登录的用户信息", tags = "用户操作接口")
    public ResultObj refreshUser(HttpServletRequest req, HttpServletResponse resp) {
        ResultObj result = new ResultObj();
        try {
            HttpSession session = req.getSession();
            UserVo userVo = new UserVo(userService.queryById(redisObjUtil.getEntity(session.getId(), UserVo.class).getId()));
            redisObjUtil.setEntity(req.getSession().getId(), 30, userVo);
            result.setCode(0);
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("系统错误！");
            e.printStackTrace();
        }
        return result;
    }


    @GetMapping(value = "/logout.do")
    @ApiOperation(value = "退出登录", tags = "用户操作接口")
    public ResultObj logout(HttpServletRequest req, HttpServletResponse resp) {
        ResultObj result = new ResultObj();
        try {
            redisObjUtil.delete(req.getSession().getId());
            result.setCode(0);
            result.setMsg("成功退出登录！");
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("系统错误！");
            e.printStackTrace();
        }
        return result;
    }
}
