package com.ssm.dao;

import com.ssm.bean.Orderlist;

import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-12-04
 */
public interface OrderMapper {
    public int addNewOrder(Orderlist order);

    public long getOrderId(String orderCreateTime);

    public List<Orderlist> getOrderByUserId(long userId);

    public int deleteOrder(long orderId);

    public List<Orderlist> adminOrder();
}
