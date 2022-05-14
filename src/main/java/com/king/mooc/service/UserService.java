package com.king.mooc.service;


import com.king.mooc.entity.User;
import com.king.mooc.entity.enums.Role;
import com.king.mooc.util.MyException;
import com.king.mooc.vo.ResultObj;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface UserService extends UserDetailsService {
    /**
     * 注册用户
     *
     * @param name
     * @param password
     * @param email
     * @return
     * @throws MyException
     */
    boolean registerByEmail(String name, String password, String email) throws MyException;

    boolean registerByPhone(String name, String password, String email) throws MyException;

    /**
     * 用户名是否被使用
     *
     * @param name
     * @return 被使用返回 ture 没有使用返回 false
     */
    boolean nameIsUse(String name) throws MyException;

    boolean isUserName(String name);

    int registerByEncode(String name, String pwd, String phone, Role role);

    /**
     * 指定字段是否被使用
     *
     * @param key   字段名
     * @param value 值
     * @return 被使用返回 ture 没有使用返回 false
     */
    boolean isUse(String key, Object value);

    /**
     * 通过用户名登录
     *
     * @param name
     * @param password
     * @return
     */
    User loginByName(String name, String password);

    /**
     * 通过邮箱登录
     *
     * @param email
     * @param password
     * @return
     */
    User loginByEmail(String email, String password);

    /**
     * 通过id修改用户
     *
     * @param user
     * @return
     */
    int updateById(User user);

    /**
     * 通过id删除用户，逻辑删除
     *
     * @param user
     * @return
     */
    int deleteById(User user);

    User queryById(Long id);

    /**
     * 成为分享者
     *
     * @param user
     * @return
     */
    User ToBeShare(User user);

    List<User> getAll();

    User queryByName(String name);

    User getLoginUser();

    void setLoginUser(UserDetails userDetails);

    void updatePhone(User user, Long phone);

    void updateEmail(User user, String email);

    ResultObj updatePwd(User user, String oldPwd, String newPwd1, String newPwd2);
}

