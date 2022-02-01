package com.king.mooc.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.entity.CourseVideo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface CourseVideoMapper extends BaseMapper<CourseVideo> {
    //播放量加一
    @Update("UPDATE coursevideo SET play_amount =play_amount+1 where id = #{id}")
    int addPlayAmount(Long id);
}
