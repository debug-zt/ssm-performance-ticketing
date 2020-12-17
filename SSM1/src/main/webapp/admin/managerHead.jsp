<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.ssm.bean.Manager" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    Cookie[] cookiesAdmHead = request.getCookies();
    Manager manager = null;
    boolean status = false;
    if(cookiesAdmHead != null){
        for(int i=0;i<cookiesAdmHead.length;i++){
            if(cookiesAdmHead[i].getName().equals("manager")){
                Gson gsonHead = new Gson();
                String value = URLDecoder.decode(cookiesAdmHead[i].getValue(),"utf-8");
                manager = gsonHead.fromJson(value,Manager.class);
                status = true;
                break;
            }
        }
    }
%>
<script>
    if(!<%=status%>){
        window.location.href="<%=basePath%>index.jsp?loginError=请登陆后进入";
    }
    $(function() {

        $("#exit").click(function(user)
        {//为了删除指定名称的cookie，可以将其过期时间设定为一个过去的时间

            var date = new Date();
            date.setTime(date.getTime() - 10000);
            document.cookie = user + "=a; expires=" + date.toGMTString();})

    })
</script>

<body>
<div class="topbar-wrap white">
    <div class="topbar-inner clearfix">
        <div class="topbar-logo-wrap clearfix">
            <h1 class="topbar-logo none"><a href="<%=basePath%>admin/design.jsp" class="navbar-brand">后台管理</a></h1>
            <ul class="navbar-list clearfix">
                <li><a class="on" href="<%=basePath%>admin/design.jsp">首页</a></li>
                <li><a href="<%=basePath%>index.jsp" target="_blank">网站首页</a></li>
            </ul>
        </div>
        <div class="top-info-wrap">
            <ul class="top-info-list clearfix" id="mLoginStatus">
                <script>
                    var status = "";
                    <%
                        String statusGram = "";
                        if (manager != null){
                            statusGram += "<li><a href=\"" + basePath + "admin/design.jsp\">" + manager.getManagerName() + "</a></li>" +
                            "<li><a href=\"" + basePath + "admin/rePassword.jsp\">修改密码</a></li>" +
                             "<li><a href=\"" + basePath + "manager/exit\">退出登录</a></li>";
                        }else {
                            statusGram += "<li><a href=\"" + basePath + "admin/design.jsp\" id=\"login\">管理员</a></li>" +
                    "                    <li><a href=\"" + basePath + "login.jsp\" id=\"reg\">登录</a></li>";
                        }
                    %>

                    status = '<%=statusGram%>';
                    console.log(status);
                    document.getElementById("mLoginStatus").innerHTML = status;

                </script>
            </ul>
        </div>
    </div>
</div>
