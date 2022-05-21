<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/13
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>订单 - 民宿短租管理系统</title>
</head>
<body>
<%@include file="before_jsp/head.jsp"%><br>
<table align="center">
    <tr><td><h2>进行中的订单：</h2></td></tr>
    <tr>
        <td align="center">订单编号</td>
        <td align="center">房间编号</td>
        <td align="center">用户编号</td>
        <td align="center">价格</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${cartonSession}" var="cart">
        <tr align="center">
            <td align="center" style="color: green">${cart.id}</td>
            <td align="center" style="color: green">${cart.roomid}</td>
            <td align="center" style="color: black">${cart.userid}</td>
            <td align="center" style="color: red">${cart.price}</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${cart.roomid}">查看房间详情页</a>
            </td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/finishcart.html?id=${cart.id}">完成</a>
            </td>
        </tr>
    </c:forEach>
    <tr><td><h2>已完成的订单：</h2></td></tr>
    <tr>
        <td align="center">订单编号</td>
        <td align="center">房间编号</td>
        <td align="center">用户编号</td>
        <td align="center">价格</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${cartoffSession}" var="cart">
        <tr align="center">
            <td align="center" style="color: green">${cart.id}</td>
            <td align="center" style="color: green">${cart.roomid}</td>
            <td align="center" style="color: black">${cart.userid}</td>
            <td align="center" style="color: red">${cart.price}</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${cart.roomid}">查看房间详情页</a>
            </td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/evaluteroom.html?id=${cart.id}">留言评价</a>
            </td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/deletecart.html?id=${cart.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
