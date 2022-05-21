<%--
  Created by IntelliJ IDEA.
  cn.RoomManagement.pojo: hp
  Date: 2021/5/31
  Time: 10:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册 - 民宿短租管理系统</title>
    <title>无标题文档</title>
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
            height: 700px;
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
            top: 10px;
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
<form action="${pageContext.request.contextPath}/doregister.html" method="post" align="center" name="registerform" id="registerform">
    <div class="login-box">
        <h1>注册</h1>
        <div class="input-box">
            <div class="input-text">
                <span><img src="/statics/img/用户.png" width="17px"></span>
                <input type="text" name="username" id="username" placeholder="请输入用户名" onblur="checkUsername()">
            </div>
            <div class="input-text">
                <span><img src="/statics/img/密码.png" width="20px"></span>
                <input type="password" name="password1" id="password1" placeholder="请输入密码" onblur="checkPWD1()">
            </div>
            <div class="input-text">
                <span><img src="/statics/img/确认密码.png" width="20px"></span>
                <input type="password" name="password2" id="password2" placeholder="重复密码" onblur="checkPWD2()">
            </div>
            <div class="input-text">
                <span><img src="/statics/img/手机.png" width="20px"></span>
                <input type="text" name="phone" id="phone" placeholder="请输入手机号" onblur="checkPhone()">
            </div>
            <div class="input-text">
                <span><img src="/statics/img/邮箱.png" width="15px"></span>
                <input type="text" name="email" id="email" placeholder="请输入邮箱地址"  onblur="checkEmail()">
            </div>
            <div class="input-btn">
                <input type="submit" value="注册">
            </div>
            <div class="sgin-up">
                已有账户？<a href="${pageContext.request.contextPath}/exit.html">返回</a>
            </div>
        </div>
    </div>
</form>
</body>
<script type="text/javascript">
    function checkUsername() {
        var username = registerform.username.value;
        if (username == "" || username == null) {
            alert("账号不能为空");
        }
    }
    function checkPWD1(){
        var pwd1 = registerform.password1.value;
        if (pwd1 == "" || pwd1 == null) {
            alert("密码不能为空");
        }
    }
    function checkPWD2(){
        var pwd1 = registerform.password1.value;
        var pwd2 = registerform.password2.value;
        if (pwd2 == "" || pwd2 == null) {
            alert("请输入重复密码");
        }
        else if (pwd1 != pwd2) {
            alert("两次密码输入不一致，请重新输入！");
        }
    }
    function checkPhone(){
        var phone = registerform.phone.value;
        if (phone == "" || phone == null) {
            alert("手机号不能为空");
        }
        else if (phone.length != 11) {
            alert("手机号格式不正确")
        }
    }
    function checkEmail(e) {
        var email = registerform.email.value;
        var emailcheck = /^\w+@[a-z0-9]+(\.[a-z]+){1,3}$/;
        if (email == "" || email == null) {
            alert("邮箱地址不能为空");
        }
        else if (!emailcheck.test(email)) {
            alert("邮箱地址格式不正确");
        }
    }
</script>
</body>
</html>
