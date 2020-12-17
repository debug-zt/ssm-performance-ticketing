<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.ssm.bean.User" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="com.ssm.bean.AllShow" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

    Gson gson = new Gson();
    String  gsonResult = request.getParameter("showResult");
    AllShow show = gson.fromJson(gsonResult, AllShow.class);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>详情页</title>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%= basePath%>css/proList.css"/>
</head>
<!------------------------------head------------------------------>
<%@include file="head.jsp" %>
<!-----------------address------------------------------->
<div class="address">
    <div class="wrapper clearfix"><a href="<%=basePath%>index.jsp">首页</a>
        <span>/</span><a href="#" class="on"><%= show!=null?show.getShowName():""%></a>
    </div>
</div><!-----------------------Detail------------------------------>
<div class="detCon">
    <div class="proDet wrapper">
        <div class="proCon clearfix">
            <div class="proImg fl"><img class="det" src="<%= show!=null?show.getShowPic():""%>"/>
                <div class="smallImg clearfix"></div>
            </div>
            <div class="fr intro">
                <form id="fff" action="<%=basePath%>cart/buy" >
                    <div class="title"><h4><a href="#"><%= show!=null?show.getShowName():""%></a></h4>
                        <p>【演出前15天无理由退订】</p><span><a href="#">价格：<%= show!=null?show.getShowPrice():""%>￥</a></span></div>
                    <div class="proIntro">
                        <p>演出时间 &nbsp;<span><a href="#"><%= show!=null?show.getShowDate():""%></a> </span></p>
                        <p>演出地点 &nbsp;<span><a href="#"><%= show!=null?show.getShowPosit():""%></a> </span></p>
                        <p>剩余票数&nbsp;&nbsp;<span id="remain"><%= show!=null?show.getRemainTicket():""%></span>张</p>
                        <div class="num clearfix"><img class="fl sub" src="img/temp/sub.jpg"><span class="fl" id="num"
                                                                                                   contentEditable="true">0</span><img
                                class="fl add1" id="add" src="img/temp/add.jpg">
                            <%--<p class="please fl">请选择商品属性!</p>--%>
                        </div>
                    </div>
                    <div class="btns clearfix"><a href="#"><p class="buy fl" id="buy">立即购买</p></a><a><p class="cart fr" id="cart1">
                        加入购物车</p></a></div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="like"><h4>猜你喜欢</h4>
    <div class="bottom">
        <div class="hd"><span class="prev"><img src="<%= basePath%>img/temp/prev.png"></span><span class="next"><img
                src="<%= basePath%>img/temp/next.png"></span></div>
        <div class="imgCon bd">
            <div class="likeList clearfix">
                <div>
                    <a href="<%= basePath%>show/getShowByID?showId=1" class="clearfix">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID1.png"/><span class="abr"></span></dt>
                            <dd>【演唱会】吴青峰“太空备忘记”巡回演唱会</dd>
                            <dd><span>¥ 688.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=2">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID2.jpg"/><span class="abr"></span></dt>
                            <dd>【演唱会】周杰伦【嘉年华】世界巡回演唱会</dd>
                            <dd><span>¥ 888.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=4">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID4.png"/><span class="abr"></span></dt>
                            <dd>【音乐剧】《马可·波罗》</dd>
                            <dd><span>¥ 120.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=5">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID5.png"/><span class="abr"></span></dt>
                            <dd>【音乐剧】《梵高》</dd>
                            <dd><span>¥ 145.00</span></dd>
                        </dl>
                    </a>
                    <a href="<%= basePath%>show/getShowByID?showId=7">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID7.png"/><span class="abr"></span></dt>
                            <dd>【脱口秀】太·空间 无忧喜剧</dd>
                            <dd><span>¥ 133.00</span></dd>
                        </dl>
                    </a>
                </div>
                <div>
                    <a href="<%= basePath%>show/getShowByID?showId=8">
                        <dl>
                            <dt><span class="abl"></span><img src="<%= basePath%>img/showID8.png"/><span class="abr"></span></dt>
                            <dd>【脱口秀】《求婚女王》</dd>
                            <dd><span>¥ 289.00</span></dd>
                        </dl>
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="foot.jsp"%>
<script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/cart.js" type="text/javascript" charset="UTF-8"></script>
<script type="text/javascript">
    $(function (){
        $(".bottom").slide({
            titCell: ".hd ul",
            mainCell: ".bd .likeList",
            autoPage: true,
            autoPlay: false,
            effect: "leftLoop",
            autoPlay: true,
            vis: 1
        });

        var $cId = "<%=user!=null?String.valueOf(user.getUserId()):""%>";
        var $showId = "<%=show!=null?show.getShowId():""%>";


        $("#cart1").click(function (){
            if($("#remain").html()==0){
                alert("票已售空，无法加入购物车！");
            }else if ($("#num").html()==0){
                alert("请选择数量");
            }
            else {
                var $num = $('#num').html();
                if ($cId == "") {
                    alert("请先登录后操作！");
                } else {
                    $.ajax({
                        url: "<%=basePath%>cart/addToCart",
                        type: "post",

                        data: {
                            "showId": $showId,
                            "cId": $cId,
                            "showNum": $num
                        },
                        success: function (result) {
                            alert(result);
                        }
                    })
                }
            }
        })

        $("#buy").click(function (){
            $num = $("#num").html();
            if($("#remain").html()==0){
                $(".proIntro").css('border','1px solid red');
                alert("很抱歉票已售空")
            }else if ($num==0){
                $(".proIntro").css('border','1px solid red');
                alert("请选择数量");
            }else if($cId==""){
                alert("请先登录后操作！")
            }
            else {
                $(location).attr('href', '<%=basePath%>order.jsp?showId=<%=show.getShowId()%>&showName=<%=show.getShowName()%>&showPrice=<%=show.getShowPrice()%>&showPic=<%=show.getShowPic()%>&showNum=' + $num);
            }
        })

        $(document).on('click', '#add' ,function(){
            var c = parseInt($(this).siblings("span").text());//数量
            var remain = $("#remain").html();
            if(c<remain){
                if (c >= 5) {
                    alert("限购5件")
                } else {
                    c++;
                    $(this).siblings("span").html(c);
                    var d =$(this).parents().prev().html();

                    $(this).parents(".th").find(".sAll").text("" + (c * d).toFixed(2));
                    a();
                    b()
                }
            }else{
                alert("剩余票数不足！");
            }
        });

    })


</script>

