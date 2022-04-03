package com.king.mooc.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.king.mooc.entity.Course;
import com.king.mooc.vo.CourseVo;
import com.king.mooc.vo.CourseVos;
import com.king.mooc.vo.ResultObj;

import java.util.List;

public interface CourseService {
    //新增课程
    int insert(Course course);

    //根据id删除课程
    int deleteById(Integer id);

    //根据id查询课程
    Course selectById(Long id);

    /**
     * 通过课程名模糊查找课程
     *
     * @param query   搜索的内容
     * @param current 当前页
     * @return
     */
    IPage<Course> queryByLikeNameAndMsg(String query, int current);

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
     *
     * @param id
     * @return
     */
    int deleteCourse(long id, long tid);

    /**
     * 通过id查询课程
     *
     * @param id
     * @return
     */
    Course queryById(Long id);


    //获取推荐课程
    CourseVos queryRecommend();

    //获取最新课程
    CourseVos queryNew();

    //获取最热课程
    CourseVos queryHot();

    /**
     * 通过购买课程的用户id查询课程
     *
     * @param uid
     * @return List<Course>
     */
    List<Course> queryByUid(Long uid);


}
