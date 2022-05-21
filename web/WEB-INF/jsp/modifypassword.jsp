<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/7
  Time: 8:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改密码 - 民宿短租管理系统</title>
</head>
<body>
<div align="right"><a href="${pageContext.request.contextPath}/returnframe.html">返回</a></div>
<form align="center" action="${pageContext.request.contextPath}/doModfyPassword.html" method="post" align="center">
    <h1 align="center">修改密码</h1>
    <div class="info" style="color: #ff0000">${doModifyPassword_error}</div>
    <div>
        账号：${userSession.username}
    </div>
    <div>
        旧密码：<input type="password" name="password" id="password" placeholder="请输入旧密码">
    </div>
    <div>
        新密码:<input type="password" name="password1" id="password1" placeholder="请输入新密码">
    </div>
    <div>
        再次输入密码:<input type="password" name="password2" id="password2" placeholder="请再次输入密码">
    </div>
    <div>
        <input type="reset" value="重置">
        <input type="submit" value="修改密码">
    </div>
</form>
</body>
</html>
