<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>我的订单</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/myorder.css"/>
    <script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/user.js" type="text/javascript" charset="utf-8"></script>
</head>
<%@include file="head.jsp"%>
</div><!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix"><a href="#" class="fl">首页</a><span>/</span><a
            href="<%=basePath%>userhost.jsp">个人中心</a><span>/</span><a href="myorderq.html" class="on">我的订单</a></div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="left.jsp"%>
        <div class="you fl" id="11">
            <div class="my clearfix"><h2 class="fl">我的订单</h2></div>
            <div class="dlist clearfix">
                <ul class="fl clearfix" id="wa">
                    <li class="on"><a href="#2">全部有效订单</a></li>
                </ul>
                <form action="#" method="get" class="fr clearfix"><input type="text" name="" value=""
                                                                         placeholder="请输入商品名称、订单号"/><input type="button"
                                                                                                           name=""
                                                                                                           value=""/>
                </form>
            </div>
            <script>
                $(function (){
                    $.ajax({
                        url: "<%=basePath%>order/show",
                        type: "post",
                        data: {
                            "userId" : <%=user!=null?String.valueOf(user.getUserId()):""%>,
                        },
                        success: function (data){
                            var table = "";
                            if(data.length>0){
                                $.each(data, function (i, item) {
                                    table += "<div class=\"dkuang\" id='"+ i +"'><p class=\"one\">已收货</p><div class=\"word clearfix\"><ul class=\"fl clearfix\"><li>" + item.orderCreateTime +
                                        "</li><li>" + item.userName + "</li><li>在线支付</li></ul>\n" +
                                        "<p class=\"fr\">订单金额：<span>"+ item.cost +"</span>元</p></div>\n" +
                                        "            </div>";
                                    $.ajax({
                                        url: "<%=basePath%>order/showdetail",
                                        data:{
                                            "orderId":item.orderId,
                                        },
                                        type: "post",
                                        success: function (data){
                                            var table1 = "";

                                            table1 +=
                                                "<div class=\"shohou clearfix\" id='s"+ i +"'><a href=\"#\" class=\"fl\"><img src='"+ data[0].showPic +"'/></a>\n" +
                                                "<p class=\"fl\"><a href=\"#\">"+ data[0].showName +"</a><a href=\"#\">¥"+ data[0].showPrice +"×"+ data[0].showNum +"</a></p>\n" +
                                                "<p class=\"fr\"><a href=\"myprod.html\">待评价</a><a href='orderdetail.jsp?data="+ JSON.stringify(data) +"'>订单详情</a></p></div>";

                                            $('#'+i).append(table1);

                                        }
                                    })
                                })
                                table += "<div class=\"fenye clearfix\"><a href=\"#\"><img src=\"img/zuo.jpg\"/></a><a href=\"#\">1</a><a href=\"#\"><img\n" +
                                    "                    src=\"img/you.jpg\"/></a></div>";
                                $("#11").append(table);
                            }

                        }
                    })
                })
            </script>




        </div>
    </div>
</div>
<%@include file="foot.jsp"%>

