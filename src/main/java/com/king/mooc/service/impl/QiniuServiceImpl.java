package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.king.mooc.service.QiniuService;
import com.king.mooc.util.StringUtils;
import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;
import com.qiniu.util.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

/**
 * @author: 12613
 * @project: mooc
 * @pcakage: com.king.mooc.service.impl.QiniuServiceImpl
 * @date: 2022年05月02日 00:38
 * @description: ${}
 */
@Service
public class QiniuServiceImpl implements QiniuService {
    @Value(value = "${qiniu.accessKey}")
    private String accessKey;
    @Value(value = "${qiniu.secretKey}")
    private String secretKey;
    @Value(value = "${qiniu.bucket}")
    private String bucket;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());


    @Override
    public String uploadFile(byte[] file, String fileName) {
        Configuration cfg = new Configuration(Region.huanan());
        UploadManager uploadManager = new UploadManager(cfg);
        if (StringUtils.isEmpty(fileName)) {
            fileName = UUID.randomUUID() + ".jpg";
        }
        String key = fileName;
        Auth auth = Auth.create(accessKey, secretKey);
        String upToken = auth.uploadToken(bucket);
        try {
            Response response = uploadManager.put(file, key, upToken);
            DefaultPutRet putRet = JSON.parseObject(response.bodyString(), DefaultPutRet.class);
            return "http://oss1.wuzhaoqi.top/" + putRet.key;
        } catch (QiniuException e) {
            logger.error("上传文件失败", e);
            logger.error(JSON.toJSONString(e.response));
            return null;
        }
    }

    @Override
    public String uploadFile(MultipartFile uploadFile, String fileName) {
        try {
            return uploadFile(uploadFile.getBytes(), fileName);
        } catch (IOException e) {
            logger.error("上传文件失败", e);
            return null;
        }
    }

    @Override
    public String uploadFile(byte[] file) {
        return null;
    }

    @Override
    public List<String> uploadFiles(MultipartFile uploadFile[]) {
        return null;
    }

    @Override
    public byte[] downloadFile(String fileName) {
        return new byte[0];
    }

    @Override
    public void deleteFile(String key) {

    }
}