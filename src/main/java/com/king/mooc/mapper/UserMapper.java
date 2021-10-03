package com.king.mooc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.bean.User;
import org.apache.ibatis.annotations.Mapper;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-02 20:51
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

}
