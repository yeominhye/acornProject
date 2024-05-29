<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Show Map</title>
</head>
<body>
<h1>Map Information</h1>
제목 : ${routeBoard.boardTitle}<br>
내용 : ${routeBoard.boardContent}<br>
테마 : ${routeBoard.boardTheme}<br>
기간 : ${routeBoard.boardTourdays}<br>
작성시간 : ${routeBoard.boardWritedate}<br>
포인트 : ${routeBoard.boardPoint}<br>
타입 : ${routeBoard.boardType}<br>
지역 : ${routeBoard.boardRegion}<br>

<c:forEach items="${routeBoard.days}" var="day">
    <h2>Day ${day.day}: ${day.dayInfo}</h2>
    <ul>
        <c:forEach items="${day.markers}" var="marker">
            <li>Latitude: ${marker.latitude}, Longitude: ${marker.longitude}, explain: ${marker.markerExplain}</li>
        </c:forEach>
    </ul>
</c:forEach>

</body>
</html>