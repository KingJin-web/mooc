package com.king.mooc.service;

import com.king.mooc.entity.Course;

import java.util.List;

public interface CourseService {
    //新增课程
    int insert(Course course);

    /**
     * 通过课程名模糊查找课程
     * @param name 课程名
     * @return
     */
    List<Course> queryByLikeName(String name);

    /**
     * 修改价格
     *
     * @param id            课程id
     * @param price         原价
     * @param vipPrice      会员价
     * @param activityPrice 活动价
     * @return
     */
    int updatePrice(long id, Double price, Double vipPrice, Double activityPrice);

    /**
     * 通过id删除课程
     * @param id
     * @return
     */
    int deleteCourse(long id,long tid);

}
