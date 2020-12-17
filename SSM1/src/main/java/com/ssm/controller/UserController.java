package com.ssm.controller;

import com.google.gson.Gson;

import com.ssm.bean.User;
import com.ssm.service.UserService;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * description:
 * author:张腾
 * date:2020-11-19
 */

@Controller
//@RequestMapping("/user")
public class UserController {

    @Resource
    UserService userService;

    @RequestMapping(value = "/user/register" , method = RequestMethod.POST)
    public ModelAndView userRegister(User user){
        ModelAndView mv = new ModelAndView();
        String data = userService.userRegister(user);
        mv.addObject("mes",data);
        if(data.equals("注册成功！")){
            mv.setViewName("login");
        }else{
            mv.setViewName("register");
        }
        return mv;
    }

    @RequestMapping(value = "/user/loginByname", method = RequestMethod.POST)
    public ModelAndView userLogin(String name, String pwd, HttpServletResponse response) throws UnsupportedEncodingException {

        String result = userService.userLoginByName(name,pwd);
        ModelAndView mv = new ModelAndView();
        Gson gson = new Gson();
        User user = gson.fromJson(result,User.class);
        if(user.getUserName().equals("密码错误！") || user.getUserName().equals("该用户不存在！")){
            mv.addObject("error",user.getUserName());
            mv.setViewName("login");
        }else{
            String value = URLEncoder.encode(result, "UTF-8");
            Cookie cookie = new Cookie("user",value);
            cookie.setMaxAge(60*60);
            cookie.setPath("/");
            response.addCookie(cookie);
            mv.setViewName("redirect:/userhost.jsp");
        }
        return mv;
    }

    @RequestMapping(value = "/user/updateUser" , method = RequestMethod.POST)
    public ModelAndView updateUser(User user, HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();
        String result = userService.updateUser(user,request,response);

        mv.addObject("mes",result);
        mv.setViewName("userdata");

        return mv;
     }

     @RequestMapping(value = "/user/exit")
     public ModelAndView exitLogin(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException {
        ModelAndView mv = new ModelAndView();
        String mes = userService.deleteCookie(request,response);
        mv.addObject("exit",mes);
        mv.setViewName("redirect:/userhost.jsp");
        return mv;
     }

     @RequestMapping(value = "/user/updatepwd" , method = RequestMethod.POST)
     public ModelAndView updatePwd(String userPassword,String opwd,HttpServletRequest request,HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView();
        String result = userService.updatePwd(opwd,userPassword,request,response);

            mv.addObject("mes",result);
            mv.setViewName("remima");
        return mv;
     }
}
