package com.ssm.aop;

import com.ssm.bean.User;
import com.ssm.dao.UserMapper;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * description:
 * author:张腾
 * date:2020-11-25
 */
@Component
@Aspect
public class userCheck {
    @Autowired
    UserMapper userMapper;


}
