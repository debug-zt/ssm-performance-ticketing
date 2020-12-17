package com.ssm.service.impl;

import com.google.gson.Gson;
import com.ssm.bean.Manager;
import com.ssm.bean.User;
import com.ssm.dao.ManagerMapper;
import com.ssm.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

/**
 * description
 * author:zxc
 * date: 2020/12/8
 */
@Service
public class ManagerServiceImpl implements ManagerService {
    @Autowired
    ManagerMapper managerMapper;

    public String updateManagerPassword(long opwd, long npwd, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        String result = "";
        Gson gson = new Gson();
        Cookie[] cookies = request.getCookies();
        Manager manager = null;
        if(cookies != null){
            for(int i=0;i<cookies.length;i++){
                if(cookies[i].getName().equals("manager")){
                    String value = URLDecoder.decode(cookies[i].getValue(),"utf-8");
                    manager = gson.fromJson(value,Manager.class);
                    break;
                }
            }

            if(manager.getPassword() != opwd){
                result = "原密码不正确！";
            }else{
                manager.setPassword(npwd);
                int data = managerMapper.updateManager(manager);
                if(data==1){
                    result = "修改成功！";
                    String temp = URLEncoder.encode(gson.toJson(manager), "utf-8");
                    for (int i = 0; i < cookies.length; i++) {
                        if ("manager".equals(cookies[i].getName())) {
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

    public String managerLogin(String managerName, long password){
        String result = "";
        Manager manager = managerMapper.findManager(managerName);
        if(manager != null){
            if(manager.getPassword() != password){
                manager.setManagerName("密码错误！");
            }
        }else{
            manager = new Manager();
            manager.setManagerName("该用户不存在！");
        }
        Gson gson = new Gson();
        result = gson.toJson(manager);
        return result;
    }

    public String deleteCookie(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        Cookie[] cookies = request.getCookies();
        String result = "";
        if(cookies != null){
            for(int i = 0; i < cookies.length; i ++){
                if(cookies[i].getName().equals("manager") ){
                    cookies[i].setMaxAge(0);
                    cookies[i].setPath("/");
                    response.addCookie(cookies[i]);
                    result = "退出登录成功！";
                }
            }
        }
        else{
            result = "退出失败！";
        }
        return result;
    }


}
