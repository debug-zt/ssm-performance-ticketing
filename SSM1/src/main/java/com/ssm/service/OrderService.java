package com.ssm.service;

import com.ssm.bean.Orderdetail;
import com.ssm.bean.Orderlist;

import java.util.List;

/**
 * description:
 * author:张腾
 * date:2020-12-04
 */
public interface OrderService {
    public String addNewOrder(Orderlist order,String showName,int showId,int showNum,String showPic);

    public String addsomeNewOrder(Orderlist orderlist,String show);

    public List<Orderlist> getOrder(long userId);

    public List<Orderlist> getOrderAndDetail();

    public List<Orderdetail> getOrderDetail(long orderId);

    public String deleteOrder(long orderId);

    public String deleteBatchShow(String orderIds);
}
