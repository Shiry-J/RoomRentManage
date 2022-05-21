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
    <title>房东 - 民宿短租管理系统</title>
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
    </tr>
    <tr>
        <td><h2>已上架的房间</h2></td>
    </tr>
    <tr align="center">
        <td align="center">房间id</td>
        <td align="center">图片</td>
        <td align="center">名称</td>
        <td align="center">描述</td>
        <td align="center">最后一次上架日期</td>
        <td align="center">地址</td>
        <td align="center">价格</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${roomonSession}" var="room">
        <tr align="center">
            <td align="center" style="color: green">${room.id}</td>
            <td align="center">
                    <img src="${room.roomimage}" width="170" height="170" style="display:inline-block;">
            </td>
            <td align="center" style="color: green">${room.roomname}</td>
            <td align="center" style="color: black">${room.roomdescription}</td>
            <td align="center" style="color: red">${room.roomdate}</td>
            <td align="center" style="color: red">${room.roomaddress}</td>
            <td align="center" style="color: red">${room.roomprice}元</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">查看房间详情页</a>
            </td>
            <td align="center">
                <a href="/modifyroom.html?id=${room.id}">修改</a>
            </td>
            <td align="center">
                <a href="/offroom.html?id=${room.id}">下架</a>
            </td>
            <td align="center">
                <a href="/deleteroom.html?id=${room.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
    <tr>
        <td><h2>已下架的房间</h2></td>
    </tr>
    <tr align="center">
        <td align="center">房间id</td>
        <td align="center">图片</td>
        <td align="center">名称</td>
        <td align="center">描述</td>
        <td align="center">最后一次上架日期</td>
        <td align="center">地址</td>
        <td align="center">价格</td>
        <td align="center">操作</td>
    </tr>
    <c:forEach items="${roomoffSession}" var="room">
        <tr align="center">
            <td align="center" style="color: green">${room.id}</td>
            <td align="center">
                <img src="${room.roomimage}" width="170" height="170" style="display:inline-block;">
            </td>
            <td align="center" style="color: green">${room.roomname}</td>
            <td align="center" style="color: black">${room.roomdescription}</td>
            <td align="center" style="color: red">${room.roomdate}</td>
            <td align="center" style="color: red">${room.roomaddress}</td>
            <td align="center" style="color: red">${room.roomprice}元</td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">查看房间详情页</a>
            </td>
            <td align="center">
                <a href="/modifyroom.html?id=${room.id}">修改</a>
            </td>
            <td align="center">
                <a href="/onroom.html?id=${room.id}">上架</a>
            </td>
            <td align="center">
                <a href="/deleteroom.html?id=${room.id}">删除</a>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
