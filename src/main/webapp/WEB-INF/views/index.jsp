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
        .btn {
            text-decoration: none;
            border: solid 1px darkgrey;
            background-color: darkgrey;
            color: black;
            border-radius: 5px;
        }

        .btn:hover {
            cursor: pointer;
            background-color: azure;
        }

        a {
            font-weight: bold;
            font-size: 25px;
        }
    </style>
</head>
<body>
<div style="display: flex; justify-content: center; margin-top: 50px">
    <div>
        <h1>
            Welcome to forum!!!
        </h1>
        <div style="text-align: center">
            <c:if test="${empty sessionScope.user}">
                <a class="btn" href="/toLogin">Login</a>
            </c:if>
        </div>
        <div style="text-align: center">
            <c:if test="${not empty sessionScope.user}">
                <a class="btn" href="/listTopics">Diễn đàn</a>
            </c:if>
        </div>
    </div>
</div>
</body>
</html>
