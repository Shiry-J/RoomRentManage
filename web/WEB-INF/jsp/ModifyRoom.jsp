<%--
  Created by IntelliJ IDEA.
  User: hp
  Date: 2021/6/12
  Time: 22:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改房间 - 民宿短租管理系统</title>
</head>
<body>
<form action="/do_modifyroom.html?id=${roominfoSession.id}" method="post" align="center" enctype="multipart/form-data" name="modifyroom" id="modifyroom">
    <h1 align="center">修改房间</h1>
    <table align="center">
        <tr>
            <td>归属人:</td>
            <td>${userSession.username}</td>
        </tr>
        <tr>
            <td>id:</td>
            <td>${roominfoSession.id}</td>
        </tr>
        <tr>
            <td>名称:</td>
            <td>
                <input type="text" name="roomname" id="roomname" style="width:193px;" placeholder="请输入名称"
                       value="${roominfoSession.roomname}" onblur="cheackroomname()">
            </td>
        </tr>
        <tr>
            <td>描述:</td>
            <td>
                <input type="text" name="roomdescription" id="roomdescription" value="${roominfoSession.roomdescription}"
                       style="width:193px;height: 400px" placeholder="请输入房间描述" onblur="cheackroomdescription()">
            </td>
        </tr>
        <tr>
            <td>地址:</td>
            <td>
                <input type="text" name="roomaddress" id="roomaddress" value="${roominfoSession.roomaddress}"
                       style="width:193px;" placeholder="请输入房间地址" onblur="cheackroomaddress()">
            </td>
        </tr>
        <tr>
            <td>价格:</td>
            <td>
                <input type="number" name="roomprice" id="roomprice" value="${roominfoSession.roomprice}"
                       style="width:193px;" placeholder="请输入价格" onblur="cheackroomprice()">
            </td>
        </tr>
        <tr>
            <td>图片:</td>
            <td><input type="file" name="roomimage" id="roomimage"></td>
        </tr>
        <tr><td> </td><td id="preview"></td></tr>
        <tr>
            <td><button type="reset">重置</button></td>
            <td><button type="submit">保存</button></td>
        </tr>
    </table>
</form>
</body>
<script>
    var preview = document.getElementById("preview")
    var file = document.getElementById("roomimage");
    var img = document.createElement("img");
    file.onchange = function () {
        var fileReader = new FileReader();
        fileReader.readAsDataURL(this.files[0]);
        fileReader.onload = function () {
            img.src = fileReader.result;
            img.style.width="170px";
            img.style.height="170px";
            preview.append(img);
        }
    }
</script>
<script type="text/javascript">
    function cheackroomname() {
        var roomname = addroom.roomname.value();
        if (roomname=="" || roomname==null){
            alert("房间名称不能为空")
        }
    }
    function cheackroomdescription() {
        var roomdescription= addroom.roomimage.value();
        if (roomdescription=="" || roomdescription==null){
            alert("房间描述不能为空")
        }
    }
    function cheackroomaddress() {
        var roomaddress= addroom.roomaddress.value();
        if (roomaddress=="" || roomaddress==null){
            alert("房间地址不能为空")
        }
    }
    function cheackroomprice() {
        var roomprice= addroom.roomprice.value();
        if (roomprice=="" || roomprice==null){
            alert("房间价格不能为空")
        }
    }
</script>
</html>
