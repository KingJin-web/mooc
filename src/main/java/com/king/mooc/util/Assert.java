package com.king.mooc.util;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-01-27 00:31
 */
public class Assert extends org.springframework.util.Assert{

    public Assert() {

        super();
        System.out.println("aaa");
    }

    public static void main(String[] args) {
        Assert. isNull("aa","aaa");
        Assert.isNull("","aaa");
    }
}
