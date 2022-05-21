<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/15
  Time: 17:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>清洁委托 - 民宿短租管理系统</title>
</head>
<body>
<div align="right"><a href="/returnRoomCartManage.html">返回</a></div>
<table align="center">
    <tr><td>未被接取的清洁委托</td></tr>
    <tr>
        <td>订单编号</td>
        <td>清洁房间编号</td>
        <td>清洁地址</td>
        <td>价格</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${noneingcleanercartSession}" var="cleanercart">
        <tr align="center">
            <td align="center" style="color: green">${cleanercart.id}</td>
            <td align="center" style="color: green">${cleanercart.roomid}</td>
            <td align="center" style="color: green">${cleanercart.roomaddress}</td>
            <td align="center" style="color: green">${cleanercart.price}</td>
            <td align="center">
                <a href="/deletecleancart.html">删除</a>
            </td>
        </tr>
    </c:forEach>
    <tr><td>进行中的清洁委托</td></tr>
    <tr>
        <td>订单编号</td>
        <td>清洁房间编号</td>
        <td>清洁地址</td>
        <td>清洁人员</td>
        <td>价格</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${ingcleanercartSession}" var="cleanercart">
        <tr align="center">
            <td align="center" style="color: green">${cleanercart.id}</td>
            <td align="center" style="color: green">${cleanercart.roomid}</td>
            <td align="center" style="color: green">${cleanercart.roomaddress}</td>
            <td align="center" style="color: green">${cleanercart.cleaner}</td>
            <td align="center" style="color: green">${cleanercart.price}</td>
            <td align="center">等待清洁完成</td>
        </tr>
    </c:forEach>
    <tr><td>已完成的清洁委托</td></tr>
    <tr>
        <td>订单编号</td>
        <td>清洁房间编号</td>
        <td>清洁地址</td>
        <td>清洁人员</td>
        <td>价格</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${endcleanercartSession}" var="cleanercart">
        <tr align="center">
            <td align="center" style="color: green">${cleanercart.id}</td>
            <td align="center" style="color: green">${cleanercart.roomid}</td>
            <td align="center" style="color: green">${cleanercart.roomaddress}</td>
            <td align="center" style="color: green">${cleanercart.cleaner}</td>
            <td align="center" style="color: green">${cleanercart.price}</td>
            <td><a href="/deletecleancart.html?id=${cleanercart.id}">删除</a></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
