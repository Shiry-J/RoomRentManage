<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/14
  Time: 17:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单管理 - 民宿短租管理系统</title>
</head>
<body>
<div align="right">
    欢迎房东，${userSession.username}
    <a href="${pageContext.request.contextPath}/returnframe.html">返回</a>
</div>

<table align="center">
    <tr>
        <td><a href="/addroom.html">新增房间</a></td>
        <td><a href="/RoomCartManage.html">订单管理</a></td>
        <td><a href="/mycleanercart.html">清洁委托</a></td>
    </tr>
    <tr>
        <td><h2>正在进行中的订单</h2></td>
    </tr>
    <tr>
        <td align="center">订单编号</td>
        <td align="center">房间编号</td>
        <td align="center">用户编号</td>
        <td align="center">房东</td>
        <td align="center">价格</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${cartingSession}" var="cart">
        <tr align="center">
            <td align="center" style="color: green">${cart.id}</td>
            <td align="center" style="color: green">${cart.roomid}</td>
            <td align="center" style="color: black">${cart.userid}</td>
            <td align="center" style="color: black">${cart.roommaster}</td>
            <td align="center" style="color: red">${cart.price}</td>
            <td align="center">等待用户确认</td>
        </tr>
    </c:forEach>
    <tr>
        <td><h2>已完成的订单</h2></td>
    </tr>
    <tr>
        <td align="center">订单编号</td>
        <td align="center">房间编号</td>
        <td align="center">用户编号</td>
        <td align="center">房东</td>
        <td align="center">价格</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${cartendSession}" var="cart">
        <tr align="center">
            <td align="center" style="color: green">${cart.id}</td>
            <td align="center" style="color: green">${cart.roomid}</td>
            <td align="center" style="color: black">${cart.userid}</td>
            <td align="center" style="color: black">${cart.roommaster}</td>
            <td align="center" style="color: red">${cart.price}</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${cart.roomid}">查看房间详情页/留言评价</a>
            </td>
            <td align="center">
                <a href="/addcleanercart.html?id=${cart.roomid}">发布清洁委托</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
