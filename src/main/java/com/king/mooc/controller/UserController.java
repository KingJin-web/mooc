package com.king.mooc.controller;

import com.alibaba.fastjson.JSON;
import com.king.mooc.entity.User;
import com.king.mooc.mapper.UserMapper;
import com.king.mooc.service.QiniuService;
import com.king.mooc.service.UserService;
import com.king.mooc.util.*;
import com.king.mooc.vo.ResultObj;
import com.king.mooc.vo.UserVo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

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
    private UserService userService;
    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private QiniuService qiniuService;

    @PostMapping(value = "/register.do")
    @ApiOperation(value = "注册用户", tags = "用户操作接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "name", value = "用户名", dataType = "string", paramType = "query", example = "lihailin9073", required = true),
            @ApiImplicitParam(name = "pwd1", value = "登录密码", dataType = "string", paramType = "query", example = "123456", required = true),
            @ApiImplicitParam(name = "pwd2", value = "确认密码", dataType = "string", paramType = "query", example = "123456", required = true),
            @ApiImplicitParam(name = "email", value = "邮箱", dataType = "string", paramType = "query", example = "jinpeng.qmail@qq.com", required = true),
            @ApiImplicitParam(name = "validate_code", value = "注册验证码", dataType = "string", paramType = "query", example = "3679", required = true)

    })
    public ResultObj register(String name, String pwd1, String pwd2, String emailOrPhone,
                              String validate_code, HttpServletRequest request) {
        try {
            StringUtils.nameIsOk(name);
            StringUtils.pwdCheckNull(pwd1, pwd2);
            StringUtils.checkNull(emailOrPhone, "请输入邮箱或者电话号码");
            HttpSession session = request.getSession();
            if (userService.isUse("name", name)) {
                return ResultObj.error("用户名已经被使用！");
            }
            String code = (String) session.getAttribute("code");
            if (StringUtils.isEmpty(code)) {
                return ResultObj.error("请先获取验证码！");
            }
            if (code.equalsIgnoreCase(validate_code))
                if (StringUtils.emailOrPhone(emailOrPhone)) {
                    if (userService.isUse("email", emailOrPhone))
                        return ResultObj.error("此邮箱已经被注册！");
                    if (userService.registerByEmail(name, pwd1, emailOrPhone))
                        return ResultObj.ok("注册成功！");
                } else {
                    if (userService.isUse("phone", emailOrPhone))
                        return ResultObj.error("此电话已经被注册！");
                    if (userService.registerByPhone(name, pwd1, emailOrPhone))
                        return ResultObj.ok("注册成功！");
                }
            else {
                return ResultObj.error("验证码错误！");
            }

        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误请联系管理员！");
        }
        return ResultObj.error("登录失败！");
    }


    @PostMapping(value = "/nameIsUse.do")
    @ApiOperation(value = "用户名是否被使用", tags = "用户操作接口")
    @ApiImplicitParam(name = "username", value = "用户名", dataType = "string", paramType = "query", example = "king", required = true)
    public ResultObj nameIsUse(String username) {
        try {
            User user = UserIPUtil.getUser();
            StringUtils.nameIsOk(username);
            if (user.getName().equals(username)) {
                return ResultObj.obj(3, "无变化！");
            }
            if (userService.isUse("name", username)) {
                return ResultObj.error("用户名已经被使用！");
            } else {
                return ResultObj.ok("用户名可以使用使用！");
            }
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误请联系管理员！");
        }
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
//    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj getUser(HttpServletRequest req, HttpServletResponse resp) {
        try {
            User user = UserIPUtil.getUser();
            UserVo userVo = new UserVo(user);
            return ResultObj.ok(userVo);
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误!");

        }
    }

    @GetMapping(value = "/getLoginUser.do")
    @ApiOperation(value = "获取登录用户信息2", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN')")
    public ResultObj getLoginUser(HttpServletRequest req, HttpServletResponse resp) {
        return ResultObj.ok(userService.getLoginUser());
    }

    @GetMapping(value = "/refreshUser.do")
    @ApiOperation(value = "刷新当前登录的用户信息", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj refreshUser(HttpServletRequest req, HttpServletResponse resp) {

        ResultObj result = new ResultObj();
        try {
            User user = UserIPUtil.getUser();
            user = userService.queryByName(user.getName());
            userService.setLoginUser(user);
            logger.info(user.toString());
//            redisObjUtil.setEntity(userVo.getId().toString(), 30, userVo);
            result.setCode(0);
            result.setData(new UserVo(user));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误！");
        }
        return result;
    }

    @PostMapping(value = "/updatePwd.do")
    @ApiOperation(value = "修改用户账号密码", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj updatePwd(String oldPwd, String newPwd1, String newPwd2) {
        try {
            User user = UserIPUtil.getUser();
            return userService.updatePwd(user, oldPwd, newPwd1, newPwd2);
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        }
    }

    @PostMapping(value = "/updatePhone.do")
    @ApiOperation(value = "修改用户电话", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj updatePhone(HttpServletRequest req
            , String password, Long phone) {
        logger.info(JSON.toJSONString(req.getParameterMap()));
        try {
            User user = (User) SecurityContextHolder.getContext().
                    getAuthentication().getPrincipal();

            StringUtils.isPhone(phone);
            userService.updatePhone(user, phone);
            return ResultObj.ok("修改成功！");
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误! ");

        }
    }


    @PostMapping(value = "/updateEmail.do")
    @ApiOperation(value = "修改用户邮箱", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj updateEmail(HttpServletRequest req, String password, String email) {
        logger.info(JSON.toJSONString(req.getParameterMap()));
        try {
            User user = UserIPUtil.getUser();
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            StringUtils.isPhone(email);
            if (encoder.matches(password, user.getPassword())) {
                userService.updateEmail(user, email);
            } else {
                return ResultObj.ok("账户密码输入错误！");
            }

            return ResultObj.ok("修改成功！");
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误! ");

        }
    }


    @GetMapping(value = "/getAllUser.do")
    @ApiOperation(value = "获取全部用户信息", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN')")
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


    @GetMapping(value = "/logout.do")
    @ApiOperation(value = "退出登录", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj logout(HttpServletRequest req, HttpServletResponse resp) {
        ResultObj result = new ResultObj();
        try {
            result.setCode(0);
            result.setMsg("成功退出登录！");
        } catch (Exception e) {
            result.setCode(1);
            result.setMsg("系统错误！");
            e.printStackTrace();
        }
        return result;
    }

    //修改用户信息--有图片上传
    @PostMapping(value = "/updateUser1.do")
    @ApiOperation(value = "修改用户信息", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj updateUser(String name, String msg,
                                @RequestParam("file") MultipartFile file) {

        try {
            User user = UserIPUtil.getUser();
            //如果文件不为空，则上传图片
            if (!file.isEmpty()) {
                String fileName = file.getOriginalFilename();
                assert fileName != null;
                String key = user.getId() +
                        fileName.substring(fileName.lastIndexOf("."));
                String url = qiniuService.uploadUserAvatar(file.getInputStream(), key);
                return userService.updateUser(user, name, msg, url);
            }
            return userService.updateUser(user, name, msg, user.getHeadImg());
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        } catch (IOException e) {
            logger.error("上传头像失败！", e);
            return ResultObj.error("系统错误！");
        }
    }

    //修改用户信息--没有图片上传
    @PostMapping(value = "/updateUser2.do")
    @ApiOperation(value = "修改用户信息", tags = "用户操作接口")
    @PreAuthorize("hasAnyRole('ADMIN','USER')")
    public ResultObj updateUser(String name, String msg) {
        try {
            User user = UserIPUtil.getUser();
            return userService.updateUser(user, name, msg, null);
        } catch (MyException e) {
            return ResultObj.error(e.getMessage());
        }
    }


}
