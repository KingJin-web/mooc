package com.king.mooc.vo;

import com.king.mooc.entity.Course;
import lombok.Data;

import java.util.List;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-03-30 19:55
 */
@Data
public class CourseVos {
    //  前端开发
    private List<Course> frontend;
    // 后端开发
    private List<Course> backend;
    // 移动开发
    private List<Course> mobile;
    // 数据库
    private List<Course> database;
    //  计算机基础
    private List<Course> computer;
}


