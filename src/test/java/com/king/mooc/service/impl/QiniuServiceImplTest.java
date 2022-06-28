package com.king.mooc.service.impl;

import com.king.mooc.entity.Course;
import com.king.mooc.service.CourseService;
import com.king.mooc.util.ChangeFile;
import com.king.mooc.util.FileUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@SpringBootTest
@RunWith(SpringJUnit4ClassRunner.class)
public class QiniuServiceImplTest {

    //日志
    private static final org.slf4j.Logger logger = org.slf4j.LoggerFactory.getLogger(QiniuServiceImplTest.class);
    @Autowired
    private QiniuServiceImpl qiniuService;

    @Autowired
    private CourseService courseService;

    @Before
    public void setUp() throws Exception {
    }

    @After
    public void tearDown() throws Exception {
    }

    @org.junit.Test
    public void uploadFile() {
        try {
            List<Course> fileList = courseService.getFileList();
            for (Course course : fileList) {
                String fileUrl = course.getCoverImage();
                //获取文件名
                String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
                //获取文件类型

                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
                if (fileType.contains("!")) {
                    fileType = fileType.substring(0, fileType.indexOf("!"));
                }

                logger.info("文件类型：{}", fileType);
                logger.info("文件名：{}", course.getId() + "." + fileType);
//            //获取文件内容
//            String fileContent = ChangeFile.getFileContent(fileUrl);
//            //上传文件
//            qiniuService.uploadFile(fileName, fileType, fileContent);
                String url = qiniuService.upLoad(FileUtil.getImageFromNetByUrlInputStream(course.getCoverImage()), course.getId() + "." + fileType);
                course.setCoverImage(url);
                courseService.updateCourse(course);
                logger.info("文件上传成功：{}", url);
                logger.info("文件上传成功：{}", course);
            }
        } catch (Exception e) {
            logger.error("文件上传失败：{}", e);
        }
        //从数据库中获取文件链接


    }

    @org.junit.Test
    public void uploadFile2() {
        try {
            List<Course> fileList = courseService.getFileList();
            for (Course course : fileList) {
                String fileUrl = course.getCoverImage();
                //获取文件名
                String fileName = fileUrl.substring(fileUrl.lastIndexOf("/") + 1);
                //获取文件类型

                String fileType = fileName.substring(fileName.lastIndexOf(".") + 1);
                if (fileType.contains("!")) {
                    fileType = fileType.substring(0, fileType.indexOf("!"));
                }

                logger.info("文件类型：{}", fileType);
                logger.info("文件名：{}", course.getId() + "." + fileType);
                qiniuService.deleteFile(course.getId() + "." + fileType);
            }

        }catch (Exception e) {
            logger.error("删除文件：{}", e);
        }
    }


}