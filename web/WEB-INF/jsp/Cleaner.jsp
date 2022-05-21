<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/11
  Time: 22:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>清洁人员 - 民宿短租管理系统</title>
</head>
<body>
<div><a href="/returnframe.html">返回</a></div>
<table align="center">
    <tr><td>可接取的清洁委托</td></tr>
    <tr>
        <td>订单编号</td>
        <td>清洁房间编号</td>
        <td>清洁地址</td>
        <td>价格</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${nonecleanerSession}" var="cleanercart">
        <tr align="center">
            <td align="center" style="color: green">${cleanercart.id}</td>
            <td align="center" style="color: green">${cleanercart.roomid}</td>
            <td align="center" style="color: green">${cleanercart.roomaddress}</td>
            <td align="center" style="color: green">${cleanercart.price}</td>
            <td align="center">
                <a href="/accepttask.html?id=${cleanercart.id}">接取</a>
            </td>
        </tr>
    </c:forEach>
    <tr><td>进行中的清洁委托</td></tr>
    <tr>
        <td>订单编号</td>
        <td>清洁房间编号</td>
        <td>清洁地址</td>
        <td>价格</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${ingcleanerSession}" var="cleanercart">
        <tr align="center">
            <td align="center" style="color: green">${cleanercart.id}</td>
            <td align="center" style="color: green">${cleanercart.roomid}</td>
            <td align="center" style="color: green">${cleanercart.roomaddress}</td>
            <td align="center" style="color: green">${cleanercart.price}</td>
            <td align="center"><a href="/endtask.html?id=${cleanercart.id}">完成</a></td>
        </tr>
    </c:forEach>
    <tr><td>已完成的清洁委托</td></tr>
    <tr>
        <td>订单编号</td>
        <td>清洁房间编号</td>
        <td>清洁地址</td>
        <td>价格</td>
    </tr>
    <c:forEach items="${endcleanerSession}" var="cleanercart">
        <tr align="center">
            <td align="center" style="color: green">${cleanercart.id}</td>
            <td align="center" style="color: green">${cleanercart.roomid}</td>
            <td align="center" style="color: green">${cleanercart.roomaddress}</td>
            <td align="center" style="color: green">${cleanercart.price}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
