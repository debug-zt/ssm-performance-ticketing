<%@ page import="com.ssm.bean.User" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String data = request.getParameter("data");
    String item = request.getParameter("item");
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/myorder.css"/>
    <script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/user.js" type="text/javascript" charset="utf-8"></script>
</head>
<%@include file="head.jsp"%>
<div class="address mt">
    <div class="wrapper clearfix"><a href="index.html" class="fl">首页</a><span>/</span><a href="myorderq.html"
                                                                                         class="on">我的订单</a><span>/</span><a
            href="#" class="on">订单详情</a></div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="left.jsp"%>
        <div class="you fl">
            <div class="my clearfix"><h2>订单详情</h2>
                <h3>订单号：<span id="num"></span></h3></div>
            <div class="orderList">
                <div class="orderList1" id="orderList1"><h3>已收货</h3>

                </div>
                <div class="orderList1"><h3>收货信息</h3>
                    <p>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span><%=user!=null?user.getUserName():""%></span></p>
                    <p>联系电话：<span><%=user!=null?user.getUserPhone():""%></span></p>
                    <p>收货地址：<span><%=user!=null?user.getUserAddress():""%></span></p></div>
                <div class="orderList1"><h3>支付方式及送货时间</h3>
                    <p>支付方式：<span>在线支付</span></p>
                    <p>送货时间：<span>不限送货时间</span></p></div>
                <div class="orderList1 hei"><h3><strong>商品总价：</strong><span class="price">¥</span></h3>
                    <p><strong>运费：</strong><span>¥0</span></p>
                    <p><strong>订单金额：</strong><span class="price">¥</span></p>
                    <p><strong>实付金额：</strong><span class="price">¥</span></p></div>
            </div>
        </div>
    </div>
</div>
<%@include file="foot.jsp"%>
<script>
    $(function (){
        var data = eval(<%=data%>);
        var table = "";
        var orderId =0;
        var totalPrice = 0;

        for(var i=0;i<data.length;i++){
            table += "<div class=\"clearfix\"><a href=\"#\" class=\"fl\"><img src='"+data[i].showPic+"' width='75' height='75'/></a>\n" +
                "                        <p class=\"fl\"><a href=\"#\">"+ data[i].showName +"</a><a href=\"#\">¥"+ data[i].showPrice +"×"+data[i].showNum+"</a></p></div><br>"
            orderId = data[i].orderId;
            totalPrice += (data[i].showPrice*data[i].showNum);
        }
        $("#orderList1").append(table);
        $("#num").append(orderId);
        $(".price").append(totalPrice.toFixed(2));
    })
</script>

