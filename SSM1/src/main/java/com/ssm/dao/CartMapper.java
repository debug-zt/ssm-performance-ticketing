package com.ssm.dao;

import com.ssm.bean.Cart;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * description:
 * author: 范玫玫 20181002970
 * date：2020/11/24
 */
public interface CartMapper {
    public int addCart(Cart cart);
    public int deleteCart(Cart cart);
    public int deleteShow(Cart cart);
    public List<Cart> showCartAll(long cId);
    public Cart showCart(@Param("cId") long cId, @Param("showId")long showId);
    public int updateShowNum(Cart cart);
}
