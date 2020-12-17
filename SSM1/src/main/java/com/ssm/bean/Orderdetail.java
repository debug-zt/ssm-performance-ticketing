package com.ssm.bean;


public class Orderdetail {

  private long orderId;
  private long showId;
  private String showName;
  private long showNum;
  private String showPic;
  private long showPrice;


  public long getOrderId() {
    return orderId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }


  public long getShowId() {
    return showId;
  }

  public void setShowId(long showId) {
    this.showId = showId;
  }


  public String getShowName() {
    return showName;
  }

  public void setShowName(String showName) {
    this.showName = showName;
  }


  public long getShowNum() {
    return showNum;
  }

  public void setShowNum(long showNum) {
    this.showNum = showNum;
  }


  public String getShowPic() {
    return showPic;
  }

  public void setShowPic(String showPic) {
    this.showPic = showPic;
  }


  public long getShowPrice() {
    return showPrice;
  }

  public void setShowPrice(long showPrice) {
    this.showPrice = showPrice;
  }

}
