<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.ssm.bean.AllShow" %>
<%@ page import="org.apache.ibatis.javassist.compiler.ast.Keyword" %>
<%@ page import="java.util.List" %>
<%@ page import="com.google.gson.reflect.TypeToken" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";

/*    Gson gson = new Gson();
    String gsonResult = request.getParameter("showListGson");
    TypeToken<List<AllShow>> list = new TypeToken<List<AllShow>>(){};
    List<AllShow> showList = gson.fromJson(gsonResult, list.getType());*/
    String KeyWord = request.getParameter("keyWord");
%>
<script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/cart.js" type="text/javascript" charset="utf-8"></script>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title><%= KeyWord!=null?KeyWord:"搜索关键词为空"%>_小麦搜索</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>

</head>
<%@include file="head.jsp"%>
<!------------------------------banner------------------------------>
<%--<div class="banner"><a href="#"><img src="img/temp/bzbig.jpg"/></a></div>--%>
<!-----------------address------------------------------->
<div class="address">
    <div class="wrapper clearfix"><a href="index.jsp">首页</a>
        <span>/</span><a href="searchResult.jsp" class="on">搜索：<%=KeyWord!=null?KeyWord:""%></a>
    </div>
</div><!-------------------current---------------------->
<div class="current">
    <div class="wrapper clearfix"><h3 class="fl"><%=KeyWord%></h3>
        <div class="fr choice"><p class="default" onclick="showOrder()">排序方式</p>
            <script type="text/javascript">
                function showOrder() {
                    if (document.getElementById("ulOrder").style.display === "none"){
                        document.getElementById("ulOrder").style.display = "block";
                    }else{
                        document.getElementById("ulOrder").style.display = "none";
                    }

                }
            </script>
            <ul id="ulOrder" class="select">
                <a onclick="order('showCate','ASC')"><li>按类别</li></a>
                <a onclick="order('showDate', 'ASC')"><li>日期从近到远</li></a>
                <a onclick="order('showDate', 'DESC')"><li>日期从远到近</li></a>
                <a onclick="order('showPrice', 'DESC')"><li>价格从高到低</li></a>
                <a onclick="order('showPrice', 'ASC')"><li>价格从低到高</li></a>
            </ul>
        </div>
    </div>
</div><!----------------proList------------------------->
<ul id="ul1" class="proList wrapper clearfix">
    <script>
        <%-- var show = "";--%>
        <%--<%--%>
        <%--    String result = "";--%>
        <%--    if (showList == null){--%>
        <%--        result += "<h2>" + request.getParameter("msg") + "</h2>";--%>
        <%--    }--%>
        <%--    else{--%>
        <%--        for (AllShow allshow: showList){--%>
        <%--            result += "<li><a href=" + basePath + "show/getShowByID?showId=" + allshow.getShowId() + ">"--%>
        <%--            + "<dl> <dt><img src=\"" + allshow.getShowPic() + "\"></dt> <dd>" + allshow.getShowName() + "</dd>"--%>
        <%--            + "<dd>￥" + allshow.getShowPrice() + "</dd> </dl>   </a></li>";--%>
        <%--        }--%>
        <%--    }--%>

        <%--%>--%>
        <%--show = '<%= result%>';--%>
        <%--console.log(show);--%>
        <%--document.getElementById("ul1").innerHTML = show;--%>



        $(function (){
            var sortAttrib = "showCate";
            var sortWay = "ASC";
            $.ajax({
                url: "<%=basePath%>show/getShowDynamic?keyWord=<%=KeyWord%>&sortAttrib=" + sortAttrib + "&sortWay=" + sortWay,
                type: "get",
                success: function (data){
                    var result = "";
                    if (data.length>0){
                        $.each(data, function (i, item){
                            result += "<li><a href='<%=basePath%>show/getShowByID?showId=" + item.showId + "'>"
                                + "<dl> <dt><img src='" + item.showPic + "'></dt> <dd>" + item.showName + "</dd>"
                                + "<dd>￥" + item.showPrice + "</dd> </dl>   </a></li>";
                        })

                    }else {
                        result += "<h2>很抱歉，未能搜索到相关信息</h2>";
                    }
                    $("#ul1").append(result);
                }

            })
        })

        function order(sortAttrib, sortWay) {

            $.ajax({
                url: "<%=basePath%>show/getShowDynamic?keyWord=<%=KeyWord%>&sortAttrib=" + sortAttrib + "&sortWay=" + sortWay,
                type: "get",
                success: function (data) {
                    var result = "";
                    $("#ul1").html("");
                    if (data.length > 0) {
                        $.each(data, function (i, item) {
                            result += "<li><a href='<%=basePath%>show/getShowByID?showId=" + item.showId + "'>"
                                + "<dl> <dt><img src='" + item.showPic + "'></dt> <dd>" + item.showName + "</dd>"
                                + "<dd>￥" + item.showPrice + "</dd> </dl>   </a></li>";
                        })
                        $("#ul1").append(result);
                    }
                }


            })
        }

    </script>
</ul>
<!--返回顶部-->
<%@include file="youLike.jsp"%>
<%@include file="foot.jsp"%>


