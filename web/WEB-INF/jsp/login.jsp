<%--
  Created by IntelliJ IDEA.
  cn.RoomManagement.pojo: hp
  Date: 2021/5/31
  Time: 10:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>系统登录 - 民宿短租管理系统</title>
    <style>
        *{
            padding:0;
            margin:0;
            box-sizing:border-box;
        }
        body{
            display: flex;
            justify-content: center;
            align-items: center;
            width:100%;
            min-height: 100vh;
            background: url("/statics/img/1235.jpeg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
            overflow: hidden;
        }
        .login-box{
            display: flex;
            justify-content: center;
            align-content: space-around;
            flex-wrap: wrap;
            width: 500px;
            height: 600px;
            background-color: rgba(0,0,0,0.5);
            border: 10px;
            padding: 20px 50px;
            border-radius: 20px;
        }
        .login-box h1{
            width: 100%;
            display: flex;
            justify-content: center;
            color: #fff;
            font-size: 40px;
        }
        .login-box .input-box{
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items:center;
            position: relative;
            top: -20px;
        }
        .login-box .input-box .input-text{
            width: 100%;
            display: flex;
            justify-content: center;
            zoom:140%
        }
        .login-box .input-box .input-text span{
            color:white;
            font-size: 18px;
            margin-top: 30px;
        }
        .login-box .input-box .input-text input{
            border: 0;
            padding: 6px;
            border-bottom: 1px solid #FFFFFF;
            background-color: #FFFFFF00;
            color: #FFFFFF;
            margin-top: 20px;
        }
        .login-box .input-box .input-btn{
            display: flex;
            justify-content: center;
            align-items: center;
            width: 100%;
            margin-top: 40px;
            width: 145px;
            height: 40px;
            color: #FFFFFF;
            background: linear-gradient(120deg,#a6c0fe 0%,#648084 100%);
            border-radius: 25px;
            cursor: pointer;
        }
        .login-box .input-box .input-btn input{
            border: none;
            background-color: transparent;
            color: #FFFFFF;
            font-size: 17px;
        }
        .login-box .input-box .sgin-up{
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 40px;
            color: white;
            font-size: 17px;
        }
        .login-box .input-box .sgin-up a{
            color: #3498db;
            text-decoration: none;
        }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/dologin.html" method="post">
    <div class="login-box">
        <h1>登录</h1>
        <div class="input-box">
            <div class="input-text">
                <span><img src="/statics/img/用户.png" width="17px"></span>
                <input type="text" name="username" placeholder="请输入用户名">
            </div>
            <div class="input-text">
                <span><img src="/statics/img/密码.png" width="20px"></span>
                <input type="password" name="password" placeholder="请输入密码">
            </div>
            <div class="input-btn">
                <input type="submit" value="登录">
            </div>
            <div class="sgin-up">
                还没账户？<a href="${pageContext.request.contextPath}/register.html">立即注册</a>
            </div>
        </div>
    </div>
</form>
</body>
</html>
