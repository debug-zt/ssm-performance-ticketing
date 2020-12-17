package com.ssm.bean;


import java.util.Date;

public class User {

  private long userId;
  private String userName;
  private String userPassword;
  private long userBalance;
  private String userHead;
  private String userAddress;
  private String userPhone;
  private String userSex;
  private String userBirthday;

  public long getUserId() {
    return userId;
  }

  public void setUserId(long userId) {
    this.userId = userId;
  }


  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }


  public String getUserPassword() {
    return userPassword;
  }

  public void setUserPassword(String userPassword) {
    this.userPassword = userPassword;
  }


  public long getUserBalance() {
    return userBalance;
  }

  public void setUserBalance(long userBalance) {
    this.userBalance = userBalance;
  }


  public String getUserHead() {
    return userHead;
  }

  public void setUserHead(String userHead) {
    this.userHead = userHead;
  }


  public String getUserAddress() {
    return userAddress;
  }

  public void setUserAddress(String userAddress) {
    this.userAddress = userAddress;
  }


  public String getUserPhone() {
    return userPhone;
  }

  public void setUserPhone(String userPhone) {
    this.userPhone = userPhone;
  }

  public String getUserSex() {
    return userSex;
  }

  public void setUserSex(String userSex) {
    this.userSex = userSex;
  }

  public String getUserBirthday() {
    return userBirthday;
  }

  public void setUserBirthday(String userBirthday) {
    this.userBirthday = userBirthday;
  }
}
