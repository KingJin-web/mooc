package com.king.mooc.service;


import com.king.mooc.bean.User;
import com.king.mooc.util.MyException;

public interface UserService {
    /**
     * 注册用户
     * @param name
     * @param pwd1
     * @param pwd2
     * @param email
     * @return
     * @throws MyException
     */
    boolean register(String name, String pwd1, String pwd2, String email) throws MyException;

    /**
     * 用户名是否被使用
     * @param name
     * @return 被使用返回 ture 没有使用返回 false
     */
    boolean nameIsUse(String name);
}

