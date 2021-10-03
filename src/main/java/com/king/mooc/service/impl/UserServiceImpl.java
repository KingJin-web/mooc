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
    public boolean register(String name, String pwd1, String pwd2, String email) throws MyException {

        User user = User.builder().name(name).password(pwd1).email(email).build();
        userMapper.insert(user);
        return true;
    }

    @Override
    public boolean nameIsUse(String name) {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("name",name);
        return userMapper.selectOne(qw) != null;
    }
}
