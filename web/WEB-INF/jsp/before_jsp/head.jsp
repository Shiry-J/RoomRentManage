<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/13
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <style>
        *{
            padding: 0;
            margin: 0;
        }
        body {
            background-color: #f5f5f5;
        }
        .nav1{
            margin:20px;
            display: inline-block;
            z-index:9
        }
        .nav1 ul{
            list-style:none;
            margin:0;
            padding:0;
            font-size:20px;
            z-index:9
        }
        .nav1 ul > li{
            float: left;
            position: relative;
            z-index:9
        }
        .nav1 li ul{
            padding: 10px 0;
            border:0;
            border-radius: 2px;
            outline: none;
            position: absolute;
            background: white;
            z-index:9
        }
        .nav1 ul > li div.details{
            opacity: 0;
            position: relative;
            font-size:16px;
            z-index:9
        }
        .nav1 ul > li:hover ul li{
            height: 36px;
            width:100%;
            z-index:9
        }
        .nav1 ul > li:hover div.details{
            opacity: 1;
            z-index:9
        }
        .nav1 a{
            display: block;
            padding: 10px;
            line-height: 15px;
            text-decoration: none;
            color: rgba(0,0,0,1);
            z-index:9
        }
        .nav1 li div ul li{
            overflow: hidden;
            height: 0;
            transition: height 0.2s ease-in;
            text-align: center;
            z-index:9
        }
        .nav1 li ul a{
            transition: background-color 0.1s;
            font-size: 16px;
            z-index:9
        }
        .nav1 li ul a:hover{
            background: rgba(0,0,0,0.5);
            z-index:9
        }
        .details::before {
            content: "";
            width: 0;
            height: 0;
            border-bottom: 10px solid #fff;
            border-right:8px solid transparent;
            border-left:8px solid transparent;
            position: absolute;
            top:-9px;
            left: 28px;
            z-index:10;
        }
    </style>
</head>
<body>
<nav class="nav1">
    <ul>
        <li><a href="/returnframe.html">??????</a></li>
        <li><a href="${pageContext.request.contextPath}/mycart.html">????????????</a></li>
        <li>
            <a href="${pageContext.request.contextPath}/userinfo.html">????????????</a>
            <div class="details">
                <ul>
                    <li><a>??????:${userSession.username}</a></li>
                    <li><a href="${pageContext.request.contextPath}/roommaster.html">??????</a></li>
                    <li><a href="${pageContext.request.contextPath}/cleaner.html">????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/modifypassword.html">????????????</a></li>
                    <li><a href="${pageContext.request.contextPath}/exit.html">??????</a></li>
                </ul>
            </div>
        </li>
    </ul>
</nav>
</body>
</html>
