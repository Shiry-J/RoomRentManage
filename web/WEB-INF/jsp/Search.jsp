<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.List" %>
<%@ page import="cn.RoomManagement.pojo.Room" %>
<%@ page import="cn.RoomManagement.dao.room.RoomMapper" %>
<%@ page import="cn.RoomManagement.tools.Constants" %><%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/2
  Time: 23:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/statics/css/search.css">
    <title>首页 - 民宿短租管理系统</title>
    <style>
        ul, ol {
            list-style: none;
        }

        input, button {
            outline: none;
            border: none;
        }

        a {
            text-decoration: none;
        }

        .product li {
            float: left;
            width: 234px;
            height: 246px;
            padding: 34px 0 20px;
            margin-left: 14px;
            margin-bottom: 14px;
            background: #fff;
            -webkit-transition: all .2s linear;
            transition: all .2s linear;
            position: relative;
            top:20%;
            z-index:1;
        }

        .pro-img {
            width: 150px;
            height: 150px;
            margin: 0 auto 18px;
            z-index:1;
        }

        .pro-img a {
            width: 100%;
            height: 100%;
            z-index:1;
        }

        .pro-img img {
            display: block;
            width: 100%;
            height: 100%;
            z-index:1;
        }

        .product li h3 {
            margin: 0 10px;
            font-size: 14px;
            font-weight: 400;
            text-align: center;
            z-index:1;
        }

        .product li h3 a {
            color: #333;
            z-index:1;
        }

        .desc {
            margin: 0 10px 10px;
            height: 18px;
            font-size: 12px;
            text-align: center;
            text-overflow: ellipsis;
            white-space: nowrap;
            overflow: hidden;
            color: #b0b0b0;
            z-index:1;
        }

        .price {
            font-size: 14px;
            margin: 0 10px 10px;
            text-align: center;
            color: #ff6700;
            z-index:1;
        }

        .price del {
            color: #b0b0b0;
            z-index:1;
        }

        .review {
            position: absolute;
            bottom: 0;
            left: 0;
            z-index: 3;
            width: 234px;
            height: 0;
            overflow: hidden;
            font-size: 12px;
            background: #ff6700;
            opacity: 0;
            -webkit-transition: all .2s linear;
            transition: all .2s linear;
        }

        .review a {
            color: #757575;
            display: block;
            padding: 8px 30px;
            outline: 0;
            z-index:1;
        }

        .review a span {
            display: block;
            margin-bottom: 5px;
            color: #fff;
            text-align: center;
            z-index:1;
        }

        .product li:hover {
            -webkit-box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            -webkit-transform: translate3d(0, -2px, 0);
            transform: translate3d(0, -2px, 0);
            z-index:1;
        }

        .product li:hover .review {
            opacity: 1;
            height: 76px;
            z-index:1;
        }
        /*搜索栏*/
        .sea-container {
            width: 450px;
            height: 30px;
            background-color: green;
            margin: 100px auto;
            border: 1px solid #317EF3;
        }
        .blue-input {
            float: left;
            width: 350px;
            height: 30px;
            padding: 0 10px;
            box-sizing: border-box;
        }
        .blue-button {
            width: 100px;
            height: 30px;
            background-color: #317EF3;
            color: white;
            font-size: 15px;
        }
    </style>
</head>
<body>

<%@include file="before_jsp/head.jsp"%>

<div id="container" class="center-justify">
    <div class="sea-container">
        <form action="/do_search.html">
            <input type="text" name="search" id="search" class="blue-input">
            <input type="submit" value="搜索" class="blue-button">
        </form>
    </div>
</div>

<c:forEach items="${likeroominfoSession}" var="room">
    <div class="product">
        <ul>
            <li>
                <div class="pro-img">
                    <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                        <img src="${room.roomimage}" alt="">
                    </a>
                </div>
                <h3><a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">${room.roomname}</a></h3>
                <p class="desc">${room.roomaddress}</p>
                <p class="price">
                    <span>${room.roomprice}</span>元
                </p>
                <div class="review">
                    <a href="${pageContext.request.contextPath}/roominfo.html?id=${room.id}">
                        <span class="msg">查看详情</span>
                    </a>
                </div>
            </li>
        </ul>
    </div>
</c:forEach>
</body>
</html>
