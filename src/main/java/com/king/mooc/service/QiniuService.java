package com.king.mooc.service;

import org.springframework.web.multipart.MultipartFile;

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

    List<String> uploadFiles(byte[] file);

    //下载文件
    byte[] downloadFile(String fileName);


    //删除七牛云文件
    void deleteFile(String key);
}


