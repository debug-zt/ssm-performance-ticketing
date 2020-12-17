package com.ssm.controller;

import com.google.gson.Gson;
import com.ssm.bean.AllShow;
import com.ssm.bean.Cart;
import com.ssm.service.CartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-11-25
 */

@Controller
public class CartController {
    @Resource
    CartService cartService;

    @RequestMapping(value = "/cart/show" )
    @ResponseBody
    public List<Cart> showCartAll(long cId) {

        List<Cart> carts = cartService.showCartAll(cId);
        return carts;
    }

    @RequestMapping(value = "/cart/deleteShow" )
    public ModelAndView deleteShow(Cart cart){
        ModelAndView mv = new ModelAndView();
        String result =cartService.deleteCartShow(cart);
        mv.addObject("mes",result);
        mv.setViewName("cart");
        return  mv;
    }

    @RequestMapping(value = "/cart/addToCart", method = RequestMethod.POST, produces = {"application/String;charset=UTF-8"})
    @ResponseBody
    public String addToCart(Cart cart){

        String result = cartService.addToCart(cart);
//        mv.addObject("mes",result);
//        mv.setViewName("showDetail");
        return result;
    }


}
