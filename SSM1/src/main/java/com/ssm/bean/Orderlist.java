package com.ssm.bean;


import java.util.List;

public class Orderlist {

  private long orderId;
  private long userId;
  private long cost;
  private String orderCreateTime;
  private String userName;
  private List<Orderdetail> orderdetails;

  public long getOrderId() {
    return orderId;
  }

  public void setOrderId(long orderId) {
    this.orderId = orderId;
  }


  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public long getCost() {
    return cost;
  }

  public void setCost(long cost) {
    this.cost = cost;
  }


  public String getOrderCreateTime() {
    return orderCreateTime;
  }

  public void setOrderCreateTime(String orderCreateTime) {
    this.orderCreateTime = orderCreateTime;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public List<Orderdetail> getOrderdetails() {
    return orderdetails;
  }

  public void setOrderdetails(List<Orderdetail> orderdetails) {
    this.orderdetails = orderdetails;
  }
}
