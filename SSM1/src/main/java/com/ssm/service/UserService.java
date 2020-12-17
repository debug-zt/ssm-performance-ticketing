package com.ssm.service;

import com.ssm.bean.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;

/**
 * description:
 * author:张腾
 * date:2020-11-19
 */
public interface UserService {

    public String userRegister(User user);
    public String userLoginByName(String username,String pwd);
    public String userLoginByPhone(String userPhone,String pwd);
    public String deleteCookie(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException;
    public String updateUser(User user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException;
    public String updatePwd(String opwd, String npwd, HttpServletRequest request, HttpServletResponse response) throws Exception;
    public void uploadHead(String fileName,String userId,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException;
}
