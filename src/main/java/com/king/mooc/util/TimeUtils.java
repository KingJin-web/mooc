package com.king.mooc.util;

/**
 * @program: mooc
 * @description: 告诉大家我是干啥的
 * @author: King
 * @create: 2021/10/18 16:39
 */
public class TimeUtils {
    /**
     * 将秒时间转化为--天--小时--分钟--秒
     *
     * @param mss 秒数
     * @return 3天10小时12分钟0秒
     */
    public static String formatDateTime(long mss) {
        StringBuilder data = new StringBuilder();

        long days = mss / (60 * 60 * 24);
        long hours = (mss % (60 * 60 * 24)) / (60 * 60);
        long minutes = (mss % (60 * 60)) / 60;
        long seconds = mss % 60;
        if (days > 0) {
            data.append(days).append("天").append(hours).append("小时").append(minutes).append("分钟").append(seconds).append("秒");
        } else if (hours > 0) {
            data.append(hours).append("小时").append(minutes).append("分钟").append(seconds).append("秒");
        } else if (minutes > 0) {
            data.append(minutes).append("分钟").append(seconds).append("秒");
        } else {
            data.append(seconds).append("秒");
        }

        return data.toString();
    }


}
