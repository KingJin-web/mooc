package com.king.mooc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-03-22 19:19
 */
@Controller

public class PageController {
    @RequestMapping("login")
    public String openLogin() {
        return "login.html";
    }

    @RequestMapping("/register")
    public String openRegister() {
        return "register.html";
    }
}
