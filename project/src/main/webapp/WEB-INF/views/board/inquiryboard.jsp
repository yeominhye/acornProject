<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../nav-sub.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/reset.css" >
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/inquiryBoard.css" >
</head>

<body>
    <div class="wrap">
        <div class="container">

            <h1 class="notice">내 문의내역</h1>
            <p class="notice-detail">작성하신 문의 내역을 확인하세요. <br>문의 답변은 1~2일 소요됩니다.</p>
            <div class="table-container">
            
                <table class="inner-table">
                    <thead>
                        <tr class="table-top">
                          <th class="table-number">번호</th>
                          <th>제목</th>
                          <th>작성일자</th>
                          <th class="table-status">진행상황</th>
                        </tr>
                      </thead>

                      <tbody>
                      <% int index =0; %>
                      <c:forEach var="myinquiry" items="${BoardList}">
                       <%index++; %>
                        <tr>
                          <td class="table-number"><%=index%></td>
                          <td class="table-title"><a href="inquiry/detail${myinquiry.boardCode}">${myinquiry.boardTitle}</a></td>
                          <td>2024.05.13</td>
                          <td class="table-status">답변대기</td>
                        </tr>
                     </c:forEach>
                      </tbody>
                </table>
                <button onclick="location.href='/project/board/inquiry'" class="btn-write">문의하기</button>
            </div>
            

        </div>
        </div>

        <footer>
            
        </footer>
</body>



</html>