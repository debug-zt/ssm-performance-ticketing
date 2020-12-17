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
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/design.jsp">后台管理</a><span class="crumb-step">&gt;</span><span class="crumb-name">演出管理</span></div>
        </div>
        <div class="search-wrap">
            <div class="search-content">
                <form action="#" method="post">
                    <table class="search-tab" >
                        <tr>
                            <th width="120">选择分类:</th>
                            <td>
                                <select name="search-sort" id="q">
                                    <option class="Cate" value="">全部</option>
                                    <option class="Cate" value="演唱会">演唱会</option><option class="Cate" value="脱口秀">脱口秀</option><option class="Cate" value="体育赛事">体育赛事</option><option class="Cate" value="音乐剧">音乐剧</option><option class="Cate" value="话剧">话剧</option><option class="Cate" value="舞台剧">舞台剧</option>
                                </select>

                            </td>
                            <th width="70">关键字:</th>
                            <td><input id="st" type="text" class="common-text" placeholder="搜索"/></td>
                            <td><input class="btn btn-primary btn2" value="查询" type="button" ></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
        <div class="result-wrap">
            <form name="myform" id="myform" method="post">
                <div class="result-title">
                    <div class="result-list">
                        <a href="<%=basePath%>admin/insert.jsp"><i class="icon-font"></i>新增演出</a>
                        <a id="batchDel" href="javascript:void(0)"><i class="icon-font"></i>批量删除</a>
                        <button id="update" style="float: right;margin-right: 20px;margin-top: 4px;display: none">确认修改</button>
                    </div>
                </div>
                <div class="result-content">
                    <table class="result-tab" width="100%" id="tt">
                        <tr>
                            <th class="tc" width="3%"><input class="allChoose" name="" type="checkbox"></th>
                            <th width="20%">演出名称</th>
                            <th>ID</th>
                            <th>演出分类</th>
                            <th width="15%">演出时间</th>
                            <th width="15%">演出地点</th>
                            <th>演出价格</th>
                            <th width="5%">剩余票数</th>
                            <th width="5%">操作</th>
                        </tr>
                        <div class="mask"></div>
                        <div class="tipDel"><p>确定要删除该演出吗？</p>
                            <p class="clearfix"><a class="fl cer" href=#">确定</a><a class="fr cancel" href="#">取消</a></p></div>


                    </table>
                    <div class="list-page"> <span id="num"></span> 条 1/1 页</div>
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
        var msg = "<%=request.getParameter("msg")%>";
        if (msg!=null&&msg!="null"){
            alert(msg);
        }

        $.ajax({
            url: "<%=basePath%>show/getAll",
            type: "post",
            success: function (data){
                var table = "";
                $.each(data,function (i,n){
                    table += "<tr>\n" +
                        "                            <td class=\"tc\"><input name=\"id[]\" value=\"59\" class='ss' type=\"checkbox\"></td>" +
                        "<td  id='showName'>" + n.showName +  "</td>" +
                        "<td id='showId'>" + n.showId +  "</td>" +
                        "<td id='showCate'>" + n.showCate +  "</td>" +
                        "<td id='showDate'>" + n.showDate +  "</td>" +
                        "<td id='showPosit'>" + n.showPosit +  "</td>" +
                        "<td id='showPrice'>" + n.showPrice +  "</td>" +
                        // "<td id='showPic'>" + n.showPic +  "</td>" +
                        "<td id='remainTicket'>" + n.remainTicket +  "</td>" +
                        "<td>\n" +
                        "                                <a class=\"link-update\">修改</a><br/>" +
                        "                                <a class=\"link-del\" >删除</a>" +
                        "                            </td></tr>"
                })

                $("#tt").append(table);
                $("#num").append(data.length)
            }
        })
        var msg = "${msg}";
        if(msg!==""){
            alert(msg);
        }

        $(document).on('click', '.link-del' ,function(){
            var s = $(this).parents().siblings("#showId").html();
            $(".mask").show();
            $(".tipDel").show();

            $(document).on('click','.cer',function (){
                location.href="<%=basePath%>show/deleteShow?showId="+s;
            })

            $(document).on('click','.cancel',function (){
                $(".mask").hide();
                $(".tipDel").hide();
            })

        })

        $(document).on('click', '.link-update' ,function(){
            // $(".mask2").show();
            // $(".bj").show()
            $(this).parent().siblings("#showName").html("<input class='show' id='1' value='"+$(this).parent().siblings("#showName").html()+"' size='30' />");
            $(this).parent().siblings("#showCate").html("<select id='2'><option value='演唱会'>演唱会</option><option value='脱口秀'>脱口秀</option><option value='音乐剧'>音乐剧</option><option value='舞台剧'>舞台剧</option><option value='话剧'>话剧</option><option value='体育赛事'>体育赛事</option></select>");
            $(this).parent().siblings("#showDate").html("<input class='show' id='3' type='text' value='"+$(this).parent().siblings("#showDate").html()+"' size='20'/>");
            $(this).parent().siblings("#showPosit").html("<input class='show' id='4' value='"+$(this).parent().siblings("#showPosit").html()+"' size='15' />");
            $(this).parent().siblings("#showPrice").html("<input class='show' id='5' value='"+$(this).parent().siblings("#showPrice").html()+"' size='8' />");
            $(this).parent().siblings("#remainTicket").html("<input class='show' id='6' value='"+$(this).parent().siblings("#remainTicket").html()+"' size='4' />");
            $("#update").css("display","");
        })
        $("#update").click(function (){
            var showName = $("#1").val();
            var showCate = $("#2").val();
            var showDate = $("#3").val();
            var showPosit = $("#4").val();
            var showPrice = $("#5").val();
            var remainTicket = $("#6").val();
            var showId = $("#1").parent().siblings("#showId").html();
            // alert(showPosit+" "+showDate+" "+showId+" "+showPrice+" "+showCate+" "+showName)
            $.ajax({
                url: "<%=basePath%>show/update",
                type: "post",
                data:{
                    "showName":showName,
                    "showCate":showCate,
                    "showDate":showDate,
                    "showPosit":showPosit,
                    "showPrice":showPrice,
                    "remainTicket":remainTicket,
                    "showId":showId
                },
                success:function (data){
                    alert(data);
                }
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
                if (n.checked==true){
                    array.push($(this).parent().siblings("#showId").html());
                }
            })
            $(location).attr('href','<%=basePath%>show/deleteSome?showIds='+JSON.stringify(array));
        })



        $("#q").on("change",function(){
            $.ajax({
                url: "<%=basePath%>show/getShowByC",
                type: "post",
                data: {
                    "showCate": $("option:selected",this).val()
                },
                success: function (data) {
                    var table = "";
                    table += "<tr>\n" +
                        "                            <th class=\"tc\" width=\"3%\"><input class=\"allChoose\" name=\"\" type=\"checkbox\"></th>\n" +
                        "                            <th width=\"20%\">演出名称</th>\n" +
                        "                            <th>ID</th>\n" +
                        "                            <th>演出分类</th>\n" +
                        "                            <th width=\"15%\">演出时间</th>\n" +
                        "                            <th width=\"15%\">演出地点</th>\n" +
                        "                            <th>演出价格</th>\n" +
                        "                            <th>剩余票数</th>\n" +
                        "                            <th width=\"5%\">操作</th>\n" +
                        "                        </tr>";
                    $.each(data, function (i, n) {
                        table +=
                            "<tr>\n" +
                            "                            <td class=\"tc\"><input name=\"id[]\" value=\"59\" class='ss' type=\"checkbox\"></td>" +
                            "<td  id='showName'>" + n.showName + "</td>" +
                            "<td id='showId'>" + n.showId + "</td>" +
                            "<td id='showCate'>" + n.showCate + "</td>" +
                            "<td id='showDate'>" + n.showDate + "</td>" +
                            "<td id='showPosit'>" + n.showPosit + "</td>" +
                            "<td id='showPrice'>" + n.showPrice + "</td>" +
                            // "<td id='showPic'>" + n.showPic +  "</td>" +
                            "<td id='remainTicket'>" + n.remainTicket + "</td>" +
                            "<td>\n" +
                            "                                <a class=\"link-update\">修改</a><br/>" +
                            "                                <a class=\"link-del\" >删除</a>" +
                            "                            </td></tr>"
                    })

                    $("#tt").html("");
                    $("#tt").append(table);
                    $("#num").html("");
                    $("#num").append(data.length)
                }
            })
        })

        $(".btn2").click(function(){
            $.ajax({
                url: "<%=basePath%>show/search2",
                type: "post",
                data: {"keyWord":$("#st").val()
                },
                success: function (data){
                    var table = "";
                    $.each(data,function (i,n){
                        table += "<tr>\n" +
                            "                            <td class=\"tc\"><input name=\"id[]\" value=\"59\" class='ss' type=\"checkbox\"></td>" +
                            "<td  id='showName'>" + n.showName +  "</td>" +
                            "<td id='showId'>" + n.showId +  "</td>" +
                            "<td id='showCate'>" + n.showCate +  "</td>" +
                            "<td id='showDate'>" + n.showDate +  "</td>" +
                            "<td id='showPosit'>" + n.showPosit +  "</td>" +
                            "<td id='showPrice'>" + n.showPrice +  "</td>" +
                            // "<td id='showPic'>" + n.showPic +  "</td>" +
                            "<td id='remainTicket'>" + n.remainTicket +  "</td>" +
                            "<td>\n" +
                            "                                <a class=\"link-update\">修改</a>\n" +
                            "                                <a class=\"link-del\" >删除</a>\n" +
                            "                            </td></tr>"
                    })

                    $("#tt").html("");
                    $("#tt").append(table);
                    $("#num").html("");
                    $("#num").append(data.length)
                }
            })

        })
    })


</script>