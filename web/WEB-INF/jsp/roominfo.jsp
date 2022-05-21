<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="cn.RoomManagement.pojo.Room" %>
<%@ page import="cn.RoomManagement.tools.Constants" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/7
  Time: 9:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>商品详情 - 民宿短租管理系统</title>
</head>
<body>
<div align="right">
    <a href="/returnframe.html">返回</a>
</div>
    <form method="post" action="/do_roominfo.html">
        <table align="center">
            <tr><td>房间图片：</td><td><img src="${roominfoSession.roomimage}" width="170" height="170" style="display:inline-block;"></td></tr>
            <tr><td>房间名字：</td><td>${roominfoSession.roomname}</td></tr>
            <tr><td>价格：</td><td>${roominfoSession.roomprice}元/天</td></tr>
            <tr><td>房间描述：</td><td>${roominfoSession.roomdescription}</td></tr>
            <tr><td>房间地址：</td><td>${roominfoSession.roomaddress}</td></tr>
            <tr><td>房间所有者：</td><td>${roominfoSession.roommaster}</td></tr>
            <tr><td><input type="submit" value="购买"></td></tr>
        </table>
    </form>
<br>
<h2 align="center">留言评价</h2>
<table align="center">
    <c:forEach items="${evaluteSession}" var="evalute">
        <tr><td>用户编号:</td><td>${evalute.userid}</td></tr>
        <tr><td>留言内容:</td><td>${evalute.message}</td></tr>
    </c:forEach>
</table>
</body>
</html>
