package com.sample;


public class CourseVideo {

  private long id;
  private long cid;
  private String name;
  private long isVideo;
  private String path;
  private java.sql.Timestamp createTime;
  private String imgPath;
  private String num;


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public long getCid() {
    return cid;
  }

  public void setCid(long cid) {
    this.cid = cid;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getIsVideo() {
    return isVideo;
  }

  public void setIsVideo(long isVideo) {
    this.isVideo = isVideo;
  }


  public String getPath() {
    return path;
  }

  public void setPath(String path) {
    this.path = path;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public String getImgPath() {
    return imgPath;
  }

  public void setImgPath(String imgPath) {
    this.imgPath = imgPath;
  }


  public String getNum() {
    return num;
  }

  public void setNum(String num) {
    this.num = num;
  }

}
