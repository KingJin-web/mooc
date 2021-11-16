package com.king.mooc.service;

import com.king.mooc.entity.CourseVideo;

import java.util.List;

public interface CourseVideoService {
    /**
     * 通过课程id 查询 列表 按课程视频编号升序排
     * @param cid
     * @return
     */
    public List<CourseVideo> queryByCid(Long cid);

    int addPlayAmount(Long id);
}
