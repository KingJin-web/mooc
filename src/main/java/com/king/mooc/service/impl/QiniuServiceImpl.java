package com.king.mooc.service.impl;

import com.alibaba.fastjson.JSON;
import com.google.gson.Gson;
import com.king.mooc.service.QiniuService;
import com.king.mooc.util.MimeUtil;
import com.king.mooc.util.StringUtils;

import com.qiniu.common.QiniuException;
import com.qiniu.http.Response;
import com.qiniu.storage.BucketManager;
import com.qiniu.storage.Configuration;
import com.qiniu.storage.Region;
import com.qiniu.storage.UploadManager;
import com.qiniu.storage.model.BatchStatus;
import com.qiniu.storage.model.DefaultPutRet;
import com.qiniu.util.Auth;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.time.LocalDate;
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

    @Value(value = "${qiniu.domain_name}")
    private String domainName;

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
            return domainName + putRet.key;
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

    public String upLoad(InputStream inputStream, String path) {
        //根据存储地区创建上传对象
        UploadManager uploadManager = new UploadManager(new Configuration(Region.huanan()));
        String uploadToken = Auth.create(accessKey, secretKey).uploadToken(bucket);
        /*
         *	如果上传地址为 /2020-10-10/erupt.png
         *	在七牛云需通过 http://oos.erupt.xyz//2020-10-10/erupt.png才能访问
         *	访问地址带双斜杠，影响美观，所以做一下处理
         */
        path = path.startsWith("/") ? path.substring(1) : path;
        path = "course/" + LocalDate.now().toString() + "/" + path;
        try {
            Response response = uploadManager.put(inputStream, path, uploadToken,
                    null, MimeUtil.getMimeType(path));
            if (!response.isOK()) {
                logger.error("上传七牛云存储空间失败");
            }
            return "http://oss1.wuzhaoqi.top/" + path;
        } catch (QiniuException ex) {
            logger.error(ex.response.toString());
        }
        return null;
    }

    @Override
    public String uploadUserAvatar(InputStream inputStream, String path) {
        return null;
    }

    @Override
    public void deleteFile(String key) {
        //构造一个带指定 Region 对象的配置类
        Configuration cfg = new Configuration(Region.huanan());
//...其他参数参考类注释

//        String accessKey = "your access key";
//        String secretKey = "your secret key";
//
//        String bucket = "your bucket name";
        // String key = "your file key";

        Auth auth = Auth.create(accessKey, secretKey);
        BucketManager bucketManager = new BucketManager(auth, cfg);
        try {
            bucketManager.delete(bucket, key);
        } catch (QiniuException ex) {
            //如果遇到异常，说明删除失败
            logger.error(String.valueOf(ex.code()));
            logger.error(ex.response.toString());
        }


    }
}