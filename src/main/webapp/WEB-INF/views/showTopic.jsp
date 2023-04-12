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
        td {
            border: 1px solid black;
        }

        table {
            width: 1200px;
            margin: 0 auto;
            border-collapse: collapse;
            text-align: center;
        }

        .darkgrey {
            background-color: darkgrey;
        }

        .darkgreen {
            background-color: darkseagreen;
        }

        .skyblue {
            background-color: skyblue;
        }
    </style>
</head>
<body style="width: 1200px; margin: 0 auto">
<div style="text-align: right; margin-top: 20px">Chào <span style="font-weight: bold"><c:out
        value="${sessionScope.user.username}"/></span> |<a style="color: blue" href="/logout"> Thoát</a></div>
<div>
    <div style="margin-bottom: 30px">
        <div style="font-weight: bold; font-size: 200%">Chủ đề: ${topic.title}</div>
        <div>
            <c:if test="${not empty topic.messages}">
                <span>
                Bài mới nhất gửi <fmt:formatDate value="${topic.newMessage.createdTime.time}"
                                                 pattern="dd-MM-yyyy HH:mm"/>
            </span>
                <span>
                , do <span style="font-weight: bold">${topic.newMessage.creator.username}</span> gửi.
            </span>
                <span>
                        ${topic.sizeMessage} hồi âm.
                </span>
            </c:if>
            <c:if test="${empty topic.messages}">
                <div>Chưa có hoạt động mới</div>
            </c:if>
        </div>
    </div>
    <table>
        <thead>
        <tr class="darkgrey">
            <td colspan="2"><fmt:formatDate value="${topic.createdTime.time}" pattern="dd-MM-yyyy HH:mm"/></td>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td style="width: 200px" class="darkgreen">
                <span style="font-weight: bold; font-size: 130%">${topic.creator.username}</span>
                <br>
                <fmt:formatDate value="${topic.creator.joinDate}" pattern="dd-MM-yyyy HH:mm"/>
            </td>
            <td>
                <div class="skyblue" style="display: flex">
                        <span style="width: 80%">
                            ${topic.title}
                        </span>
                    <span style="width: 20%">
                        <a style="color: blue" href="/showReplay/${topic.id}">Trả lời</a>
                        </span>
                </div>
                <div>
                    ${topic.content}
                </div>
            </td>
        </tr>
        </tbody>
        <tfoot></tfoot>
    </table>
    <c:if test="${not empty listMessage}">
        <c:forEach var="message" items="${listMessage}">
            <table style="margin-top: 20px">
                <thead>
                <tr class="darkgrey">
                    <td colspan="2">
                        <fmt:formatDate value="${message.createdTime.time}" pattern="dd-MM-yyyy HH:mm"/>
                    </td>
                </tr>
                </thead>
                <tbody>
                <tr>
                    <td style="width: 200px" class="darkgreen">
                        <span style="font-weight: bold; font-size: 130%">${message.creator.username}</span>
                        <br>
                        <fmt:formatDate value="${message.creator.joinDate}" pattern="dd-MM-yyyy HH:mm"/>
                    </td>
                    <td>
                        <div class="skyblue" style="display: flex">
                            <span style="width: 80%">${message.title}</span>
                            <span style="width: 20%"><a style="color: blue"
                                                        href="/showReplay/${topic.id}">Trả lời</a></span>
                        </div>
                        <div>
                                ${message.content}
                        </div>
                    </td>
                </tr>
                </tbody>
                <tfoot></tfoot>
            </table>
        </c:forEach>
    </c:if>
    <div style="text-align: right; margin-top: 20px">
        <a style="color: blue; font-weight: bold; font-size: 25px" href="/listTopics">Danh sách chủ đề</a>
    </div>
</div>
</body>
</html>
