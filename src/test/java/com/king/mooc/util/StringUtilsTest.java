package com.king.mooc.util;


import org.junit.Test;

import static org.junit.jupiter.api.Assertions.*;

public class StringUtilsTest {

    @Test
    public void nameIsOk() throws MyException {
        try {
            StringUtils.nameIsOk("你好");
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}