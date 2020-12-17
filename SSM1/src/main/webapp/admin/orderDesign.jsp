<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<!doctype html>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
    <script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
    <%--    <script src="<%=basePath%>/js/user.js" type="text/javascript" charset="utf-8"></script>--%>
</head>
<%@include file="managerHead.jsp"%>
<div class="container clearfix">
    <%@include file="managerLeft.jsp"%>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/design.jsp">后台管理</a><span class="crumb-step">&gt;</span><span class="crumb-name">订单管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab" >
                        <tr>

                            <th width="70">关键字:</th>
                            <td><input class="common-text" placeholder="关键字" name="keywords" value="" id="" type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <button id="update" style="float: right;margin-right: 20px;margin-top: 4px;display: none">确认修改</button>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%" id="tt">
                        <tr>
                            <th class="tc" width="3%"><input class="allChoose" name="" type="checkbox"></th>
                            <th width="8%">订单ID</th>
                            <th width="8%">用户ID</th>
                            <th width="8%">用户名</th>
                            <th width="10%">订单金额</th>

                            <th>订单创建时间</th>
                            <th>订单详情</th>
                            <th width="5%">操作</th>
                        </tr>
                        <div class="mask"></div>
                        <div class="tipDel"><p>确定要删除该订单吗？</p>
                            <p class="clearfix"><a class="fl cer" href=#">确定</a><a class="fr cancel" href="#">取消</a></p></div>


                    </table>
                    <div class="list-page"> 2 条 1/1 页</div>
                </div>
            </form>
        </div>


    </div>
    <!--/main-->
</div>
</body>
</html>
<script>
    $(function (){

        var mes = "<%=request.getParameter("msg")%>";
        if (mes!=null&&mes!=="null"){
            alert(mes);
        }
        $.ajax({
            url: "<%=basePath%>order/adminShow",
            type: "post",
            success: function (data){
                var table = "";

                $.each(data,function (i,n){
                    var array = new Array();
                    $.each(n.orderdetails,function (i,item){
                        var obj = {
                            "name": item.showName,
                            "price": item.showPrice,
                            "num": item.showNum,
                            "pic":  item.showPic
                        }
                        array.push(obj);
                    })
                    table += "<tr>\n" +
                        "                            <td class=\"tc\"><input name=\"id[]\" value=\"59\" class='ss' type=\"checkbox\"></td>" +
                        "<td id='orderId'>" + n.orderId +  "</td>" +
                        "<td id='userId'>" + n.userId +  "</td>" +
                        "<td id='userName'>" + n.userName +  "</td>" +
                        "<td id='cost'>" + n.cost +  "</td>" +
                        "<td id='orderCreateTime'>" + n.orderCreateTime +  "</td>" +
                        "<td id='detail'>"  +  "  <a class='dd' href='<%=basePath%>admin/orderdetail.jsp?orderId="+n.orderId+"&userName="+n.userName+
                        "&show="+JSON.stringify(array)+"'>(点击查看详情)</a></td>" +
                        "<td>\n" +
                        "                                <a class=\"link-del\" >删除</a>\n" +
                        "                            </td></tr>"
                })

                $("#tt").append(table);
            }
        })
        var msg = "${msg}";
        if(msg!==""){
            alert(msg);
        }

        $(document).on('click', '.link-del' ,function(){
            var s = $(this).parents().siblings("#orderId").html();
            $(".mask").show();
            $(".tipDel").show();

            $(document).on('click','.cer',function (){
                $(location).attr('href','<%=basePath%>order/delete?orderId='+s);
            })

            $(document).on('click','.cancel',function (){
                $(".mask").hide();
                $(".tipDel").hide();
            })

        })

        $(document).on('click', 'input[type="checkbox"]' ,function(){
            var f = $(this).is(":checked");
            var e = $(this).hasClass("allChoose");
            if (f) {
                if (e) {
                    $("input[type='checkbox']").each(function () {
                        this.checked = true
                    });}} else {
                if (e) {
                    $("input[type='checkbox']").each(function () {
                        this.checked = false
                    });}}
        })

        $("#batchDel").click(function (){
            var array = new Array();
            $.each($(".ss"),function (i,n){
                if (n.checked===true){
                    array.push($(this).parent().siblings("#orderId").html());
                }
            })
            $(location).attr('href','<%=basePath%>order/deleteSome?showIds='+JSON.stringify(array));
        })


    })
</script>