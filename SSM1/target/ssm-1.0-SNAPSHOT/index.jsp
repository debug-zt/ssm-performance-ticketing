<%--
  Created by IntelliJ IDEA.
  User: 85074
  Date: 2020/11/24
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <title>小麦</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/index.css"/>
    <script src="<%=basePath %>js/jquery-1.12.4.min.js"></script>
    <script>
        $(function (){
            var $error = "${error}";
            var $mes = "${mes}";
            if($error !== ""){
                alert($error);
            }
            else if ($mes !== ""){
                alert($mes);
            }

        })
    </script>
</head>
<%@include file="head.jsp"%>

<!-------------------------banner--------------------------->
<div class="block_home_slider">
    <div id="home_slider" class="flexslider">
        <ul class="slides">
            <li>
                <div class="slide"><img src="<%=basePath%>img/banner1.jpg"/></div>
            </li>
            <li>
                <div class="slide"><img src="<%=basePath%>img/banner2.jpg"/></div>
            </li>
            <li>
                <div class="slide"><img src="<%=basePath%>img/banner3.jpg"/></div>
            </li>
        </ul>
    </div>
</div>
<!------------------------------thImg------------------------------>
<div class="thImg">
    <div class="clearfix"><a href="<%=basePath%>searchResult.jsp?keyWord=演唱会"><img src="<%=basePath%>img/YCH.jpg"/></a>
        <a href="<%=basePath%>searchResult.jsp?keyWord=音乐剧"><img src="<%=basePath%>img/YYJ.jpg"/></a>
        <a href="<%=basePath%>searchResult.jsp?keyWord=脱口秀"><img src="<%=basePath%>img/TKX.jpg"/></a></div>
</div>
<!------------------------------news------------------------------>
<div class="news">
    <div class="wrapper"><h2><img src="<%=basePath%>img/ih1.jpg"/></h2>
        <div class="flower clearfix tran">
            <a href="<%=basePath%>show/getShowByID?showId=1" class="clearfix">
            <dl>
                <dt><span class="abl"></span><img src="<%= basePath%>img/showID1.png"/><span class="abr"></span></dt>
                <dd>【演唱会】吴青峰“太空备忘记”巡回演唱会</dd>
                <dd><span>¥ 688.00</span></dd>
            </dl>
        </a>
            <a href="<%=basePath%>show/getShowByID?showId=2">
            <dl>
                <dt><span class="abl"></span><img src="<%= basePath%>img/showID2.jpg"/><span class="abr"></span></dt>
                <dd>【演唱会】周杰伦【嘉年华】世界巡回演唱会</dd>
                <dd><span>¥ 888.00</span></dd>
            </dl>
        </a>
            <a href="<%=basePath%>show/getShowByID?showId=4">
            <dl>
                <dt><span class="abl"></span><img src="<%= basePath%>img/showID4.png"/><span class="abr"></span></dt>
                <dd>【音乐剧】《马可·波罗》</dd>
                <dd><span>¥ 120.00</span></dd>
            </dl>
        </a></div>
        <div class="flower clearfix tran">
            <a href="<%=basePath%>show/getShowByID?showId=5">
            <dl>
                <dt><span class="abl"></span><img src="<%= basePath%>img/showID5.png"/><span class="abr"></span></dt>
                <dd>【音乐剧】《梵高》</dd>
                <dd><span>¥ 145.00</span></dd>
            </dl>
        </a>
            <a href="<%=basePath%>show/getShowByID?showId=7">
            <dl>
                <dt><span class="abl"></span><img src="<%= basePath%>img/showID7.png"/><span class="abr"></span></dt>
                <dd>【脱口秀】太·空间&无忧喜剧</dd>
                <dd><span>¥ 133.00</span></dd>
            </dl>
        </a>
            <a href="<%=basePath%>show/getShowByID?showId=8">
            <dl>
                <dt><span class="abl"></span><img src="<%= basePath%>img/showID8.png"/><span class="abr"></span></dt>
                <dd>【脱口秀】《求婚女王》</dd>
                <dd><span>¥ 289.00</span></dd>
            </dl>
        </a></div>
    </div>
</div>
<%@include file="foot.jsp"%>
<script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">$(function () {
    $('#home_slider').flexslider({
        animation: 'slide',
        controlNav: true,
        directionNav: true,
        animationLoop: true,
        slideshow: true,
        slideshowSpeed: 2000,
        useCSS: false
    });

    var $error = "${error}";
    var $mes = "${mes}";
    var $loginerror = "<%=request.getParameter("loginError")%>";
    if($error !== "") {
        alert($error);
    }else if ($mes !== ""){
        alert($mes);
    }else if($loginerror !== "null"){
        alert($loginerror);
    }
})</script>
</html>
