package com.king.mooc;


import com.csvreader.CsvReader;
import com.king.mooc.entity.CourseVideo;
import com.king.mooc.mapper.CourseVideoMapper;
import com.king.mooc.util.RedisObjUtil;
import com.king.mooc.vo.UserVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.charset.StandardCharsets;
import java.util.regex.Pattern;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class MoocApplicationTests {

    @Autowired
    RedisObjUtil redisObjUtil;

    @Test
    public void setEntity() {
        UserVo userVo = new UserVo();

        redisObjUtil.setEntity("userVo", userVo);
    }

    @Test
    public void getEntity() {

    }

    @Test
    public void contextLoads() throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
        UserVo userVo = new UserVo();
        Method method = userVo.getClass().getMethod("setId", Long.class);
        method.invoke(userVo.getClass().newInstance(), 123L);
        System.out.println(userVo);
    }

    @Autowired
    CourseVideoMapper courseVideoMapper;

    @Test
    public void insert() {
        String filePath = "C:\\Users\\King\\Downloads\\11.csv";

        try {
            // 创建CSV读对象
            CsvReader csvReader = new CsvReader(filePath, ',', StandardCharsets.UTF_8);

            // 读表头
            csvReader.readHeaders();
            double i = 0;
            while (csvReader.readRecord()) {
//                // 读一整行
//                System.out.println(csvReader.getRawRecord());
                // 读这行的某一列
                System.out.println(csvReader.get("标题"));
                Pattern pattern = Pattern.compile("((\\d*)(\\.\\d*)?|0)");

                CourseVideo courseVideo = new CourseVideo();
                courseVideo.setCid(1446666198576553999L);
                courseVideo.setVideoNumber(i++);
                courseVideo.setName(csvReader.get(0));
                courseVideo.setPath("www.baidu.com");
                courseVideo.insert();
                System.out.println(courseVideo);
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
