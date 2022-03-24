package com.king.mooc;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2022-03-24 15:08
 */
public class Test {
    public static boolean isLinux() {
        return System.getProperty("os.name").toLowerCase().contains("linux");
    }

    public static boolean isWindows() {
        return System.getProperty("os.name").toLowerCase().contains("windows");
    }

    public String JudgeSystem() {
        if (isLinux()) {
            return "linux";
        } else if (isWindows()) {
            return "windows";
        } else {
            return "other system";
        }
    }

    @org.junit.Test
    public void fun() {
        boolean flag1 = isLinux();
        System.out.println(flag1);
        boolean flag2 = isWindows();
        System.out.println(flag2);
        System.out.println(System.getProperty("os.name"));
        String sys = JudgeSystem();
        System.out.println(sys);
    }


}
