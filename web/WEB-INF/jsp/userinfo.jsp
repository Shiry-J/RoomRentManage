<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/4
  Time: 13:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户信息 - 民宿短租管理系统</title>
</head>
<body>
<%@include file="before_jsp/head.jsp"%><br>
<form align="center">
<h1 align="center">个人信息</h1>
<div>
    账号：${userSession.username}
</div>
<div>
    身份：普通用户
</div>
<div>
    电话：${userSession.phone}
</div>
<div>
    邮箱:${userSession.email}
</div>
<div>
    <a href="${pageContext.request.contextPath}/Register_roommaster.html">成为房东？</a>
</div>
<div>
    <a href="${pageContext.request.contextPath}/Register_cleanner.html">成为清洁人员？</a>
</div>
</form>
</body>
</html>
