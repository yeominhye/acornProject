<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Found User ID</title>
</head>
<body>
    <h1>내 아이디</h1>
    <% String foundMyId = (String) session.getAttribute("foundMyId"); %>
    <% if (foundMyId != null) { %>
        <p>당신의 아이디는 <%= foundMyId %> 입니다.</p>
        <a href="login.do">로그인</a>
    <% } else { %>
        <p>사용자 아이디를 찾을 수 없습니다.</p>
    <% } %>
</body>
</html>
