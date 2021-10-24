package com.king.mooc.util;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * @program: mooc
 * @description: 序列化帮助类
 * @author: King
 * @create: 2021-10-06 20:52
 */
public class SerializeUtil {

    public static <T> T objParse(Class<T> returnClass, Object value) {
        try {
            if (value.getClass().equals(returnClass)) {
                ObjectMapper objectMapper = new ObjectMapper();
                return objectMapper.convertValue(value, returnClass);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public static byte[] serialize(Object object) {
        ObjectOutputStream oos = null;
        ByteArrayOutputStream baos = null;
        try {
//序列化
            baos = new ByteArrayOutputStream();
            oos = new ObjectOutputStream(baos);
            oos.writeObject(object);
            byte[] bytes = baos.toByteArray();
            return bytes;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }

    }


    //反序列化
    public static <T> T Deserialize(byte[] bytes, Class<T> entity) {
        ByteArrayInputStream bais = null;
        try {
            bais = new ByteArrayInputStream(bytes);
            ObjectInputStream ois = new ObjectInputStream(bais);
            return objParse(entity, ois.readObject());
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }


}