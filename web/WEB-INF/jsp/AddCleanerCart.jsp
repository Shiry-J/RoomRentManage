<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/15
  Time: 19:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>发布清洁委托 - 民宿短租管理系统</title>
</head>
<body>
<form action="/do_addcleanercart.html" method="post">
    <table align="center">
        <tr><td>发布者:</td><td>${userSession.username}</td></tr>
        <tr><td>房间编号:</td><td>${addcleanercartSession.id}</td></tr>
        <tr><td>地址:</td><td>${addcleanercartSession.roomaddress}</td></tr>
        <tr><td>价格:</td><td><input type="text" name="price"></td></tr>
        <tr><td><input type="submit" value="确认发布"></td></tr>
    </table>
</form>
</body>
</html>
