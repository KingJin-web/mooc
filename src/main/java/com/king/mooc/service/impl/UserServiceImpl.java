package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.king.mooc.bean.User;
import com.king.mooc.mapper.UserMapper;
import com.king.mooc.service.UserService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public boolean register(String name, String password, String email) {
        User user = User.builder().name(name).password(password).email(email).build();
        userMapper.insert(user);
        return true;
    }

    @Override
    public boolean nameIsUse(String name) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("name", name);
        return userMapper.selectOne(qw) != null;
    }

    @Override
    public boolean IsUse(String key, Object value) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq(key, value);
        return userMapper.selectOne(qw) != null;
    }

    @Override
    public User loginByName(String name, String password) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("name", name);
        qw.eq("password", password);
        return userMapper.selectOne(qw);
    }

    @Override
    public User loginByEmail(String email, String password) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("email", email);
        qw.eq("password", password);
        return userMapper.selectOne(qw);
    }
}
