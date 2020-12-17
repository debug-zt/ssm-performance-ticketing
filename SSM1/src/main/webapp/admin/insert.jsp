<%@ page contentType="text/html;charset=UTF-8" pageEncoding="utf-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>
<!doctype html>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>后台管理</title>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/common.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/main.css"/>
    <script src="<%=basePath%>js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
</head>
<%@include file="managerHead.jsp"%>
<div class="container clearfix">
    <%@include file="managerLeft.jsp"%>
    <!--/sidebar-->
    <div class="main-wrap">

        <div class="crumb-wrap">
            <div class="crumb-list"><i class="icon-font"></i><a href="<%=basePath%>admin/design.jsp">后台管理</a><span class="crumb-step">&gt;</span><span>新增作品</span></div>
        </div>
        <div class="result-wrap">
            <div class="result-content">
                <form action="<%=basePath%>show/addShow" method="post" id="myform" name="myform" enctype="multipart/form-data">
                    <table class="insert-tab" width="100%">
                        <tbody><tr>
                            <th width="120"><i class="require-red">*</i>演出分类：</th>
                            <td>
                                <select name="showCate" id="catid" class="required">
                                    <option value="">请选择</option>
                                    <option value="演唱会">演唱会</option><option value="脱口秀">脱口秀</option><option value="体育赛事">体育赛事</option><option value="音乐剧">音乐剧</option>
                                </select>
                            </td>
                        </tr>
                            <tr>
                                <th><i class="require-red">*</i>演出名称：</th>
                                <td>
                                    <input class="common-text required" id="title" name="showName" size="50" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th><i class="require-red">*</i>演出地点：</th>
                                <td><input class="common-text" id="po" name="showPosit" size="50" type="text"></td>
                            </tr>
                        <tr>
                            <th><i class="require-red">*</i>演出时间：</th>
                            <td><input class="common-text" id="time" name="showDate" size="50" type="datetime-local"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>单价：</th>
                            <td><input class="common-text" id="price" name="showPrice" size="50" type="text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>票数：</th>
                            <td><input class="common-text" id="num" name="remainTicket" size="50" type="text"></td>
                        </tr>
                        <tr>
                            <th><i class="require-red">*</i>上传演出图片：</th>
                            <td><input type="file" class="common-text" name="uploadFile" id="2" ><p><font size="1" color="">&nbsp;&nbsp;&nbsp;(jpg或png，大小不超过2M)</font></p></td>
                        </tr>
                            <tr>
                                <th></th>
                                <td>
                                    <input class="btn btn-primary btn6 mr10" value="提交" type="button">
                                    <input class="btn btn6" onClick="history.go(-1)" value="返回" type="button">
                                </td>
                            </tr>
                        </tbody></table>
                </form>
            </div>
        </div>

    </div>
    <!--/main-->
</div>
</body>
</html>
<script>
    $(function (){
        var mes = "${mes}";
        if(mes!=""){
            alert(mes);}

        $(".mr10").click(function (){
            if($("#catid").val()==""){
                alert("请选择演出分类");
            }else if($("#title").val()==""){
                alert("演出名称不能为空！");
            }else if($("#po").val()==""){
                alert("演出地点不能为空！");
            }else if ($("#time").val()==""){
                alert("演出时间不能为空！")
            }else if ($("#price").val()==""){
                alert("演出单价不能为空！");
            }else if ($("#num").val==""){
                alert("演出票数不能为空！");
            }else if ($("#2").val()==""){
                alert("演出封面不能为空！")
            }else {
                $("#myform").submit();
            }
        })
    })

</script>