<%@ page import="com.google.gson.Gson" %>
<%@ page import="com.ssm.bean.User" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    Cookie[] cookiesHead = request.getCookies();
    User user = null;
    if(cookiesHead != null){
        for(int i=0;i<cookiesHead.length;i++){
            if(cookiesHead[i].getName().equals("user")){
                Gson gsonHead = new Gson();
                String value = URLDecoder.decode(cookiesHead[i].getValue(),"utf-8");
                user = gsonHead.fromJson(value,User.class);
                break;
            }
        }
    }
%>
<script>
    $(function() {
        $("#exit").click(function(user)
        {//为了删除指定名称的cookie，可以将其过期时间设定为一个过去的时间

            var date = new Date();
            date.setTime(date.getTime() - 10000);
            document.cookie = user + "=a; expires=" + date.toGMTString();})
    })
</script>

<body><!------------------------------head------------------------------>
<div class="head">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top"><h1 class="fl"><a href="<%=basePath%>index.jsp"><img src="<%=basePath%>img/XiaoMaiLogo1.jpg" height="79", width="219"/></a></h1>
            <div class="fr clearfix" id="top1">
                <p class="fl" id="loginStatus">
                </p>
                <script>
                    var status = "";
                    <%
                        String statusGram = "";
                        if (user != null){
                            statusGram += "<a href=\"" + basePath + "userhost.jsp\">" + user.getUserName() + "</a>" +
                             "<a href=\"" + basePath + "user/exit\">退出登录</a>";
                        }else {
                            statusGram += "<a href=\"" + basePath + "login.jsp\" id=\"login\">登录</a>" +
                    "                    <a href=\"" + basePath + "register.jsp\" id=\"reg\">注册</a>";
                        }
                    %>

                    status = '<%=statusGram%>';
                    console.log(status);
                    document.getElementById("loginStatus").innerHTML = status;



                </script>
                <form id="searchForm" action="<%=basePath%>searchResult.jsp" method="get" class="fl"><input type="text" name="keyWord" size="15" placeholder="搜索" id="keyWord"/><input type="button" onclick="searchSubmitClick()"/></form>
                <script type="text/javascript">
                    function searchSubmitClick(){
                        if (document.getElementById("keyWord").values == null){
                            alert("请输入搜索关键词");
                            return;
                        }
                        document.getElementById("searchForm").submit();
                    }
                </script>
                <div class="btn fl clearfix"><a href="<%=basePath%>userhost.jsp"><img src="<%=basePath%>img/grzx.png"/></a>
                    <a href="<%=basePath%>cart.jsp"><img src="<%=basePath%>img/gwc.png"/></a>
                </div>
            </div>
        </div>
        <ul class="clearfix" id="bott">
            <li><a href="<%=basePath%>index.jsp">首页</a></li>
            <li><a href="<%=basePath%>allShow.jsp">所有演出</a></li>
            <li><a href="<%=basePath%>searchResult.jsp?keyWord=演唱会">演唱会</a></li>
            <li><a href="<%=basePath%>searchResult.jsp?keyWord=音乐剧">音乐剧</a></li>
            <li><a href="<%=basePath%>searchResult.jsp?keyWord=脱口秀">脱口秀</a></li>
            <li><a href="<%=basePath%>searchResult.jsp?keyWord=体育赛事">体育赛事</a></li>
            <li><a href="<%=basePath%>searchResult.jsp?keyWord=儿童卡通">儿童卡通</a></li>
            <li><a href="<%=basePath%>searchResult.jsp?keyWord=舞蹈演出">舞蹈演出</a></li>
        </ul>
    </div>
</div>

