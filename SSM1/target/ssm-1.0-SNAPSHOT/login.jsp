<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>

    <meta charset="UTF-8">
    <title>登录</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/login.css"/>
    <script src="<%=basePath %>js/jquery-1.12.4.min.js"></script>
    <script>
        $(function (){
            var $error = "${error}";
            var $mes = "${mes}";
            if($error !== ""){
                alert($error);
            }
            if($mes !== ""){
                alert($mes);
            }
        })
    </script>
</head>
<body><!-------------------login-------------------------->
<div class="login">
    <form id="loginForm" method="post"><h1><a href="<%=basePath%>index.jsp"><img src="<%=basePath %>img/XiaoMaiLogo1.jpg" width="120" height="60"></a></h1>
        <p></p>
        <div class="msg-warn hide"><b></b>公共场所不建议自动登录，以防账号丢失</div>
        <p><input type="text" name="name" placeholder="用户名"></p>
        <p><input type="password" name="pwd"  placeholder="密码"></p>
        <select name = "loginType" id="loginType" >
            <option selected hidden disabled value="">请选择</option>
            <option value="user">用户</option>
            <option value="manager">管理员</option>
        </select>
        <p><input type="button" name="" onclick="loginSelect()" value="登  录"></p>
        <script type="text/javascript">
            function loginSelect(){
                var form1 = document.getElementById("loginForm");
                var sel = document.getElementById("loginType");
                var value = sel.options[sel.selectedIndex].value;
                if (value === "user"){
                    form1.action = "<%=basePath%>user/loginByname";
                }else if (value === "manager"){
                    form1.action = "<%=basePath%>manager/login";
                }
                form1.submit();
            }
        </script>
        <p class="txt"><a class="" href="<%=basePath%>register.jsp">免费注册</a><a href="forget.html">忘记密码？</a></p></form>
</div>
</body>
</html>