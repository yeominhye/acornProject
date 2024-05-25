<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<title>Insert title here</title> 
</head>
<body>
</P>
${result}
<c:if test="${empty name}">
    <a href="member/login.do">로그인</a>
    <a href="member/register.do">회원가입</a>
</c:if>
<c:if test="${not empty name}">
    <a href="/project/member/logout.do">로그아웃</a>
    <a href="/project/member/mypage.do">마이페이지</a>
    ${name}님
</c:if>


  
</body>
</html>
