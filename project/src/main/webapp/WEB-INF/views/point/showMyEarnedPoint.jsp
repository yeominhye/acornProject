<%@ page import="com.acorn.project.point.Point" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Points</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/showMypoint.css" >
</head>
<body>
<div class="pt_wrap">
    <!-- 왼쪽 네비 위-->
    <div class="pt_nav">
        <div class="pt_nav_up">
            <div class="pt_nav"></div>
            <div class="pt_nav_h2"><h2>${user.nickname}님</h2></div>
            <div class="pt_nav_pt"><span>포인트</span> <span style="color: rgba(253, 177, 177, 0.924);">${user.userPoint}</span></div>
        </div>
        <div class="pt_nav_down">
            <div class="pt_nav_char"><h1>전체내역</h1>
             <a href="#"> <p>사용내역</p> </a>
             <a href="#"> <p>획득내역</p> </a>
            </div>
            <div class="pt_nav_all"><h1>충전/환전</h1>
            <a href="/project/point/pointCharge.do"> <p>충전하기</p></a>
            <a href="/project/point/pointExchange.do""> <p>환전하기</p></a>
            </div>
        </div>
    </div>
    
    <div class="pt_content">
        <div class="pt_title">얻은 포인트 내역</div>
        <div class="pt_categori">
            <div class="pt_date1"></div>
            <div class="pt_date2"></div>
            <input class="pt_search" placeholder="    사용내역을 입력하세요"></input>
            <button class="pt_cont_btn">검색</button>
        </div>

        <table class="pt_table" border="1">
            <thead>
                <tr style="background-color: rgb(201, 201, 201); ">
                    <th>날짜</th>
                    <th>사용구분</th>
                    <th>내역</th>
                    <th>얻은 포인트</th>
                    <th>총 포인트</th>
                </tr>
            </thead>
            <tbody>
            <c:if test="${not empty pointList}">
                <c:forEach var="point" items="${pointList}">
                    <c:if test="${point.pointStatus == 1}">
                        <tr class="pt_table_info">
                            <td id="t_date"><c:out value="${point.pointDate}"/></td>
                            <td id="t_division">얻은 포인트
                            </td>
                            <td id="t_list"><c:out value="${point.boardCode}"/></td>
                            <td id="t_use_point"><c:out value="${point.pointAmount}"/></td>
                            <td id="t_left_point"><c:out value="${point.remainingPoints}"/></td>
                        </tr>
                    </c:if>
                </c:forEach>
            </c:if>
            <c:if test="${empty pointList}">
                <tr>
                    <td colspan="5">No points found.</td>
                </tr>
            </c:if>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="5"><span style="margin-left: 42px;">합계</span> <span style="float: right; color:red; margin-right: 20px;">${user.userPoint}</span></td>
                </tr>
            </tfoot>
        </table>
    </div>
</div>
</body>
</html>
