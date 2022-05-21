<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/4
  Time: 14:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>房东申请 - 民宿短租管理系统</title>
</head>
<body>
<div align="right">
    <a href="${pageContext.request.contextPath}/returnframe.html">首页</a>
    <a href="${pageContext.request.contextPath}/returnuserinfo.html">返回</a>
</div>
<form action="${pageContext.request.contextPath}/doRegister_roommaster.html" method="post" align="center" name="register_form" id="register_form">
    <h1 align="center">房东申请</h1>
    <div class="info" style="color: #ff0000">${register_roommaster_error}</div>
    <tr>
        <td>账  号:</td><td>${userSession.username}</td>
    </tr>
    <br>
    <tr>
        <td>电  话:</td><td>${userSession.phone}</td>
    </tr>
    <br>
    <tr>
        <td>邮  箱:</td><td>${userSession.email}</td>
    </tr>
    <br>
    <tr>
        <td>实名信息:</td><td><input type="text" name="idcard" id="idcard" style="width:193px;" placeholder="请输入实名信息" onblur="checkidcard()"></td>
    </tr>
    <br>
    <tr>
        <td>地址:</td><td><input type="text" name="address" id="address" style="width:193px;" placeholder="请输入地址" onblur="checkaddress()"></td>
    </tr>
    <br>
    <tr>
        <td>
            <input type="reset" value="重置">
            <input type="submit" value="申请">
        </td>
    </tr>
</form>
</body>
</html>

<script type="text/javascript">
    function checkidcard() {
        var idcard = register_form.idcard.value;
        if (idcard == "" || idcard == null) {
            alert("实名信息不能为空");
        }
        else if(!/^\d{15}|\d{18}|\d{17}(\d|X|x)$/i.test(idcard)){
            alert("实名信息有误");
        }
    }

    function checkaddress() {
        var address = register_form.address.value;
        if (address == "" || address == null) {
            alert("地址不能为空");
        }
    }
</script>
