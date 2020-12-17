package com.ssm.bean;


public class Manager {

  private String managerName;
  private long password;


  public String getManagerName() {
    return managerName;
  }
  public void setManagerName(String managerName) {
    this.managerName = managerName;
  }


  public long getPassword() {
    return password;
  }
  public void setPassword(long password) {
    this.password = password;
  }

  public Manager(){
    super();
  }
  public Manager(String managerName, long password){
    this.managerName = managerName;
    this.password = password;
  }

  @Override
  public String toString() {
    return "Manager{" +
            "managerName='" + managerName + '\'' +
            ", password=" + password +
            '}';
  }
}
