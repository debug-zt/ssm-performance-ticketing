<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
    %>
<!-- Viewport metatags -->
<meta name="HandheldFriendly" content="true" />
<meta name="MobileOptimized" content="320" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/dandelion.css"  media="screen" />

<title>404错误页面</title>

</head>

<body>
    
	<!-- Main Wrapper. Set this to 'fixed' for fixed layout and 'fluid' for fluid layout' -->
	<div id="da-wrapper" class="fluid">
    
        <!-- Content -->
        <div id="da-content" style="min-height: 750px">
            
            <!-- Container -->
            <div class="da-container clearfix">
            
            	<div id="da-error-wrapper">
                   	<div id="da-error-pin"></div>
                    <div id="da-error-code">
                    	error <span>404</span>                    </div>
                
                	<h1 class="da-error-heading">哎哟喂！页面让狗狗叼走了！</h1>
                    <p>大家可以到狗狗没有叼过的地方看看！ <a href="<%=basePath%>index.jsp">点击进入首页</a></p>
                </div>
            </div>
        </div>
        <p class="dibu">小麦售票网<br/>
            联系合作电话：400-888-8888</p>
        <!-- Footer -->
<!--        <div id="da-footer">-->
<!--        	<div class="da-container clearfix">-->
<!--           	<p> 2013 17sucai . All Rights Reserved. <a href="http://www.mycodes.net/" target="_blank">源码之家</a></div>-->
<!--        </div>-->
    </div>
    
</body>
</html>