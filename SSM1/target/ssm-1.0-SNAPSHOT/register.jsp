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
    <title>用户注册</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath %>css/register.css"/>
    <script src="<%=basePath %>js/jquery-1.12.4.min.js"></script>
    <script>
        $(function (){
            var mes = "${mes}";
            if(mes !== ""){
                alert(mes);
            }
        })
    </script>
</head>
<body><!-------------------login-------------------------->
<div class="login">
    <form action="<%=basePath%>user/register" method="post" id="form"><h1><a href="index.jsp"><img src="<%=basePath %>img/xiaomai.jpg" width="120" height="60"></a></h1>
        <p></p>
        <div class="msg-warn hide"><b></b>----------------欢迎注册小麦网------------------</div>
        <p><input type="text" name="userName" placeholder="用户名"></p>
        <p><input type="password" name="userPassword" id="pwd"  placeholder="输入密码" onmouseover="Tip()" onmouseout="hiddenTip()"></p>
        <p class="txt" id="Tip" style="display: none">6-16 个字符，需使用字母、数字或符号组合</p>
        <p><input type="password" id="rpwd"  placeholder="请再次输入密码"></p>
        <p><input type="button" id="submit1" name="" value="注  册"></p></form>
<%--        <p class="txt"><a class="" href="reg.html">免费注册</a><a href="forget.html">忘记密码？</a></p></form>--%>
</div>
</body>
</html>
<script>
    $(function (){
        var $pwd = $("#pwd").val();
        var $rpwd = $("#rpwd").val();

        $("#submit1").click(function (){
            if($("#pwd").val()===""){
                alert("密码不能为空！");
            }else if($pwd!==$rpwd){
                alert("两次输入的新密码不一致！");
            }
            else{
                $("#form").submit();
            }
        })


    })
    function Tip() {
        document.getElementById("Tip").style.display = "block";
    }

    function hiddenTip(){
        document.getElementById("Tip").style.display = "none";
    }
</script>

