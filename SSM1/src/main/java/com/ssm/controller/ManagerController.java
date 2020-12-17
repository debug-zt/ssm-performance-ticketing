package com.ssm.controller;

import com.google.gson.Gson;
import com.ssm.bean.Manager;
import com.ssm.service.ManagerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * description
 * author:zxc
 * date: 2020/12/8
 */

@Controller
public class ManagerController {
    @Resource
    ManagerService managerService;

    @RequestMapping(value = "/manager/login", method = RequestMethod.POST)
    public ModelAndView managerLogin(String name, long pwd, HttpServletResponse response) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();
        String result = managerService.managerLogin(name, pwd);
        Gson gson = new Gson();
        Manager manager = gson.fromJson(result, Manager.class);
        if (manager.getManagerName().equals("密码错误！") || manager.getManagerName().equals("该用户不存在！")){
            mv.addObject("error", manager.getManagerName());
            mv.setViewName("login");
        }else{
            String value = URLEncoder.encode(result, "UTF-8");
            Cookie cookie = new Cookie("manager",value);
            cookie.setMaxAge(60*60);
            cookie.setPath("/");
            response.addCookie(cookie);
            mv.setViewName("admin/design");
        }
        return mv;
    }


    @RequestMapping(value = "/manager/updatepwd" , method = RequestMethod.POST)
    public ModelAndView updatePwd(long managerPassword,long opwd,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        String result = managerService.updateManagerPassword(opwd,managerPassword,request,response);
        mv.addObject("mes",result);
        mv.setViewName("admin/rePassword");
        return mv;
    }



    @RequestMapping(value = "/manager/exit")
    public ModelAndView exitLogin(HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();
        String mes = managerService.deleteCookie(request,response);
        mv.addObject("exit",mes);
        mv.setViewName("index");
        return mv;
    }



}
