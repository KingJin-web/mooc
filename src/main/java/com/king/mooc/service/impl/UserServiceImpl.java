package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.king.mooc.entity.User;
import com.king.mooc.mapper.UserMapper;
import com.king.mooc.service.UserService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    @Override
    public boolean register(String name, String password, String email) {
        User user = User.builder().name(name).password(password).email(email).balance(new BigDecimal(0)).build();
        userMapper.insert(user);
        return true;
    }

    @Override
    public boolean nameIsUse(String name) throws MyException {
        QueryWrapper<User> qw = new QueryWrapper<>();
        qw.eq("name", name);
        if (!StringUtils.checkNull(userMapper.selectOne(qw))) {
            throw new MyException("用户名已经被使用");
        }
        return true;
    }

    @Override
    public boolean isUse(String key, Object value) {
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

    @Override
    public int updateById(User user) {
        return userMapper.updateById(user);
    }

    @Override
    public int deleteById(User user) {
        return 0;
    }

    @Override
    public User queryById(Long id) {
        return userMapper.selectById(id);
    }

    @Override
    public User ToBeShare(User user) {
        return null;
    }

    @Override
    public List<User> getAll() {
        return userMapper.selectList(null);
    }

}
