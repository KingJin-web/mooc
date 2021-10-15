package com.king.mooc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.bean.Course;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

/**
 * @program: com.king.mooc.mapper
 * @description: 告诉大家我是干啥的
 * https://github.com/KingJin-web/leetcode.git
 * @author: King
 * @create: 2021/10/12 9:34
 */
@Mapper
public interface CourseMapper extends BaseMapper<Course> {

    @Update("UPDATE course SET price = #{price},vip_price = #{vipPrice},activity_price = #{activityPrice} WHERE flag = 0 AND (id = #{id} )")
    int updatePrice(long id, double price, double vipPrice, double activityPrice);

    @Update("UPDATE course SET price = #{price},vip_price = #{vipPrice},activity_price = #{activityPrice} WHERE flag = 0 AND id = #{id}  and uid = #{uid} ")
    int updatePrice(long id, long uid, double price, double vipPrice, double activityPrice);
}
