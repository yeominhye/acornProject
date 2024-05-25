<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/***************
****** nav *****
****************/
nav {
    width: 100%;
    height: 75px;
}
.nav-container {
    position: relative;
    width: 95%;
    height: 100%;
    margin: 0 auto;
    padding-top: 12.5px;

    display: flex;
    justify-content: space-between;
}
.nav-icon {
    width: 150px;
    height: 50px;
}
.nav-menu ul {
    display: flex;
}
.nav-menu ul li {
    padding: 0 2vw;
}
.nav-menu ul li a {
    font-size: 80%;
    font-weight: bold;
}
.nav-proflie-text {
    width: 150px;
    height: 50px;
    text-align: center;   
}
.nav-proflie-text a {
    font-size: 70%;
    margin: 0px 10px;
}
.nav-menu ul li, .nav-proflie-text{
    line-height: 50px;
}
</style>
</head>
<body>
   <!-- nav -->
   <nav>
       <div class="nav-container">
           <div class="nav-icon">
              <a href="/project/">
                  <img src="https://via.placeholder.com/150x50.jpg" alt="logo-icon">  
               </a>
           </div>
           <div class="nav-menu">
                    <ul>
                        <li><a href="/project/event/tour">관광지</a></li>
                        <li><a href="/project/event/festival">축제/행사</a></li>
                        <li><a href="/project/board/route">경로게시판</a></li>
                        <li><a href="/project/board/free?type=-1">자유게시판</a></li>
                        <li><a href="/project/board/faq">고객센터</a></li>
                    </ul>
                </div> 
           <div class="nav-proflie">
               <div class="nav-proflie-text">
                    <c:if test="${empty user}">
                            <a href="/project/user/login.do">로그인</a>
                      <a href="/project/user/register.do">회원가입</a>
                   </c:if>
                   <c:if test="${not empty user}">
                      <a href="/project/user/logout.do">로그아웃</a>
                      <a href="/project/user/mypage.do">마이페이지</a>
                   </c:if>
                    </div>
           </div>
       </div>
   </nav>
</body>
</html>