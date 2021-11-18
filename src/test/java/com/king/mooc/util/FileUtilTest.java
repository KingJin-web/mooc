package com.king.mooc.util;

import org.junit.Test;

import java.io.File;

import static org.junit.Assert.*;

public class FileUtilTest {

    @Test
    public void getVideoTime(){
        long a = FileUtil.getVideoTime(new File("C:\\Users\\King\\Videos\\2_idea中安装hdfs插件.wmv"));
        System.out.println(a);
    }

    @Test
    public void t(){
        System.out.println(TimeUtils.formatDateTime(468100));
        File file = new File(FileUtil.courseVideoPath);
        file.mkdirs();
        System.out.println(file.toURI());
    }



}