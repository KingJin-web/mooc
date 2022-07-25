package com.king.mooc.controller;

import com.king.mooc.entity.User;
import com.king.mooc.service.CourseService;
import com.king.mooc.service.CourseVideoService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import com.king.mooc.util.UserIPUtil;
import com.king.mooc.vo.ResultObj;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: mooc
 * @description: 告诉大家我是干啥的
 * @author: King
 * @create: 2021/10/14 17:31
 */
@RestController()
@RequestMapping("/api/course")
@Api(value = "课程操作接口", tags = "课程操作接口")
public class CourseController {

    @Autowired
    private CourseService courseService;

    @Autowired
    private CourseVideoService courseVideoService;

    @PostMapping(value = "/delete.do")
    @ApiOperation(value = "通过课程id删除课程", tags = "课程操作接口")
    @ApiImplicitParam(name = "id", value = "课程id", dataType = "long", paramType = "query", example = "1", required = true)
    public ResultObj deleteCourse(HttpServletRequest req, Long id) {
        ResultObj resultObj = new ResultObj();

        try {
            User user = UserIPUtil.getUser();
            if (StringUtils.checkNull(id) && StringUtils.checkNull(user.getId())) {
                courseService.deleteCourse(id, user.getId());
                resultObj.setMsg("删除成功！");
                resultObj.setCode(0);
            } else {
                resultObj.setMsg("删除失败！");
            }
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            resultObj.setMsg("系统错误！");
            resultObj.setCode(1);
            return resultObj;
        }


    }


    @GetMapping(value = "/findById.do")
    @ApiOperation(value = "通过课程id查询", tags = "课程操作接口")
    public ResultObj findById(Long id) {
        try {
            return ResultObj.ok(courseService.queryById(id));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误！");
        }
    }

    //推荐课程
    @GetMapping(value = "/recommend.do")
    @ApiOperation(value = "推荐课程", tags = "课程操作接口")
    public ResultObj recommend() {
        try {
            return ResultObj.ok(courseService.queryRecommend());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误！");
        }
    }

    //新增的课程
    @GetMapping(value = "/getNewCourse.do")
    @ApiOperation(value = "新增课程", tags = "课程操作接口")
    public ResultObj getNewCourse() {
        try {
            return ResultObj.ok(courseService.queryNew());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误！");
        }
    }


    @PostMapping(value = "/addCourse.do")
    @ApiOperation(value = "添加课程", tags = "课程操作接口")
    @ApiImplicitParams({
            @ApiImplicitParam(name = "s", value = "用户名,或邮箱", dataType = "string", paramType = "query", example = "king", required = true),
            @ApiImplicitParam(name = "password", value = "登录密码", dataType = "string", paramType = "query", example = "aaaa", required = true),
            @ApiImplicitParam(name = "validate_code", value = "登录验证码", dataType = "string", paramType = "query", example = "3679", required = true)

    })
    public ResultObj addCourse(String name) {
        ResultObj resultObj = new ResultObj();
        try {

            resultObj.setCode(0);
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            resultObj.setMsg("系统错误！");
            resultObj.setCode(1);
            return resultObj;
        }
    }


    @PostMapping(value = "/getVideoList.do")
    @ApiOperation(value = "通过课程id查询视频列表", tags = "课程操作接口")
    @ApiImplicitParam(name = "cid", value = "课程id", dataType = "long", paramType = "query", example = "1446666198576553123", required = true)
    public ResultObj getVideoList(Long cid) {
        ResultObj resultObj = new ResultObj();
        try {
            resultObj.setData(courseVideoService.queryByCid(cid));
            resultObj.setCode(0);
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            resultObj.setMsg("系统错误！");
            resultObj.setCode(1);
            return resultObj;
        }
    }

    @PostMapping(value = "/addPlayAmount.do")
    @ApiOperation(value = "通过点击增加播放量", tags = "课程操作接口")
    @ApiImplicitParam(name = "id", value = "视频id", dataType = "long", paramType = "query", example = "1460685767151534082", required = true)
    public ResultObj addPlayAmount(Long id) {
        ResultObj resultObj = new ResultObj();
        try {
            if (courseVideoService.addPlayAmount(id) > 0) {
                resultObj.setMsg("已经将视频id:" + id + "播放量加一");
            }
            resultObj.setCode(0);
        } catch (Exception e) {
            e.printStackTrace();
            resultObj.setMsg("系统错误！");
            resultObj.setCode(1);
        }
        return resultObj;
    }

    /**
     * 通过用户id查询购买的课程
     *
     * @param
     * @return ResultObj
     */
    @ApiOperation(value = "通过用户id查询购买的课程", tags = "课程操作接口")
    @GetMapping(value = "/getBuyCourse.do")
    public ResultObj getCourseByOrders(int page, int limit) {
        try {
            if (page < 1) {
                page = 1;
            }
            if (limit < 1) {
                limit = 10;
            }
            User user = UserIPUtil.getUser();
           return courseService.queryByUid(page, limit, user.getId());
        } catch (MyException e) {
            e.printStackTrace();
            return ResultObj.error(e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误！");
        }
    }

    @GetMapping("/search.do")
    private ResultObj search(String query, Integer current) {
        try {
            if (current == null) {
                current = 1;
            }
            return ResultObj.ok(courseService.queryByLikeNameAndMsg(query, current));
        } catch (Exception e) {
            e.printStackTrace();
            return ResultObj.error("系统错误！");
        }
    }

}
