package com.king.mooc.util;


import org.junit.Test;

public class StringUtilsTest {

    @Test
    public void nameIsOk() throws MyException {
        try {
            StringUtils.nameIsOk("你好");
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    @Test
    public void a(){
        System.out.println(StringUtils.checkNull(""));;
    }
}