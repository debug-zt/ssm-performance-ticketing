package com.ssm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

/**
 * description:
 * author:张腾
 * date:2020-12-10
 */

@Controller
@ControllerAdvice
public class ExceptionController {
    @ExceptionHandler(value = {RuntimeException.class})
    public ModelAndView handleRuntimeException(Exception e){
        System.out.println("异常出现！"+e);
        ModelAndView mv = new ModelAndView("error");
        mv.addObject("exception",e);
        return mv;
    }
}
