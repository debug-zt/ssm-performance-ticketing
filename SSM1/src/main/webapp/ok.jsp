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
    <title>ok</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/proList.css"/>
</head>
<%@include file="head.jsp"%>
<div class="order mt cart">
    <div class="site"><p class="wrapper clearfix"><img class="top"
                                                                                   src="<%=basePath%>img/temp/cartTop03.png"></p>
    </div>
    <p class="ok">支付成功！剩余<span>5</span>秒<a href="<%=basePath%>userorder.jsp">返回订单页</a></p></div>
<%@include file="youLike.jsp"%>
<%@include file="foot.jsp"%>
<script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">jQuery(".bottom").slide({
    titCell: ".hd ul",
    mainCell: ".bd .likeList",
    autoPage: true,
    autoPlay: false,
    effect: "leftLoop",
    autoPlay: true,
    vis: 1
});</script>
</body>
</html>