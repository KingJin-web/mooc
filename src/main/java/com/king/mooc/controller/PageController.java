package com.king.mooc.controller;

import com.king.mooc.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.UUID;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-03-22 19:19
 */
@Controller

public class PageController {
    @GetMapping("login")
    public String openLogin() {
        return "login.html";
    }

    @GetMapping("/register")
    public String openRegister() {
        return "register.html";
    }

    @GetMapping("/")
    public String index() {
        return "index.html"; // 视图重定向 - 跳转
    }

    @GetMapping("/user/")
    public String userIndex() {
        return "/user/index.html"; // 视图重定向 - 跳转
    }

    @GetMapping("/user/account")
    public String account(String type) {
        if (StringUtils.isEmpty(type)) {
            return "/user/account.html";
        }
        if (type.equals("email")) {
            return "/user/upadteEamil.html";
        }
        if (type.equals("phone")) {
            return "/user/upadtePhone.html";
        }

        return "/";

    }
}
