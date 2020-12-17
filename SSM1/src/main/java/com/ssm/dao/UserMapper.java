package com.ssm.dao;

import com.ssm.bean.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;


public interface UserMapper {
    public int updateUserData(User user);
    public int userBuy(User user);
    public User findUserById(long id);
    public User findUserByName(User user);
    public User findUserByPhone(User user);
    public int addUser(User user);
}
