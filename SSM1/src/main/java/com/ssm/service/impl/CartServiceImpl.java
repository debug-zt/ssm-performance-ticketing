package com.ssm.service.impl;

import com.ssm.bean.AllShow;
import com.ssm.bean.Cart;
import com.ssm.dao.CartMapper;
import com.ssm.dao.ShowMapper;
import com.ssm.service.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-11-24
 */
@Service
public class CartServiceImpl implements CartService {

    @Autowired
    private CartMapper cartMapper;

    @Override
    public List<Cart> showCartAll(long cId) {
        List<Cart> carts = cartMapper.showCartAll(cId);
        return carts;
    }

    @Override
    public String deleteCartShow(Cart cart) {
        String result = "";
        int i = cartMapper.deleteShow(cart);
        if(i==1){
            result = "删除成功！";
        }else{
            result = "删除失败！请重试";
        }
        return result;
    }

    @Override
    public String addToCart(Cart cart) {
        String result = "";
        long showId = cart.getShowId();
        long cId = cart.getCId();
        Cart cart1 = cartMapper.showCart(cId,showId);
        if(cart1!=null){
            result = "该演出已加入您的购物车！";
            return result;
        }
        int i = cartMapper.addCart(cart);
        if(i==1){
            result = "加入购物车成功！";
        }else {
            result = "加入购物车失败！请重试";
        }
        return result;
    }


}
