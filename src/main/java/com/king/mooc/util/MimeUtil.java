package com.king.mooc.util;


import org.springframework.http.MediaType;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
/**
 * @author: King
 * @project: mooc
 * @date: 2022年06月28日 14:37
 * @description:
 */



/**
 * @author king
 * date 2019-07-11.
 */
public class MimeUtil {

    private static final Properties mimes = new Properties();

    static {
        System.out.println(MimeUtil.class.getClassLoader().toString());
        try (InputStream in = MimeUtil.class.getClassLoader().getResourceAsStream("mime.properties")) {
            mimes.load(in);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getMimeType(String fileName) {
        String[] nameSplits = fileName.split("\\.");
        String type = mimes.getProperty(nameSplits[nameSplits.length - 1]);
        if (StringUtils.isBlank(type)) {
            type = MediaType.APPLICATION_OCTET_STREAM_VALUE;
        }
        return type;
    }

}
