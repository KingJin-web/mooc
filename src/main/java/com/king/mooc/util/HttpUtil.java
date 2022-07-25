package com.king.mooc.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-04-01 20:17
 */
public class HttpUtil {

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

    //获取请求的协议域名，端口号生成连接的前半部分
    public static String getUrlStart(HttpServletRequest request) {
        StringBuilder url = new StringBuilder();
        url.append(request.getScheme());
        System.out.println(url);
        url.append("://").append(request.getServerName());
        System.out.println(url);
        url.append(":").append(request.getServerPort());
        System.out.println(url);
//        url.append(request.getServletPath());
//        System.out.println(url);
        return url.toString();
    }

    //获取session 并且判断是否存在
    @SuppressWarnings("unchecked")
    public static <T> T getSession(HttpServletRequest request, String key, Class<T> clazz) {
        try {
            Object obj = request.getSession().getAttribute(key);
            if (obj == null) {
                return null;
            }
            if (clazz.isInstance(obj)) {
                return (T) obj;
            }
        } catch (Exception e) {
            throw new RuntimeException("session中的数据类型不匹配");
        }
        throw new RuntimeException("session中的数据类型不匹配");
    }
}
