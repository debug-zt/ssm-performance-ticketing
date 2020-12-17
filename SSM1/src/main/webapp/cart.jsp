<%@ page import="com.ssm.bean.User" %>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.ssm.bean.AllShow" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>我的购物车</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/proList.css"/>
    <script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/pro.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/cart.js" charset="UTF-8" type="text/javascript" ></script>
</head>
<%--    <%Cookie[] cookies = request.getCookies();
    User user = null;
    if(cookies != null){
    for(int i=0;i<cookies.length;i++){
        if(cookies[i].getName().equals("user")){
            Gson gson = new Gson();
            String value = URLDecoder.decode(cookies[i].getValue(),"utf-8");
            user = gson.fromJson(value,User.class);
            break;
        } }}
%>--%>

<%@include file="head.jsp"%>
<div class="cart mt"><!-----------------logo------------------->
    <!--<div class="logo"><h1 class="wrapper clearfix"><a href="index.html"><img class="fl" src="img/temp/logo.png"></a><img class="top" src="img/temp/cartTop01.png"></h1></div>-->
    <!-----------------site------------------->
    <div class="site"><p class=" wrapper clearfix"><span class="fl">购物车</span><img class="top"
                                                                                   src="<%=basePath%>img/temp/cartTop01.png"><a
            href="index.jsp" class="fr">继续购物&gt;</a></p></div><!-----------------table------------------->
    <div class="table wrapper" id="more">
        <div class="tr">
            <div>商品</div>
            <div>单价</div>
            <div>数量</div>
            <div>小计</div>
            <div>操作</div>
        </div>


    </div>
</div>
<div class="mask"></div>
<div class="tipDel"><p>确定要删除该商品吗？</p>
    <p class="clearfix"><a class="fl cer" href=#">确定</a><a class="fr cancel" href="#">取消</a></p></div><!--返回顶部-->
<%@include file="foot.jsp"%>
<div class="pleaseC"><p>请选择宝贝</p><img class="off" src="img/temp/off.jpg"/></div>

<script>
    $(function (){

        var $mes = "${mes}"
        if($mes!==""){
            alert($mes);
        }


        $(document).on('click', '.del' ,function(){
            if ($(this).parent().parent().hasClass("th")) {
                $(".mask").show();
                $(".tipDel").show();
                var s = $(this).parents().siblings(".clearfix").find(".clearfix").find("#IId").html();
                $(document).on('click', '.cer' ,function(){
                    location.href="<%=basePath%>cart/deleteShow?"+"showId="+s+"&cId="+<%=user!=null?String.valueOf(user.getUserId()):"0"%>;
                })

            }
        })

            var $str = "<%=user%>";

            if($str=="null"){
                var table = "";
                table += "<div class=\"goOn\">空空如也~<a href=\"index.jsp\">去逛逛</a></div>\n" +
                    "        <div class=\"tr clearfix\"><label class=\"fl\"><input class=\"checkAll\" type=\"checkbox\"/><span></span></label>\n" +
                    "            <p class=\"fl\"><a href=\"#\">全选</a><a href=\"#\" class=\"del\">删除</a></p>\n" +
                    "            <p class=\"fr\"><span>共<small id=\"sl\">0</small>件商品</span><span>合计:&nbsp;<small id='all'>0.00</small></span><a\n" +
                    "                    id='count' class=\"count\">结算</a></p></div>";
                $("#more").append(table);
            }else {
                $.ajax({
                    url: "<%=basePath%>cart/show",
                    type: "get",
                    data: {
                        "cId":<%=user!=null?String.valueOf(user.getUserId()):"0"%>,
                    },
                    success: function (data) {
                        var table = "";

                        if(data.length>0){
                            $.each(data, function (i, item) {
                                table += "        <div class='th' id='th'><div class='pro clearfix'><label class='fl'><input type='checkbox' class='xx' /><span></span></label><a class='fl'\n" +
                                    "                                                                                                        href='#'>" +
                                    "                <dl class='clearfix'>\n" +
                                    "                    <dt class='fl'><a href='<%=basePath%>show/getShowByID?showId="+item.allshow.showId +"'><span class='hide'>"+item.allshow.showId+"</span><img src='<%=basePath%>"+ item.allshow.showPic +"' width='120' height='120'></a></dt><p id='IId' style='display: none'>" + item.allshow.showId + "</p>" +
                                    "                    <dd class='fl'><p class='p1'>" + item.allshow.showName + "</p></dd>" +


                                    "                </dl>\n" +
                                    "            </a></div>\n" +
                                    "\n" +
                                    "            <div class='price'>" + item.allshow.showPrice.toFixed(2) + "</div>" +
                                    "            <div class='number'><p class='num clearfix'><img class='fl sub' src='<%=basePath%>img/temp/sub.jpg'>" +
                                    "                   <span id='ss' class='fl'>" + item.showNum + "</span><img class='fl add' src='<%=basePath%>img/temp/add.jpg'></p></div>\n" +
                                    "\n" +
                                    "            <div class='price sAll'> " + (item.showNum * item.allshow.showPrice).toFixed(2) + "</div>" +
                                    "            <div class='price'><a class='del' href='#2'>删除</a></div></div>";

                            })
                            table +=
                                "        <div class=\"tr clearfix\"><label class=\"fl\"><input class=\"checkAll\" type=\"checkbox\"/><span></span></label>\n" +
                                "            <p class=\"fl\"><a href=\"#\">全选</a><a href=\"#\" class=\"del\">删除</a></p>\n" +
                                "            <p class=\"fr\"><span>共<small id=\"sl\">0</small>件商品</span><span>合计:&nbsp;<small id='all'>0.00</small></span><a\n" +
                                "                    id='count' class=\"count\">结算</a></p></div>";
                            $("#more").append(table);

                            var array = new Array();
                            $(".xx").click(function (){
                                if (this.checked) {
                                    var JSONObject={
                                        "showName":$(this).parent().siblings(".clearfix").find(".p1").html(),
                                        "showPrice":$(this).parent().parent().siblings(".price").html(),
                                        "buyNum":$(this).parent().parent().siblings(".number").find("#ss").html(),
                                        "showPic": $(this).parent().siblings(".clearfix").find("img").attr("src"),
                                        "showId": $(this).parent().siblings(".clearfix").find(".hide").html()
                                    }

                                    array.push(JSONObject);
                                }
                            })


                            $("#count").click(function (){
                                $(location).attr('href','<%=basePath%>cartToOrder.jsp?list='+JSON.stringify(array))
                            })

                        }else{
                            table += "<div class=\"goOn\">空空如也~<a href=\"index.jsp\">去逛逛</a></div>\n" +
                                "        <div class=\"tr clearfix\"><label class=\"fl\"><input class=\"checkAll\" type=\"checkbox\"/><span></span></label>\n" +
                                "            <p class=\"fl\" id='all'><a href=\"#\">全选</a><a href=\"#\" class=\"del\">删除</a></p>\n" +
                                "            <p class=\"fr\"><span>共<small id=\"sl\">0</small>件商品</span><span>合计:&nbsp;<small id='all'>0.00</small></span><a\n" +
                                "                    href=\"order.html\" class=\"count\">结算</a></p></div>";
                            $("#more").append(table);
                        }}

                })
            }


    })
</script>




