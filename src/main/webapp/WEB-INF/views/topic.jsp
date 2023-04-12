<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
            background-color: limegreen;
            color: black;
            border-radius: 5px;
            font-weight: bold;
            padding: 8px;
        }

        .btn:hover {
            cursor: pointer;
            background-color: gray;
        }

        .blackBorder {
            border: 1px solid black;
        }

        .textLeft {
            text-align: left;
            text-indent: 20px;
        }
    </style>
</head>
<body>
<div style="text-align: right; margin-top: 20px">Chào <span style="font-weight: bold"><c:out
        value="${sessionScope.user.username}"/></span> |<a style="color: blue" href="/logout"> Thoát</a></div>
<h1>Diễn đàn: Chuyện học phí và các chính sách hỗ trợ học tập</h1>
<c:if test="${not empty sessionScope.user}">
    <a class="btn" href="/showNewTopic">Gửi bài mới</a>
</c:if>
<table style="width: 1200px; margin-top: 20px">
    <thead>
    <tr style="font-weight: bold; font-size: 25px; background-color: cadetblue">
        <td class="blackBorder">
            Chủ đề
        </td>
        <td class="blackBorder">
            Hồi âm
        </td>
    </tr>
    </thead>
    <tbody>
    <c:if test="${not empty topics}">
        <c:forEach var="topic" items="${topics}">
            <tr>
                <td class="blackBorder textLeft">
                    <a style="color: blue; font-weight: bold" href="/showTopic/${topic.id}">${topic.title}</a>
                    <div style="margin: 8px 0">
                        <c:if test="${not empty topic.messages}">
                            <span>
                                Bài mới nhất by
                                <a style="color: blue" href="#">${topic.newMessage.creator.username}
                                </a>
                            </span>
                            <span>
                                , <fmt:formatDate value="${topic.createdTime.time}" pattern="dd-MM-yyyy HH:mm"/>
                            </span>
                        </c:if>
                        <c:if test="${empty topic.messages}">
                            <span>
                                <fmt:formatDate value="${topic.createdTime.time}" pattern="dd-MM-yyyy HH:mm"/>
                            </span>
                        </c:if>
                    </div>
                </td>
                <td class="blackBorder">
                        ${topic.sizeMessage}
                </td>
            </tr>
        </c:forEach>
    </c:if>
    </tbody>
    <tfoot>

    </tfoot>
</table>
</body>
</html>