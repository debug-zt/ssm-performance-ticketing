<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.ssm.bean.User" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%Cookie[] cookies = request.getCookies();
    User userL = null;
    if(cookies != null){
    for(int i=0;i<cookies.length;i++){
        if(cookies[i].getName().equals("user")){
            Gson gson = new Gson();
            String value = URLDecoder.decode(cookies[i].getValue(),"utf-8");
            userL = gson.fromJson(value,User.class);
            break;
        } }}
%>

<%--<span class="fr"><a>[退出登录]</a></span>--%>
<div class="zuo fl">
    <h3><a href="#"><img src="<%= basePath%><%= userL!=null?userL.getUserHead():"img/firsthead.jpg"%>" width="76" height="76"/></a>
        <p class="clearfix"><span class="fl">
            <a href="<%=basePath%><%if(userL!=null){out.print("userhost.jsp");}else{out.print("login.jsp");} %>"><% if(userL!=null){ out.print("["+userL.getUserName()+"]");}else{out.print("——[尚未登录]——");}%></a></span>
            <span class="fr" ><a href="<%=basePath%>user/exit"> <%if(userL!=null){out.print("[退出登录]");}%></a></span>
        </p></h3>
    <div>
        <h4>个人中心</h4>
        <ul>
            <li class="on"><a href="<%=basePath%>userhost.jsp">我的中心</a></li>
            <li><a href="<%=basePath%>cart.jsp">我的购物车</a></li>
            <li><a href="<%=basePath%>userorder.jsp">我的订单</a></li>
        </ul>
        <h4>账户管理</h4>
        <ul>
            <li><a href="<%=basePath%>userdata.jsp">个人信息</a></li>
            <li><a href="<%=basePath%>remima.jsp">修改密码</a></li>
        </ul>
    </div>
</div>
