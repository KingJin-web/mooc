package com.king.mooc.service;

import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.List;

/**
 * @author: 12613
 * @project: mooc
 * @pcakage: com.king.mooc.service.QiniuService
 * @date: 2022年05月03日 01:42
 * @description: ${}
 */
public interface QiniuService {

    //上传文件到七牛云
    String uploadFile(byte[] file, String fileName);

    String uploadFile(MultipartFile uploadFile, String fileName);

    String uploadFile(byte[] file);

    List<String> uploadFiles(MultipartFile[] uploadFile);

    //下载文件
    byte[] downloadFile(String fileName);


    //删除七牛云文件
    void deleteFile(String key);

    String upLoad(InputStream inputStream, String path);

    //上传用户头像
    String uploadUserAvatar(InputStream inputStream, String path);
}


