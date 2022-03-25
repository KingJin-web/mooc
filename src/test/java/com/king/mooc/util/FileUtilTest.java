package com.king.mooc.util;

import org.junit.Test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

import static org.junit.Assert.*;

public class FileUtilTest {

    @Test
    public void getVideoTime() {
        long a = FileUtil.getVideoTime(new File("C:\\Users\\King\\Videos\\2_idea中安装hdfs插件.wmv"));
        System.out.println(a);
    }

    @Test
    public void t() {
        System.out.println(TimeUtils.formatDateTime(468100));
        File file = new File(FileUtil.courseVideoPath);

        file.mkdirs();
        System.out.println(file.toURI());

        try (BufferedReader bufferedReader = new BufferedReader(new FileReader(new File("H:\\Downloads\\helloweba_seat\\index.html")));) {
            String a;
            while (bufferedReader.readLine() != null){
                System.out.println(bufferedReader.readLine());
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }


}