package com.ssm.controller;

import com.alibaba.fastjson.JSONObject;
import com.fasterxml.jackson.databind.util.JSONPObject;
import com.google.gson.JsonObject;
import com.ssm.bean.Orderdetail;
import com.ssm.bean.Orderlist;
import com.ssm.service.OrderService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import java.util.List;

/**
 *description:
 *author:张腾
 *date:2020-12-04
 */

@Controller
public class OrderController {

    @Resource
    OrderService orderService;

    @RequestMapping(value = "/order/add" ,method = RequestMethod.GET)
    public ModelAndView addNewOrder(Orderlist order,String showName,int showId,int showNum,String showPic){
        ModelAndView mv = new ModelAndView();
        String result = orderService.addNewOrder(order,showName,showId,showNum,showPic);

        if(result.equals("购买成功！")){
            mv.setViewName("ok");
        }else{
            mv.addObject("mes",result);
            mv.setViewName("order");
        }
        return mv;
    }

    @RequestMapping(value = "/order/addsome" ,method = RequestMethod.GET)
    public ModelAndView addsomeNewOrder(Orderlist orderlist,String show){
        ModelAndView mv = new ModelAndView();
        String result = orderService.addsomeNewOrder(orderlist,show);
        if(result.equals("购买成功！")){
            mv.setViewName("ok");
        }else{
            mv.addObject("mes",result);
            mv.setViewName("order");
        }
        return mv;
    }

    @RequestMapping(value = "/order/show" , method = RequestMethod.POST)
    @ResponseBody
    public List<Orderlist> showOrder(long userId){
        List<Orderlist> orderlist = orderService.getOrder(userId);
        return orderlist;
    }


    @RequestMapping(value = "/order/showdetail" , method = RequestMethod.POST)
    @ResponseBody
    public List<Orderdetail> showOrderDetail(long orderId){
        List<Orderdetail> orderlist = orderService.getOrderDetail(orderId);
        return orderlist;
    }

    @RequestMapping(value = "/order/adminShow" , method = RequestMethod.POST)
    @ResponseBody
    public List<Orderlist> adminShowOrder(){
        List<Orderlist> orderlists = orderService.getOrderAndDetail();
        return orderlists;
    }

    @RequestMapping(value = "/order/delete" ,method = RequestMethod.GET)
    public ModelAndView deleteOrder(long orderId){
        ModelAndView mv = new ModelAndView();
        String re = orderService.deleteOrder(orderId);
        mv.addObject("msg",re);
        mv.setViewName("/admin/orderDesign");
        return mv;
    }

    @RequestMapping(value = "/order/deleteSome" ,method = RequestMethod.GET)
    public ModelAndView deleteSomeShow(String showIds){
        ModelAndView mv = new ModelAndView();
        String result = orderService.deleteBatchShow(showIds);
        mv.addObject("msg",result);
        mv.setViewName("redirect:/admin/orderDesign.jsp");
        return mv;
    }
}
