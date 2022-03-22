package com.king.mooc.config.login;

import com.alibaba.fastjson.JSON;
import com.king.mooc.entity.User;
import com.king.mooc.entity.UserLog;
import com.king.mooc.mapper.UserMapper;
import com.king.mooc.mapper.mongodb.UserLogMapper;
import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.vo.ResultObj;
import com.king.mooc.vo.UserVo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @program: springboot
 * @description: 登录成功
 * @author: King
 * @create: 2022-03-13 08:41
 */
@Component
public class DefaultAuthenticationSuccessHandler extends SavedRequestAwareAuthenticationSuccessHandler {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private UserLogMapper userLogMapper;
    @Autowired
    private RedisObjUtil redisObjUtil;
    @Autowired
    private UserMapper userMapper;
    @Override
    public void onAuthenticationSuccess(HttpServletRequest request,
                                        HttpServletResponse response,
                                        Authentication e) throws IOException {


        User user = (User) e.getPrincipal();
        UserLog log = UserLog.builder().uid(user.getId()).name(user.getName()).ip(getIpAddress(request)).build();

        logger.info("----login in succcess----");
        logger.info(userLogMapper.save(log).toString());
        user = userMapper.findOneByName(user.getName());
        UserVo userVo = new UserVo().setUser(user);
        System.out.println(userVo);
        redisObjUtil.setEntity(request.getSession().getId(),60,userVo);
        UserVo userVo1 = new UserVo(user);
        logger.info(userVo1.toString());
        response.setContentType("application/json;charset=UTF-8");
        response.getWriter().write(JSON.toJSONString(ResultObj.ok("登录成功！")));


    }


    public static String getIpAddress(HttpServletRequest request) {
        String ip = request.getHeader("x-forwarded-for");
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("WL-Proxy-Client-IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_CLIENT_IP");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getHeader("HTTP_X_FORWARDED_FOR");
        }
        if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
            ip = request.getRemoteAddr();
        }
        return ip;
    }

}