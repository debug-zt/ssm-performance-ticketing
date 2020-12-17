<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head lang="en">
    <meta charset="utf-8"/>
    <title>修改密码</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>/css/mygrxx.css"/>
    <script src="<%=basePath%>/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>/js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>/js/user.js" type="text/javascript" charset="utf-8"></script>
</head>
<%@include file="head.jsp" %>
<!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix"><a href="index.jsp" class="fl">首页</a><span>/</span><a href="remima.jsp" class="on">修改密码</a>
    </div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="left.jsp" %>
        <div class="you fl"><h2>修改密码</h2>
            <form action="<%=basePath%>/user/updatepwd" method="post" class="remima" id="form">
                <p><span>原密码：</span><input type="password" name="opwd" id="opwd"/></p>
                <p class="op">输入原密码</p>
                <p><span>新密码：</span><input type="password" name="userPassword" id="npwd"/></p>
                <p class="op">6-16 个字符，需使用字母、数字或符号组合，不能使用纯数字、纯字母、纯符号</p>
                <p><span>重复新密码：</span><input type="password" id="renpwd" /><span id="errorpwd"></span></p>
                <p class="op">请再次输入密码</p>
                <p><span>验证码：</span><input type="text" id="code"/><img src="<%=basePath%>img/temp/code.jpg" alt=""/></p>
                <p class="op">按右图输入验证码，不区分大小写</p><input type="button" value="提交" id="submit1"/></form>
        </div>
    </div>
</div>
<%@include file="foot.jsp" %>
<script>

    $(function (){
        var $mes = "${mes}";
        if($mes!== ""){
            alert($mes);
        }

        $("#renpwd").blur(function (){
            var $pwd = $("#npwd").val();
            var $repwd = $("#renpwd").val();
            if($pwd!=$repwd){
                $("#errorpwd").html("<font style='color: red;'>密码不一致!</font>");
            }else{
                $("#errorpwd").html("");
            }
        })
        $("#renpwd").focus(function (){
            var $error = $("#errorpwd").html();
            if($error!==""){
                $("#renpwd").val("");
            }
        })

        $("#submit1").click(function (){
            var $user ="<%=user%>";
            if($user == "null"){
                alert("请先登录后操作！");
            }else{
                if($("#opwd").val()==""){
                    alert("原密码不能为空！");
                }else if($("#npwd").val()==""){
                    alert("新密码不能为空！");
                }else if($("#errorpwd").html()!=""){
                    alert("两次输入的新密码不一致！");
                }
                else{
                $("#form").submit();
                }
            }
        })
    });
</script>