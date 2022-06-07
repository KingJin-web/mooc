package com.king.mooc.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.conditions.update.UpdateWrapper;
import com.king.mooc.entity.User;
import com.king.mooc.entity.enums.Role;
import com.king.mooc.mapper.UserMapper;
import com.king.mooc.service.UserService;
import com.king.mooc.util.MyException;
import com.king.mooc.util.StringUtils;
import com.king.mooc.vo.ResultObj;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();

    @Override
    public boolean registerByEmail(String name, String password, String email) {

        password = encoder.encode(password);
        User user = User.builder().name(name).password(password).email(email).balance(new BigDecimal(0)).build();
        userMapper.insert(user);
        return true;
    }


    @Override
    public boolean registerByPhone(String name, String password, String phone) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        password = encoder.encode(password);
        User user = User.builder().name(name).password(password).phone(Long.parseLong(phone)).balance(new BigDecimal(0)).build();
        userMapper.insert(user);
        return true;
    }


    /**
     * 判断用户名是否被使用
     *
     * @param name
     * @return
     */
    public boolean isUserName(String name) {
        return userMapper.selectCountByName(name) >= 1;
    }

    /**
     * 注册 密码为加密后的
     *
     * @param name
     * @param pwd
     * @return
     */
    public int registerByEncode(String name, String pwd, String phone, Role role) {
        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        pwd = encoder.encode(pwd);
        return userMapper.insert(User.builder().name(name).phone(Long.parseLong(phone)).password(pwd).role(role).build());

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
    public User queryByName(String name) {
        return userMapper.findOneByName(name);
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

    @Override
    public UserDetails loadUserByUsername(String name) throws UsernameNotFoundException {
        User user = userMapper.findOneByName(name);
        if (user == null) {
            throw new UsernameNotFoundException("此用户不存在");
        }
        return user;
    }

    public User getLoginUser() {
        return (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    }


    @Override
    public void setLoginUser(UserDetails userDetails) {
        SecurityContextHolder.getContext().setAuthentication(
                new UsernamePasswordAuthenticationToken(userDetails, userDetails.getPassword(), userDetails.getAuthorities()));
    }

    @Override
    public void updatePhone(User user, Long phone) {
        userMapper.updatePhone(user.getId(), phone);
    }

    @Override
    public void updateEmail(User user, String email) {
        userMapper.updateEmail(user.getId(), email);
    }

    @Override
    public ResultObj updatePwd(User user, String oldPwd, String newPwd1, String newPwd2) {
        try {
            if (StringUtils.checkNull(oldPwd) || StringUtils.checkNull(newPwd1) || StringUtils.checkNull(newPwd2)) {
                return ResultObj.error("密码不能为空");
            }
            if (!encoder.matches(oldPwd, user.getPassword())) {
                return ResultObj.error("密码错误");
            }
            if (!newPwd1.equals(newPwd2)) {
                return ResultObj.error("两次密码不一致");
            }
            UpdateWrapper<User> uw = new UpdateWrapper<>();
            uw.eq("id", user.getId());
            user.setPassword(encoder.encode(newPwd1));
            userMapper.update(user, uw);
            //更新缓存
            setLoginUser(user);
            return ResultObj.success("修改成功");
        } catch (Exception e) {
            logger.error("修改密码失败", e);
            return ResultObj.error("修改失败");
        }
    }

    @Override
    public void updateUser(User user, String name, String msg) {

    }

}
