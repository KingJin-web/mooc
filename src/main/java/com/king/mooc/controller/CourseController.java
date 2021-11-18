package com.king.mooc.controller;

import com.alibaba.fastjson.JSONObject;
import com.king.mooc.entity.Course;
import com.king.mooc.entity.User;
import com.king.mooc.service.CourseService;
import com.king.mooc.service.CourseVideoService;
import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.util.StringUtils;
import com.king.mooc.vo.CourseVo;
import com.king.mooc.vo.ResultObj;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

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
    CourseService courseService;

    @Autowired
    RedisObjUtil redisObjUtil;

    @Autowired
    CourseVideoService courseVideoService;

    @PostMapping(value = "/delete.do")
    @ApiOperation(value = "通过课程id删除课程", tags = "课程操作接口")
    @ApiImplicitParam(name = "id", value = "课程id", dataType = "long", paramType = "query", example = "1", required = true)
    public ResultObj deleteCourse(HttpServletRequest req, Long id) {
        ResultObj resultObj = new ResultObj();

        try {
            User user = redisObjUtil.getEntity(req.getSession().getId(), User.class);
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

    @PostMapping(value = "/findLikeName.do")
    @ApiOperation(value = "通过课程名查询", tags = "课程操作接口")
    @ApiImplicitParam(name = "name", value = "课程名", dataType = "string", paramType = "query", example = "lihailin9073", required = true)
    public ResultObj findLikeName(String name) {
        ResultObj resultObj = new ResultObj();
        try {
            resultObj.setData(courseService.queryByLikeName(name));
            resultObj.setCode(0);
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            resultObj.setMsg("系统错误！");
            resultObj.setCode(1);
            return resultObj;
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


}
