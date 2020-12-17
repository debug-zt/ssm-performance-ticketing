package com.ssm.dao;

import com.ssm.bean.Orderdetail;

import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-12-04
 */
public interface OrderDetailMapper {
    public int addNewOrder(Orderdetail od);

    public List<Orderdetail> getOrderDetail(long orderId);

    public int deleteByOrderId(long orderId);
}
