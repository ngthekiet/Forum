<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        td {
            border: solid 1px black;
        }

        table {
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<div style="text-align: center;font-weight: bold;font-size: 30px">User mẫu</div>
<div style="display: flex; justify-content: center">
    <table>
        <thead>
        <tr style="font-weight: bold; font-size: 25px">
            <td>Username</td>
            <td>Password</td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>chuotcon</td>
            <td>chuotcon</td>
        </tr>
        <tr>
            <td>leb</td>
            <td>leb</td>
        </tr>
        <tr>
            <td>doctorQ</td>
            <td>doctorQ</td>
        </tr>
        <tr>
            <td>itss</td>
            <td>itss</td>
        </tr>
        <tr>
            <td>dt03</td>
            <td>dt03</td>
        </tr>
        <tr>
            <td>GSKH</td>
            <td>GSKH</td>
        </tr>
        </tbody>
    </table>
</div>
<div style="margin: 30px auto; text-align: center; width: 400px; border: solid 1px black">
    <h2 style="text-align: center; background-color: skyblue; margin: 0">Đăng nhập</h2>
    <form action="/doLogin" method="post">
        <div style="margin-top: 10px">
            <label>Tên đăng nhập</label>
            <input name="username" type="text">
        </div>
        <div style="margin-top: 10px">
            <label>Mật khẩu</label>
            <input name="password" type="password">
        </div>
        <div style="margin-bottom: 30px; margin-top: 10px">
            <input type="submit" value="Đăng nhập">
        </div>
    </form>
</div>
<c:if test="${not empty error}">
    <div style="color: red; text-align: center">${error}</div>
</c:if>
</body>
</html>