//package com.king.mooc;
//
//
//import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
//import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
//import com.csvreader.CsvReader;
//import com.king.mooc.entity.Course;
//import com.king.mooc.entity.CourseVideo;
//import com.king.mooc.entity.enums.Category;
//import com.king.mooc.entity.enums.Role;
//import com.king.mooc.mapper.CourseMapper;
//import com.king.mooc.mapper.CourseVideoMapper;
//import com.king.mooc.util.RedisObjUtil;
//import com.king.mooc.util.StringUtils;
//import com.king.mooc.vo.UserVo;
//import org.junit.Test;
//import org.junit.runner.RunWith;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.boot.test.context.SpringBootTest;
//import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
//import org.springframework.test.context.junit4.SpringRunner;
//
//import java.io.FileNotFoundException;
//import java.io.IOException;
//import java.lang.reflect.InvocationTargetException;
//import java.lang.reflect.Method;
//import java.math.BigDecimal;
//import java.nio.charset.StandardCharsets;
//import java.util.Random;
//import java.util.regex.Pattern;
//
//@RunWith(SpringRunner.class)
//@SpringBootTest
//public class MoocApplicationTests {
//
//    @Autowired
//    RedisObjUtil redisObjUtil;
//
//    @Test
//    public void setEntity() {
//        UserVo userVo = new UserVo();
//
//        redisObjUtil.setEntity("userVo", userVo);
//    }
//
//    @Test
//    public void getEntity() {
//
//    }
//
//    @Test
//    public void contextLoads() throws NoSuchMethodException, InvocationTargetException, IllegalAccessException, InstantiationException {
//        UserVo userVo = new UserVo();
//        Method method = userVo.getClass().getMethod("setId", Long.class);
//        method.invoke(userVo.getClass().newInstance(), 123L);
//        System.out.println(userVo);
//    }
//
//    @Autowired
//    CourseMapper courseMapper;
//
//    @Test
//    public void insertCourse() {
//        String filePath = "C:\\Users\\King\\Downloads\\移动开发.csv";
//        try {
//            // 创建CSV读对象
//            CsvReader csvReader = new CsvReader(filePath, ',', StandardCharsets.UTF_8);
//
//            // 读表头
//            csvReader.readHeaders();
//            while (csvReader.readRecord()) {
////                // 读一整行
////                System.out.println(csvReader.getRawRecord());
//                // 读这行的某一列
//                // System.out.println(csvReader.get("标题"));
//                Pattern pattern = Pattern.compile("((\\d*)(\\.\\d*)?|0)");
//
//                Course course = new Course();
//                course.setUid(2L);
//                BigDecimal bigDecimal =  BigDecimal.valueOf(StringUtils.getDouble(0,200));
//                course.setName(csvReader.get(0));
//                course.setCoverImage(csvReader.get(2));
//                course.setPrice(bigDecimal);
//                course.setVipPrice(bigDecimal.multiply( BigDecimal.valueOf(0.8)));
//                course.setCategory(Category.COMPUTER);
//                course.setMsg(csvReader.get(7));
//                courseMapper.insert(course);
//            }
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }
//
//    @Test
//    public void insert() {
//        String filePath = "C:\\Users\\King\\Downloads\\11.csv";
//
//        try {
//            // 创建CSV读对象
//            CsvReader csvReader = new CsvReader(filePath, ',', StandardCharsets.UTF_8);
//
//            // 读表头
//            csvReader.readHeaders();
//            int i = 0;
//            while (csvReader.readRecord()) {
////                // 读一整行
////                System.out.println(csvReader.getRawRecord());
//                // 读这行的某一列
//                System.out.println(csvReader.get("标题"));
//                Pattern pattern = Pattern.compile("((\\d*)(\\.\\d*)?|0)");
//
//                CourseVideo courseVideo = new CourseVideo();
//                courseVideo.setCid(2L);
//                courseVideo.setVideoNumber(i++);
//                courseVideo.setName(csvReader.get(0));
//                courseVideo.setPath("www.baidu.com");
//                courseVideo.insert();
//                System.out.println(courseVideo);
//            }
//
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//
//    }
//
//   @Test
//    public void delete(){
//        QueryWrapper<Course> qw = new QueryWrapper<>();
//        qw.eq("category", Category.COMPUTER.getStatus());
//        courseMapper.delete(qw);
//   }
//
//
//}
