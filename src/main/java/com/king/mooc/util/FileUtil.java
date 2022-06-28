package com.king.mooc.util;

import org.springframework.web.multipart.MultipartFile;
//import ws.schild.jave.MultimediaInfo;
//import ws.schild.jave.MultimediaObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;

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
    public static final String linuxPath = "https://static.wuzhaoqi.top/userImg/";
    /**
     * 用户课程视频存储路径
     */
    public static final String courseVideoPath = "/king/springboot/mooc/courseVideo/";
    /**
     * 用户课程封面图片存储路径
     */
    public static final String courseImgPath = "/king/springboot/mooc/courseVideo/";

//    /**
//     * 获取视频时长：单位ms
//     *
//     * @param file
//     * @return
//     */
//    public static Long getVideoTime(File file) {
//        try {
//            MultimediaObject instance = new MultimediaObject(file);
//            MultimediaInfo result = instance.getInfo();
//            return result.getDuration();
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return 0L;
//    }

//    public static String getVideoTime(String file) {
//        return TimeUtils.formatDateTime(getVideoTime(new File(file)) / 1000);
//    }

    public static String saveFile(MultipartFile uploadFile) throws MyException {
        StringBuilder sb = new StringBuilder();
        try {
            String osname = System.getProperty("os.name").toLowerCase();
            if (osname.contains("linux")) {
                uploadFile.transferTo(new File(imgPath, uploadFile.getOriginalFilename()));
                sb.append(linuxPath).append(uploadFile.getOriginalFilename());
            } else if (osname.contains("windows")) {
                uploadFile.transferTo(new File("H:\\king\\springboot\\mooc\\nginx-1.20.2\\html\\userImg", uploadFile.getOriginalFilename()));
                sb.append("http://localhost/userImg/").append(uploadFile.getOriginalFilename());
            }

        } catch (IOException e) {
            e.printStackTrace();
            throw new MyException("上传失败！");
        }
        return sb.toString();

    }

    /**
     * @param multipartFiles
     * @return 返回保存的路径
     */
    public String saveFile(MultipartFile... multipartFiles) {
        StringBuilder sb = new StringBuilder();
        try {
            for (MultipartFile multipartFile : multipartFiles) {
                multipartFile.transferTo(new File(imgPath, multipartFile.getOriginalFilename()));
                String osname = System.getProperty("os.name").toLowerCase();
                if (osname.contains("linux")) {
                    sb.append(imgPath).append(multipartFile.getOriginalFilename());
                } else if (osname.contains("windows")) {
                    sb.append("H:\\king\\springboot\\mooc\\userImg\\").append(multipartFile.getOriginalFilename());
                }

            }
        } catch (IOException e) {
            e.printStackTrace();
            return "上传失败!";
        }
        return sb.toString();
    }

    /**
     * 将获取的字节数组保存为文件写入硬盘
     *
     * @param data
     * @param fileName
     */
    public static void writeImageToDisk(byte[] data, String fileName) {
        try {
            File file = new File(fileName); // 本地目录
            File fileParent = file.getParentFile();
            if (!fileParent.exists()) {
                fileParent.mkdirs();
                file.createNewFile();
            }
            FileOutputStream fops = new FileOutputStream(file);
            fops.write(data);
            fops.flush();
            fops.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 获取远程http地址视图片
     *
     * @param strUrl
     * @return
     */
    public static byte[] getImageFromNetByUrl(String strUrl) {
        try {
            URL url = new URL(strUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5 * 1000);
            InputStream inStream = conn.getInputStream();
            byte[] btData = readInputStream(inStream);
            return btData;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public static InputStream getImageFromNetByUrlInputStream(String strUrl) {
        try {
            URL url = new URL(strUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setConnectTimeout(5 * 1000);
            return conn.getInputStream();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 读取流
     *
     * @param inStream
     * @return
     * @throws Exception
     */
    public static byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[1024];
        int len = 0;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        return outStream.toByteArray();
    }

}
