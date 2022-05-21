<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/14
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>留言评价 - 民宿短租管理系统</title>
</head>
<body>
<form method="post" action="/do_evalute.html">
    <table align="center">
        <tr><td>房间信息:</td></tr>
        <tr><td>图片：</td><td><img src="${roomcartSession.roomimage}" width="170" height="170" style="display:inline-block;"></td></tr>
        <tr><td>房间名字：</td><td>${roomcartSession.roomname}</td></tr>
        <tr><td>价格：</td><td>${roomcartSession.roomprice}元/天</td></tr>
        <tr><td>房间描述：</td><td>${roomcartSession.roomdescription}</td></tr>
        <tr><td>房间地址：</td><td>${roomcartSession.roomaddress}</td></tr>
        <tr><td>房间所有者：</td><td>${roomcartSession.roommaster}</td></tr>
        <tr><td>订单信息:</td></tr>
        <tr><td>订单编号：</td><td>${cartSession.id}</td></tr>
        <tr><td>房间编号：</td><td>${cartSession.roomid}</td></tr>
        <tr><td>用户编号：</td><td>${cartSession.userid}</td></tr>
        <tr><td>价格：</td><td>${cartSession.price}</td></tr>
        <tr>
            <td>评价内容：</td>
            <td><input type="text" name="message" id="message" style="width: 400px;height: 200px"></td>
        </tr>
        <tr><td><input type="submit" value="提交"></td></tr>
    </table>
</form>
</body>
</html>
