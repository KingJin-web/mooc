package com.king.mooc.mapper;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.king.mooc.entity.CourseVideo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface CourseVideoMapper extends BaseMapper<CourseVideo> {

    @Update("UPDATE course_video SET play_amount =play_amount+1 where id = #{id}")
    int addPlayAmount(Long id);

    @Insert("<script>" +
            "INSERT INTO course_video(id,cid,name,path,video_number,play_amount,is_video," +
            "img_path)VALUES" +
            "<foreach collection='courseVideos' item='courseVideo'   separator=','> " +
            "(#{courseVideo.id},#{courseVideo.cid},#{courseVideo.name},#{courseVideo.path}," +
            "#{courseVideo.videoNumber},#{courseVideo.playAmount},#{courseVideo.isVideo}," +
            "#{courseVideo.imgPath}" +
            "</foreach> " +
            "</script>")
    int insertBatch(@Param("courseVideos") List<CourseVideo> courseVideos);
}
