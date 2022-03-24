package com.king.mooc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

/**
 * @program: mooc
 * @description:
 * @author: King
 * @create: 2021-10-02 20:51
 */
@Mapper
public interface UserMapper extends BaseMapper<User> {

    @Select("select * from user where name = #{name} and flag = 0")
    User findOneByName(String name);

    @Select("select count(*) from user where name = #{name}  and flag = 0")
    Integer selectCountByName(String name);

    @Update("update user set phone = #{phone} where id = #{id}  and flag = 0 ")
    void updatePhone(Long id, Long phone);

    @Update("update user set email = #{email} where id = #{id}  and flag = 0 ")
    void updateEmail(Long id, String email);
}
