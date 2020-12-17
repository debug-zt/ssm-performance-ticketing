<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head lang="en">

    <title>个人中心</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mygxin.css"/>
    <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/js/user.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(function (){
            var $exit = "<%=request.getParameter("exit")%>";
            if($exit=="退出登录成功！"){
                alert($exit);
            }
        })</script>
</head>

<%@include file="head.jsp" %>
<!------------------------------idea------------------------------>
<div class="address mt" id="add">
    <div class="wrapper clearfix"><a href="index.jsp" class="fl">首页</a><span>/</span><a href="userhost.jsp" class="on">个人中心</a>
    </div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="left.jsp" %>
        <div class="you fl">
            <div class="tx clearfix">
                <div class="fl clearfix"><a href="#" class="fl"><img src="<%= basePath%><%= user!=null?user.getUserHead():"img/firsthead.jpg"%>" width="76" height="76"/></a>
                    <p class="fl"><span><%= user!=null?user.getUserName():" "%></span><a href="<%=basePath%>userdata.jsp">修改个人信息></a></p></div>
            </div>
            <div class="bott">
                <div class="clearfix"><a href="#" class="fl"><img src="<%= basePath%>img/gxin1.jpg"/></a>
                    <p class="fl"><span>待支付的订单：<strong>0</strong></span><a href="myorderq.html">查看待支付订单></a></p></div>
                <div class="clearfix"><a href="#" class="fl"><img src="<%= basePath%>img/gxin2.jpg"/></a>
                    <p class="fl"><span>待收货的订单：<strong>0</strong></span><a href="myorderq.html">查看待收货订单></a></p></div>
                <div class="clearfix"><a href="#" class="fl"><img src="<%= basePath%>img/gxin3.jpg"/></a>
                    <p class="fl"><span>待评价的订单：<strong>0</strong></span><a href="myprod.html">查看待评价订单></a></p></div>
                <div class="clearfix"><a href="#" class="fl"><img src="<%= basePath%>img/gxin4.jpg"/></a>
                    <p class="fl"><span>喜欢的商品：<strong>0</strong></span><a href="#">查看喜欢的商品></a></p></div>
            </div>
        </div>
    </div>
</div>

<%@include file="foot.jsp" %>