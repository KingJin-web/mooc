package com.king.mooc.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.entity.Course;
import com.king.mooc.entity.enums.Category;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @program: com.king.mooc.mapper
 * @description:
 * @author: King
 * @create: 2021/10/12 9:34
 */
@Mapper
public interface CourseMapper extends BaseMapper<Course> {


    /**
     * 通过id修改课程价格
     * @param id id
     * @param price 原价
     * @param vipPrice 会员价
     * @param activityPrice 活动价
     * @return 修改的条数
     */
    @Update("UPDATE course SET price = #{price},vip_price = #{vipPrice},activity_price = #{activityPrice} WHERE flag = 0 AND (id = #{id} )")
    int updatePrice(long id, double price, double vipPrice, double activityPrice);

    @Update("UPDATE course SET price = #{price},vip_price = #{vipPrice},activity_price = #{activityPrice} WHERE flag = 0 AND id = #{id}  and uid = #{uid} ")
    int updatePrice1(long id, long uid, double price, double vipPrice, double activityPrice);


    @Select("SELECT * FROM course WHERE flag = 0 AND id = #{id}")
    Course selectById(long id);

    @Select("SELECT * FROM course where  category = #{category} and flag = 0 ORDER BY RAND() LIMIT 8")
    List<Course> queryRecommend(Category category);

    @Select("SELECT * FROM course where category = #{category} and flag = 0 ORDER BY  create_time DESC LIMIT 8;")
    List<Course> queryNew(Category category);

    //通过用户id查询购买的课程
    @Select("select * from course where flag = 0 and id in ( select cid from orders where uid = #{uid} and state = 2 )")
    List<Course> queryByUid(long uid);

    //通过订单中的uid 查询该用户购买了的课程
    @Select("select ( @i := @i + 1 ) AS id,c.id as uid, c.name,o.create_time from course c , orders o , ( SELECT @i := 0 ) AS k  where  o.cid = c.id and o.uid = #{uid} and state = 2")
    List<Course> queryByUid1(long uid);
}
