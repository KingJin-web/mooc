package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.king.mooc.entity.Course;
import com.king.mooc.entity.User;
import com.king.mooc.entity.enums.Category;
import com.king.mooc.mapper.CourseMapper;
import com.king.mooc.service.CourseService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.UserIPUtil;
import com.king.mooc.vo.CourseVo;
import com.king.mooc.vo.CourseVos;
import com.king.mooc.vo.ResultObj;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @program: mooc
 * @description: 课程操作实现类
 * @author: King
 * @create: 2021/10/12 9:28
 */
@Service
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public int insert(Course course) {
        return courseMapper.insert(course);
    }

    @Override
    public int deleteById(Integer id) {
        return courseMapper.deleteById(id);
    }

    @Override
    public Course selectById(Long id) {
        return courseMapper.selectById(id);
    }

    @Override
    public IPage<Course> queryByLikeNameAndMsg(String name, int current) {
        QueryWrapper<Course> qw = new QueryWrapper<>();
        qw.like("name", name).or().like("msg", name);
        Page<Course> page = new Page<>(current, 5);
        return courseMapper.selectPage(page, qw);
    }

    @Override
    public int updatePrice(long id, Double price, Double vipPrice, Double activityPrice) {
        return courseMapper.updatePrice(id, price, vipPrice, activityPrice);
    }

    @Override
    public int deleteCourse(long id, long uid) {
        QueryWrapper<Course> qw = new QueryWrapper<>();
        qw.eq("id", id);
        qw.eq("uid", uid);
        return courseMapper.delete(qw);
    }

    @Override
    public Course queryById(Long id) {
        return courseMapper.selectById(id);
    }

    @Override
    public CourseVos queryRecommend() {
        CourseVos courseVos = new CourseVos();
        courseVos.setFrontend(courseMapper.queryRecommend(Category.FRONTEND));
        courseVos.setBackend(courseMapper.queryRecommend(Category.BACKEND));
        courseVos.setDatabase(courseMapper.queryRecommend(Category.DATABASE));
        courseVos.setMobile(courseMapper.queryRecommend(Category.MOBILE));
        courseVos.setComputer(courseMapper.queryRecommend(Category.COMPUTER));

        return courseVos;
    }

    @Override
    public CourseVos queryNew() {
        CourseVos courseVos = new CourseVos();
        courseVos.setFrontend(courseMapper.queryNew(Category.FRONTEND));
        courseVos.setBackend(courseMapper.queryNew(Category.BACKEND));
        courseVos.setDatabase(courseMapper.queryNew(Category.DATABASE));
        courseVos.setMobile(courseMapper.queryNew(Category.MOBILE));
        courseVos.setComputer(courseMapper.queryNew(Category.COMPUTER));
        return courseVos;
    }

    @Override
    public CourseVos queryHot() {
        return null;
    }


    /**
     * 获取已经购买的课程
     * @param page
     * @param limit
     * @param id
     * @return
     */
    @Override
    public ResultObj queryByUid(int page, int limit, Long id) {
        Page<Course> coursePage = new Page<>(page, limit);

        IPage<Course> courseIPage = courseMapper.queryByUid1(coursePage, id);
        return ResultObj.layui(courseIPage.getTotal(),courseIPage.getRecords());

    }

    @Override
    public List<Course> getFileList() {
        return courseMapper.getFileList();
    }

    @Override
    public void updateCourse(Course course) {
        courseMapper.updateById(course);
    }


    public IPage<Course> queryByLikeName(String name, int current) {
        Page<Course> page = new Page<>(current, 10);
        QueryWrapper<Course> queryWrapper = new QueryWrapper<>();
        queryWrapper.like("name", name);
        IPage<Course> selectPage = courseMapper.selectPage(page, queryWrapper);
        System.out.println(selectPage);
        System.out.println("================= 相关的分页信息 ==================");
        System.out.println("总条数:" + selectPage.getTotal());
        System.out.println("当前页码:" + selectPage.getCurrent());
        System.out.println("总页数:" + selectPage.getPages());
        System.out.println("每页显示条数:" + selectPage.getSize());
        System.out.println("是否有上一页:" + page.hasPrevious());
        System.out.println("是否有下一页:" + page.hasNext());
        System.out.println("查询结果:");
        return selectPage;
    }

}
