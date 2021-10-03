package com.king.mooc.util;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-02 19:59
 */
public class StringUtils {
    private StringUtils() {
    }

    /**
     * 判断传值是否为空 或空字符串
     *
     * @param value 传的值
     * @param msg   返回的提示信息
     * @throws MyException 自定义错误
     */
    public static void checkNull(Object value, String msg) throws MyException {
        if (value == null) {
            throw new MyException(msg);
        }
        if (value instanceof String) {
            String s = (String) value;
            if (s.trim().isEmpty()) {
                throw new MyException(msg);
            }
        }
    }

    public static boolean checkNull(Object value) {
        if (value == null) {
            return false;
        }
        if (value instanceof String) {
            return !((String) value).trim().isEmpty();
        }
        return true;
    }

    public static void nameCheckNull(String s) throws MyException {
        checkNull(s, "请输入用户名！");
    }

    public static void pwdCheckNull(String s) throws MyException {
        checkNull(s, "请输入密码！");
    }
    public static void pwdCheckNull(String s1,String s2) throws MyException {
        checkNull(s1, "请输入密码！");
        checkNull(s2, "请输入密码！");
        if (!s1.equals(s2)){
            throw new MyException("两次输入不同请重新输入");
        }
    }
    public static void isEmail(String email, String msg) throws MyException {
        if (!isEmail(email))
            throw new MyException(msg);

    }

    public static void isPhone(String phone) throws MyException {
        if (!isPhoneLegal(phone))
            throw new MyException("请输入合法的手机号码");

    }

    public static void isPhone(Long phone) throws MyException {
        if (!isPhoneLegal(String.valueOf(phone))) {
            throw new MyException("请输入合法的手机号码");
        }
    }

    static void isQq(String qq) throws MyException {
        checkNull(qq, "请输入qq");
        if (!isNumeric(qq)) {
            throw new MyException("请输入合法的qq号码");
        }
    }

    /**
     * 判断是否是qq号的方法
     */
    public static boolean isNumeric(String string) {
        if (string.length() >= 5 && string.length() <= 12) {
            Pattern pattern = Pattern.compile("[0-9]+");
            return pattern.matcher(string).matches();
        } else {
            return false;
        }

    }

    /**
     * 判断Email合法性
     *
     * @param email 邮箱
     * @return 是便ture不是便false
     */
    public static boolean isEmail(String email) throws MyException {
        checkNull(email, "请输入邮箱");
        String rule = "[\\w!#$%&'*+/=?^_`{|}~-]+(?:\\.[\\w!#$%&'*+/=?^_`{|}~-]+)*@(?:[\\w](?:[\\w-]*[\\w])?\\.)+[\\w](?:[\\w-]*[\\w])?";
        Pattern pattern;
        Matcher matcher;
        pattern = Pattern.compile(rule);
        matcher = pattern.matcher(email);
        return matcher.matches();
    }


    /**
     * 大陆号码或香港号码均可
     */
    public static boolean isPhoneLegal(String str) throws MyException {
        checkNull(str, "请输入手机号码");
        return isChinaPhoneLegal(str) || isHKPhoneLegal(str);
    }

    /**
     * 大陆手机号码11位数，匹配格式：前三位固定格式+后8位任意数
     * 此方法中前三位格式有：
     * 13+任意数
     * 145,147,149
     * 15+除4的任意数(不要写^4，这样的话字母也会被认为是正确的)
     * 166
     * 17+3,5,6,7,8
     * 18+任意数
     * 198,199
     */
    public static boolean isChinaPhoneLegal(String str) {
        // ^ 匹配输入字符串开始的位置
        // \d 匹配一个或多个数字，其中 \ 要转义，所以是 \\d
        // $ 匹配输入字符串结尾的位置
        String regExp = "^((13[0-9])|(14[5,7,9])|(15[0-3,5-9])|(166)|(17[3,5,6,7,8])" +
                "|(18[0-9])|(19[8,9]))\\d{8}$";
        Pattern p = Pattern.compile(regExp);
        Matcher m = p.matcher(str);
        return m.matches();
    }

    /**
     * 香港手机号码8位数，5|6|8|9开头+7位任意数
     */
    public static boolean isHKPhoneLegal(String str) {
        // ^ 匹配输入字符串开始的位置
        // \d 匹配一个或多个数字，其中 \ 要转义，所以是 \\d
        // $ 匹配输入字符串结尾的位置
        String regExp = "^(5|6|8|9)\\d{7}$";
        Pattern p = Pattern.compile(regExp);
        Matcher m = p.matcher(str);
        return m.matches();
    }

    /**
     * 判断是否为合法电话号码
     *
     * @param phone
     * @return
     */
    public static boolean isPhoneLegal(Long phone) {

        if (checkNull(phone)) {
            return false;
        }
        String str = String.valueOf(phone);
        return isChinaPhoneLegal(str) || isHKPhoneLegal(str);
    }
}
