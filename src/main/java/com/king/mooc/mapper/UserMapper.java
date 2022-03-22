package com.king.mooc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-02 20:51
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from user where name = #{name}")
    User findOneByName(String name);

    @Select("select count(*) from user where name = #{name}")
    Integer selectCountByName(String name);
}
