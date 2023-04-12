<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <style>
        body {
            width: 1200px;
            margin: 0 auto;
        }

        table {
            margin: 0 auto;
            border-collapse: collapse;
            text-align: center;
        }

        .btn {
            text-decoration: none;
            background-color: gray;
            color: black;
            border-radius: 5px;
            font-weight: bold;
            padding: 8px;
        }

        .btn:hover {
            cursor: pointer;
            background-color: red;
        }

        button{
            padding: 9px 16px;
            font-weight: bold;
            background-color: gray;
            border-radius: 5px;
            border: none;
        }
        button:hover{
            cursor: pointer;
            background-color: limegreen;
        }
    </style>
</head>
<body style="width: 1200px; margin: 0 auto">
<div style="text-align: right; margin-top: 20px">Chào <span style="font-weight: bold"><c:out
        value="${sessionScope.user.username}"/></span> |<a style="color: blue"
                                                           href="/logout"> Thoát</a></div>
<div style="display: flex; justify-content: center">
    <form:form action="/newTopic" modelAttribute="topic" method="post">
        <div>
            <form:label cssStyle="font-weight: bold" path="title">Tiêu đề</form:label>
            <br>
            <form:input cssStyle="width: 500px" path="title"/>
        </div>
        <div style="margin-top: 20px">
            <form:label cssStyle="font-weight: bold" path="content">Nội dung</form:label>
            <br>
            <form:textarea cssStyle="width: 500px;height: 100px" path="content"/>
        </div>
        <div style="margin-top: 20px; text-align: center">
            <form:button>Gửi</form:button>
            <a class="btn" href="/listTopics">Hủy bỏ</a>
        </div>
    </form:form>
</div>
</body>
</html>
