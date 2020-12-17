<%@ page import="com.ssm.bean.User" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!DOCTYPE html>
<html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

/*    Cookie[] cookies = request.getCookies();
    User user = null;
    if(cookies != null){
        for(int i=0;i<cookies.length;i++){
            if(cookies[i].getName().equals("user")){
                Gson gson = new Gson();
                String value = URLDecoder.decode(cookies[i].getValue(),"utf-8");
                user = gson.fromJson(value,User.class);
                break;
            } }}*/
    String price = request.getParameter("showPrice");
    String num = request.getParameter("showNum");
    Integer allPrice = Integer.valueOf(price)*Integer.valueOf(num);
%>
<head lang="en">
    <meta charset="utf-8"/>
    <title>order</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/mygxin.css"/>
</head>
<%@include file="head.jsp"%>
<div class="order cart mt"><!-----------------site------------------->
    <div class="site"><p class="wrapper clearfix"><span class="fl">订单确认</span><img class="top"
                                                                                   src="img/temp/cartTop02.png"></p>
    </div><!-----------------orderCon------------------->
    <div class="orderCon wrapper clearfix">
        <div class="orderL fl"><!--------h3----------------><h3>收件信息</h3>
            <!--------addres---------------->
            <div class="addres clearfix">
                <div class="addre fl on">
                    <div class="tit clearfix"><p class="fl"><%=user!=null?user.getUserName():""%><span class="default">[默认地址]</span></p>
                        </div>
                    <div class="addCon"><p><%=user!=null?user.getUserAddress():""%></p>
                        <p><%=user!=null?user.getUserPhone():""%></p></div>
                </div>

            </div>
            <h3>支付方式</h3><!--------way---------------->
            <div class="way clearfix"><img class="on" src="img/temp/way01.jpg"><img src="img/temp/way02.jpg"><img
                    src="img/temp/way03.jpg"><img src="img/temp/way04.jpg"></div>
            <h3>选择快递</h3><!--------dis---------------->
            <div class="dis clearfix"><span class="on">顺丰快递</span><span>百世汇通</span><span>圆通快递</span><span>中通快递</span>
            </div>
        </div>
        <div class="orderR fr">
            <div class="msg"><h3>订单内容<a href="cart.jsp" class="fr">返回购物车</a></h3><!--------ul---------------->
                <ul class="clearfix">
                    <li class="fl"><img src="<%=basePath%><%=request.getParameter("showPic")%>"></li>
                    <li class="fl"><p><%=request.getParameter("showName")%></p>

                        <p>数量：<%=request.getParameter("showNum")%></p></li>
                    <li class="fr">￥<%=request.getParameter("showPrice")%></li>
                </ul>
            </div><!--------tips---------------->
            <div class="tips"><p><span class="fl">商品金额：</span><span class="fr">￥<%=request.getParameter("showPrice")%></span></p>
                <p><span class="fl">优惠金额：</span><span class="fr">￥0.00</span></p>
                <p><span class="fl">运费：</span><span class="fr">免运费</span></p></div><!--------tips count---------------->
            <div class="count tips"><p><span class="fl">合计：</span><span class="fr">￥<%=allPrice%></span></p></div>
            <!--<input type="button" name="" value="去支付">--> <a id="pay" class="pay">去支付</a></div>
    </div>
</div><!--编辑弹框--><!--遮罩-->
<div class="mask"></div>
<div class="adddz editAddre">
    <form action="#" method="get"><input type="text" placeholder="姓名" class="on"/><input type="text" placeholder="手机号"/>
        <div class="city"><select name="">
            <option value="省份/自治区">省份/自治区</option>
        </select><select>
            <option value="城市/地区">城市/地区</option>
        </select><select>
            <option value="区/县">区/县</option>
        </select><select>
            <option value="配送区域">配送区域</option>
        </select></div>
        <textarea name="" rows="" cols="" placeholder="详细地址"></textarea><input type="text" placeholder="邮政编码"/>
        <div class="bc"><input type="button" value="保存"/><input type="button" value="取消"/></div>
    </form>
</div>
<%@include file="foot.jsp"%>
<script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/user.js" type="text/javascript" charset="utf-8"></script>
<script>
    $(function (){
        $("#pay").click(function (){
            var time = new Date().toLocaleString();
            var userId = "<%=user!=null?String.valueOf(user.getUserId()):""%>";
            if(userId==""){
                alert("请先登录后操作！");
            }else{
                $(location).attr('href','<%=basePath%>order/add?showId=<%=request.getParameter("showId")%>&showName=<%=request.getParameter("showName")%>&showNum=<%=request.getParameter("showNum")%>&showPic=<%=basePath%><%=request.getParameter("showPic")%>&userId=<%=user!=null?String.valueOf(user.getUserId()):""%>&userName=<%=user!=null?user.getUserName():""%>&cost=<%=allPrice%>&orderCreateTime='+time);
            }


        })
    })
</script>