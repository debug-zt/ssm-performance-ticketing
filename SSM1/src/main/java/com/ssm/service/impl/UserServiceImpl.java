package com.ssm.service.impl;

import com.google.gson.Gson;
import com.ssm.bean.User;
import com.ssm.dao.UserMapper;
import com.ssm.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * description:
 * author:张腾
 * date:2020-11-19
 */
@Service
public class UserServiceImpl implements UserService {
    @Autowired
    UserMapper userMapper;

    public String userRegister(User user){
        String result = "";
        User temp = userMapper.findUserByName(user);
        if(temp!=null){
            result =  "用户名已存在！请重试";
        }else {
            int data = userMapper.addUser(user);
            if (data == 0) {
                result = "注册失败！请重试";
            } else {
                result = "注册成功！";
            }
        }
        return result;
    }

    public String userLoginByName(String userName,String pwd){

        String result = "";
        User user = new User();
        user.setUserName(userName);
        User user1 = userMapper.findUserByName(user);
        if(user1 != null){
            if(user1.getUserPassword().equals(pwd)){
                Gson gson = new Gson();
                result = gson.toJson(user1);
            }
            else{
                user1.setUserName("密码错误！");
                Gson gson = new Gson();
                result = gson.toJson(user1);
            }

        }else{
            user1 = new User();
            user1.setUserName("该用户不存在！");
            Gson gson = new Gson();
            result = gson.toJson(user1);
        }

        return result;
    }

    public String userLoginByPhone(String userPhone,String pwd){

        String result = "";
        User user = new User();
        user.setUserPhone(userPhone);
        User user1 = this.userMapper.findUserByPhone(user);
        if(user1 != null){
            if(user1.getUserPassword().equals(pwd)){
                Gson gson = new Gson();
                result = gson.toJson(user1);
            }
            else{
                user1.setUserName("密码错误！");
                Gson gson = new Gson();
                result = gson.toJson(user1);
            }

        }else{
            user1 = new User();
            user1.setUserName("该用户不存在！");
            Gson gson = new Gson();
            result = gson.toJson(user1);
        }

        return result;
    }

    public String updateUser(User user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String result = "";
        User temp = userMapper.findUserByName(user);
        if(temp!=null){
            result =  "该用户名已存在！";
        }
        int data = userMapper.updateUserData(user);
        if (data == 0) {
            result = "修改失败，请重试！";
        } else {
            User userNew = userMapper.findUserById(user.getUserId());
            Gson gson = new Gson();
            result = URLEncoder.encode(gson.toJson(userNew), "utf-8");

            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (int i = 0; i < cookies.length; i++) {
                    if (cookies[i].getName().equals("user")) {
                        cookies[i].setValue(result);
                        cookies[i].setPath("/");
                        cookies[i].setMaxAge(60 * 60);
                        response.addCookie(cookies[i]);
                        break;
                    }
                }
            }
            result = "修改成功！";

        }
        return result;
    }

    public String updatePwd(String opwd, String npwd, HttpServletRequest request, HttpServletResponse response) throws Exception {
        String result = "";
        Gson gson = new Gson();
        Cookie[] cookies = request.getCookies();
        User user = null;
        if(cookies != null){
            for(int i=0;i<cookies.length;i++){
                if(cookies[i].getName().equals("user")){
                    String value = URLDecoder.decode(cookies[i].getValue(),"utf-8");
                    user = gson.fromJson(value,User.class);
                    break;
                } }

            if(!user.getUserPassword().equals(opwd)){
                result = "原密码不正确！";
            }else{
                user.setUserPassword(npwd);
                int data = userMapper.updateUserData(user);
                if(data==1){
                    result = "修改成功！";
                    String temp = URLEncoder.encode(gson.toJson(user), "utf-8");
                    for (int i = 0; i < cookies.length; i++) {
                        if ("user".equals(cookies[i].getName())) {
                            cookies[i].setValue(temp);
                            cookies[i].setPath("/");
                            cookies[i].setMaxAge(60*60);
                            response.addCookie(cookies[i]);
                            break;
                        }}
                }
            }
        }
        else{
            result = "请先登录！";
        }
        return result;
    }

    public String deleteCookie(HttpServletRequest request,HttpServletResponse response)  {
        Cookie[] cookies = request.getCookies();
        String result = "";
        Gson gson = new Gson();
        if(cookies != null){
            for(int i=0;i<cookies.length;i++){
                if(cookies[i].getName().equals("user")){
                    cookies[i].setMaxAge(0);
                    cookies[i].setPath("/");
                    response.addCookie(cookies[i]);
                    result = "退出登录成功！";
                } }}
        else{result = "退出失败！";}
        return result;
    }

    public void uploadHead(String fileName,String userId,HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        User user = userMapper.findUserById(Integer.valueOf(userId));
        user.setUserHead("img/"+fileName);
        userMapper.updateUserData(user);
        Gson gson = new Gson();
        String result = URLEncoder.encode(gson.toJson(user), "utf-8");

        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (int i = 0; i < cookies.length; i++) {
                if (cookies[i].getName().equals("user")) {
                    cookies[i].setValue(result);
                    cookies[i].setPath("/");
                    cookies[i].setMaxAge(60 * 60);
                    response.addCookie(cookies[i]);
                    break;
                }
            }
        }

    }
}
