package com.king.mooc.admin.controller;

import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-02-16 23:43
 */

@RestController()
@RequestMapping("/admin/admin")
@Api(value = "管理员", tags = "管理员接口")
public class AdminController {
}
