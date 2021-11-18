package com.king.mooc.util;

import ws.schild.jave.MultimediaInfo;
import ws.schild.jave.MultimediaObject;

import java.io.File;

/**
 * @program: mooc
 * @description: 文件帮助类
 * @author: King
 * @create: 2021-11-18 23:47
 */
public class FileUtil {
    /**
     * 用户头像图片存储位置
     */
    public static final String imgPath = "/king/springboot/mooc/userImg/";
    /**
     * 用户课程视频存储路径
     */
    public static final String courseVideoPath = "/king/springboot/mooc/courseVideo/";
    /**
     * 用户课程封面图片存储路径
     */
    public static final String courseImgPath = "/king/springboot/mooc/courseVideo/";

    /**
     * 获取视频时长：单位ms
     *
     * @param file
     * @return
     */
    public static Long getVideoTime(File file) {
        try {
            MultimediaObject instance = new MultimediaObject(file);
            MultimediaInfo result = instance.getInfo();
            return result.getDuration();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0L;
    }

    public static String getVideoTime(String file) {
        return TimeUtils.formatDateTime(getVideoTime(new File(file)) / 1000);
    }
}
