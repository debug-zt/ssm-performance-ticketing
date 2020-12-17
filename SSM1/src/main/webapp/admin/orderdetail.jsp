<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    String show = request.getParameter("show");
%>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/myorder.css"/>
    <script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<%--    <script src="<%=basePath%>/js/user.js" type="text/javascript" charset="utf-8"></script>--%>
</head>
<%@include file="managerHead.jsp"%>
<div class="container clearfix">
    <%@include file="managerLeft.jsp"%>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/design.jsp">后台管理</a>
                <span class="crumb-step">&gt;</span><a href="<%=basePath%>admin/orderDesign.jsp">订单管理</a><span class="crumb-step">&gt;</span><span class="crumb-name">订单详情</span></div>
        </div>
<%--        <div class="search-wrap">--%>
<%--            <div class="search-content">--%>
<%--                <form action="#" method="post">--%>
<%--                    <table class="search-tab" >--%>
<%--                        <tr>--%>
<%--                            <th width="120">选择分类:</th>--%>
<%--                            <td>--%>
<%--                                <select name="search-sort" id="">--%>
<%--                                    <option value="">全部</option>--%>
<%--                                    <option value="19">精品界面</option><option value="20">推荐界面</option>--%>
<%--                                </select>--%>
<%--                            </td>--%>
<%--                            <th width="70">关键字:</th>--%>
<%--                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>--%>
<%--                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>--%>
<%--                        </tr>--%>
<%--                    </table>--%>
<%--                </form>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--        <div class="result-wrap">--%>
<%--            <form name="myform" id="myform" method="post">--%>
<%--                <div class="result-title">--%>
<%--                    <div class="result-list">--%>
<%--                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>--%>
<%--                        <button id="update" style="float: right;margin-right: 20px;margin-top: 4px;display: none">确认修改</button>--%>
<%--                    </div>--%>
<%--                </div>--%>

<%--            </form>--%>
<%--        </div>--%>
        <div class="Bott">
            <div class="wrapper clearfix">

                <div class="you fl">
                    <div class="my clearfix"><h2>订单详情</h2>
                        <h3>订单号：<%=request.getParameter("orderId")%><span id="num"></span></h3></div>
                    <div class="orderList">
                        <div class="orderList1" id="orderList1"><h3>已收货</h3>

                        </div>
                        <div class="orderList1"><h3>收货信息</h3>
                            <p>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span><%=request.getParameter("userName")%></span></p>
                            </div>
                        <div class="orderList1"><h3>支付方式及送货时间</h3>
                            <p>支付方式：<span>在线支付</span></p>
                            <p>送货时间：<span>不限送货时间</span></p></div>
                        <div class="orderList1 hei"><h3><strong>商品总价：</strong><span class="price">¥</span></h3>
                            <p><strong>运费：</strong><span>¥0</span></p>
                            <p><strong>订单金额：</strong><span class="price">¥</span></p>
                            <p><strong>实付金额：</strong><span class="price">¥</span></p></div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>
<script>
    $(function (){
        var data = eval(<%=show%>);
        var table = "";
        var totalPrice = 0;
        for(var i=0;i<data.length;i++){
            table += "<div class=\"clearfix\"><a href=\"#\" class=\"fl\"><img src='"+data[i].pic+"' width='75' height='75'/></a>\n" +
                "                        <p class=\"fl\"><a href=\"#\">"+ data[i].name +"</a><a href=\"#\">¥"+ data[i].price +"×"+data[i].num+"</a></p></div><br>"
            totalPrice += (data[i].price*data[i].num);
        }
        $("#orderList1").append(table);
        $(".price").append(totalPrice.toFixed(2));
    })
</script>
