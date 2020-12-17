package com.ssm.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.ssm.bean.AllShow;
import com.ssm.bean.Cart;
import com.ssm.bean.Orderdetail;
import com.ssm.bean.Orderlist;
import com.ssm.dao.CartMapper;
import com.ssm.dao.OrderDetailMapper;
import com.ssm.dao.OrderMapper;
import com.ssm.dao.ShowMapper;
import com.ssm.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-12-04
 */

@Service
@Transactional(propagation = Propagation.REQUIRED,isolation = Isolation.DEFAULT,timeout = -1,readOnly = false,rollbackFor ={Exception.class})
public class OrderServiceImpl implements OrderService {
    @Autowired
    OrderMapper orderMapper;
    @Autowired
    OrderDetailMapper orderDetailMapper;
    @Autowired
    ShowMapper showMapper;
    @Autowired
    CartMapper cartMapper;

    @Override
    public String addNewOrder(Orderlist order, String showName,int showId, int showNum,String showPic) {
        String result = "";
        int i = orderMapper.addNewOrder(order);
        if(i==1){
            result = "购买成功！";
        }else{
            result = "购买失败！请重试";
            throw new RuntimeException();
        }

        long orderId = orderMapper.getOrderId(order.getOrderCreateTime());
        Orderdetail orderdetail = new Orderdetail();
        orderdetail.setOrderId(orderId);
        orderdetail.setShowId(showId);
        orderdetail.setShowNum(showNum);
        orderdetail.setShowName(showName);
        orderdetail.setShowPic(showPic);
        orderdetail.setShowPrice(order.getCost()/orderdetail.getShowNum());
        orderDetailMapper.addNewOrder(orderdetail);

        AllShow show = showMapper.getShowById(showId);
        show.setRemainTicket(show.getRemainTicket()-showNum);
        showMapper.updateShow(show);


        return result;
    }

    @Override
    public String addsomeNewOrder(Orderlist orderlist, String show) {

        String result = "";
        int i = orderMapper.addNewOrder(orderlist);
        if(i==1){
            result = "购买成功！";
        }else{
            result = "购买失败！请重试";
            throw new RuntimeException();
        }

        long orderId = orderMapper.getOrderId(orderlist.getOrderCreateTime());
        List<Orderdetail> orderdetails = JSONObject.parseArray(show,Orderdetail.class);
        for(Orderdetail orderdetail : orderdetails){
            orderdetail.setOrderId(orderId);
            orderDetailMapper.addNewOrder(orderdetail);

            AllShow show1 = showMapper.getShowById((int)orderdetail.getShowId());
            show1.setRemainTicket((int) (show1.getRemainTicket()-orderdetail.getShowNum()));
            showMapper.updateShow(show1);

            long cId = orderlist.getUserId();
            Cart cart = new Cart();
            cart.setCId(cId);
            cart.setShowId(orderdetail.getShowId());
            cartMapper.deleteShow(cart);
        }

        return result;
    }

    public String deleteOrder(long orderId){
        String result = "";
        int i = orderMapper.deleteOrder(orderId);
        if(i!=0){
            result="删除成功！";
        }else{
            result="删除失败！请重试";
        }
        orderDetailMapper.deleteByOrderId(orderId);

        return result;
    }

    @Override
    public String deleteBatchShow(String showIds) {
        String result = "";
        int i =0;
        List<Long> ids = JSONObject.parseArray(showIds,Long.class);
        for(long orderId:ids){
            i += orderMapper.deleteOrder(orderId);
        }
        if(i==ids.size()){
            result="删除成功！";
        }else{
            result="删除失败！请重试";
        }
        return result;
    }


    @Override
    public List<Orderlist> getOrder(long userId) {
        List<Orderlist> orderlist = orderMapper.getOrderByUserId(userId);
        return orderlist;
    }

    @Override
    public List<Orderlist> getOrderAndDetail() {
        List<Orderlist> orderlists = orderMapper.adminOrder();
        return orderlists;
    }

    @Override
    public List<Orderdetail> getOrderDetail(long orderId) {
        List<Orderdetail> orderdetails = orderDetailMapper.getOrderDetail(orderId);
        return orderdetails;
    }
}
