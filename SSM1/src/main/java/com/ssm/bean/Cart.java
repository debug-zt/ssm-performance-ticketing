package com.ssm.bean;


public class Cart {

  private long cId;
  private long showId;
  private long showNum;
  private AllShow allshow;

  public long getCId() {
    return cId;
  }

  public void setCId(long cId) {
    this.cId = cId;
  }


  public long getShowId() {
    return showId;
  }

  public void setShowId(long showId) {
    this.showId = showId;
  }


  public long getShowNum() {
    return showNum;
  }

  public void setShowNum(long showNum) {
    this.showNum = showNum;
  }

  public AllShow getAllshow() {
    return allshow;
  }

  public void setAllshow(AllShow allshow) {
    this.allshow = allshow;
  }
}
