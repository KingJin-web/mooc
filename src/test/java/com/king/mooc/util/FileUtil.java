package com.king.mooc.util;



import org.junit.Test;
import org.springframework.boot.test.context.SpringBootTest;

import java.io.*;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;

public class FileUtil {
    //存储要修改的内容
    private final Map<String, String> map;

    public FileUtil(Map<String, String> map) {
        this.map = map;
    }

    @Test
    public  void main(String[] args) {

        //读取指定文件夹下的所有文件
        //给我你的目录文件夹路径
        String filepath = "H:\\jetbrains\\java\\mooc\\src\\main\\resources\\static\\";
        //  String filepath = "H:\\jetbrains\\bs\\mall\\src\\main\\resources\\static";
        File file = new File(filepath);
        Map<String, String> map = new HashMap<>();

        map.put(" <a href=\"/vip\" class=\"nav-vip\">", " <a @click=\"gotoVip\" class=\"nav-vip\">");

//        map.put("<a href=\"http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44030502005963\" target=\"_blank\">粤公网安备44030502005963号</a>","");
//        map.put("粤ICP备18124674号-1","湘ICP备2020019542号-1");
//        map.put("潮汕商城","卖莫商城");
//        map.put("/user/account.html", "/user/account");
//        map.put("/user/courses", "/user/course");
//        map.put("/uc/orders", "/user/orders");
        //  map.put("https://wpa.qq.com/msgrd?v=3&uin=1261337209&site=qq&menu=yes%22", "https://wpa.qq.com/msgrd?v=3&uin=3098629064&site=qq&menu=yes");

        //map.put("/user/user.html", "/user/");
        //map.put("客服QQ：286211774", "客服QQ：3098629064");

//        map.put("<a class=\"location\"","");
//        map.put("href=\"https://map.baidu.com/search/深圳市南山区科发路1号富利臻大厦3409?querytype=s&wd=深圳市南山区科发路1号富利臻大厦3409\"","");
//        map.put("title=\"联系地址：深圳市南山区科发路1号富利臻大厦3409\"><span class=\"iconfont icon-location\"></span></a>","");

//map.put("https://www.zhihu.com/people/xiaochong0302","https://www.zhihu.com/people/da-rao-liao-53-22");
//map.put("286211774@qq.com","3098629064@qq.com");
//        map.put("&copy; 深圳市酷瓜软件有限公司","Copyright © All Rights Reserved");
//        map.put("http://beian.miit.gov.cn/","https://beian.miit.gov.cn/");
//        map.put("<a href=\"https://koogua.com\" title=\"kk在线网课\" target=\"_blank\">Powered by CTC 1.5.１</a>", "");
//
        new FileUtil(map).refreshFileList(file);

    }

    public void refreshFileList(String filepath) {
        refreshFileList(new File(filepath));
    }

    public void refreshFileList(File filepath) {
        if (!filepath.exists()) {
            System.out.println("此路径不存在");
            return;
        }
        File[] fileList = filepath.listFiles();
        if (fileList == null || fileList.length < 1) {
            System.out.println("空文件夹");
            return;
        }
        for (File file : fileList) {
            if (file.isDirectory()) {
                //如果是文件夹递归扫描
                refreshFileList(file);
            } else {
                String filename = file.getName();//读到的文件名
                String strFileName = file.getAbsolutePath();//文件路径
                //截取文件格式
                String SufName = filename.substring(filename.lastIndexOf(".") + 1);
                //排除不需要扫描的文件
//                if (SufName.equals("rar") || SufName.equals("jpg") || SufName.equals("png") || SufName.equals("jar") || SufName.equals("doc") || SufName.equals("xls") || SufName.equals("gif") || SufName.equals("wmz")) {
//                    continue;
//                }
                //或者指定扫描文件
                if (SufName.equalsIgnoreCase("html") || SufName.equalsIgnoreCase("java")) {
                    changeFile(file);
                }
            }
        }
    }

    /**
     * 修改文件
     *
     * @param file
     */
    private void changeFile(File file) {
        String s = null;
        try (FileInputStream fis = new FileInputStream(file);
             BufferedReader reader = new BufferedReader(new InputStreamReader(fis));) {

            //之所以用BufferedReader,而不是直接用BufferedInputStream读取,是因为BufferedInputStream是InputStream的间接子类,
            //InputStream的read方法读取的是一个byte,而一个中文占两个byte,所以可能会出现读到半个汉字的情况,就是乱码.
            //BufferedReader继承自Reader,该类的read方法读取的是char,所以无论如何不会出现读个半个汉字的.
            StringBuilder result = new StringBuilder();
            while (reader.ready()) {
                result.append((char) reader.read());
            }
            s = result.toString();
            Set<Map.Entry<String, String>> entries = map.entrySet();
            for (Map.Entry<String, String> mapKey : entries) {
                if (s.contains(mapKey.getKey())) { //判断当前行是否存在想要替换掉的字符
                    s = s.replace(mapKey.getKey(), mapKey.getValue());//替换为你想替换的内容
                }
            }

        } catch (IOException e) {
            e.printStackTrace();
        }

        writerFile(s, file);

    }

    /**
     * 写入文件
     *
     * @param s
     * @param file
     */
    public void writerFile(String s, File file) {
        try (FileOutputStream fos = new FileOutputStream(file);
             BufferedOutputStream bos = new BufferedOutputStream(fos)) {
            bos.write(s.getBytes());
            System.out.println("文件修改成功！");
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("文件修改失败！");
        }
    }

}


