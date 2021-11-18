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

}
