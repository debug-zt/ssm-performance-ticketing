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
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/public.css"/>
    <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/mygrxx.css"/>
    <script src="<%=request.getContextPath()%>/js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/js/public.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=request.getContextPath()%>/js/user.js" type="text/javascript" charset="utf-8"></script>
    <script>
        $(function (){
            var $mes = "${mes}";
            if($mes !== ""){
            alert($mes);}
            var $msg = "<%=request.getParameter("mes")%>";
            if($msg !== "null"){
                alert($msg);}
        })
    </script>
</head>
<%@include file="head.jsp" %>
<!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix"><a href="index.jsp" class="fl">首页</a><span>/</span><a href="userdata.jsp" class="on">个人信息</a>
    </div>
</div><!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <%@include file="left.jsp" %>
        <div class="you fl"><h2>个人信息</h2>
            <div class="gxin">
                <div class="tx"><a href="#"><img src="<%= basePath%><%= user!=null?user.getUserHead():"img/firsthead.jpg"%>" height="76" width="76"/>
                    <p id="avatar">修改头像</p></a></div>
                <div class="xx"><h3 class="clearfix"><strong class="fl">基础资料</strong><a href="#" class="fr" id="edit1">编辑</a>
                </h3>
                    <div>用户ID：<%= user!=null?String.valueOf(user.getUserId()):""%></div>
                    <div>用户名：<%=user!=null?user.getUserName():""%></div>
                    <div>生日：<%if(user!=null){out.print(user.getUserBirthday());}else{out.print("");}%></div>
                    <div>性别：<%=user!=null?user.getUserSex():""%></div>
                    <h3>高级设置</h3>
                    <div><span class="fl">账号地区：中国</span><a href="#" class="fr" id="edit2">修改</a></div>
                    <div>地址：<%=user!=null?user.getUserAddress():""%></div>
                    <div>电话号码：<%=user!=null?user.getUserPhone():""%></div>
                </div>
            </div>
        </div>
    </div>
</div><!--遮罩-->
<div class="mask"></div><!--编辑弹框-->
<div class="bj">
    <div class="clearfix"><a href="#" class="fr gb"><img src="<%=basePath%>img/icon4.png"/></a></div>
    <h3>编辑基础资料</h3>
    <form action="<%=basePath%>user/updateUser" method="post" id="form1">
        <p id="hide"><label>用户ID：</label><input type="text" name="userId" value="<%=user!=null?String.valueOf(user.getUserId()):""%>"/></p>
        <p><label>用户名：</label><input type="text" name="userName" value="<%=user!=null?user.getUserName():""%>"/></p>
        <p><label>生日：</label><input type="date" name="userBirthday" value="<%if(user!=null){out.print(user.getUserBirthday());}else{out.print("");}%>"/></p>
        <p><label>性别：</label><span><input type="radio" name="userSex" value="男" checked="checked"/>男</span><span><input type="radio" name="userSex" value="女"/>女</span></p>
        <div class="bc"><input type="button" id="submit1" value="保存"/><input type="button" value="取消" class="no"/></div>
    </form>
</div><!--高级设置修改-->
<div class="xg">
    <div class="clearfix"><a href="#" class="fr gb"><img src="<%=basePath%>img/icon4.png"/></a></div>
    <h3></h3>
    <form action="<%=basePath%>user/updateUser" method="post" id="form2">
        <p><label>切换账号地区：</label><select><option value="中国">中国</option><option value="海外">海外</option></select></p>
        <p id="hide1"><label>ID：</label><input type="text" id="id" readonly="readonly" name="userId" value="<%=user!=null?String.valueOf(user.getUserId()):""%>"/></p>
        <p><label>地址：</label><input type="text" name="userAddress" value="<%=user!=null?user.getUserAddress():""%>"/></p>
        <p><label>手机号码：</label><input type="text" name="userPhone" value="<%=user!=null?user.getUserPhone():""%>"/></p>
        <div class="bc"><input type="button" value="保存" id="submit2"/><input type="button" value="取消" class="no"/></div>
    </form>
</div><!--修改头像-->
<div class="avatar">
    <div class="clearfix"><a href="#" class="fr gb"><img src="<%=basePath%>img/icon4.png"/></a></div>
    <h3>修改头像</h3>
    <form action="<%=basePath %>singleFileUpload.do" method="post" enctype="multipart/form-data"><h4>请上传图片</h4><input type="file" name="uploadFile" id="2" >
        <input type="text" name="userId" value="<%=user!=null?String.valueOf(user.getUserId()):""%>" style="display: none"><p>jpg或png，大小不超过2M</p><input type="submit" value="提交"/></form>
</div>
<%@include file="foot.jsp" %>

<script>
    $(function (){
        var $user ="<%=user%>";
        $("#submit1").click(function (){
            if($user=="null"){
                alert("请先登录后操作！");
            }else{
                $("#form1").submit();
            }
        })
        $("#submit2").click(function (){
            if($user=="null"){
                alert("请先登录后操作！");
            }else{
                $("#form2").submit();
            }
        })


    })
</script>
