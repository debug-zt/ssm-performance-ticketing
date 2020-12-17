package com.ssm.service;

import com.ssm.bean.Cart;

import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-11-24
 */
public interface CartService {
    public List<Cart> showCartAll(long cId);

    public String deleteCartShow(Cart cart);

    public String addToCart(Cart cart);
}
